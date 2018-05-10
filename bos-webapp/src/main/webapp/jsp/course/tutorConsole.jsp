<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request"><spring:message code="label.html.title.tutor"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.html.desc.tutor"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>
<%@ include file="../common-header.jsp" %>

<script src="/school/js/jquery.corner.js"></script>

<script type="text/javascript" charset="utf-8">

/* Table initialisation */
			$(document).ready(function() {

				$('div.tutormainborder').corner("round 3px");
				$('div.tutormain').corner("round 4px");
				
				$('#courselist').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0,5] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"iDisplayLength": 20,
					"bFilter": false,
					"bPaginate": false,
					"oLanguage": {
						"oPaginate": { "sNext": "<spring:message code='label.nextpage'/>",	"sPrevious": "<spring:message code='label.previouspage'/>"},
						"sLengthMenu": "_MENU_ <spring:message code='label.recordsperpage'/>",
						"sZeroRecords": "&nbsp;",
						"sSearch": "<spring:message code='label.search'/>", 
						"sInfo": "",
						"sInfoEmpty": "<spring:message code='label.showing'/> 0 <spring:message code='label.to'/> 0 <spring:message code='label.of'/> 0 <spring:message code='label.records'/>",
						"sInfoFiltered": "(<spring:message code='label.filter'/> _MAX_ <spring:message code='label.records'/>)"
						
					}
				} );
				
			} );
			
			
		</script>


<script>
  $(function() {
      $("#haccordion").tabs("#haccordion div", {
      tabs: 'img',
      effect: 'horizontal'
    });
    });
</script>


<jsp:include page="../menu.jsp"/>

<jsp:include page="tutormenu.jsp"/>
<div class="tutormainborder" style="background-color: rgb(88,148,66);padding:1px;" >
<div class="tutormain" style="background-color: white;padding:10px;padding-bottom:50px;min-height:400px;" >

<br class="clearboth"><br class="clearboth">



<div id="haccordion">
 
  
	<c:forEach var="tutorcategory" items="${requestScope.tutorCategoryList}" varStatus="rowCounter">
			<c:choose>
			<c:when test="${tutorcategory['value'] eq 0 }">
				<img src="/school/img/tutor.png"  width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getTutorCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:when>
			<c:when test="${tutorcategory['value'] eq 1 }">
				<img src="/school/img/piano.png" width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getMusicCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:when>
			<c:when test="${tutorcategory['value'] eq 2 }">
				<img src="/school/img/oral.png" width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getOralCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:when>
			<c:when test="${tutorcategory['value'] eq 3 }">
				<img src="/school/img/extra.png" width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getExtraCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:when>
			<c:when test="${tutorcategory['value'] eq 4 }">
				<img src="/school/img/sport.png" width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getSportCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:when>
			<c:otherwise>
				<img src="/school/img/tutor.png" width="60px;" height="60px;" />
		    	<div style="width:200px;">
				<c:set var="link"><a href="/school/controller/getTutorCourseForm?nocache=<%=new java.util.Date().getTime()%>&coursetype=${tutorcategory['value']}" rel="#overlay_tutor"></c:set>
			</c:otherwise>
			</c:choose>
			
				<c:if test="${empty tutorcategory['registered'] }">
				<c:set var="link"><a href="#" onclick='alert("<spring:message code="label.registerclass" arguments="${tutorcategory['description']}" htmlEscape="false" argumentSeparator=";"/>")'></c:set>
				</c:if>
			${link}			
			<p>+ ${tutorcategory['description']}</p></a>
	</div>
  	</c:forEach>

</div>

<br class="clear">
	<div class="container" style="width:600px;">
	
			<table style="margin: auto;"><tr>
			<td><font class="font2"><spring:message code="label.registered.tutorcategory"/></font></td>
			</tr></table>
	
			<table cellpadding="0" cellspacing="0" border="0"  id="courselist" class="bordered-table zebra-striped">
									<thead> 
									<tr>
										<TH width="25" class="font0"><spring:message code="label.number"/></TH>
								        <TH width="25" class="font0"><spring:message code="label.tutor"/></TH>
								        <TH width="80" class="font0"><spring:message code="label.coursename"/></TH>
  							            <TH width="40" class="font0"><spring:message code="label.courseinstrumentcategory"/></TH>
								        <TH width="75" class="font0"><spring:message code="label.tutorialteaching"/></TH>
								        <TH width="50" class="font0"><spring:message code="label.hourlyrate"/></TH>
										<TH width="50" class="font0"><spring:message code="label.timeleft"/></TH>
										<TH width="50" class="font0"></TH>
										<TH width="50" class="font0"><spring:message code='label.chathistory'/></TH>
									</tr>
									</thead> 
									<tbody> 
									<c:forEach var="course" items="${requestScope.courseList}" varStatus="rowCounter">
										<c:set var="key">${course["id"]}</c:set>
									  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>  
								  		<td class="font1">${rowCounter.count}</td>
								  		<td class="font1"><img style="padding-right:0px;" src="/school/userimages/${course['userprofile']}"  onerror="UserImgError(this);"  width="30px" height="30px"/></td>
										<td class="font1">
								  			${course['coursename']}
							  			</td>
							  			<td>
									  		<c:choose>
												<c:when test="${course['tutorcategoryid'] eq 0 }">
													<c:set var="imgpath">/school/img/tutor.png</c:set>
											  	</c:when>
												<c:when test="${course['tutorcategoryid'] eq 1 }">
													<c:set var="imgpath">/school/img/piano.png</c:set>
											   </c:when>
												<c:when test="${course['tutorcategoryid'] eq 2 }">
													<c:set var="imgpath">/school/img/oral.png</c:set>
											   </c:when>
												<c:when test="${course['tutorcategoryid'] eq 3 }">
													<c:set var="imgpath">/school/img/extra.png</c:set>
											   </c:when>
												<c:when test="${course['tutorcategoryid'] eq 4 }">
													<c:set var="imgpath">/school/img/sport.png</c:set>
											   </c:when>
											</c:choose>
												<img src="${imgpath}" width="35px;" height="35px;" />
										
										</td>
							  			<td class="font1">${course['gradestart']} - ${course['gradeend']} </td>
			  							<td class="font1">${course['hourlyrate']}</td>
			  							<td class="font1green">
				  							<c:choose>
											<c:when test="${course['timediffday'] > 0}">
											 ${course['timediffday']} <spring:message code="label.day"/>
											</c:when>
											<c:when test="${course['timediffhour'] > 0}">
									  		 ${course['timediffhour']} <spring:message code="label.hour"/>
											</c:when>
											<c:when test="${course['timediffmin'] > 0}">
											 ${course['timediffmin']} <spring:message code="label.min"/>
											</c:when>
											<c:otherwise>
											 ${course['timediffsec']} <spring:message code="label.sec"/>
											</c:otherwise>
											</c:choose>
										</td>
										<td class="font2b">
			  							<a style='padding-left:0px;' href='/school/controller/getCourseForm?id=${course["id"]}&coursetype=${course["tutorcategoryid"]}&tutorcategoryid=${course["tutorcategoryid"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_tutor'> 
										<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:0px"><input class="submit" type="button"  value="<spring:message code='label.fix'/>" /></span></span>
										</a> 
										</td>
										<td class="font1">
			  							<a style='padding-left:0px;' href='/school/controller/getAppliedUserList?courseid=${course["id"]}&coursetype=${course["tutorcategoryid"]}&tutorcategoryid=${course["tutorcategoryid"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_tutor'> 
										<img src="/school/img/comment.png" style="float:left;padding-left:15px;" /><span style="float:left;padding-left:3px;">(${not empty requestScope.appliedUserCountList[key] ? requestScope.appliedUserCountList[key] : '0'})</span>
										</a> 
										</td>
				  						</tr>
									</c:forEach>
									</tbody>
			</table>
	</div>


</div>
</div>
<jsp:include page="../common-footer.jsp"/>
