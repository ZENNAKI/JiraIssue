<%@ page import="com.atlassian.jira.license.LicenseBannerHelper" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>

<%--Traditional banner for license expiry--%>
<script>
    AJS.$(function () {
        var licenseBanner = require("jira/license-banner");
        licenseBanner.showLicenseBanner("<%= StringEscapeUtils.escapeEcmaScript(ComponentAccessor.getComponentOfType(LicenseBannerHelper.class).getExpiryBanner())%>");
        licenseBanner.showLicenseFlag("<%= StringEscapeUtils.escapeEcmaScript(ComponentAccessor.getComponentOfType(LicenseBannerHelper.class).getMaintenanceFlag())%>");
    });
</script>
