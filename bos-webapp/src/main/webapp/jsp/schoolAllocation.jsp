<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<!DOCTYPE HTML>
<HTML>
<HEAD>
<script type="text/javascript" >
function saveSchoolAllocation(){
	
	if(! document.getElementById("nodata").checked ){
		$('#nodata').val('n') ;
		$('#nodata').attr('checked','checked');
		//alert(document.getElementById("nodata").checked);
	}
	$.post("/school/controller/saveSchoolAllocation" , $("#schoolAllocation").serialize() , function(data) { // Do an AJAX call
		showMessage(data);
		closeAll();
	});
}

function closeAll() {
	  $("a[rel]").each(function() {
	    $(this).overlay().close();
	  });
	}
</script>
</HEAD> 

  <form id="schoolAllocation" name="schoolAllocation" action="saveSchoolAllocation" method="post">
  <table style="position:relative;" cellspacing=10px; cellpadding=10px;>
  			<tr><td><spring:message code="label.url"/></td><td> <a href="${requestScope.entity['url']}" target="_blank"><font class="fontsmall d3-color-gray-2">${requestScope.entity['url']}</font></a></td></tr>
			<c:if test="${not empty requestScope.oldref }">
  			<tr><td colspan="2"><a href="${requestScope.oldref}" target="_blank"><font class="fontsmall d3-color-gray-2"><spring:message code="label.source"/></font></a></td></tr>
			</c:if>
			<tr>
				<td><spring:message code="label.schoolname"/></td>
				<td>
				<textarea id="entityidto" name="entityidto" style="width:250px;" rows="12" cols="100" ><c:forEach var="schoolAllocationitem" items="${requestScope.schoolallocationlistall[0]}" varStatus="rowCounter">${schoolAllocationitem['name']}-${schoolAllocationitem['noofstudent']},</c:forEach></textarea>
				</td>
			</tr>
			<tr>
				<td><spring:message code="label.source"/></td>
				<td><input id="reference" type="text" style="width:250px;"  value='${ not empty requestScope.schoolallocationlistall[0][0]["reference"] ? requestScope.schoolallocationlistall[0][0]["reference"] : requestScope.oldref }' name="reference" /></td>
			</tr>
			<tr>
				<td><spring:message code="label.year"/></td>
			    <td>${requestScope.rankingyear}</td>
           </tr>
			<tr>
				<td><spring:message code="label.noinfoprovided"/></td>
				<td>
				<input type="checkbox" name="nodata" id="nodata" <c:if test="${requestScope.schoolallocationlistall[0][0]['entityidto'] == '-1'}">checked</c:if>  value="y">
				</td>
			</tr>
				
			<tr>
				<td colspan="2" style="text-align:center;">
   		    <input id="allocationyear" type="hidden" value="${requestScope.rankingyear}"  name="allocationyear" />
        	<input type="hidden" name="entityidfrom" value="${requestScope.entityidfrom}" id="entityidfrom" />
			<input type="hidden" name="entityid" value="${requestScope.entityidfrom}" id="entityid" />
			<input type="hidden" name="sacategoryid" value="${requestScope.sacategoryid}" id="sacategoryid" />
			<span class="button_grn"><span class="bg_grn gradient" onclick="javascript:saveSchoolAllocation();"><spring:message code="label.done"/></span></span>
			
				</td>
			</tr>
		</table>
</form>
	
</HTML>