<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<script type="text/javascript" charset="utf-8">

$('#loadingdivmain')
    .hide()  // hide it initially
    .ajaxStart(function() {
        $(this).show();
	$("#tabcontentmain").hide();
    })
    .ajaxStop(function() {
        $(this).hide();
	$("#tabcontentmain").show();
    })
;
		
			/* Table initialisation */
			$(document).ready(function() {


				$('#entitylist').dataTable( {
					
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"aoColumns": [
	                              {"bSortable": false},
	                              {"bSortable": false},
	                              {"bSortable": true},
	                              
	                              {"bSortable": true},
	                              {"bSortable": true}
	                              
	                             ],
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
					
<div id="loadingdivmain" align=center><img src="/school/img/uber-loading.gif"/></div>
<span id="tabcontentmain"  style="margin:0 auto;">					
							
							<table cellpadding="0" cellspacing="0" border="0"  id="entitylist" class="bordered-table zebra-striped">
									<thead> 
									<tr>
										<TH width="35" ></TH>
								        <TH width="180" class="fontmedium"><spring:message code="label.schoolname"/></TH>
										<TH width="60" class="fontmedium"><spring:message code="label.estimatedenrollment"/></TH>
								    	<TH width="50" class="fontmedium"><spring:message code="label.parentrating"/></TH>
										<TH width="60" class="fontmedium"><spring:message code="label.hitcount"/></TH>
									 </tr>
									</thead> 
									<tbody> 
									<c:forEach var="entity" items="${requestScope.entitylist}" varStatus="rowCounter">
										<c:set var="idtostring">${entity['entityid']}</c:set>
									  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' }>  
								  		<td style="padding-left:20px;"><img src="/school/staticimage/CAT${entity['categoryid']}/logo_${entity['chscid']}.jpg" onerror="ImgError(this);"  width="45px" height="40px"/></td>
								  		<td class="fontlarge" style="padding:10px 0 10px;"><a class="d3-color-black" href="/school/controller/entityDetails?entityid=${entity['entityid']}&action=compare">${entity['name']} <font class="font1b">${entity['financetype']}</font>
								  		<br><div class="d3-color-gray-3" style="padding-top:2px;">${entity['nameeng']}</div></a></td>
								  		<td class="fontmedium">${requestScope.favoriteCount[idtostring]}</td>
			  							<td class="fontmedium" nowrap><p>${entity['parentscore']} <c:if test="${requestScope.parentCommentCount[idtostring] > 0}">
			  							<a href="/school/controller/entityDetails?entityid=${entity['entityid']}&action=compare#usercomment-ap">
			  							<img style="padding-left:5px;" src="/school/img/d3bubble.png"/> ${requestScope.parentCommentCount[idtostring]}
			  							</a>
			  							</c:if></p></td>
			  							<!-- 
			  							<td class="font1">${entity['score']}</td>
			  							
			  							<td class="font1">${entity['shortday']}-${entity['shormonth']}-</td>
			  							 -->
			  							<td class="fontmedium">${entity['viewedschool']}</td>
			  							</td>
				  						</tr>
									</c:forEach>
									</tbody>
					        </table>
									
			
 </span>
      
