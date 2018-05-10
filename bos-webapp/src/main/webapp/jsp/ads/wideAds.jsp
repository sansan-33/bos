<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<table style="width:1120px;">
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td width="300px;"><jsp:include page="yahoocontentmatchright.jsp"/></td>
<td valign="top" align="right">
<c:choose>
    <c:when test="${GURU_HANG eq 'true'}">
        <jsp:include page="yahooMedium.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="maximizerMedium.jsp"/>
    </c:otherwise>
</c:choose>
</td>
<td valign="top" align="right"><jsp:include page="adsfactorrectangle.jsp"/></td></tr>
</table>
<br class="clear">
