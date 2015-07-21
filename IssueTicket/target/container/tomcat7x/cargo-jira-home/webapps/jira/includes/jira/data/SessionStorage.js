define('jira/data/session-storage', function() {

    return {
        /**
         * All of JIRA's supported browsers support SessionStorage. This is still here for legacy API reasons.
         */
        nativesupport: true,

        length: function() { return sessionStorage.length; },
        key: function(index) { return sessionStorage.key(index); },
        getItem: function(key) { return sessionStorage.getItem(key); },
        setItem: function(key, value) { return sessionStorage.setItem(key, value); },
        removeItem: function(key) { return sessionStorage.removeItem(key); },
        clear: function() { return sessionStorage.clear(); },

        /**
         * Returns a JSON string representation of the web storage in play
         */
        asJSON: function() {
            var len = this.length();
            var jsData = '{\n';
            for (var i = 0; i < len; i++)
            {
                var key = this.key(i);
                var value = this.getItem(key);
                jsData += key + ':' + value;
                if (i < len-1)
                {
                    jsData += ',';
                }
                jsData += '\n';
            }
            jsData += '}\n';
            return jsData;
        }
    };
});

/** Preserve legacy namespace
    @deprecated jira.app.session.storage */
AJS.namespace("jira.app.session.storage", null, require('jira/data/session-storage'));
AJS.namespace('JIRA.SessionStorage', null, require('jira/data/session-storage'));
