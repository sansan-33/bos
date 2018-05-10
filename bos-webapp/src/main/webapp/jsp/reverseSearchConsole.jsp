<%@ include file="common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>
<jsp:include page="menu.jsp"/>

<script type="text/javascript" src="/school/js/jquery.corner.js"></script>

 
<script type="text/javascript">

$('div.reversesearchmain').corner();
$('div.reversesearchcomment').corner();


</script>

<c:set var="statkey">reverseSearch-1</c:set>
<div class="reversesearchmain">
<font class="fontxxxlarge" style="color:#C6BFB4"><spring:message code="label.reversesearch"/></font>
					<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
                    	<g:plusone size="medium"></g:plusone>
                    	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
                    	<div style="margin-right:5px;margin-left:5px;top:4px;position:relative;float:right" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></div>
                    </div>
<br><br><br class="clearboth">


<div style="border-bottom: 1px dashed grey;"></div>
<div class="fontlarge d3-color-gray-1" style="padding:15px 20px;"><spring:message code="label.reversesearchdesc"/></div>


<div class="reversesearchcomment">
	<font class="font4s" style="color: white"><spring:message code="label.reversesearchanalytics" arguments="${requestScope.total},${requestScope.schoolcategory},${requestScope.schoolname},${requestScope.schoolcategory},${requestScope.alocatedschoolnames}" /></font>
	<br><br>
</div>
    <div class="border-bottom-gray">&nbsp;</div>
<br>

    <div style="padding-left:15px;padding-right:25px">


        <div style="float:left" >
        		    <img style="padding-right:15px;" src="/school/staticimage/CAT${requestScope.school['categoryid']}/logo_${requestScope.school['chscid']}.jpg" alt="No Image" width="60px" height="60px"/>
        		</div>
        		<div style="float:left;padding-left:10px;">
                    <span class="fontxxlarge fontbold" style="color:#000">${requestScope.school['name']}</span><br>
                    <span class="fontxlarge">${requestScope.school['nameeng']}</span>
                    <br>
                    <div class="fontsmall" style="padding-top:5px;">
                    <spring:message code="label.hongkong"/><spring:message code="label.ranking"/>: <b>${requestScope.school['ranking']}</b> |
                    ${requestScope.school['financetype']}<spring:message code="label.ranking"/>: <b>${requestScope.school['rankingfinancetype']}</b> |
                    <spring:message code="label.poaschoolnetshort"/> ${requestScope.school['poaschoolnet']}<spring:message code="label.ranking"/>: <b>${requestScope.school['rankingdistrict']}</b>
                    </div>
                    <div class="fontsmall" style="padding-top:5px;"><spring:message code="label.schoolrating"/>: <b>${requestScope.school['score']}</b></div><br>
                </div>
	</div>
	<br><br><br><br><br>
	<div class="border-bottom-gray">&nbsp;</div>
	<br><br>
	<div>
	<jsp:include page="/controller/pieChart"/>
	</div>
    <br class="clear">
	<br class="clear">

    <div style="float:right;padding-bottom:15px;padding-right:20px;">
                        <span style="padding-right:10px;" class="fontlarge fontbold"><spring:message code="label.year"/> : </span>
                        <a href="#" onclick='submitform("-1","${requestScope.reverseentityid}")'><font class="d3-color-${requestScope.allocationyear eq '-1' ? 'blue fontbold' : 'gray-1' }"><spring:message code="label.allthetime"/></font></a> |
                        <c:forEach var="i" begin="2011" end="${requestScope.rankingyear}">
            		    <a href="#" onclick='submitform("${i}","${requestScope.reverseentityid}")'><font class="d3-color-${requestScope.allocationyear eq i ? 'blue fontbold' : 'gray-1' }">${i}</font></a> |
                        </c:forEach>
    <div class="border-bottom-gray">&nbsp;</div>
    </div>
	<div style="width:600px;height:600px;overflow-x:hidden;" >

	<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
		
	<img style="float:left;padding-right:15px;padding-bottom:3px;" src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);" width="50px" height="40px"/>
		
	<font style="float: right; padding-right: 4px;" class="d3-color-gray-3"><spring:message code="label.schoolrating"/> : <font class="d3-color-gray-1 fontbold">${school['score']}</font></font>
	<a href="/school/controller/entityDetails?entityid=${school['entityid']}&action=compare">
	<font class="d3-color-gray-2" >${school['name']}</font></a><br>
	<font class="font1 d3-color-gray-3" >${school['nameeng']}</font></a><br>
	<c:choose>
	<c:when test="${school['throughtrain'] eq 'Y'}">
		<font class="fontbold font2" style="color:#000"><img src="../img/icBlock.png" class="bottom"><spring:message code="label.throughtrain"/></font>
	</c:when>
	<c:when test="${school['nominated'] eq 'Y'}">
		<font class="fontbold font2" style="color:#000"><img src="../img/icBlock.png" class="bottom"><spring:message code="label.nominated"/></font>
	</c:when>
	<c:when test="${school['feeder'] eq 'Y'}">
		<font class="fontbold font2" style="color:#000"><img src="../img/icBlock.png" class="bottom"><spring:message code="label.feeder"/></font>
	</c:when>
	<c:otherwise>
	<font class="font2"><spring:message code="label.noofstudent"/> : ${school['schoolallocation']}</font>
	<font class="font1"><spring:message code="label.year"/> : ${school['allocationyear']}</font>
	</c:otherwise>
	</c:choose>
	<div class="line-type2-flat clear" style="padding-top:5px;"></div>
	</c:forEach>

	<c:if test="${empty requestScope.schoolList}"><div class="fontxlarge" style="padding:30px;"><spring:message code="label.noinformation"/> ... </div></c:if>
	</div>
<div style="clear:both" />

</div>


       
<jsp:include page="common-footer.jsp"/>

<form action="/school/controller/schoolReverseSearch" method="post" name="reverseSearchConsole" id="reverseSearchConsole" >
<input type="hidden" id="reverseSearchConsoleid" name="reverseentityid"  />
<input type="hidden" id="allocationyear" name="allocationyear"  />
</form>


<script>
function submitform (year,id)
{
    $("#reverseSearchConsoleid").val(id);
    $("#allocationyear").val(year);
    $('#reverseSearchConsole').submit();

}
</script>