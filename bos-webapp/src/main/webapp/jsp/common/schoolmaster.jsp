<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div style="min-height:200px;">
<div class="fontxlarge d3-color-gray-1" style="border-top: 2px solid rgb(233,233,233);padding:5px 0px 5px 0px;"><spring:message code="label.schoolmaster"/></div>
<c:forEach var="master" items="${requestScope.schoolmasterlist}" varStatus="rowCounter">
<div class="commondiv" style="padding:2px;height:10px;" onclick="window.location='/school/controller/viewProfile?userid=${master['id']}'" >
<span style="position:relative;float:left;">
${master['namelocal']}
</span>
<span style="position:relative;float:right;">
${master['userscore']}
</span>
</div>
<br class="clear"/>
</c:forEach>

</div>


