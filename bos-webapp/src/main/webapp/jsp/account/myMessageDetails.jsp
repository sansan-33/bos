<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ include file="../common-header.jsp" %>
<jsp:include page="../menu.jsp"/>  

<jsp:include page="accountMenu.jsp"/>
<div class="wrapper" style="width:535px;">
<c:set var="privatemessage"><spring:message code="label.privatemessage" arguments="${requestScope.user['namelocal']}"/></c:set>
<div style="padding:10px;" class="font4N d3-color-gray-2"> ${requestScope.type eq 'private' ?  privatemessage  : requestScope.entity['name']}</div>
<jsp:include page="../chat.jsp"/>
</div>
<jsp:include page="../common-footer.jsp"/>
