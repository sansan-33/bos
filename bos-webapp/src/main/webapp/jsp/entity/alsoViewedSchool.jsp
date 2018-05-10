<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

 			<c:set var="varempty" value=""/>


<div class="dbl-bdr"><div class="wrapper medium">

			<div class="title parbase"><div class="custom-title tk">
	    		<div class="ib">
	        
	            <span class="category">
	                <spring:message code="label.sitename"/>
	            </span>
	        	
	        	 
	        	<div class="ib">
	            <span class="custom-title-line custom-title-line__l" ></span>
	            <font class="title fontbold">
	                <spring:message code="label.alsoviewed"/>
	            </font>
	            <span class="custom-title-line custom-title-line__r"></span>
	        	</div>
	        	 
	    		</div>
			</div></div>

			<br>
			<c:forEach var="alsoViewedSchool" items="${requestScope.alsoViewedSchool}" varStatus="rowCounter">
				<div  class="row10 border-bottom-gray" style="padding-left:1px;padding-top:5px" >
					<img style="float: left; padding-right: 6px;padding-bottom: 6px;" src="/school/staticimage/CAT${alsoViewedSchool['categoryid']}/logo_${alsoViewedSchool['chscid']}.jpg" width="15px" height="15px" onerror="ImgError(this);" />
						<a class="comment" href="/school/controller/entityDetails?entityid=${alsoViewedSchool['entityid']}&action=compare">
						<font class="fontlarge">${ fn:length(alsoViewedSchool['name']) > 30 ? fn:substring(alsoViewedSchool['name'], 0, 30) : alsoViewedSchool['name']}${fn:length(alsoViewedSchool['name']) > 30 ? '...' : varempty}</font></a>
						<font style="float: right;padding-right:3px;padding-top:3px;" class="font0">${alsoViewedSchool['entityscore']}</font>
						<br>
						<font class="fontsmall">${ fn:length(alsoViewedSchool['nameeng']) > 40 ? fn:substring(alsoViewedSchool['nameeng'], 0, 40) : alsoViewedSchool['nameeng'] }${ fn:length(alsoViewedSchool['nameeng']) > 40 ? '...' : varempty } </font>
			    </div>
  			</c:forEach>
  			<br>
</div></div>
