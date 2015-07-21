define("jira/message-types",{WARNING:JIRA.Templates.warningMsg,ERROR:JIRA.Templates.errorMsg,SUCCESS:JIRA.Templates.successMsg});define("jira/message",["jira/flag","jquery","jira/message-types","jira/data/local-storage"],function(flag,jQuery,Templates,store){var DefaultTimeout=10;function buildMsg(msg,options){options=options||{};var html=options.type({msg:msg,closeable:options.closeable});var $container=jQuery("<div>").html(html);var timeout=options.timeout!=null?options.timeout:DefaultTimeout;var timer;if(options.closeable){$container.find(".icon-close").click(function(e){e.preventDefault();if(timer!=null){window.clearTimeout(timer)}$container.remove()})}if(timeout>0){timer=window.setTimeout(function(){$container.fadeOut(function(){$container.remove()})},timeout*1000)}return $container}function showMessageAtTarget(msg,options){options=options||{};var $msg=buildMsg(msg,options);return $msg.prependTo(options.target)}var showMsgOnReload=(function(){var SESSION_MSG_KEY="jira.messages.reloadMessageMsg";var SESSION_MSG_TYPE_KEY="jira.messages.reloadMessageType";var SESSION_MSG_CLOSEABLE_KEY="jira.messages.reloadMessageCloseable";var SESSION_MSG_TARGET_KEY="jira.messages.reloadMessageTarget";jQuery(function(){var msg=store.getItem(SESSION_MSG_KEY),type,closeable,target;if(msg){type=store.getItem(SESSION_MSG_TYPE_KEY);closeable=store.getItem(SESSION_MSG_CLOSEABLE_KEY)==="true"||store.getItem(SESSION_MSG_CLOSEABLE_KEY)===true;target=store.getItem(SESSION_MSG_TARGET_KEY);store.removeItem(SESSION_MSG_KEY);store.removeItem(SESSION_MSG_TYPE_KEY);store.removeItem(SESSION_MSG_CLOSEABLE_KEY);store.removeItem(SESSION_MSG_TARGET_KEY);var messageTypes={WARNING:{soyTemplate:Templates.WARNING,auiType:"warning"},ERROR:{soyTemplate:Templates.ERROR,auiType:"error"},SUCCESS:{soyTemplate:Templates.SUCCESS,auiType:"success"}};if(!target||jQuery(target).is(document.body)){showMsg(msg,{type:messageTypes[type].auiType,closeable:closeable})}else{showMessageAtTarget(msg,{type:messageTypes[type].soyTemplate,closeable:closeable,target:jQuery(target)})}}});return function(msg,options){store.setItem(SESSION_MSG_KEY,msg);store.setItem(SESSION_MSG_TYPE_KEY,options.type);if(options.closeable){store.setItem(SESSION_MSG_CLOSEABLE_KEY,options.closeable)}if(options.target){store.setItem(SESSION_MSG_TARGET_KEY,options.target)}}})();function showReloadWarningMsg(msg,options){options=options||{};options.type="WARNING";return showMsgOnReload(msg,options)}function showReloadSuccessMsg(msg,options){options=options||{};options.type="SUCCESS";return showMsgOnReload(msg,options)}function showReloadErrorMsg(msg,options){options=options||{};options.type="ERROR";return showMsgOnReload(msg,options)}function showMsg(msg,options){var settings={};options=options||{};settings.type=options.type;if(typeof options.timeout==="undefined"){if(options.closeable===false){settings.close="auto"}}else{if(options.timeout>0){settings.close="auto"}else{if(options.closeable===false){settings.close="never"}else{settings.close="manual"}}}var createdFlag=jQuery(flag.showMsg("",msg,settings));if(options.id){createdFlag.attr("id",options.id)}return createdFlag}function showErrorMsg(msg,options){return showMsg(msg,jQuery.extend({},options,{type:"error"}))}function showWarningMsg(msg,options){return showMsg(msg,jQuery.extend({},options,{type:"warning"}))}function fadeInBackground(target,options){var $target=jQuery(target);options=options||{};$target.css("backgroundColor","#fff").animate({backgroundColor:options.backgroundColor||"#ffd"});window.setTimeout(function(){$target.animate({backgroundColor:"#fff"},"slow",function(){$target.css("backgroundColor","")})},3000)}var fadeInBackgroundOnReload=(function(){var BACKGROUND_COLOR_KEY="jira.messages.fadeInBackground.color",TARGET_KEY="jira.messages.fadeInBackground.target";jQuery(function(){var backgroundColor=store.getItem(BACKGROUND_COLOR_KEY),target=store.getItem(TARGET_KEY);store.removeItem(BACKGROUND_COLOR_KEY);store.removeItem(TARGET_KEY);fadeInBackground(target,{backgroundColor:backgroundColor})});return function(target,options){options=options||{};var targets=store.getItem(TARGET_KEY);if(targets){targets=targets.split(",");targets.push(target);targets=targets.join(",")}else{targets=target}store.setItem(TARGET_KEY,targets);store.setItem(BACKGROUND_COLOR_KEY,options.backgroundColor||"#ffd")}})();function showSuccessMsg(msg,options){return showMsg(msg,jQuery.extend({},options,{type:"success"}))}var exports={Types:Templates,DefaultTimeout:10,buildMsg:buildMsg,showMsg:showMsg,showMessageAtTarget:showMessageAtTarget,showMsgOnReload:showMsgOnReload,fadeInBackground:fadeInBackground,fadeInBackgroundOnReload:fadeInBackgroundOnReload,showErrorMsg:showErrorMsg,showWarningMsg:showWarningMsg,showSuccessMsg:showSuccessMsg,showReloadErrorMsg:showReloadErrorMsg,showReloadWarningMsg:showReloadWarningMsg,showReloadSuccessMsg:showReloadSuccessMsg};var deprecationOptions={removeInVersion:"8.0",alternativeName:"jira/flag",sinceVersion:"6.4"};AJS.deprecate.prop(exports,"showMsg",deprecationOptions);AJS.deprecate.prop(exports,"showErrorMsg",deprecationOptions);AJS.deprecate.prop(exports,"showWarningMsg",deprecationOptions);AJS.deprecate.prop(exports,"showSuccessMsg",deprecationOptions);return exports});AJS.namespace("JIRA.Messages",null,require("jira/message"));(function(){var Types=require("jira/message-types");var messages=require("jira/message");var jQuery=require("jquery");jQuery.fn.fadeInBackground=function(options){messages.fadeInBackground(this,options);return this};jQuery.fn.showErrorMsg=function(msg,options){options=options||{};options.target=this;options.type=Types.ERROR;return messages.showMessageAtTarget(msg,options)};jQuery.fn.showWarningMsg=function(msg,options){options=options||{};options.target=this;options.type=Types.WARNING;return messages.showMessageAtTarget(msg,options)};jQuery.fn.showSuccessMsg=function(msg,options){options=options||{};options.target=this;options.type=Types.SUCCESS;return messages.showMessageAtTarget(msg,options)}})();