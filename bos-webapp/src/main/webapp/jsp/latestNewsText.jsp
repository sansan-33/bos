<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="news"><spring:message code="label.newspaper"/></c:set>
		<c:choose>
		<c:when test="${fn:length(requestScope.latestnews) > 0}">		
		<c:forEach var="questionAnswer" items="${requestScope.latestnews}" varStatus="rowCounter">
						<div ${rowCounter.count % 2 eq 1 ? 'style="background-color:#EFEFEF;padding-left:10px;"' : 'style="padding-left:10px;"' }>
						<div class="commondiv" style="padding:5px" onclick="getForumContent('${questionAnswer['id']}','${requestScope.categoryid}','q','${maincategoryname}','getForumContent')">
							<c:choose>
					  		<c:when test="${requestScope.categoryid.toString() eq '0' }"><c:set var="maincategoryname">label.kindergarten</c:set></c:when>
					  		<c:when test="${requestScope.categoryid.toString() eq '1' }"><c:set var="maincategoryname">label.primary</c:set></c:when>
					  		<c:otherwise><c:set var="maincategoryname">label.secondary</c:set></c:otherwise>
					  		</c:choose>
                            <img style="width:15px;height:15px;float:left;margin: 0 5px 0 5px;min-height:18px;" src="/school/staticimage/CAT${questionAnswer['categoryid']}/logo_${questionAnswer['chscid']}.jpg" onerror="ImgError(this);"/>
                            <!--
							<img style="float: left;margin-top:9px;" src="/school/img/greendot.png" />
							<c:forEach var="i" begin="1" end="1" step="1" varStatus="rowCounter">
  								<c:set var="tagkey" value="tag${i}"/>
								<span  class="rowtagtiny"  style="top:-3px;position:relative;float:left;width:50px;height:16px;margin-top:3px;margin-bottom:3px;margin-right:2px;margin-left:2px;" onclick="getForumContent('${questionAnswer['id']}','${requestScope.categoryid}','q','${maincategoryname}','getForumContent')" ><font class="msg-details">
									<c:choose>
									<c:when test="${questionAnswer[tagkey] eq 'newspaper' }">
										${news}
									</c:when>
									<c:otherwise>
										${ fn:length(questionAnswer[tagkey]) > 6 ? fn:substring(questionAnswer[tagkey], 0, 6) : questionAnswer[tagkey]}${fn:length(questionAnswer[tagkey]) > 6 ? '...' : ''}
									</c:otherwise>
									</c:choose>
								</font></span>
							</c:forEach>
                            -->

                            <a href="#" style="padding-left:10px;">
                            <c:set var="CHILD_ANSWER_LEN">${fn:contains(header['user-agent'],'Mobile') ? "15" : "25" }</c:set>
					  		<font class="fontxlarge d3-color-black" style="line-height:1.5em;">${fn:substring(questionAnswer['subject'],6,25)} ... <font class="d3-color-gray-3">${fn:substring(fn:replace(questionAnswer['childanswer'],'<br />',''),0,CHILD_ANSWER_LEN)} ...  </font></font>
							</a>
							<div style="float:right;">
					  		<div class="msg-details">
							<c:choose>
                                <c:when test="${questionAnswer['timediffday'] > 0}">
                                 <div style="top:-2px;position:relative;padding-left:5px;min-width:40px;float:right">${questionAnswer['timediffday']} <spring:message code="label.dayago"/></div>
                                </c:when>
                                <c:when test="${questionAnswer['timediffhour'] > 0}">
                                    <div style="top:-2px;position:relative;padding-left:5px;min-width:40px;float:right">${questionAnswer['timediffhour']} <spring:message code="label.hourago"/></div>
                                    <div style="top:-2px;position:relative;float:right"><img src="../img/new.png"/></div>
                                </c:when>
                                <c:when test="${questionAnswer['timediffmin'] > 0}">
                                    <div style="top:-2px;position:relative;padding-left:5px;min-width:40px;float:right">${questionAnswer['timediffmin']} <spring:message code="label.minago"/></div>
                                    <div style="top:-2px;position:relative;float:right"><img src="../img/new.png"/></div>
                                </c:when>
                                <c:otherwise>
                                    <div style="top:-2px;position:relative;padding-left:5px;min-width:40px;float:right">${questionAnswer['timediffsec']} <spring:message code="label.secago"/></div>
                                    <div style="top:-2px;position:relative;float:right"><img src="../img/new.png"/></div>
                                </c:otherwise>
                            </c:choose>
                            </div></div>
                            <c:choose>
                                <c:when test="${fn:contains(header['user-agent'],'Mobile')}">
                                                            &nbsp;
                                </c:when>
                                <c:otherwise>
                                    <span style="float:right;"><font class="fontxlarge d3-color-gray-3" style="line-height:1.5em;">[${questionAnswer['schoolcategory']}]&nbsp;</font></span>
                                </c:otherwise>
                            </c:choose>
							</div>
							</div>
                            <c:if  test="${sessionScope.user['roleid'] eq 1 }">
                            <div style="float:right;position:relative;top:-20px;right:-30px;">
 				                <a class="comment" href="#" onclick="javascript:hideQA(${questionAnswer['id']});"><img src="/school/img/closegreen.png"/></a>
 			                </div>
 			                </c:if>
			</c:forEach>
		</c:when>
			<c:otherwise>
				<spring:message code="label.watingquestion"/>
			</c:otherwise>
		</c:choose>




<form action="/school/controller/getQuestionAnswerListByTag" method="post" name="questionAnswer" id="questionAnswer">
<input type="hidden" name="tag" id="tag" value="" />
</form>

<form action="/school/controller/getForumDetails" method="post" name="forum" id="forum">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>  	
   
   
<script>

$('#loadingdiv')
.hide()  // hide it initially
.ajaxStart(function() {
    $(this).show();
    $("#tabcontent").hide();
})
.ajaxStop(function() {
    $(this).hide();
    $("#tabcontent").show();
})
;
</script>    

<script type="text/javascript">

	function getForumContent(id,categoryid,type,maincategoryname,maincategoryuri){
	
		document.forms["forum"].id.value = id;
		document.forms["forum"].categoryid.value = categoryid;
		document.forms["forum"].type.value = type;
		document.forms["forum"].maincategoryname.value = maincategoryname;
		document.forms["forum"].maincategoryuri.value = maincategoryuri;
		
		document.forms["forum"].submit();
	}


	
	
	
</script>
