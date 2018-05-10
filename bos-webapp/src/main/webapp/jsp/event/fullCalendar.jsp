
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request"><spring:message code="label.eventcalendar"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.eventcalendar.intro"/></c:set>


<%@ include file="../common-header.jsp" %>
 <link rel="stylesheet" type="text/css" href="../stylesheet/font-awesome.min.css"/>
<link rel='stylesheet' type='text/css' href='/school/stylesheet/fullcalendar.css' />
<script type='text/javascript' src='/school/js/moment.min.js'></script>
<script type='text/javascript' src='/school/js/fullcalendar.min.js'></script>
<script type='text/javascript'>

<c:set var="labelstart"> (<spring:message code="label.start"/>)</c:set>
<c:set var="labelend"> (<spring:message code="label.end"/>)</c:set>

	$(document).ready(function() {
		$('#fullcalendar').fullCalendar({
		 height: 550,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2014-06-12',
			defaultView: 'month',
			editable: true,
			events: [
            <c:forEach var="i" begin="1" end="2">

                <c:forEach items="${requestScope.eventsMap}" var="item" varStatus="loop">
                <c:set var="samedate">false</c:set>
                <c:if test='${item["startdate"] eq item["enddate"] or item["eventtype"] eq "importantday"}'>
                    <c:set var="samedate">true</c:set>
                </c:if>
                <c:set var="url">
                /school/controller/getCalendarEventView?id=${item['id']}
                </c:set>
                <c:choose>
                    <c:when test="${item['eventtype'] eq 'applicationday'}">
                        <c:set var="color">#DBADFF</c:set>
                    </c:when>
                    <c:when test="${item['eventtype'] eq 'importantday'}">
                        <c:set var="color">#FF887C</c:set>
                    </c:when>
                    <c:when test="${item['eventtype'] eq 'introday'}">
                        <c:set var="color">#FBD75B</c:set>
                    </c:when>
                    <c:when test="${item['eventtype'] eq 'openday'}">
                       <c:set var="color">#FFB878</c:set>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
                   <c:if test="${samedate eq 'false' or i eq 1}">
                   {
                       id: '${loop.count}',
                    <c:choose>
                    <c:when test="${item['eventtype'] eq 'importantday' }">
                        title : '${item["title"]}',
                        url: '${item["url"]}',
                    </c:when>
                    <c:otherwise>
                        title : "<spring:message code="label.${item['eventtype']}"/> - ${item['name']}  ${samedate eq 'false' ? (i eq 1 ? labelstart : labelend ) : '' }",
                        url: '${url}',
                    </c:otherwise>
                    </c:choose>
                    start: '${samedate eq 'true' ? item["startdate"] :  (i eq 1 ? item["startdate"] : item["enddate"]) }',
                    end: '${samedate eq 'true' ?  item["enddate"] :  (i eq 1 ? item["startdate"] : item["enddate"]) }',
                    backgroundColor: '${color}' ,
                    borderColor: '${color}'
                    },
                    </c:if>
                </c:forEach>
            </c:forEach>

    		],

    		eventClick: function(event) {
    		   if(event.url.substring(0, 4) == 'http'){
                    window.open(event.url,'_blank');
    		    }else{
    		        $("a[rel]").eq(event.id-1).overlay().load();
    		    }
    		    return false;

            }

		});

	});

</script>

<c:forEach items="${requestScope.eventsMap}" var="item" varStatus="loop">
    <a href="/school/controller/getCalendarEventView?id=${item['id']}" rel="#overlay_eventview"></a>
</c:forEach>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/calendar.css'>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="day" value="${now}" pattern="dd" />
<fmt:formatDate var="month" value="${now}" pattern="M" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script type="text/javascript" >


$(document).ready(function() {

	$("a[rel]").overlay({

    onClose: function(){

    },

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

<c:catch var="catchException">


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



<div class="EventControl">
<ul class="calendarcontrol" style="width: 100%;margin: 0px auto;">
	<li>
	<div style="float:left;padding-top:10px;padding-left:30px" class="eventlabel openday"><spring:message code="label.openday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel introday"><spring:message code="label.introday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel applicationday"><spring:message code="label.applicationday"/></div>
	<div style="float:left;padding-top:10px;padding-left:20px" class="eventlabel importantday"><spring:message code="label.importantday"/></div>

	</li>
	<li><div style="border-left-style: solid; border-left-color: white; border-left-width: 2px; height: 135px;">&nbsp;</div></li>
	<li><div style="float:left;top:-9px;position:relative;"><a href="/school/controller/eventFullCalendar?view=calendar&data=all"><i class="fa fa-calendar fa-2x"></i></a></div>
        <div style="float:left;top:-7px;position:relative;left:-15px;"><a href="/school/controller/eventFullCalendar?year=${year}&view=list#todayanchor"><i class="fa fa-list fa-2x"></i></a></div></li>
<li><div style="border-left-style: solid; border-left-color: white; border-left-width: 2px; height: 135px;">&nbsp;</div></li>


</ul>
</div>

<div style="float:right;top:-38px;left:-60px;position:relative;">
        <a class="btn btn-red tk tk2" href="/school/controller/getCalendarEventForm?eventid=${requestScope.eventid}&view=list" rel="#overlay_entityedit" style="text-decoration:none;">
                <span><spring:message code="label.newevent"/></span>
        </a>
    </div>
<br class="clear"><br class="clear">

<div id='fullcalendar'></div>

<br class="clear"/>

</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>


<jsp:include page="../common-footer.jsp"/>

<div class="apple_overlay_entityedit" style="z-index:999" id="overlay_entityedit">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>

<div class="apple_overlay_eventview" style="z-index:999" id="overlay_eventview">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
