define('jira/flag', [
    'aui/flag',
    'jira/ajs/ajax/smart-ajax',
    'underscore'
], function (
    flag,
    smartAjax,
    _
) {
    'use strict';

    var defaults = {
        type: 'info',
        title: '',
        body: ''
    };

    var typeDefaults = {
        'success': { close: 'auto' }
    };

    var claimDismissedFlags = _.once(function () {
        var dismissedData = WRM.data.claim('com.atlassian.jira.jira-header-plugin:dismissedFlags.flags') || {};
        return dismissedData.dismissed || [];
    });

    var dismissedSinceLoad = [];

    function getDismissedFlags() {
        return _.union(claimDismissedFlags(), dismissedSinceLoad);
    }

    function showMsg(title, body, options) {
        options = options || {};
        var settings = _.extend({}, defaults, typeDefaults[options.type],
                options, {title: title ? title : '', body: body ? body : ''});
        var dismissalKey = settings.dismissalKey;

        if (dismissalKey && _.contains(getDismissedFlags(), dismissalKey)) {
            return false;
        }

        var displayedFlag = flag(settings);

        if (dismissalKey) {
            displayedFlag.addEventListener('aui-flag-close', function () {
                dismissedSinceLoad.push(dismissalKey);
                smartAjax.makeRequest({
                    type: 'PUT',
                    url: AJS.contextPath() + '/rest/flags/1.0/flags/' + encodeURIComponent(dismissalKey) + '/dismiss'
                });
            });
        }

        return displayedFlag;
    }

    function showErrorMsg(title, body, options) {
        return showMsg(title, body, _.extend({}, options, {type: 'error'}));
    }

    function showWarningMsg(title, body, options) {
        return showMsg(title, body, _.extend({}, options, {type: 'warning'}));
    }

    function showSuccessMsg(title, body, options) {
        return showMsg(title, body, _.extend({}, options, {type: 'success'}));
    }

    function showMessages(messages) {
        messages.forEach(function showMessage(message) {
            showMsg(message.title, message.htmlMessage, {
                close: message.auiClosingPolicy,
                type: message.auiMessageType
            });
        });
    }


    return {
        showMsg: showMsg,
        showMessages: showMessages,
        showInfoMsg: showMsg,
        showErrorMsg: showErrorMsg,
        showWarningMsg: showWarningMsg,
        showSuccessMsg: showSuccessMsg
    };

});