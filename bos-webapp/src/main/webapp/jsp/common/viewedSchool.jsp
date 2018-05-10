<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div class="dbl-bdr"><div class="wrapper">

			<div class="title parbase"><div class="custom-title tk">
	    		<div class="ib">
	        
	            <span class="category">
	                <spring:message code="label.sitename"/>
	            </span>
	        	
	        	 
	        	<div class="ib">
	            <span class="custom-title-line custom-title-line__l" ></span>
	            <font class="title fontbold">
	                <spring:message code="label.viewedschool"/>
	            </font>
	            <span class="custom-title-line custom-title-line__r"></span>
	        	</div>
	        	 
	    		</div>
			</div></div>
			
			
<table cellpadding="0" cellspacing="1" width="240px">
			<tr>
	   		<td colspan="3">
	   		<div style="float:right;position:relative;"><a class="reference" href="#" onclick="javascript:clearSchoolCompare('all')"><spring:message code="label.clearall"/></a></div></td>
	   		</tr>
			<tr>
				<td colspan="3" width="180" height="20px"><div class="border-bottom-gray"></div></td>
			</tr>
			<tr><td colspan="3">
			<div id="schoolvstext" class="schoolvstext"> 
        	${sessionScope.schoolvstext}
			</div>
			</td></tr>
			<tr>
			       <td colspan="3" width="180" height="20px"><div class="border-bottom-gray"></div></td>
			</tr>
			<tr> <td colspan="3"><div style="height:20px;"></div></td></tr>
			<tr>
			<td colspan="2" align="left">
				<button  type="submit" class="btn btn-red tk tk2"
				onclick='javascript:{
					 <c:choose>
						<c:when test="${not empty sessionScope.user}">
							saveviewedschool("${sessionScope.viewedentityid}","${sessionScope.user.id}","<spring:message code="label.favorite"/>","<spring:message code="label.favoriteschooladded"/>");
						</c:when>
						<c:otherwise>alert("<spring:message code="label.pleaselogin"/>");</c:otherwise></c:choose>}'>
				<span><spring:message code="label.save"/></span></button>
			
			</td>
		<td align="right">
			<button  type="submit" class="btn btn-red tk tk2" onclick='javascript:{document.location.href = "/school/controller/schoolCompare?bigselect=y&nocache=<%=new java.util.Date().getTime()%>" ; }'>
			<span><spring:message code="label.schoolcompare"/></span></button>
		</td>
		</tr>			
</table>
</div></div>

<!-- overlayed element -->
<div class="apple_overlay" id="overlay">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<!-- make all links with the 'rel' attribute open overlays -->
<script>
$(function() {
	 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        effect: 'apple',
 
        onBeforeLoad: function() {
 
            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});
</script>
