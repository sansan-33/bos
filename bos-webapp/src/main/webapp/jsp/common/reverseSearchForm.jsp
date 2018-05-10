<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>

 <form action="/school/controller/schoolReverseSearch" method="post" name="reverseSchoolSearch" id="reverseSchoolSearch" >
<input id="sortby" type="hidden" name="sortby" value="${sessionScope.searchCriteria['sortby']}" />
<input id="sortorder" type="hidden" name="sortorder" value="${sessionScope.searchCriteria['sortorder']}"  />
<input type="hidden" id="allocationyearform" name="allocationyear" value="-1" />

<div class="dbl-bdr"><div class="wrapper medium">
<table  cellpadding="0" cellspacing="1">
<tr><td>
<div class="title parbase"><div class="custom-title tk">
	    		<div class="ib">
	        
	            <span class="category">
	                <spring:message code="label.sitename"/>
	            </span>
	        	
	        	 
	        	<div class="ib">
	            <span class="custom-title-line custom-title-line__l" ></span>
	            <font class="title fontbold">
	                <spring:message code="label.reversesearch"/>
	            </font>
	            <span class="custom-title-line custom-title-line__r"></span>
	        	</div>
	        	 
	    		</div>
			</div></div>
<div class="font2 d3-color-gray-3" style="padding:10px;"><spring:message code="label.reversesearchdesc"/></div>
<p>		
		    <jsp:include page="chainedSelectReverseSchool.jsp"/>

<div style="float:right;position:relative;right:10px;">
<button  type="submit" class="btn btn-red tk tk2" onclick='submitform()'>
			<span><spring:message code="label.search"/></span></button>
			</div>

</p>
</td>
</tr>	

</table>
		
</form>

</div></div>

<!--  End of Search -->

<script>
function submitform ()
{
$('#reverseSchoolSearch').submit();
}
</script> 

       
