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
	
	if (form.notes.value == "") {
		alert( "<spring:message code='label.plschoose'/><spring:message code='label.tutorialnotes'/>" );
	    form.notes.focus();
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
    
    <form action="saveCourseForm" method="post" name="tutorcourseform" id="tutorcourseform">
	 	<input type="hidden" name="lookuptutorialclassrangeendid" value="18"/>
	 	<input type="hidden" name="lookuptutorialclassrangestartid" value="3"/>
	 	<input type="hidden" name="tutorcategoryid" value="${requestScope.tutorcategoryid}"/>
	 	<input type="hidden" name="id" value="${requestScope.courseform['id']}"/>
	 	
	 	
	 	<span class="font3b" style="width:180px;padding-right:65px"><spring:message code="label.coursename"/></span>:
   	 	<select id=lookupclassid style="width: 17em;margin-left:5px;" name="lookupclassid" onchange="javascript:toggleClassRange()">
  		<option value=""><spring:message code="label.coursesearchselect"/></option>
		<c:forEach var="tutorialclass" items="${requestScope.tutorialclasslist}" varStatus="rowCounter">
			<option value="${tutorialclass['value']}"  <c:if test="${requestScope.courseform['lookupclassid'] eq tutorialclass['value']}">selected</c:if> >
                    		${tutorialclass['description']}
			</option>
  		</c:forEach>
		</select>

		<br class="clearboth">
	 	<div style="padding-top:6px;padding-bottom:6px;">
		<span class="font3b" style="width:180px;"><spring:message code="label.tutorialnotes"/></span>:&nbsp;&nbsp;<input type="radio" name="notes" value="y" ${requestScope.courseform['notes'] eq 'y' ? 'checked' : '' } /> <spring:message code="label.tutorialnotesyes"/> <input type="radio" name="notes" value="n" ${requestScope.courseform['notes'] eq 'n' ? 'checked' : '' } /><spring:message code="label.tutorialnotesno"/><br>
	 	</div>
		<span class="font3b" style="width:180px;padding-right:65px;"><spring:message code="label.hourlyrate"/></span>:<input style="margin-left:10px" type="text" name="hourlyrate" size="60" value="${requestScope.courseform['hourlyrate']}" /><br>
		
		<c:set var="defaultcoursedesc"><spring:message code='label.defaultcoursedesc'/></c:set>    
		<span class="font3b" style="width:180px;padding-right:65px;top:-70px;position:relative;"><spring:message code="label.defaultcoursedesc"/></span><span style="top:-70px;position:relative;">:</span>
		<textarea rows="2" cols="78" class="expand" name="coursedesc" id="coursedesc" style="font-size:0.95em;color:rgb(170,170,170);width:215px;margin-left:5px;margin-top:8px;height:80px;" onclick="clickclear(this, '<spring:message code='label.defaultcoursedesc'/>');document.getElementById('coursedesc').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.defaultcoursedesc'/>')">${not empty requestScope.courseform['coursedesc'] &&  requestScope.courseform['coursedesc'] ne '-1' ? requestScope.courseform['coursedesc'] : defaultcoursedesc}</textarea> 
  		<br><br>
		
    	<span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ checkform(document.forms["tutorcourseform"]); }'><spring:message code="label.done"/></span></span>
    </form>
    <br><br><br>
    
  </div>
</div>