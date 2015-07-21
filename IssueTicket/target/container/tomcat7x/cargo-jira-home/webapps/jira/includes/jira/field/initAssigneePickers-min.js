(function(){var AssigneePicker=require("jira/field/assignee-picker");var LoggedInUser=require("jira/util/users/logged-in-user");var Events=require("jira/util/events");var Types=require("jira/util/events/types");var Reasons=require("jira/util/events/reasons");var $=require("jquery");function getHashedLinkTarget(url){var hashIndex=url.indexOf("#");return(hashIndex!=-1)?url.substring(hashIndex):url}function wireAssignToMeLink(context){$("#assign-to-me-trigger",context).click(function(e){e.preventDefault();var url=$(this).attr("href");var assigneeId=getHashedLinkTarget(url);var username=LoggedInUser.username();var assigneeSelect=$(assigneeId,context);if($(assigneeId+"-single-select",context).length){assigneeSelect.trigger("set-selection-value",username)}else{assigneeSelect.val(username).change()}})}function wireAssigneeEditGroup(context){$(".assignee-edit-group",context).each(function(){var $this=$(this);var assigneeFieldId=$this.attr("rel");$("#assignee_userpicker_dummy_"+assigneeFieldId+"_container",context).click(function(){$("#assignee_radio_picker_"+assigneeFieldId,context).attr("checked","checked")});$this.parents("form[name=jiraform]").submit(function(){$this.find("input[name=assignee_radio]:checked").each(function(){if(this.id=="assignee_radio_picker_"+assigneeFieldId){$("#"+assigneeFieldId,context).val($("#assignee_userpicker_dummy_"+assigneeFieldId,context).val())}else{$("#"+assigneeFieldId,context).val($(this).val())}})})})}function createAssigneePicker(ctx){$(".js-assignee-picker",ctx).each(function(){var $this=$(this),editValue=$this.data("editValue");var control=new AssigneePicker({element:$this,editValue:editValue});$(document).trigger("ready.single-select.assignee",control)})}Events.bind(Types.NEW_CONTENT_ADDED,function(e,context,reason){if(reason!==Reasons.panelRefreshed){createAssigneePicker(context);wireAssignToMeLink(context);wireAssigneeEditGroup(context)}})})();