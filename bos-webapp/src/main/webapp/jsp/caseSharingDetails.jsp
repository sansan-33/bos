<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="casesharing"><spring:message code="label.casesharing"/></c:set>
<c:set var="htmltitle" scope="request">${fn:trim(casesharing)} ${fn:trim(requestScope.casedetails['title'])}</c:set>
<c:set var="htmlkeywords" scope="request">${fn:trim(casesharing)},${fn:trim(requestScope.casedetails['title'])}</c:set>
<c:set var="htmldesc" scope="request">${fn:trim(casesharing)} ${fn:trim(requestScope.casedetails['title'])}</c:set>
<c:set var="htmlrobots" scope="request">${fn:trim(casesharing)}, ${fn:trim(requestScope.casedetails['title'])}</c:set>
<c:set var="htmlgooglebot" scope="request">${fn:trim(casesharing)}, ${fn:trim(requestScope.casedetails['title'])}</c:set>
<%@ include file="common-header.jsp" %>

<script src="/school/js/jquery.corner.js"></script>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('#casecontent').corner();
	} );
	
	$(document).ready(function(){
					imagePreview();
			});
			this.imagePreview = function(){	
				/* CONFIG */
					
					xOffset = 10;
					yOffset = 30;
					
					// these 2 variable determine popup's distance from the cursor
					// you might want to adjust to get the right result
					
				/* END CONFIG */
				$("a.preview").hover(function(e){
					this.t = this.title;
					this.title = "";	
					var c = (this.t != "") ? "<br/>" + this.t : "";
					$("body").append("<p id='preview'><img width='500px;' height='400px;' src='"+ this.href +"' alt='Image preview' /><font class='font1'>"+ c +"</font><br></p>");				

					

					 
					$("#preview")
						.css("top",(e.pageY - xOffset) + "px")
						.css("left",(e.pageX + yOffset) + "px")
						.fadeIn("fast");						
			    },
				function(){
					this.title = this.t;	
					$("#preview").remove();
			    });	
				$("a.preview").mousemove(function(e){
					$("#preview")
						.css("top",(e.pageY - xOffset) + "px")
						.css("left",(e.pageX + yOffset) + "px");
				});			
			};
	
</script>

    	
   
<jsp:include page="menu.jsp"/>  


<jsp:include page="newsTicker.jsp"/>

<div class="wrapper" >
<div><img src="/school/img/top.gif" alt="" width="100%" height="4" border="0" style="display:block;margin:0"></div>
<div class="green-pin" style="position:relative;float:left;top:-3px;"></div>
<div class="yellow-pin" style="position:relative;float:right;top:-4px;"></div>

  <div class="db-detail-box colors-subtle item-detail-box icon-size-default">
		
		<div class="detail-icon ">
			<span class="d3-icon d3-icon-item d3-icon-item-64  d3-icon-item-green">
				<span class="icon-item-gradient">
						<img class="icon-item-inner icon-item-default" style="cursor: pointer; cursor: hand;" src="/school/userimages/${requestScope.casedetails['userprofile']}"  onerror="UserImgError(this);" onclick="window.location='/school/controller/viewProfile?userid=${requestScope.casedetails['userid']}'" />
					</span>
				</span>
				
			</span>
			
		</div>
		<div style="position:relative;float:left;top:60px;left:10px;text-align: center;" >
				<br><font class="font1b" style="padding-top:3px;">${requestScope.casedetails['namelocal']}</font><br>
				<font class="font1" style="padding-top:3px;"><spring:message code="label.userscore"/> : ${empty requestScope.casedetails['userscore'] ? '0' : requestScope.casedetails['userscore']}</font><br>
				<font class="font1" style="padding-top:3px;"><spring:message code="label.parentrating"/> : ${empty requestScope.casedetails['parentratingcount'] ? '0' : requestScope.casedetails['parentratingcount']}</font><br>
				<font class="font1" style="padding-top:3px;"><spring:message code="label.casesharing"/> : ${empty requestScope.casedetails['casesharingcount'] ? '0' : requestScope.casedetails['casesharingcount'] }</font><br>
		</div>
		<div class="detail-level">
			<div class="detail-level-inner">
				<spring:message code="label.hitcount"/>
			</div>
			<c:set var="statkey">case-${casedetails['caseid']}</c:set>
			<span class="detail-level-number">${objectStatMap[statkey].hitcounter}</span>
		</div>
		<div class="detail-text">
		<h2 class="d3-color-orange">${requestScope.casedetails['title']}</h2>

		<div style="position:relative;float:right;top:10px;left:200px;">
			<p><g:plusone size="medium"></g:plusone><br class="clear"><div class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div></p>
			<br class="clear">
		</div>
			
			<div class="d3-item-properties">
				
				<ul class="item-type">
					<li>
						<span class="d3-color-orange"><spring:message code='label.strategy'/>: ${requestScope.casedetails['analysis']}</span>
					</li>
				</ul>
				
				<div class="item-before-effects"></div>
				<c:if test="${requestScope.casedetails['type'] eq 'case'}">
				<ul class="item-effects">
					<li class="d3-color-gold"><p><spring:message code="label.applicationyear"/><span class="value"> ${requestScope.casedetails['applicationyear']}</span> </p></li>
					<li class="d3-color-gold"><p><spring:message code="label.schoolcategory"/><span class="value"> ${requestScope.casedetails['targetschoolcategory']}</span> </p></li>
					<li class="d3-color-gold"><p><spring:message code="label.firstchoice"/><span class="value"><a href="/school/controller/entityDetails?entityid=${requestScope.casedetails['targetentityid']}&action=compare"><font style="padding-left:5px;color: #64A02C;">${requestScope.casedetails['targetentity']}</font></a></span> </p></li>
					<li class="d3-color-gold">
						<p><spring:message code="label.appliedschool"/><span class="value"> ${requestScope.casedetails['appliedentitycount'] + requestScope.casedetails['appliedentityoffercount'] }</span><spring:message code="label.totalschool"/>
							<a style='padding-left:0px;position:relative;float:right;right:180px;' href='/school/controller/getCaseSharingEntityList?id=${requestScope.casedetails["caseid"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_casesharing'> 
								<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input class="submit" type="button"  value="<spring:message code="label.details"/>" /></span></span>
							</a>
						</p>
					</li>
					<li class="d3-color-gold"><p><spring:message code="label.applicationresult"/><span class="value"> ${requestScope.casedetails['applicationresult']}</span><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(106,169,47);">&#10003;</span></p></li>
					<li class="d3-color-blue"><p><spring:message code="label.maincharacter"/><span class="value"></span> </p>
					<ul>
					
					<li class="d3-color-blue"><p><spring:message code="label.casesex"/><span class="value"> ${requestScope.casedetails['casesex']}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.age"/><span class="value"> ${requestScope.casedetails['age']}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.monthofbirth"/><span class="value"> ${requestScope.casedetails['monthofbirth']}<span style="padding-left:5px;"></span>
					<c:set var="bigkid">(<spring:message code="label.bigkid"/>)</c:set>
					<c:set var="smallkid">(<spring:message code="label.smallkid"/>)</c:set>
					${requestScope.casedetails['bigsmallkid'] == 'b' ? bigkid : smallkid}
					</p></li>
					<li class="d3-color-blue"><p><spring:message code="label.character"/><span class="value"> ${requestScope.casedetails['characterkid']}</span> </p></li>
					<li class="d3-color-blue"><p><spring:message code="label.currentschool"/><span class="value"> <a href="/school/controller/entityDetails?entityid=${requestScope.casedetails['currententityid']}&action=compare"><font style="padding-left:5px;color: #64A02C;">${requestScope.casedetails['currententity']}</font></a></span> </p></li>
					</ul>
					</li>
				</ul>
				</c:if>
				
				<!-- 
				<ul class="item-extras">			
					<li class="item-ilvl">
					</li>
				</ul>
				 -->
				
				<span class="clear"><!-- --></span>
			</div>
		</div>
				<!--
				<div style="position:relative;float:right;right:10px;top:${requestScope.casedetails['type'] eq 'case' ? '-150' : '-40' }px;"  class="fontlarge db3-color-grey">
					<div  style="position:relative;float:right;"><spring:message code="label.peoplehelpful"/></div>
					<div style="position:relative;float:right;font-weight:bold;" id="helpfulcount" class="helpfulcount">
						${not empty requestScope.casedetails["helpful"] ? requestScope.casedetails["helpful"] : '0'} </div>
					
				</div>
			    -->

				<div class="clear" style="padding-top:50px;"></div>
				
				<div style="position:relative;float:right;right:20px;top:-${requestScope.casedetails['type'] eq 'case' ? '-90' : '-40' }px;">
					<span style="position:relative;float:right;top:-5px;" class="wrpBtn"><span class="button_ta mdm" style="margin-left:0px"><a href="#" onclick="voteHelpfulCase('${requestScope.casedetails['caseid']}')"><spring:message code="label.yes"/></a></span></span>
					<span style="position:relative;float:right;padding-right:10px;" class="fontlarge db3-color-grey"><spring:message code="label.helpful"/></span>
					<div  style="position:relative;float:right;"><spring:message code="label.peoplehelpful"/> , </div>
            		<div style="position:relative;float:right;font-weight:bold;padding-right:4px;" id="helpfulcount" class="helpfulcount">
                		${not empty requestScope.casedetails["helpful"] ? requestScope.casedetails["helpful"] : '0'}
                    </div>

				</div>
				
				<div class="item-extras" id="casecontent" style="padding:40px;margin:20px 10px;">
				<div >
					<br class="clear">
					<font class="fontextralarge"><spring:message code="label.details"/></font><br class="clear"><br class="clear">
					<span class="fontxxlarge d3-color-grey-1" style="line-height:1.8;">${requestScope.casedetails['content']}</span>
				</div>

					<br class="clear"><br class="clear">		
					<c:forEach var="photo" items="${requestScope.userimage}" varStatus="rowCounter">
						<div style="float:left;position:relative;padding-top:25px;">
						<a class="preview"  title="${photo.description}" href="/school/userimages/${photo.filename}"><img class="imagedropshadow" width="100" height="100" alt="Slide${rowCounter.count}" src="/school/userimages/${photo.filename}"/></a>
						<br class="clear">
						<p class="font0" style="padding-top:10px;padding-right:10px;text-align:center;">${photo.description}</p>
						</div>
					</c:forEach>
					
					<br class="clear"><br class="clear">
					
					<c:choose>
	    			<c:when test="${not empty requestScope.categoryid  }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    			<c:otherwise><jsp:include page="ads/yahoocontentmatchtop.jsp"/></c:otherwise>
    				</c:choose>
    	
					
					<br class="clear"><br class="clear"><br class="clear">
					<c:if test="${requestScope.casedetails['publish'] eq 'y'}">
						<div class="line-type2-flat"></div>
						<jsp:include page="chat.jsp"/>
					</c:if>
						<span style="padding-top:50px;">&nbsp;</span><br class="clear">
					
				</div>
	</div>
<br class="clear">
</div>
<div class="blue-pin" style="position:relative;float:left;top:-48px;left:15px;"></div>
<div class="red-pin" style="position:relative;float:right;top:-40px;right:18px;"></div>

<jsp:include page="common-footer.jsp"/>



