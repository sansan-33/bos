<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="htmltitle" scope="request"><spring:message code="label.schoolcompare"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.schoolcompare"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.schoolcompare"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.schoolcompare"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.schoolcompare"/></c:set>

<%@ include file="common-header.jsp" %>

<jsp:include page="menu.jsp"/>
<br>
<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
    <c:set var="statkey">schoolCompare-1</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br><br class="clearboth">
<div>
    <div style="float:left;position:relative">
        <div class="kiwi-ad-wrapper-728x90"></div>
    </div>
    <div style="float:right;position:relative">
        <div class="kiwi-ad-wrapper-300x250"></div>
    </div>
</div>
<br class="clearboth">
<div style="padding-top:20px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br class="clearboth">


<div style="float:left;position:relative;padding-left:30px;">

<form name="schoolcompareselection" id="schoolcompareselection" >
<table  cellpadding="0" cellspacing="0" width="880px;" style="min-height:400px;">
<tr><td width="280px">
	<div class="fontxxxlarge d3-color-black fontbold" style="padding-left:10px;padding-top:40px;padding-bottom:20px;">
		<spring:message code="label.schoolcompare"/>
	</div>
	
	<p class="fontlarge" style="padding-left:10px;"><img src="/school/img/step1.png" style="width:40px;height:40px;top:20px;position:relative;padding-right:30px;"/><span class="fontxlarge"><spring:message code="label.addtocompate.step1"/></span></p>
	<p>		
<span style="position:relative;float:right;top:13px;padding-right:20px;">
	    <a   class="btn btn-red tk tk2" onclick='addSchoolCompare(document.forms["schoolcompareselection"].entityid.value)'><span>+<spring:message code="label.addtocompare"/></span></a>
</span>

		    <div style="padding:20px 0px 20px 40px;">
		    <jsp:include page="common/chainedSelectSchool.jsp"/>
			</div>
			<div id="schoolvstext" class="schoolvstext" style="padding-left:40px;padding-right:30px;"> 
				${sessionScope.schoolvstext}
			</div>
	</p>
</td>
</tr>
<tr><td><br><div class="divider"></div><br></td></tr>
<tr>
	<td>
	<p class="fontlarge" style="padding:10px;"><img style="width:40px;height:40px;padding-right:30px;" src="/school/img/step2.png"/><span class="fontxxlarge" style="position:relative;top:-12px;"><spring:message code="label.addtocompate.step2"/></span></p>
	<div style="float:right;position:relative;left:-3%;top:-50px;">
		    <a class="btn btn-red tk tk2" onclick='javascript:document.location.href="/school/controller/schoolCompare?nocache=<%=new java.util.Date().getTime()%>"'><span><spring:message code="label.schoolcompare"/></span></a>
	<div>
	</td>
</tr>	
</table>
</form>
</div>

<br class="clearboth">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br class="clearboth">

<jsp:include page="common-footer.jsp"/>


<!--  End of Search -->
