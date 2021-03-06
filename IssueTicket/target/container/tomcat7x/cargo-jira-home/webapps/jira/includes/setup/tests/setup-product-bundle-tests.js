AJS.test.require("jira.webresources:jira-setup", function(){
    var $ = require("jquery");
    var _ = require("underscore");
    var View = require("jira/setup/setup-mode-view");

    var markup = JIRA.Templates.Setup.layoutContent({
        content: JIRA.Templates.Setup.ProductBundle.pageContent({
            modifierKey: "s",
            productName: "JIRA"
        })
    });

    module("JIRA SetupProductBundle page", {
        setup: function(){
            var className = "jira-setup-product-bundle-page";

            this.sandbox = sinon.sandbox.create();

            $("#qunit-fixture").append(
                $("<div></div>")
                    .addClass(className)
                    .html(markup)
            );

            this.view = new View({
                el: "." + className
            });
        },

        teardown: function(){
            this.sandbox.restore();
            this.view.remove();
        }
    });

    test("JIRA is the default product", function(){
        equal(this.view.ui.choiceValueField.val(), "TRACKING", "JIRA is the default product");

        var dataValue = this.view.ui.choiceBox.filter("."+this.view.choiceActiveClassname).data("choice-value");
        equal(dataValue, "TRACKING", "JIRA option is marked as active");
    });

    test("clicking on an option box changes the selected value and the order of options is unchanged", function(){
        this.view.ui.choiceBox.eq(2).click();
        equal(this.view.ui.choiceValueField.val(), "SERVICEDESK", "Service Desk is the third option");

        var dataValue = this.view.ui.choiceBox.filter("."+this.view.choiceActiveClassname).data("choice-value");
        equal(dataValue, "SERVICEDESK", "Service Desk option is marked as active");

        this.view.ui.choiceBox.eq(1).click();
        equal(this.view.ui.choiceValueField.val(), "DEVELOPMENT", "JIRA Agile is the second option");

        this.view.ui.choiceBox.eq(0).click();
        equal(this.view.ui.choiceValueField.val(), "TRACKING", "JIRA is the first option");
    });

    test("after form is submitted primary button is disabled and there is no spinner ", function(){
        ok(!this.view.ui.submitButton.prop("disabled"), "button is enabled by default");

        // prevent form submission
        this.view.ui.form.on("submit", function(e){
            e.preventDefault();
        });

        this.view.ui.submitButton.click();

        ok(this.view.ui.submitButton.prop("disabled"), "button is disabled after submission");
        equal(this.view.$(".aui-icon-wait").length, 0, "no spinner present");
    });
});