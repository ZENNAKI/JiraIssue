define("jira/setup/setup-tracker", ["jquery", "underscore"], function($, _){

    var iframeUrl = AJS.Meta.get('setup-analytics-iframe-url');

    function dataToUrl(data) {
        var queryStringParameters = [];
        for (var key in data) {
            queryStringParameters.push(key + "=" + encodeURIComponent(data[key]));
        }
        if (queryStringParameters.length) {
            return "?" + queryStringParameters.join("&");
        } else {
            return "";
        }
    }

    function insertIframe(paramsString){
        var deferred = $.Deferred();

        if(!_.isEmpty(iframeUrl)) {
            var $iframe = $("<iframe>")
                .css("display", "none")
                .attr("src", iframeUrl + paramsString);

            $iframe.load(function () {
                deferred.resolve();
            });
            $iframe.appendTo("body");

            setTimeout(function () {
                deferred.reject();
            }, 3000);
        } else {
            deferred.reject();
        }

        return deferred.promise();
    }

    /**
     * The id from metadata takes always precedence over local storage,
     * which is used only as a fallback for action which does not inherit
     * from AbstractSetupAction (VerifySMTPServerConnection)
     *
     * @returns id of current setup session
     */
    function getSetupSessionId(){
        var id = AJS.Meta.get("setup-session-id");
        var key = "jira.setup.session.id";

        if (id){
            localStorage.setItem(key, id);
        } else {
            id = localStorage.getItem(key);
        }

        return id;
    }

    function getDefaultParams(){
        return {
            "releasedInstantSetup": "true",
            "instantSetup": AJS.Meta.get("instant-setup"),
            "pg": window.location.pathname.replace(/\//g,"_"),
            "product": "jira",
            "SEN": AJS.Meta.get("SEN"),
            "setupSessionId": getSetupSessionId(),
            "sid": AJS.Meta.get("server-id"),
            "v": AJS.Meta.get("version-number")
        };
    }

    function insert(){
        return insertIframe(dataToUrl(getDefaultParams()));
    }

    function sendMailConfigurationEvent(params){
        var params = params || {};
        var extParams = $.extend(getDefaultParams(), params);

        return insertIframe(dataToUrl(extParams));
    }

    function sendInstantSetupCompletedEvent(params){
        var params = params || {};
        var extParams = $.extend(getDefaultParams(), params, {
            "instantSetupCompleted": "true"
        });

        return insertIframe(dataToUrl(extParams));
    }

    function sendChosenBundleInformationEvent(){
        var extParams = $.extend(getDefaultParams(), {
            "bundle": AJS.Meta.get("setup-chosen-bundle")
        });

        return insertIframe(dataToUrl(extParams));
    }

    function sendUserCreatedEvent(){
        var extParams = $.extend(getDefaultParams(), {
            "instantSetupAIDUserCreated": "true"
        });

        return insertIframe(dataToUrl(extParams));
    }

    function sendUserLoggedInEvent(){
        var extParams = $.extend(getDefaultParams(), {
            "instantSetupAIDUserLogged": "true"
        });

        return insertIframe(dataToUrl(extParams));
    }

    return {
        insert: insert,
        sendChosenBundleInformationEvent: sendChosenBundleInformationEvent,
        sendInstantSetupCompletedEvent: sendInstantSetupCompletedEvent,
        sendMailConfigurationEvent: sendMailConfigurationEvent,
        sendUserCreatedEvent: sendUserCreatedEvent,
        sendUserLoggedInEvent: sendUserLoggedInEvent
    };
});