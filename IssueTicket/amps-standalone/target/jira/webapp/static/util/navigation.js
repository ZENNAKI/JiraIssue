define('jira/util/navigation',
    ['backbone'],
    function(Backbone) {
        "use strict";

        return {
            pushStateSupported: !!window.history.pushState,
            getBackboneHistoryRoot: function getBackboneHistoryRoot() {
                return this.pushStateSupported ? "" : this.getRoot();
            },
            getRoot: function getRoot() {
                return window.location.pathname;
            },
            navigate: function navigate(location) {
                if (typeof location == 'object')
                    location = this.buildQuery(location);

                if (this.pushStateSupported) {
                    location = this.getRoot() + location;
                }
                Backbone.history.navigate(location);
            },
            getParam: function getParam(name, includeHash, location) {
                location = location || window.location;
                var uri = parseUri(location);
                var params = uri.queryKey;

                if (includeHash && uri.anchor) {
                    uri.anchor.split('&').forEach(function (i) {
                        var param = i.split('=');
                        if (param.length == 2) {
                            params[param[0]] = param[1];
                        }
                    });
                }
                return params[name] === undefined ? undefined : decodeURIComponent(params[name].replace(/\+/g, " "));
            },
            buildQuery: function buildQuery(params) {
                var queryString = _.reduce(params, function(query, value, param) {
                    if (value) {
                        return query + '&' + encodeURIComponent(param) + '=' + encodeURIComponent(value).replace(/%20/g, "+");
                    }
                    return query;
                },'');

                return this.pushStateSupported ? queryString.replace('&','?') : queryString.substr(1);

            }

        }
    }
);