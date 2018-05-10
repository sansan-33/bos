<%@ page isErrorPage="true" %>
<% exception.printStackTrace(response.getWriter()); %>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<META http-equiv='Content-Type' content='text/html;charset=utf-8'>
</head>
<body>
<spring:message code="label.websitedown" text="default text"/>
</body>
</html>