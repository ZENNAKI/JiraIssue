AJS.test.require("jira.webresources:jira-setup", function(){
    var $ = require("jquery");

    var AGREEMENT_CLASSNAME = "setup-license-customer-agreement-checkbox";

    module("setup-license.js", {
        setup: function() {
            this.fixture = $("#qunit-fixture");
            this.fixture.append(JIRA.Templates.LicenseSetup.pageMockForQUnit());

            this.sandbox = sinon.sandbox.create({
                useFakeServer: true
            });

            this.setupLicenseModule = require("jira/setup/setup-license");

            this.sandbox.stub(AJS.Meta, "get").returns("DEVELOPMENT");
        },

        teardown: function(){
            this.sandbox.restore();

            $("#qunit-fixture").empty();
        },

        find: function(selector){
            return this.fixture.find(selector);
        },

        getAgreementCheckbox: function(){
            return this.find("."+AGREEMENT_CLASSNAME);
        },

        getSubmitButton: function(){
            return this.find("input[type=submit]").eq(0);
        },

        switchToScreen: function(screen){
            this.startPage();
            $("input[name=licenseSetupSelector]").filter("[value="+screen+"]").click();
        },

        startPage: function(){
            this.setupLicenseModule.startPage(function(){
                return true;
            }, function(){
                var deferred = $.Deferred();

                deferred.resolve();
                return deferred.promise();
            });
        }
    });

    test("render appropriate message when hamlet returns 403", function(){
        this.switchToScreen("newAccount");

        this.getAgreementCheckbox().click();
        this.find("#newMacUserForm").submit();

        this.sandbox.server.requests[0].respond(403, {"Content-Type": "application/json"}, "{}");

        strictEqual(this.find("#formError strong").text(), "setupLicense.error.forbidden.title");

        this.switchToScreen("login");

        this.getAgreementCheckbox().click();
        this.find("#loginMacForm").submit();

        this.sandbox.server.requests[1].respond(403, {"Content-Type": "application/json"}, "{}");

        strictEqual(this.find("#formError strong").text(), "setup.loginmac.error.title");
    });

    test('handling of lack of internet connection should show error and leave only the existing license screen as enabled', function(){
        this.startPage();

        this.setupLicenseModule.handleNoInternet();

        equal(this.find("#no-connection-warning").hasClass('hidden'), false, 'hidden class should be removed');
        ok(this.find("input[name=licenseSetupSelector][value=newAccount]").is(":disabled"), "registration disabled");
        ok(this.find("input[name=licenseSetupSelector][value=login]").is(":disabled"), "login disabled");
        ok(!this.find("input[name=licenseSetupSelector][value=existingLicense]").is(":disabled"), "existing license enabled");
    });

    test("should update headers when switching between screens", function(){
        this.switchToScreen("existingLicense");
        equal(this.find("h3").text(), "setup.importlicense.headersetup.cross.selling.import.license.header", "should switch to existing license screen");

        this.switchToScreen("login");
        equal(this.find("h3").text(), "setup.loginmac.header", "should switch to existing user screen");

        this.switchToScreen("newAccount");
        equal(this.find("h3").text(), "setup.newmacuser.header", "should switch to new user screen");
    });

    /* ****** new user form ****** */

    test("new user form: by default agreement checkbox should not be checked and submit button should be disabled", function(){
        this.switchToScreen("newAccount");

        ok(!this.getAgreementCheckbox().is(":checked"), "checkbox is not checked");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("new user form: submit button is enabled only if agreement checkbox is checked", function(){
        this.switchToScreen("newAccount");

        this.getAgreementCheckbox().click();
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");

        this.getAgreementCheckbox().click();
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("new user form: both agreement checkbox and submit button are disabled while form is being submitted", function(){
        this.switchToScreen("newAccount");

        this.getAgreementCheckbox().click();
        this.find("#newMacUserForm").submit();

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(this.getAgreementCheckbox().is(":disabled"), "checkbox is disabled");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");

        this.sandbox.server.requests[0].respond(400, {"Content-Type": "application/json"}, "{}");

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(!this.getAgreementCheckbox().is(":disabled"), "checkbox is enabled");
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");
    });

    /* ****** existing user form ****** */

    test("existing user form: by default agreement checkbox should not be checked and submit button should be disabled", function(){
        this.switchToScreen("login");

        ok(!this.getAgreementCheckbox().is(":checked"), "checkbox is not checked");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("existing user form: submit button is enabled only if agreement checkbox is checked", function(){
        this.switchToScreen("login");

        this.getAgreementCheckbox().click();
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");

        this.getAgreementCheckbox().click();
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("existing user form: both agreement checkbox and submit button are disabled while form is being submitted", function(){
        this.switchToScreen("login");

        this.getAgreementCheckbox().click();
        this.find("#loginMacForm").submit();

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(this.getAgreementCheckbox().is(":disabled"), "checkbox is disabled");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");

        this.sandbox.server.requests[0].respond(403, {"Content-Type": "application/json"}, "{}");

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(!this.getAgreementCheckbox().is(":disabled"), "checkbox is enabled");
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");
    });

    /* ****** existing license form ****** */

    test("existing license form: by default agreement checkbox should not be checked and submit button should be disabled", function(){
        this.switchToScreen("existingLicense");

        ok(!this.getAgreementCheckbox().is(":checked"), "checkbox is not checked");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("existing license form: submit button is enabled only if agreement checkbox is checked", function(){
        this.switchToScreen("existingLicense");

        this.getAgreementCheckbox().click();
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");

        this.getAgreementCheckbox().click();
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");
    });

    test("existing license form: both agreement checkbox and submit button are disabled while form is being submitted", function(){
        this.switchToScreen("existingLicense");

        this.getAgreementCheckbox().click();
        this.find("#importLicenseForm").submit();

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(this.getAgreementCheckbox().is(":disabled"), "checkbox is disabled");
        ok(this.getSubmitButton().is(":disabled"), "submit button is disabled");

        this.sandbox.server.requests[0].respond(403, {"Content-Type": "application/json"}, "{}");

        ok(this.getAgreementCheckbox().is(":checked"), "checkbox is checked");
        ok(!this.getAgreementCheckbox().is(":disabled"), "checkbox is enabled");
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");
    });

    test("existing license form: if no bundle is selected login form and agreement checkbox should be hidden and submit "
        + "button should be enabled by default", function(){
        AJS.Meta.get.restore();
        this.sandbox.stub(AJS.Meta, "get").returns("TRACKING");

        this.switchToScreen("existingLicense");

        ok(this.find(".existing-licence-login-fields").hasClass("hidden"), "login form and checkbox are hidden");
        ok(!this.getSubmitButton().is(":disabled"), "submit button is enabled");
    });
});
