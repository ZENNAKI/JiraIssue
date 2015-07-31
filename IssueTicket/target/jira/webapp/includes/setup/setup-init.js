require([
    "jquery",
    "jira/setup/setup-product-bundle-view",
    "jira/setup/setup-mode-view",
    "jira/setup/setup-account-layout",
    "jira/setup/setup-finishing-layout",
    "jira/setup/setup-database-view",
    "jira/setup/setup-license"
], function(
    $,
    SetupProductBundleView,
    SetupModeView,
    SetupAccountLayout,
    SetupFinishingLayout,
    SetupDatabaseView,
    SetupLicense)
{
    $(function(){
        var views = {
            "jira-setup-product-bundle-page": SetupProductBundleView,
            "jira-setup-mode-page": SetupModeView,
            "jira-setup-account-page": SetupAccountLayout,
            "jira-setup-finishing-page": SetupFinishingLayout,
            "jira-setup-database-page": SetupDatabaseView
        };

        $.each(views, function(classname, ViewClass){
            if ($("body").hasClass(classname)){
                new ViewClass({
                    el: "." + classname
                });
            }
        });

        // there's really no view for SetupLicense page yet, but it had to become an AMD module
        // so that it's possible to write tests for it
        if ($("body").hasClass("jira-setup-license-page")){
            SetupLicense.startPage();
        }
    });
});
