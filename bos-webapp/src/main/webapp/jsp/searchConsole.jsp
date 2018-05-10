<%@ include file="common-header.jsp" %>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>

<jsp:include page="menu.jsp"/>


<jsp:include page="ads/wideAds.jsp"/>
<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>	
<br><br class="clearboth">	



<c:set var="metric23">${requestScope.categoryid eq '0' ? '' : '{"iDataSort": 13},{"iDataSort": 14},'}</c:set>
<c:set var="lastyearmetric23">${requestScope.categoryid eq '0' ? '' : '{"bVisible": false},{"bVisible": false},'}</c:set>

<script type="text/javascript" charset="utf-8">
	
function visited(obj) {
	obj.style.color = "red";
	}

			/* Table initialisation */
			$(document).ready(function() {

				$('#searchTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ ${requestScope.categoryid eq '0' ? '7,8,10,11,12,13,14,16' : '9,10,12,13,14,15,16,17,18,20' }  ] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"aaSorting": [[${requestScope.categoryid eq '0' ? '14' : '18' },'asc']],  /* default sort by ranking */
					"aoColumns": [
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '14' : '18'}},   /* 0.  rank */
                                  {"bSortable": false},                                             /* 1.  image */
	                              {"bSortable": false},                                             /* 2.  name */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '10' : '12'}},    /* 3.  academic */
	                              ${metric23}                                                       /* 4,5. sport, music */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '11' : '15'}},   /* 6.  teacher */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '12' : '16'}},   /* 7.  campus */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '16' : '20'}},   /* 8.  rating this year */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '7' : '9'}},     /* 9.  rating total average*/
	                              {"bVisible": false},                                              /* 10.  +/- */
	                              {"iDataSort": ${requestScope.categoryid eq '0' ? '8' : '10'}},    /* 11. position +/- */
	                              {"bVisible": false},                                              /* 12. academic */
	                              ${lastyearmetric23}                                               /* 13.14 sport, music  */
	                              {"bVisible": false},                                              /* 15. teacher */
	                              {"bVisible": false},                                              /* 16. campus */
	                              {"bVisible": false},                                              /* 17. entityscore */
	                              {"bVisible": false},                                              /* 18. ranking */
	                              {"bSortable": false},                                             /* 19. school allocation button */
	                              {"bVisible": false}                                               /* 20. this year rating only */
	                              ],
					"bLengthChange": false,
					"iDisplayLength": 100,
					"bFilter": false,
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

function showLastYear(){
	  
	var value = '-1';
	if($('#lastyearrecordbox').prop('checked') == true)
		value = 'y';
	document.forms["schoolsearch"].lastyearrecord.value = value;
	document.forms["schoolsearch"].submit();
	
}

</script>

<form action="/school/controller/schoolSearch" method="post" name="schoolsearch" id="schoolsearch">
<input type="hidden" name="categoryid" id="categoryid" value="${sessionScope.searchCriteria['categoryid']}" />
<input type="hidden" name="financetype" id="financetype" value="${sessionScope.searchCriteria['financetype']}" />
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="${sessionScope.searchCriteria['poaschoolnet']}" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="${sessionScope.searchCriteria['categoryid']}" />
<input type="hidden" name="nominated" id="nominated" value="${sessionScope.searchCriteria['nominated']}" />
<input type="hidden" name=feeder id="feeder" value="${sessionScope.searchCriteria['feeder']}" />
<input type="hidden" name="throughtrain" id="throughtrain" value="${sessionScope.searchCriteria['throughtrain']}" />
<input type="hidden" name="reporttype" id="reporttype" value="${sessionScope.searchCriteria['reporttype']}" />
<input type="hidden" name="lastyearrecord" id="lastyearrecord" value="${sessionScope.searchCriteria['lastyearrecord']}" />


</form>
<c:set var="firstcategoryid" value="${requestScope.schoolList[0]['categoryid']}"/>
					<c:if test="${not empty requestScope.reporttype && requestScope.reporttype ne '-1'}">
					<h1><spring:message code="label.${requestScope.reporttype}"/>(TOP 100)</h1>

					<br>
					<font class="fontxlarge fontbold d3-color-orange"><spring:message code="label.updatecontent"/></font><br>
					<font class="fontlarge fontbold d3-color-orange"><spring:message code="label.lastmodified"/> <fmt:formatDate pattern="dd-MMM-yy" value="${requestScope.schoolList[0]['lastmodified']}" /></font></p>
    				<br>
					</c:if>
<!--
    				<br><font class="fontxlarge fontbold d3-color-orange"><spring:message code="label.updateing"/></font></p>
    				<br>
-->
					<p class="fontbold d3-color-gray" style="padding-top:5px;"><spring:message code="label.contribute${requestScope.categoryid ne 0 ?  '' : '.k' }"/></p>
					<p class="fontbold d3-color-gray" style="padding-top:5px;">?=<spring:message code="label.noinformationranking"/></p>
                    <br>

					<div style="float:right;right:20px;position:relative;top:-60px;"><img src="/school/img/barchart.png" style="width:30px;height:30px;position:relative;top:5px;" /><a class="fontbold" style=" font-size:25px !important;" href="/school/controller/getCMSDetails?id=2"><spring:message code="label.howtorank"/></a></div>
					
					
					<span style="position:relative;padding-bottom:10px;float:right;right:-70px;">
					<label class="fontmedium d3-color-gray" for="lastyearrecord"><spring:message code='label.showlastyearrecord'/>&nbsp;<input id="lastyearrecordbox" name="lastyearrecordbox" value="y" type="checkbox" onclick="showLastYear();" ${requestScope.lastyearrecord eq 'y' ? 'checked' : '' }> </label>
					</span>
					<div style="position:relative;float:right;padding-bottom:10px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>

					<br class="clear"><br class="clear">
					<c:set var="reportname">${requestScope.poaschoolnetdesc}</c:set>
                    <c:if test="${empty requestScope.poaschoolnetdesc }">
                    <c:set var="reportname"><spring:message code="label.hongkong"/></c:set>
                    </c:if>
					<div class="fontxlarge d3-color-gray">${reportname} <spring:message code="label.ranking"/></div>
					<br class="clear"><br class="clear">
					<table class="bordered-table zebra-striped" id="searchTable">
						<thead> 
						<tr>
						    <c:set var="hkranking">n</c:set>
						    <c:if test="${empty requestScope.poaschoolnetdesc }">
						        <c:set var="reportname"><spring:message code="label.hongkong"/></c:set>
						        <c:set var="hkranking">y</c:set>
                            </c:if>
						    <TH width="65" class="font2" style="text-align:center"><spring:message code="label.ranking"/></TH>
						    <th width="60"></th>
						    <TH width="360" class="fontmedium" ><spring:message code="label.schoolname"/></TH>
					     	
						    <TH width="65" class="font2"><spring:message code="label.academic"/><font class="fontsmall">${requestScope.categoryid ne '0' ? ' 40' : ' 60' }%</font></TH>
						    <c:if test="${requestScope.categoryid ne '0' }">
						    <TH width="65" class="font2"><spring:message code="label.sport"/><font class="fontsmall"> 15%</font></TH>
						    <TH width="65" class="font2"><spring:message code="label.music"/><font class="fontsmall"> 15%</font></TH>
						    </c:if>
						    <TH width="70" class="font2"><spring:message code="label.teacher"/><font class="fontsmall"> ${requestScope.categoryid ne '0' ? ' 15' : ' 20' }%</font></TH>
  						    <TH width="65" class="font2"><spring:message code="label.campus"/><font class="fontsmall"> ${requestScope.categoryid ne '0' ? ' 15' : ' 20' }%</font></TH>
						    <TH width="70" class="font2"><spring:message code="label.ratingshort"/><font class="fontsmall"><spring:message code="label.thisyear"/></font></TH>
						    <TH width="70" class="font2"><spring:message code="label.ratingshort"/><font class="fontsmall"><spring:message code="label.totalaverage"/></font></TH>
						    <TH>&nbsp;</TH>
						    <TH width="45" class="font2"><spring:message code="label.position"/></TH>

							<th>&nbsp;</th>
							<c:if test="${requestScope.categoryid ne '0' }">
								<th>&nbsp;</th><th>&nbsp;</th>
							</c:if>
							<th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>
							<c:choose>
							<c:when test="${(sessionScope.user['ROLEID'] == 1 || sessionScope.user['ROLEID'] == 4) && requestScope.categoryid ne 5 && requestScope.categoryid ne 2 }">
							
							<th>&nbsp;</th>
							</c:when>
							<c:otherwise><th width="1">&nbsp;</th></c:otherwise>
							</c:choose>
						</tr>
						</thead> 
						<tbody> 
						<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
						  	<tr class=${rowCounter.count % 2 > 0 ?  'odd' : 'even' } style="CURSOR: pointer; cursor: hand;" 
    						  	<c:if test="${(sessionScope.user['ROLEID'] ne 1 &&  sessionScope.user['ROLEID'] ne 4) && requestScope.categoryid ne 5  }">
	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=${school["entityid"]}&action=compare"}'
		    				  	</c:if>
						  	>  
					  		
                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">${hkranking eq 'y' ? school['ranking'] : school['rankingdistrict']} <font class="d3-color-gray-3" style="font-size:9px;">${school['lastyearranking']}</font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=${school["entityid"]}&action=compare"}'>
                                    <font class="fontbold">${school['name']}</font><font  class="fontlarge d3-color-black">${school['financetype']}</font><br><font  class="fontmedium">${school['nameeng']}</font>
                                    <br><font class="fontsmall">${poaschoolnetshortMap[school['poaschoolnet']]} &nbsp;&nbsp; ${requestScope.categoryid eq 0 ?  school['session'] : ''}</font>
                                </td>

	  							
	  							<td style="padding-top:15px;" class="fontxlarge">${school['currentyearmetric1']} <font class="fonttiny d3-color-gray-3">${school['lastyearmetric1']}</font> </td>
	  							<c:if test="${school['categoryid'] ne '0' }">
	  							<td style="padding-top:15px;" class="fontxlarge">${school['currentyearmetric2']} <font class="fonttiny d3-color-gray-3">${school['lastyearmetric2']}</font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">${school['currentyearmetric3']} <font class="fonttiny d3-color-gray-3">${school['lastyearmetric3']}</font></td>
	  							</c:if>
	  							<c:set var="currentyearscore">${ school['categoryid'] ne '0' ? 'currentyearscore2' : 'currentyearscore3' }</c:set>
	  							<c:set var="lastyearscore">${ school['categoryid'] ne '0' ? 'lastyearscore2' : 'lastyearscore3' }</c:set>

	  							<td style="padding-top:15px;" class="fontxlarge">${school['currentyearmetric5']} <font class="fonttiny d3-color-gray-3">${school['lastyearmetric5']}</font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">${school['currentyearmetric4']} <font class="fonttiny d3-color-gray-3">${school['lastyearmetric4']}</font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">${school[currentyearscore]} <font class="fonttiny d3-color-gray-3">${school[lastyearscore]}</font></td>
                                <td style="padding-top:15px;" class="fontxlarge">${school['entityscore']}</td>
                                <c:set var="position">${school['lastyearranking2'] - school['ranking']}</c:set>
                                <td style="padding-top:15px;" class="fontxlarge">${position}</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">
                                    <c:choose>
                                        <c:when test="${position gt 0}">
                                            <span class="rank-rise"></span>
                                        </c:when>
                                        <c:when test="${position lt 0}">
                                            <span class="rank-fall"></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="rank-equal"></span>
                                        </c:otherwise>
                                    </c:choose>
                                   <font class="fontxlarge" style="position:relative;top:-3px;">${position}</font>
                                </td>
								<td>${school['currentyearmetric1']}</td>
								<c:if test="${school['categoryid'] ne '0' }">
								    <td>${school['currentyearmetric2']}</td><td>${school['currentyearmetric3']}</td>
								</c:if>
								<td>${school['currentyearmetric5']}</td><td>${school['currentyearmetric4']}</td><td>${school['entityscore']}</td><td>${school['ranking']}</td>
								<c:choose>
									<c:when test="${(sessionScope.user['ROLEID'] == 1 ) && requestScope.categoryid ne 5 && requestScope.categoryid ne 2 }">
                                    <td>
                                    <c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 2) %></c:set>

                                    <a href="/school/controller/getSchoolAllocation?allocationyear=${requestScope.rankingyear}&edit=y&sacategoryid=${requestScope.categoryid}&entityid=${school['entityid']}&nocache=${rand}"  rel="#schoolallocation_overlay" style="text-decoration:none">
                                        <span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input onclick="visited(this)" name="schoolallocationsubmit" id="schoolallocationsubmit" class="submit" type="button"  value='<spring:message code="label.schoolallocation${requestScope.sacategoryid}"/>' /></span></span>
                                    </a>
                                    </td>
                                    </c:when>
		    						<c:otherwise>
										<td width="1px;"></td>
			    					</c:otherwise>
								</c:choose>
							<td>${school[currentyearscore]}</td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
	
					  
<br><br><br><br>


<br class="clear"/>


<jsp:include page="common-footer.jsp"/>


<!-- overlayed element -->
<div class="simple_overlay" id="schoolallocation_overlay" style="width:400px;">
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