<%@ page import="com.atlassian.jira.bc.JiraServiceContext" %>
<%@ page import="com.atlassian.jira.bc.JiraServiceContextImpl" %>
<%@ page import="com.atlassian.jira.bc.user.search.UserPickerSearchService" %>
<%@ page import="com.atlassian.jira.security.JiraAuthenticationContext" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.jira.component.ComponentAccessor" %>
<%--
-- userselect.jsp
--
-- Required Parameters:
--   * label      - The description that will be used to identfy the control.
--   * name       - The name of the attribute to put and pull the result from.
--   * formname   - The name of the form on which the control is to be placed. This is so the value can be returned
--   * userMode   - What mode of users should be returned. 1 = All users 2= Assignable Users etc

-- Optional Parameters:
--   * imageName   - determines what the image of the userselect will be called

--   * labelposition   - determines were the label will be place in relation
--                       to the control.  Default is to the left of the control.
--   * size       - SIZE parameter of the HTML INPUT tag.
--   * maxlength  - MAXLENGTH parameter of the HTML INPUT tag.
--   * disabled   - DISABLED parameter of the HTML INPUT tag.
--   * readonly   - READONLY parameter of the HTML INPUT tag.
--   * onkeyup    - onkeyup parameter of the HTML INPUT tag.
--   * onfocus    - onfocus parameter of the HTML INPUT tag.
--   * onchange  - onkeyup parameter of the HTML INPUT tag.
--   * tabindex  - tabindex parameter of the HTML INPUT tag.
--%>

<%--  Multi-Select User Picker

  -- set parameter 'multiSelect' to true to enable multi-select

  -- Required Parameters:
  --   * col      - The textarea number of columns to display.
  --   * row       - The textarea number of rows to display.
  --   * name   - The name of the form on which the control is to be placed. This is so the value can be returned
  --   * formname   - The name of the form on which the control is to be placed. This is so the value can be returned
  --   * userMode   - What mode of users should be returned. 1 = All users 2= Assignable Users etc
  --   * multiSelect   - Enables selection of multiple users
--%>

<%-- NOTE - ANY CHANGES TO THIS FILE - ALSO UPDATE pickertable.vm --%>

<%@ taglib uri="webwork" prefix="ww" %>

 <%
     // Only include extra web resources (css, js) if Ajax Issue Picker turned on

    JiraAuthenticationContext authenticationContext = ComponentAccessor.getJiraAuthenticationContext();
    JiraServiceContext ctx = new JiraServiceContextImpl(authenticationContext.getUser());
    UserPickerSearchService searchService = ComponentAccessor.getComponentOfType(UserPickerSearchService.class);

    boolean canPerformAjaxSearch = searchService.canPerformAjaxSearch(ctx);
    WebResourceManager webResourceManager = ComponentAccessor.getWebResourceManager();
    webResourceManager.requireResource("jira.webresources:autocomplete");
 %>
<%-- Use the ID if specified, otherwise fall back to use name. This is to avoid issues with dots "." inside names breaking JS --%>
<ww:property value="parameters['id']">
    <ww:if test="."><ww:property id="fieldId" value="." /></ww:if>
    <ww:else><ww:property id="fieldId" value="parameters['name']" /></ww:else>
</ww:property>

<fieldset rel="<ww:property value="parameters['name']"/>" class="hidden user-picker-params">
    <input type="hidden" title="formName" value="<ww:property value="parameters['formname']" />">
    <input type="hidden" title="fieldName" value="<ww:property value="parameters['name']" />">
    <input type="hidden" title="fieldId" value="<ww:property value="@fieldId" />">
    <input type="hidden" title="multiSelect" value="<ww:if test="parameters['multiSelect'] == true">true</ww:if><ww:else>false</ww:else>">
    <% if (canPerformAjaxSearch) { %><input type="hidden" title="userPickerEnabled" value="true"><% } %>    
</fieldset>

<div class="ajax_autocomplete" id="<ww:property value="@fieldId"/>_container">
<ww:if test="parameters['multiSelect'] == true">
    <textarea name="<ww:property value="parameters['name']"/>" cols="<ww:property value="parameters['cols']"/>" rows="<ww:property value="parameters['rows']"/>" id="<ww:property value="@fieldId"/>"
        <ww:property value="parameters['disabled']">
            <ww:if test="{parameters['disabled']}">DISABLED</ww:if>
        </ww:property>
        <ww:property value="parameters['readonly']">
            <ww:if test="{parameters['readonly']}">READONLY</ww:if>
        </ww:property>
    ></textarea>
</ww:if>
<ww:else>
<input type="text"
       name="<ww:property value="parameters['name']"/>"
       id="<ww:property value="@fieldId"/>"
      <ww:property value="parameters['size']">
         <ww:if test=".">size="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['maxlength']">
         <ww:if test=".">maxlength="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['nameValue']">
         <ww:if test=".">value="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['disabled']">
         <ww:if test="{parameters['disabled']}">DISABLED</ww:if>
      </ww:property>
      <ww:property value="parameters['readonly']">
         <ww:if test="{parameters['readonly']}">READONLY</ww:if>
      </ww:property>
      <ww:property value="parameters['onkeyup']">
         <ww:if test=".">onkeyup="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['tabindex']">
         <ww:if test=".">tabindex="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['onchange']">
         <ww:if test=".">onchange="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['onfocus']">
         <ww:if test=".">onfocus="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['style']">
         <ww:if test=".">style="<ww:property value="."/>"</ww:if>
      </ww:property>
      <ww:property value="parameters['class']">
         <ww:if test=".">class="<ww:property value="."/>"</ww:if>
      </ww:property>
/></ww:else>
<ww:property value="parameters['disabled']">
    <ww:if test="hasPermission('pickusers') == true">
        <a class="popup-trigger" href="#"><span class="icon-default aui-icon aui-icon-small aui-iconfont-admin-roles" title="<ww:if test="parameters['multiSelect'] == true"><ww:text name="'user.picker.select.users'"/></ww:if><ww:else><ww:text name="'user.picker.select.user'"/></ww:else>"></span></a>
    </ww:if>
    <ww:else>
        <span class="aui-icon aui-icon-small aui-iconfont-locked" title="<ww:text name="'user.picker.no.permission'"/>"></span>
    </ww:else>
</ww:property>
<% if (canPerformAjaxSearch) { %>
    <div id="<ww:property value="@fieldId"/>_results" class="ajax_results"></div>
    <div class="autocomplete-desc"><ww:text name="'user.picker.ajax.desc'"/></div>
<% } %>
</div>
