;define("jira/license-banner", ["jquery", "jira/flag", "aui/banner"], function($, flag, banner) {
    "use strict";

    var rest = function (resource, trace) {
        return $.ajax({
            type: "POST",
            url: contextPath + "/rest/internal/1.0/licensebanner/" + resource,
            contentType: "application/json"
        }).always(function () {
            JIRA.trace(trace);
        });
    };

    var slideUpAndRemove = function ($el) {
        $el.slideUp(function () {
            $el.remove();
        });
    };

    function showLicenseFlag (content) {
        if (content && content.length) {
            var licenseFlag = flag.showWarningMsg(null, content);
            if (licenseFlag) {
                var $licenseFlag = $(licenseFlag);

                var remindLater = function () {
                    rest("remindlater", "license-later-done");
                };

                $licenseFlag.on('aui-flag-close', remindLater);

                $("#license-flag-later").click(function (e) {
                    e.preventDefault();
                    $licenseFlag[0].close();
                });

                $("#license-flag-never").click(function (e) {
                    e.preventDefault();

                    //HIROL-391: We no longer want the close to trigger a REST call as we will be doing it manually.
                    //Previously we would trigger a "remindnever" and a "remindlater" at the same time which would
                    //lead to an indeterminate state depending on the execution order of requests on the server.
                    $licenseFlag.off('aui-flag-close', remindLater);
                    $licenseFlag[0].close();

                    rest("remindnever", "license-never-done");
                });
            }
        }
        JIRA.trace("license-flag-checked");
    }

    function showLicenseBanner(content) {
        if (content && content.length) {
            var $banner = banner({body: content});

            $("#license-banner-later").click(function (e) {
                e.preventDefault();

                slideUpAndRemove($banner);
                rest("remindlater", "license-later-done");
            });

            $("#license-banner-never").click(function (e) {
                e.preventDefault();

                slideUpAndRemove($banner);
                rest("remindnever", "license-never-done");
            });
        }
        JIRA.trace("license-banner-checked");
    }

    return {
        showLicenseFlag: showLicenseFlag,
        showLicenseBanner: showLicenseBanner
    }
});
