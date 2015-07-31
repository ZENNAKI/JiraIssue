define("jira/setup/setup-account-summary-view", [
    "jquery",
    "backbone",
    "underscore"
], function($, Backbone, _){

    return Backbone.Marionette.ItemView.extend({
        template: JIRA.Templates.Setup.Account.summaryView,

        ui: {
            "bundleHelp": ".jira-setup-account-bundle-license-help",
            "listItems": ".jira-setup-account-summary-list-item",
            "message": ".jira-setup-account-summary-message"
        },

        initialize: function(options){
            this.macUtil = options.macUtil;
            var userData = this.macUtil.getUserData();

            this._internalData = _.extend({}, options, {
                email: userData.email,
                fullname: userData.fullname,
                productName: AJS.Meta.get("setup-product-name"),
                selectedBundleName: this.macUtil.getChosenBundleName()
            });
        },

        onRender: function(){
            this.ui.bundleHelp.tooltip({gravity: "w"});
        },

        serializeData: function(){
            return _.extend({}, this._internalData);
        },

        hideMessages: function(){
            this.ui.message.addClass("hidden");
        }
    });
});