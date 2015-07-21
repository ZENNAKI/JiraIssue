define("jira/setup/setup-account-abstract-view", [
    "jquery",
    "backbone",
    "underscore",
    "jira/state-machine"
], function ($, Backbone, _, StateMachine) {

    var ui = {
        "accountSpinner": ".jira-setup-account-spinner-checking",
        "agreement": "#jira-setup-account-field-agreement",
        "descEmailExisting": ".jira-setup-account-email-existing",
        "descEmailExistingAfterSubmit": ".jira-setup-account-email-existing-after-submit",
        "descEmailNotExisting": ".jira-setup-account-email-not-existing",
        "descEmailNotExistingAfterSubmit": ".jira-setup-account-email-not-existing-after-submit",
        "descWrapper": ".jira-setup-account-email-description",
        "email": "#jira-setup-account-field-email",
        "forgotPasswordLink": ".jira-setup-account-forgot-password-link",
        "formField": ".jira-setup-account-form-field",
        "formSwitch": ".jira-setup-account-form-switch",
        "password": "#jira-setup-account-field-password",
        "skipLink": ".jira-setup-account-skip-link",
        "spinnerGenerating": ".jira-setup-account-spinner-generating",
        "submitButton": ".jira-setup-account-form-button",

        "switchFormExistingUser": "#jira-setup-account-form-switch-existing",
        "switchFormNonExistingUser": "#jira-setup-account-form-switch-nonexisting"
    };

    var events = {
        "blur @ui.email": "onEmailBlur",
        "click @ui.formSwitch": "onFormSwitchClick",
        "click @ui.skipLink": "onSkipLinkClick",
        "click @ui.submitButton": "onSubmitClicked"
    };

    var templateHelpers = {
        agreementChecked: false,
        errors: {},
        values: {}
    };

    return Backbone.Marionette.ItemView.extend({
        _licenseFailedAttempts: {
            bundle: 0,
            product: 0
        },
        _recheckFailedAttempts: 0,
        _licenseGenerationInProgress: false,

        // when Marionette will be updated should be replace with
        // Marionette.Object
        ViewStateHandler: Backbone.Marionette.Controller.extend({
            constructor: function (accountView) {
                this.view = accountView;
                this.lastFocusedElement = null;
            },
            awaitUserData: function (postponeFocusRestore) {
                this.view.ui.accountSpinner.addClass("hidden");

                this.view.storeValuesForRender();
                this.view.render();

                this.view.ui.descWrapper.addClass("hidden");
                this.view.ui.descEmailExisting.addClass("hidden");
                this.view.ui.descEmailNotExisting.addClass("hidden");

                this.view.enableForm(true);
                if ( !postponeFocusRestore ) {
                    this.restoreFocusedElement();
                }
            },
            awaitEmailCheckResult: function () {
                this.storeFocusedElement();
                this.view._switchFormRecommended = false;
                this.view._switchFormRecommendedAfterSubmit = false;

                this.view.cleanWarnings();
                this.view.cleanErrors();
                this.view.storeValuesForRender();
                this.view.render();
                this.view.enableForm(false);

                this.view.ui.descWrapper.addClass("hidden");
                this.view.ui.descEmailExisting.addClass("hidden");
                this.view.ui.descEmailNotExisting.addClass("hidden");

                this.view.ui.forgotPasswordLink.addClass("hidden");
                this.view.ui.accountSpinner.removeClass("hidden");
            },
            awaitSubmitResult: function () {
                this.storeFocusedElement();
                this.view._switchFormRecommended = false;
                this.view._switchFormRecommendedAfterSubmit = false;

                this.view.cleanWarnings();
                this.view.cleanErrors();
                this.view.storeValuesForRender();
                this.view.render();

                this.view.enableForm(false);
            },
            awaitLicenseGeneration: function() {
                this.view.ui.spinnerGenerating.removeClass("hidden");
                this.view.enableForm(false);
            },
            storeFocusedElement: function (element) {
                if (this.lastFocusedElement == null) {
                    var focused = $(element || document.activeElement);

                    var allUiElements = _.values(this.view.ui);
                    var focusedUiElement = _.find(allUiElements, function (e) { return e.is(focused) });
                    if (!!focusedUiElement) {
                        // element can be re-created during render (keeping object doesn't work)
                        this.lastFocusedElement = "#" + focused[0].id;
                    }
                }
            },
            restoreFocusedElement: function () {
                if (this.lastFocusedElement != null) {
                    $(this.lastFocusedElement).focus();
                    this.lastFocusedElement = null;
                }
            }
        }),

        constructor: function(attributes, options){
            var initialize = this.initialize;

            this.viewStateHandler = new this.ViewStateHandler(this);
            this.ui = _.extend({}, this.ui, ui);
            this.events = _.extend({}, this.events, events);
            this.fields = _.extend({}, this.fields, {
                "agreement": {
                    "checkRequired": attributes.errorTexts.agreementRequired
                },
                "email": {
                    "invalidEmail": attributes.errorTexts.invalidEmail,
                    "required": attributes.errorTexts.emailRequired
                },
                "password": {
                    "invalidCredentials": attributes.errorTexts.invalidCredentials,
                    "required": attributes.errorTexts.passwordRequired
                }
            });

            this.templateHelpers = _.extend({}, this.templateHelpers, templateHelpers);
            this.cleanWarnings();

            if (typeof initialize === "function") {
                this.initialize = function () {
                    this._switchFormRecommended = false;
                    this._switchFormRecommendedAfterSubmit = false;

                    initialize.apply(this, arguments);
                };
            }

            this.validationStateMachine = this.createStateMachine();

            return Backbone.Marionette.ItemView.apply(this, arguments);
        },

        createStateMachine: function () {
            return StateMachine.create({
                events: [
                    // convert to Graphviz DOT:
                    //gsed -rn "s/[\t ]*\{name: '([^']+)', from: '([^']+)', to: '([^']+)'\},?/\2 -> \3 [label=\1]/ p"  \
                    //         < jira-components/jira-webapp-common/src/main/webapp/includes/setup/views/setup-account-abstract.js \
                    //         | pbcopy
                    // ----
                    // https://extranet.atlassian.com/x/DSgojg
                    {name: 'startup', from: 'none', to: 'awaitInput'},
                    {name: 'shutdown', to: 'none'},
                    {name: 'checkEmail', from: 'awaitInput', to: 'awaitEmailCheckResult'},
                    {name: 'emailCheckComplete', from: 'awaitEmailCheckResult', to: 'awaitInput'},
                    {name: 'submit', from: 'awaitInput', to: 'awaitSubmitResult'},
                    {name: 'submitFailure', from: 'awaitSubmitResult', to: 'awaitInput'},
                    {name: 'submitSuccess', from: 'awaitSubmitResult', to: 'awaitLicenseGeneration'}
                ],
                callbacks: {
                    onbeforecheckEmail: _.bind(this.canPerformEmailCheck, this),
                    onbeforesubmit: _.bind(this.canPerformSubmit, this),

                    onawaitEmailCheckResult: _.bind(function () {
                        this.viewStateHandler.awaitEmailCheckResult();
                        this.performEmailCheck();
                    }, this),
                    onawaitInput: _.bind(function () {
                        this.viewStateHandler.awaitUserData();
                    }, this),
                    onawaitSubmitResult: _.bind(function () {
                        this.viewStateHandler.awaitSubmitResult();
                        this.doSubmit();
                    }, this),
                    onawaitLicenseGeneration: _.bind(function () {
                        this.viewStateHandler.awaitLicenseGeneration();
                    }, this)
                }
            });
        },

        bindUIElements: function () {
            Marionette.View.prototype.bindUIElements.apply(this, arguments);

            if (this.validationStateMachine.can("startup")) {
                this.validationStateMachine.startup();
            }
        },

        unbindUIElements: function () {
            Marionette.View.prototype.unbindUIElements.apply(this, arguments);

            this.validationStateMachine.shutdown();
        },

        cleanWarnings: function () {
            _.extend(this.templateHelpers, {
                checkAccountWarning: null,
                checkAccountWarningError: null,
                createAccountWarning: null,
                createAccountWarningError: null,
                loginWarning: null,
                loginWarningError: null,
                recheckAccountWarning: null,
                recheckAccountWarningError: null
            });
        },

        cleanErrors: function () {
            this.templateHelpers.errors = {};
        },

        handleLicenseGeneration: function () {
            this._licenseGenerationInProgress = true;
            this.trigger("license-generation-requested", this.formType);
        },

        onSkipLinkClick: function (e) {
            e.preventDefault();

            this.trigger("bundle-license-generation-skipped");
        },

        enableForm: function (enable) {
            var enable = enable || false;

            this.ui.formField.prop("disabled", !enable);
            this.ui.submitButton.enable(enable);
        },

        onFormSwitchClick: function (e) {
            e.preventDefault();

            var values = this.getValues();

            if (this._isRegistrationForm) {
                this.trigger("login-form-requested", values);
            } else if (this._isLoginForm){
                this.trigger("registration-form-requested", values);
            }
        },

        onSubmitClicked: function (e) {
            e.preventDefault();
            if ( this.validationStateMachine.submit()==StateMachine.Result.CANCELLED ) {
                this.viewStateHandler.awaitUserData();
            }
        },

        canPerformSubmit: function () {
            var valid = this.validate();

            return valid;
        },

        onEmailBlur: function (e) {
            // deferring becaouse on Firefox and IE e.relatedTarget is always null
            // letting event flow and then looking for document.activeElement
            _.defer(_.bind(function()
            {
                var nextFocusedElement = document.activeElement;

                this.viewStateHandler.storeFocusedElement(nextFocusedElement);
                if ( this.validationStateMachine.checkEmail() == StateMachine.Result.CANCELLED ) {
                    var value = this.ui.email.val();
                    var valid = this.validate({email: value});

                    // avoid re-rendering the form if not necessary so that click event on submit button
                    // has a chance to be handled
                    if (!valid){
                        this.viewStateHandler.awaitUserData();
                    }
                }
            }, this));
        },

        canPerformEmailCheck: function () {
            var initialValue = this.ui.email.data("initial-value");
            var value = this.ui.email.val();

            var emailValid = this.validateEmailValue(value);
            var emailChanged = value !== initialValue;

            return emailChanged && emailValid;
        },

        performEmailCheck: function () {
            var value = this.ui.email.val();
            this.ui.email.data("initial-value", value);

            this.checkIfUserExists(value);
        },

        checkIfUserExists: function (email) {
            this.macUtil.checkIfUserExists(email, true)
                .fail(_.bind(this.handleRecheckFailure, this))
                .done(_.bind(function (exists) {
                    this.userExistenceConfirmed(exists);
                }, this))
                .always(_.bind(function () {
                    this.validationStateMachine.emailCheckComplete();
                }, this));
        },

        userExistenceConfirmed: function (exists) {
        },

        handleRecheckFailure: function () {
            this._recheckFailedAttempts++;

            this.templateHelpers.recheckAccountWarning = true;
            this.templateHelpers.recheckAccountWarningError = this._recheckFailedAttempts >= 3;

            this.storeValuesForRender();
            this.render();

            this.ui.email.focus();
            this.ui.email.val(this.ui.email.val());
        },

        storeValuesForRender: function () {
            var values = this.getValues();

            this.templateHelpers.agreementChecked = values.agreement;
            this.templateHelpers.values = values;
        },

        getValues: function () {
            var values = {};

            _.each(this.fields, function (fieldData, name) {
                if (this.ui[name].length) {
                    if (fieldData.checkRequired) {
                        values[name] = this.ui[name].is(":checked");
                    } else {
                        values[name] = this.ui[name].val();
                    }
                }
            }, this);

            return values;
        },

        validate: function (values) {
            var errors = {};
            values = values || this.getValues();

            _.each(this.fields, function (fieldData, name) {
                if (!(name in values)) {
                    return;
                }

                if (fieldData.required && !values[name].length) {
                    errors[name] = fieldData.required;
                } else if (fieldData.invalidEmail && !this.validateEmailValue(values[name])){
                    errors[name] = fieldData.invalidEmail;
                } else if (fieldData.checkRequired && !values[name]){
                    errors[name] = fieldData.checkRequired;
                }
            }, this);

            this.templateHelpers.errors = errors;
            this.templateHelpers.values = values;

            return _.keys(this.templateHelpers.errors).length === 0;
        },

        validateEmailValue: function (value) {
            var emailValid = this.macUtil.validateEmail(value);
            return emailValid;
        }
    });
});