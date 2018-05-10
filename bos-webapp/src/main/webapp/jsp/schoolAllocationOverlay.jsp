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

</HEAD>
<body>
	<div style="padding-top:15px;padding-bottom:10px;padding-left:15px;font-size:1.8em;float:left" class="row10 d3-color-gray-3">${entity['name']} --
	<font class="d3-color-gray-1"><spring:message code="label.schoolallocation${requestScope.sacategoryid}"/></font><br>
	    <font class="fonttiny d3-color-gray-3">${ fn:length(entity['nameeng']) > 50 ? fn:substring(entity['nameeng'], 0, 50) : entity['nameeng']}${ fn:length(entity['nameeng']) > 50 ? ' ... ' : ''}</font>
  	</div>
	<div style="padding-top:15px;position:relative;right:-20px;font-size:2.1em;float:left" class="row10 d3-color-gray-3">

  	</div>
	<br class="clear">
	<div style="margin-left:13px;margin-right:50px;" class="border-bottom-gray"></div>
	<c:forEach var="schoolAllocationlist" items="${requestScope.schoolallocationlistall}" varStatus="counterall">
				
	<div style="padding:5px 20px 5px 15px;position:relative;float:left;width:210px;" >
		<c:choose>
			<c:when test="${empty schoolAllocationlist }">
  				<font class="font4s"><spring:message code="label.noinformation"/></font>
  			</c:when>
  			<c:otherwise>
				<div style="float:left;position:relative;" class="fontxxlarge fontbold d3-color-gray-1">${schoolAllocationlist[0]['allocationyear']}</div>
				<c:if test="${fn:length(schoolAllocationlist[0]['reference']) > 5}">
	 			<a style="float:right;padding-left:3px;" href="${schoolAllocationlist[0]['reference']}" target="_blank"><font class="fontlarge"><spring:message code="label.source"/></font></a>
				</c:if>
				<br><br>
				<div class="border-bottom-gray"></div>
				<br>
				<c:forEach var="schoolAllocationitem" items="${schoolAllocationlist}" varStatus="rowCounter">
				
				<img style="float: left; padding-right: 10px;padding-bottom:20px;" src="/school/staticimage/CAT${requestScope.sacategoryid}/logo_${schoolAllocationitem['chscid']}.jpg" onerror="ImgError(this);"  width="40px" height="35px"/>
	 			<a href="/school/controller/entityDetails?entityid=${schoolAllocationitem['entityidto']}&action=compare">
	 			<font class="fontlarge" style="color:#666 !important">${schoolAllocationitem['name']}</font><br>
				<font class="fontmedium d3-color-gray-3">${ fn:length(schoolAllocationitem['nameeng']) > 30 ? fn:substring(schoolAllocationitem['nameeng'], 0, 30) : schoolAllocationitem['nameeng']}${ fn:length(schoolAllocationitem['nameeng']) > 30 ? ' ... ' : ''}</font></a><br>
				<span style="padding-top:3px;padding-bottom:3px;" class="fontmedium d3-color-gray-3"><spring:message code="label.schoolrating"/> : <font class="fontbold d3-color-gray-1">${schoolAllocationitem['score']}</font></span>
				<span class="fontmedium d3-color-gray-3"><spring:message code="label.noofstudent"/> : <font class="fontbold d3-color-gray-1"> ${schoolAllocationitem['noofstudent']}</font></span>
	  			<br class="clearboth">
				<div class="border-bottom-gray"></div><br>
				<p class="clearboth"></p>
				</c:forEach>
			</c:otherwise>
		</c:choose>
  	</div>
  	<c:if test="${fn:length(requestScope.schoolallocationlistall) > 1 }">
  	<div style="position:relative;float:left;border-left: 1px solid #e5e5e5;min-height:${ (fn:length(schoolAllocationlist) - 1) * 720 / 10}px;top:30px;padding-right:10px"></div>
  	</c:if>
  	</c:forEach>
  	</body>
  	</HTML>