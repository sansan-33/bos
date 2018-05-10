<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:if test="${fn:length(requestScope.eventsMap) > 0}">

<link href="/school/stylesheet/ticker-style.css" rel="stylesheet" type="text/css" />
<script src="/school/js/jquery.ticker.js" type="text/javascript"></script>


<ul id="js-news" class="js-hidden">
	<c:forEach var="event" items="${requestScope.eventsMap}" varStatus="rowCounter">
		<c:choose>
			<c:when test="${event['categoryid'] eq 1}">
	    		<li class="news-item"><a href="/school/controller/privateDssReport#${event['entityid']}-ap">${event['title']} - ${event['startdate']} </a></li>
	    	</c:when>
	    	<c:when test="${not empty event['casesharing']}">
	    		<li class="news-item"><a href="/school/controller/getCaseSharingDetails?id=${event['entityid']}">${event['title']} - ${event['startdate']} </a></li>
	    	</c:when>
	    	<c:otherwise>
	    			<li class="news-item">${event['title']} - ${event['startdate']}</li>
	    	</c:otherwise>
    	</c:choose>
    </c:forEach>
    
    
</ul>
<br class="clear"/>  
	<jsp:useBean id="date" class="java.util.Date" />
	<c:set var="dateParts" ><fmt:formatDate value="${date}" pattern="MM" /></c:set>
		<c:choose>
			<c:when test="${not empty requestScope.eventsMap[0]['casesharing']}">
	    		<c:set var="titletext"><spring:message code="label.winner" arguments="${dateParts-1}" argumentSeparator=";"/></c:set>
	    	</c:when>
	    	<c:otherwise>
	    		<c:set var="titletext"><spring:message code="label.latestnews"/></c:set>
	    	</c:otherwise>
    	</c:choose>


<script type="text/javascript">

	$(function () {
	    $('#js-news').ticker({debugMode: true,controls: false,titleText: '${titletext}'});
	});

</script>

</c:if>       