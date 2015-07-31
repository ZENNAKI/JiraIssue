require(['jira/project/browse/app', 'jquery'], function(App, $) {
    $(function() {
        var $browseContainer = $('#browse-projects-page');
        if ($browseContainer.length) {
            App.start({
                projects: WRM.data.claim('com.atlassian.jira.project.browse:projects'),
                categories: WRM.data.claim('com.atlassian.jira.project.browse:categories'),
                selectedCategory: WRM.data.claim('com.atlassian.jira.project.browse:selectedCategory'),
                container: $browseContainer
            });
        }
    });
});