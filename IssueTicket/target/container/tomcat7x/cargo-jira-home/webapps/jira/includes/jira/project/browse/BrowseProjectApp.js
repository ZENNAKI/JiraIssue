define('jira/project/browse/app',
    ['jquery', 'underscore', 'backbone',
        'jira/project/browse/layout',
        'jira/project/browse/tabsview',
        'jira/project/browse/projectcollection',
        'jira/project/browse/projectcollectionview',
        'jira/project/browse/paginationview',
        'jira/project/browse/filtermodel',
        'jira/project/browse/filterview',
        'jira/util/navigation',
        'jira/project/browse/categorycollection',
        'jira/util/users/logged-in-user'
    ],
    function($, _, Backbone,
            Layout,
            TabsView,
            ProjectCollection,
            ProjectCollectionView,
            PaginationView,
            FilterModel,
            FilterView,
            Navigation,
            CategoryCollection,
            User
    ) {
        'use strict';

        var application = new Backbone.Marionette.Application();

        application.on('start', function(options) {
            var $el = options.container;

            this.categories = new CategoryCollection(options.categories);
            this.projects = new ProjectCollection(options.projects,{
                mode: 'client',
                state: {
                    pageSize: 25,
                    currentPage: 1
                },
                categories: this.categories
            });

            this.categories.selectCategory(options.selectedCategory);

            this.filter = new FilterModel({
                category: this.categories.getSelected().toJSON()
            }, {
                pageableCollection: this.projects
            });

            this.layout = new Layout({
                el: $el
            });

            this.projectCollectionView = new ProjectCollectionView({
                model: this.filter,
                collection: this.projects
            });

            var categoryChange = function categoryChange(categoryId) {
                var category = application.categories.selectCategory(categoryId);

                if (category) {
                    application.filter.changeCategory(category);
                }
            };

            if (User.username() !== '' || this.categories.length > 1) {
                this.tabsView = new TabsView({
                    collection: this.categories
                });
                this.tabsView.on('category-change', categoryChange);

                this.layout.nav.show(this.tabsView);
            }
            else {
                this.layout.$el.find(this.layout.nav.el).addClass('hidden');
            }

            this.projectCollectionView.on('category-change', categoryChange);

            this.layout.content.show(this.projectCollectionView);
            this.layout.pagination.show(new PaginationView({
                collection: this.projects,
                model: this.filter
            }));
            this.layout.filter.show(new FilterView({
                model: this.filter
            }));

            this.layout.pagination.currentView.on('navigate',function(pageNumber) {
                var params = _.extend(application.filter.getQueryParams(false), {
                    'page': pageNumber
                });
                Navigation.navigate(params);
            });
            this.filter.on('filter', function(params) {
                Navigation.navigate(params);
            });

            var router = new (Backbone.Router.extend({
                initialize: function initialize(){
                    this.route(/(.*)/, 'every');
                }
            }));

            router.on('route:every',function() {
                var page = + Navigation.getParam('page', true) || 1;
                var contains = Navigation.getParam('contains', true) || '';
                var categoryId = Navigation.getParam('selectedCategory') || '';
                var category = application.categories.selectCategory(categoryId);

                application.filter.set('contains', contains, {silent: true});
                if (category !== false)
                    application.filter.set('category', category.toJSON(), {silent: true});
                application.filter.filterCollection();
                application.projects.getPage(page);
                application.layout.filter.currentView.render();
            });

            if (!Backbone.History.started) {
                Backbone.history.start({
                    pushState: Navigation.pushStateSupported,
                    root: Navigation.getBackboneHistoryRoot()
                })
            }

            //rewrite old-style url to new style one:
            if (window.location.hash) {
                var categoryId = window.location.hash.substring(1);
                var category = this.categories.get(categoryId);
                if (category) {
                    categoryChange(categoryId);
                }
            }
        });

        return application;
    });