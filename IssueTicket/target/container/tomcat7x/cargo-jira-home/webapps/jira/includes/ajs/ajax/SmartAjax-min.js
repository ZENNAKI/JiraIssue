define("jira/ajs/ajax/smart-ajax",["jquery","aui/params"],function($,params){var SmartAjax={};SmartAjax.SmartAjaxResult=function(xhr,requestId,statusText,data,successful,errorThrown){var status=tryIt(function(){return xhr.status},0);var result={successful:successful,status:status,statusText:statusText,errorThrown:errorThrown,readyState:xhr.readyState,hasData:data!=null&&data.length>0,data:data,xhr:xhr,aborted:xhr.aborted,requestId:requestId,validationError:!!(xhr.status===400&&data&&data.errors)};result.toString=function(){return"{\n"+"successful  : "+this.successful+",\n"+"status      : "+this.status+",\n"+"statusText  : "+this.statusText+",\n"+"hasData     : "+this.hasData+",\n"+"readyState  : "+this.readyState+",\n"+"requestId   : "+this.requestId+",\n"+"aborted     : "+this.aborted+",\n"+"}"};return result};SmartAjax.SmartAjaxResult.ERROR="error";SmartAjax.SmartAjaxResult.TIMEOUT="timeout";SmartAjax.SmartAjaxResult.NOTMODIFIED="notmodified";SmartAjax.SmartAjaxResult.PARSEERROR="parseerror";SmartAjax.makeRequest=function(ajaxOptions){var _smartAjaxResult={};var log=function(calltype,requestId,msg){if(AJS.log){var id=requestId?"["+requestId+"] ":" ";AJS.log("ajax"+id+calltype+" : "+msg)}};var generateRequestId=function(){var now=new Date();var midnight=new Date(now.getFullYear(),now.getMonth(),now.getDate(),0,0,0,0);var ms=(now.getTime()-midnight.getTime());return Math.max(Math.floor(ms),1)};var errorHandler=function(xhr,statusText,errorThrown,smartAjaxResult){if(!smartAjaxResult){var data=tryIt(function(){return xhr.responseText},"");smartAjaxResult=_smartAjaxResult=new SmartAjax.SmartAjaxResult(xhr,_requestId,statusText,data,false,errorThrown)}log("error",smartAjaxResult.requestId,smartAjaxResult);if($.isFunction(ajaxOptions.error)){ajaxOptions.error(xhr,statusText,errorThrown,smartAjaxResult)}};var successHandler=function(data,statusText,xhr){if(xhr.status<100){_smartAjaxResult=new SmartAjax.SmartAjaxResult(xhr,_requestId,SmartAjax.SmartAjaxResult.ERROR,"",false);errorHandler(xhr,SmartAjax.SmartAjaxResult.ERROR,undefined,_smartAjaxResult);return }_smartAjaxResult=new SmartAjax.SmartAjaxResult(xhr,_requestId,statusText,data,true);if($.isFunction(ajaxOptions.success)){ajaxOptions.success(data,statusText,xhr,_smartAjaxResult)}};var completeHandler=function(xhr,textStatus){if($.isFunction(ajaxOptions.complete)){ajaxOptions.complete(xhr,textStatus,_smartAjaxResult)}};var DEFAULT_AJAX_OPTS={jqueryAjaxFn:$.ajax,headers:{"X-AUSERNAME":encodeURIComponent(params.loggedInUser)}};var ourAjaxOptions=$.extend(true,{},DEFAULT_AJAX_OPTS,ajaxOptions);ourAjaxOptions.error=errorHandler;ourAjaxOptions.success=successHandler;ourAjaxOptions.complete=completeHandler;var xhr=ourAjaxOptions.jqueryAjaxFn.apply(ourAjaxOptions,[ourAjaxOptions]);var _requestId=generateRequestId();try{xhr.abort=function(oldabort){return function(){log("aborted",_requestId,"");xhr.aborted=true;if($.isFunction(oldabort)){try{oldabort.apply(xhr,arguments)}catch(ex){}}}}(xhr.abort)}catch(ex){}return xhr};SmartAjax.buildDialogErrorContent=function(smartAjaxResult,noHeader){var fourHundredClass=Math.floor(smartAjaxResult.status/100);if(smartAjaxResult.hasData&&fourHundredClass!=4){return wrapDialogErrorContent(AJS.extractBodyFromResponse(smartAjaxResult.data))}else{var errMsg=buildRawHttpErrorMessage(smartAjaxResult);return buildDialogAjaxErrorMessage(errMsg,noHeader)}};SmartAjax.buildSimpleErrorContent=function(smartAjaxResult,options){return buildRawHttpErrorMessage(smartAjaxResult,options?options:{})};function buildRawHttpErrorMessage(smartAjaxResult,options){var AJS=window.top.AJS;var errMsg;if(smartAjaxResult.statusText==SmartAjax.SmartAjaxResult.TIMEOUT){errMsg=AJS.I18n.getText("common.forms.ajax.timeout")}else{if(smartAjaxResult.status==401){errMsg=AJS.I18n.getText("common.forms.ajax.unauthorised.alert")}else{if(smartAjaxResult.hasData){errMsg=AJS.I18n.getText("common.forms.ajax.servererror")}else{errMsg=AJS.I18n.getText("common.forms.ajax.commserror")}}}return errMsg}function buildDialogAjaxErrorMessage(errorMessage,noHeader){var errorContent='<div class="dialog-error">'+"<p>"+errorMessage+"</p>"+"<p>"+AJS.I18n.getText("common.forms.ajax.error.dialog")+"</p>"+"</div>";if(!noHeader){errorContent="<h1>"+AJS.I18n.getText("common.forms.ajax.error.dialog.heading")+"</h1>"+errorContent}return wrapDialogErrorContent(errorContent)}function wrapDialogErrorContent(content){var $container=$('<div class="ajaxerror"/>');$container.append(content);return $container}return SmartAjax});AJS.namespace("JIRA.SmartAjax",null,require("jira/ajs/ajax/smart-ajax"));AJS.namespace("jira.ajax",null,require("jira/ajs/ajax/smart-ajax"));