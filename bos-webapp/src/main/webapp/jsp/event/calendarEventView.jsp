<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" type="text/css" href="/school/stylesheet/date.css"/>
 
 <c:catch var="catchException">
 
 
 <c:if test="${sessionScope.user['ROLEID'] == 1}">
    <div>
    <a href="#" onclick="javascript:hideEvent(${requestScope.event['id']});" style="float:left;padding-left:20px;">x</a>
    </div>
</c:if>
<div style="padding:45px 20px 20px 40px;">
    <div style="float:left">
        <a href="/school/controller/entityDetails?entityid=${requestScope.event['entityid']}&action=compare">
	    <img style="top:10px;position:relative;padding-right:20px;" src="/school/staticimage/CAT${requestScope.event['categoryid']}/logo_${requestScope.event['chscid']}.jpg" onerror="ImgError(this);" width="100px" height="90px"/>
   	    </a>
   	</div>
   	<div style="float:left;padding-top:10px;padding-bottom:15px;">
        <a href="/school/controller/entityDetails?entityid=${requestScope.event['entityid']}&action=compare">
            <div class="fontSchoolNameChi fontbold" >${requestScope.event['name']}</div>
    	    <div style="padding-top:5px;padding-bottom:5px;" class="fontxxlarge fontbold" >${requestScope.event['nameeng']}</div>
        </a>
           <div style="float:left;position:relative;" class="d3-color-gray-3">${requestScope.event['address']}</div>
           <div style="padding-left:15px;float:left;position:relative;" class="d3-color-gray-3">${requestScope.event['telephone']}</div>
           <br>
           <div style="float:left;position:relative;padding-top:3px;"><a href="${requestScope.event['url']}" target="_blank">${requestScope.event['url']}</a></div>
           <div style="padding-top:3px;padding-left:15px;float:left;position:relative;" class="d3-color-gray-3">${empty event['financetype'] ? '--' : event['financetype']  }</div>
           <div style="padding-top:3px;padding-left:15px;float:left;position:relative;" class="d3-color-gray-3"><spring:message code="label.schoolfee"/>: $ ${requestScope.event['schoolfee']}</div>
           <br class="clear">
	</div>
	<div class="fonttiny d3-color-gray-3" style="float:right;top:15px;right:10px;position:relative;">By ${ not empty requestScope.event['ipaddr'] ? requestScope.event['ipaddr'] : 'bookofschool'}</div>
	<br><div class="fonttiny d3-color-gray-3" style="float:right;top:15px;right:10px;position:relative;">${requestScope.event['created']}</div>
    <br class="clear">
    <div class="important">
            <spring:message code="label.directregister"/>
    </div>

    <div style="padding-left:10px;">
    <br class="clear">
        <div class="border-bottom-gray"></div>
        <br class="clear">

        <div style="float:left;position:relative;padding-top:3px;" class="fontxxlarge d3-color-gray-1 fontbold">${requestScope.event['title']}</div>
        <div style="float:right;position:relative;padding-top:3px;padding-right:35px;" class="fontxlarge d3-color-gray-3 fontbold"><spring:message code="label.betweendaterange" arguments="${requestScope.event['startdate']};${requestScope.event['enddate']}" htmlEscape="false" argumentSeparator=";" /></div>
        <br class="clear"><br><div class="border-bottom-gray"></div>
        <br>
        <div class="fontxlarge d3-color-gray2">${requestScope.event['note']}</div>
	</div>
	<br class="clear"/><br class="clear"/>


    <div class="eventchat">
	    <jsp:include page="../chat.jsp"/>
    </div>
</div>

</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>