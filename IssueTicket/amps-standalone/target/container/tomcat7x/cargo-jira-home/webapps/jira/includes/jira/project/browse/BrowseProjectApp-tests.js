AJS.test.require('jira.webresources:browseprojects', function() {
    require(['underscore', 'backbone', 'jquery'], function(_, Backbone, $) {

        function generateCategories(number) {
            var categories = [];
            for (var i = 1; i <= number; i++) {
                categories.push({
                    name: 'Cat '+i,
                    id: "cat"+i,
                    description: ''
                })
            }
            return categories;
        }

        function generateProjects(number, categories) {
            var projects = [];
            var category;
            for (var i = 1; i <= number; i++) {
                category = (i-1) % categories.length;

                projects.push({
                    id: 'p'+i,
                    name: 'Project '+i,
                    projectCategoryId: categories[category].id,
                    key: 'PRJ'+i,
                    hasDefaultAvatar: true,
                    lead: 'admin'
                })
            }
            return projects;
        }

        module('BrowseProjectApp', {
            setup: function() {
                this.context = AJS.test.context();
                this.navigation = this.context.require('jira/util/navigation');
                sinon.stub(this.navigation, 'navigate');
                this.navigation.pushStateSupported = true;
                this.context.mock('jira/util/navigation', this.navigation);
                this.userUtils = {
                    username: sinon.stub().returns('admin')
                };
                this.context.mock('jira/util/users/logged-in-user', this.userUtils);

                this.$container = $(
                    '<div>' +
                        '<div class="aui-page-panel-nav"></div>' +
                        '<div class="aui-page-panel-content">' +
                            '<div class="module">' +
                                '<div class="mod-header" id="filter-projects"></div>' +
                                '<div class="mod-content" id="projects"></div>' +
                            '</div>' +
                            '<div id="pagination"></div>' +
                        '</div>' +
                    '</div>'
                ).appendTo($('#qunit-fixture'));

                this.BrowseProjectsApp = this.context.require('jira/project/browse/app');
                this.categories = generateCategories(5);
                this.projects = generateProjects(100, this.categories);
                this.categories.push({name: 'All Projects', id: 'all'});
                this.changeContainsFilter = function(filter) {
                    var clock = sinon.useFakeTimers();
                    this.$container.find('#project-filter-text').val(filter).trigger('change');
                    clock.tick(310);
                };
                this.startApplication = function(selectedCategory, projects, categories) {
                    projects = projects || this.projects;
                    categories = categories || this.categories;

                    this.BrowseProjectsApp.start({
                        projects: projects,
                        categories: categories,
                        container: this.$container,
                        selectedCategory: selectedCategory
                    });
                }
            }
        });

        test('should select default category on start', function() {
            this.startApplication("cat1");

            equal(this.$container.find('.projects-list tr:first td:nth-child(5) a').text(), "Cat 1");
            equal(this.$container.find('.projects-list tr').length, 20);
        });

        test('should update UI with selected category', function() {
            this.startApplication("all");

            this.$container.find('.projects-list tr:nth-child(2) td:nth-child(5) a').click();

            equal(this.$container.find('.aui-page-panel-nav #cat2-panel-tab').hasClass('active'), true);
            equal(this.$container.find('#filter-projects h2').text(), 'Cat 2');
        });

        test('should switch pages when clicking on pagination', function() {
            this.startApplication("all");

            equal(this.$container.find('.aui-nav-pagination .aui-nav-selected').text(), "1", "First page is selected");
            equal(this.$container.find('.projects-list tr:first td:nth-child(2) a').text(), "Project 1");
            equal(this.$container.find('.projects-list tr:last td:nth-child(2) a').text(), "Project 25");

            this.$container.find('.aui-nav-pagination a:eq(2)').click();

            equal(this.$container.find('.aui-nav-pagination .aui-nav-selected').text(), "3", "Third page is selected");
            equal(this.$container.find('.projects-list tr:first td:nth-child(2) a').text(), "Project 51");
            equal(this.$container.find('.projects-list tr:last td:nth-child(2) a').text(), "Project 75");
        });

        test('should filter projects when changing criteria', function() {
            this.startApplication("all");

            this.changeContainsFilter('Project 100');

            equal(this.$container.find('.projects-list tr:first td:nth-child(2) a').text(), "Project 100");
            equal(this.$container.find('.projects-list tr').length, 1);
        });

        test('should filter by category on click', function() {
            this.startApplication("all");

            this.$container.find('.aui-page-panel-nav #cat3-panel-tab-lnk').click();
            equal(this.$container.find('.projects-list tr:first td:nth-child(5) a').text(), "Cat 3");
            equal(this.$container.find('.projects-list tr').length, 20);
        });

        test('should update url with current state', function() {
            this.startApplication("all");

            this.$container.find('.aui-nav-pagination a:eq(1)').click();
            sinon.assert.calledOnce(this.navigation.navigate);
            sinon.assert.calledWith(this.navigation.navigate, {selectedCategory: 'all', contains: '', page: 2});

            this.changeContainsFilter('Project 100');

            sinon.assert.calledTwice(this.navigation.navigate);
            sinon.assert.calledWith(this.navigation.navigate, {selectedCategory: 'all', contains: 'Project 100'});

            this.$container.find('.aui-page-panel-nav #cat3-panel-tab-lnk').click();
            sinon.assert.calledThrice(this.navigation.navigate);
            sinon.assert.calledWith(this.navigation.navigate, {selectedCategory: 'cat3', contains: 'Project 100'});

        });

        test("should diplay message when there no projects match criteria", function() {
            this.startApplication("all");

            this.changeContainsFilter('asdef');

            equal(this.$container.find('.projects-list tr').length, 1);
            equal(this.$container.find('.projects-list .no-results').length, 1);

        });

        test('should hide sidebar for logged out user when there is only one category', function() {
            this.userUtils.username.returns('');

            this.startApplication(
                    "one",
                    [{id: 'first', projectCategoryId: 'one', key: 'frst'}],
                    [{id: 'one', name: 'One'}]
            );

            equal(this.$container.find('.aui-page-panel-nav').hasClass('hidden'), true);
            equal(this.$container.find('.aui-page-panel-nav').children().length, 0);
        });

        test('should still show sidebar for logged in user when there is only one category', function() {
            this.startApplication(
                    "one",
                    [{id: 'first', projectCategoryId: 'one', key: 'frst'}],
                    [{id: 'one', name: 'One'}]
            );

            equal(this.$container.find('.aui-page-panel-nav').hasClass('hidden'), false);
            equal(this.$container.find('.aui-page-panel-nav').children().length, 1);
        });
    });
});