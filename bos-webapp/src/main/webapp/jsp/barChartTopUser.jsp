<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>

<jsp:useBean id="date" class="java.util.Date" />
<c:set var="dateParts" ><fmt:formatDate value="${date}" pattern="MM" /></c:set>

<style>
    .usergraph { 
        position: relative; /* IE is dumb */
        width: ${ empty requestScope.barwidth ?  '160' : requestScope.barwidth}px;
        border: 1px solid white; 
        padding: 2px; 
	background: rgb(233,233,233); 
    }
    .usergraph .bar { 
        display: block;
        position: relative;
	    background: rgb(144,192,24); 
        text-align: left; 
        color: #333; 
        height: 1.3em; 
        line-height: 1.3em;            
    }
    .usergraph .bar p { position: absolute; left: 1em; width:${ empty requestScope.barwidth ?  '160' : requestScope.barwidth}px;  }
</style>
<div class="imamazingbg1">
	<c:choose>
    	<c:when test="${empty requestScope.bartype }">
			<p class="top10Title"><img style="position:relative;top:10px" src="/school/img/ribbon.gif"/><spring:message code="label.parentrating"/><spring:message code="label.rankingreport" arguments="" argumentSeparator=";"/>
				<font class="font1_5"><spring:message code="label.lastmodified"/><fmt:formatDate pattern="dd-MM-yy" value="${requestScope.topUserList[0]['lastmodified']}" /></font></p>
		</c:when>
		<c:when test="${requestScope.bartype eq 'case'}" >
			<c:set var="signup"><spring:message code="label.casesharingsignupdesc"/></c:set>
			<c:set var="casesharingdesc"><spring:message code="label.casesharingdesc"/></c:set>
			<p class="top10Title"><img style="position:relative;top:10px;left:10px;" src="/school/img/crown.png"/><spring:message code="label.casesharingwinner" arguments="${dateParts}" argumentSeparator=";"/>
				<font class="font1_5"  ><spring:message code="label.lastmodified"/><fmt:formatDate pattern="dd-MM-yy" value="${requestScope.topUserList[0]['lastmodified']}" /></font></p>
		</c:when>
	</c:choose>
<div style="float:right;width:30px;right:10px;position:relative;" >
<ul style="list-style-type: none;padding: 0px;margin: 0px;">
<c:forEach var="user" items="${requestScope.topUserList}" varStatus="rowCounter">
<li style="padding-left:3px;padding-bottom:3px;padding-top:4px;"> <font class="font1" >${user['userscore']}<spring:message code="label.score"/></font><li>
</c:forEach>
</ul>
</div>

<div style="float:right;right:10px;position:relative;">
<c:forEach var="user" items="${requestScope.topUserList}" varStatus="rowCounter">
<div class="usergraph">
    	<strong class="bar" style="width: ${ (user['userscore'] * 100) / user['maxscore'] }%;">
    	<c:choose>
    	<c:when test="${empty requestScope.bartype }">
			<a href="/school/controller/entityDetails?entityid=${user['entityid']}&action=compare"><p style="color:white" class="font2">${user['namelocal']}</p></a>
		</c:when>
		<c:when test="${requestScope.bartype eq 'case'}" >
			<a href="/school/controller/getCaseSharingDetails?id=${user['entityid']}"><p style="color:white" class="font2">${user['namelocal']}</p></a>
		</c:when>
		</c:choose>
	</strong>
</div>
</c:forEach>
</div>
<div style="clear:both" />
<c:if test="${requestScope.bartype eq 'case'}" >
			<p class="font1 d3-color-gray-1" style="position:relative;top:0px;left:60px;padding-bottom:5px;padding-top:5px;">${not empty sessionScope.user ? casesharingdesc : signup }</p>
</c:if>	

</div>