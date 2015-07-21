define("jira/dialog/form-dialog",["jira/dialog/dialog","jira/flag","jira/message","jira/ajs/ajax/smart-ajax","jira/focus/set-focus","jira/util/browser","jira/util/events","jira/util/navigator","jquery"],function(Dialog,Flag,Messages,SmartAjax,SetFocus,Browser,Events,Navigator,jQuery){return Dialog.extend({_getDefaultOptions:function(){return jQuery.extend(this._super(),{autoClose:false,targetUrl:"",handleRedirect:false,onUnSuccessfulSubmit:function(){},onSuccessfulSubmit:function(){},onDialogFinished:function(){var targetUrl=this._getTargetUrlValue();this.hide();if(targetUrl){Events.trigger("page-unload.location-change.from-dialog",[this.$popup]);window.location.href=targetUrl}else{Events.trigger("page-unload.refresh.from-dialog",[this.$popup]);Browser.reloadViaWindowLocation()}},submitAjaxOptions:{type:"post",data:{inline:true,decorator:"dialog"},dataType:"html"},isIssueDialog:false})},_getFormDataAsObject:function(){var fieldValues={};jQuery(this.$form.serializeArray()).each(function(){var fieldVal=fieldValues[this.name];if(!fieldVal){fieldVal=this.value}else{if(jQuery.isArray(fieldVal)){fieldVal.push(this.value)}else{fieldVal=[fieldVal,this.value]}}fieldValues[this.name]=fieldVal});return fieldValues},_getRelativePath:function(){var ajaxOptions=this._getRequestOptions();return parseUri(ajaxOptions.url).directory},_getPath:function(action){var relPath=this._getRelativePath();if(action.indexOf(relPath)==0){return action}else{return relPath+action}},_submitForm:function(e){this.cancelled=false;this.xhr=null;this.redirected=false;this.serverIsDone=false;var instance=this,defaultRequestOptions=jQuery.extend(true,{},this.options.submitAjaxOptions),requestOptions=jQuery.extend(true,defaultRequestOptions,{url:this._getPath(this.$form.attr("action")),data:this._getFormDataAsObject(),complete:function(xhr,textStatus,smartAjaxResult){instance.hideFooterLoadingIndicator();if(!instance.cancelled){instance._showMessagesFromXhrResponse(xhr);if(smartAjaxResult.successful){instance.$form.trigger("fakesubmit");instance._handleServerSuccess(smartAjaxResult.data,xhr,textStatus,smartAjaxResult);if(!instance.redirected){instance._handleSubmitResponse(smartAjaxResult.data,xhr,smartAjaxResult)}}else{instance._handleServerError(xhr,textStatus,smartAjaxResult.errorThrown,smartAjaxResult)}}instance.$form.removeClass("submitting")}});requestOptions.data.decorator="dialog";requestOptions.data.inline=true;this.showFooterLoadingIndicator();this.xhr=SmartAjax.makeRequest(requestOptions);e.preventDefault()},_showMessagesFromXhrResponse:function _showMessagesFromXhrResponse(xhr){var messagesJson=xhr.getResponseHeader("X-Atlassian-Messages");if(messagesJson){var messages=JSON.parse(messagesJson);Flag.showMessages(messages)}},_handleServerError:function(xhr,textStatus,errorThrown,smartAjaxResult){if(this.options.onUnSuccessfulSubmit){this.options.onUnSuccessfulSubmit.call(xhr,textStatus,errorThrown,smartAjaxResult)}var errorContent=SmartAjax.buildDialogErrorContent(smartAjaxResult,true);var content$=this.get$popupContent().find(".form-body");if(content$.length!==1){content$=this.get$popupContent()}var insertErrMsg=content$.length===1&&!smartAjaxResult.hasData;if(insertErrMsg){content$.prepend(errorContent)}else{this.setSubmitResponseContent(errorContent)}},setSubmitResponseContent:function(content){if(this.options.formatSubmitResponseContent){content=this.options.formatSubmitResponseContent.call(this,content)}this._setContent(content)},isIssueDialog:function(){return !!this.options.isIssueDialog},_handleServerSuccess:function(data,xhr,textStatus,smartAjaxResult){var msgInstructions=this._detectMsgInstructions(xhr);if(msgInstructions){Messages.showMsgOnReload(msgInstructions.msg,{type:msgInstructions.type,closeable:msgInstructions.closeable,target:msgInstructions.target})}var instructions=this._detectRedirectInstructions(xhr);this.serverIsDone=instructions.serverIsDone;if(instructions.redirectUrl){if(this.options.onSuccessfulSubmit){this.options.onSuccessfulSubmit.call(this,data,xhr,textStatus,smartAjaxResult)}this._performRedirect(instructions.redirectUrl)}else{if(!this.serverIsDone){this.setSubmitResponseContent(data)}}},_detectMsgInstructions:function(xhr){var instructions={msg:xhr.getResponseHeader("X-Atlassian-Dialog-Msg-Html")};if(instructions.msg){instructions.type=xhr.getResponseHeader("X-Atlassian-Dialog-Msg-Type").toUpperCase();instructions.closeable=(xhr.getResponseHeader("X-Atlassian-Dialog-Msg-Closeable")==="true");instructions.target=xhr.getResponseHeader("X-Atlassian-Dialog-Msg-Target");return instructions}},_handleInitialDoneResponse:function(data,xhr,smartAjaxResult){this._handleSubmitResponse(data,xhr,smartAjaxResult)},_handleSubmitResponse:function(data,xhr,smartAjaxResult){if(this.serverIsDone){if(this.options.onSuccessfulSubmit){this.options.onSuccessfulSubmit.call(this,data,xhr,smartAjaxResult)}if(this.options.autoClose){this.hide()}if(this.options.onDialogFinished){this.options.onDialogFinished.call(this,data,xhr,smartAjaxResult)}}},_performRedirect:function(url){if(!this.options.stayVisibleOnRedirect){this.hide()}this.redirected=true;this._super(url)},_hasTargetUrl:function(){return this._getTargetUrlHolder().length>0},_getTargetUrlHolder:function(){return jQuery(this.options.targetUrl)},_getTargetUrlValue:function(){return this._getTargetUrlHolder().val()},decorateContent:function(){var instance=this,$buttons,$cancel,$buttonContainer,$footerContainer,$closeLink;this.$form=jQuery("form",this.get$popupContent());this._constructHeading();this.$form.submit(function(e){var event=new jQuery.Event("before-submit");instance.$form.trigger(event,[e,instance]);if(!event.isDefaultPrevented()){instance.$form.addClass("submitting");var submitButtons=jQuery(":submit",instance.$form);submitButtons.attr("disabled","disabled");if(instance.options.submitHandler){instance.showFooterLoadingIndicator();instance.options.submitHandler.call(instance,e,function(){if(instance.isCurrent()){instance.hideFooterLoadingIndicator();instance.$form.removeClass("submitting")}})}else{instance._submitForm(e)}}else{e.preventDefault()}});$cancel=jQuery(".cancel",this.get$popupContent());$cancel.click(function(e){if(instance.xhr){instance.xhr.abort()}instance.xhr=null;instance.cancelled=true;instance.hide(true,{reason:Dialog.HIDE_REASON.cancel});e.preventDefault()});if(Navigator.isIE()&&Navigator.majorVersion()<12){$cancel.focus(function(e){if(e.altKey){$cancel.click()}})}$buttons=this.get$popupContent().find(".button, .aui-button");$buttonContainer=this.get$popupContent().find("div.buttons");if($cancel.length===0&&$buttons.length===0){if($buttonContainer.length===0){$footerContainer=jQuery('<div class="buttons-container form-footer"><div class="buttons"/></div>').appendTo(this.get$popupContent());$buttonContainer=$footerContainer.find(".buttons")}AJS.populateParameters();$closeLink=jQuery("<button class='aui-button aui-button-link cancel' id='aui-dialog-close'>"+AJS.I18n.getText("admin.common.words.close")+"</button>");$buttonContainer.append($closeLink);$closeLink=jQuery(".cancel",this.get$popupContent());$closeLink.click(function(e){instance.hide(true,{reason:Dialog.HIDE_REASON.cancel});e.preventDefault()})}$buttonContainer.prepend(jQuery("<span class='icon throbber'/>"));this.get$popupContent().on("click",".shortcut-tip-trigger",function(e){e.preventDefault();if(!instance.get$popupContent().isDirty()||confirm(AJS.I18n.getText("common.forms.dirty.dialog.message"))){instance.hide();jQuery("#keyshortscuthelp").click()}});if(!($footerContainer instanceof jQuery)){$footerContainer=$buttonContainer.closest(".buttons-container, .form-footer");if(!$footerContainer.size()){$footerContainer=$buttonContainer}}this.$buttonContainer=$footerContainer},getButtonsContainer:function(){return this.$buttonContainer},_constructHeading:function(){var $formHeading,$formHeadingContainer;$formHeading=jQuery(":header:first",this.get$popupContent());if($formHeading.length>0){this.addHeading($formHeading.contents());$formHeadingContainer=$formHeading.parent();$formHeading.remove();while($formHeadingContainer.is(":empty")){$formHeading=$formHeadingContainer.parent();$formHeadingContainer.remove();$formHeadingContainer=$formHeading}}},_setContent:function(content,decorate){this._super(content,decorate);if(content&&Dialog.current===this){if(Navigator.isIE()&&Navigator.majorVersion()<11){this.$form.bind("keypress",function(e){if(e.keyCode===13&&jQuery(e.target).is("input")){e.preventDefault();jQuery(this).submit()}})}if(Dialog.current===this){this._focusFirstField()}}},_focusFirstField:function(focusElementSelector){var triggerConfig=new SetFocus.FocusConfiguration();if(focusElementSelector){triggerConfig.focusElementSelector=focusElementSelector}else{if(this.$activeTrigger&&this.$activeTrigger.attr("data-field")){triggerConfig.focusElementSelector="[name='"+this.$activeTrigger.attr("data-field")+"']"}}triggerConfig.parentElementSelectors.unshift(".aui-dialog-content");triggerConfig.context=this.get$popup()[0];if(Navigator.isIE()&&Navigator.majorVersion()<11){var $focusHack=jQuery(".trigger-hack",triggerConfig.context);if($focusHack.length===0){$focusHack=jQuery("<input Class='trigger-hack' type='text' value=''/>").css({position:"absolute",left:-9000,top:-9000}).appendTo(triggerConfig.context)}$focusHack.focus()}SetFocus.pushConfiguration(triggerConfig);SetFocus.triggerFocus();SetFocus.triggerFocus()},hide:function(undim,options){if(this._super(undim,options)===false){return false}SetFocus.popConfiguration()}})});AJS.namespace("AJS.FormPopup",null,require("jira/dialog/form-dialog"));AJS.namespace("JIRA.FormDialog",null,require("jira/dialog/form-dialog"));