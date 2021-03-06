;define("jira/admin/licenseroles/grouppicker",
["jquery", "underscore", "backbone", "jira/ajs/select/single-select", "jira/ajs/list/group-descriptor",
 "jira/ajs/list/item-descriptor"],
function ($, _, Backbone, SingleSelect, GroupDescriptor, ItemDescriptor) {
    "use strict";

    var templates = JIRA.Templates.Admin.LicenseRoles;

    /**
     * A `Marionette.ItemView` for a group selector.
     *
     * Its a `SingleSelect` that makes calls to the group picker resource to find the groups.
     *
     * @extends Backbone.Marionette.ItemView
     */
    return Backbone.Marionette.ItemView.extend({
        initialize: function () {
            this._exclude = [];
        },
        onShow: function () {
            this.select = new SingleSelect({
                element: this.ui.groups,
                itemAttrDisplayed: "label",
                showDropdownButton: true,
                ajaxOptions:  {
                    data: function (query) {
                        return {
                            query: query
                        }
                    },
                    url: contextPath + "/rest/api/2/groups/picker",
                    query: true, // keep going back to the server for each keystroke
                    formatResponse: this._format.bind(this)
                }
            });
            this.select.showErrorMessage = $.noop;
        },
        tagName: "div",
        template: templates.groupSingleSelect,
        ui: {
            groups: ".ss-group-picker"
        },
        events: {
            "selected .ss-group-picker": "_changed"
        },
        _changed: function () {
            this.options.bus.trigger("selectGroup", this.ui.groups.val()[0]);
            this.select.clear();
        },
        excludeGroups: function () {
            this._exclude = _.union(this._exclude, _.toArray(arguments));
        },
        includeGroups: function () {
            this._exclude = _.difference(this._exclude, _.toArray(arguments));
        },
        _format: function (data) {
            var descriptorArgs = {weight: 0};
            var exclude = this._exclude;
            var total = data.total;

            var items = [];
            _.each(data.groups, function (group) {
                if (_.contains(exclude, group.name)) {
                    total = total - 1;
                } else {
                    items.push(new ItemDescriptor({
                        value: group.name, // value of item added to select
                        label: group.name, // title of lozenge
                        html: group.html,
                        highlighted: true
                    }));
                }
            });

            if (items.length < total) {
                descriptorArgs.label = AJS.I18n.getText("licenserole.configuration.groups.partial", items.length, total);
            }

            var groupDescriptor = new GroupDescriptor(descriptorArgs);
            _.each(items, function (item) {
                groupDescriptor.addItem(item);
            });

            return [groupDescriptor];
        },
        serializeData: function(){
            return {
                id: _.uniqueId()
            }
        },
        showLoading: function () {
            var instance = this;
            if (this.select && !this._loading) {
                this._loading = $(templates.loading());
                this._timeout = window.setTimeout(function () {
                    instance.ui.groups.before(instance._loading);
                }, 100);
            }
            return this;
        },
        hideLoading: function () {
            if (this._loading) {
                window.clearTimeout(this._timeout);
                this._timeout = null;
                this._loading.remove();
                delete this._loading;
            }
            return this;
        }
    });
});

define("jira/admin/licenseroles/roleeditor",
["jquery", "underscore", "backbone", "jira/admin/licenseroles/grouppicker"],
function ($, _, Backbone, GroupPicker) {
    "use strict";

    var templates = JIRA.Templates.Admin.LicenseRoles;

    var Bus = function () {
        return _.extend(this, Backbone.Events);
    };

    /**
     * Represents a group in a LicenseRole.
     */
    var LicenseRoleGroupModel = Backbone.Model.extend({
        defaults: {
            name: null,
            primary: false
        },
        idAttribute: "name"
    });

    /**
     * Represents the set of groups in a LicenseRole.
     */
    var LicenseRoleGroupCollection = Backbone.Collection.extend({
        model: LicenseRoleGroupModel
    });

    /**
     * Represents a LicenseRole.
     */
    var LicenseRoleModel = Backbone.Model.extend({
        defaults: {
            name: null,
            groups: null
        }
    });

    /**
     * View to render when no groups exist for a LicenseRole.
     */
    var LicenseRoleEditorEmptyRowView = Backbone.Marionette.ItemView.extend({
        template: templates.roleEditorTableEmpty,
        tagName: "tr"
    });

    /**
     * View to render for each group in a LicenseRole.
     */
    var LicenseRoleEditorRowView = Backbone.Marionette.ItemView.extend({
        template: templates.roleEditorRow,
        tagName: "tr",
        events: {
            "click .license-role-remove": "_remove",
            "change .license-role-primary-input": "_primary"
        },
        modelEvents: {
            "change:primary": "render"
        },
        initialize: function (options) {
            this.bus = options.bus;
        },
        _remove: function (e) {
            e.preventDefault();
            this.bus.trigger("removeGroup", this.model.id);
        },
        _primary: function (e) {
            e.preventDefault();
            this.bus.trigger("setPrimary", this.model.id);
        }
    });

    /**
     * The view of the groups in a LicenseRole.
     */
    var LicenseRoleEditorTableView = Backbone.Marionette.CompositeView.extend({
        template: templates.roleEditorTable,
        itemView: LicenseRoleEditorRowView,
        itemViewContainer: "tbody",
        emptyView: LicenseRoleEditorEmptyRowView,
        initialize: function (options) {
            this.bus = options.bus;
            this.itemViewOptions = {bus: this.bus};
        }
    });

    /**
     * The view of an editor for a LicenseRole. It is the composition of a `LicenseRoleEditorTableView` and a group
     * selector.
     */
    var LicenseRoleEditorView = Backbone.Marionette.Layout.extend({
        template: templates.roleEditor,
        regions: {
            table: ".license-role-editor-container",
            groupSelector: ".license-role-selector-container"
        },
        events: {
            "submit .license-role-editor-form": "_submit"
        },
        onShow: function () {
            this.table.show(new LicenseRoleEditorTableView(_.pick(this.options, "model", "collection", "bus")));

            var groupPicker = this.groupPicker = new GroupPicker(_.pick(this.options, "bus"));
            groupPicker.excludeGroups.apply(groupPicker, this.options.collection.pluck("name"));
            this.groupSelector.show(groupPicker);

            this.listenTo(this.options.bus, "removeGroup", function (groupName) {
                groupPicker.includeGroups(groupName);
            });

            this.listenTo(this.options.bus, "selectGroup", function (groupName) {
                groupPicker.excludeGroups(groupName);

                this.options.bus.trigger("addGroup", groupName);
            });
        },
        _submit: function (e) {
            e.preventDefault()
        },
        showLoading: function () {
            this.groupPicker && this.groupPicker.showLoading();
            return this;
        },
        hideLoading: function () {
            this.groupPicker && this.groupPicker.hideLoading();
            return this;
        }
    });

    /**
     * Converts the raw role data into a `LicenseRoleModel`.
     *
     * @param data the raw data. For example, {name: "name", groups: ["a"], primaryGroup: "a"}.
     * @returns {LicenseRoleModel}
     */
    var toModel =  function (data) {
        var collection = new LicenseRoleGroupCollection();
        var primary = data.primaryGroup || null;
        collection.add(_.map(data.groups, function (groupName) {
            return new LicenseRoleGroupModel({
                primary: groupName === primary,
                name: groupName
            })
        }));

        return new LicenseRoleModel({
            id: data.id,
            name: data.name || "",
            groups: collection
        });
    };

    /**
     * An object that can be used to render and edit a single LicenseRole.
     *
     * @param {function} options.setRole Called by the editor to save the current state of the role. It must be of the
     *  form `function(groups: Array, primary: String)`. The `primary` may be null to indicate that no primary group
     *  is configured.
     * @param {Object} options.role The current state of the role. For example,
     *  `{name: "name", groups: ["a"], primaryGroup: "a"}`.
     */
    var LicenseRoleEditor = function (options) {
        this._put = options.setRole || $.noop;
        var role = toModel(options.data || {});
        this._groups = role.get("groups");
        this._active = 0;
        var bus = options.bus || new Bus();

        this.view = new LicenseRoleEditorView({
            model: role,
            collection: this._groups,
            bus: bus
        });

        this.listenTo(bus, "removeGroup", this._removeGroup);
        this.listenTo(bus, "setPrimary", this._setPrimary);
        this.listenTo(bus, "addGroup", this._addGroup);
    };

    _.extend(LicenseRoleEditor.prototype, Backbone.Events, {
        _setPrimary: function (primary) {
            var groups = this._groups.pluck("name");
            if (_.contains(groups, primary)) {
                this._groups.forEach(function (model) {
                    model.set("primary", primary === model.id);
                });
                this._setRole(groups, primary);
            }
        },
        _removeGroup: function (group) {
            var existingGroup = this._groups.get(group);
            if (existingGroup && !existingGroup.get("primary")) {
                var groups = _.without(this._groups.pluck("name"), group), primaryId = null;

                var primary = this._groups.findWhere({primary: true});
                if (primary) {
                    primaryId = primary.id;
                }

                this._groups.remove(existingGroup);
                this._setRole(groups, primaryId);
            }
        },
        _addGroup: function (group) {
            var existingGroup = this._groups.get(group);
            if (!existingGroup) {
                var groups = this._groups.pluck("name"), primaryGroup = null;
                if (groups.length == 0) {
                    primaryGroup = group;
                } else {
                    var primary = this._groups.findWhere({primary: true});
                    if (primary) {
                        primaryGroup = primary.id;
                    }
                }

                groups.push(group);

                this._groups.add({name: group, primary: group === primaryGroup});
                this._setRole(groups, primaryGroup);
            }
        },
        _setRole: function(groups, primaryGroup) {
            var instance = this;

            if (this._active === 0) {
                this.view.showLoading();
            }

            this._active++;
            this._put(groups || [], primaryGroup).always(function () {
                instance._active = Math.max(0, instance._active - 1);
                if (instance._active == 0) {
                    instance.view.hideLoading();
                }
            });
        }
    });

    return LicenseRoleEditor;
});

define("jira/admin/licenseroles/roleseditor",
["jquery", "underscore", "backbone", "jira/ajs/ajax/smart-ajax/web-sudo", "jira/dialog/error-dialog",
 "jira/admin/licenseroles/roleeditor"],
function ($, _, Backbone, WebSudo, ErrorDialog, RoleEditor) {
    "use strict";

    var templates = JIRA.Templates.Admin.LicenseRoles;

    /**
     * Generic error handler.
     */
    var errorHandler = function (xhr, reason) {
        //Aborts are fine, lets not report them.
        if (reason !== "abort") {
            //We just display a reload error on bad request. This means that the groups are out of sync
            //with what is currently available on the server. A reload of the page will fix this. We don't use
            //the error message from the REST request because it may not relate the the action that user is performing
            //(e.g. it may report that group1 is invalid even though the user is adding group3).
            if (!xhr || xhr.status === 400) {
                new ErrorDialog({
                    message: AJS.I18n.getText("licenserole.configuration.out.of.date"),
                    mode: "warning"
                }).show();
            } else {
                ErrorDialog.openErrorDialogForXHR(xhr);
            }
        }
    };

    /**
     * Compares the passed two strings in a case-insensitive manner.
     *
     * @param {String} a left-hand side of the comparison.
     * @param {String} b right-hand side of the comparison.
     * @returns {number} Returns < 0 when a < b, > 0 when a > b or 0 when a == b.
     */
    var localeCompare = function (a, b) {
        a = a || "";
        b = b || "";
        return a.localeCompare(b);
    };

    var RolesIO = function (options) {
        this._queued = [];
        this._requests = {};
        this._defaultFail = options.defaultFail || null;
        this._current = null;
        this._aborted = false;
        this._websudo = false;
    };

    /**
     * An abstraction for all the IO needed to the server.
     */
    _.extend(RolesIO.prototype, {
        busy: function () {
            return this._current != null || this._queued.length > 0;
        },

        sudoVisible: function () {
            return this._websudo;
        },

        /**
         * Return all the roles on the server.
         *
         * @returns {jQuery.Deferred}
         */
        getRoles: function () {
            var instance = this;
            return this._wrap(this._ajax({
                url: this._makeAllUrl(),
                dataType: "json"
            }).pipe(function (data) {
                _.each(data, function (item) {
                    instance._sortData(item);
                });

                return data.sort(function (a, b) {
                    return localeCompare(a.name, b.name);
                });
            }));
        },
        /**
         * Update the passed role on the server.
         *
         * @param roleId the id of the role to update.
         * @param groups the groups to store for the role.
         * @param primary the primary group for the role.
         *
         * @returns {jQuery.Deferred}
         */
        putRole: function (roleId, groups, primary) {
            return this._wrap(this._ajaxForPut(roleId, {
                url: this._makeRoleUrl(roleId),
                dataType: "json",
                type: "PUT",
                contentType: "application/json",
                data: JSON.stringify({
                    groups: _.toArray(groups),
                    primaryGroup: primary
                })
            })).pipe(this._sortData);
        },
        _sortData: function (data) {
            if (data && data.groups) {
                data.groups.sort(localeCompare);
            }
            return data;
        },
        /**
         * Create a URL for the passed ROLE.
         *
         * @returns {string} the URL for the passed ROLE.
         * @private
         */
        _makeRoleUrl: function (roleId) {
            return contextPath + "/rest/api/2/licenserole/" + roleId;
        },
        /**
         * Create a URL to GET all roles.
         *
         * @returns {string} the URL for all roles.
         * @private
         */
        _makeAllUrl: function () {
            return contextPath + "/rest/api/2/licenserole";
        },
        abort: function () {
            this._current && this._current.result.reject(null, "abort");
            _.each(this._requests, function (item) {
                item.result.reject(null, "abort");
            });
            this._current = null;
            this._queued = [];
            this._requests = {};
            this._aborted = true;
        },
        _activate: function (request) {
            this._current = request;
            var ajax = this._ajax(request.options, {
                beforeShow: function () {
                    that._websudo = true;
                }
            }), that = this;

            ajax.fail(function () {
                //Reject current request.
                request.result.rejectWith.call(request.result, this, _.toArray(arguments));

                //Abort all others.
                that._current = null;
                that.abort();
            });

            ajax.done(function () {
                request.result.resolveWith.call(request.result, this, _.toArray(arguments));
                that._dequeue();
            });

            ajax.always(function () {
                that._websudo = false;
            })
        },
        _dequeue: function () {
            this._current = null;

            var next = this._queued.shift();
            if (next) {
                var request = this._requests[next];
                delete this._requests[next];
                this._activate(request);
            } else {
                JIRA.trace("role.put.finished");
            }
        },
        _ajaxForPut: function (roleId, options) {
            if (this._aborted) {
                return $.Deferred().reject(null, "abort");
            }

            var newRequest = {
                roleId: roleId,
                result: $.Deferred(),
                options: options
            };
            if (this._current == null) {
                this._activate(newRequest);
            } else {
                var oldRequest = this._requests[roleId];
                if (oldRequest) {
                    oldRequest.result.reject(null, "abort");
                } else {
                    this._queued.push(roleId);
                }
                this._requests[roleId] = newRequest;
            }
            return newRequest.result.promise();
        },
        _ajax: function (options, dialog) {
            return WebSudo.makeWebSudoRequest(options, dialog || {});
        },
        _wrap: function (def) {
            if (def && this._defaultFail) {
                def.fail(this._defaultFail);
            }
            return def;
        }
    });

    var LicenseRoleModel = Backbone.Model.extend({
        defaults: {
            name: null,
            groups: null,
            primaryGroup: null
        }
    });

    var LicenseRoleCollection = Backbone.Collection.extend({
        model: LicenseRoleModel
    });

    /**
     * View to render when there are no LicenseRoles.
     */
    var LicenseRolesEditorEmptyView = Backbone.Marionette.ItemView.extend({
        tagName: "div",
        template: templates.noRoles
    });

    /**
     * View to render to view and edit all LicenseRoles.
     */
    var LicenseRolesEditorView = Backbone.Marionette.CollectionView.extend({
        itemView: RoleEditor,
        tagName: "div",
        emptyView: LicenseRolesEditorEmptyView,
        buildItemView: function (model, ItemView) {
            if (ItemView == this.itemView) {
                return this.options.buildRoleEditor(model);
            } else {
                //It's the empty view. Just do the default.
                return Backbone.Marionette.CollectionView.prototype.buildItemView.apply(this, arguments);
            }
        }
    });

    /**
     * View to render while waiting for REST response from server.
     */
    var LicenseRoleEditorLoadingView = Backbone.Marionette.ItemView.extend({
        template: templates.roleEditorEmpty,
        onShow: function () {
            var view = this;
            this.timeout = window.setTimeout(function () {
                view.ui.icon.css({visibility: "visible"});
            }, 250);
        },
        onClose: function () {
            window.clearTimeout(this.timeout);
        },
        ui: {
            icon: ".icon"
        }
    });

    /**
     * An object that can be used to render and edit all LicenseRoles
     *
     * @param {Element|jQuery} options.el The element to render the editor into.
     */
    return function (options) {
        if (!options.el) {
            return;
        }
        var $el = $(options.el);
        if (!$el.length){
            return;
        }
        var region = new Marionette.Region({
            el: $el
        });

        $el.addClass("loading");
        region.show(new LicenseRoleEditorLoadingView());

        var IO = new RolesIO({
            defaultFail: errorHandler
        });

        IO.getRoles().done(function (data) {
            var collection = new LicenseRoleCollection(data);
            var view = new LicenseRolesEditorView({
                collection: collection,
                buildRoleEditor: function (model) {
                    var id = model.id;
                    return new RoleEditor({
                        data: model.toJSON(),
                        setRole: function (groups, primary) {
                            return IO.putRole(id, groups, primary);
                        }
                    }).view;
                }
            });
            region.show(view);
        }).always(function (){
            $el.removeClass("loading");
        });

        var ouload = window.onbeforeunload;
        window.onbeforeunload = function () {
            var result = ouload && ouload.call(window);
            if (!result) {
                if (IO.busy()) {
                    if (!IO.sudoVisible()) {
                        result =  AJS.I18n.getText("licenserole.configuration.active.ajax");
                    } else {
                        IO.abort();
                    }
                }
            }
            return result || void 0;
        }
    };
});
