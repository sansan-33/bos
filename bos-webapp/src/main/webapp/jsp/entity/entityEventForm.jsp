<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <link rel="stylesheet" type="text/css" href="/school/stylesheet/date.css"/>
 

 
 <script>
 
 	$(document).ready(function(){
		$(":date").dateinput();
    });
    
    function checkform ()
    {
    	$("#note").val($("#smalleditor").val());
    
    	$('#event').submit();
  	// ** END **
	}
    </script>

<c:choose>
	<c:when test="${sessionScope.user['roleid'] eq '1' || (sessionScope.user['roleid'] eq '4' && sessionScope.user['adminentity'] eq requestScope.entityid) }">
		<c:set var="submitform">javascript:{checkform()}</c:set> <!-- full name -->
	</c:when>
	<c:otherwise>
		<c:set var="submitform">alert('<spring:message code='label.applyschooledit'/>')</c:set> <!-- full name -->
	</c:otherwise>
</c:choose>


<div style="padding:30px;">	
<c:set var="header1"><spring:message code="label.${requestScope.eventtype}"/></c:set>
<div class="subject fontxlarge d3-color-grey fontbold"><p style="position:relative;left:10px;">${header1}</p></div><br>	
<c:if test="${not (sessionScope.user['roleid'] eq '1' || (sessionScope.user['roleid'] eq '4' && sessionScope.user['adminentity'] eq requestScope.entityid)) }">
	<div style="float:left;position:relative;top:-15px;left:15px;" class="fonttiny d3-color-orange"><spring:message code="label.applyschooledit"/></div>
</c:if>
 <form name="event" action="saveEntityEvent" method="post" id="event">
   		<input type="hidden" name="note" id='note' value="" />
   		<input type="hidden" name="action" id='action' value="compare" />
   		
   		<input type="hidden" name="id" value="${requestScope.event['id']}" id="id" />
		<input type="hidden" name="entityid" id='entityid' value="${requestScope.entityid}" />
   		<input type="hidden" name="eventtype" id='eventtype' value="${requestScope.eventtype}" />
   			
			
		<table style="position:relative;">
			<tr>
				<td valign="top" align="right" class="d3-color-gray-1"><spring:message code="label.title"/>: </td>
				<td><textarea id="title" name="title" style="width:465px;height:40px;">${not empty requestScope.event["title"] ?  requestScope.event["title"] :  header1}</textarea></td>
			</tr>
			<c:if test="${requestScope.eventtype ne 'principalsay' }">
			<tr>
				<td align="right" class="d3-color-gray-1"><spring:message code="label.from"/>: </td>
				<td>
					<input type="date" id="startdate" name="startdate" value="${requestScope.event['startdate']}" />
				</td>
			</tr>
			<tr>		
					<td align="right" class="d3-color-gray-1"><spring:message code="label.to"/>: </td>
					<td>
					<input type="date" id="enddate" name="enddate" value="${requestScope.event['enddate']}" />
					</div>
				</td>
			</tr>
			</c:if>
			<tr>
				<td align="right" class="d3-color-gray-1"><div style="position:relative;top:-100px;"><spring:message code="label.details"/>: </div></td>
				<td>
				<textarea id="smalleditor" name="smalleditor" style="width:465px;height:200px;">${requestScope.event['note']}</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align:center;">
				
				<div style="position:relative;float:right;">
   				<span class="button_grn"><span class="bg_grn gradient" onclick="${submitform}">OK</span>
				</span>
				</div>
				<div style="position:relative;float:right;padding-right:50px;">
   				<label class="fontxlarge d3-color-gray-1"><spring:message code='label.ispublish'/>&nbsp;&nbsp;<input id="active" name="active" value="y" type="checkbox" ${ requestScope.event['active'] eq 'y' ? 'checked' : '' }> </label>
				</div>
				</td>
			</tr>
		</table>
</form>
</div>