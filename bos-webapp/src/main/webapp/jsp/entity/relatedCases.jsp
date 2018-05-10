<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:if test="${not empty  requestScope.caseslist}">
<div class="news" style="padding-left:10px;overflow:hidden;">
<span class="subject font4 d3-color-orange"><spring:message code="label.relatedcases"/></font></span><br class="clear"/><br class="clear"/>
<c:forEach var="casesharing" items="${requestScope.caseslist}" varStatus="rowCounter">
<div style="position:relative;float:left;width:5px;top:10px;left:5px;"><img src="/school/img/greendot.png"/></div>
<div style="position:relative;float:left;width:200px;left:15px;"><a href="/school/controller/getCaseSharingDetails?id=${casesharing['id']}"><font class="fontlarge fontbold">
${ fn:length(casesharing['title']) > 35 ? fn:substring(casesharing['title'], 0, 33) : casesharing['title'] }${ fn:length(casesharing['title']) > 35 ? '...' : '' } 
</font></a></div>
<br>
<div style="position:relative;float:left;width:200px;left:15px;top:3px;" class="fontlarge d3-color-gray-1 fontlarge" >
${ fn:length(casesharing['analysis']) > 50 ? fn:substring(casesharing['analysis'], 0, 50) : casesharing['analysis'] }${ fn:length(casesharing['analysis']) > 50 ? '...' : '' } 
</div>
<br>
<div style="position:relative;float:left;width:2px;">&nbsp;</div>
<div style="position:relative;float:left;width:105px;left:12px;padding: 5px 0px 5px 4px;" class="font1 d3-color-gray-3">
<fmt:formatDate value="${casesharing['created']}" dateStyle="full"/>
</div>
<p class="celar"></p>
<div style="position:relative;float:left;width:40px;padding: 5px 3px 5px 0px;" class="font1 d3-color-gray-2" >${casesharing['username']}</div>

<br class="clear"/>
</c:forEach>
</div>
</c:if>