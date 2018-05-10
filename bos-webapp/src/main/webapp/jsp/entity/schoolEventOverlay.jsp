<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">

</HEAD>
<body>
	
	<div style="padding:70px 40px 60px 40px; ">
	<ul>
	<c:choose>
    	<c:when test="${not empty requestScope.schoolEvent}">
	<c:forEach var="event" items="${requestScope.schoolEvent}" varStatus="rowCounter">
  		<li style="list-style: none;margin-bottom:25px">
  		<div class="with-date event-list">
		    <div class="datetag" style="width:30px;font-size:0.9em;">${event['shortweekday']}<div style="font-size:2.2em;">${event['shortday']}</div>
		    ${event['shortmonth']}<br>${event['fouryear']}
		    </div>
		    <div style="padding-left:30px;">
  		        <div style="padding-bottom:5px;"><font class="fontxxlarge d3-color-black">${event['title']}</font></div>
		        <div><font class="fontxlarge">${event['note']}</font></div>
		    </div>
		</div>
		</li>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<li style="list-style: none;margin-bottom:10px"><font class="font4s"><spring:message code="label.noinformation"/></font></li>
	</c:otherwise>
	</c:choose>
	</ul>
</div>
	
  	</body>
  	</HTML>