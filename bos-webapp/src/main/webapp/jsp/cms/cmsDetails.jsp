<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="htmltitle" scope="request">${fn:trim(requestScope.cms['title'])}</c:set>
<c:set var="htmlkeywords" scope="request">${fn:trim(requestScope.cms['title'])}</c:set>
<c:set var="htmldesc" scope="request">${fn:trim(requestScope.cms['title'])}</c:set>
<c:set var="htmlrobots" scope="request">${fn:trim(requestScope.cms['title'])}</c:set>
<c:set var="htmlgooglebot" scope="request">${fn:trim(requestScope.cms['title'])}</c:set>

<%@ include file="../common-header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<jsp:include page="../menu.jsp"/>

<div class="d3-color-gray">
<h1>${requestScope.cms['title']}</h1>
<div class="d3-color-grey" style="position:relative;float:left;padding-top:10px;padding-bottom:10px;"><spring:message code="label.by"/><font style="padding-left:2px;padding-right:2px;" class="d3-color-blue"><spring:message code="label.sitename"/></font>${requestScope.cms['shortdate']}
<a href="#commentap"><img style="padding-left:5px;" src="/school/img/d3bubble.png"/><font class="d3-color-blue"> ${requestScope.chatmsgcount}</font></a>
</div>

<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
	<c:set var="statkey">cms-${cms['id']}</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue"> ${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br class="clear">
    
<div><img src="${requestScope.cms['imgfilename']}"/></div>
<div style="padding:50px 15px;">
${requestScope.cms['content']}
</div>
</div>

<div style="padding:20px;"  >
<hr>
<a name="commentap"></a>
<jsp:include page="../chat.jsp"/>
 </div>      
<jsp:include page="../common-footer.jsp"/>


