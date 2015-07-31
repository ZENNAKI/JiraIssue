define("jira/setup/setup-account-layout", [
    "jquery",
    "backbone",
    "underscore",
    "jira/setup/setup-mac-util",
    "jira/setup/setup-abstract-view",
    "jira/setup/setup-account-basic-view",
    "jira/setup/setup-account-login-view",
    "jira/setup/setup-account-registration-view",
    "jira/setup/setup-account-summary-view",
    "jira/setup/setup-tracker"
], function($, Backbone, _, MACUtil, AbstractView, BasicView, LoginView, RegistrationView, SummaryView, setupTracker){

    return AbstractView.extend({
        regions: {
            contents: ".jira-setup-account-contents"
        },

        ui: {
            "annotationsLicenses": ".jira-setup-account-annotations-licenses",
            "annotationsParagraph": ".jira-setup-account-annotations-paragraph",
            "annotationsSummary": ".jira-setup-account-annotations-summary",
            "bottomSpinner": ".jira-setup-account-spinner-generating2",
            "bundleLicenseHidden": "#jira-setup-account-bundle-license-hidden",
            "buttonsArea": ".jira-setup-account-buttons",
            "contents": ".jira-setup-account-contents",
            "description": ".jira-setup-account-description",
            "retryButton": "#jira-setup-account-button-retry",
            "skipButton": "#jira-setup-account-button-skip",
            "nextButton": "#jira-setup-account-button-submit",
            "emailHidden": "#jira-setup-account-email-hidden",
            "licenseHidden": "#jira-setup-account-license-hidden",
            "passwordHidden": "#jira-setup-account-password-hidden"
        },

        events: {
            "click @ui.retryButton": "onRetryButtonClick",
            "click @ui.skipButton": "onSkipButtonClick",
            "click @ui.nextButton": "onNextButtonClick"
        },

        initialize: function(){
            this.macUtil = new MACUtil();
            this._initializeRegions();

            this.errorTexts = this.ui.contents.data("error-texts");

            var basicView = new BasicView({
                errorTexts: this.errorTexts,
                macUtil: this.macUtil
            });
            this.contents.attachView(basicView);

            this.contents.on("show", _.bind(this.bindViewEventHandlers, this));
            this.contents.on("close", _.bind(this.unbindViewEventHandlers, this));
            this.bindViewEventHandlers(basicView);

            basicView.ui.email.focus();
            setupTracker.sendChosenBundleInformationEvent();
        },

        onSubmit: function(){
            var userData = this.macUtil.getUserData();
            var bundleLicense = this.macUtil.getBundleLicense();
            var jiraLicense = this.macUtil.getJiraLicense();

            this.ui.bundleLicenseHidden.val(bundleLicense);
            this.ui.emailHidden.val(userData.email);
            this.ui.licenseHidden.val(jiraLicense);
            this.ui.passwordHidden.val(userData.password);

            this.ui.nextButton.enable(false);
        },

        onRetryButtonClick: function(e){
            e.preventDefault();

            this.contents.currentView.hideMessages();
            this.ui.bottomSpinner.removeClass("hidden");
            this.enableAllButtons(false);

            this.macUtil.loginUser(this.macUtil.getUserData())
                .fail(_.bind(function(response) {

                    var errorText;
                    if (response.error) {
                        errorText = this.macUtil.transformAIDErrorMessage(response.error);
                    } else {
                        errorText = JIRA.Templates.Setup.genericLoginError();
                    }

                    var options = {
                        showSummaryWithBundleProblem: this.macUtil.isBundleChosen(),
                        hasLoginProblem: true,
                        loginProblemText: errorText,
                        hasJiraLicenseProblem: !this.macUtil.getJiraLicense(),
                        hasBundleLicenseProblem: this.macUtil.isBundleChosen() && !this.macUtil.getBundleLicense()
                    };

                    this.showSummary(options);
                    this.ui.bottomSpinner.addClass("hidden");
                    if (this.macUtil.isBundleChosen()) {
                        this.updateButtons("retry", "skip");
                    } else {
                        this.updateButtons("retry");
                    }
                    this.enableAllButtons(true);
                }, this))
                .done(_.bind(function () {
                    this.onLicenseGenerationRequested();
                }, this));
        },

        onSkipButtonClick: function(e){
            e.preventDefault();

            this.showSummary({
                showSummaryWithBundleProblem: true
            });
            this.updateButtons("next");
            this.enableAllButtons(true);
            this.ui.nextButton.focus();
        },

        onNextButtonClick: function(e){
            e.preventDefault();

            this.ui.form.submit();
        },

        bindViewEventHandlers: function(view){
            this.listenTo(view, "account-doesnt-exist", this.onAccountDoesntExist);
            this.listenTo(view, "account-exists", this.onAccountExists);
            this.listenTo(view, "license-generation-requested", this.onLicenseGenerationRequested);
            this.listenTo(view, "login-form-requested", this.onLoginFormRequested);
            this.listenTo(view, "registration-form-requested", this.onRegistrationFormRequested);
        },

        unbindViewEventHandlers: function(view){
            this.stopListening(view);
        },

        generateLicenses: function(){
            var deferred = $.Deferred();

            this.macUtil.generateEvaluationLicense()
                .fail(_.bind(function(){
                    deferred.reject("product");
                }, this))
                .done(_.bind(function(){
                    if (!this.macUtil.isBundleChosen()){
                        deferred.resolve();
                    } else {
                        this.macUtil.generateBundleEvaluationLicense()
                            .fail(_.bind(function(){
                                deferred.reject("bundle");
                            }, this))
                            .done(_.bind(function(){
                                deferred.resolve();
                            }, this));
                    }
                }, this));

            return deferred.promise();
        },

        showSummary: function(options){
            var options = _.extend(options || {}, {
                isNewAccount: this._lastFormType === "registration",
                macUtil: this.macUtil
            });

            this.ui.description.addClass("hidden");
            this.contents.show(new SummaryView(options));

            this.ui.annotationsParagraph.addClass("hidden");
            this.ui.annotationsLicenses.addClass("hidden");
            this.ui.buttonsArea.removeClass("hidden");
            
            if(options.hasJiraLicenseProblem || options.hasBundleLicenseProblem) {
                this.ui.annotationsSummary.addClass("hidden");
            } else {
                this.ui.annotationsSummary.removeClass("hidden");
            }
        },

        updateButtons: function(){
            this.ui.retryButton.addClass("hidden");
            this.ui.skipButton.addClass("hidden");
            this.ui.nextButton.addClass("hidden");

            _.each(arguments, _.bind(function(button){
                this.ui[button + "Button"].removeClass("hidden");
            }, this));
        },

        enableButton: function($button, enable){
            var enable = enable === undefined ? true : enable;

            $button.prop("disabled", !enable);
            $button.attr("aria-disabled", ""+!enable);
        },

        enableAllButtons: function(enable){
            var enable = enable === undefined ? true : enable;

            this.enableButton(this.ui.retryButton, enable);
            this.enableButton(this.ui.skipButton, enable);
            this.enableButton(this.ui.nextButton, enable);
        },

        onAccountDoesntExist: function(data){
            var registrationView = new RegistrationView({
                email: data.email,
                errorTexts: this.errorTexts,
                macUtil: this.macUtil
            });

            this.contents.show(registrationView);
        },

        onAccountExists: function(data){
            var loginView = new LoginView({
                email: data.email,
                errorTexts: this.errorTexts,
                macUtil: this.macUtil
            });

            this.contents.show(loginView);
        },

        onLicenseGenerationRequested: function(formType){
            if (formType){
                this._lastFormType = formType;
            }

            this.generateLicenses()
                .fail(_.bind(function(licenseType){
                    var key = licenseType === "product" ?
                        "hasJiraLicenseProblem" : "hasBundleLicenseProblem";
                    var options = {};
                    options[key] = true;

                    this.showSummary(options);

                    if (licenseType === "product"){
                        this.updateButtons("retry");
                    } else if (licenseType === "bundle"){
                        this.updateButtons("retry", "skip");
                    }

                    this.ui.bottomSpinner.addClass("hidden");
                    this.enableAllButtons(true);
                }, this))
                .done(_.bind(function(){
                    this.showSummary();

                    this.updateButtons("next");
                    this.ui.bottomSpinner.addClass("hidden");
                    this.enableAllButtons(true);
                    this.ui.nextButton.focus();
                }, this));
        },

        onLoginFormRequested: function(data){
            var view = new LoginView(_.extend(data, {
                errorTexts: this.errorTexts,
                macUtil: this.macUtil
            }));

            this.contents.show(view);
        },

        onRegistrationFormRequested: function(data){
            var view = new RegistrationView(_.extend(data, {
                errorTexts: this.errorTexts,
                macUtil: this.macUtil
            }));

            this.contents.show(view);
        }
    });
});
