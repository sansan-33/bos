<%@ include file="../common-header.jsp" %>
<jsp:include page="../menu.jsp"/>

<script type="text/javascript" src="/school/js/jquery.corner.js"></script>

<script  type="text/javascript">
$(document).ready(function() {
	
 $('#showhidetarget').hide();
$('#hidetrigger').hide();

$('a#showtrigger').click(function() {
    $('#showhidetarget').show();
    $('#showtrigger').hide(); // hide the show button
    $('#hidetrigger').show(); // show the hide button
  });
  $('a#hidetrigger').click(function() {
    $('#showhidetarget').hide();
    $('#hidetrigger').hide(); // hide the hide button
    $('#showtrigger').show(); // show the show button
  });
});
</script>
<script type="text/javascript">

$('div.myfavoritesmain').corner();
$('div.myfavoritescontent').corner();

</script>

<jsp:include page="accountMenu.jsp"/>

<c:set var="gov"><%="\u5B98\u7ACB"%></c:set>
<form name="favorite" action="" method="post"/>
<div class="myfavoritesmain">
<font class="font5" style="color:#C6BFB4"><spring:message code="label.favorite"/></font>
<jsp:include page="/controller/getTimeline?categoryid=${requestScope.categoryid}"/>
 <span style="position:relative;float:right;padding-bottom:10px;"><font class="font2" style="padding-right:5px"><spring:message code="label.schoolcompare"/></font><a  href="/school/controller/schoolCompare?entityids=${requestScope.entityids}"><img src="../img/expand.png"/></a><br></span>

 
	<table width="600px" class="bordered-table zebra-striped" id="caseTable">
						<thead> 
						<tr>
							<th width="40" class="font1"><spring:message code="label.reminder.yourorder"/></th>
							<TH width="310" class="font1"><spring:message code="label.schoolname"/></TH>
					        <TH width="70" class="font1"><spring:message code="label.estimatedenrollment"/></TH>
					        <TH width="60" class="font1"><spring:message code="label.reminder.interview"/></TH>
					        <TH width="20" class="font1"></TH>
						</tr>
						</thead> 
						<tbody> 
		<c:forEach var="school" items="${requestScope.myFavoriteSchoolList}" varStatus="rowCounter">
		<tr>
			<td class="font1 d3-color-gray-2">${school['grade']}</td>
			<td>
			<c:set var="idtostring">${school['entityid']}</c:set>
			<div style="float:left;margin-bottom:40px;margin-right:10px"" >
				<img src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);"  width="45px" height="35px"/>
			</div>
			
			
			<a style='float:right' href="/school/controller/reminderConsole?entityid=${idtostring}&categoryid=${school['categoryid']}&nocache=<%=new java.util.Date().getTime()%>" rel='#overlay_reminder'> 
				<img style="width:18px;height:18px;" src="/school/img/reminder.png"/>
			</a> 
			  	
			<a href="/school/controller/entityDetails?entityid=${school['entityid']}&action=compare">
			<font class="d3-color-gray-1" style="font-weight : bolder;font-size : 13px;">${school['name']}</font><br>
			<font class="font1" style="line-height: 250%;color: rgb(125,117,108);">${school['nameeng']}</font></a><br>
			<font class="font1"><spring:message code="label.hongkong"/><spring:message code="label.ranking"/>${school['ranking']}</font>
			<font class="font1">${school['financetype']}<spring:message code="label.ranking"/>${school['rankingfinancetype']}</font>
			<font class="font1">${school['poaschoolnet']}<spring:message code="label.ranking"/>${school['rankingdistrict']}</font><br>
            <font class="font1"><spring:message code="label.schoolrating"/> : ${school['score']}</font>
		   </td>	
		   <td>
  			<a href="/school/controller/favoriteUserListOverlay?entityid=${school['entityid']}" rel="#schoolevent_overlay" style="text-decoration:none">
			<div style="position:relative;">
			<div class="enroll"><div>${requestScope.favoriteCount[idtostring]}</div>
			</div>
			</div>
			</a>
			</td>		
			<td class="font1 d3-color-gray-2">${school['interview']}</td>
			<td>
				<a style="float:right;" href='#' onclick="javascript:ajaxRequest('saveFavorite/${idtostring}/${sessionScope.user.id}/dislike/1');showMessage('<spring:message code='label.favoriteschoolremoved'/>');" class="closeschool button"></a>
		
			</td>
			</tr>
		</c:forEach>
		</tbody>
</table>
	
	
<div style="clear:both" />

</div>
</form>


       
<jsp:include page="../common-footer.jsp"/>



<!-- overlayed element -->
<div class="simple_overlay" id="schoolevent_overlay" style="width:220px;">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
</div>

<div class="apple_overlay_reminder" id="overlay_reminder">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>