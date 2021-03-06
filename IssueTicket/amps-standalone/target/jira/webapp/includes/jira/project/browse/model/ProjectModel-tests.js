AJS.test.require("jira.webresources:browseprojects", function() {
    require(["jira/project/browse/projectcollection"], function (ProjectCollection) {
        module("ProjectCollection", {
            setup: function ()
            {
                this.firstCat = {
                    get: sinon.stub().withArgs('name').returns('first category')
                };

                this.secondCat = {
                    get: sinon.stub().withArgs('name').returns('second category')
                };

                var catGetter = sinon.stub();
                catGetter.withArgs('first').returns(this.firstCat);
                catGetter.withArgs('second').returns(this.secondCat);


                this.catCollection = {
                    get: catGetter
                };

                this.projects = [
                    {id: 'proj1', projectCategoryId: 'first'},
                    {id: 'proj2', projectCategoryId: 'second'},
                    {id: 'proj3', projectCategoryId: 'third'},
                    {id: 'proj4'}
                ];

                this.collection = new ProjectCollection(this.projects, {
                    categories: this.catCollection,
                    mode: 'client'
                });
            }
        });

        test("should provide category name for known categories", function() {

            deepEqual(this.collection.get('proj1').toJSON(),
                {id: 'proj1', projectCategoryId: 'first', projectCategoryName: 'first category'});

            deepEqual(this.collection.get('proj2').toJSON(),
                    {id: 'proj2', projectCategoryId: 'second', projectCategoryName: 'second category'});

        });

        test("should not include unknown categories", function() {
            deepEqual(this.collection.get('proj3').toJSON(),
                    {id: 'proj3', projectCategoryId: 'third'});

            deepEqual(this.collection.get('proj4').toJSON(),
                    {id: 'proj4'});
        });

        test('should not include category when out of collection', function() {
            var project = new this.collection.model({id: 'project', projectCategoryId: 'first'});

            deepEqual(project.toJSON(), {id: 'project', projectCategoryId: 'first'});
        })
    })
});