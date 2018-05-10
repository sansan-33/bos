<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="month" value="${now}" pattern="M" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<%@ include file="../common-header.jsp" %>
<link rel="stylesheet" type="text/css" href="../stylesheet/font-awesome.min.css"/>

<jsp:include page="../menu.jsp"/>


<jsp:include page="../ads/wideAds.jsp"/>
<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br><br class="clearboth">

<span class="d3-color-gray-1 fontxxxlarge" style="padding-right:5px;"><spring:message code="label.eventcalendar"/></span>
<span class="d3-color-gray-2 fontxlarge"><spring:message code="label.eventcalendar.intro"/></span>

<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
	<c:set var="statkey">eventCalendar-1</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br class="clear">
<div class=" border-bottom-gray"></div>

<div style="padding-left:15px;float:left;top:10px;position:relative;"><a href="/school/controller/eventFullCalendar?view=calendar&data=all"><i class="fa fa-calendar fa-2x"></i></a></div>
<div style="padding-left:15px;padding-right:15px;float:left;top:11px;position:relative;"><a href="/school/controller/eventFullCalendar?year=${year}&view=list#todayanchor"><i class="fa fa-list fa-2x"></i></a></div>
<div style="float:left;top:10px;position:relative;padding-left:20px;border-left: 1px solid">
<a href="/school/controller/privateDssReport?type=privatedss&view=list&year=${requestScope.year}"><font class="fontxlarge" style="${requestScope.type eq 'privatedss' ? 'color: #2b9646' : '' } "><spring:message code="label.privatedssreport"/></font></a>
</div>

<div style="float:right;top:10px;position:relative;padding-right:20px;">
<a   class="btn btn-red tk tk2" href="/school/controller/getCalendarEventForm?eventid=${requestScope.eventid}&view=list" rel="#overlay_entityedit" style="text-decoration:none;">
	    <span><spring:message code="label.newevent"/></span>
</a>
</div>

<div style="float:right;top:12px;position:relative;padding-right:20px;padding-left:15px;">
                        <span style="padding-right:5px;" class="fontlarge fontbold"><spring:message code="label.year"/> : </span>
                        <a href="/school/controller/eventFullCalendar?data=all&view=list"><font class="d3-color-${requestScope.data eq 'all' ? 'blue fontbold' : 'gray-1' }"><spring:message code="label.allthetime"/></font></a> |
                        <c:forEach var="i" begin="2012" end="${requestScope.rankingyear + 1}">
            		    <a href="/school/controller/eventFullCalendar?year=${i}&view=list&type=${requestScope.type}"><font class="d3-color-${requestScope.year eq i ? 'blue fontbold' : 'gray-1' }">${i}</font></a> |
                        </c:forEach>

</div>

<div style="padding-right:15px;float:right;top:12px;position:relative;border-right: 1px solid">
    <i class="fa fa-check fa-1x" style="color:#ccc"> : <spring:message code="label.active"/></i>
    <i class="fa fa-times fa-1x" style="color:#ccc"> : <spring:message code="label.expiry"/></i>
</div>
<div style="padding-top:15px;">
<jsp:include page="../common/timetable.jsp"/><br><br>
</div>

<br class="clear"/>


<jsp:include page="../common-footer.jsp"/>



