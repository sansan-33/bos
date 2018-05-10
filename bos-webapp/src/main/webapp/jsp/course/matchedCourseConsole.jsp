<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request"><spring:message code="label.html.title.tutor"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.html.desc.tutor"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.html.keywords.tutor"/></c:set>

<%@ include file="../common-header.jsp" %>

<script src="/school/js/jquery.corner.js"></script>


<jsp:include page="../menu.jsp"/>

<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('div.matchedmainborder').corner("round 3px");
				$('div.matchedmain').corner("round 4px");


				$('#matchedcourselist').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0,3,4 ] }],
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


<jsp:include page="tutormenu.jsp"/>
<div class="matchedmainborder" style="background-color: rgb(88,148,66);padding:1px;" >
<div class="matchedmain" style="background-color: white;padding:10px;padding-bottom:50px;min-height:400px;" >
<br>
			<div class="container" style="width:600px;">
				<table cellpadding="0" cellspacing="0" border="0"  id="matchedcourselist" class="bordered-table zebra-striped">
									<thead> 
									<tr>
										<TH width="25" class="font0"><spring:message code="label.number"/></TH>
								        <TH width="25" class="font0"><spring:message code="label.tutor"/></TH>
										<TH width="50" class="font0"><spring:message code="label.coursedesc"/></TH>
										<TH width="40" class="font0"><spring:message code="label.courseinstrumentcategory"/></TH>
								        <TH width="40" class="font0"><spring:message code="label.tutorialteaching"/></TH>
								        <TH width="65" class="font0"><spring:message code="label.tutordistrict"/></TH>
										<TH width="45" class="font0"><spring:message code="label.tutorsex"/></TH>
										<TH width="40" class="font0"><spring:message code="label.hourlyrate"/></TH>
								      	<TH width="50" class="font0"><spring:message code="label.timeleft"/></TH>
								      	<TH width="50" class="font0"></TH>
								     </tr>
									</thead> 
									<tbody> 
									<c:forEach var="course" items="${requestScope.matchedcourselist}" varStatus="rowCounter">
									  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>  
								  		<td class="font1">${rowCounter.count}</td>
								  		<td class="font1" style="text-align: center;"><img style="padding-right:0px;" src="/school/userimages/${course['userprofile']}"  onerror="UserImgError(this);"  width="30px" height="30px"/><br>${course['namelocal']}</td>
			  							<td class="font1">${course['courseclass']}</td>
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
			  							<td class="font1">${course['grade']}</td>
								  		<td class="font1">${course['district']}</td>
								  		<td class="font1">${course['sex']}</td>
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
			  							<a style='padding-left:20px;' href='/school/controller/applyTutor?id=${course["id"]}&coursetype=${course["tutorcategoryid"]}&tutorcategoryid=${course["tutorcategoryid"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_tutor'> 
										<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.apply'/>" /></span></span>
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
 
      
