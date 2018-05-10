<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />


<%@ include file="common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/tabs.css'>


<jsp:include page="menu.jsp"/>
<div class="fontxxlarge d3-color-blue fontbold" style="padding:5px;float:left;"><spring:message code="label.eventcalendar"/></div>
<div style="float:left;position:relative;top:8px;"><font class="fontlarge d3-color-gray fontbold"><spring:message code="label.comingmonth"/></font></div>


<div style="float:right; position:relative;right:20px;">
    <a class="btn btn-red tk tk2" href="/school/controller/getCalendarEventForm?eventid=${requestScope.eventid}&view=list" rel="#overlay_entityedit" style="text-decoration:none;">
        <span ><spring:message code="label.newevent"/></span>
    </a>
</div>
<div style="padding-right:15px;float:right;top:10px;position:relative;">
<a href="/school/controller/eventFullCalendar?data=year&view=list&year=${year}&sortby=full#todayanchor"><font class="fontxlarge"><spring:message code="label.viewall"/></font></a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
</div>

<jsp:include page="common/timetable.jsp"/><br><br>
 
<div  style="width:800px;position:relative;top:1px;left:7px;background:white;border: 0px solid rgb(199,199,199); ">
<jsp:include page="common/sliderPlayer.jsp"/>
</div> 


<br class="clear"><br class="clear">

<div class="fontxxlarge d3-color-blue fontbold" style="padding:5px;float:left;"><spring:message code="label.topsearched"/></div>
	 <div style="float:right;top:20px;right:10px;position:relative;" >
		
		<label style="padding-right:8px;" class="fontmedium" for="radioOne0"><input type="radio" name="period" <c:if test="${requestScope.period eq '7' }">checked</c:if> id="radioOne0" value="0"  onclick="document.location.href='/school/controller/home?period=7'" />
      		<spring:message code="label.lastweek"/>
		</label>
		<label style="padding-right:8px;" class="fontmedium" for="radioOne1"><input type="radio" name="period" <c:if test="${requestScope.period eq '30' }">checked</c:if> id="radioOne1" value="1" onclick="document.location.href='/school/controller/home?period=30'" />
			<spring:message code="label.lastmonth"/>
		</label>
		<label style="padding-right:8px;" class="fontmedium" for="radioOne2"><input type="radio" name="period" <c:if test="${requestScope.period eq '0' }">checked</c:if> id="radioOne2" value="2" onclick="document.location.href='/school/controller/home?period=0'" />
			<spring:message code="label.allthetime"/>
		</label>
    </div>
	<br class="clear"/>
    
<div id="container" style="width:800px;position:relative;top:-1px;left:-6px;background:white;border: 0px solid rgb(199,199,199); ">
	 <ul class="menumain">  
            <li id="kindergarten"><a  href="/school/controller/getEntityMainList?type=0"><spring:message code="label.kindergarten"/></a></li>
            <li id="primary"  ><a  href="/school/controller/getEntityMainList?type=1"><spring:message code="label.primary"/></a></li>
            <li id="secondary" ><a  href="/school/controller/getEntityMainList?type=2"><spring:message code="label.secondary"/></a></li>
            <li id="news" class="active" ><a  href="/school/controller/getLatestNewsTextList?type=all"><spring:message code="label.parentrating"/></a></li>
      </ul>
      <span class="clear"></span>  
<!-- single pane. it is always visible -->
<div class="contentmain">
  <div></div>
</div>

</div>

<br class="clear">
<div  style="width:800px;position:relative;top:-1px;left:5px;background:white;border: 0em solid rgb(199,199,199);">

<p class="fontxxlarge d3-color-blue fontbold" style="padding:5px;"><spring:message code="label.latestpost"/> <a href="/school/controller/getCaseSharingList?view=all"><font class="fontmedium d3-color-orange fontnormal">( <spring:message code="label.viewall"/>)</font></a>
</p>	

<jsp:include page="caseSharingList.jsp"/>
 
	
</div>


<script type="text/javascript">

	$(function() {
	  $("ul.menumain").tabs("div.contentmain > div", {initialIndex: 3,effect: 'ajax' });
	});
	
	
	$(document).ready(function(){
	
	    
	    $(".menumain > li").click(function() {
	    	    
	    	//  First remove class "active" from currently active tab
	        $(".menumain > li").removeClass('active');
	 
	        //  Now add class "active" to the selected/clicked tab
	        $(this).addClass("active");
	
	       
	        
	        //  At the end, we add return false so that the click on the link is not executed
	        return false;
	    });

	    
	   
	    
	});

</script>

       
<jsp:include page="common-footer.jsp"/>
