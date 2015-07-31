<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><ww:text name="'admin.issuefields.fieldconfigurations.view.field.configuration'"/></title>
    <meta name="admin.active.section" content="admin_issues_menu/element_options_section/fields_section"/>
    <meta name="admin.active.tab" content="field_configuration"/>
</head>
<body>
<page:applyDecorator name="jirapanel">
    <page:param name="title"><ww:text name="'admin.issuefields.fieldconfigurations.view.field.configuration'"/></page:param>
    <page:param name="width">100%</page:param>
    <page:param name="helpURL">issuefields</page:param>
    <page:param name="postTitle">
        <ui:component theme="'raw'" template="projectshare.jsp" name="'name'" value="'value'" label="'label'">
            <ui:param name="'projects'" value="/usedIn"/>
        </ui:component>
    </page:param>
    <p>
        <ww:text name="'admin.issuefields.the.table.below.shows'">
            <ww:param name="'value0'"><b id="field-layout-name"><ww:property value="/fieldLayout/name"/></b></ww:param>
        </ww:text>
    </p>
    <p><ww:text name="'admin.issuefields.configure.page.description'"/></p>
    <ul class="optionslist">
        <li><ww:text name="'admin.issuefields.configure.view.all'">
            <ww:param name="'value0'"><a id="view_fieldlayouts" href="ViewFieldLayouts.jspa"></ww:param>
            <ww:param name="'value1'"></a></ww:param>
        </ww:text></li>
        <ww:if test="hasDefaultFieldLayout == false">
            <li>
                <a id="restore_default" href="RestoreDefaults.jspa"><ww:text name="'admin.common.phrases.restore.defaults'"/></a>
            </li>
        </ww:if>
    </ul>

</page:applyDecorator>


<table id="field_table" class="aui aui-table-rowhover">
    <thead>
    <tr>
        <th width="50%">
            <ww:text name="'common.words.name'"/>
        </th>
        <th width="30%">
            <ww:text name="'admin.issuefields.screens'"/>
        </th>
        <th width="20%">
            <ww:text name="'common.words.operations'"/>
        </th>
    </tr>
    </thead>
    <tbody>
    <ww:iterator value="/orderedList" status="'status'">
        <tr>
            <ww:if test="./hidden == true">
                <td class="hiddenField">
                    <b><ww:property value="/fieldName(./orderableField)"/></b>
                    <ww:if test="/fieldLocked(./orderableField) == true">
                        <span class="aui-lozenge status-locked" title="<ww:text name="/managedFieldDescriptionKey(./orderableField)"/>"><ww:text name="'admin.managed.configuration.items.locked'"/></span>
                    </ww:if>
                    <ww:elseIf test="/fieldManaged(./orderableField) == true">
                        <span class="aui-lozenge status-managed" title="<ww:text name="/managedFieldDescriptionKey(./orderableField)"/>"><ww:text name="'admin.managed.configuration.items.managed'"/></span>
                    </ww:elseIf>
                    <ww:if test="/renderable(./orderableField) == true">
                        <div id="renderer_value_<ww:property value="./orderableField/id"/>" class="secondary-text"> [<ww:property value="/rendererDisplayName(./rendererType)"/>]</div>
                    </ww:if>
                    <ww:if test="./fieldDescription != null">
                        <%-- this section just prints out if it is a custom field, and prints out the type of custom field that it is --%>
                        <div class="description"><ww:property value="./fieldDescription" escape="'false'"/></div>
                    </ww:if>
                </td>
                <td>
                    <ww:if test="/unscreenable(.) == true">
                        <ww:text name="'admin.issuefields.field.cannot.be.placed.on.screens'"/>
                    </ww:if>
                    <ww:if test="/fieldScreenTabs(./orderableField)/empty == false">
                        <ul>
                            <ww:iterator value="/fieldScreenTabs(./orderableField)" status="'tabStatus'">
                                <li>
                                    <ww:if test="./fieldScreen/tabs/size > 1">
                                        <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<ww:property value="./fieldScreen/id" />&tabPosition=<ww:property value="./position" />"><ww:property value="./fieldScreen/name"/></a>
                                        <span class="small">(<ww:property value="./name"/>)</span>
                                    </ww:if>
                                    <ww:else>
                                        <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<ww:property value="./fieldScreen/id" />"><ww:property value="./fieldScreen/name"/></a>
                                    </ww:else>
                                </li>
                            </ww:iterator>
                        </ul>
                    </ww:if>
                    <ww:else>&nbsp;</ww:else>
                </td>
                <td class="hiddenField">
                    <ul class="operations-list">
                        <ww:if test="/fieldLocked(./orderableField) == false">
                            <li><ww:text name="'common.words.edit'"/></li>
                            <li>
                                <a id="show_<ww:property value="@status/index"/>" href="<ww:url page="IssueFieldHide.jspa"><ww:param name="'hide'" value="@status/index" /></ww:url>" title="<ww:text name="'admin.issuefields.show.field'"><ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param></ww:text>"><ww:text name="'admin.common.words.show'"/></a>
                            </li>
                            <ww:if test="/mandatory(.) == false">
                                <ww:if test="/requirable(.) == true">
                                    <li><ww:text name="'admin.common.words.required'"/></li>
                                </ww:if>
                            </ww:if>
                        </ww:if>
                    </ul>
                </td>
            </ww:if>
            <ww:else>
                <td>
                    <b><ww:property value="/fieldName(./orderableField)"/></b>
                    <ww:if test="/mandatory(.) == true || ./required == true">
                        <span class="aui-lozenge status-required"><ww:text name="'admin.common.words.required'"/></span>
                    </ww:if>
                    <ww:if test="/fieldLocked(./orderableField) == true">
                        <span class="aui-lozenge status-locked" title="<ww:text name="/managedFieldDescriptionKey(./orderableField)"/>"><ww:text name="'admin.managed.configuration.items.locked'"/></span>
                    </ww:if>
                    <ww:elseIf test="/fieldManaged(./orderableField) == true">
                        <span class="aui-lozenge status-managed" title="<ww:text name="/managedFieldDescriptionKey(./orderableField)"/>"><ww:text name="'admin.managed.configuration.items.managed'"/></span>
                    </ww:elseIf>
                    <ww:if test="/renderable(./orderableField) == true">
                        <div id="renderer_value_<ww:property value="./orderableField/id"/>" class="secondary-text"> [<ww:property value="/rendererDisplayName(./rendererType)"/>]</div>
                    </ww:if>
                    <ww:if test="./fieldDescription != null">
                        <div class="description"><ww:property value="./fieldDescription" escape="'false'"/></div>
                    </ww:if>
                </td>
                <td>
                    <ww:if test="/unscreenable(.) == true">
                        <ww:text name="'admin.issuefields.field.cannot.be.placed.on.screens'"/>
                    </ww:if>
                    <ww:if test="/fieldScreenTabs(./orderableField)/empty == false">
                        <ul>
                            <ww:iterator value="/fieldScreenTabs(./orderableField)" status="'tabStatus'">
                                <li>
                                    <ww:if test="./fieldScreen/tabs/size > 1">
                                        <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<ww:property value="./fieldScreen/id" />&tabPosition=<ww:property value="./position" />"><ww:property value="./fieldScreen/name"/></a>
                                        <span class="small">(<ww:property value="./name"/>)</span>
                                    </ww:if>
                                    <ww:else>
                                        <a href="<%= request.getContextPath() %>/secure/admin/ConfigureFieldScreen.jspa?id=<ww:property value="./fieldScreen/id" />"><ww:property value="./fieldScreen/name"/></a>
                                    </ww:else>
                                </li>
                            </ww:iterator>
                        </ul>
                    </ww:if>
                    <ww:else>&nbsp;</ww:else>
                </td>
                <td>
                    <ul class="operations-list">
                        <ww:if test="/fieldLocked(./orderableField) == false">
                            <li>
                                <a id="edit_<ww:property value="@status/index"/>" href="<ww:url page="/secure/admin/EditDefaultFieldLayoutItem!default.jspa"><ww:param name="'position'" value="@status/index"/></ww:url>"><ww:text name="'common.words.edit'"/></a>
                            </li>
                            <ww:if test="/hideable(.) == true">
                                <li>
                                    <a id="hide_<ww:property value="@status/index"/>" href="<ww:url page="IssueFieldHide.jspa"><ww:param name="'hide'" value="@status/index" /></ww:url>" title="<ww:text name="'admin.issuefields.hide.field'">
                            <ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param>
                        </ww:text>"><ww:text name="'admin.common.words.hide'"/></a></li>
                            </ww:if>
                            <ww:if test="/mandatory(.) == false">
                                <ww:if test="/requirable(.) == true">
                                    <li>
                                        <a id="require_<ww:property value="@status/index"/>" href="<ww:url page="IssueFieldRequire.jspa"><ww:param name="'require'" value="@status/index" /></ww:url>"
                                           <ww:if test="required == false">title="<ww:text name="'admin.issuefields.make.field.required'">
                                <ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param>
                            </ww:text>"><ww:text name="'admin.common.words.required'"/></ww:if><ww:else>title="<ww:text name="'admin.issuefields.make.field.optional'">
                                            <ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param>
                                        </ww:text>"><ww:text name="'admin.common.words.optional'"/></ww:else></a></li>
                                </ww:if>
                            </ww:if>
                        </ww:if>
                        <ww:if test="/unscreenable(.) == false">
                            <li>
                                <a id="associate_<ww:property value="./orderableField/id" />" href="AssociateFieldToScreens!default.jspa?fieldId=<ww:property value="./orderableField/id"/>&returnUrl=ViewIssueFields.jspa" title="<ww:text name="'admin.issuefields.associate.to.screens'">
                                <ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param>
                            </ww:text>"><ww:text name="'admin.issuefields.screens'"/></a></li>
                        </ww:if>
                        <ww:if test="/fieldLocked(./orderableField) == false">
                            <ww:if test="/renderable(./orderableField) == true">
                                <li>
                                    <a id="renderer_<ww:property value="./orderableField/id"/>" href="<ww:url page="EditFieldLayoutItemRenderer!default.jspa"><ww:param name="'rendererEdit'" value="@status/index" /></ww:url>" title="<ww:text name="'admin.issuefields.choose.renderer'">
                            <ww:param name="'value0'">'<ww:property value="/fieldName(./orderableField)"/>'</ww:param>
                        </ww:text>"><ww:text name="'admin.issuefields.renderers'"/></a></li>
                            </ww:if>
                        </ww:if>
                    </ul>
                </td>
            </ww:else>
        </tr>
    </ww:iterator>
    </tbody>
</table>
<ui:component theme="'raw'" template="projectsharedialog.jsp" name="'name'" value="'value'" label="'label'">
    <ui:param name="'projects'" value="/usedIn"/>
    <ui:param name="'title'"><ww:text name="'admin.project.shared.list.heading.fields'"/></ui:param>
</ui:component>

</body>
</html>
