<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<title><spring:message code="label.yourrating"/></title>
<META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bos.min.css'/>
</HEAD>
<body>
<div>
			<div style="padding:5px" >
			<c:choose>
			<c:when test="${empty requestScope.parentRatingList }">
  			<font class="font4s"><spring:message code="label.noinformation"/></font>
  			</c:when>
  			<c:otherwise>
			<c:forEach var="school" items="${requestScope.parentRatingList}" varStatus="rowCounter">
			<img style="float: left; padding-right: 15px;" src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg"  onerror="ImgError(this);"  width="70px" height="60px"/>
 			<font class="font1" style="float: left;padding-top:3px;">${school['name']}</font><br>
 			<c:set var="varempty" value=""/>
			<font class="font1" style="float: left;padding-top:3px;">${ fn:length(school['nameeng']) > 22 ? fn:substring(school['nameeng'], 0, 22) : school['nameeng']}${ fn:length(school['nameeng']) > 22 ? '...' : varempty}</font><br>
			<font class="font1" style="float: left;padding-top:3px;"><spring:message code="label.yourrating"/> : ${school['yourscore']}</font><br>
			<font class="font1" style="float: left;padding-top:3px;"><spring:message code="label.parentrating"/> : ${school['parentscore']}</font><br>
			<div class="line-type2-flat"></div>
			<br class="clearboth">
			</c:forEach>
			</c:otherwise>
			</c:choose>
  	</div>
  	</body>
  	</HTML>