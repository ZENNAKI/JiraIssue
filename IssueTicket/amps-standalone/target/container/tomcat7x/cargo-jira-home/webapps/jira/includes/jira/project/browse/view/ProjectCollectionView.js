define('jira/project/browse/projectcollectionview',
    ['backbone', 'jquery', 'jira/project/browse/projectview'],
    function(Backbone, $, ProjectView) {
        "use strict";

        return Backbone.Marionette.CompositeView.extend({
            template: JIRA.Templates.Project.Browse.projects,
            itemView: ProjectView,
            emptyView: Backbone.Marionette.ItemView.extend({
                template: JIRA.Templates.Project.Browse.emptyRow,
                onRender: function() {
                    this.unwrapTemplate();
                }
            }),
            itemViewContainer: 'tbody',
            events: {
                'click .category': 'categoryClick'
            },
            onRender: function onRender() {
                this.unwrapTemplate();
            },
            categoryClick: function categoryClick(e) {
                var $link = $(e.currentTarget);
                var id = $link.data('category-id');

                e.preventDefault();
                this.trigger('category-change', id);
            }
        });
    }
);