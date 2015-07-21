define("jira/setup/setup-mode-view", [
    "jquery",
    "backbone",
    "underscore",
    "jira/setup/setup-abstract-view",
    "jira/setup/setup-language-view"
], function($, Backbone, _, AbstractView, LanguageView){

    var pageStorageKey = "jira.setup.mode.page";

    return AbstractView.extend({
        languageDialogSelector: "#jira-setup-language-dialog",
        pageStorageKey: pageStorageKey,

        ui: {
            languageDialogTrigger: ".jira-setup-language-dialog-trigger"
        },

        events: {
            "click @ui.languageDialogTrigger": "onLanguageDialogTriggerClick"
        },

        initialize: function initialize() {
            this.langDialog = AJS.dialog2(this.languageDialogSelector);
            this.languageView = new LanguageView({
                el: this.languageDialogSelector
            });

            this.listenTo(this.languageView, "cancel-requested", this.onLanguageViewCancelRequested);

            this.langDialog.on("show", _.bind(function(){
                this.languageView.showInitial();
                this.languageView.start();
            }, this));

            var choiceBoxValue = this.getPageDataKey("choiceBoxValue");
            if (choiceBoxValue){
                this.selectChoiceBox(choiceBoxValue);
            }
        },

        onSubmit: function(){
            this.ui.submitButton.enable(false);
        },

        onLanguageDialogTriggerClick: function(){
            this.openLanguageDialog();
        },

        openLanguageDialog: function(){
            if (this.langDialog){
                this.langDialog.show();
            }
        },

        onLanguageViewCancelRequested: function(){
            this.langDialog.hide();
        }
    }, { pageStorageKey: pageStorageKey });
});