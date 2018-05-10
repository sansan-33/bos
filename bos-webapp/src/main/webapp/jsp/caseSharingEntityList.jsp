<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {


				$('#casesharingentitylist').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0] }],
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
				<c:set var="tick"><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(106,169,47);">&#10003;</span></c:set>
				<c:set var="cross"><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(121,33,49);">X</span></c:set>
										

			<div class="container" style="width:400px;left:0px;top:55px;position:relative;">
							<table cellpadding="0" cellspacing="0" border="0"  id="casesharingentitylist" class="bordered-table zebra-striped">
									<thead> 
									<tr>
										<TH width="20" class="font0"><spring:message code="label.number"/></TH>
								        <TH width="100" class="font0"><spring:message code="label.schoolname"/></TH>
										<TH width="30" class="font0"><spring:message code="label.offer"/></TH>
										<TH width="30" class="font0"><spring:message code="label.schoolcategory"/></TH>
								     </tr>
									</thead> 
									<tbody> 
									<c:forEach var="entity" items="${requestScope.casesharingentitylist}" varStatus="rowCounter">
									  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>  
								  		<td class="font1">${rowCounter.count}</td>
								  		<td class="font1">${entity['appliedentity']}<br>${entity['appliedentityeng']}</td>
								  		<td class="font1">${entity['offer'] eq 'n' ? cross : tick}</td>
								  		<td class="font1">${entity['financetype']}</td>
			  							</td>
				  						</tr>
									</c:forEach>
									</tbody>
					</table>
			</div>
		
 
      
