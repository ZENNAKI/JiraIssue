AJS.test.require("jira.webresources:jira-setup", function() {
    var $ = require("jquery");
    var _ = require("underscore");
    var View = require("jira/setup/setup-account-registration-view");

    JIRA.Templates.Setup.Account.formSwitchExistingAccount = function(data, output){
        output.append("<span class=\"jira-setup-account-email-existing hidden\">");
        output.append("<a href=\"#\" id=\"jira-setup-account-form-switch-existing\" class=\"jira-setup-account-form-switch\">");
        output.append("</span>");

        return output.toString();
    };

    JIRA.Templates.Setup.Account.formSwitchAfterSubmitExistingAccount = function(data, output){
        output.append("<span class=\"jira-setup-account-email-existing-after-submit hidden\">");
        output.append("<a href=\"#\" id=\"jira-setup-account-form-switch-existing-after-submit\" class=\"jira-setup-account-form-switch\">");
        output.append("</span>");

        return output.toString();
    };

    var markup = JIRA.Templates.Setup.layoutContent({
        content: JIRA.Templates.Setup.Account.registrationForm({})
    });

    var INVALID_EMAIL = "this@sparta.is.";
    var VALID_EMAIL = "this@sparta.is";
    var VALID_EMAIL2 = "that@persia.is";

    var registerAuiMsgSelector = ".jira-setup-account-cannot-create-account-message";
    var recheckAccountAuiMsgSelector = ".jira-setup-account-cannot-recheck-account-message";

    module("JIRA SetupFinishing page", {
        _validEmails: [],
        setup: function(){
            this.sandbox = sinon.sandbox.create({
                useFakeTimers: true
            });

            this.macUtilMock = {
                validateEmail: _.bind(function(email){
                    if (email === INVALID_EMAIL){
                        return false;
                    } else if (email === VALID_EMAIL){
                        return true;
                    } else if (email === VALID_EMAIL2){
                        return true;
                    } else if (-1 !== this._validEmails.indexOf(email)){
                        return true;
                    } else {
                        throw "unexpected mail value: " + email;
                    }
                }, this)
            };

            $("#qunit-fixture").append(
                $("<div></div>")
                    .addClass("jira-account-registration-form")
                    .html(markup)
            );

            this.setupTracker = {};
            this.setupTracker.sendUserCreatedEvent = this.sandbox.spy();
        },

        tearDown: function(){
            this.sandbox.restore();
        },

        initializeView: function(){
            this.testObj = new View({
                macUtil: this.macUtilMock,
                errorTexts: {
                    agreementRequired: "agreementRequired",
                    invalidEmail: "invalidEmail",
                    emailRequired: 'emailRequired',
                    invalidCredentials: 'invalidCredentials',
                    passwordRequired: 'passwordRequired'
                },
                el: ".jira-account-registration-form",
                setupTracker: this.setupTracker
            });
            this.testObj.bindUIElements();
        },

        submitForm: function(){
            this.testObj.ui.submitButton.focus();
            this.sandbox.clock.tick(1);
            this.testObj.ui.submitButton.click();
        },

        flowFocusThroughEmail: function(){
            this.testObj.ui.email.focus();
            this.testObj.ui.email.blur();
            this.testObj.ui.password.focus();
            this.sandbox.clock.tick(1);
        },

        populateFieldsOverridingDefaults: function(data){
            var data = data || {};

            if (data.email !== undefined){
                this.testObj.ui.email.val(data.email);
            } else {
                this.testObj.ui.email.val(VALID_EMAIL);
            }

            if (data.password !== undefined){
                this.testObj.ui.password.val(data.password);
            } else {
                this.testObj.ui.password.val(VALID_EMAIL);
            }

            if (data.fullname !== undefined){
                this.testObj.ui.fullname.val(data.fullname);
            } else {
                this.testObj.ui.fullname.val(VALID_EMAIL);
            }

            this.testObj.ui.agreement.prop("checked", true);
        },

        populateFieldsOverridingDefaultsAndSubmitForm: function(data){
            this.populateFieldsOverridingDefaults(data);
            this.submitForm();
        },

        triggerEmailCheck: function(newEmail){
            if (!newEmail){
                newEmail = this.testObj.ui.email.val() + "m";
                this._validEmails.push(newEmail);
            }

            this.testObj.ui.email.val(newEmail);
            this.flowFocusThroughEmail();
        }
    });

    test("should add analytics event when user is created", function() {
        this.initializeView();
        this.populateFieldsOverridingDefaults();

        var e = {
            preventDefault: this.sandbox.spy()
        };
        var defer = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(defer.promise());

        this.testObj.onSubmitClicked(e);
        defer.resolve();

        sinon.assert.calledOnce(this.setupTracker.sendUserCreatedEvent, "analytics event should be raised");
    });

    test("should not send analytics event when registration form is invalid", function() {
        this.initializeView();
        this.populateFieldsOverridingDefaults();
        this.testObj.ui.agreement.prop('checked', false);

        var e = {
            preventDefault: this.sandbox.spy()
        };
        var defer = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(defer.promise());

        this.testObj.onSubmitClicked(e);
        defer.resolve();

        sinon.assert.notCalled(this.setupTracker.sendUserCreatedEvent, "analytics event should be skipped");
    });

    test("when email field is invalid form submit shouldn't call any MAC method", function(){
        // when
        this.macUtilMock.createUser = this.sandbox.stub().returns($.Deferred().promise());
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm({email: INVALID_EMAIL, password: VALID_EMAIL, fullname: VALID_EMAIL});

        //then
        sinon.assert.notCalled(this.macUtilMock.createUser);
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);

        equal($(".error", this.testObj.$el).text(), "invalidEmail", "invalid email message shown");
    });

    test("when password field is empty form submit shouldn't call any MAC method", function(){
        // when
        this.macUtilMock.createUser = this.sandbox.stub().returns($.Deferred().promise());
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm({password: ""});

        //then
        sinon.assert.notCalled(this.macUtilMock.createUser);
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);

        equal($(".error", this.testObj.$el).text(), "passwordRequired", "password required message shown");
    });

    test("when invalid email is entered blur should show error message and don't check if account exists", function(){
        // when
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        this.initializeView();
        this.triggerEmailCheck(INVALID_EMAIL);

        //then
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);
        equal($(".error", this.testObj.$el).text(), "invalidEmail", "invalid email message shown");
    });

    test("when email changed to valid should remove error message", function(){
        // when
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        this.initializeView();
        this.triggerEmailCheck(INVALID_EMAIL);

        //then
        equal($(".error", this.testObj.$el).text(), "invalidEmail", "invalid email message shown");

        // and when ...
        this.triggerEmailCheck(VALID_EMAIL);

        // then
        equal($(".error", this.testObj.$el).text(), "", "invalid email message should disappear");
    });

    test("should keep form disabled when checking email", function(){
        // when
        var mailCheckDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());

        this.initializeView();
        this.triggerEmailCheck(VALID_EMAIL);

        //then
        ok(this.testObj.ui.email.is(':disabled'), "email field is disabled");
        ok(this.testObj.ui.password.is(':disabled'), "password field is disabled");
        ok(this.testObj.ui.fullname.is(':disabled'), "fullname field is disabled");
    });

    test("should show form switch proposition for already registered email after email field blur", function(){
        // when
        var mailCheckDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());

        this.initializeView();

        this.testObj.ui.email.val(VALID_EMAIL);
        this.flowFocusThroughEmail();
        mailCheckDefer.resolve(true);

        // then
        ok(!this.testObj.ui.email.is(':disabled'), "email field should be enabled");
        ok(!this.testObj.ui.password.is(':disabled'), "password field should be enabled");
        ok(this.testObj.ui.password.is(document.activeElement), "password field should keep focus");

        ok(!this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be visible");
        ok(this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be hidden");
    });

    test("should request login form when form switch proposition link, shown after email field blur, is clicked", function(){
        // when
        var mailCheckDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());

        this.initializeView();

        this.testObj.ui.email.val(VALID_EMAIL);
        this.flowFocusThroughEmail();
        mailCheckDefer.resolve(true);

        var switchHandler = this.sandbox.spy();
        this.testObj.on("login-form-requested", switchHandler);
        this.testObj.ui.descEmailExisting.find("a").click();

        // then
        sinon.assert.calledOnce(switchHandler, "login form was requested");
    });

    test("should hide form switch proposition, shown after email field blur, when email changed to existing one", function(){
        // when
        var mailCheckDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());

        this.initializeView();

        this.testObj.ui.email.val(VALID_EMAIL);
        this.flowFocusThroughEmail();
        mailCheckDefer.resolve(true);

        ok(!this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be visible");
        ok(this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be hidden");

        mailCheckDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());
        this.testObj.ui.email.val(VALID_EMAIL2);
        this.flowFocusThroughEmail();
        mailCheckDefer.resolve(false);

        // then
        ok(!this.testObj.ui.email.is(':disabled'), "email field should be enabled");
        ok(!this.testObj.ui.password.is(':disabled'), "password field should be enabled");
        ok(this.testObj.ui.password.is(document.activeElement), "password field should keep focus");

        ok(this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be hidden");
        ok(this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be hidden");
    });

    test("should show form switch proposition for already registered email after unsuccessful registration attempt", function(){
        // when
        var registrationDefer = $.Deferred();
        var mailCheckDefer = $.Deferred();

        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());
        this.macUtilMock.createUser = this.sandbox.stub().returns(registrationDefer);
        this.macUtilMock.isUserAlreadyExistsErrorMessage = this.sandbox.stub().returns(true);

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registrationDefer.reject({fieldErrors: {}});

        // then
        ok(this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be hidden");
        ok(!this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be visible");
    });

    test("should request login form when form switch proposition link, shown after unsuccessful registration attempt, is clicked", function(){
        // when
        var registrationDefer = $.Deferred();

        this.macUtilMock.createUser = this.sandbox.stub().returns(registrationDefer);
        this.macUtilMock.isUserAlreadyExistsErrorMessage = this.sandbox.stub().returns(true);

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registrationDefer.reject({fieldErrors: {}});

        var switchHandler = this.sandbox.spy();
        this.testObj.on("login-form-requested", switchHandler);
        this.testObj.ui.descEmailExisting.find("a").click();

        // then
        sinon.assert.calledOnce(switchHandler, "login form was requested");
    });

    test("should hide form switch proposition, shown after unsuccessful registration attempt, when email changed to existing one", function(){
        // when
        var registrationDefer = $.Deferred();
        var mailCheckDefer = $.Deferred();

        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailCheckDefer.promise());
        this.macUtilMock.createUser = this.sandbox.stub().returns(registrationDefer);
        this.macUtilMock.isUserAlreadyExistsErrorMessage = this.sandbox.stub().returns(true);

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registrationDefer.reject({fieldErrors: {}});

        ok(this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be hidden");
        ok(!this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be visible");

        this.macUtilMock.isUserAlreadyExistsErrorMessage = this.sandbox.stub().returns(false);
        this.submitForm();

        // then
        ok(this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be hidden");
        ok(this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be hidden");

        this.testObj.ui.email.val(VALID_EMAIL2);
        this.flowFocusThroughEmail();
        mailCheckDefer.resolve(false);

        ok(this.testObj.ui.descEmailExisting.hasClass("hidden"), "switch form message for after blur should be hidden");
        ok(this.testObj.ui.descEmailExistingAfterSubmit.hasClass("hidden"), "switch form message for after submit should be hidden");
    });

    test("should not call checkIfUserExists if email doesn't change and should keep focus on previously focused field", function(){
        // when
        var mailDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(mailDeferred.promise());

        this.initializeView();
        this.testObj.ui.email.data("initial-value", VALID_EMAIL);
        this.testObj.ui.email.val(VALID_EMAIL);
        this.triggerEmailCheck(VALID_EMAIL);

        //then
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);
        ok(this.testObj.ui.password.is(document.activeElement), "Password should keep its focus");
    });

    test("clicking submit button when email field has focus should perform email check instead of form submit", function(){
        // when
        var checkMailDefer = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkMailDefer.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaults();
        this.testObj.ui.email.focus();
        this.testObj.ui.email.blur();
        this.submitForm();

        // then
        sinon.assert.calledOnce(this.macUtilMock.checkIfUserExists);
    });

    test("should keep form disabled when creating an account", function(){
        // when
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();

        //then
        ok(this.testObj.ui.email.is(':disabled'), "email field is disabled");
        ok(this.testObj.ui.password.is(':disabled'), "password field is disabled");
        ok(this.testObj.ui.fullname.is(':disabled'), "fullname field is disabled");
    });

    test("should keep form disabled when generating license", function(){
        // when
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();

        registerDeferred.resolve();

        //then
        ok(this.testObj.ui.email.is(':disabled'), "email field is disabled");
        ok(this.testObj.ui.password.is(':disabled'), "password field is disabled");
        ok(this.testObj.ui.fullname.is(':disabled'), "fullname field is disabled");

        ok(this.testObj.ui.spinnerCreating.hasClass("hidden"), "registration spinner should disappear" );
        ok(!this.testObj.ui.spinnerGenerating.hasClass("hidden"), "spinner should show that license is being generated");
    });

    test("customer agreement checkbox should not be checked by default", function(){
        // when
        this.initializeView();

        // then
        ok(!this.testObj.ui.agreement.prop("checked"), "agreement checkbox is not checked by default");
    });

    test("should require to check customer agreement checkbox before proceeding with registration", function(){
        // when
        this.initializeView();
        this.populateFieldsOverridingDefaults();
        this.testObj.ui.agreement.prop("checked", false);
        this.submitForm();

        // then
        equal($(".error", this.testObj.$el).text(), "agreementRequired", "agreement checkbox should have an error");
    });

    test("should display a message if unable to register user", function(){
        // when
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registerDeferred.reject({});

        //then
        equal($(registerAuiMsgSelector, this.testObj.$el).text(),
            "setup.account.create.account.problem.titlesetup.account.create.account.problem.content", "registration failure message displayed");
    });

    test("message about inability to register should be rendered as an error since the third time", function(){
        // when
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registerDeferred.reject({});

        // then
        equal($(registerAuiMsgSelector).hasClass("aui-message-warning"), true, "message is rendered as a warning");

        // when
        this.submitForm();

        // then
        equal($(registerAuiMsgSelector).hasClass("aui-message-warning"), true, "message shown for the second time is rendered as a warning");

        // when
        this.submitForm();

        // then
        equal($(registerAuiMsgSelector).hasClass("aui-message-error"), true, "message shown for the third time is rendered as an error");
    });

    test("should display a message if unable to check if user exists", function(){
        // when
        var checkUserDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkUserDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaults();
        this.triggerEmailCheck();
        checkUserDeferred.reject();

        //then
        equal($(recheckAccountAuiMsgSelector, this.testObj.$el).text(),
            "setup.account.recheck.account.problem.titlesetup.account.recheck.account.problem.content", "check account failure message displayed");
    });

    test("message about inability to check account should be rendered as an error since the third time", function(){
        // when
        var checkUserDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkUserDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaults();

        this.triggerEmailCheck();
        checkUserDeferred.reject();

        // then
        equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-warning"), true, "message is rendered as a warning");

        // when
        this.triggerEmailCheck();

        // then
        equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-warning"), true, "message shown for the second time is rendered as a warning");

        // when
        this.triggerEmailCheck();

        // then
        equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-error"), true, "message shown for the third time is rendered as an error");
    });

    test("there should be only one global message at a time", function(){
        // when
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registerDeferred.reject({});

        // then
        equal($(registerAuiMsgSelector).length, 1, "registration failure message displayed");
        equal($(recheckAccountAuiMsgSelector).length, 0, "no check account failure message");

        // when
        var checkUserDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkUserDeferred.promise());

        this.triggerEmailCheck();
        checkUserDeferred.reject();

        // then
        equal($(registerAuiMsgSelector).length, 0, "no registration failure message");
        equal($(recheckAccountAuiMsgSelector).length, 1, "check account failure message displayed");

        // when
        this.submitForm();

        // then
        equal($(registerAuiMsgSelector).length, 1, "registration failure message displayed");
        equal($(recheckAccountAuiMsgSelector).length, 0, "no check account failure message");
    });

    test("after successful login should raise an event requesting license generation and show appropriate spinner", function(){
        // given
        var registerDeferred = $.Deferred();
        this.macUtilMock.createUser = this.sandbox.stub().returns(registerDeferred.promise());

        this.initializeView();

        var handler = this.sandbox.spy();
        this.testObj.on("license-generation-requested", handler);

        // when
        this.populateFieldsOverridingDefaultsAndSubmitForm();
        registerDeferred.resolve({});

        // then
        equal(this.testObj.ui.spinnerGenerating.hasClass("hidden"), false, "spinner is visible");
        sinon.assert.calledOnce(handler, "event has been raised");
        sinon.assert.calledWith(handler, "registration");
    });
});