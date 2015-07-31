;AJS.test.require(["jira.webresources:license-roles"], function () {
    require(["underscore", "backbone", "jquery"], function (_, Backbone, $) {

        var Bus = function () {
            return  _.extend({}, Backbone.Events);
        };

        var format = function () {
            return _.toArray(arguments).join(",");
        };

        var GroupDescriptor = function (options) {
            this.options = options;
            this.items = [];
        };

        _.extend (GroupDescriptor.prototype, {
            addItem: function (item) {
                this.items.push(item);
            },
            assertDescriptor: function (total, groups) {
                equal(this.options.weight, 0, "Correct Weight");
                equal(this.items.length, groups.length, "There should be " + groups.length + "items.");
                for (var i = 0; i < this.items.length; i++) {
                    this.items[i].assertDescriptor(groups[i]);
                }
                if (total == groups.length) {
                    ok(_.isUndefined(this.options.label), "No label specified");
                } else {
                    var expected = format("licenserole.configuration.groups.partial", groups.length, total);
                    equal(this.options.label, expected, "Label indicating partial results.");
                }
            }
        });

        var ItemDescriptor = function (options) {
            this.options = options;
        };

        _.extend(ItemDescriptor.prototype, {
            assertDescriptor: function (group) {
                equal(this.options.value, group, "Value should be " + group);
                equal(this.options.value, group, "Label should be " + group);
                equal(this.options.html, group, "Label should be " + group);
                equal(this.options.highlighted, true, "Item should be highlighted.");
            }
        });

        var SingleSelect = function (options) {
            this.options = options;
        };

        _.extend(SingleSelect.prototype, {
            clear: sinon.mock()
        });

        var SelectorPageObject = function () {
            this.element = $("#qunit-fixture");
        };

        _.extend(SelectorPageObject.prototype, {
            select: function () {
                return this.element.find("select.ss-group-picker");
            },
            val: function (group) {
                var sel = this.select();
                if (sel.find("option[value='" + group + "']").length == 0) {
                    $("<option>").attr("value", group).text(group).appendTo(sel).prop("selected", true);
                }
                sel.trigger("selected");
            },
            loadingVisible: function () {
                return this.element.find(".loading.icon").length > 0;
            }
        });

        var generateRestData = function (total, groups) {
            return {
                total: total,
                groups: _.map(groups, function (group) {
                    return {name: group, html: group};
                })
            }
        };

        var assertDescriptor = function (data, total, groups) {
            equal(data.length, 1, "There is only one element.");
            ok(data[0] instanceof GroupDescriptor, "The element is a GroupDescriptor");
            data[0].assertDescriptor(total, groups);
        };

        module('Group Selector Tests', {
            setup: function () {
                this.context = AJS.test.context();
                this.context.mock('jira/ajs/select/single-select', SingleSelect);
                this.context.mock('jira/ajs/list/group-descriptor', GroupDescriptor);
                this.context.mock('jira/ajs/list/item-descriptor', ItemDescriptor);

                this.parser = new SelectorPageObject();
                this.region = new Backbone.Marionette.Region({
                    el: "#qunit-fixture"
                });

                this.format = AJS.format;
                AJS.format = format;
            },
            teardown: function () {
                AJS.format = this.format;
            }
        });

        test("Constructs single select correctly", function () {
            var Picker = this.context.require("jira/admin/licenseroles/grouppicker");
            var picker = new Picker({});
            this.region.show(picker);

            var select = picker.select;
            var options = select.options;

            equal(options.itemAttrDisplayed, "label", "Displaying the label.");
            equal(options.showDropdownButton, true, "Showing the dropdown.");
            ok(options.element.index(this.parser.select()) >= 0, "Element is the select list.");

            var ajax = options.ajaxOptions;

            deepEqual(ajax.data("query"), {query: "query"}, "Generate correct AJAX GET parameters.");
            equal(ajax.url, contextPath + "/rest/api/2/groups/picker", "Calls the right REST resource.");
            equal(ajax.query, true, "Queries the server on each keystroke.");
        });

        var testFormatResponse = function (callback) {
            var Picker = this.context.require("jira/admin/licenseroles/grouppicker");
            var picker = new Picker();
            this.region.show(picker);

            var formatResponse = picker.select.options.ajaxOptions.formatResponse;
            callback.call(this, formatResponse, picker);
        };

        test("formatResponse parses AJAX full response correctly", function () {
            testFormatResponse.call(this, function (formatResponse) {
                var data = formatResponse(generateRestData(2, ["jira-users", "jira-developers"]));
                assertDescriptor(data, 2, ["jira-users", "jira-developers"]);
            });
        });

        test("formatResponse parses partial AJAX response correctly", function () {
            testFormatResponse.call(this, function (formatResponse) {
                var data = formatResponse(generateRestData(5, ["jira-users", "jira-developers"]));
                assertDescriptor(data, 5, ["jira-users", "jira-developers"]);
            });
        });

        test("formatResponse excludes groups", function () {
            testFormatResponse.call(this, function (formatResponse, picker) {
                picker.excludeGroups("jira-users");
                var data = formatResponse(generateRestData(2, ["jira-users", "jira-developers"]));
                assertDescriptor(data, 1, ["jira-developers"]);
            });
        });

        test("formatResponse includes groups", function () {
            testFormatResponse.call(this, function (formatResponse, picker) {
                picker.excludeGroups("jira-users");
                picker.includeGroups("jira-users", "jira-administrators");

                var data = formatResponse(generateRestData(2, ["jira-users", "jira-developers"]));
                assertDescriptor(data, 2, ["jira-users", "jira-developers"]);
            });
        });

        test("formatResponse excludes groups partial", function () {
            testFormatResponse.call(this, function (formatResponse, picker) {
                picker.excludeGroups("jira-users");

                var data = formatResponse(generateRestData(5, ["jira-users", "jira-developers"]));
                assertDescriptor(data, 4, ["jira-developers"]);
            });
        });

        test("Updating single select triggers selectGroup event on bus", function () {
            var Picker = this.context.require("jira/admin/licenseroles/grouppicker");
            var bus = new Bus();
            var picker = new Picker({
                bus: bus
            });
            this.region.show(picker);

            var spy = this.spy();
            bus.on("selectGroup", spy);

            this.parser.val("jira-users");

            ok(spy.calledWith("jira-users"), "'selectGroup' Event triggered with right group.");
            ok(picker.select.clear.calledOnce, "Group selection cleared after event.");
        });

        asyncTest("test loading indicator shows and hides", function (assert) {
            var Picker = this.context.require("jira/admin/licenseroles/grouppicker");
            var picker = new Picker();
            this.region.show(picker);

            var test = this;

            //The show is delayed by 100ms so we must wait for it.
            picker.showLoading();
            window.setTimeout(function () {
                assert.ok(test.parser.loadingVisible(), "Loading indicator should be visible after 100ms.");
                picker.hideLoading();
                assert.ok(!test.parser.loadingVisible(), "Loading indicator should be hidden.");

                //Restart the tests.
                start();
            }, 150);
        });
    });

    require(["underscore", "backbone", "jquery"], function (_, Backbone, $) {
        var GroupSelector = Backbone.Marionette.ItemView.extend({
            initialize: function () {
                this.exclude = [];
                this.loading = 0;
            },
            excludeGroups: function () {
                this.exclude = _.union(this.exclude, _.toArray(arguments));
            },
            includeGroups: function () {
                this.exclude = _.difference(this.exclude, _.toArray(arguments));
            },
            template: function (data) {
                return $("<input>").data("view", data.view);
            },
            ui: {
                input: "input"
            },
            events: {
                "newGroup input": "_toAdd"
            },
            _toAdd: function () {
                this.options.bus.trigger("selectGroup", this.ui.input.val());
            },
            serializeData: function() {
                return {
                    view: this
                }
            },
            showLoading: function () {
                this.loading++;
                return this;
            },
            hideLoading: function () {
                this.loading--;
                return this;
            },
            isLoading: function () {
                return this.loading > 0;
            }
        });

        var EditorPageObject = function () {
            this.element = $("#qunit-fixture");
        };

        _.extend(EditorPageObject.prototype, {
            name: function () {
                return this.element.find("h2").text();
            },
            groups: function () {
                var page = this;
                return this.element.find("td.license-role-name").map(function () {
                    return page._toName($(this))
                }).get();
            },
            primary: function () {
                var primary = this.element.find(".license-role-primary input:checked");
                if (primary) {
                    return this._toName(primary);
                } else {
                    return null;
                }
            },
            deleteable: function () {
                var page = this;
                return this.element.find("a.license-role-remove").map(function () {
                    return page._toName($(this))
                }).get();
            },
            addGroup: function (group) {
                var addGroupElement = this.element.find('.license-role-selector-container input');
                addGroupElement.val(group).trigger('newGroup');
                return this;
            },
            removeGroup: function (group) {
                var del = this._toRow(group).find("a.license-role-remove");
                if (!del.length) {
                    throw "Not allowed to delete group '" + group + "'."
                } else {
                    del.click();
                }
                return this;
            },
            setPrimary: function (group) {
                this._toRow(group).find(".license-role-primary input").click();
                return this;
            },
            _toRow: function (group) {
                var page = this;
                var element = this.element.find("td.license-role-name").filter(function () {
                    return page._toName($(this)) == group;
                });

                if (!element.length) {
                    throw "Unable to find group '" + group + "'.";
                } else {
                    return element.closest("tr");
                }
            },
            _toName: function (el) {
                if (el.hasClass(".license-role-name")) {
                    return el.text();
                } else {
                    var name = el.closest("tr").find(".license-role-name");
                    if (name.length) {
                        return name.text();
                    } else {
                        return null;
                    }
                }
            },
            emptyMessageShowing: function () {
                return !!this.element.find(".license-role-empty").length;
            },
            getExcludedGroups: function () {
                return this._getGroupSelector().exclude;
            },
            isLoading: function () {
                return this._getGroupSelector().isLoading();
            },
            _getGroupSelector: function () {
                var addGroupElement = this.element.find('.license-role-selector-container input');
                return addGroupElement.data("view");
            }
        });

        module('Role Editor Tests', {
            setup: function () {
                this.context = AJS.test.context();
                this.context.mock('jira/admin/licenseroles/grouppicker', GroupSelector);

                this.parser = new EditorPageObject();
                this.region = new Backbone.Marionette.Region({
                    el: "#qunit-fixture"
                });
            }
        });

        test("Renders correct view with no primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two", "three"]}
            });

            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "The groups are rendered correctly.");
            deepEqual(this.parser.deleteable(), ["one", "two", "three"], "Should be able to delete all groups.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Not able to select the current groups.");
            ok(this.parser.primary() === null, "No primary rendered");
        });

        test("Renders correct view with primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two", "three"], primaryGroup: "two"}
            });

            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "The groups are rendered correctly.");
            deepEqual(this.parser.deleteable(), ["one", "three"], "Able to delete non primary groups.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Not able to select the current groups.");
            ok(this.parser.primary() === "two", "Primary correctly rendered.");

        });

        test("Add group correctly adds group to the UI without primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one"]},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one"], "Not able to select the current groups.");
            deepEqual(this.parser.deleteable(), ["one"], "Should be able to delete all groups.");
            ok(this.parser.primary() === null, "No primary rendered");

            this.parser.addGroup("three");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "three"], "New group correctly rendered.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "three"], "Not able to select the new groups.");
            deepEqual(this.parser.deleteable(), ["one", "three"], "New group should be deletable.");
            ok(this.parser.primary() === null, "No primary rendered");
            ok(setRole.calledWith(["one", "three"], null), "Change persisted to the server.");
        });

        test("Add group correctly adds group to the UI with primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two"], primaryGroup: "two"},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two"], "Not able to select initial groups.");
            deepEqual(this.parser.deleteable(), ["one"], "Able to delete non primary groups.");
            ok(this.parser.primary(), "two", "Primary rendered.");

            this.parser.addGroup("three");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "New group correctly rendered.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Not able to select the new groups.");
            deepEqual(this.parser.deleteable(), ["one", "three"], "New group should be deletable.");
            ok(this.parser.primary(), "two", "Primary rendered.");
            ok(setRole.calledWith(["one", "two", "three"], "two"), "Change persisted to the server.");
        });

        test("Remove group correctly removes group with primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two"], primaryGroup: "two"},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two"], "Not able to select initial groups.");
            deepEqual(this.parser.deleteable(), ["one"], "Able to delete non primary groups.");
            equal(this.parser.primary(), "two", "Primary rendered.");

            this.parser.removeGroup("one");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["two"], "Group removed from UI.");
            deepEqual(this.parser.getExcludedGroups(), ["two"], "Now able to select deleted groups.");
            deepEqual(this.parser.deleteable(), [], "No groups deletable.");
            equal(this.parser.primary(), "two", "Primary rendered.");
            ok(setRole.calledWith(["two"], "two"), "Change persisted to the server.");
        });

        test("Remove group correctly removes group without primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two", "three"]},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Not able to select initial groups.");
            deepEqual(this.parser.deleteable(), ["one", "two", "three"], "Able to delete all groups.");
            ok(this.parser.primary() === null, "No primary rendered.");

            this.parser.removeGroup("one");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["two", "three"], "Group removed from UI.");
            deepEqual(this.parser.getExcludedGroups(), ["two", "three"], "Now able to select deleted groups.");
            deepEqual(this.parser.deleteable(), ["two", "three"], "Remaining groups deletable.");
            ok(this.parser.primary() === null, "No primary rendered.");
            ok(setRole.calledWith(["two", "three"], null), "Change persisted to the server.");
        });

        test("Set primary group correctly sets primary when no current primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two", "three"]},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Not able to select initial groups.");
            deepEqual(this.parser.deleteable(), ["one", "two", "three"], "Able to delete all groups.");
            ok(this.parser.primary() === null, "No primary rendered.");

            this.parser.setPrimary("one");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two", "three"], "Groups remain same after operation.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two", "three"], "Still not able to select groups in role.");
            deepEqual(this.parser.deleteable(), ["two", "three"], "Only non-primary groups deletable.");
            equal(this.parser.primary(), "one", "Primary has been rendered");
            ok(setRole.calledWith(["one", "two", "three"], "one"), "Change persisted to the server.");
        });

        test("Set primary group correctly sets primary when there is a current primary", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: ["one", "two"], primaryGroup: "two"},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two"], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two"], "Not able to select initial groups.");
            deepEqual(this.parser.deleteable(), ["one"], "Able to delete non-primay groups.");
            equal(this.parser.primary(), "two", "Initial primary rendered.");

            this.parser.setPrimary("one");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["one", "two"], "Groups remain same after operation.");
            deepEqual(this.parser.getExcludedGroups(), ["one", "two"], "Still not able to select groups in role.");
            deepEqual(this.parser.deleteable(), ["two"], "Only non-primary groups deletable.");
            equal(this.parser.primary(), "one", "Primary has been rendered");
            ok(setRole.calledWith(["one", "two"], "one"), "Change persisted to the server.");
        });

        test("No groups renters empty view and allows creation of new rows.", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: []},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), [], "The groups are rendered correctly.");
            deepEqual(this.parser.getExcludedGroups(), [], "Able to select all groups.");
            ok(this.parser.emptyMessageShowing(), "Empty message should be showing.");

            this.parser.addGroup("first");

            equal(this.parser.name(), "RoleId", "The Role name is rendered correctly.");
            deepEqual(this.parser.groups(), ["first"], "First group added to UI.");
            deepEqual(this.parser.getExcludedGroups(), ["first"], "Not able to select initial group.");
            deepEqual(this.parser.deleteable(), [], "First group is primary and cannot be deleted.");
            equal(this.parser.primary(), "first", "First group is created as primary.");
            ok(setRole.calledWith(["first"], "first"), "Change persisted to the server.");
        });

        test("Loading indicator shows when loading.", function () {
            var RoleEditor = this.context.require("jira/admin/licenseroles/roleeditor");
            var def = $.Deferred();
            var setRole = this.stub().returns(def);
            var roleEditor = new RoleEditor({
                data: {id: "roleid", name: "RoleId", groups: []},
                setRole: setRole
            });
            this.region.show(roleEditor.view);

            //Add a group.
            this.parser.addGroup("first");
            ok(this.parser.isLoading(), "Loading while PUT out.");
            def.resolve([]);
            ok(!this.parser.isLoading(), "Not loading after PUT finished.");
        });
    });

    require(["underscore", "backbone", "jquery"], function (_, Backbone, $) {

        var ErrorDialog = function (options) {
            this.shown = false;
            this.options = options;

            ErrorDialog.last = this;

        };

        _.extend(ErrorDialog.prototype, {
            show: function () {
                this.shown = true;
            },
            isShown: function () {
                return this.shown;
            },
            getOptions: function () {
                return this.options;
            },
            getXhr: function () {
                return this.options.xhr;
            }
        });

        ErrorDialog.openErrorDialogForXHR = function (xhr) {
            return new ErrorDialog({
                xhr: xhr
            });
        };

        var format = function () {
            return _.toArray(arguments).join(",");
        };

        var View = Backbone.Marionette.ItemView.extend({
            template: function (data) {
                return $("<div>")
                        .text(JSON.stringify(data.view.model.toJSON()))
                        .addClass("role-editor-test")
                        .data("view", data.view);
            },
            serializeData: function () {
                return {
                    view: this
                }
            },
            setGroups: function (groups, primary) {
                return this.options.setRole(groups, primary)
            }
        });

        var mockAjax = function () {
            var mock = function (options, dialog) {
                var def = $.Deferred();
                def.options = options;
                def.dialog = dialog;

                mock.calls.push(def);
                mock.callCount++;
                mock.lastCall = def;

                return def.promise();
            };

            mock.reset = function () {
                mock.calls = [];
                mock.callCount = 0;
                delete mock.lastCall;

                return this;
            };

            return mock.reset();
        };

        var LicenseRoleEditor = function(options) {
            this.view = new View({
                model: new Backbone.Model(options.data),
                setRole: options.setRole
            });
        };

        var EditorPageObject = function () {
            this.element = $("#qunit-fixture");
        };

        _.extend(EditorPageObject.prototype, {
            isNoRoleMessageVisible: function () {
                return !!this.element.find("#license-role-none").length;
            },
            loadingVisible: function () {
                return !!this.element.find("#license-role-initial-load").length;
            },
            roles: function () {
                return this.element.find("div.role-editor-test").map(function () {
                    return JSON.parse($(this).text())
                }).get();
            },
            views: function () {
                return this.element.find("div.role-editor-test").map(function () {
                    return $(this).data("view");
                }).get();
            }
        });

        var parseActualPutOptions = function (options) {
            options.data = JSON.parse(options.data);
            return options;
        };

        var expectedPutOptions = function (roleId, groups, primary) {
            return {
                url: contextPath + "/rest/api/2/licenserole/" + roleId,
                dataType: "json",
                type: "PUT",
                contentType: "application/json",
                data: {
                    groups: groups,
                    primaryGroup: primary
                }
            };
        };

        var assertPut = function (roleId, groups, primary) {
            deepEqual(parseActualPutOptions(this.ajax.lastCall.options),
                    expectedPutOptions(roleId, groups, primary), "Put for role called with correct arguments.");
        };

        var assertGeneralErrorDisplayed = function () {
            ok(ErrorDialog.last, "Error displayed.");
            deepEqual(ErrorDialog.last.options, {message: "licenserole.configuration.out.of.date", mode: "warning"}, "Error dialog created with correct options.");
            ok(ErrorDialog.last.isShown(), "Error dialog should be shown.");
        };

        var assertXhrErrorDisplayed = function (rejected) {
            ok(ErrorDialog.last, "Error displayed.");
            deepEqual(ErrorDialog.last.getXhr(), rejected, "Error dialog should be passed rejected data.");
        };

        var assertNoErrorDisplayed = function () {
            ok(!ErrorDialog.last, "No error should have been displayed.");
        };

        var assertDone = function(def, arguments) {
            equal(def.state(), "resolved", "Deferred resolved?");

            var spy = this.spy();
            def.done(spy);

            ok(spy.called, "Done called.");
            deepEqual(spy.firstCall.args, arguments, "Callback triggered with correct arguments.");
        };

        var assertFail = function(def, arguments) {
            equal(def.state(), "rejected", "Deferred rejected?");

            var spy = this.spy();
            def.fail(spy);

            ok(spy.called, "Fail called.");
            deepEqual(spy.firstCall.args, arguments, "Callback triggered with correct arguments.");
        };

        var assertAbort = function (def) {
            assertFail.call(this, def, [null, "abort"]);
        };

        var assertPending = function (def) {
            equal(def.state(), "pending", "Deferred pending?");
        };

        var createEditor = function () {
            var roles = [
                {id: 'b', name: 'b', groups: ["c", "a"], primaryGroup: "a"},
                {id: 'a', name: 'a', groups: ["a", "z"]}
            ];

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            var editor = new RolesEditor({
                el: this.element
            });

            this.ajax.calls[0].resolve(roles);
            return editor;
        };

        module('Roles Editor Tests', {
            setup: function () {
                ErrorDialog.last = null;

                this.context = AJS.test.context();
                this.ajax = mockAjax();

                this.context.mock('jira/ajs/ajax/smart-ajax/web-sudo', {
                    makeWebSudoRequest: this.ajax
                });
                this.context.mock("jira/dialog/error-dialog", ErrorDialog);
                this.context.mock('jira/admin/licenseroles/roleeditor', LicenseRoleEditor);

                this.parser = new EditorPageObject();
                this.element = $("#qunit-fixture");

                this.ounload = window.onbeforeunload;
                window.onbeforeunload = null;

                this.oformat = AJS.format;
                AJS.format = format;

                this.assertFail = assertFail;
                this.assertAbort = assertAbort;
                this.assertDone = assertDone;
                this.assertGeneralErrorDisplayed = assertGeneralErrorDisplayed;
                this.assertXhrErrorDisplayed = assertXhrErrorDisplayed;
                this.assertNoErrorDisplayed = assertNoErrorDisplayed;
                this.createEditor = createEditor;
                this.assertPut = assertPut;
                this.assertPending = assertPending;

            },
            teardown: function () {
                AJS.format = this.oformat;
                window.onbeforeunload = this.ounload;
            }
        });

        test("Empty message shown when no roles installed", function () {

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            new RolesEditor({
                el: this.element
            });

            this.ajax.calls[0].resolve([]);

            ok(this.parser.isNoRoleMessageVisible(), "No role message is visible.");
        });

        test("Nothing happens when element no passed.", function () {

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            new RolesEditor({
                ajax: this.ajax
            });

            ok(!this.ajax.called, "Don't trigger a render if nothing is going to display.");
        });

        test("Nothing happens when empty jQuery set passed.", function () {

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            new RolesEditor({
                $el: $()
            });

            ok(!this.ajax.called, "Don't trigger a render if nothing is going to display.");
        });

        test("Loading indicator is only shown while loading.", function () {

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            new RolesEditor({
                el: this.element
            });

            ok(this.parser.loadingVisible(), "Loading indicator is visible during load.");
            this.ajax.calls[0].resolve([]);
            ok(!this.parser.loadingVisible(), "Loading indicator is hidden after load.");
        });

        test("Roles rendered correctly in ABC order", function () {

            this.createEditor();

            var expectedRoles = [
                {id: 'a', name: 'a', groups: ['a', 'z'], primaryGroup: null},
                {id: 'b', name: 'b', groups: ['a', 'c'], primaryGroup: 'a'}
            ];

            deepEqual(this.parser.roles(), expectedRoles, "Roles rendered on the page in correct order.");

            var expectedAjaxOptions = {
                url: contextPath + "/rest/api/2/licenserole",
                dataType: "json"
            };

            deepEqual(this.ajax.calls[0].options, expectedAjaxOptions, "Get method called with correct AJAX options.");
        });

        test("Error dialog triggered when error occurs while trying to load roles.", function () {

            var error = {msg: "This is an error"};

            var RolesEditor = this.context.require("jira/admin/licenseroles/roleseditor");
            new RolesEditor({
                el: this.element
            });

            this.ajax.calls[0].reject(error);

            ok(this.parser.loadingVisible(), "Loading should remain visible after the error.");
            this.assertXhrErrorDisplayed(error);
        });

        test("Updating roles triggers AJAX call to server", function () {
            this.createEditor();

            var views = this.parser.views();
            views[0].setGroups(['k', 'i', 'l'], 'l');

            this.ajax.lastCall.resolve({groups:[]});

            this.assertPut("a", ["k", "i", "l"], "l");
            this.assertNoErrorDisplayed();
        });

        test("Error while updating roles triggers error dialog.", function () {
            this.createEditor();

            var error = "Error";
            var views = this.parser.views();
            views[0].setGroups(['k', 'i', 'l'], 'l');

            this.ajax.lastCall.reject(error);
            this.assertXhrErrorDisplayed(error);
        });

        test("400 Error while updating roles triggers error dialog.", function () {
            this.createEditor();

            var xhr = {
                status: 400
            };

            var views = this.parser.views();
            views[0].setGroups(['k', 'i', 'l'], 'l');

            this.ajax.lastCall.reject(xhr, "failed");
            this.assertGeneralErrorDisplayed();
        });

        test("Updating queues put requests on slow AJAX response.", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            //Trigger the first PUT. This one will start executing.
            view.setGroups(['a'], null);

            //Trigger the second PUT. This one will be ignored (eventually) because only one PUT is queued.
            view.setGroups(['b'], null);

            //Trigger the third PUT. This is the new one to be queued.
            view.setGroups(['c'], null);

            //First call will execute.
            equal(ajax.callCount, 2, "AJAX request batched.");
            this.assertPut("b", ["a"], null);

            ajax.lastCall.resolve({groups: []});

            //This should trigger the third call (i.e. the second call is skipped because it is too slow)
            equal(ajax.callCount, 3, "AJAX request un-batched.");

            this.assertPut("b", ["c"], null);
            this.assertNoErrorDisplayed();
        });

        test("Updating queues put requests on slow AJAX response multiple roles.", function () {
            this.createEditor();

            var views = this.parser.views(), viewa = views[0], viewb = views[1], ajax = this.ajax;

            //Trigger the first PUT. This one will start executing.
            viewa.setGroups(['a'], null);

            //Trigger the second PUT.
            viewb.setGroups(['b'], null);

            //Trigger the third PUT. This is the new one to be queued.
            viewa.setGroups(['c'], null);

            //First call will execute.
            equal(ajax.callCount, 2, "AJAX request batched.");
            this.assertPut("a", ["a"], null);

            //This should trigger the second call
            ajax.lastCall.resolve({groups: []});

            equal(ajax.callCount, 3, "AJAX request batched.");
            this.assertPut("b", ["b"], null);

            ajax.lastCall.resolve({groups: []});

            equal(ajax.callCount, 4, "AJAX request batched.");
            this.assertPut("a", ["c"], null);

            this.assertNoErrorDisplayed();
        });

        test("First error aborts all current and subsequent requests.", function () {
            this.createEditor();

            var views = this.parser.views(), viewa = views[0], viewb = views[1], ajax = this.ajax;

            //Trigger the first PUT. This one will start executing.
            var result1 = viewa.setGroups(['a'], null);

            //Trigger the second PUT.
            var result2 = viewb.setGroups(['b'], null);

            //Trigger the third PUT. This is the new one to be queued.
            var result3 = viewa.setGroups(['c'], null);

            //First call will execute.
            equal(ajax.callCount, 2, "AJAX request batched.");
            this.assertPut("a", ["a"], null);

            //This should trigger the second call
            ajax.lastCall.reject("Error");

            this.assertFail(result1, ["Error"]);
            this.assertAbort(result2);
            this.assertAbort(result3);

            //This should abort right now.
            var result4 = viewa.setGroups(['c'], null);
            this.assertAbort(result4);
        });

        test("Queued requests are reject with 'abort' code when not run.", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            //Trigger the first PUT. This one will start executing.
            var result1 = view.setGroups(['a'], null);
            this.assertPending(result1);

            //Trigger the second PUT. This one will be ignored (eventually) because only one PUT is queued.
            var result2 = view.setGroups(['b'], null);

            this.assertPending(result1);
            this.assertPending(result2);

            //Trigger the third PUT. This is the new one to be queued.
            var result3 = view.setGroups(['c'], null);

            this.assertPending(result1);
            this.assertPending(result3);
            this.assertAbort(result2);
            this.assertNoErrorDisplayed();

            //This should trigger the third call (i.e. the second call is skipped because it is too slow)
            ajax.lastCall.resolve({groups: []});

            this.assertDone(result1, [{groups: []}]);
            this.assertPending(result3);
            this.assertNoErrorDisplayed();

            ajax.lastCall.resolve("Good Data");

            this.assertDone(result3, ["Good Data"]);
            this.assertNoErrorDisplayed();
        });

        test("Trying to leave page while updating gives warning to user until AJAX finishes with success", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            view.setGroups(['a'], null);
            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX still active.");
            ajax.lastCall.resolve({groups: []});
            ok(!window.onbeforeunload(), "Able to leave page when AJAX finished.");
        });

        test("Trying to leave page while updating gives warning to user until AJAX finishes with error", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            view.setGroups(['a'], null);
            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX still active.");
            ajax.lastCall.reject("Error");
            ok(!window.onbeforeunload(), "Able to leave page when AJAX finished.");
        });

        test("Trying to leave page while updating gives warning to user when request queued until error.", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            view.setGroups(['a'], null);
            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX still active.");
            view.setGroups(['a'], null);

            ajax.lastCall.resolve({groups: []});

            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX queued.");

            ajax.lastCall.reject("error");

            ok(!window.onbeforeunload(), "Able to leave page when AJAX finished.");
        });

        test("Trying to leave page while updating is okay if websudo was triggered.", function () {
            this.createEditor();

            var view = this.parser.views()[1], ajax = this.ajax;

            var result1 = view.setGroups(['a'], null);
            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX still active.");

            //Trigger the websudo dialog.
            ajax.lastCall.dialog.beforeShow();

            //Can now leave the page because websudo has been triggered.
            ok(!window.onbeforeunload(), "Able to leave page when AJAX finished.");

            //All requests are aborted if someone is about to leave page.
            this.assertAbort(result1);
        });

        test("Still calls old onbeforeunload function.", function () {
            var error = "Error";
            var unload = window.onbeforeunload = this.stub().returns(error);

            this.createEditor();
            var view = this.parser.views()[1], ajax = this.ajax;

            view.setGroups(['a'], null);

            equal(window.onbeforeunload(), error, "Calls old onbeforeunload first.");
            unload.returns(void 0);

            equal(window.onbeforeunload(), "licenserole.configuration.active.ajax", "Warn user about leaving page while AJAX still active.");
            ajax.lastCall.resolve({groups: []});
            ok(!window.onbeforeunload(), "Able to leave page when AJAX finished.");
        });
    });
});