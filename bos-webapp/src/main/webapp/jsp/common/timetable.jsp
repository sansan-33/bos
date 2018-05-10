<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentmonth" value="${now}" pattern="M" />
<fmt:formatDate var="currentday" value="${now}" pattern="dd" />
<script type='text/javascript' src='/school/js/moment.min.js'></script>
<script>
//var moment = require('moment');
moment().format('DD MMM YYYY');
</script>

<c:set var="facheck"><i class="fa fa-check fa-1x" style="color:#77BB44"></c:set>
<c:set var="fatimes"><i class="fa fa-times fa-1x" style="color:#ccc"></c:set>

<br><br>
<div style="padding-top:15px;padding-bottom:10px;padding-left:8px;padding-right:20px;">
<div class="dbl-bdr"><div class="wrapper-small ">

<c:choose>
<c:when test="${fn:length(requestScope.eventsMap) > 0}">
 <table style="${requestScope.data eq 'month' ? 'width:760px' : 'width:1080px'} ">
	<tr class="content-table-1" >
	    <td style="width:85px;" class="border-bottom-gray"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.start"/></div></td>
	    <td style="width:95px;" class="border-bottom-gray"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.end"/></div></td>
	    <td class="border-bottom-gray"><div class="fontlarge fontbold d3-color-black" style="padding:5px;">
	        <spring:message code="label.importantday"/> / <spring:message code="label.introday"/> / <spring:message code="label.openday"/> / <spring:message code="label.applicationday"/>
	        </div>
	    </td>
	    <c:if test="${requestScope.dataonly ne 'y'}">
	    <td style="width:70px;"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.financetype"/></div></td>
	    <td style="width:90px;"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.eventtype"/></div></td>
       	<td style="width:50px;"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.status"/></div></td>
        </c:if>
       	<td style="width:60px;"><div class="fontlarge fontbold d3-color-black" style="padding:5px;"><spring:message code="label.remainingtime"/></div></td>
        <c:if test="${sessionScope.user['ROLEID'] == 1}">
        <td></td>
        </c:if>

	</tr>
	<c:set var="month">empty</c:set>
	<c:set var="rowcolorcount">1</c:set>
	<c:set var="titlelimit">12</c:set>
    <c:set var="rowcolor" value="${fn:split('#eee,#fff', ',')}" scope="application" />
	<c:forEach var="event" items="${requestScope.eventsMap}" varStatus="rowCounter">
    <c:if test="${month ne event['emonth'].toString()}">
    	<c:set var="rowcolorcount">${(rowcolorcount + 1) % 2}</c:set>
    </c:if>

    <tr style="height:25px;background-color:${rowcolor[rowcolorcount]}">
        <td class=" border-bottom-gray">
            <div class="fontlarge" style="padding:5px;">${event['startdate']}</div>
        </td>
        <td class=" border-bottom-gray"><div class="fontlarge fontbold" style="padding:5px;">${event['enddate']}</div></td>
        <td class=" border-bottom-gray">
        <div style="padding:5px;">
            <div>

                <c:choose>
                <c:when test="${not empty event['chscid']}">
                    <img style="width:15px;height:15px;float:left;margin: 0 5px 0 5px;min-height:18px;" src="/school/staticimage/CAT${event['categoryid']}/logo_${event['chscid']}.jpg" onerror="ImgError(this);"/>
                </c:when>
                <c:otherwise>
                    <img style="float:left;margin:6px 10px;" src="/school/img/greendot.png" />
                </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${event['eventtype'] eq 'importantday' }">
                        <a href="${event['url']}" target="_blank"><font class="fontxlarge" style='color:#f61644'>
                        <c:if test="${requestScope.dataonly eq 'y'}">
                            ${ fn:length(event[title]) > titlelimit ? fn:substring(event['title'], 0, titlelimit) : event['title']}${fn:length(event['title']) > titlelimit ? '...' : ''}
                        </c:if>
                        <c:if test="${requestScope.dataonly ne 'y'}">
                            ${event['title']}
                        </c:if>
                        </font></a>
                    </c:when>
                    <c:otherwise>
                        <a href="/school/controller/getCalendarEventView?id=${event['id']}" rel="#overlay_eventview"><font class="fontxlarge">
                        <c:if test="${requestScope.dataonly eq 'y'}">
                            ${ fn:length(event[title]) > titlelimit ? fn:substring(event['title'], 0, titlelimit) : event['title']}${fn:length(event['title']) > titlelimit ? '...' : ''}
                        </c:if>
                        <c:if test="${requestScope.dataonly ne 'y'}">
                            ${event['title']}
                        </c:if>
                        </font></a>
                    </c:otherwise>
                </c:choose>
                <c:if test="${currentmonth eq event['emonth']  }">
                <a id="todayanchor" style="position:relative;left:-450px;top:40px;"><i class="fa fa-arrow-right fa-2x" style="color:#77BB44"></i></a>
                <c:set var="currentmonth">1000</c:set>
                </c:if>
                <div style="float:right;" class="fontsmall d3-color-gray">
                <c:choose>
                        <c:when test="${event['timediffday'] > 0}">
            			</c:when>
            			<c:when test="${event['timediffhour'] > 0}">
            				<img src="/school/img/new.png"/>
            				 ${event['timediffhour']} <spring:message code="label.hourago"/>
            			</c:when>
            			<c:when test="${event['timediffmin'] > 0}">
            				<img src="/school/img/new.png"/>
            			    ${event['timediffmin']} <spring:message code="label.minago"/>
            			</c:when>
            			<c:otherwise>
            				<img src="/school/img/new.png"/>
            				 ${event['timediffsec']} <spring:message code="label.secago"/>
            			</c:otherwise>
          	    </c:choose>
          	    </div>
            </div>
        </div>
        </td>
        <c:if test="${requestScope.dataonly ne 'y'}">
        <td class="border-bottom-gray"><div class="fontlarge" style="padding:5px;">${empty event['financetype'] ? '--' : event['financetype']  }</div></td>
        <td class="border-bottom-gray"><div class="fontlarge" style="padding:5px;"><spring:message code="label.${event['eventtype']}"/></div></td>
        <td class="border-bottom-gray"><div class="fontlarge" style="padding:5px;">${event['status'] eq 'active' ? facheck : fatimes}</div></td>
        </c:if>
        <td class="border-bottom-gray">

            <span style="float:right;padding-right:5px;">
                <font class="fontmedium d3-color-gray">
                    <script>
                        var enddate = moment('${event["enddate"]}').add(1,'days');
                        var remain = enddate.diff(moment(),'days');
                        var suffix = (remain > 0) ? '<spring:message code="label.day" text="default text"/>' : (remain == 0 ) ? '<spring:message code="label.hour" text="default text"/>' : '<spring:message code="label.end" text="default text"/>';
                        if(remain == 0)
                            remain = enddate.diff(moment(),'hours');
                        document.write( remain > 0 ? "<font style='color:#f61644'>" + remain + suffix + "</font>" : suffix );
                    </script>
                </font>

            </span>
        <td>
        <c:if test="${sessionScope.user['ROLEID'] == 1}">
                <td>
                    <a href="/school/controller/getCalendarEventForm?eventid=${event['id']}" rel="#overlay_entityedit" style="float:right;text-decoration:none;"> +	</a>
                    <a href="#" onclick="javascript:hideEvent(${event['id']});" style="float:right;padding-right:20px;">x</a>
                </td>
        </c:if>
    </tr>
    <c:set var="month">${event['emonth']}</c:set>

    </c:forEach>

 </table>

</c:when>
<c:otherwise>
    <spring:message code="label.noinformation"/>
</c:otherwise>
</c:choose>
</div></div> <!-- end of table border -->
</div>


<div class="apple_overlay_entityedit" style="z-index:999" id="overlay_entityedit">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>

<div class="apple_overlay_eventview" style="z-index:999" id="overlay_eventview">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>


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

});
</script>
