AJS.test.require("jira.webresources:jira-setup",function(){var $=require("jquery");var _=require("underscore");var View=require("jira/setup/setup-account-login-view");JIRA.Templates.Setup.Account.formSwitchNonExistingAccount=function(data,output){output.append('<span class="jira-setup-account-email-not-existing hidden">');output.append('<a href="#" id="jira-setup-account-form-switch-nonexisting" class="jira-setup-account-form-switch">');output.append("</span>");return output.toString()};JIRA.Templates.Setup.Account.formSwitchAfterSubmitNonExistingAccount=function(data,output){output.append('<span class="jira-setup-account-email-not-existing-after-submit hidden">');output.append('<a href="#" id="jira-setup-account-form-switch-nonexisting-after-submit" class="jira-setup-account-form-switch">');output.append("</span>");return output.toString()};var markup=JIRA.Templates.Setup.layoutContent({content:JIRA.Templates.Setup.Account.loginForm({})});var INVALID_EMAIL="this@sparta.is.";var VALID_EMAIL="this@sparta.is";var VALID_EMAIL2="that@persia.is";var loginAuiMsgSelector=".jira-setup-account-cannot-login-message";var recheckAccountAuiMsgSelector=".jira-setup-account-cannot-recheck-account-message";module("JIRA Setup Account Login page",{_validEmails:[],setup:function(){this.sandbox=sinon.sandbox.create({useFakeTimers:true});this.macUtilMock={validateEmail:_.bind(function(email){if(email===INVALID_EMAIL){return false}else{if(email===VALID_EMAIL){return true}else{if(email===VALID_EMAIL2){return true}else{if(-1!==this._validEmails.indexOf(email)){return true}else{throw"unexpected mail value: "+email}}}}},this),transformAIDErrorMessage:function(arg){return arg}};$("#qunit-fixture").append($("<div></div>").addClass("jira-account-login-form").html(markup));this.setupTracker={};this.setupTracker.sendUserLoggedInEvent=this.sandbox.spy()},tearDown:function(){this.sandbox.restore()},initializeView:function(){this.testObj=new View({macUtil:this.macUtilMock,errorTexts:{agreementRequired:"agreementRequired",invalidEmail:"invalidEmail",emailRequired:"emailRequired",invalidCredentials:"invalidCredentials",passwordRequired:"passwordRequired"},el:".jira-account-login-form",setupTracker:this.setupTracker});this.testObj.bindUIElements()},populateFieldsOverridingDefaults:function(data){var data=data||{};if(data.email!==undefined){this.testObj.ui.email.val(data.email)}else{this.testObj.ui.email.val(VALID_EMAIL)}if(data.password!==undefined){this.testObj.ui.password.val(data.password)}else{this.testObj.ui.password.val(VALID_EMAIL)}this.testObj.ui.agreement.prop("checked",true)},populateFieldsOverridingDefaultsAndSubmitForm:function(data){this.populateFieldsOverridingDefaults(data);this.submitForm()},submitForm:function(){this.testObj.ui.submitButton.focus();this.sandbox.clock.tick(1);this.testObj.ui.submitButton.click()},flowFocusThroughEmail:function(){this.testObj.ui.email.focus();this.testObj.ui.email.blur();this.testObj.ui.password.focus();this.sandbox.clock.tick(1)},triggerEmailCheck:function(newEmail){if(!newEmail){newEmail=this.testObj.ui.email.val()+"m";this._validEmails.push(newEmail)}this.testObj.ui.email.val(newEmail);this.flowFocusThroughEmail()}});test("should add analytics event when user is logged in",function(){this.initializeView();this.populateFieldsOverridingDefaults();var e={preventDefault:this.sandbox.spy()};var defer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(defer.promise());this.testObj.onSubmitClicked(e);defer.resolve();ok(this.setupTracker.sendUserLoggedInEvent.calledOnce,"Analytics event should be raised")});test("should not send analytics event when login form is invalid",function(){this.initializeView();this.populateFieldsOverridingDefaults({password:""});var e={preventDefault:this.sandbox.spy()};var defer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(defer.promise());this.testObj.onSubmitClicked(e);defer.resolve();ok(!this.setupTracker.sendUserLoggedInEvent.called,"Analytics event should be skipped")});test("when email field is invalid form submit shouldn't call any MAC method",function(){this.macUtilMock.loginUser=this.sandbox.stub().returns($.Deferred().promise());this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns($.Deferred().promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm({email:INVALID_EMAIL,password:VALID_EMAIL});sinon.assert.notCalled(this.macUtilMock.loginUser);sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);equal($(".error",this.testObj.$el).text(),"invalidEmail","invalid email message shown")});test("when password field is empty form submit shouldn't call any MAC method",function(){this.macUtilMock.loginUser=this.sandbox.stub().returns($.Deferred().promise());this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns($.Deferred().promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm({password:""});sinon.assert.notCalled(this.macUtilMock.loginUser);sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);equal($(".error",this.testObj.$el).text(),"passwordRequired","password required message shown")});test("when invalid email is entered blur should show error message and don't check if account exists",function(){this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns($.Deferred().promise());this.initializeView();this.triggerEmailCheck(INVALID_EMAIL);sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);equal($(".error",this.testObj.$el).text(),"invalidEmail","invalid email message shown")});test("when email changed to valid should remove error message",function(){this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns($.Deferred().promise());this.initializeView();this.triggerEmailCheck(INVALID_EMAIL);equal($(".error",this.testObj.$el).text(),"invalidEmail","invalid email message shown");this.triggerEmailCheck(VALID_EMAIL);equal($(".error",this.testObj.$el).text(),"","invalid email message should disappear")});test("should keep form disabled when checking email",function(){var mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.initializeView();this.triggerEmailCheck(VALID_EMAIL);ok(this.testObj.ui.email.is(":disabled"),"email field is disabled");ok(this.testObj.ui.password.is(":disabled"),"password field is disabled")});test("should show form switch proposition for unregistered email after email field blur",function(){var mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.initializeView();this.triggerEmailCheck(VALID_EMAIL);mailCheckDefer.resolve(false);ok(!this.testObj.ui.email.is(":disabled"),"email field should be enabled");ok(!this.testObj.ui.password.is(":disabled"),"password field should be enabled");ok(this.testObj.ui.password.is(document.activeElement),"password field should keep focus");ok(!this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be visible");ok(this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be hidden")});test("should request registration form when form switch proposition link, shown after email field blur, is clicked",function(){var mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.initializeView();this.triggerEmailCheck(VALID_EMAIL);mailCheckDefer.resolve(false);var switchHandler=this.sandbox.spy();this.testObj.on("registration-form-requested",switchHandler);this.testObj.ui.descEmailNotExisting.find("a").click();sinon.assert.calledOnce(switchHandler,"registration form was requested")});test("should hide form switch proposition, shown after email field blur, when email changed to existing one",function(){var mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.initializeView();this.triggerEmailCheck(VALID_EMAIL);mailCheckDefer.resolve(false);ok(!this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be visible");ok(this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be hidden");mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.triggerEmailCheck(VALID_EMAIL2);mailCheckDefer.resolve(true);ok(!this.testObj.ui.email.is(":disabled"),"email field should be enabled");ok(!this.testObj.ui.password.is(":disabled"),"password field should be enabled");ok(this.testObj.ui.password.is(document.activeElement),"password field should keep focus");ok(this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be hidden");ok(this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be hidden")});test("should show form switch proposition for unregistered email after unsuccessful login attempt",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer);this.macUtilMock.isEmailNotVerifiedErrorMessage=this.sandbox.stub().returns(true);this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({error:"awesome error"});ok(this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be hidden");ok(!this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be visible")});test("should request registration form when form switch proposition link, shown after unsuccessful login attempt, is clicked",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer);this.macUtilMock.isEmailNotVerifiedErrorMessage=this.sandbox.stub().returns(true);this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({error:"awesome error"});var switchHandler=this.sandbox.spy();this.testObj.on("registration-form-requested",switchHandler);this.testObj.ui.descEmailNotExisting.find("a").click();sinon.assert.calledOnce(switchHandler,"registration form was requested")});test("should hide form switch proposition, shown after unsuccessful login attempt, when email changed to existing one",function(){var loginDefer=$.Deferred();var mailCheckDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailCheckDefer.promise());this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer);this.macUtilMock.isEmailNotVerifiedErrorMessage=this.sandbox.stub().returns(true);this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({error:"awesome error"});ok(this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be hidden");ok(!this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be visible");this.macUtilMock.isEmailNotVerifiedErrorMessage=this.sandbox.stub().returns(false);this.submitForm();ok(this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be hidden");ok(this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be hidden");this.triggerEmailCheck(VALID_EMAIL2);mailCheckDefer.resolve(true);ok(this.testObj.ui.descEmailNotExisting.hasClass("hidden"),"switch form message for after blur should be hidden");ok(this.testObj.ui.descEmailNotExistingAfterSubmit.hasClass("hidden"),"switch form message for after submit should be hidden")});test("should not call checkIfUserExists if email doesn't change and should keep focus on previously focused field",function(){var mailDeferred=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(mailDeferred.promise());this.initializeView();this.testObj.ui.email.data("initial-value",VALID_EMAIL);this.testObj.ui.email.val(VALID_EMAIL);this.triggerEmailCheck(VALID_EMAIL);sinon.assert.notCalled(this.macUtilMock.checkIfUserExists);ok(this.testObj.ui.password.is(document.activeElement),"Password should keep its focus")});test("clicking submit button when email field has focus should perform email check instead of form submit",function(){var checkMailDefer=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(checkMailDefer.promise());this.initializeView();this.populateFieldsOverridingDefaults();this.testObj.ui.email.focus();this.testObj.ui.email.blur();this.submitForm();sinon.assert.calledOnce(this.macUtilMock.checkIfUserExists)});test("should keep form disabled when logging in user",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer.promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();ok(this.testObj.ui.email.is(":disabled"),"email field is disabled");ok(this.testObj.ui.password.is(":disabled"),"password field is disabled")});test("should keep form disabled when generating license",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer.promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.resolve();ok(this.testObj.ui.email.is(":disabled"),"email field is disabled");ok(this.testObj.ui.password.is(":disabled"),"password field is disabled");ok(this.testObj.ui.spinnerLogging.hasClass("hidden"),"login spinner should disappear");ok(!this.testObj.ui.spinnerGenerating.hasClass("hidden"),"spinner should show that license is being generated")});test("customer agreement checkbox should not be checked by default",function(){this.initializeView();ok(!this.testObj.ui.agreement.prop("checked"),"agreement checkbox is not checked by default")});test("should require to check customer agreement checkbox before proceeding with login",function(){this.initializeView();this.populateFieldsOverridingDefaults();this.testObj.ui.agreement.prop("checked",false);this.submitForm();equal($(".error",this.testObj.$el).text(),"agreementRequired","agreement checkbox should have an error")});test("should display a message if unable to login user",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer.promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({});equal($(loginAuiMsgSelector,this.testObj.$el).text(),"setup.account.logging.problem.titlesetup.account.logging.problem.content","login failure message displayed")});test("message about inability to login should be rendered as an error since the third time",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer.promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({});equal($(loginAuiMsgSelector).hasClass("aui-message-warning"),true,"message is rendered as a warning");this.submitForm();equal($(loginAuiMsgSelector).hasClass("aui-message-warning"),true,"message shown for the second time is rendered as a warning");this.submitForm();equal($(loginAuiMsgSelector).hasClass("aui-message-error"),true,"message shown for the third time is rendered as an error")});test("should display a message if unable to check if user exists",function(){var checkUserDeferred=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(checkUserDeferred.promise());this.initializeView();this.populateFieldsOverridingDefaults();this.triggerEmailCheck();checkUserDeferred.reject();equal($(recheckAccountAuiMsgSelector,this.testObj.$el).text(),"setup.account.recheck.account.problem.titlesetup.account.recheck.account.problem.content","check account failure message displayed")});test("message about inability to check account should be rendered as an error since the third time",function(){var checkUserDeferred=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(checkUserDeferred.promise());this.initializeView();this.populateFieldsOverridingDefaults();this.triggerEmailCheck();checkUserDeferred.reject();equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-warning"),true,"message is rendered as a warning");this.triggerEmailCheck();equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-warning"),true,"message shown for the second time is rendered as a warning");this.triggerEmailCheck();equal($(recheckAccountAuiMsgSelector).hasClass("aui-message-error"),true,"message shown for the third time is rendered as an error")});test("there should be only one global message at a time",function(){var loginDefer=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDefer.promise());this.initializeView();this.populateFieldsOverridingDefaultsAndSubmitForm();loginDefer.reject({});equal($(loginAuiMsgSelector).length,1,"login failure message displayed");equal($(recheckAccountAuiMsgSelector).length,0,"no check account failure message");var checkUserDeferred=$.Deferred();this.macUtilMock.checkIfUserExists=this.sandbox.stub().returns(checkUserDeferred.promise());this.triggerEmailCheck();checkUserDeferred.reject();equal($(loginAuiMsgSelector).length,0,"no login failure message");equal($(recheckAccountAuiMsgSelector).length,1,"check account failure message displayed");this.submitForm();equal($(loginAuiMsgSelector).length,1,"login failure message displayed");equal($(recheckAccountAuiMsgSelector).length,0,"no check account failure message")});test("after successful login should raise an event requesting license generation and show appropriate spinner",function(){var loginDeferred=$.Deferred();this.macUtilMock.loginUser=this.sandbox.stub().returns(loginDeferred.promise());this.initializeView();var handler=this.sandbox.spy();this.testObj.on("license-generation-requested",handler);this.populateFieldsOverridingDefaultsAndSubmitForm();loginDeferred.resolve({});equal(this.testObj.ui.spinnerGenerating.hasClass("hidden"),false,"spinner is visible");sinon.assert.calledOnce(handler,"event has been raised");sinon.assert.calledWith(handler,"login")})});