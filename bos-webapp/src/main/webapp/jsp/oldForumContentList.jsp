<%@ include file="common-header.jsp" %>

<jsp:include page="menu.jsp"/>

<c:choose>
<c:when test="${not empty requestScope.mypost && sessionScope.user['id'] eq requestScope.requestuserid}">
<jsp:include page="account/accountMenu.jsp"/>
<div style="padding: 0px 30px 0 30px;">
</c:when>
<c:when test="${not empty requestScope.mypost}">
<span  class="font4 d3-color-gray-1">${requestScope.forumcontentlist[0]['username']}<spring:message code='label.publishpost'/></span><br class="clear"><br class="clear">
</c:when>
</c:choose>
					<c:set var="parentrating"><spring:message code='label.parentrating'/></c:set>
					<c:set var="signupalert">alert('<spring:message code='label.pleaselogin'/>')</c:set>
					<c:set var="askquestion">window.location="/school/controller/askQuestion?id=0&type=${requestScope.topmenu[0]["type"]}&categoryid=${requestScope.topmenu[0]["categoryid"]}&maincategoryname=${requestScope.topmenu[0]["maincategoryname"]}&maincategoryuri=getForumContent</c:set>
					
					<c:if test="${empty requestScope.mypost }">
					<div style="position:relative;float:left;"><span class="button_grn"><span class="bg_grn gradient" onclick='${not empty sessionScope.user ? askquestion : signupalert }'><spring:message code="label.askquestion"/></span></span>
     				</div>
     				</c:if>
     				<div style="position:relative;float:left"><jsp:include page="ads/yahoocontentmatch.jsp"/></div><br class="clear">
					<table width="600px" class="bordered-table zebra-striped" id="forumTable">
						<thead> 
						<tr>
							<th width="15"></th>
						   	<TH width="280"><spring:message code="forum.subject"/></TH>
							<TH width="30"><spring:message code="forum.author"/></TH>
					        <TH width="40"><spring:message code="forum.reply"/>/<spring:message code="forum.view"/></TH>
					        
					        <TH width="40"><spring:message code="label.lastupdate"/></TH>
					        <th>Sortable Date</th>
					        
						</tr>
						</thead> 
						<tbody> 
						<c:forEach var="forum" items="${requestScope.forumcontentlist}" varStatus="rowCounter">
							<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' } style="height:40px;CURSOR: pointer; cursor: hand;" onclick="getForumContent('${forum['id']}','${requestScope.topmenu[0]['categoryid']}','${requestScope.topmenu[0]['type']}','${requestScope.topmenu[0]['maincategoryname']}','getForumContent')">  
						  	<td>
						  		<c:set var="subject">${forum['subject']}</c:set>
						  		
						  		<c:choose>
						  			<c:when test="${fn:startsWith( subject, parentrating) }">
						  				<img width="15px;" height="15px;" src="/school/img/parentsmall.png">
									</c:when>
									<c:when test="${forum['userid'] eq '1'}">
						  				<img width="15px;" height="15px;" src="/school/img/logobookgreen.png">
									</c:when>
									<c:otherwise>
										<img width="15px;" height="15px;" src="/school/img/post_active.gif">
									</c:otherwise>
								</c:choose>
						  	</td>
						  	<td class="fontmedium">
							${ fn:length(forum['subject']) > 30 ? fn:substring(forum['subject'], 0, 30) : forum['subject'] }${ fn:length(forum['subject']) > 30 ? '......' : '' } 
							</td>
					  		<td class="font1">
					  			<c:choose>
					  				<c:when test="${forum['anonymous'] eq 'y' || forum['userid'] eq '1' || empty  forum['username'] }">
										<spring:message code="label.anonymous"/>
									</c:when>
									<c:otherwise>
							 			${forum['username']}
									</c:otherwise>
								</c:choose>
							</td>
							<td class="font1">
						  		${not empty forum['totalreply'] ? forum['totalreply'] : 0} / ${not empty forum['hitcounter'] ? forum['hitcounter'] : 0 }
							</td>
							<td class="font1green">
				  					<c:choose>
										<c:when test="${forum['timediffday'] > 0}">
											 ${forum['timediffday']} <spring:message code="label.dayago"/>
										</c:when>
										<c:when test="${forum['timediffhour'] > 0}">
									 		 ${forum['timediffhour']} <spring:message code="label.hourago"/>
										</c:when>
										<c:when test="${forum['timediffmin'] > 0}">
											 ${forum['timediffmin']} <spring:message code="label.minago"/>
										</c:when>
										<c:otherwise>
											 ${forum['timediffsec']} <spring:message code="label.secago"/>
										</c:otherwise>
									</c:choose>
							</td>
							<td>${forum['sortabledate']}</td>
						</tr>
						</c:forEach>
						</tbody>
					</table>

<c:if test="${not empty requestScope.mypost}">
</div>
</c:if>

 

<jsp:include page="common-footer.jsp"/>


<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('#forumTable').dataTable( {
					"bProcessing": true,
					"bServerSide": true,
					"sAjaxSource": "/getForumContentList"
				} );
				
				$('#forumTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0 ] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"aaSorting": [[5,'desc']],
					"aoColumns": [
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": true},
	                              {"bSortable": false},
	                              {"iDataSort": 5},
	                              {"bVisible": false}
	                             ],
					"bLengthChange": false,
					"iDisplayLength": 50,
					"bFilter": ${not empty requestScope.mypost ? 'false' : 'true'},
					"bPaginate": ${not empty requestScope.mypost ? 'false' : 'true'},
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


<form action="/school/controller/getForumDetails" method="post" name="forum" id="forum">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>  	
       

<script type="text/javascript">

function getForumContent(id,categoryid,type,maincategoryname,maincategoryuri){

	document.forms["forum"].id.value = id;
	document.forms["forum"].categoryid.value = categoryid;
	document.forms["forum"].type.value = type;
	document.forms["forum"].maincategoryname.value = maincategoryname;
	document.forms["forum"].maincategoryuri.value = maincategoryuri;
	
	document.forms["forum"].submit();
}
</script>
