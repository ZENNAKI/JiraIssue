AJS.$(function () {

    function getView(collection) {
        if (collection.isReadOnly) {
            return JIRA.WatchersReadOnly;
        } else if (collection.canBrowseUsers) {
            return JIRA.WatchersView;
        } else {
            return JIRA.WatchersNoBrowseView;
        }
    }

    // Wire up inline dialog to our Backbone view
    require(['aui/inline-dialog2']);

    AJS.$(document).on('click', '#view-watcher-list', function (e) {
        e.preventDefault();
        var dialog = AJS.$('#inline-dialog-watchers');
        var loadingIcon = AJS.$('#watching-toggle').next('.icon');
        var collection = new JIRA.WatchersUsersCollection(JIRA.Issue.getIssueKey());
        loadingIcon.addClass('loading');
        var ViewClass = getView(collection);
        new ViewClass({
            collection: collection
        }).render().done(function(viewHtml) {
            viewHtml.find('.cancel').click(function(closeEvent) {
                dialog[0].hide();
                closeEvent.preventDefault();
            });
            loadingIcon.removeClass('loading');
            dialog.find('.aui-inline-dialog-contents').html(viewHtml);
            dialog[0].show();
        });
        collection.on('errorOccurred', function () {
            dialog[0].hide();
        });
    });

    AJS.$(document).bind('keydown', function (e) {
        var dialog = AJS.$('#inline-dialog-watchers');
        // special case for when user hover is open at same time
        if (e.keyCode === 27 && AJS.InlineDialog.current != dialog && dialog.is(':visible')) {
            if (AJS.InlineDialog.current) {
                AJS.InlineDialog.current.hide();
            }
            dialog[0].hide();
        }
    });

    // JRA-28786 Clicking any whitespace outside of the Watch dialog should dismiss the dialog
    AJS.$(document).click(function (e) {
        var dialog = AJS.$('#inline-dialog-watchers');
        var watchersDialogOrSuggestionClicked = AJS.$(e.target).closest('#inline-dialog-watchers, #watchers-suggestions').length;
        if (dialog[0] && dialog[0].isVisible()
            && watchersDialogOrSuggestionClicked === 0) {
            dialog[0].hide();
        }
    });

    JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e, context, reason){
        //-- remove existing floating #inline-dialog-watchers before refresh adds another one
        if (reason === JIRA.CONTENT_ADDED_REASON.panelRefreshed && context.is('#peoplemodule')) {
            var movedDialog = AJS.$(document.body).children('#inline-dialog-watchers');
            if (movedDialog.length !== 0) {
                movedDialog.remove();
            }
        } else {
            //This is necessary to stop click on the multi-select autocomplete from closing the
            //inline dialog. See JRADEV-8136
            var dialog = AJS.$('#inline-dialog-watchers');
            dialog.attr('data-aui-persistent', true);
        }
    });
});
