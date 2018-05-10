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

				$(".oralclassdiv").hide();
				$(".extraclassdiv").hide();
				$(".sportclassdiv").hide();
				$(".tutorialclassdiv").hide();
				$(".musicclassdiv").hide();
				
				<c:choose>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupmusicclassid'])  gt 0 }">
					$(".musicclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookuporalclassid'])  gt 0  }">
					$(".oralclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupextraclassid'])  gt 0 }">
					$(".extraclassdiv").show();
				</c:when>
				<c:when test="${fn:length(sessionScope.courseSearch['lookupsportclassid'])  gt 0 }">
					$(".sportclassdiv").show();
				</c:when>
				<c:otherwise>
					$(".tutorialclassdiv").show();
				</c:otherwise>
				</c:choose>
				
				$('div.tutormainborder').corner("round 3px");
				$('div.tutormain').corner("round 4px");
				$('div.tutorsearch').corner();

				$('#courselist').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0,3,4 ] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"bLengthChange": false,
					"bFilter": false,
					"bPaginate": false,
					"iDisplayLength": 25,
					"oLanguage": {
						"oPaginate": { "sNext": "<spring:message code='label.nextpage'/>",	"sPrevious": "<spring:message code='label.previouspage'/>"},
						"sLengthMenu": "_MENU_ <spring:message code='label.recordsperpage'/>",
						"sZeroRecords": "&nbsp;",
						"sSearch": "<spring:message code='label.search'/>", 
						"sInfo": "<spring:message code='label.showing'/> _START_ <spring:message code='label.to'/> _END_ <spring:message code='label.of'/> _TOTAL_ <spring:message code='label.records'/>",
						"sInfoEmpty": "<spring:message code='label.showing'/> 0 <spring:message code='label.to'/> 0 <spring:message code='label.of'/> 0 <spring:message code='label.records'/>",
						"sInfoFiltered": "(<spring:message code='label.filter'/> _MAX_ <spring:message code='label.records'/>)"
					
						
					}
				} );
			} );
</script>

<script type="text/javascript">

function toggleClassRange(){
	
	var arr = new Array("tutorial","music","oral","extra","sport");
	for(var i=0; i<arr.length; i++) {
		$("." +  arr[i] + "classdiv" ).hide();
	}	
	
	$("." + arr[document.forms["coursesearch"].tutorcategoryid.value] + "classdiv" ).show();
		
}
function searchCourse(form){
	
	
	if($("select#tutorcategoryid").val() == 0 ){
		document.forms["coursesearch"].keywords.value = $("#lookuptutorialclassid option:selected").text();
		hideTutorCategoryID(0);
	}else if($("select#tutorcategoryid").val() == 1 ){
		document.forms["coursesearch"].keywords.value = $("#lookupmusicclassid option:selected").text();
		hideTutorCategoryID(1);
	}else if($("select#tutorcategoryid").val() == 2 ){
		document.forms["coursesearch"].keywords.value = $("#lookuporalclassid option:selected").text();
		hideTutorCategoryID(2);
	}else if($("select#tutorcategoryid").val() == 3 ){
		document.forms["coursesearch"].keywords.value = $("#lookupextraclassid option:selected").text();
		hideTutorCategoryID(3);
	}else if($("select#tutorcategoryid").val() == 4 ){
		document.forms["coursesearch"].keywords.value = $("#lookupsportclassid option:selected").text();
		hideTutorCategoryID(4);
	}
	document.forms["coursesearch"].newsearch.value = 'y';
	
	
	form.submit();
}
function hideTutorCategoryID(id){
	if(id != 0 ){
		$("#lookuptutorialclassid option:selected").val('-1');
	}
	if(id != 1 ){
		$("#lookupmusicclassid option:selected").val('-1');
	}
	if(id != 2 ){
		$("#lookuporalclassid option:selected").val('-1');
	}
	if(id != 3 ){
		$("#lookupextraclassid option:selected").val('-1');
	}
	if(id != 4 ){
		$("#lookupsportclassid option:selected").val('-1');
	}
}
</script>

<jsp:include page="tutormenu.jsp"/>
<div class="tutormainborder" style="background-color: rgb(88,148,66);padding:1px;" >
<div class="tutormain" style="background-color: white;padding:10px;padding-bottom:50px;" >
<br>
<div class="tutorsearch" style="background-color: rgb(231,238,218);padding:15px 10px 20px 10px;" >
<form action="/school/controller/getCourseList" method="post" name="coursesearch" id="coursesearch">
<input type="hidden" name="keywords" value="">
<input type="hidden" name="newsearch" value="-1">

<div style="float:left;">
<select id="tutorcategoryid" style="width: 10em;" name="tutorcategoryid" onchange="javascript:toggleClassRange()">
  	<option value=""><spring:message code="label.coursesearchselect"/></option>
	<c:forEach var="tutorcategory" items="${requestScope.tutorCategoryList}" varStatus="rowCounter">
			<option value="${tutorcategory['value']}"  <c:if test="${sessionScope.courseSearch['tutorcategoryid'] eq tutorcategory['value']}">selected</c:if> >
                    		${tutorcategory['description']}  ${tutorcategory['tooltips']}
			</option>
  	</c:forEach>
</select>
</div>

<c:forEach var="classtype" items="${fn:split('tutorial|music|oral|extra|sport', '|')}" varStatus="status" >
<c:set var="classtypelookupid">lookup${classtype}classid</c:set>
<div class="${classtype}classdiv"  style="float:left;">
		<select id=lookup${classtype}classid style="width: 17em;margin-left:5px;" name="lookup${classtype}classid" >
	  		<option value=""><spring:message code="label.coursesearchselect"/></option>
	
			<c:choose>
				<c:when test="${status.count eq 1}">
					<c:forEach var="courseclass" items="${requestScope.tutorialclasslist}" varStatus="rowCounter">
						<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
		                    		${courseclass['description']}
						</option>
		  			</c:forEach>
				</c:when>
				<c:when test="${status.count eq 2}">
					<c:forEach var="courseclass" items="${requestScope.musicclasslist}" varStatus="rowCounter">
								<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
				                    		${courseclass['description']}
								</option>
				  			</c:forEach>
				</c:when>
					<c:when test="${status.count eq 3}">
					<c:forEach var="courseclass" items="${requestScope.oralclasslist}" varStatus="rowCounter">
								<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
				                    		${courseclass['description']}
								</option>
				  			</c:forEach>
				</c:when>
				<c:when test="${status.count eq 4}">
					<c:forEach var="courseclass" items="${requestScope.extraclasslist}" varStatus="rowCounter">
								<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
				                    		${courseclass['description']}
								</option>
				  			</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="courseclass" items="${requestScope.sportclasslist}" varStatus="rowCounter">
								<option value="${courseclass['value']}"  <c:if test="${sessionScope.courseSearch[classtypelookupid] eq courseclass['value']}">selected</c:if> >
				                    		${courseclass['description']}
								</option>
				  			</c:forEach>
				</c:otherwise>
			</c:choose>

		</select>
</div>		
</c:forEach>
<br><br>
<div style="float:left;">
<select id="districtlookupid" style="width: 10em;" name="districtlookupid" >
  	<option value=""><spring:message code="label.districtsearchselect"/></option>
	<c:forEach var="district" items="${requestScope.districtList}" varStatus="rowCounter">
			<option value="${district['value']}"  <c:if test="${sessionScope.courseSearch['districtlookupid'] eq district['value']}">selected</c:if> >
                    		${district['description']}  
			</option>
  	</c:forEach>
</select>
</div>
<div style="float:left;padding-left:5px;" id="kidgrade" >
<select id="kidgradelookupid" style="width: 17em;" name="kidgradelookupid" >
  	<option value=""><spring:message code="label.gradesearchselect"/></option>
	<optgroup label="<spring:message code='label.generalgrade'/>">
  		<c:forEach var="kidgrade" items="${requestScope.kidgradelist}" varStatus="rowCounter">
				<option value="${kidgrade['value']}"  <c:if test="${sessionScope.courseSearch['kidgradelookupid'] eq kidgrade['value']}">selected</c:if> >
	                    		${kidgrade['description']}  
				</option>
	  	</c:forEach>
  	</optgroup>
  	<optgroup label="<spring:message code='label.music'/>">
  		<c:forEach var="musicrange" items="${requestScope.musicrangelist}" varStatus="rowCounter">
				<option value="${musicrange['value']}"  <c:if test="${sessionScope.courseSearch['kidgradelookupid'] eq musicrange['value']}">selected</c:if> >
	                    		${musicrange['description']}  
				</option>
	  	</c:forEach>
  	</optgroup>
  	
</select>
</div>
<br><br>
<div style="float:left;padding-left:5px;">		
<span class="font3b" style="width:180px;padding-right:5px;"><spring:message code="label.hourlyrate"/></span>:<input style="margin-left:10px;width:40px;" type="text" name="hourlyrate" size="10" value="${sessionScope.courseSearch['hourlyrate']}"/>
</div> 	
<div style="float:left;padding-left:60px;">		
	<c:set var="boy"><spring:message code="label.boy"/></c:set>
 	<c:set var="girl"><spring:message code="label.girl"/></c:set>
	<font class="font3b" ><spring:message code="label.tutorsex"/></font>: <input type=radio name=sex value="<spring:message code='label.boy'/>"  ${sessionScope.courseSearch['sex'] eq boy ? 'checked' : ''}   > <spring:message code='label.boy'/> <input type=radio name=sex value="<spring:message code='label.girl'/>" ${sessionScope.courseSearch['sex'] eq girl ? 'checked' : ''} > <spring:message code='label.girl'/>
</div>

<span style="float:right;font-size:12px; height:auto;" class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ searchCourse(document.forms["coursesearch"]); }'><spring:message code="label.search"/></span></span>
<span style="float:right;font-size:12px; height:auto;" class="button_grn"><span class="bg_grn gradient" onClick="javascript:{window.location='/school/controller/getCourseList?tutortab=0'}"><spring:message code="label.clearall"/></span></span>
</form>
<br>
</div>
<br>
		<c:choose>
		<c:when test="${fn:length(requestScope.courseList) eq 0}">
					<div style='text-align:center;padding-left:220px;padding-top:60px;padding-bottom:60px;'> 
					<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<a style='padding-left:20px;' href='/school/controller/getRequestTutorForm?nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_tutor'> 
							<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:140px;" class="submit" type="button"  value="<spring:message code='label.nothingfoundsorry'/> <spring:message code='label.requesttutor'/>" /></span></span>
						</a> 
					</c:when>
					<c:otherwise>
							<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:140px;" onclick='alert("<spring:message code="label.pleaselogin"/>");' class="submit" type="button"  value="<spring:message code='label.nothingfoundsorry'/> <spring:message code='label.requesttutor'/>" /></span></span>
					</c:otherwise>
					</c:choose>
					</div>
		</c:when>
		<c:otherwise>						
			<div class="container" style="width:600px;">
				<table cellpadding="0" cellspacing="0" border="0"  id="courselist" class="bordered-table zebra-striped">
									<thead> 
									<tr>
										<TH width="25" class="font0"><spring:message code="label.number"/></TH>
								        <TH width="25" class="font0"><spring:message code="label.tutor"/></TH>
								        <TH width="75" class="font0"><spring:message code="label.coursename"/></TH>
								        <TH width="50" class="font0"><spring:message code="label.courseinstrumentcategory"/></TH>
								        <TH width="70" class="font0"><spring:message code="label.tutorialteaching"/></TH>
								        <TH width="45" class="font0"><spring:message code="label.tutorsex"/></TH>
										<TH width="50" class="font0"><spring:message code="label.hourlyrate"/></TH>
										<TH width="50" class="font0"><spring:message code="label.timeleft"/></TH>
										<TH width="30" class="font0"></TH>
									</tr>
									</thead> 
									<tbody> 
									<c:forEach var="course" items="${requestScope.courseList}" varStatus="rowCounter">
										<c:set var="coursedetailsurl">onclick="window.location.href = '/school/controller/getCourseDetails?id=${course['id']}&tutoruserid=${course['tutoruserid']}&tutorcategoryid=${course['tutorcategoryid']}';" style="CURSOR: pointer; cursor: hand;"</c:set>
									  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }   >  
								  		<td class="font1">${rowCounter.count}</td>
								  		<td class="font1" style="text-align: center;" ${coursedetailsurl} >
								  		<img style="padding-right:0px;" src="/school/userimages/${course['userprofile']}"  onerror="UserImgError(this);"  width="30px" height="30px"/><br>${course['namelocal']}
								  		</td>
										<td class="font1" ${coursedetailsurl} >
								  			${course['coursename']}
							  			</td>
							  			<td ${coursedetailsurl}>
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
							  			<td class="font1" ${coursedetailsurl}>${course['gradestart']} - ${course['gradeend']} </td>
							  			<td class="font1" ${coursedetailsurl}>${course['sex']}</td>
			  							<td class="font1" ${coursedetailsurl}>${course['hourlyrate']}</td>
			  							<td class="font1green" ${coursedetailsurl}>
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
										<c:choose>
											<c:when test="${not empty sessionScope.user}">
												<a  href='/school/controller/getChatDialog?id=${course["questionanswerid"]}&type=c&entityid=${course["id"]}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_chat'> 
												<c:choose>
													<c:when test="${course['questionanswerid'] eq '-1' }">
														<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.apply'/>" /></span></span>
													</c:when>
													<c:otherwise>
														<span class="wrpBtn" ><span class="button_ta mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.chathistory'/>" /></span></span>
													</c:otherwise>
												</c:choose>
												</a> 
											</c:when>
											<c:otherwise>
												<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:50px;" onclick='alert("<spring:message code="label.pleaselogin"/>");' class="submit" type="button"  value="<spring:message code='label.apply'/>" /></span></span>
											</c:otherwise>
										</c:choose>
						
										</td>
				  						</tr>
									</c:forEach>
									</tbody>
					</table>
			</div>
			</c:otherwise>
		</c:choose>	
</div>
</div>


<c:set var="keywordsarray" value="${fn:split(requestScope.keywords, '-')}" />
<c:set var="keywords" value="${fn:contains(requestScope.keywords, '-') ? keywordsarray[1] : requestScope.keywords }" />
<c:set var="keywords" value="${fn:trim(keywords)}" />
		
		<br class="clear"><br class="clear"><br class="clear">
			<script>
				document.write('<scr'+'ipt type="text/javascript" language="javascript" src="https://js-apac-ss.ysm.yahoo.com/d/search/p/standard/js/hk/flat/mpd/rlb/?Keywords=${keywords}&Partner=uni_hk_pm_test&keywordCharEnc=utf8&outputCharEnc=utf8&mkt=hk&maxCount=10&urlFilters=uni_hk&serveUrl='+location.href+'"></scr'+'ipt>');
			</script>


			<script>
			document.write('<table style="border-top:5px solid #DCDCB8;border-left:2px solid #DCDCB8 ;border-right:2px solid #DCDCB8 ;border-bottom:2px solid #DCDCB8 ;background-color:#FFFFFF;" cellSpacing="0" cellPadding="4" width="100%" align="center"><tr height="40" style="background-color:#F1F1E4;font-weight:bold;border-bottom:1px solid #E0E0E0;" align="left"><td width="50"><span style="font-size: 9pt">${keywords}</span></td><td><span style="font-size: 9pt"><spring:message code="label.yahooads.promodetails"/></span></td><td align="right"><div style="color:#585858;font-size:12px;"><a href="http://hk.searchmarketing.yahoo.com/?o=HK0025" target="_blank"><font color="#C0C0C0"><spring:message code="label.yahooads.sponsorsite"/></font></a></div></td></tr>');
			var i=6;
			var j=6;
			if(i < zSr.length){
			while (i < zSr.length) {
				var descr = zSr[i++]; 
				var unused1 = zSr[i++]; 
				var clickURL = zSr[i++]; 
				var title = zSr[i++]; 
				var sitehost = zSr[i++]; 
				var unused2 = zSr[i++]; 
				document.write('<tr height="50" style="background:#FDFDFD;" align="left" onMouseOver="this.style.cursor=\'pointer\';window.status=\''+sitehost+'\';this.style.backgroundColor=\'#e7ebf0\';return true;" onMouseOut="this.style.cursor=\'\';window.status=\'\';this.style.backgroundColor=\'#FDFDFD\';">');
				document.write('<td width="50" onClick="window.open(\''+clickURL+'\', \''+(i/6-1)+'\')" title="'+title+' -- '+descr+'" valign="top" style="border-bottom:1px solid #E0E0E0;text-decoration:none;color:#00366C;font-size:13px;font-weight:bold;text-align:left;">');
				document.write('<a style="font-family:Tahoma;text-decoration:none;color:#000066;font-size:13px;font-weight:bold;text-align:left;"><img src="https://ysm.unimhk.com/thumbnail.php?l=' + sitehost + '" width="120"></a></td>');
				document.write('<td width="150" onClick="window.open(\''+clickURL+'\', \''+(i/6-1)+'\')" title="'+title+' -- '+descr+'" valign="top" style="border-bottom:1px solid #E0E0E0;text-decoration:none;color:#00366C;font-size:13px;font-weight:bold;text-align:left;">');
				document.write('<a style="font-family:Tahoma;text-decoration:none;color:#000066;font-size:13px;font-weight:bold;text-align:left;">'+title+'</a></td>');
				document.write('<td width="200" onClick="window.open(\''+clickURL+'\', \''+(i/6-1)+'\')" title="'+title+' -- '+descr+'" valign="top" style="border-bottom:1px solid #E0E0E0;" colSpan="2"><span style="color:#000000;">');
				document.write('<a style="color:#333333;font-size:13px;font-family:Tahoma">'+descr+'</a></span><br>');
				document.write('<div><a style="font-family:Tahoma;color:#CCCCCC;font-size:12px;">'+sitehost+'</a></div></td>');
				document.write('</tr>');
			}
			}
			document.write('</table>');
			
			</script>

<jsp:include page="../common-footer.jsp"/>
 
      
