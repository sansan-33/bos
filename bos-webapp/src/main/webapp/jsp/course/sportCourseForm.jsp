<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript" charset="utf-8">
function checkform ( form )
{

	// ** START **
	if (form.lookupclassid.value == "") {
	    alert( "<spring:message code='label.plschoose'/><spring:message code='label.coursename'/>" );
	    form.lookupclassid.focus();
	    return false ;
	}
		
	if (form.lookuptutorialclassrangestartid.value == "") {
	    alert( '<spring:message code="label.plschoose"/><spring:message code="label.tutorialteaching"/><spring:message code="label.from"/>' );
	    form.lookuptutorialclassrangestartid.focus();
	    return false ;
	}
	 
	if (form.lookuptutorialclassrangeendid.value == "") {
	    alert( '<spring:message code="label.plschoose"/><spring:message code="label.tutorialteaching"/><spring:message code="label.to"/>');
	    form.lookuptutorialclassrangeendid.focus();
	    return false ;
	}
	
  	if (form.hourlyrate.value == "") {
		alert( "<spring:message code='label.plsinput'/><spring:message code='label.hourlyrate'/>" );
	    form.hourlyrate.focus();
	    return false ;
	}
	
  // ** END **
  form.submit();
}


function toggleClassRange(){
	 	if(document.forms["musiccourseform"].lookupclassid.value == 'm1' ){
			$(".tutorialclassrange").hide();
			$(".musicclassrange").show();
		}else{
			$(".tutorialclassrange").show();
			$(".musicclassrange").hide();
			
		}
}


$(document).ready(function(){


    $(".tutorialclassrange").show();
	$(".musicclassrange").hide();
	

});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tutor -->
<div id="tutorcourse">
  <div style="padding-left:20px;background-color: rgb(242,246,235);">
    <br><br><br>
    <h1>${requestScope.coursetype}</h1>
    <c:set var="bestdesc">bestdesc${requestScope.tutorcategoryid}</c:set>
    <c:set var="tutorialexp">tutorialexp${requestScope.tutorcategoryid}</c:set>
    <br><br>	
    <font class="font3green"><img src="/school/img/itemlist.png"/>  <spring:message code="label.sex"/>: ${sessionScope.user['sex']}</font><br class="clearboth">
    <font class="font3green"><img src="/school/img/itemlist.png"/>  <spring:message code="label.tutorbestquali"/>: ${sessionScope.user[bestdesc]}</font><br class="clearboth">
    <font class="font3green"><img src="/school/img/itemlist.png"/>  <spring:message code="label.tutorialexp"/>: ${sessionScope.user[tutorialexp]}</font><br class="clearboth">
    <br><br>	
    
    <form action="saveCourseForm" method="post" name="courseform" id="courseform">
   	 	
   	 	<input type="hidden" name="tutorcategoryid" value="${requestScope.tutorcategoryid}"/>
	 		<input type="hidden" name="id" value="${requestScope.courseform['id']}"/>
	 
   	 	
		<span class="font3b" style="width:180px;padding-right:65px"><spring:message code="label.coursename"/></span>:
   	 	<select id=lookupclassid style="width: 17em;margin-left:5px;" name="lookupclassid" onchange="javascript:toggleClassRange()">
  		<option value=""><spring:message code="label.coursesearchselect"/></option>
		<c:forEach var="sportclass" items="${requestScope.sportclasslist}" varStatus="rowCounter">
			<option value="${sportclass['value']}"  <c:if test="${requestScope.courseform['lookupclassid'] eq sportclass['value']}">selected</c:if> >
                    		${sportclass['description']}
			</option>
  		</c:forEach>
		</select>
		<br class="clearboth">
	
	  	<span class="font3b" style="width:180px;padding-right:65px;"><spring:message code="label.hourlyrate"/></span>:<input style="margin-left:10px" type="text" name="hourlyrate" size="60" value="${requestScope.courseform['hourlyrate']}" /><br>
	  	
		
		<br class="clearboth">
		<div class="tutorialclassrange">
		<span class="font3b" style="width:180px;padding-right:40px;"><spring:message code="label.tutorialteaching"/><spring:message code="label.from"/></span>:
   	 	<select id=lookuptutorialclassrangestartid style="width: 17em;" name="lookuptutorialclassrangestartid">
		<option value=""><spring:message code="label.tutorialclassrangeselect"/></option>
		<c:forEach var="classrange" items="${requestScope.tutorialclassrangelist}" varStatus="rowCounter">
			<option value="${classrange['value']}"  <c:if test="${requestScope.courseform['lookupclassrangestartid'] eq classrange['value']}">selected</c:if> >
                    		${classrange['description']}
			</option>
  		</c:forEach>
  		</select>

   	 	<br class="clearboth">
   	 	<span class="font3b" style="width:180px;padding-right:40px;"><spring:message code="label.tutorialteaching"/><spring:message code="label.to"/></span>:
   	 	<select id=lookuptutorialclassrangeendid style="width: 17em;" name="lookuptutorialclassrangeendid">
		<option value=""><spring:message code="label.tutorialclassrangeselect"/></option>
		<c:forEach var="classrange" items="${requestScope.tutorialclassrangelist}" varStatus="rowCounter">
			<option value="${classrange['value']}"  <c:if test="${requestScope.courseform['lookupclassrangeendid'] eq classrange['value']}">selected</c:if> >
                    		${classrange['description']}
			</option>
  		</c:forEach>
  		</select>
  		</div>
	    <div class="musicclassrange">
		<span class="font3b" style="width:180px;padding-right:40px;"><spring:message code="label.tutorialteaching"/><spring:message code="label.from"/></span>:
   	 	<select id=lookupmusicclassrangestartid style="width: 17em;" name="lookupmusicclassrangestartid">
		<option value=""><spring:message code="label.musicclassrangeselect"/></option>
		<c:forEach var="classrange" items="${requestScope.musicclassrangelist}" varStatus="rowCounter">
			<option value="${classrange['value']}"  <c:if test="${requestScope.courseform['lookupclassrangestartid'] eq classrange['value']}">selected</c:if> >
                    		${classrange['description']}
			</option>
  		</c:forEach>
  		</select>

   	 	<br class="clearboth">
   	 	<span class="font3b" style="width:180px;padding-right:40px;"><spring:message code="label.tutorialteaching"/><spring:message code="label.to"/></span>:
   	 	<select id=lookupmusicclassrangeendid style="width: 17em;" name="lookupmusicclassrangeendid">
		<option value=""><spring:message code="label.musicclassrangeselect"/></option>
		<c:forEach var="classrange" items="${requestScope.musicclassrangelist}" varStatus="rowCounter">
			<option value="${classrange['value']}"  <c:if test="${requestScope.courseform['lookupclassrangeendid'] eq classrange['value']}">selected</c:if> >
                    		${classrange['description']}
			</option>
  		</c:forEach>
  		</select>
  		</div>
  		
   	 	<br class="clearboth">
   	 	<c:set var="defaultcoursedesc"><spring:message code='label.defaultcoursedesc'/></c:set>    
		<span class="font3b" style="width:180px;padding-right:65px;top:-70px;position:relative;"><spring:message code="label.defaultcoursedesc"/></span><span style="top:-70px;position:relative;">:</span>
		<textarea rows="2" cols="78" class="expand" name="coursedesc" id="coursedesc" style="font-size:0.95em;color:rgb(170,170,170);width:215px;margin-left:5px;margin-top:10px;height:80px;" onclick="clickclear(this, '<spring:message code='label.defaultcoursedesc'/>');document.getElementById('coursedesc').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.defaultcoursedesc'/>')">${not empty requestScope.courseform['coursedesc'] &&  requestScope.courseform['coursedesc'] ne '-1' ? requestScope.courseform['coursedesc'] : defaultcoursedesc}</textarea> 
  		<br><br>
   	 	
    	<span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ checkform(document.forms["courseform"]); }'><spring:message code="label.done"/></span></span>
    </form>
    <br><br><br>
    
  </div>
</div>