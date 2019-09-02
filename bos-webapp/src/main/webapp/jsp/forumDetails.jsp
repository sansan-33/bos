<%@ include file="common-header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script src="/school/js/jquery-te-1.4.0.min.js"></script>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/jquery-te.css'>

<jsp:include page="menu.jsp"/>

<script language="JavaScript" type="text/javascript">
function checkform ()
{
    $('#questionanswer').val($('#editorcomment').val());
    if (document.forms["savequestionanswer"].questionanswer.value == "") {
	    alert( "<spring:message code='alert.content'/>" );
        document.forms["savequestionanswer"].editorcomment.focus();
        return false ;
    }
    document.forms["savequestionanswer"].submit();
}
</script>


<form action="saveQuestionAnswer" method="post" name="savequestionanswer" id="savequestionanswer" >
<input type="hidden" name="entityid" value="${requestScope.questionAnswerList[0]['entityid']}" />
<input type="hidden" name="questionanswer" id='questionanswer' value="${requestScope.questionanswer[0]['QUESTIONANSWER']}" />

<input type="hidden" name="type" value="q" />
<input type="hidden" name="categoryid" value="${requestScope.categoryid eq 'all' ? '0' : requestScope.categoryid }" />
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="${requestScope.maincategoryname}" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="getForumContent" />

<input type="hidden" name="subject" value="${requestScope.questionAnswerList[0]['SUBJECT']}" />

<input type="hidden" name="parentid" value="${requestScope.questionAnswerList[0]['id']}" />
<div style="height:auto;padding:10px;">

<jsp:include page="ads/wideAds.jsp"/>

<div style="border-bottom: 1px dashed grey;"></div>
<br class="clearboth">
<table style="width:1080px;"><tr>
<td valign="top" >
<div style="float:left;width:50px;padding-right:10px;" class="font2" >
		<a href="/school/controller/viewProfile?userid=${requestScope.questionAnswerList[0]['userid']}">
		<img style="" id="thumb" width="50px" height="50px;" src="/school/userimages/${requestScope.questionAnswerList[0]['userprofile']}" onerror="UserImgError(this);" /><br>
		</a>
		<c:choose>
		<c:when test="${requestScope.questionAnswerList[0]['anonymous'] eq 'y' or empty requestScope.questionAnswerList[0]['username'] }">
		<p style="text-align:center;font-size:0.80em;"><spring:message code="label.anonymous"/></p>
		</c:when>
		<c:otherwise>
		<p style="text-align:center;">
	 		${requestScope.questionAnswerList[0]['username']}
			<br><font class="font1" style="padding-top:3px;"><spring:message code="label.userscore"/> : ${requestScope.questionAnswerList[0]['userscore']}</font><br>
			<font class="font1" style="padding-top:3px;"><spring:message code="label.parentrating"/> : ${requestScope.questionAnswerList[0]['parentratingcount']}</font><br>
		</p>
		</c:otherwise>
		</c:choose>
</div>
<div style="float:left;border: 1px dashed white;width:800px;padding:10px 10px 30px 10px;background-color:rgb(233,233,233);" >
<p class="msg-title">${requestScope.questionAnswerList[0]['SUBJECT']}
			<c:if  test="${sessionScope.user['roleid'] eq 1 }">
 				<a class="comment" href="#" onclick="javascript:hideQA(${requestScope.questionAnswerList[0]['id']});"><img src="/school/img/closegreen.png"/></a>
 			</c:if>
 			</p>
    <div class="clearboth"></div>
    <div class="line-type2-flat"></div>
	<div style="float:right;width:8px;">&nbsp;</div>
    <div style="position:relative;float:left">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
	<c:set var="statkey">forum-${questionAnswerList[0]['qaid']}</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>${objectStatMap[statkey].hitcounter}</font>
	</div>
    <div style="float:right;padding-left:30px;padding-top:5px;">
	<a href="/school/controller/entityDetails?entityid=${requestScope.questionAnswerList[0]['entityid']}&action=compare">
 		<font style="font-size:0.75em;">${requestScope.questionAnswerList[0]['name']} ${requestScope.questionAnswerList[0]['nameeng']}</font>
	</a>
	</div>
    <br class="clearboth"/>
	<div class="line-type2-flat"></div>
    <br class="clearboth"/>

<div class="fontxlarge" style="padding:20px;">${requestScope.questionAnswerList[0]['QUESTIONANSWER']}</div>
<p class="font1b" style="float:right;">
<c:choose>
<c:when test="${requestScope.questionAnswerList[0]['timediffday'] > 0 }">
 ${requestScope.questionAnswerList[0]['timediffday']} <spring:message code="label.dayago"/>
</c:when>
<c:when test="${requestScope.questionAnswerList[0]['timediffhour'] > 0 }">
 ${requestScope.questionAnswerList[0]['timediffhour']} <spring:message code="label.hourago"/>
</c:when>
<c:when test="${requestScope.questionAnswerList[0]['timediffmin'] > 0 }">
 ${requestScope.questionAnswerList[0]['timediffmin']} <spring:message code="label.minago"/>
</c:when>
<c:otherwise>
 ${requestScope.questionAnswerList[0]['timediffsec']} <spring:message code="label.secago"/>
</c:otherwise>
</c:choose>
</p>
</div>
</div>
<br class="clearboth">

<c:forEach var="i" begin="1" end="5" step="1" varStatus="rowCounter">
	<c:set var="tagkey" value="tag${i}"/>
	<c:if test="${not empty questionAnswer[tagkey]}">
	<div class="rowtag">${questionAnswer[tagkey]}</div>
	</c:if>
</c:forEach>

<br class="clearboth">

<p class="msg-title">${fn:length(requestScope.questionAnswerList) - (1)} <spring:message code="forum.reply"/></p>

<br>
<c:forEach var="questionAnswer" begin="1"  items="${requestScope.questionAnswerList}" varStatus="rowCounter">
<br class="clearboth">

<div style="float:left;width:50px;padding-right:10px;" class="font2" >
		<a href="/school/controller/viewProfile?userid=${questionAnswer['userid']}">
		<img style="padding-right:0px;" src="/school/userimages/${questionAnswer['userprofile']}"  onerror="UserImgError(this);"  width="50px" height="50px"/><br>
		</a>
		<c:choose>
			<c:when test="${questionAnswer['anonymous'] eq 'y' or empty questionAnswer['username'] }">
				<p style="text-align:center;font-size:0.80em;"><spring:message code="label.anonymous"/></p>
			</c:when>
			<c:otherwise>
				<p style="text-align:center;">
	 			${questionAnswer['username']}
				<br><font class="font1" style="padding-top:3px;"><spring:message code="label.userscore"/> : ${questionAnswer['userscore']}</font><br>
				<font class="font1" style="padding-top:3px;"><spring:message code="label.parentrating"/> : ${questionAnswer['parentratingcount']}</font><br>
				</p>
			</c:otherwise>
		</c:choose>
</div>
<div style="float:left;border: 1px dashed white;width:800px;padding:10px 10px 30px 10px;background-color:rgb(241,241,241);"><p class="fontxlarge"  style="padding:20px;">${questionAnswer['questionanswer']}</p>

<br>


<br><br>
<span style="float:right" class="font1b">
<c:choose>
<c:when test="${questionAnswer['timediffday'] > 0 }">
 ${questionAnswer['timediffday']} <spring:message code="label.dayago"/>
</c:when>
<c:when test="${questionAnswer['timediffhour'] > 0 }">
 ${questionAnswer['timediffhour']} <spring:message code="label.hourago"/>
</c:when>
<c:when test="${questionAnswer['timediffmin'] > 0 }">
 ${questionAnswer['timediffmin']} <spring:message code="label.minago"/>
</c:when>
<c:otherwise>
 ${questionAnswer['timediffsec']} <spring:message code="label.secago"/>
</c:otherwise>
</c:choose>
</span><br>
<p class="font2" style="float:right"><spring:message code="label.doyoulikethis"/> &nbsp; <a href="#" onclick='javascript:{ window.location="/school/controller/likeQuestionAnswer?id=${questionAnswer["id"]}&parentid=${questionAnswer["parentid"]}&type=${requestScope.type}&categoryid=${requestScope.categoryid}&maincategoryname=${requestScope.maincategoryname}&maincategoryuri=getForumContent" }'><img src="/school/img/thumbup.png"/></a> ${questionAnswer['USERLIKE']}</p>

</div> <!--  questionanswer box -->

<br><br>
</c:forEach>
<br class="clearboth">
<p style="height:30px">&nbsp;</p>

	 		<table style="width:800px;">
			<tr><td colspan="2"><p style="padding-left:65px;float:left;" class="msg-title"><spring:message code="label.youranswer"/></p></td>
			</tr>
	 		<tr>
	 			<TD colspan="2">
	 			<div style="padding-left:65px;float:left;width:100%">
	         	<textarea id="editorcomment" class="editor">
	         	</textarea>
	         	</div>
	         	</TD>
			</TR>
			<tr><td colspan="2">
				<br>
				<c:set var="signupalert">alert("<spring:message code='label.pleaselogin'/>")</c:set>
				<span style="float:right;" class="button_grn"><span class="bg_grn gradient" onclick='${not empty sessionScope.user ? "checkform();" : signupalert }'><spring:message code="label.submit"/></span></span>
				</td>
			</tr>
			</table>
</FORM>
</td>
<td>
<jsp:include page="ads/verticalAds.jsp"/>
</td>
</tr>
</table>
<br class="clearboth"><br class="clearboth">
<div style="border-bottom: 1px dashed grey;"></div>





<form action="/school/controller/getForumContentList" method="post" name="forummenu" id="forummenu">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>

<jsp:include page="common-footer.jsp"/>

<script type="text/javascript">

$("textarea").jqte({
    change: function(){
        $('#questionanswer').val($('#editorcomment').val());
        console.log($('#questionanswer').val());
        console.log($('#editorcomment').val());
    }
   });

function getForumContent(id, categoryid,type,maincategoryname,maincategoryuri){

	document.forms["forummenu"].id.value = id;
	document.forms["forummenu"].categoryid.value = categoryid;
	document.forms["forummenu"].type.value = type;
	document.forms["forummenu"].maincategoryname.value = maincategoryname;
	document.forms["forummenu"].maincategoryuri.value = maincategoryuri;

	document.forms["forummenu"].submit();
}
</script>

