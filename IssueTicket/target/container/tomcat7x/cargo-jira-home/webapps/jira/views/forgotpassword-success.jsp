<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="webwork" prefix="ui" %>
<%@ taglib uri="webwork" prefix="aui" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>
<html>
<head>
    <title><ww:text name="'forgotpassword.success.title'"/></title>
    <meta name="decorator" content="message" />
</head>
<body>
    <div class="form-body">
        <header>
            <h1><ww:text name="'forgotpassword.success.title'"/></h1>
        </header>
        <aui:component template="auimessage.jsp" theme="'aui'">
            <aui:param name="'messageType'">success</aui:param>
            <aui:param name="'messageHtml'">
                <p><ww:text name="'forgotpassword.success.line1'"/></p>
                <p><ww:text name="'forgotpassword.success.line2'"/></p>
                <p>
                    <ww:text name="'forgotpassword.success.line3'">
                        <ww:param name="'value0'"><ww:property value="administratorContactLink" escape="'false'"/></ww:param>
                    </ww:text>
                </p>
            </aui:param>
        </aui:component>
    </div>
</body>
</html>
