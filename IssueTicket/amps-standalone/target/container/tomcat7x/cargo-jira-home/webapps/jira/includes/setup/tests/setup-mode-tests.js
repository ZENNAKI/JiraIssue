AJS.test.require("jira.webresources:jira-setup", function(){
    var $ = require("jquery");
    var _ = require("underscore");
    var View = require("jira/setup/setup-mode-view");

    var markup = JIRA.Templates.Setup.layoutContent({
        content: JIRA.Templates.Setup.Mode.pageContent({
            modifierKey: "s",
            productName: "JIRA"
        })
    });

    module("JIRA SetupMode page", {
        setup: function(){

            /* when running qunit tests, the webdriver shell completes
             * setup using classic mode in the same session!            */
            window.sessionStorage.removeItem(View.pageStorageKey);

            var className = "jira-setup-mode-page";

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

    test("instant setup is default mode", function(){
        equal(this.view.ui.choiceValueField.val(), "instant", "instant setup is default mode");

        var dataValue = this.view.ui.choiceBox.filter("."+this.view.choiceActiveClassname).data("choice-value");
        equal(dataValue, "instant", "instant option is marked as active");
    });

    test("clicking on an option box changes the selected value, and the order is instant first and classic second", function(){
        this.view.ui.choiceBox.eq(1).click();
        equal(this.view.ui.choiceValueField.val(), "classic", "classic setup is the second option");

        var dataValue = this.view.ui.choiceBox.filter("."+this.view.choiceActiveClassname).data("choice-value");
        equal(dataValue, "classic", "classic option is marked as active");

        this.view.ui.choiceBox.eq(0).click();
        equal(this.view.ui.choiceValueField.val(), "instant", "instant setup is the first option");
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

    test("language dialog can be opened by clicking on the trigger", function(){
        this.sandbox.stub(this.view.langDialog, "show");

        this.view.ui.languageDialogTrigger.click();

        sinon.assert.calledOnce(this.view.langDialog.show, "should open the dialog");
    });

    test("language dialog is being closed after its view raises an event", function(){
        this.sandbox.stub(this.view.langDialog, "hide");

        this.view.languageView.trigger("cancel-requested");

        sinon.assert.calledOnce(this.view.langDialog.hide, "should close the dialog");
    });
});