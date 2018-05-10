<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<title>${requestScope.schoolCompareAnalytics['title']}</title>
<META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bos.min.css'/>
</HEAD>
<body>
<div>
			<div style="padding:5px" >
			<c:choose>
			<c:when test="${empty requestScope.favoriteUserList }">
  			<font class="font4s"><spring:message code="label.noinformation"/></font>
  			</c:when>
  			<c:otherwise>
			<c:forEach var="user" items="${requestScope.favoriteUserList}" varStatus="rowCounter">
			<a href="/school/controller/viewProfile?userid=${user['id']}">
			<img style="float: left; padding-right: 15px;" id="thumb" width="40px" height="40px;" src="/school/userimages/${user['userprofile']}" onerror="UserImgError(this);" />
 			</a>
 			<font class="font1" style="float: left;padding-top:3px;"><spring:message code="label.username"/> : ${user['namelocal']}</font><br>
			<font class="font1" style="float: left;padding-top:3px;"><spring:message code="label.userscore"/> : ${user['score']}</font><br>
			<font class="font1" style="float: left;padding-top:3px;"><spring:message code="label.userjoindate"/> : <fmt:formatDate pattern="dd-MMM-yyyy" value="${user['schooljoindate']}" /></font><br>
			
			<div class="line-type2-flat"></div>
			<br class="clearboth">
			</c:forEach>
			</c:otherwise>
			</c:choose>
  	</div>
  	</body>
  	</HTML>