<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page contentType='text/html; charset=UTF-8' %>


<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/timeline.css'>	

<script src="/school/js/jquery.timelinr-0.9.5.js" type="text/javascript"></script>

<script type="text/javascript"> 
   $(function(){
      $().timelinr({
         orientation: 'horizontal',         // value: horizontal | vertical, default to horizontal
         containerDiv: '#timeline',         // value: any HTML tag or #id, default to #timeline
         datesDiv: '#dates',         		// value: any HTML tag or #id, default to #dates
         datesSelectedClass: 'selected',    // value: any class, default to selected
         datesSpeed: 'normal',         // value: integer between 100 and 1000 (recommended) or 'slow', 'normal' or 'fast'; default to normal
         issuesDiv : '#issues',         // value: any HTML tag or #id, default to #issues
         issuesSelectedClass: 'selected',         // value: any class, default to selected
         issuesSpeed: 'fast',         // value: integer between 100 and 1000 (recommended) or 'slow', 'normal' or 'fast'; default to fast
         issuesTransparency: 0.2,         // value: integer between 0 and 1 (recommended), default to 0.2
         issuesTransparencySpeed: 500,         // value: integer between 100 and 1000 (recommended), default to 500 (normal)
         prevButton: '#timeline_prev',         // value: any HTML tag or #id, default to #prev
         nextButton: '#timeline_next',         // value: any HTML tag or #id, default to #next
         arrowKeys: 'false',         // value: true/false, default to false
         startAt: ${requestScope.eventstart},         // value: integer, default to 1 (first)
         autoPlay: 'false',         // value: true | false, default to false
         autoPlayDirection: 'forward',         // value: forward | backward, default to forward
         autoPlayPause: 2000         // value: integer (1000 = 1 seg), default to 2000 (2segs)
      });
   });
</script>
<div id="timeline">
   <ul id="dates">
   <c:forEach var="event" items="${requestScope.eventlist}" varStatus="rowCounter">
      <li><a class="timeline" href="#"><fmt:formatDate pattern="dd-MMM-yy" value="${event['ordertime']}" /></a></li>
    </c:forEach>
   </ul>
   <ul id="issues">
   <c:forEach var="event" items="${requestScope.eventlist}" varStatus="rowCounter">
   	   	<li id="<fmt:formatDate pattern="dd-MMM-yy" value="${event['ordertime']}" />">
   	 	<c:choose>
		<c:when test="${ event['title'] eq 'application' or event['title'] eq 'interview' or event['title'] eq 'result'}">
			<h1>${event['name']}: <spring:message code="label.reminder.${event['title']}"/></h1>
		</c:when>
		<c:when test="${ event['title'] eq 'today'}">
			<c:set var="catdesc"><spring:message code="label.school"/></c:set>
			<h1><spring:message code="label.today.myfavoritelist" arguments="${sessionScope.favoritecount};${catdesc}" argumentSeparator=";"/></h1>
		</c:when>
		<c:otherwise>
		<h1>${event['title']}</h1>
		</c:otherwise>
		</c:choose>
        <p>${event['note']}</p>
      	</li>
    </c:forEach>
   </ul>
   <a href="#" id="timeline_next">+</a> <!-- optional -->
   <a href="#" id="timeline_prev">-</a> <!-- optional -->
   
</div>

