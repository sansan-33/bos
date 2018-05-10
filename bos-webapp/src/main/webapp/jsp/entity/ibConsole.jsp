<%@ include file="../common-header.jsp" %>

<jsp:include page="../menu.jsp"/>

<jsp:include page="../ads/wideAds.jsp"/>

<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('#searchTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0 ] },{ "sType": "currency", "aTargets": [ 10 ] }],
					"aoColumns": [
								  {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": false}
	                	                             ],
					
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"bLengthChange": false,
					"iDisplayLength": 100,
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


					<font class="font4b">${requestScope.schoolList[0]['schoolsystem']} (Last updated: <fmt:formatDate pattern="dd-MM-yy" value="${requestScope.schoolList[0]['lastmodified']}" /> )</font><br>
					<font class="fontsmall d3-color-gray-3">${requestScope.schoolList[0]['schoolsystemdesc']}</font><br><br>
					
					<c:set var="tick"><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(106,169,47);">&#10003;</span></c:set>
					<table width="680px" class="bordered-table zebra-striped" id="searchTable">
						<thead> 
						<tr>
						   	<th width="18"></th>
						   	<TH width="200"><spring:message code="label.schoolname"/></TH>
					        <TH width="150"><spring:message code="label.feature"/></TH>
					        <TH width="150"><spring:message code="label.address"/>/<spring:message code="label.url"/> </TH>
							<TH width="45"><spring:message code="label.studenttotal"/></TH>
							<TH width="35"><spring:message code="label.kindergarten"/></TH>
							<TH width="30"><spring:message code="label.primary"/></TH>
							<TH width="30"><spring:message code="label.secondary"/></TH>
							<TH width="1"></TH>
						</tr>
						</thead> 
						<tbody> 
						<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
						  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' } style="CURSOR: pointer; cursor: hand;" onclick="javascript:{window.location='/school/controller/entityDetails?entityid=${school['entityid']}&action=compare'}" >  
					  		<td> <img class="imagedropshadow" src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);" width="15px" height="15px"/></td>
							<td class="fontlarge d3-color-black" style="line-height:1.230;">
					  			${school['name']}<br>${school['nameeng']}<br>
					  			<font class="d3-color-gray-2">
					  			<spring:message code="label.schoolfee"/>:<fmt:formatNumber value="${school['schoolfee']}" type="currency" currencyCode="HKD"/><a style="padding-left:5px;" href="${school['qareporturl']}" target="_blank" ><spring:message code="label.source"/></a>
								</font>
  							</td>
	  						<td class="d3-color-gray-1" style="line-height:1.230;">${school['feature']}</td>
	  						<td class="d3-color-gray-1" style="line-height:1.230;">${school['address']}<br><a href="${school['url']}" target="_blank">${school['url']}</a></td>
							<td class="d3-color-gray-1" align="right">${school['enrolltotal'] eq 0 ? '-' : school['enrolltotal']}</td>
	  						<td>${school['iskindergarten'] eq 'y' ? tick : '' }</td>
	  						<td>${school['isprimary'] eq 'y' ? tick : '' }</td>
	  						<td>${school['issecondary'] eq 'y' ? tick : '' }</td>
	  						
  							<td class="d3-color-gray-1"><c:if test="${school['financetype'] eq 'y'}"><img style="height:12;width:12px" src="/school/img/ib.png" /></c:if>&nbsp;</td>
  						</tr>
						</c:forEach>
						</tbody>
					</table>
  
<br><br><br><br>
 

       
<jsp:include page="../common-footer.jsp"/>
