<%@ include file="common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>

<jsp:include page="menu.jsp"/>
 

<script type="text/javascript" charset="utf-8">

			/* Table initialisation */
			$(document).ready(function() {

				$('#searchTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0 ] },{ "sType": "date-uk", "aTargets": [ 2 ] }],
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


<h1><spring:message code="label.privatedssreport"/>&nbsp;&nbsp;(<spring:message code="label.total"/>${fn:length(requestScope.schoolList)}<spring:message code="label.totalschool"/>)</h1>

<br><br>

					<table width="600px" class="bordered-table zebra-striped" id="searchTable">
						<thead>
						<tr valign="top">
					        <TH width="70" class="font1" nowrap><spring:message code="label.number"/></TH>
					       <TH width="240" class="font1"><spring:message code="label.schoolname"/> <spring:message code="label.applymethod"/></TH>
					       <TH width="80" class="font1"><spring:message code="label.reminder.application"/></TH>
					      
						</tr>
						</thead>
						<tbody>
						<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
							<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>   
					  		<td class="font1"><a name="${school['entityid']}-ap"></a> ${rowCounter.count}  </td>
					  		<td class="fontlarge d3-color-black fontbold"><br>
					  			<a href="/school/controller/entityDetails?entityid=${school['entityid']}&action=compare">${school['name']}<br>${school['nameeng']}</a>
  							<c:choose>
							<c:when test="${not empty school['applicationdate']}">
							<fmt:setLocale value="en" />  
  							<br><br><font class="fontlarge"> ${school['applicationdetails']}</font><br><br></td>
<td class="fontmedium" nowrap><fmt:formatDate pattern="MM/dd/yy" value="${school['applicationdate']}"/></td>							</c:when>
							<c:otherwise>
							<br>----</td>
							<td align="center" valign="middle">----</td>
							</c:otherwise>
							</c:choose>
	  						


	  				    </tr>
						</c:forEach>
						</tbody>
					</table>

<br><br><br><br>

       
<jsp:include page="common-footer.jsp"/>

