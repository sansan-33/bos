<%@ include file="../common-header.jsp" %>

<jsp:include page="../menu.jsp"/>

<jsp:include page="../ads/wideAds.jsp"/>
<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br><br class="clearboth">


<form action="/school/controller/schoolSearch" method="post" name="school" id=school">
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="-1" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="0" />
<input type="hidden" name="financetype" id="financetype" value="-1" />
<input type="hidden" name="districtschoolbreadcrumb" id="districtschoolbreadcrumb" value="-1" />
<input type="hidden" name="poaschoolnets" id="poaschoolnets" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="0" />
<input type="hidden" name="nursery" id="nursery" value="-1" />
<input type="hidden" name="feeder" id="feeder" value="-1" />
<input type="hidden" name="nominated" id="nominated" value="-1" />
<input type="hidden" name="throughtrain" id="throughtrain" value="-1" />
</form>

<div style="margin-left:30px;padding-top:10px;padding-bottom:20px;">
<a class="fontbold" style=" font-size:25px !important;" href="/school/controller/schoolSearch?reporttype=kindergartenranking&schoolcategory=0"><spring:message code="label.kindergartenranking"/> TOP 100</a>
 <div class="divider-small"></div>
</div>

<br>

	<div style="margin-left:30px;">
    <div><div class="fontbold d3-color-black fontxxlarge"><spring:message code="label.financetype"/></div></div><br>
	<div  class="thumbnail nurserytag" onclick="javascript:getSchoolListByNursery('<spring:message code="label.nursery"/>')" >
  		<span style="padding:10px;">
			<font style="font-size:1.7em; font-weight:bold;color:black;"><spring:message code="label.nursery"/></font>
			<font style="font-size:1.0em; font-weight:normal;color:black;">(456 <spring:message code="label.totalschool"/>)</font>
		</span>
	</div>
	<c:forEach var="fschool" items="${requestScope.financetypeSchoolList}" varStatus="rowCounter">
	<div  class="thumbnail financetypetag" onclick="javascript:getSchoolListByFinanceType('${fschool['financetype']}')" >
  		<span  style="padding:10px">
			<font style="font-size:1.7em; font-weight:bold;color:black;">${fschool['financetype']}</font>
			<font style="font-size:1.0em; weight:normal;color:black;">(${fschool['noofschool']} <spring:message code="label.totalschool"/>)</font>
		</span>
	</div>
	</c:forEach>
  	</div>

  	<div style="margin-top:50px;margin-left:30px;">
    <br class="clearboth">
     <div class="divider-small"></div>
	<div><div class="fontbold d3-color-black fontxxlarge"><spring:message code="label.district"/></div></div><br>
	<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
	    <div class="thumbnailnohand schoolcounter">
        <br><img src="../img/${school['imgpath']}.png" alt="" width="70px" height="70px"><br><br>
		<c:set var="district">${school['district']}</c:set>
		<div style="margin:5px;border-bottom: 1px solid #E5E5E5;"></div><a href="#" onclick="javascript:getSchoolList('${school['poaschoolnet']}','${school['district']}')" class="fontextralarge d3-color-blue">${ pageContext.response.locale eq 'en' ? school['tooltips'] : school['district'] } (<spring:message code="label.total"/> ${school['noofschool']} <spring:message code="label.totalschool"/>)</a>
		<div style="margin:5px;border-bottom: 1px solid #E5E5E5;"></div><font class="fontxlarge d3-color-black"><spring:message code="label.topschool"/> (${requestScope.topnmap[district].get(1)} <spring:message code="label.totalschool"/>)</font>
		<div style="margin:5px;border-bottom: 1px solid #E5E5E5;"></div><br class="clearboth"><br class="clearboth"><div style="left:0px;position:relative;line-height:1.5; text-align:center !important;"><font class="fontxlarge d3-color-gray-1">${requestScope.topnmap[district].get(0)}</font></div>

		</div>
		<c:if test="${rowCounter.count % 4 == 0}">
		<br class="clearboth">
		</c:if>
  	</c:forEach>
  	</div>



<jsp:include page="../common-footer.jsp"/>