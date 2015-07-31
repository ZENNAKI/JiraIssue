define("jira/setup/setup-finishing-summary-view", [
    "jquery",
    "backbone",
    "underscore"
], function($, Backbone, _){

    return Backbone.Marionette.ItemView.extend({
        template: JIRA.Templates.Setup.Finishing.summaryView,

        ui: {
            annotation: ".jira-setup-finishing-annotation",
            summary: ".jira-setup-finishing-summary",
            submitButton: "#jira-setup-finishing-submit"
        },

        templateHelpers: {
            productName: AJS.Meta.get("setup-product-name"),
            redirectUrl: null
        },

        initialize: function(options){
            this.templateHelpers.redirectUrl = options.redirectUrl;
        },

        onShow: function() {
            this.ui.submitButton.focus();
        }
    });
});