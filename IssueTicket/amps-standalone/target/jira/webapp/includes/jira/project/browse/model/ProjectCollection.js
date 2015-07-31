define('jira/project/browse/projectcollection',
    ['backbone', "jira/project/browse/projectmodel"],
    function(Backbone, ProjectModel) {
        'use strict';

        return Backbone.PageableCollection.extend({
            model: ProjectModel,
            initialize: function initialize(items, options) {
                this.originalCollection = items;
                this.categories = options.categories;
            }
        })
    }
);