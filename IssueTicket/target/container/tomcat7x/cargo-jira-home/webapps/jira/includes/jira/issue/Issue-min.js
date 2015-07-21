define("jira/issue",["jira/util/browser","jira/util/events","jquery"],function(Browser,Events,jQuery){var Issue={};var $keyVal;function getKeyVal(){if(!$keyVal){$keyVal=jQuery("#key-val")}return $keyVal}Issue.getStalker=function(){return jQuery("#stalker")};Issue.getSubtaskContent=function(){return Issue.getSubtaskModule().find(".mod-content")};Issue.getSubtaskModule=function(){return jQuery("#view-subtasks")};Issue.reload=function(){Browser.reloadViaWindowLocation()};Issue.refreshSubtasks=function(){var deferred=jQuery.Deferred(),$subtasks=Issue.getSubtaskContent();if($subtasks.length===0){Browser.reloadViaWindowLocation(window.location.href+"#view-subtasks");return deferred.promise()}else{return jQuery.ajax({url:contextPath+"/secure/ViewSubtasks.jspa?id="+Issue.getIssueId(),success:function(html){$subtasks.replaceWith(html);Events.trigger("Issue.subtasksRefreshed",[Issue.getSubtaskContent()])}})}};Issue.highlightSubtasks=function(issues){jQuery.each(issues,function(i,issue){jQuery(".issuerow[data-issuekey='"+issue.issueKey+"']").fadeInBackground()})};Issue.getIssueId=function(){var $keyVal=getKeyVal();if($keyVal.length!==0){return $keyVal.attr("rel")}return undefined};Issue.getIssueKey=function(){var $keyVal=getKeyVal();if($keyVal.length!==0){return $keyVal.text()}return undefined};Issue.issueCreatedMessage=function(issue,isSubtask){var issueText=isSubtask?AJS.I18n.getText("common.words.subtask"):AJS.I18n.getText("common.words.issue");var link='<a class="issue-created-key issue-link" data-issue-key="'+issue.issueKey+'" href="'+AJS.contextPath()+"/browse/"+issue.issueKey+'">'+issue.issueKey+" - "+AJS.escapeHtml(issue.summary)+"</a>";return AJS.I18n.getText("createissue.issuecreated",issueText,link)};return Issue});AJS.namespace("jira.app.issue",null,require("jira/issue"));AJS.namespace("JIRA.Issue",null,require("jira/issue"));