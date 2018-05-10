<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request"><spring:message code="label.eventcalendar"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>

 
<%@ include file="../common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/calendar.css'>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="day" value="${now}" pattern="dd" />
<fmt:formatDate var="month" value="${now}" pattern="M" />
<script type="text/javascript" >


$(document).ready(function() {
	
	$("a[rel]").overlay({
		 
              onBeforeLoad: function() {
 
            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
	
   <c:if test="${requestScope.popup eq 'y' || sessionScope.autoEventPopUp eq 'y' }">
   $("a[rel]").eq(0).overlay().load();
   </c:if>
   
});
</script>

<jsp:include page="../menu.jsp"/>
 



<jsp:include page="../ads/wideAds.jsp"/>
<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>	
<br class="clearboth">				


<span class="d3-color-gray-1 fontxxxlarge"><spring:message code="label.eventcalendar"/></span>
<span class="d3-color-gray-2 fontxlarge"><spring:message code="label.eventcalendar.intro"/></span>

<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
<c:set var="statkey">eventCalendar-1</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br class="clear"><br class="clear">

<c:catch var="catchException">

<div class="EventControl">
<ul class="calendarcontrol" style="width: 100%;margin: 0px auto;">
	<li>
	<div style="float:left;padding-top:10px;padding-left:30px" class="eventlabel openday"><spring:message code="label.openday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel introday"><spring:message code="label.introday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel applicationday"><spring:message code="label.applicationday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel importantday"><spring:message code="label.importantday"/></div>
	
	</li>
	<li><div style="border-left-style: solid; border-left-color: white; border-left-width: 2px; height: 135px;">&nbsp;</div></li>
	<li><a href="/school/controller/eventCalendar?month=${requestScope.prevmonth}&year=${requestScope.prevyear}"><spring:message code="label.prevmonth"/></a></li>
	<li><font class="fontxxxlarge " style="line-height:20px;">${requestScope.currentyear}</font></li>
	<li><a href="/school/controller/eventCalendar?month=${requestScope.nextmonth}&year=${requestScope.nextyear}"><spring:message code="label.nextmonth"/></a></li>
	<li style="float:right;">
	
		      <a  href="/school/controller/getCalendarEventForm?eventid=${requestScope.eventid}" rel="#overlay_entityedit" style="text-decoration:none;">
	        		+ <spring:message code="label.newevent"/>
				</a>
	</li>
</ul>
</div>
<br class="clear"><br class="clear">

<div class="EventBlockOuter">

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.sunday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.monday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.tuesday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.wednesday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.thursday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.friday"/></h4></div>
            
            </div>

            <div class="grid-4">
            
                <div style="text-align:center; padding-top: 5px;"><h4><spring:message code="label.saturday"/></h4></div>
            
            </div>


			<c:forEach var="week" items="${requestScope.weekList}" varStatus="rowCounter">
				<c:forEach var="i" begin="0" end="6" >
					<c:set var="weekkey">${i}</c:set>
   					
   					 <div class="grid-4">
            			
                		<div class="EventBlock ${i eq '0' ? 'firstchild' : '' }   ">
                    	
                    	<c:if test="${rowCounter.count eq 1  && i eq '0' }">
                        <div class="month">${requestScope.currentmonth eq 0 ? 1 : requestScope.currentmonth + 1} <spring:message code="label.month"/></div>
	                    </c:if>
	
	                    <div class="TextBody">
	                        <div class="Header">
	                            <div class="right  ${ requestScope.currentmonth + 1 eq month && week[weekkey] eq day ?  'today' : '' }">
	                                <b>${week[weekkey]}</b>
	                            </div>
	                            <br class="clear">
	                        </div>
	                        <div class="links">
	                        	<c:set var="eventkey">${week[weekkey]}</c:set>
	                       	 	
	                       	 	<c:set var="eventlist">${requestScope.eventsMap[eventkey]}</c:set>
	                       	 	
	                       	 	<c:if test="${not empty eventlist }">
	                       	 	
	                       	 	<c:forEach items="${requestScope.eventsMap}" var="entry">
    								<c:if test="${entry.key eq  eventkey }"> 
								    <c:forEach items="${entry.value}" var="item" varStatus="loop">
								        
								        <div class="${item['eventtype']}">
								        <c:choose>
								        	<c:when test="${item['eventtype'] eq 'importantday' }">
								        		${item['title']}
								        	</c:when>
									        <c:otherwise>
		                                    <a  class="eventitem"  href="/school/controller/getCalendarEventView?id=${item['id']}" rel="#overlay_eventview" style="text-decoration:none;">
		                                    	<spring:message code="label.${item['eventtype']}"/> - ${item['name']}
		                                    </a>
		                                    </c:otherwise>
	                                    </c:choose>
	                                    <c:if test="${sessionScope.user['ROLEID'] == 1}">
	                                    <br class="clear">
	                                    <a href="/school/controller/getCalendarEventForm?eventid=${item['id']}" rel="#overlay_entityedit" style="float:right;text-decoration:none;">
	        								+ 
										</a>
										<a href="#" onclick="javascript:hideEvent(${item['id']});" style="float:right;padding-right:20px;">x</a>
										</c:if>
										</div>
								    </c:forEach>
								    </c:if>
								</c:forEach>
								
      
	                       	 	
		                        </c:if>
	                       </div>
	                    </div>                
       
                		</div>
		            </div>
   					
   					
				</c:forEach>
			</c:forEach>
			
<br class="clear">
<div style="padding-bottom:200px;"></div>
			
</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>

           

<br class="clear"/>

       
<jsp:include page="../common-footer.jsp"/>

<div class="apple_overlay_entityedit" id="overlay_entityedit">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>

<div class="apple_overlay_eventview" id="overlay_eventview">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
