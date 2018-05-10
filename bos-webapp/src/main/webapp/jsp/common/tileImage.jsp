<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div style="width:800px;">
<c:forEach var="photo" items="${requestScope.entityImages}" varStatus="rowCounter">

<img class="imagedropshadow" src="/school/staticimage/CAT${photo['categoryid']}/logo_${photo['chscid']}.jpg" onerror="ImgError(this);" width="35px" height="35px"/>
<c:if test="${rowCounter.count % 17 eq 0 }"><br class="clear"></c:if>							
							
</c:forEach>
</div>
