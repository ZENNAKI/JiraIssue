AJS.test.require("jira.webresources:jira-setup", function () {
    var _ = require("underscore");
    var Utils = require("jira/setup/setup-mac-util");

    module("JIRA SetupFinishing page", {
        setup: function () {
            this.testObj = new Utils();
        },

        teardown: function () {
        },

        assertEmailMeetsCriteria: function (email, shouldBeValid) {
            var emailValid = this.testObj.validateEmail(email);

            equal(emailValid, shouldBeValid, "'" + email + "' should be " + (shouldBeValid ? "valid" : "invalid"));
        }
    });

    test("should mark empty e-mail as invalid", function () {
        var criteria = [
            {email: "", valid: false},
            {email: "@", valid: false},
            {email: ".@.ok", valid: false},
            {email: "abc", valid: false},
            {email: "abc", valid: false},
            {email: "a<b>c@mail.com", valid: false},
            {email: "abc@g+mail.com", valid: false},
            {email: "abc@g@mail.com", valid: false},
            {email: "ab&c@gmail.com", valid: false},
            {email: "a3@a12345678901234567890123456789012345678901234567890123456789012345678901234567890.com", valid: false},
            {email: "a123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890@co.uk", valid: false},
            {email: "abc@mail.com", valid: true},
            {email: "abc@atlassian.co.au", valid: true},
            {email: "abc+tag@atlassian.co.au", valid: true},
            {email: "w@a.t", valid: true}
        ];

        _.each(criteria, _.bind(function(criterion){
            this.assertEmailMeetsCriteria(criterion.email, criterion.valid);
        },this))

    });

});