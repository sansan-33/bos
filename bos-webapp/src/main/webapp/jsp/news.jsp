<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<h2>News</h2>
<FORM id="news" NAME="news" METHOD=POST>
<table>
<tbody>
<c:set var="oldSubject" value=""/>


<c:forEach var="news" items="${requestScope.newsList}" varStatus="rowCounter">
<c:if test="${news['subject'] != oldSubject }">
<TR VALIGN=top>
  <TD><b>${news['subject']}</b></TD>
</TR>
</c:if> 
<TR>
  <TD class="newstab">${news['content']} <fmt:formatDate pattern="dd MMM yyyy HH:mm" value="${news['lastModified']}" /></TD>
</TR>
<c:set var="oldSubject" value="${news['subject']}"/>
</c:forEach>
</tbody>
</TABLE>
</FORM>

