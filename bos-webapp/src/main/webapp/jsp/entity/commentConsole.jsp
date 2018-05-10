<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/scorebar.css'>
<script type="text/javascript" src="/school/js/jquery.corner.js"></script>

<script type="text/javascript" language="javascript">
$('div.systemComment').corner();
</script>

<div class="bgc_main round_corner MB5" style="padding:15px;min-height: 250px;">
<br>		
<br>
<div style="float:left;padding-left:10px;">
<span class="fontSchoolNameChi d3-color-black"><spring:message code="label.parentcomment"/> <font class="d3-color-orange">(${fn:length(requestScope.comments)})</font></span>

<c:choose>
				<c:when test="${requestScope.poll['timediffday'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffday']} <spring:message code="label.dayago"/></c:set>
				</c:when>
				<c:when test="${requestScope.poll['timediffhour'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffhour']} <spring:message code="label.hourago"/></c:set>
				</c:when>
				<c:when test="${requestScope.poll['timediffmin'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffmin']} <spring:message code="label.minago"/></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffsec']} <spring:message code="label.secago"/></c:set>
				</c:otherwise>
			</c:choose>

<div>
	<p class="fontlarge" style="padding-bottom:10px;padding-top:10px;"><spring:message code="label.noofparentpoll" arguments="<font class='d3-color-orange'>(${requestScope.poll['noofparent']})</font>" argumentSeparator=";"/></p>
	<div class="graph">
   		<strong class="bar" style="width: ${requestScope.poll['metric1'] lt 1 ? 100 : requestScope.poll['metric1'] * 10 }%;"><spring:message code="label.parentmetric1"/> : ${requestScope.poll['metric1']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric2'] lt 1 ? 100 :requestScope.poll['metric2'] * 10 }%;"><spring:message code="label.parentmetric2"/> : ${requestScope.poll['metric2']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric3'] lt 1 ? 100 :requestScope.poll['metric3'] * 10 }%;"><spring:message code="label.parentmetric3"/> : ${requestScope.poll['metric3']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric4'] lt 1 ? 100 :requestScope.poll['metric4'] * 10 }%;"><spring:message code="label.parentmetric4"/> : ${requestScope.poll['metric4']}</strong></p>
	</div>
</div>
</div>

<!--
<div style="float:left;padding-left:30px;padding-top:50px;border: 0px solid red;text-align:center; ">
 	<img src="/school/img/parent.png" style="width:46px;height:31px">
	<br><font style="font-size:0.8em; font-weight:normal;color:#000;position:relative;top:0px;left:0px"><spring:message code="label.parentrating"/></font>
        <br><font style="text-align:center;font-size:2.8em; font-weight:bold;color:rgb(145,154,61);position:relative;top:0px;left:0px"><c:choose><c:when test="${not empty requestScope.poll['parentscore'] }">${requestScope.poll['parentscore']}</c:when><c:otherwise>?</c:otherwise></c:choose></font>
        <c:if test="${ requestScope.parentscore gt 0}"><c:choose><c:when test="${ requestScope.parentscore gt requestScope.poll['parentscore'] }"><img src="/school/img/drop.png"></c:when>
        <c:when test="${ requestScope.parentscore eq requestScope.poll['parentscore'] }"><img src="/school/img/nochange.png"></c:when>
        <c:otherwise><img src="/school/img/up.png"></c:otherwise></c:choose><font class="font1" style="text-align:center">(${requestScope.parentscore})</font>
		<br class="clearboth"/>
		<font class="font1" style="text-align:center;position:relative;top:-5px;left:0px;"><spring:message code="label.lastmodified"/> ${parentscorelastupdate}</font></c:if>
</div>
-->
	<div style="float:right;top:-5px;position:relative;">
	    <a  class="btn btn-red tk tk2" onclick="javascript:showPolling();" href="#"><span><spring:message code="label.checkpollingrecord"/></span></a>
	</div>

<c:if test="${fn:length(requestScope.comments) > 0 && requestScope.comments[0]['ID'] > 0}">
<div class="clearfix"></div>
<br>
<div class="line-type2-flat"></div>
    <table width="100%">
        <c:forEach var="comments" items="${requestScope.comments}" varStatus="rowCounter" end="80">
            <c:if test="${comments['type'] ne 'system' && comments['grade'] ne '-1'  }">
                <c:choose>
                        <c:when test="${empty comments['metric1']}">
                            <c:set var="allmetric1" value="0"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="allmetric1" value="${comments['metric1']}"/>
                        </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty comments['metric2']}">
                        <c:set var="allmetric2" value="0"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="allmetric2" value="${comments['metric2']}"/>
                    </c:otherwise>
                </c:choose>
                    <c:choose>
                    <c:when test="${empty comments['metric3']}">
                        <c:set var="allmetric3" value="0"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="allmetric3" value="${comments['metric3']}"/>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty comments['metric4']}">
                        <c:set var="allmetric4" value="0"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="allmetric4" value="${comments['metric4']}"/>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty comments['metric5']}">
                        <c:set var="allmetric5" value="0"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="allmetric5" value="${comments['metric5']}"/>
                    </c:otherwise>
                </c:choose>
            <TR VALIGN="top">
            <td>
                &nbsp;
            </td>
            <td>
            <div>
            <a name="usercomment-ap"></a>

                <table width="100%" cellpadding=0 cellspacing=0>
                <tr>
                    <td valign="top" rowspan="2" width="90px;">
                        <div style="float:left;width:70px;padding:10px;" class="font2" >
                        <a href="/school/controller/viewProfile?userid=${comments['userid']}">
                        <img style="" id="thumb" width="70px" height="70px;" src="/school/userimages/${comments['userprofile']}" onerror="UserImgError(this);" />
                        </a>
                        <br><br>
                            <c:choose>
                            <c:when test="${comments['anonymous'] eq 'y' or empty comments['username'] }">
                            <p style="text-align:center;font-size:1.0em;"><spring:message code="label.anonymous"/></p>
                            </c:when>
                            <c:otherwise>
                            <div style="text-align:center;">
                                <p class="fontxxlarge">${comments['username']}</p><br>
                                <div class="line-type2-flat"></div>
                                <p class="fontlarge" style="padding-top:5px;"><spring:message code="label.userscore"/> : ${comments['userscore']}</p>
                                <p class="fontlarge" style="padding-top:5px;padding-bottom:5px;"><spring:message code="label.parentrating"/> : ${comments['parentratingcount']}</p>
                                <div class="line-type2-flat"></div>
                            </div>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="bubble me">
                        <div class="FL" style="width:750px;">
                        <div class="fontxlarge d3-color-gray-2 " style="padding:30px 20px 10px;">${comments['subject']}</div>
                        <div style="padding:20px 40px 10px;"><c:if test="${comments['userlike'] gt 1}"><img style="padding-right:3px;" src="/school/img/quote_icon.png"/></c:if> <font class="fontxxlarge d3-color-gray-1">${comments['COMMENT']}</font></div>
                        </div>
                        <div class="FL" style="border-left: 1px dashed rgb(198,191,180);min-height:200px;padding-left:0px;"></div>
                        <div class="FR" style="padding:10px">
                                <div class="review_info txt_center">
                                    <div class="M20"></div>
                                    <c:set var="fullmetric" value=""/>
                                    <c:forEach var="i" begin="1" end="4">
                                    <c:set var="label">label.parentmetric${i}</c:set>
                                    <c:set var="metric">metric${i}</c:set>
                                    <c:set var="allmetric" value="${comments[metric]}"/>
                                   	<c:set var="fullmetric" value="${fullmetric}||${allmetric}"/>
                                    <div class="FL MR5">
                                	    <div class="score_vol5 ${ allmetric > 8 ? '' : 'vis_hidden'}"></div>
                                        <div class="score_vol4 ${ allmetric > 6 ? '' : 'vis_hidden'}"></div>
                                        <div class="score_vol3 ${ allmetric > 4 ? '' : 'vis_hidden'}"></div>
                                        <div class="score_vol2 ${ allmetric > 2 ? '' : 'vis_hidden'}"></div>
                                        <div class="score_vol1 ${ allmetric > 0 ? '' : 'vis_hidden'}"></div>
                                        <div class="MT5"><spring:message code="${label}"/></div>
                                    </div>
                                	</c:forEach>
                                	<div class="clearfix"></div>
                                    <div style="margin:15px;"></div>
                                </div>
                                <div class="fonttiny" style="color:white">${fullmetric}</div>
                                <div class="review_info border_top_dot">
                                    <div class="FL PT10 PB10 txt_bold"><spring:message code="label.lastupdate"/></div>
                                    <div class="FR PT10 PB10">
                                        <font class="d3-color-gray-2"><fmt:formatDate pattern="dd MMM yyyy HH:mm" value="${comments['lastModified']}" /></font>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="review_info border_top_dot">
                                    <div class="FL PT10 PB10 txt_bold"><spring:message code="label.doyoulikethis"/></div>
                                    <div class="FR PT10 PB10">
                                        <a class="comment" href="#" onclick="javascript:likeComment(${comments['ID']},'like');"><img src="/school/img/thumbup.png"/> ${comments['USERLIKE']}</a>
                                    <a class="comment" href="#" onclick="javascript:likeComment(${comments['ID']},'dislike');"><img src="/school/img/thumbdown.png"/> ${comments['USERDISLIKE']}</a>
                                      <c:if  test="${sessionScope.user['roleid'] eq 1 }">
                                          <a class="comment" href="#" onclick="javascript:hideComment(${comments['ID']});"><img src="/school/img/closegreen.png"/></a>
                                      </c:if>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        </div>
                       </div>
                    </td>
                </TR>


                </table>
            </div>
            </TD>
            </TR>
            <tr><td colspan="2">&nbsp;</td></tr>
        </c:if>
        </c:forEach>
    </tbody>
    </TABLE>
</c:if>
</div>



       
