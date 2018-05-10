<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$(".reqoralclassdiv").hide();
				$(".reqextraclassdiv").hide();
				$(".reqsportclassdiv").hide();
				$(".reqtutorialclassdiv").hide();
				$(".reqmusicclassdiv").hide();
				
				<c:choose>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupmusicclassid'])  gt 0 }">
					$(".reqmusicclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookuporalclassid'])  gt 0  }">
					$(".reqoralclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupextraclassid'])  gt 0 }">
					$(".reqextraclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupsportclassid'])  gt 0 }">
					$(".reqsportclassdiv").show();
				</c:when>
				<c:otherwise>
					$(".reqtutorialclassdiv").show();
				</c:otherwise>
				</c:choose>

				
				$('div.reqtutormainborder').corner("round 3px");
				$('div.reqtutormain').corner("round 4px");
				$('div.reqtutorsearch').corner();

			} );
</script>

<script type="text/javascript">

function toggleRequestClassRange(){
	
	var arr = new Array("tutorial","music","oral","extra","sport");
	for(var i=0; i<arr.length; i++) {
		$(".req" +  arr[i] + "classdiv" ).hide();
	}	
	
	$(".req" + arr[document.forms["requesttutor"].reqtutorcategoryid.value] + "classdiv" ).show();
		
}

function checkform ( form )
{

	// ** START **
	if (form.reqtutorcategoryid.value == "") {
	    alert( "<spring:message code='label.plschoose'/><spring:message code='label.coursesearchselect'/>" );
	    form.reqtutorcategoryid.focus();
	    return false ;
	}
	
  	if (form.reqdistrictlookupid.value == "") {
	    alert( "<spring:message code='label.plschoose'/><spring:message code='label.districtsearchselect'/>" );
	    form.reqdistrictlookupid.focus();
	    return false ;
	}
	 
  	if (form.reqkidgradelookupid.value == "") {
	    alert( "<spring:message code='label.plschoose'/><spring:message code='label.gradesearchselect'/>" );
	    form.reqkidgradelookupid.focus();
	    return false ;
	}
  	if (form.reqhourlyrate.value == "") {
		alert( "<spring:message code='label.plsinput'/><spring:message code='label.hourlyrate'/>" );
	    form.reqhourlyrate.focus();
	    return false ;
	}
	if (form.reqsex.value == "") {
		alert( "<spring:message code='label.plschoose'/><spring:message code='label.tutorsex'/>" );
	    form.reqsex.focus();
	    return false ;
	}
  
  // ** END **
  form.submit();
}

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tutor -->
<div id="tutorcourse">
  <div style="padding-left:20px;background-color: rgb(242,246,235);">
    <br><br><br>
    
	<form action="/school/controller/saveRequestTutor" method="post" name="requesttutor" id="requesttutor">
	<input type="hidden" name="id" value="${requestScope.id} "/>
	<div style="float:left;">
	<select id="reqtutorcategoryid" style="width: 10em;" name="reqtutorcategoryid" onchange="javascript:toggleRequestClassRange()">
	  	<option value=""><spring:message code="label.coursesearchselect"/></option>
		<c:forEach var="tutorcategory" items="${requestScope.reqtutorCategoryList}" varStatus="rowCounter">
				<option value="${tutorcategory['value']}"  <c:if test="${sessionScope.courseSearch['tutorcategoryid'] eq tutorcategory['value']}">selected</c:if> >
	                    		${tutorcategory['description']}  ${tutorcategory['tooltips']}
				</option>
	  	</c:forEach>
	</select>
	</div>
	
	<c:forEach var="classtype" items="${fn:split('tutorial|music|extra|oral|sport', '|')}" varStatus="status" >
	<c:set var="classtypelookupid">lookup${classtype}classid</c:set>
	<div class="req${classtype}classdiv"  style="float:left;">
			<select id=reqlookup${classtype}classid style="width:17em;margin-left:5px;" name="reqlookup${classtype}classid" >
		  		<option value=""><spring:message code="label.coursesearchselect"/></option>
				<c:choose>
					<c:when test="${status.count eq 1}">
						<c:forEach var="courseclass" items="${requestScope.reqtutorialclasslist}" varStatus="rowCounter">
							<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
			                    		${courseclass['description']}
							</option>
			  			</c:forEach>
					</c:when>
					<c:when test="${status.count eq 2}">
						<c:forEach var="courseclass" items="${requestScope.reqmusicclasslist}" varStatus="rowCounter">
									<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
					                    		${courseclass['description']}
									</option>
					  			</c:forEach>
					</c:when>
					<c:when test="${status.count eq 3}">
						<c:forEach var="courseclass" items="${requestScope.reqextraclasslist}" varStatus="rowCounter">
									<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
					                    		${courseclass['description']}
									</option>
					  			</c:forEach>
					</c:when>
					<c:when test="${status.count eq 4}">
						<c:forEach var="courseclass" items="${requestScope.reqoralclasslist}" varStatus="rowCounter">
									<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
					                    		${courseclass['description']}
									</option>
					  			</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="courseclass" items="${requestScope.reqsportclasslist}" varStatus="rowCounter">
									<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
					                    		${courseclass['description']}
									</option>
					  			</c:forEach>
					</c:otherwise>
				</c:choose>
	
			</select>
	</div>		
	</c:forEach>
	<br><br>
	<div style="float:left;">
	<select id="reqdistrictlookupid" style="width: 10em;" name="reqdistrictlookupid" >
	  	<option value=""><spring:message code="label.districtsearchselect"/></option>
		<c:forEach var="district" items="${requestScope.reqdistrictlist}" varStatus="rowCounter">
				<option value="${district['value']}"  <c:if test="${sessionScope.courseSearch['districtlookupid'] eq district['value']}">selected</c:if> >
	                    		${district['description']}  
				</option>
	  	</c:forEach>
	</select>
	</div>
	<div style="float:left;padding-left:5px;">
	<select id="reqkidgradelookupid" style="width: 17em;" name="reqkidgradelookupid" >
	  	<option value=""><spring:message code="label.gradesearchselect"/></option>
		<c:forEach var="kidgrade" items="${requestScope.reqkidgradelist}" varStatus="rowCounter">
				<option value="${kidgrade['value']}"  <c:if test="${sessionScope.courseSearch['kidgradelookupid'] eq kidgrade['value']}">selected</c:if> >
	                    		${kidgrade['description']}  
				</option>
	  	</c:forEach>
	</select>
	</div>
	<br><br>
	<div style="float:left;padding-left:5px;">		
	<span class="font3b" style="width:180px;padding-right:5px;"><spring:message code="label.hourlyrate"/></span>:<input style="margin-left:10px;width:40px;" type="text" name="reqhourlyrate" size="10" value="${sessionScope.courseSearch['hourlyrate']}"/>
	</div> 	
	<div style="float:left;padding-left:60px;">		
		<c:set var="boy"><spring:message code="label.boy"/></c:set>
	 	<c:set var="girl"><spring:message code="label.girl"/></c:set>
		<font class="font3b" ><spring:message code="label.tutorsex"/></font>: <input type=radio name=reqsex value="<spring:message code='label.boy'/>"  ${sessionScope.courseSearch['sex'] eq boy ? 'checked' : ''}   > <spring:message code='label.boy'/> <input type=radio name=reqsex value="<spring:message code='label.girl'/>" ${sessionScope.courseSearch['sex'] eq girl ? 'checked' : ''} > <spring:message code='label.girl'/>
	</div>
	<br><br><br>
	<c:set var="defaultspecialrequest"><spring:message code='label.defaultspecialrequest'/></c:set>    
	<textarea rows="2" cols="78" class="expand" name="specialrequest" id="specialrequest" style="font-size:0.95em;color:rgb(170,170,170);width:300px;height:80px;" onclick="clickclear(this, '<spring:message code='label.defaultspecialrequest'/>');document.getElementById('specialrequest').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.defaultspecialrequest'/>')">${not empty requestScope.requesttutor['specialrequest'] &&  requestScope.requesttutor['specialrequest'] ne '-1' ? requestScope.requesttutor['specialrequest'] : defaultspecialrequest}</textarea> 
  
	<br><br><br>
	<span style="float:right;font-size:12px;height:auto;" class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ checkform(document.forms["requesttutor"]); }'><c:choose><c:when test="${requestScope.id gt 0}"><spring:message code="label.fix"/></c:when><c:otherwise><spring:message code="label.requesttutor"/></c:otherwise></c:choose></span></span>
	</form>

    <br><br><br>
    
  </div>
</div>