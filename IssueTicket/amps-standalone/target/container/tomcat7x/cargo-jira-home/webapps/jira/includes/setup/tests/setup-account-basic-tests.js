AJS.test.require("jira.webresources:jira-setup", function(){
    var $ = require("jquery");
    var _ = require("underscore");
    var View = require("jira/setup/setup-account-basic-view");

    var markup = JIRA.Templates.Setup.layoutContent({
        content: JIRA.Templates.Setup.Account.basicForm({})
    });

    var INVALID_EMAIL = "this@sparta.is.";
    var VALID_EMAIL = "this@sparta.is";
    var VALID_EMAIL2 = "that@persia.is";

    module("JIRA Setup Account basic view", {
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
                }, this),
                transformAIDErrorMessage: function(arg){
                    return arg;
                }
            };

            $("#qunit-fixture").append(
                $("<div></div>")
                    .addClass("jira-setup-basic-form")
                    .html(markup)
            );
        },

        tearDown: function(){
            this.sandbox.restore();
        },

        initializeView: function(){
            this.testObj = new View({
                macUtil: this.macUtilMock,
                errorTexts: {
                    invalidEmail: "invalidEmail",
                    emailRequired: 'emailRequired',
                    invalidCredentials: 'invalidCredentials',
                    passwordRequired: 'passwordRequired'
                },
                el: ".jira-setup-basic-form"
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
            this.testObj.ui.submitButton.focus();
            this.sandbox.clock.tick(1);
        }
    });

    test("submit button should be disabled by default", function(){
        // when
        this.initializeView();

        // then
        equal(this.testObj.ui.submitButton.is(':disabled'), true, "submit button is disabled by default");
    });

    test("submit button should be enabled only when email field is not empty", function(){
        // given
        this.initializeView();

        // when
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});

        // then
        equal(this.testObj.ui.submitButton.is(':disabled'), false, "submit button is enabled");

        // when
        this.testObj.ui.email.val("");
        this.testObj.ui.email.trigger({type: "input"});

        // then
        equal(this.testObj.ui.submitButton.is(':disabled'), true, "submit button is disabled");
    });

    test("invalid email should result in error message when form is submitted", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(INVALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        // when
        this.testObj.ui.submitButton.click();

        // then
        equal($(".error", this.testObj.$el).text(), "invalidEmail", "invalid email message shown");
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);
    });

    test("form should be disabled while checking email", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        // when
        this.testObj.ui.submitButton.click();

        // then
        equal(this.testObj.ui.email.is(':disabled'), true, "email field is disabled");
        equal(this.testObj.ui.submitButton.is(':disabled'), true, "submit button is disabled");
    });

    test("should trigger account-exists event when email is registered on MAC", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});

        var checkEmailDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkEmailDeferred.promise());

        var emailExistsSpy = this.sandbox.spy();
        var emailNotExistsSpy = this.sandbox.spy();
        this.testObj.on("account-exists", emailExistsSpy);
        this.testObj.on("account-doesnt-exist", emailNotExistsSpy);

        // when
        this.testObj.ui.submitButton.click();
        checkEmailDeferred.resolve(true);

        // then
        sinon.assert.calledWith(emailExistsSpy, {email: VALID_EMAIL});
        sinon.assert.notCalled(emailNotExistsSpy);
    });

    test("should trigger account-doesnt-exist event when email doesn't exist on MAC", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});

        var checkEmailDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkEmailDeferred.promise());

        var emailExistsSpy = this.sandbox.spy();
        var emailNotExistsSpy = this.sandbox.spy();
        this.testObj.on("account-exists", emailExistsSpy);
        this.testObj.on("account-doesnt-exist", emailNotExistsSpy);

        // when
        this.testObj.ui.submitButton.click();
        checkEmailDeferred.resolve(false);

        // then
        sinon.assert.calledWith(emailNotExistsSpy, {email: VALID_EMAIL});
        sinon.assert.notCalled(emailExistsSpy);
    });

    test("when email check fails should show warning and enable form", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});

        var checkEmailDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkEmailDeferred.promise());

        var emailExistsSpy = this.sandbox.spy();
        var emailNotExistsSpy = this.sandbox.spy();
        this.testObj.on("account-exists", emailExistsSpy);
        this.testObj.on("account-doesnt-exist", emailNotExistsSpy);

        // when
        this.testObj.ui.submitButton.click();
        checkEmailDeferred.reject();

        // then
        sinon.assert.notCalled(emailNotExistsSpy);
        sinon.assert.notCalled(emailExistsSpy);

        equal(this.testObj.ui.email.is(':disabled'), false, "email field is enabled");
        equal(this.testObj.ui.submitButton.is(':disabled'), false, "submit button is enabled");
        equal($(".aui-message-warning", this.testObj.$el).text(),
                "setup.account.check.account.problem.titlesetup.account.check.account.problem.content",
                "Email check failure warning message shown");
    });

    test("when email check fails at least three times should show error", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.email.trigger({type: "input"});

        var checkEmailDeferred = $.Deferred();
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns(checkEmailDeferred.promise());

        var emailExistsSpy = this.sandbox.spy();
        var emailNotExistsSpy = this.sandbox.spy();
        this.testObj.on("account-exists", emailExistsSpy);
        this.testObj.on("account-doesnt-exist", emailNotExistsSpy);

        // when
        this.testObj.ui.submitButton.click();
        checkEmailDeferred.reject();

        // and try to fail few times again
        this.testObj.ui.submitButton.click();
        this.testObj.ui.submitButton.click();

        // then
        equal($(".aui-message-error", this.testObj.$el).text(),
                "setup.account.check.account.problem.error.titlesetup.account.check.account.problem.error.content",
                "Email check failure error message shown");
    });

    test("blur on email field should cause neither account check nor email value validation", function(){
        // given
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());
        this.initializeView();

        // when
        this.testObj.ui.email.val(VALID_EMAIL);
        this.flowFocusThroughEmail();

        //then
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);
        equal($(".error", this.testObj.$el).text(), "", "no email validation error message");
    });

    test("when email changed to valid should remove error message on form submit", function(){
        // given
        this.initializeView();
        this.testObj.ui.email.val(INVALID_EMAIL);
        this.macUtilMock.checkIfUserExists = this.sandbox.stub().returns($.Deferred().promise());

        // when
        this.testObj.ui.submitButton.click();
        this.testObj.ui.email.val(VALID_EMAIL);
        this.testObj.ui.submitButton.click();

        // then
        equal($(".error", this.testObj.$el).text(), "", "no email validation error message");
        sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);
    });
});