<%@ include file="common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>

<jsp:include page="menu.jsp"/>

<jsp:include page="ads/wideAds.jsp"/>
<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br><br class="clearboth">


 <script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('#searchTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0 ] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
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
<div style="position:relative;float:right;padding-right:10px;">
<c:forEach begin="2011" end="${requestScope.rankingyear}"  var="i" varStatus="stat">
    <a href="/school/controller/schoolAllocationReport?categoryid=${requestScope.categoryid}&schoolplacementyear=${i}"><font class="d3-color-gray-${requestScope.schoolplacementyear eq i ? '3' : '1' }">${i}</font></a> ${i ne requestScope.rankingyear ? "|" : ""}
</c:forEach>
</div>
<h1>${requestScope.schoolplacementyear} <spring:message code="label.schoolallocationsummary${requestScope.categoryid}"/>&nbsp;(<spring:message code="label.total"/>${requestScope.schoolallocationcount}<spring:message code="label.totalschool"/>)</h1>
		<p><font class="font1_5"><spring:message code="label.lastmodified"/><fmt:formatDate pattern="dd-MM-yy" value="${requestScope.schoolList[0]['lastmodified']}" /></font></p>

<br><br>

					<table width="1080px" class="bordered-table zebra-striped" id="searchTable">
						<thead>
						<tr >
						   <TH width="100" class="fontlarge" style="text-align:center"><spring:message code="label.number"/></TH>
					       <TH width="600" class="fontlarge"><spring:message code="label.schoolname"/></TH>
					       <!--
					       <TH width="150" class="fontlarge"><spring:message code="label.year"/></TH>
					        -->
					       <TH width="150" class="fontlarge"><spring:message code="label.noofschool"/></TH>
						   <TH width="150" class="fontlarge"><spring:message code="label.academic"/><spring:message code="label.ranking"/></TH>
						   <th><spring:message code="label.schoolDetails"/></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
						  	<tr class="${rowCounter.count % 2 > 0 ?  'odd' : 'even' }">
					  		<td class="fontxxlarge" style="text-align:center">${rowCounter.count}</td>
					  		<td class="fontxlarge d3-color-black" style="line-height:18px;">
					  			<a href="/school/controller/entityDetails?entityid=${school['entityid']}&action=compare">${school['name']}<br>${school['nameeng']}</a>
					  		</td>
  							<!--  <td class="font1arge">${school['allocationyear']}</td> -->
	  						<td class="fontxxlarge" style="padding-top:15px;">${school['noofschool']}</td>
	  						<td class="fontlarge" style="padding-top:15px;">${school['metric1']}</td>
	  						<td class="fontlarge" style="padding-top:15px;">
	  						<a href="/school/controller/schoolAllocationOverlay?entityid=${school['entityid']}&allocationyear=${requestScope.schoolplacementyear}&categoryid=${requestScope.categoryid}" rel="#schoolallocation_overlay" style="text-decoration:none">
							<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input class="submit" type="button"  value='<spring:message code="label.schoolallocation${requestScope.sacategoryid}"/>' /></span></span>
							</a>


							</td>
	  				    </tr>
						</c:forEach>
						</tbody>
					</table>
<br><br><br>

       
<jsp:include page="common-footer.jsp"/>

<!-- overlayed element -->
<div class="simple_overlay" id="schoolallocation_overlay" style="width:450px;">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
</div>
<!-- make all links with the 'rel' attribute open overlays -->
<script>
$(function() {

    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({

        effect: 'apple',

        onBeforeLoad: function() {

            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");

            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }

    });
});
</script>
