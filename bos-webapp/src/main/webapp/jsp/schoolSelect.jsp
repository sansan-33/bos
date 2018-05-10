<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div style="padding:30px; 10px;">
<c:choose>
<c:when test="${requestScope.multipleselect eq 'y'}">
<c:set var="btnname"><spring:message code="label.addandcontinue"/></c:set>
<c:set var="javascriptfunc">javascript:appendEntityId('${requestScope.hiddenfieldid}')</c:set>
<p><spring:message code="label.multipleselect"/></p>
</c:when>
<c:otherwise>
<c:set var="btnname"><spring:message code="label.done"/></c:set>
<c:set var="javascriptfunc">javascript:{setEntityId('${requestScope.hiddenfieldid}');}</c:set>
</c:otherwise>
</c:choose>
<form name="schoolselect" id="schoolselect">
	<span style="position:relative;float:right;top:20px;padding-right:10px;">
		<span class="button_grn">
		<span class="bg_grn gradient font1white" onclick="${javascriptfunc}">${btnname }
		</span></span>
	</span>
	<div style="padding: 20px 0 20px 0px;">
	<jsp:include page="common/chainedSelectSchool.jsp"/>
	</div>
	<c:if test="${requestScope.multipleselect eq 'y'}">
		<div id="selectedschooltext" class="selectedschooltext" style="padding:5px;"> 
		</div>
	</c:if>
</form>
</div>






       
