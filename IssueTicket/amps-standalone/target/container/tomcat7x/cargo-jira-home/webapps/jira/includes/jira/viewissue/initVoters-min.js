AJS.$(function(){var dialog=AJS.InlineDialog("#view-voter-list","voters",function(contents,trigger,doShowPopup){var loadingIcon=AJS.$("#vote-toggle").next(".icon");var collection=new JIRA.VotersUsersCollection(JIRA.Issue.getIssueKey());loadingIcon.addClass("loading");new JIRA.VotersView({collection:collection}).render().done(function(viewHtml){contents.html(viewHtml);contents.find(".cancel").click(function(e){dialog.hide();e.preventDefault()});loadingIcon.removeClass("loading");doShowPopup()});collection.on("errorOccurred",function(){dialog.hide()})},{width:240,useLiveEvents:true,items:"#view-voters-list",preHideCallback:function(){return !AJS.InlineLayer.current}});AJS.$(document).bind("keydown",function(e){if(e.keyCode===27&&AJS.InlineDialog.current!=dialog&&dialog.is(":visible")){if(AJS.InlineDialog.current){AJS.InlineDialog.current.hide()}dialog.hide()}});AJS.$(document).click(function(e){var currentDialog=AJS.InlineDialog.current;if(currentDialog&&currentDialog.id==="voters"){if(!jQuery(e.target).closest("#inline-dialog-voters").length){currentDialog.hide()}}})});