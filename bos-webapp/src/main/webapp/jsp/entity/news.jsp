<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:if test="${not empty  requestScope.newslist}">
<div class="news" style="padding:10px;overflow:hidden;">
<span class="subject font4 d3-color-orange"><spring:message code="label.relatednews"/></span><br class="clear"/><br class="clear"/>
<c:forEach var="news" items="${requestScope.newslist}" varStatus="rowCounter">
<div style="position:relative;float:left;width:5px;top:5px;left:7px;"><img src="/school/img/greendot.png"/></div>
<div style="position:relative;float:left;left:12px;"><a href="/school/controller/getForumDetails?id=${news['id']}&type=q&categoryid=${requestScope.categoryid}">
${ fn:length(news['subject']) > 35 ? fn:substring(news['subject'], 0, 33) : news['subject'] }${ fn:length(news['subject']) > 35 ? '...' : '' } 
</a></div>
<br class="clear"/>
<div style="position:relative;float:left;width:5px;">&nbsp;</div>
<div style="position:relative;float:left;width:60px;left:12px;padding: 5px 3px 5px 0px;" class="font1 d3-color-gray-1" >${news['newspapername']}</div>
<div style="position:relative;float:left;width:130px;padding: 5px 0px 5px 0px;" class="font1 d3-color-gray-2">
<fmt:formatDate value="${news['created']}" dateStyle="full"/>
								
</div>

<br class="clear"/>
</c:forEach>
</div>
</c:if>