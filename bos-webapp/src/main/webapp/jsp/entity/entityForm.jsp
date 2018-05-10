<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:catch var="exception">

<c:set var="mapkey1" value="${requestScope.entityVerticalCategoryList[0][1]['key']}0"/> <!-- full name -->
<c:set var="mapkey2" value="${requestScope.entityVerticalCategoryList[0][2]['key']}0"/> <!-- Address -->
<c:set var="mapkey17" value="${requestScope.entityVerticalCategoryList[0][17]['key']}0"/> <!-- sex -->

<c:set var="primarysport" value='<%="\u9AD4\u80B2"%>' />
<c:set var="ranking" value='<%="\u6392\u540D"%>' />		
<c:set var="nt" value='<%="\u65B0\u754C"%>' />		
<c:set var="division" value='<%="\u7D44\u5225"%>' />		
<c:set var="choirchi" value='<%="\u5408\u5531\u968A"%>' />
<c:set var="instrumentschi" value='<%="\u4E2D\u570B\u6A02\u5668"%>' />
<c:set var="male" value='<%="\u7537"%>' />		
<c:set var="female" value='<%="\u5973"%>' />
<c:set var="schoolplacementchi" value='<%="\u6D3E\u4F4D"%>' />

		

<c:choose>
	<c:when test="${sessionScope.user['roleid'] eq '1' || (sessionScope.user['roleid'] eq '4' && sessionScope.user['adminentity'] eq requestScope.entityid) }">
		<c:set var="submitform">javascript:{checkform(document.forms['entityform'])}</c:set> <!-- full name -->
	</c:when>
	<c:otherwise>
		<c:set var="submitform">alert('<spring:message code='label.applyschooledit'/>')</c:set> <!-- full name -->
	</c:otherwise>
</c:choose>
	
<form name="entityform" action="saveEntity" method="post">
	<input type="hidden" name="entityid" value="${requestScope.entityid}"/>
	<input type="hidden" name="year" value="${requestScope.year}"/>
	<input type="hidden" name="categoryid" value="${requestScope.categoryid}"/>

	<input type="hidden" name="action" value="compare"/>

	
	<div style="padding:40px 40px 60px 40px;">
<!--  START OF SCHOOL METRIC DIV -->
	<TABLE cellpadding="0" cellspacing="5px;" width="950px" >
	<tr><td colspan="2" align="center"><font class="fontxlarge">${requestScope.year}-${requestScope.entityVerticalCategoryList[0][1][mapkey1]}</font></td></tr>
	<tr><td colspan="2" align="center"><font class="fontmedium">${requestScope.entityVerticalCategoryList[0][2][mapkey2]}</font></td></tr>
	<tr align="right"><td colspan="2">
	<c:if test="${not (sessionScope.user['roleid'] eq '1' ||  (sessionScope.user['roleid'] eq '4' && sessionScope.user['adminentity'] eq requestScope.entityid)) }">
	<div style="float:left;position:relative;top:20px;" class="fontlarge d3-color-orange"><spring:message code="label.applyschooledit"/></div>
	</c:if>
	<div style="float:right;position:relative;top:5px;"><span class="button_grn"><span class="bg_grn gradient" onclick="${submitform}"><spring:message code="label.save"/></span></span></div>
	</td>
	</tr>
	<tbody>	
	<c:forEach var="compareCategory" begin="1" items="${requestScope.entityVerticalCategoryList}" varStatus="rowCounterCategory">
		<c:forEach var="compare" items="${compareCategory}" varStatus="rowCounter">
		<c:set var="mapkey" value="key"/> 
			
			<c:choose>
			<c:when  test="${rowCounter.count == 1}">
			<tr><td colspan="3" class="rowheadbg">
			
			<div style="padding-top:2px;padding-bottom:3px;">
				<font class="fontlarge d3-color-white fontbold">
				 <img src="../img/icBlock.png" class="bottom"><spring:message code='label.${requestScope.metricCategory[compare["key"]]}'/> : ${requestScope.scoreMap[compare["key"]]}<c:choose><c:when test="${not empty requestScope.scoreMap[compare['key']] && requestScope.scoreMap[compare['key']] ne '?'}"> <spring:message code="label.score"/></c:when><c:when test="${requestScope.scoreMap[compare['key']] eq '?' }"><font class="font1"> <spring:message code="label.noinformationranking"/></font></c:when></c:choose> 
				</font>
				<c:if  test="${rowCounterCategory.count == 2 && requestScope.categoryid eq '1' }">
						<a style="position:relative;float:right;left:-5px;top:2px;" id="sporthelp"><img style="width:13px;height:13px;" src="/school/img/help.jpg"/></a>
						<div class="tooltipsmall">
							<div class="fontlarge fontbold  d3-color-white"><spring:message code="label.howtofill"/></div><br>
							<img style="width:300px;height:70px;" src="/school/img/sportexampleprimary.jpg"/><br><br>
							<a class="white" href="http://www.hkssf-nt.org.hk/district/primary/12-13/Index/TY-index.htm" target="_blank" ><font class="fontlarge"><spring:message code="label.referencesport"/></font></a>
						</div>
				</c:if>
				<c:if  test="${rowCounterCategory.count == 2 && requestScope.categoryid eq '2' && fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt) }">
						<a style="position:relative;float:right;left:-5px;top:2px;" id="sporthelp"><img style="width:13px;height:13px;" src="/school/img/help.jpg"/></a>
						<div class="tooltipsmall">
							<div class="fontlarge fontbold  d3-color-white"><spring:message code="label.howtofill"/></div><br>
							<img style="width:300px;height:70px;" src="/school/img/sportexamplesecondarynt.jpg"/><br><br>
							<a class="white" href="http://www.hkssf-nt.org.hk/district/sec/06kt/result/20112012/result_b_1112.pdf" target="_blank" ><font class="fontlarge"><spring:message code="label.referencesportsecnt"/></font></a>
						</div>
				</c:if>
				<c:if  test="${rowCounterCategory.count == 2 && requestScope.categoryid eq '2' && not fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt) }">
						<a style="position:relative;float:right;left:-5px;top:2px;" id="sporthelp"><img style="width:13px;height:13px;" src="/school/img/help.jpg"/></a>
						<div class="tooltipsmall">
							<div class="fontlarge fontbold d3-color-white"><spring:message code="label.howtofill"/></div><br>
							<img style="width:300px;height:70px;" src="/school/img/sportexamplesecondaryhk.jpg`"/><br><br>
							<a class="white" href="http://www.hkssf-hk.org.hk/hk/sec/events/athletics/past%20results/1112_ath_final%20results_d1.pdf" target="_blank" ><font class="fontlarge"><spring:message code="label.referencesportsechk"/></font></a>
						</div>
				</c:if>
				<c:if  test="${rowCounterCategory.count == 3  && requestScope.categoryid ne '0'}">
						<a style="position:relative;float:right;left:-5px;top:2px;" id="musichelp"><img style="width:13px;height:13px;" src="/school/img/help.jpg"/></a>
						<div class="tooltipsmall">
							<div class="fontlarge fontbold  d3-color-white"><spring:message code="label.howtofill"/></div><br>
							<img style="width:300px;height:70px;" src="/school/img/musicexample.jpg"/><br><br>
							<a class="white" href="http://www.hksmsa.org.hk/download/winlist/64MWinner.pdf" target="_blank" ><font class="fontlarge"><spring:message code="label.referencemusic"/></font></a>
						</div>
				</c:if>
			</div>
			</td></tr>
			</c:when>
			
			<c:when test="${  requestScope.entityVerticalCategoryList[0][17][mapkey17]  eq male  &&  (fn:contains( compare['key'] , female)  )  }">
			
			</c:when>
			<c:when test="${   requestScope.entityVerticalCategoryList[0][17][mapkey17] eq female &&  (fn:contains( compare['key'] , male)  )  }">
			
			</c:when>
			
			<c:when test="${   fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  &&  (fn:contains( compare['key'] , division)  )  }">
			
			</c:when>
			<c:when test="${  not fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  &&  (fn:contains( compare['key'] , nt)  )  }">
			
			</c:when>
			<c:when test="${ fn:contains(compare['key'] , 'division') || fn:contains( compare['key'], 'Choir') || fn:contains( compare['key'], 'Musical Instruments') || fn:contains( compare['key'], choirchi) || fn:contains( compare['key'], instrumentschi)  }">
			
			</c:when>
			<c:when test="${ fn:contains(compare['key'] , schoolplacementchi)}" >


				<tr class=rowbg${rowCounter.count % 2}>
					<td valign="top" colspan="3" nowrap  >
					<div class="entitycategoryfield fontxlarge"><img src="../img/itemlist.png"> ${compare["key"]} :</div><br>

					<div class="schoolplacement" style="position:relative;left:10px;padding-right:20px;">

					<c:set var="schoolallocationreference"><spring:message code="label.schoolplacememtreference"/></c:set>
               		<div><b><spring:message code="label.source"/></b> :
                        <input type="text" name="reference" value="${not empty requestScope.schoolAllocationReference ? requestScope.schoolAllocationReference : schoolallocationreference}" />
       			    </div><br>

					<c:forEach var="primary" items="${ requestScope.categoryid eq '1' ? secondarySchoolList  : primarySchoolList }" varStatus="rowCounter">
							<div class="fontlarge d3-color-gray-1 rowbg${rowCounter.count % 2}">
							${ primary['description']}
							<c:set var="entityidto">${primary['value']}</c:set>
				            <input style="width:30px;height:8px;float:right;position:relative;font-size: 1.0em;line-height:100%;" type="text" name="entityid-${primary['value']}" value="${requestScope.schoolAllocation[entityidto]}"/>
				            </div>
				            <div class="clear"></div>
				 	 </c:forEach>
					</div>
					<br class="clear"/>
					</td>
				</tr>

			</c:when>
			<c:otherwise>
				<c:set var="morelessnamekey1" value='<%="\u5B78\u6821\u8A2D\u65BD"%>'/>  <!--  school favilities secondary -->
				<c:set var="morelessnamekey2" value='<%="\u7279\u5225\u5BA4"%>'/>   <!-- special room  for primary school  -->
				<c:set var="morelessnamekey3" value='<%="\u5176\u4ED6"%>'/>   <!-- other for kindergarten  -->
				<tr class=rowbg${rowCounter.count % 2}>
					<td valign="top" nowrap  >
					<div class="fontxlarge" style="padding-left:10px;"><img src="../img/itemlist.png"> ${compare["key"]} :</div></td>
			        
			        <c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">
			 		<c:set var="mapkey" value="${compare['key']}${colunmCounter.count-1}"/>
			  		<td  colspan="2" valign="top" align="right" ${fn:length(compare[mapkey]) < 10 ? 'nowrap' : '' }>	
						<c:choose>					
						<c:when test="${fn:contains( mapkey, morelessnamekey1) || fn:contains( mapkey, morelessnamekey2) || fn:contains( compare['key'], morelessnamekey3) }">
							<textarea style="width:550px;height:90px;" type="text" name="${compare['fieldname']}" >${compare[mapkey]}</textarea>
						</c:when>
						<c:when test="${fn:contains( mapkey, ranking) }">
							<c:set var="mapkeydiv" value="${compare['fieldname']}division${colunmCounter.count-1}"/>
							<select id="${compare['fieldname']}div" name="${compare['fieldname']}div"  style="width: 25em;">
								<option value=""><spring:message code="label.pleaseselectdivision"/></option>
  								<option value="1" <c:if test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '1'}">selected</c:if> >Division One</option>
  								<option value="2" <c:if test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '2'}">selected</c:if> >Division Two</option>
  								<option value="3" <c:if test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '3'}">selected</c:if> >Division Three</option>
							 </select>
							 <input style="padding-left:5px;width:222px;height:10px;" type="text" name="${compare['fieldname']}" value="${compare[mapkey]}"/>
							
						</c:when>
						
						<c:otherwise>
							<input style="width:550px;height:10px;" type="text" name="${compare['fieldname']}" value="${compare[mapkey]}"/>
							
						</c:otherwise>
						</c:choose>	
					
					</td>
									
					</c:forEach>
				</tr>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:forEach>
	</tbody>
	<tr align="right" ><td style="border-bottom: 1px solid #FFF;">&nbsp;</td>
	<td>
	<div style="float:right;position:relative;top:5px;">
	<span class="button_grn"><span class="bg_grn gradient" onclick="${submitform}"><spring:message code="label.save"/></span></span>
	</div>
	</td>
	</tr>
	</table>
	
	
	<!--  END OF SCHOOL METRIC DIV -->
	</div>
	
<script  type="text/javascript">

$(document).ready(function() {
	$("#sporthelp").tooltip({ 
		effect: 'slide',
		position: 'bottom center',
		offset: [-2, 10],
	    relative: true
	});
	$("#musichelp").tooltip({ 
		effect: 'slide',
		position: 'bottom center',
		offset: [-2, 10],
	    relative: true
	});
});

function checkform (form)
{
	
	
	
	
 	
 	
 	form.submit();
  	// ** END **
}

</script>
</form>
</c:catch>
	<c:if test="${not empty exception }">
		<div class="fontxlarge d3-color-red">${exception.message}</div>
	</c:if>
