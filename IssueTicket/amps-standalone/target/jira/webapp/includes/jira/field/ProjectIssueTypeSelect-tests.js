AJS.test.require("jira.webresources:jira-global");
AJS.test.require("jira.webresources:jira-fields");


require([
    'jira/ajs/select/single-select',
    'jira/ajs/select/suggestion-collection-model',
    'jquery'
],
function(
    SingleSelect,
    SuggestionCollectionModel,
    jQuery
) {
    module('JIRA.ProjectIssueTypeSelect', {
        setup: function() {
            var $container = jQuery('#qunit-fixture');
            var issuetypes = [
                {
                    label: '10000',
                    items: [
                        {label: 'Bug', value: '1'},
                        {label: 'New Feature', value: '2'},
                        {label: 'Task', value: '3'},
                        {label: 'Improvement', value: '4'},
                        {label: 'UNQ-ISSUES', value: '6'},
                        {label: 'Epic', value: '9'},
                        {label: 'Story', value: '10'}
                    ]
                },
                {
                    label: '10452',
                    items: [
                        {label: 'Improvement', value: '4'},
                        {label: 'Task', value: '3'}
                    ]
                }
            ];
            var projectSchemes = {
                '10440': '10000',
                '10041': '10000',
                '10240': '10452',
                '10020': '10000',
                '10000': '10000',
                '10001': '10000',
                '10040': '10000',
                '10010': '10000',
                '10340': '10000',
                '10031': '10000'
            };
            var issueTypeDefaults = {
                '10000': '',
                '10452': '4'
            };

            this.project = jQuery('<input type="text" value="10000"/>').appendTo($container);
            this.issueType = jQuery('<input type="text" id="issuetype-select"/>').appendTo($container);
            this.issueTypeOptions = jQuery('<div id="issuetype-select-options"/>').attr('data-suggestions', JSON.stringify(issuetypes)).appendTo($container);
            this.issueTypeSelect = new SingleSelect({element: this.issueType, model: SuggestionCollectionModel});
            this.issueTypeSchemes = jQuery('<script type=application/json">' + JSON.stringify(projectSchemes)+ '</script>').appendTo($container);
            this.issueTypeDefaults = jQuery('<script type=application/json">' + JSON.stringify(issueTypeDefaults)+ '</script>').appendTo($container);

            this.projectIssueTypeSelect = new JIRA.ProjectIssueTypeSelect({
                project: this.project,
                issueTypeSelect: this.issueTypeSelect,
                projectIssueTypesSchemes: this.issueTypeSchemes,
                issueTypeSchemeIssueDefaults: this.issueTypeDefaults
            });

        },
        teardown: function () {
            this.project.remove();
            this.issueType.remove();
            this.issueTypeOptions.remove();
            this.issueTypeSchemes.remove();
            this.issueTypeDefaults.remove();
        }
    });

    test("schemes are correct for projects", function () {
        equal(this.projectIssueTypeSelect.getIssueTypeSchemeForProject("10240"), "10452",
                "Project with [id=10240] should be mapped to scheme with [id=10452]");

        equal(this.projectIssueTypeSelect.getIssueTypeSchemeForProject("10000"), "10000",
                "Project with [id=10000] should be mapped to scheme with [id=10000]");
    });

    test("issueType defaults are correct for schemes", function () {
        equal(this.projectIssueTypeSelect.getDefaultIssueTypeForScheme("10452"), "4",
                "Issue type scheme with id [10452] should have a default issue type of [id=4]");

        equal(this.projectIssueTypeSelect.getDefaultIssueTypeForScheme("10000"), "",
                "Issue type scheme with id [10000], has no default issue type so should return empty string");
    });


    test("Selecting issue type scheme WITHOUT a default issue type selects first", function () {
        this.projectIssueTypeSelect.setIssueTypeScheme("10000");
        equal(this.issueType.val(), "1");
    });

    test("Selecting issue type scheme WITH a default issue type, selects it", function () {
        this.projectIssueTypeSelect.setIssueTypeScheme("10452");
        equal(this.issueType.val(), "4");
    });

    test("Selecting project displays correct issue types", function () {
        var descriptors = this.issueTypeSelect.model.getAllDescriptors();

        equal(this.issueType.data("project"), "10000");
        equal(descriptors[0].value(), "1");
        equal(descriptors[1].value(), "2");
        equal(descriptors[2].value(), "3");
        equal(descriptors[3].value(), "4");
        equal(descriptors[4].value(), "6");
        equal(descriptors[5].value(), "9");
        equal(descriptors[6].value(), "10");
        equal(this.issueType.val(), "1");
        equal(descriptors.length, 7);

        this.project.val("10240").trigger("change");

        descriptors = this.issueTypeSelect.model.getAllDescriptors();
        equal(this.issueType.data().project, "10240");
        equal(descriptors[0].value(), "4");
        equal(descriptors[1].value(), "3");
        equal(this.issueType.val(), "4");
        equal(descriptors.length, 2);

    });

    test("If user has selected an issuetype and changes project, the same issue type remains selected", function () {
        this.issueType.val("10").trigger("change");
        this.project.val("10240").trigger("change");
        equal(this.issueType.val(), "4", "project [id=10240] doesn't have an issue type [id=10] so the default should be selected");
        this.project.val("10000").trigger("change");
        equal(this.issueType.val(), "4", "project [id=10000] has an issue type [id=4] so should be selected");
    });
});
