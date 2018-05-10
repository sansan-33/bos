<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request">${requestScope.courseform['courseclass']} - ${requestScope.courseform['coursename']}</c:set>
<c:set var="htmlkeywords" scope="request">${requestScope.courseform['courseclass']},${requestScope.courseform['coursename']}</c:set>
<c:set var="htmldesc" scope="request">${requestScope.courseform['courseclass']} - ${requestScope.courseform['coursename']}</c:set>
<c:set var="htmlrobots" scope="request">${requestScope.courseform['courseclass']}, ${requestScope.courseform['coursename']}</c:set>
<c:set var="htmlgooglebot" scope="request">${requestScope.courseform['courseclass']}, ${requestScope.courseform['coursename']}</c:set>
<%@ include file="../common-header.jsp" %>



<c:set var="bestdesc">bestdesc${requestScope.tutorcategoryid}</c:set>
<c:set var="tutorialexp">tutorialexp${requestScope.tutorcategoryid}</c:set>
    	
   
<jsp:include page="../menu.jsp"/>  

<div class="wrapper" style="width:600px;">
  <div class="db-detail-box colors-subtle item-detail-box icon-size-default">
		<div class="detail-icon ">
			<span class="d3-icon d3-icon-item d3-icon-item-64  d3-icon-item-green">
				<span class="icon-item-gradient">
					<img class="icon-item-inner icon-item-default" style="cursor: pointer; cursor: hand;" src="/school/userimages/${requestScope.courseform['userprofile']}"  onerror="UserImgError(this);" onclick="window.location='/school/controller/viewProfile?userid=${requestScope.courseform['userid']}'" />
				</span>
			</span>
		</div>
		<div class="detail-level">
			<div class="detail-level-inner">
				<spring:message code="label.hitcount"/>
			</div>
			<c:set var="statkey">course-${courseform['id']}</c:set>
			<span class="detail-level-number">${objectStatMap[statkey].hitcounter}</span>
		</div>
		<div class="detail-text">
		<h2 class="d3-color-orange" style="font-size: 22px;" >${requestScope.courseform['coursename']}</h2>

		<div style="position:relative;float:right;top:20px;left:70px;">
			<g:plusone size="medium"></g:plusone><br>
			<div class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div><br><br>
		
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
				<a style='padding-left:20px;' href='/school/controller/getChatDialog?id=${requestScope.courseform["questionanswerid"]}&type=c&entityid=${requestScope.courseform["id"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_chat'> 
				<c:choose>
					<c:when test="${requestScope.courseform['questionanswerid'] eq '-1' }">
						<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.apply'/>" /></span></span>
					</c:when>
					<c:otherwise>
						<span class="wrpBtn" ><span class="button_ta mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.chathistory'/>" /></span></span>
					</c:otherwise>
				</c:choose>
				</a> 
			</c:when>
			<c:otherwise>
				<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:50px;" onclick='alert("<spring:message code="label.pleaselogin"/>");' class="submit" type="button"  value="<spring:message code='label.apply'/>" /></span></span>
			</c:otherwise>
		</c:choose>
		</div>
										
			<div class="d3-item-properties">
				<!--
				<ul class="item-type-right">
					<li class="item-slot">${requestScope.courseform['courseclass']}</li>
				</ul>
				-->
					
				<ul class="item-type">
					<li>
						<span class="d3-color-orange">${requestScope.courseform['courseclass']}</span>
					</li>
				</ul>
				<ul class="item-armor-weapon item-armor-armor">
					<li class="big"><span class="value">${requestScope.courseform['hourlyrate']}</span></li>
					<li><spring:message code="label.hourlyrate"/></li>
				</ul>
				<div class="item-before-effects"></div>
				<ul class="item-effects">
					<li class="d3-color-blue"><p><spring:message code="label.sex"/><span class="value"> ${requestScope.courseform['sex']}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.tutorbestquali"/><span class="value"> ${requestScope.tutor[bestdesc]}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.tutorialexp"/><span class="value"> ${requestScope.tutor[tutorialexp]}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.tutorialteaching"/><span class="value"> ${requestScope.courseform['gradestart']} - ${requestScope.courseform['gradeend']}</span> </p></li>
					<c:if test="${not empty requestScope.courseform['notes']}">
					<c:set var="yesmsg"><spring:message code="label.tutorialnotesyes"/></c:set>
					<c:set var="nomsg"><spring:message code="label.tutorialnotesno"/></c:set>
					<li class="d3-color-blue"><p><spring:message code="label.tutorialnotes"/><span class="value"> ${requestScope.courseform['notes'] eq 'y' ? yesmsg : nomsg } </span> </p></li> 
					</c:if>
				</ul>
				<span class="clear"><!-- --></span>
			</div>
		</div>
		
			<div style="padding: 20px 60px 20px 130px;" class="fontmedium d3-color-gray-1">
					<pre>${requestScope.courseform['coursedesc']}</pre>
			</div>	
		<span class="sticker tl"></span>
		<span class="sticker br"></span>
	</div>
</div>

<jsp:include page="../common-footer.jsp"/>


