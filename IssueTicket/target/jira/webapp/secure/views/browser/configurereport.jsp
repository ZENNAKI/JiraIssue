<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="aui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
	<title><ww:text name="'admin.common.words.configure'"/> - <ww:property value="report/name" /></title>
</head>
<body>
    <ui:soy moduleKey="'jira.webresources:soy-templates'" template="'JIRA.Templates.Headers.pageHeader'">
        <ui:param name="'mainContent'">
            <h1><ww:text name="'admin.common.words.configure'"/> - <ww:property value="report/name" /></h1>
        </ui:param>
    </ui:soy>

    <ui:soy moduleKey="'com.atlassian.auiplugin:aui-experimental-soy-templates'" template="'aui.page.pagePanel'">
        <ui:param name="'content'">
            <ui:soy moduleKey="'com.atlassian.auiplugin:aui-experimental-soy-templates'" template="'aui.page.pagePanelContent'">
                <ui:param name="'content'">

            <h1><ww:text name="'common.concepts.report'"/>: <ww:property value="report/label" /></h1>
                <form method="get" id="configure-report" class="aui" name="jiraform" action="ConfigureReport.jspa">
                    <fieldset>
                        <%--<page:applyDecorator name="jiraform" >--%>
                            <%--<page:param name="class">GET</page:param>--%>
                            <%--<page:param name="method">GET</page:param>--%>
                            <%--<page:param name="action">ConfigureReport.jspa</page:param>--%>
                            <%--<page:param name="suppressAtlToken">true</page:param>--%>
                            <%--<page:param name="cancelURI"><%= request.getContextPath() %>/secure/BrowseProject.jspa</page:param>--%>
                            <%--<page:param name="width">100%</page:param>--%>
                            <%--<page:param name="title"><ww:text name="'common.concepts.report'"/>: <ww:property value="report/label" /></page:param>--%>
                            <%--<page:param name="description">--%>
                                <%--<ww:if test="report/description"><b><ww:text name="'common.concepts.description'"/>:</b><br/><ww:property value="report/description" escape="false" /></ww:if>--%>
                            <%--</page:param>--%>
                            <ww:if test="report/description">
                            <p>
                                <b><ww:text name="'common.concepts.description'"/>:</b><br/>
                                <ww:property value="text(report/description)" escape="false" />
                            </p>
                                <ww:if test="hasErrorMessages == 'true'">
                                    <aui:component template="auimessage.jsp" theme="'aui'">
                                        <aui:param name="'messageType'">error</aui:param>
                                        <aui:param name="'titleText'"><ww:text name="'panel.errors'"/></aui:param>
                                        <aui:param name="'messageHtml'">
                                            <ul>
                                                <ww:iterator value="flushedErrorMessages">
                                                    <li><ww:property /></li>
                                                </ww:iterator>
                                            </ul>
                                        </aui:param>
                                    </aui:component>
                                </ww:if>
                            </ww:if>
                            <ww:if test="loginAdvisable == true">
                                <tr><td colspan="2">
                                    <aui:component template="auimessage.jsp" theme="'aui'">
                                        <aui:param name="'messageType'">info</aui:param>
                                        <aui:param name="'messageHtml'">
                                            <ww:text name="loginAdviceMessage"/>
                                        </aui:param>
                                    </aui:component>
                                </td></tr>
                            </ww:if>
                            <fieldset>
                            <ww:iterator value="objectConfiguration/fieldKeys" >
                                <%@ include file="/includes/panels/objectconfiguration_form.jsp"  %>
                            </ww:iterator>
                            <ui:component name="'selectedProjectId'" value="selectedProjectId" template="hidden.jsp" />
                            <ui:component name="'reportKey'" value="reportKey" template="hidden.jsp" />
                                <% if (! Boolean.FALSE.equals(request.getAttribute("jira.portletform.showsavebutton")))
                                   { // if there is a problem with one of the parameters not being satisfied above, then we should not show the save button
                                     // Fixes JRA-5279
                                %>
                                <page:param name="submitId">next_submit</page:param>
                                <page:param name="submitName"><ww:text name="'common.forms.next'"/></page:param>
                                <% }
                                   else
                                   { // reset the submit button to empty since in tomcat the state seems to be cached and we run into JRA-5042
                                %>
                                <page:param name="submitName"><ww:text name="''"/></page:param>
                                <%
                                   }
                                %>
                                </fieldset>
                            <div class="buttons-container">
                                <% if (! Boolean.FALSE.equals(request.getAttribute("jira.portletform.showsavebutton")))
                                { // if there is a problem with one of the parameters not being satisfied above, then we should not show the save button
                                    // Fixes JRA-5279
                                %>
                                <input class="aui-button" id="next_submit" type="submit" name="<ww:text name="'common.forms.next'"/>" value="<ww:text name="'common.forms.next'"/>"/>
                                <% }
                                else
                                { // reset the submit button to empty since in tomcat the state seems to be cached and we run into JRA-5042
                                %>
                                <input class="aui-button" id="next_submit" type="hidden" name="" value="" hidden="true"/>
                                <%
                                    }
                                %>
                                <a class="aui-button aui-button-link" id="cancelButton" href="<ww:url page="/secure/BrowseProject.jspa"><ww:param name="'name'" value="name" /></ww:url>" title="<ww:property value="text('common.forms.cancel')"/> (<ww:property value="@modifierKey"/> + <ww:text name="'common.forms.cancel.accesskey'" />)">
                                    <ww:property value="text('common.forms.cancel')"/>
                                </a>
                            </div>
                        </fieldset>
                    </form>

                </ui:param>
            </ui:soy>
        </ui:param>
    </ui:soy>
</body>
</html>
