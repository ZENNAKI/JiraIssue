define("jira/setup/setup-account-basic-view", [
    "jquery",
    "backbone",
    "underscore",
    "jira/setup/setup-account-abstract-view"
], function ($, Backbone, _, AccountAbstractView) {

    return AccountAbstractView.extend({
        el: ".jira-setup-account-form-basic",
        formType: "basic",
        template: JIRA.Templates.Setup.Account.basicForm,

        events: {
            "input @ui.email": "onEmailInput"
        },

        _checkFailedAttempts: 0,

        ViewStateHandler: AccountAbstractView.prototype.ViewStateHandler.extend({
            awaitUserData: function () {
                AccountAbstractView.prototype.ViewStateHandler.prototype.awaitUserData.apply(this);

                this.view.ui.accountSpinner.addClass("hidden");
            },
            awaitSubmitResult: function () {
                AccountAbstractView.prototype.ViewStateHandler.prototype.awaitSubmitResult.apply(this);

                this.view.ui.email.focus();
                this.view.ui.accountSpinner.removeClass("hidden");
            }
        }),

        initialize: function (options) {
            this.macUtil = options.macUtil;

            this.bindUIElements();
            this.ui.submitButton.enable(false);
        },

        onEmailBlur: function (e) {
        },

        onEmailInput: function (e) {
            var val = $(e.target).val();

            this.ui.submitButton.enable(val.length > 0);
        },

        doSubmit: function () {
            var values = this.getValues();

            this.macUtil.checkIfUserExists(values.email)
                .fail(_.bind(this.handleCheckFailure, this))
                .done(_.bind(function (exists) {
                    if (exists) {
                        this.trigger("account-exists", {email: values.email});
                    } else {
                        this.trigger("account-doesnt-exist", {email: values.email});
                    }
                }, this));
        },

        handleCheckFailure: function () {
            this.validationStateMachine.submitFailure();
            this._checkFailedAttempts++;

            this.templateHelpers.checkAccountWarning = true;
            this.templateHelpers.checkAccountWarningError = this._checkFailedAttempts >= 3;

            this.render();
        }
    });
});