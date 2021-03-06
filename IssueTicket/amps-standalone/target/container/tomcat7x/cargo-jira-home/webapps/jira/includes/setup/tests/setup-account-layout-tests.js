AJS.test.require("jira.webresources:jira-setup", function(){
    var $ = require("jquery");
    var _ = require("underscore");

    // this is a hack enabling to render only needed part of markup into the QUnit's fixture, not entire document
    JIRA.Templates.Setup.layout = JIRA.Templates.Setup.layoutContent;

    var markup = JIRA.Templates.Setup.Account.page({});

    var BUNDLE_NAME = "JIRA Agile";

    module("JIRA Setup Account layout", {
        setup: function(){
            this.sandbox = sinon.sandbox.create({
                useFakeTimers: true
            });

            $("#qunit-fixture").append(
                $("<div></div>")
                    .addClass("jira-setup-account-page")
                    .html(markup)
            );
        },

        tearDown: function(){
            this.sandbox.restore();
        },

        getMockableContext: function(){
            if (!this.mockableContext){
                this.mockableContext = AJS.test.mockableModuleContext();
            }

            return this.mockableContext;
        },

        prepareMACUtilMockOverridingDefaults: function(methods){
            this.macUtilMock = function(){};

            methods = _.extend({
                generateEvaluationLicense: this.sandbox.stub().returns($.Deferred().resolve().promise()),
                generateBundleEvaluationLicense: this.sandbox.stub().returns($.Deferred().resolve().promise()),
                getChosenBundleName: this.sandbox.stub().returns(""),
                getUserData: this.sandbox.stub().returns({}),
                isBundleChosen: this.sandbox.stub().returns(false)
            }, methods);

            _.each(methods, _.bind(function(callable, methodName){
                this.macUtilMock.prototype[methodName] = callable;
            }, this));

            this.getMockableContext().mock("jira/setup/setup-mac-util", this.macUtilMock);
        },

        prepareSetupTrackerOverridingDefaults: function(methods){
            this.setupTrackerMock = {};

            _.each(methods, _.bind(function(callable, methodName){
                this.setupTrackerMock[methodName] = callable;
            }, this));

            this.getMockableContext().mock("jira/setup/setup-tracker", this.setupTrackerMock);
        },

        initializeLayout: function(){
            var Layout = this.getMockableContext().require("jira/setup/setup-account-layout");

            this.testObj = new Layout({
                el: ".jira-setup-account-page"
            });
        },

        getLoginViewConstructorSpy: function(){
            var viewPath = "jira/setup/setup-account-login-view";

            var loginViewSpy = this.sandbox.spy(this.getMockableContext().require(viewPath));
            this.getMockableContext().mock(viewPath, loginViewSpy);

            return loginViewSpy;
        },

        getRegistrationViewConstructorSpy: function(){
            var viewPath = "jira/setup/setup-account-registration-view";

            var registrationViewSpy = this.sandbox.spy(this.getMockableContext().require(viewPath));
            this.getMockableContext().mock(viewPath, registrationViewSpy);

            return registrationViewSpy;
        },

        assertButtonsInclusively: function(){
            var buttons = {
                next: false, retry: false, skip: false
            };

            _.each(arguments, function(button){
                if (buttons.hasOwnProperty(button)) buttons[button] = true;
            });

            _.each(buttons, _.bind(function(visible, buttonName){
                var $button = this.testObj.ui[buttonName + "Button"];

                equal($button.hasClass("hidden"), !visible, buttonName + " button is " + (visible ? "visible" : "hidden"));

                if (visible){
                    equal($button.is(":enabled"), true, buttonName + " button is enabled");
                }
            }, this));
        },

        assertStatusesList: function(params){
            var statuses = _.extend({
                account: false, jira: false, bundle: false
            }, params);

            _.each(statuses, _.bind(function(status, statusName){
                var $item = this.testObj.contents.currentView.ui.listItems.filter("[data-item="+statusName+"]");

                if (!status){
                    equal($item.length, 0, "no status for " + statusName);
                } else if (status === "success"){
                    equal($item.find(".aui-iconfont-approve").length, 1, "success status for " + statusName);
                } else if (status === "fail"){
                    equal($item.find(".aui-iconfont-info").length, 1, "fail status for " + statusName);
                }
            }, this));
        },

        assertErrorMessage: function(titleText){
            var $msg = this.testObj.contents.currentView.ui.message;

            equal($msg.length, 1, "message is present");
            equal($msg.hasClass("aui-message-error"), true, "message is of error type");
            equal($msg.find(".title").text(), titleText, "message title contains specified text");
        },

        assertWarningMessage: function(titleText){
            var $msg = this.testObj.contents.currentView.ui.message;

            equal($msg.length, 1, "message is present");
            equal($msg.hasClass("aui-message-warning"), true, "message is of warning type");
            equal($msg.find(".title").text(), titleText, "message title contains specified text");
        }
    });

    test("should send analytics event with additional bundle selected on previous page", function(){
        // given
        this.prepareSetupTrackerOverridingDefaults({
            sendChosenBundleInformationEvent: this.sandbox.stub()
        });

        // when
        this.initializeLayout();

        // then
        sinon.assert.calledOnce(this.setupTrackerMock.sendChosenBundleInformationEvent);
    });

    test("should generate only JIRA license on license-generation-requested event if user selected JIRA without any bundle", function(){
        //given
        this.prepareMACUtilMockOverridingDefaults();
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");

        // then
        sinon.assert.calledOnce(this.testObj.macUtil.generateEvaluationLicense);
        sinon.assert.notCalled(this.testObj.macUtil.generateBundleEvaluationLicense);
    });

    test("should generate JIRA and bundle licenses on license-generation-requested-event if user selected any additional bundle", function(){
        //given
        this.prepareMACUtilMockOverridingDefaults({
            isBundleChosen: this.sandbox.stub().returns(true)
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");

        // then
        sinon.assert.calledOnce(this.testObj.macUtil.generateEvaluationLicense);
        sinon.assert.calledOnce(this.testObj.macUtil.generateBundleEvaluationLicense);
    });

    test("when unable to generate JIRA license should render error message and allow to retry generation, but not to skip it", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise())
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");

        // then
        this.assertErrorMessage("setup.account.license.problem.error.title");
        this.assertStatusesList({
            account: "success",
            jira: "fail"
        });
        this.assertButtonsInclusively("retry");
    });

    test("when unable to generate bundle license should render warning message and allow to both retry and skip generation", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateBundleEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise()),
            getChosenBundleName: this.sandbox.stub().returns(BUNDLE_NAME),
            isBundleChosen: this.sandbox.stub().returns(true)
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");

        // then
        this.assertWarningMessage("setup.account.bundle.license.problem.title");
        this.assertStatusesList({
            account: "success",
            jira: "success",
            bundle: "fail"
        });
        this.assertButtonsInclusively("retry", "skip");
    });

    test("on retry button click should always attempt to login user again and when succeeds should attempt to generate licenses", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateBundleEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise()),
            getBundleLicense: this.sandbox.stub().returns(null),
            getJiraLicense: this.sandbox.stub().returns("jira license"),
            isBundleChosen: this.sandbox.stub().returns(true),
            loginUser: this.sandbox.stub().returns($.Deferred().resolve().promise())
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");
        this.testObj.ui.retryButton.click();

        // then
        sinon.assert.calledOnce(this.testObj.macUtil.loginUser);
        sinon.assert.calledTwice(this.testObj.macUtil.generateEvaluationLicense);
        sinon.assert.calledTwice(this.testObj.macUtil.generateBundleEvaluationLicense);
    });

    test("when on retry button click cannot login user and no bundle was selected, should render error message and allow to retry", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise()),
            getJiraLicense: this.sandbox.stub().returns(null),
            loginUser: this.sandbox.stub().returns($.Deferred().reject({}).promise())
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");
        this.testObj.ui.retryButton.click();

        // then
        this.assertErrorMessage("setup.account.logging.problem.error.title");
        this.assertButtonsInclusively("retry");
        this.assertStatusesList({
            account: "success",
            jira: "fail"
        });
    });

    test("when on retry button click cannot login user and a bundle was selected, should render error message and allow to both retry and skip", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateBundleEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise()),
            getBundleLicense: this.sandbox.stub().returns(null),
            getChosenBundleName: this.sandbox.stub().returns(BUNDLE_NAME),
            getJiraLicense: this.sandbox.stub().returns("jira license"),
            isBundleChosen: this.sandbox.stub().returns(true),
            loginUser: this.sandbox.stub().returns($.Deferred().reject({}).promise())
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");
        this.testObj.ui.retryButton.click();

        // then
        this.assertErrorMessage("setup.account.logging.problem.error.title");
        this.assertButtonsInclusively("retry", "skip");
        this.assertStatusesList({
            account: "success",
            jira: "success",
            bundle: "fail"
        });
    });

    test("on skip button click should render next button", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults({
            generateBundleEvaluationLicense: this.sandbox.stub().returns($.Deferred().reject().promise())
        });
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("license-generation-requested");
        this.testObj.ui.skipButton.click();

        // then
        this.assertButtonsInclusively("next");
    });

    test("after initialization should keep a basic view", function(){
        // given
        this.prepareMACUtilMockOverridingDefaults();

        // when
        this.initializeLayout();

        // then
        equal(this.testObj.contents.currentView.formType, "basic", "basic view rendered");
    });

    test("should show login view on account-exists event", function(){
        var email = "some email";

        // given
        this.prepareMACUtilMockOverridingDefaults();
        var loginViewSpy = this.getLoginViewConstructorSpy();
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("account-exists", {email: email});

        // then
        equal(this.testObj.contents.currentView.formType, "login", "login view rendered");
        equal(loginViewSpy.args[0][0].email, email, "login view is passed email");
    });

    test("should show login view on login-form-requested event", function(){
        var email = "some email";
        var password = "some password";

        // given
        this.prepareMACUtilMockOverridingDefaults();
        var loginViewSpy = this.getLoginViewConstructorSpy();
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("login-form-requested", {email: email, password: password});

        // then
        equal(this.testObj.contents.currentView.formType, "login", "login view rendered");
        equal(loginViewSpy.args[0][0].email, email, "login view is passed email");
        equal(loginViewSpy.args[0][0].password, password, "login view is passed password");
    });

    test("should show registration view on account-doesnt-exist event", function(){
        var email = "some email";

        // given
        this.prepareMACUtilMockOverridingDefaults();
        var registrationViewSpy = this.getRegistrationViewConstructorSpy();
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("account-doesnt-exist", {email: email});

        // then
        equal(this.testObj.contents.currentView.formType, "registration", "registration view rendered");
        equal(registrationViewSpy.args[0][0].email, email, "registration view is passed email");
    });

    test("should show registration view on registration-form-requested event", function(){
        var email = "some email";
        var password = "some password";

        // given
        this.prepareMACUtilMockOverridingDefaults();
        var registrationViewSpy = this.getRegistrationViewConstructorSpy();
        this.initializeLayout();

        // when
        this.testObj.contents.currentView.trigger("registration-form-requested", {email: email, password: password});

        // then
        equal(this.testObj.contents.currentView.formType, "registration", "registration view rendered");
        equal(registrationViewSpy.args[0][0].email, email, "registration view is passed email");
        equal(registrationViewSpy.args[0][0].password, password, "registration view is passed password");
    });
});