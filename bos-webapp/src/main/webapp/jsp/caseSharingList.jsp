<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<c:if test="${requestScope.dataonly ne 'y'}">
<%@ include file="common-header.jsp" %>

<jsp:include page="menu.jsp"/>

<div style="padding:10px">
<br><br><br class="clear">
<span class="d3-color-gray-1 fontxxxlarge" style="padding-right:5px;"><spring:message code="label.casesharing"/></span>
<span class="d3-color-gray-2 fontxlarge"><spring:message code="label.casesharing.intro"/></span>

<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
	<c:set var="statkey">caseSharing-1</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br><br><br class="clearboth">
<div class=" border-bottom-gray"></div>
<br><br><br class="clearboth">

			<table> 
			<tr><td>
			
				<c:choose>
						<c:when test="${not empty sessionScope.user}">
						    <button  type="submit" class="btn btn-red tk tk2" onclick='javascript:{ window.location="/school/controller/editCaseSharingDetails?mode=add"; }'><span><spring:message code="label.newcase"/></span></button>
     					</c:when>
						<c:otherwise>
						    <button  type="submit" class="btn btn-red tk tk2" onclick='javascript:{ alert("<spring:message code="label.pleaselogin"/>");  }'><span><spring:message code="label.newcase"/></span></button>
						</c:otherwise>
				</c:choose>
			
			</td>
			<td class="fontlarge d3-color-gray">&nbsp;
			<input type=radio name="view" value="all" ${requestScope.view eq 'all' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=all"; }' > <spring:message code='label.viewall'/> 
			<input type=radio name="view" value="mycasesharing" ${requestScope.view eq 'mycasesharing' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=mycasesharing"; }' > <spring:message code='label.mycasesharing'/>
			<input type=radio name="view" value="mycasesharing" ${requestScope.view eq 'mostviewed' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=mostviewed"; }' > <spring:message code='label.mostpplviewed'/>
			<input type=radio name="view" value="mycasesharing" ${requestScope.view eq 'mosthelpful' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=mosthelpful"; }' > <spring:message code='label.mosthelpful'/>

			<c:if test="${sessionScope.user['roleid'] eq 1 }">
			<span style="padding-left:100px;">
				<input type=radio name="view" value="waitingapproval" ${requestScope.view eq 'waitingapproval' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=waitingapproval"; }' > <spring:message code='label.waitingapproval'/>
				<input type=radio name="view" value="rejected" ${requestScope.view eq 'rejected' ? 'checked' : ''} onclick='javascript:{ window.location="/school/controller/getCaseSharingList?view=rejected"; }' > <spring:message code='label.rejected'/>
			</span>
			</c:if>
			</td></tr>
			</table>
			<br class="clear"/>
</div>
</c:if>
<div id="loadingdiv" align=center><img src="/school/img/uber-loading.gif"/></div>
<div id="tabcontent" style="margin:0 auto;padding: 10px">
					<table ${requestScope.dataonly ne 'y' ? 'width="800px"': '' }  class="bordered-table zebra-striped" id="caseTable" >
						<thead> 
						<tr>
							<th>#</th>
						   	<TH width="150" class="fontlarge"><spring:message code="forum.author"/></TH>
							<TH width="400" class="fontlarge"><spring:message code="label.casetitle"/></TH>
					       <c:if test="${requestScope.view ne 'all'}">
							<TH width="50"><spring:message code="label.status"/></TH>
							<TH width="30"></TH>
							</c:if>
						</tr>
						</thead> 
						<tbody> 
						<c:forEach var="casesharing" items="${requestScope.caseSharingList}" varStatus="rowCounter">
						  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>  
						  	<td>${rowCounter.count}</td>
					  		<td class="fontlarge" style="padding:10px 0px 10px 30px;">
					  			<img class="imagedropshadow" width="140" height="120" alt="Slide${rowCounter.count}" src="/school/userimages/${casesharing['filename']}"/>
					  			
					  			
								
							</td>
							<td class="fontlarge" style="padding:10px 15px 10px 15px;">
							<a href="/school/controller/getCaseSharingDetails?id=${casesharing['caseid']}" >
					  			
								<div class="fontxxlarge d3-color-black fontbold" style="padding-bottom:10px;padding-top:5px;">${casesharing['title']}</div>
								</a>
								<div class="fontmedium"> 
								<font class="d3-color-gray-3"><spring:message code="forum.author"/> :</font> <a href="/school/controller/viewProfile?userid=${casesharing['userid']}">${casesharing['namelocal']}</a>
								<font class="d3-color-gray-1">
  								<c:choose>
										<c:when test="${casesharing['timediffday'] > 0}">
											 ${casesharing['timediffday']} <spring:message code="label.dayago"/>
										</c:when>
										<c:when test="${casesharing['timediffhour'] > 0}">
									 		 ${casesharing['timediffhour']} <spring:message code="label.hourago"/>
										</c:when>
										<c:when test="${casesharing['timediffmin'] > 0}">
											 ${casesharing['timediffmin']} <spring:message code="label.minago"/>
										</c:when>
										<c:otherwise>
											 ${casesharing['timediffsec']} <spring:message code="label.secago"/>
										</c:otherwise>
									</c:choose>
									</font>
									<font class="d3-color-gray-3"><spring:message code="label.hitcount"/>/<spring:message code="label.helpfulshort"/>: </font> <font class="d3-color-gray-1">${casesharing['hitcounter']} / ${empty casesharing['helpful'] ? '0' : casesharing['helpful']}</font>
								</div>
								
  								<div class="fontxlarge" style="line-height:1.4em;padding-bottom:10px;padding-top:10px;">
  								${casesharing['analysis'] }
  								</div>
  								
  								<div style="padding-top:10px;padding-bottom:10px;" class="d3-color-gray-3"><spring:message code="label.firstchoice"/> : 
					  			<a href="/school/controller/getCaseSharingDetails?id=${casesharing['caseid']}" class="d3-color-gray-2" >
					  			${casesharing['targetentity']} ${casesharing['targetentityeng']}
  								</a>
  								</div>
  							</td>
	  						
							
						
							<c:if test="${requestScope.view ne 'all'}">
							<c:set var="approved"><spring:message code="label.approved"/></c:set>
							<c:set var="approving"><spring:message code="label.approving"/></c:set>
							<c:set var="rejected"><spring:message code="label.rejected"/></c:set>
							<c:set var="waiting"><spring:message code="label.waiting"/></c:set>
							<c:set var="notsubmitted"><spring:message code="label.notsubmitted"/></c:set>
							
							<td class="font1">${casesharing['approved'] eq 'y' ? approved: casesharing['approved'] eq 'r' ? rejected : casesharing['approved'] eq 'w' ?  waiting : casesharing['approved'] eq 'a' ? approving : notsubmitted}</td>
							<td>
								<c:if test="${casesharing['publish'] eq 'n' || casesharing['approved'] eq 'r'  }">
									<span class="wrpBtn" onclick='javascript:{ window.location="/school/controller/editCaseSharingDetails?id=${casesharing["caseid"]}"; }'><span class="font1white button_ta mdm" ><input style="width:20px;" class="submit" type="button"  value="<spring:message code='label.fix'/>" /></span></span>
    								<br class="clear"><br class="clear">
    								<span class="wrpBtn" onclick='javascript:{ window.location="/school/controller/getCaseSharingDetails?id=${casesharing["caseid"]}"; }'><span class="font1white button_ta mdm" ><input style="width:20px;" class="submit" type="button"  value="<spring:message code='label.preview'/>" /></span></span>
    							</c:if>
    							<c:if test="${requestScope.view eq 'waitingapproval'  }">
									<span class="wrpBtn" onclick='javascript:{ window.location="/school/controller/editCaseSharingDetails?id=${casesharing["caseid"]}"; }'><span class="font1white button_ta mdm" ><input style="width:20px;" class="submit" type="button"  value="<spring:message code='label.fix'/>" /></span></span>
    							</c:if>
							</td>
    						</c:if>

						</tr>
						</c:forEach>
						</tbody>
					</table>
</div>
<c:if test="${requestScope.dataonly ne 'y'}">       
  
<br><br><br> 

<jsp:include page="common-footer.jsp"/>
</c:if>

<script>

$('#loadingdiv')
.hide()  // hide it initially
.ajaxStart(function() {
    $(this).show();
    $("#tabcontent").hide();
})
.ajaxStop(function() {
    $(this).hide();
    $("#tabcontent").show();
})
;
</script>    


<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('#caseTable').dataTable( {
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"aoColumns": [
									{"bVisible": false},
	                              {"bSortable": false},
	                             
	                             
	                              <c:choose>
	                              <c:when test="${requestScope.view ne 'all'}">
	                              {"iDataSort": 0},
	                              {"bSortable": true},
	                              
	                              {"bSortable": false}
	                              </c:when>
	                              <c:otherwise>
	                              {"iDataSort": 0}
	                              
	                              </c:otherwise>
	                              </c:choose>

	                             ],
					"sPaginationType": "bootstrap",
					"aaSorting": [[0,'asc']],
					"bFilter": false,
					"bPaginate": false,
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
