<%@ page import="com.atlassian.crowd.embedded.api.User" %>
<%@ page import="com.atlassian.jira.security.websudo.InternalWebSudoManager" %>
<%@ page import="com.atlassian.jira.web.util.HelpUtil" %>
<%
final User loggedInUser = ComponentAccessor.getJiraAuthenticationContext().getLoggedInUser();
if (loggedInUser != null)
{
    final InternalWebSudoManager websudoManager = ComponentAccessor.getComponent(InternalWebSudoManager.class);

    if (websudoManager.isEnabled() && websudoManager.hasValidSession(session))
    {
        request.setAttribute("helpUtil", HelpUtil.getInstance());
%>
<div class="aui-message aui-message-warning" id="websudo-banner">
<%
    if (websudoManager.isWebSudoRequest(request))
    {
%>
    <p>
        <ww:text name="'websudo.enabled.message'">
            <ww:param name="'value0'"><a id="websudo-drop-from-protected-page" href="#"></ww:param>
            <ww:param name="'value1'"></a></ww:param>
            <ww:param name="'value2'"><a target="_blank" href="<ww:property value="@helpUtil/helpPath('websudo')/url"/>"></ww:param>
            <ww:param name="'value3'"></a></ww:param>
        </ww:text>
    </p>
<%
    }
    else
    {
%>
    <p>
        <ww:text name="'websudo.enabled.message'">
            <ww:param name="'value0'"><a id="websudo-drop-from-normal-page" href="#"></ww:param>
            <ww:param name="'value1'"></a></ww:param>
            <ww:param name="'value2'"><a target="_blank" href="<ww:property value="@helpUtil/helpPath('websudo')/url"/>"></ww:param>
            <ww:param name="'value3'"></a></ww:param>
        </ww:text>
    </p>
<%
    }
%>
</div>
<%
    }
}
%>
