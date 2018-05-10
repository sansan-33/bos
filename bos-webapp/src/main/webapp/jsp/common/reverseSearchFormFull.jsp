
<%@ include file="../common-header.jsp" %>
	
<jsp:include page="../menu.jsp"/>
<c:set var="statkey">reverseSearch-1</c:set>
<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
    <div style="margin-right:5px;margin-left:5px;top:4px;position:relative;float:right" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></div>
</div>
<br><br><br class="clearboth">

<form action="/school/controller/schoolReverseSearch" method="post" name="reverseSchoolSearch" id="reverseSchoolSearch" >
<input id="sortby" type="hidden" name="sortby" value="${sessionScope.searchCriteria['sortby']}" />
<input id="sortorder" type="hidden" name="sortorder" value="${sessionScope.searchCriteria['sortorder']}"  />

<div class="dbl-bdr"><div class="wrapper large">
<table  cellpadding="0" cellspacing="1" style="min-height:500px;">
<tr><td>
<div class="title parbase"><div class="custom-title tk">
	    		<div class="ib">
	            <font class="fontxxxlarge fontbold">
	                <spring:message code="label.reversesearch"/>
	            </font>
	           </div>
			</div></div>
<div class="font4 d3-color-gray-3" style="padding:10px;"><spring:message code="label.reversesearchdesc"/></div>
<p>		
		    <jsp:include page="chainedSelectReverseSchool.jsp"/>

<div style="float:right;position:relative;padding-top:50px;">
<button  type="submit" class="btn btn-red tk tk2" onclick='submitform()'>
			<span><spring:message code="label.search"/></span></button>
</div>
</p>
</td>
</tr>	
</table>
		
</form>

</div></div>


<br><br class="clearboth">
<jsp:include page="../ads/wideKiwiAds.jsp"/>
<br class="clearboth">

<jsp:include page="../common-footer.jsp"/>
<!--  End of Search -->

<script>
function submitform ()
{
$('#reverseSchoolSearch').submit();
}
</script> 

