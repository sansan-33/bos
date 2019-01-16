<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="title" scope="request">${requestScope.schoolyear + 1} <spring:message code="label.hitschool"/></c:set>
<c:set var="htmltitle" scope="request">${title}</c:set>
<c:set var="htmlkeywords" scope="request">${title}</c:set>
<c:set var="htmldesc" scope="request">${title}</c:set>
<c:set var="htmlrobots" scope="request">${title}</c:set>
<c:set var="htmlgooglebot" scope="request">${title}</c:set>


<%@ include file="../common-header.jsp" %>

<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
            			$(document).ready(function() {

            				$('#searchTable').dataTable( {
            					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 0,3,4,5,6 ] }],
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

<jsp:include page="../menu.jsp"/>


					<jsp:include page="../ads/wideAds.jsp"/>

					<div style="border-bottom: 1px dashed grey;"></div>	
					<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
                    	<g:plusone size="medium"></g:plusone>
                    	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
                    	<c:set var="statkey">hitSchool-${categoryid}</c:set>
                    	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
                    </div>
					<br class="clearboth">
					<h1>${title}</h1><br>
					<p style="padding-bottom:5px;"><font class="fontxlarge"><spring:message code="label.hitschooldesc" arguments="${requestScope.schoolyear+1},${requestScope.schoolyear+2}" htmlEscape="false"/></font></p>
               		<div style="float:right;right:20px;position:relative;top:-60px;"><img src="/school/img/barchart.png" style="width:30px;height:30px;position:relative;top:5px;" /><a class="fontbold" style=" font-size:25px !important;" href="/school/controller/getCMSDetails?id=6"><spring:message code="label.howtorank"/></a></div>
					<br class="clearboth"><br class="clearboth">
					<div style="position:relative;float:left;padding-left:10px;">
                    <span style="padding-right:10px;" class="fontxxlarge fontbold"><spring:message code="label.year"/> : </span>
                    <c:forEach begin="2013" end="2018"  var="i" varStatus="stat">
                        <a href="/school/controller/getHitSchoolReport?categoryid=${requestScope.categoryid}&schoolyear=${i}"><font class="d3-color-${requestScope.schoolyear eq i ? 'blue fontbold' : 'gray-1' }">${i+1}</font></a> ${stat.last ? '' : '|' }
                    </c:forEach>
                    </div>
					<br class="clearboth">
					<div style="position:relative;float:left;padding-left:10px;">
					<span style="padding-right:10px;" class="fontxxlarge fontbold"><spring:message code="label.poaschoolnetshort"/> : </span>
				    <a href="/school/controller/getHitSchoolReport?categoryid=${requestScope.categoryid}&schoolyear=${requestScope.schoolyear}&poaschoolnet=-1"><font class="d3-color-${requestScope.poaschoolnet eq '-1' ? 'blue fontbold' : 'gray-1' }"><spring:message code="label.allthetime"/></font></a> |
                    <c:forEach var="poa" items="${requestScope.poaSchoolNetList}" varStatus="rowCounter">
				    	<a href="/school/controller/getHitSchoolReport?categoryid=${requestScope.categoryid}&schoolyear=${requestScope.schoolyear}&poaschoolnet=${poa['poaschoolnet']}"><font class="d3-color-${requestScope.poaschoolnet eq poa['poaschoolnet'] ? 'blue fontbold' : 'gray-1' }">${poa['poaschoolnet']}</font></a> |
                   	</c:forEach>
                   	</div>
                    <br class="clearboth"><br class="clearboth"><br class="clearboth">
					<div style="float:left;position:relative;">
					<table width="1120px" class="bordered-table zebra-striped" id="searchTable">
						<thead>
						<tr>

							<TH width="100" style="text-align:center"><font class="fontlarge" ><spring:message code="label.poaschoolnetshort"/></font></TH>
							<TH width="60"></th>
                            <TH width="550"><font class="fontlarge"><spring:message code="label.schoolname"/></font></TH>
							<TH width="100"><font class="fontlarge "><spring:message code="label.vacancy"/></font></TH>
							<TH width="100"><font class="fontlarge "><spring:message code="label.admitted"/></font></TH>
							<!--
							<TH width="80"><font class="fontlarge "><spring:message code="label.overcount"/></font></TH>
					        -->
					        <TH width="100"><font class="fontlarge "><spring:message code="label.overpercent"/></font></TH>
					        <TH width="80"><font class="fontlarge "><spring:message code="label.hit"/></font></TH>
					  </tr>
						</thead>
						<tbody>
       						<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
        					  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' } >
           						  	<td class="fontxxlarge" style="padding-top:20px;padding-left:15px;text-align:center">${school['poaschoolnet']}</td>
           						  	<td>
           						  	    <img style="width:45px;height:40px;float:left;margin: 8px 5px 0 5px;min-height:18px;" src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);"/>
                                    </td>
           					  		<td class="fontxlarge d3-color-black" style="line-height:18px;padding-top:15px;padding-bottom:10px;">
            					  			<a href="/school/controller/entityDetails?entityid=${school['entityid']}&action=compare">${school['name']}<br><font class=fontlarge">${school['nameeng']}</font></a>
           					  		</td>
                          							<td class="fontlarge" style="padding-top:20px;">${school['vacancy']}</td>
                        	  						<td class="fontlarge" style="padding-top:20px;">${school['admitted']}</td>
                        	  						<!--
                        	  						<td class="fontlarge" style="padding-top:20px;">${school['selfadmitted'] - school['selfvacancy'] }</td>
                        	  						-->
                        	  						<td class="fontlarge" style="padding-top:20px;">
                        	  						<c:choose>
                        	  						<c:when test="${school['selfadmitted'] > 0}">
                        	  						    <fmt:formatNumber value="${school['overpercent']}" maxFractionDigits="2"/>
                          	  						</c:when>
                          	  						<c:otherwise>
                          	  						   --
                          	  						</c:otherwise>
                          	  						</c:choose>
                                                    </td>
                          	  						<td class="fontlarge" style="padding-top:20px;">
                              	  						<c:choose>
                                   	  						<c:when test="${school['overpercent'] > 60}">
                                	  						            <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                	  						            <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                                                        <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                   	  						</c:when>
                                   	  						<c:when test="${school['overpercent'] > 50}">
                                	  						            <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                                                        <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                   	  						</c:when>
                                   	  						<c:when test="${school['overpercent'] >30 }">
                                	  						            <img src="/school/img/thumbup.png" style="width:20px;height:20px;top:-3px;position:relative">
                                                            </c:when>
                                  	  						<c:otherwise>
                                      	  						   --
                                   	  						</c:otherwise>
                              	  						</c:choose>
                          	  						</td>
                        	  				    </tr>
                        						</c:forEach>
  						</tbody>

					<tfoot>
						<tr>
							<TH width="40"><font class="fontlarge"><spring:message code="label.poaschoolnetshort"/></font></TH>
							<th width="60"></th>
                        	<TH width="400"><font class="fontlarge"><spring:message code="label.schoolname"/></font></TH>
							<TH width="80"><font class="fontlarge "><spring:message code="label.vacancy"/></font></TH>
							<TH width="100"><font class="fontlarge "><spring:message code="label.admitted"/></font></TH>
							<!--
							<TH width="60"><font class="fontlarge "><spring:message code="label.overcount"/></font></TH>
					        -->
					        <TH width="80"><font class="fontlarge "><spring:message code="label.overpercent"/></font></TH>
					        <TH width="60"><font class="fontlarge "><spring:message code="label.hit"/></font></TH>

						</tr>
					</tfoot>
					</table>
					</div>

					
					<br class="clearboth"><br class="clearboth">
<div style="border-bottom: 1px dashed grey;"></div>	
					<br class="clearboth">	



<jsp:include page="../common-footer.jsp"/>
