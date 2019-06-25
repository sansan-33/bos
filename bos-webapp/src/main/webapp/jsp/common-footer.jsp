<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>


<c:catch var="catchException">   
    
<c:choose>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'getForumContentList') || fn:contains(requestScope['javax.servlet.forward.request_uri'],'getForumDetails')
				|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'getMyForumContentList') 
				|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'saveQuestionAnswer') 
				 || fn:contains(requestScope['javax.servlet.forward.request_uri'],'saveEventCalendar') 
					|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'eventCalendar') 
					|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'eventFullCalendar')
        			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolCompare')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'searchForm')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'siteSearch')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolSearch')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'ibConsole')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'adminConsole')
			|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'saveSecondaryListForm')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'savePrimaryListForm')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolAllocationReport')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'getHitSchoolReport')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'kindergartenConsole')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'primarySchoolConsole')
            || fn:contains(requestScope['javax.servlet.forward.request_uri'],'secondarySchoolConsole')
           	|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'privateDssReport')
                       		}">


<c:if test="${fn:contains(pageContext.request.serverName ,'bookofschool')}">
	<table width="940px">
	<tr><td colspan="2">&nbsp;</td></tr>
   	<tr><td valign="top" style="width:500px;">
	<c:choose>
	    	<c:when test="${requestScope.categoryid eq '-1' && requestScope.type ne 'hot' }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    	<c:when test="${not empty requestScope.categoryid && requestScope.categoryid ne '-1' }"><jsp:include page="/controller/yahooSponsorSearchCommon"><jsp:param name="language" value=".en" /></jsp:include></c:when>
	    	<c:otherwise><jsp:include page="ads/yahoocontentmatchright.jsp"/></c:otherwise>
	</c:choose>
	</td>
	<td align="right">
 	<jsp:include page="ads/adsfactorrectangle2.jsp"/>
	</td>
	</tr></table>
</c:if>

</td>
<td colspan="2">&nbsp;</td>
					
</c:when>
<c:otherwise>
</td>
    <TD style="border-left: 0px solid rgb(233,233,233); padding-left: 7px;"></td>
    <td valign="top" width="300px" style="${ fn:length(requestScope.topmenu) > 0 ? 'position:relative;top:-36px;' : '' }">
    <table class="rect_padding">
    <tr><td><jsp:include page="ads/yahoosearch.jsp"/></td></tr>
      	<tr><td><jsp:include page="ads/custom/small.jsp"/></td></tr>

	    <c:if test="${fn:contains(pageContext.request.serverName ,'bookofschool')}">
	  	<tr><td><jsp:include page="ads/adsfactorrectangle.jsp"/></td></tr>
   	    </c:if>
	    <c:if test="${ fn:contains(pageContext.request.requestURI ,'entityDetails')}">
	    <tr><td><jsp:include page="entity/alsoViewedSchool.jsp"/></td></tr>
    	<tr><td><jsp:include page="chat.jsp"/></td></tr>
        </c:if>
        <c:if test="${ fn:contains(pageContext.request.requestURI ,'case')}">
    	<tr><td valign="top" align="left" ><jsp:include page="barChartTopUser.jsp"/></td></tr>
    	</c:if>
    	<tr><td>
    	<c:choose>
    	<c:when test="${fn:contains(pageContext.request.serverName ,'localhost') }"></c:when>
	    	<c:when test="${requestScope.categoryid eq '-1' && requestScope.type ne 'hot' }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    	<c:when test="${not empty requestScope.categoryid && requestScope.categoryid ne '-1' }"><jsp:include page="/controller/yahooSponsorSearchCommon"><jsp:param name="language" value=".en" /></jsp:include></c:when>
	    		<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'kidEducationConsole') }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    <c:otherwise><jsp:include page="ads/yahoocontentmatchright.jsp"/></c:otherwise>
    	</c:choose>
    	</td></tr>
    	<tr><td><jsp:include page="common/viewedSchool.jsp"/></td></tr>
    	<c:if test="${not fn:contains(requestScope['javax.servlet.forward.request_uri'],'reverseSearchForm')}" >
    	<tr><td><jsp:include page="common/reverseSearchForm.jsp"/></td></tr>
    	</c:if>
    	<c:if test="${fn:contains(pageContext.request.serverName ,'bookofschool')}">
    		<tr><td><jsp:include page="ads/adsfactorrectangle2.jsp"/></td></tr>
    		<tr><td>
    		<c:choose>
                <c:when test="${GURU_HANG eq 'true'}">
                    <jsp:include page="ads/yahooMedium.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="ads/maximizerMedium.jsp"/>
                </c:otherwise>
            </c:choose>
            </td></tr>
 			<tr><td><jsp:include page="ads/yahooMedium.jsp"/></td></tr>
 			<tr><td><jsp:include page="ads/adsfactorsky.jsp"/></td></tr>
            <tr><td>
                <br><br>
                <div class="fb-page"
                data-href="https://www.facebook.com/bookofschool"
                data-width="300"
                data-hide-cover="false"
                data-show-facepile="true"
                data-show-posts="false">
              </div>
            </td></tr>
   		</c:if>
    </table>
    </td>
  </tr>

  
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3"><div>
<c:choose>
			<c:when test="${fn:contains(pageContext.request.serverName ,'localhost') }"></c:when>
	    	<c:when test="${requestScope.categoryid eq '-1' && requestScope.type ne 'hot' }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    	<c:when test="${not empty requestScope.categoryid && requestScope.categoryid ne '-1' }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    	<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'kidEducationConsole') }"><jsp:include page="/controller/yahooSponsorSearchCommon"/></c:when>
	    	<c:otherwise>
	    	    <jsp:include page="ads/yahoocontentmatchbottom.jsp"/>
            </c:otherwise>
</c:choose>
  </c:otherwise>
  </c:choose>

</div></td></tr>

</table>

<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'entityDetails')
|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'saveComment')
}">
<br>
<c:set var="comment" value="entity/commentConsole.jsp"/>
<jsp:include page="${comment}"/>
<br>
</c:if>

<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'home') && fn:contains(pageContext.request.serverName ,'bookofschool')}">
    <script type="text/javascript" src="https://ad.unimhk.com/show.php?id=mdcymdfmmdm3nzbi&sz=1"></script>
</c:if>

</div> <!--  End of contents-wrap -->

<c:if test="${fn:contains(pageContext.request.serverName ,'bookofschool')}">
<jsp:include page="ads/adsfactor1on1.jsp"/>
<jsp:include page="ads/yahoomobilefloating.jsp"/>
<table style="margin: auto;"><tr><td>
<c:choose>
    <c:when test="${GURU_HANG eq 'true'}">
         <jsp:include page="ads/yahooWide.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="ads/maximizerLeaderBoard.jsp"/>
    </c:otherwise>
</c:choose>
</td></tr></table>
</c:if>




<div id="footer-wrap" class="footer-wrap">
<div id="footer" class="clearfix">

<div style="padding-top:15px;">
	<br>
	<p class="fontlarge d3-color-gray-1" style="text-align: center; "><spring:message code="label.whatweare"/></p>
	<div style="position:relative;float:left;width:55px">&nbsp;</div>
	<span style="position:relative;float:left"><img src="/school/img/bos_logo_small.png" style="width:50px;height:50px;padding-right:10px;position:relative;top:-20px"></span>
	<span style="position:relative;left:15px; ">
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text"><font class="d3-color-green-4"><spring:message code="label.ourdata"/></font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">${totalparentcount} <font class="d3-color-green-4"><spring:message code="label.articles"/><spring:message code="label.parentrating"/></font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">${totalusercount} <font class="d3-color-green-4"><spring:message code="label.totaluser"/></font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">${totaltutorcount} <font class="d3-color-green-4"><spring:message code="label.totaltutor"/></font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">${totalhitcount} <font class="d3-color-green-4"><spring:message code="label.hitcount"/></font></span>
    </span>
</div>
<br class="clear"/>
<div style="position:relative;float:left;left:140px;top:-20px;">
	<div  style="position:relative;float:left" ><g:plusone size="medium"></g:plusone></div>
	<div  style="position:relative;float:left" class="fb-like" data-send="false" data-width="600" data-show-faces="true"></div>
</div>

<div style="clear: both;">&nbsp;</div>
<!-- site map -->
<div style="text-align:left;border-top: 1px dashed rgb(198,191,180)">
<div style="position:relative;float:left;width:20px">&nbsp;</div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b"><spring:message code="label.sitename"/></font>
<br><a class="afont2b" href="/school/controller/kindergartenConsole?categoryid=0"><spring:message code="label.kindergarten"/></a>
<br><a class="afont2b" href="/school/controller/primarySchoolConsole?categoryid=1"><spring:message code="label.primary"/></a>
<br><a class="afont2b" href="/school/controller/secondarySchoolConsole?categoryid=2"><spring:message code="label.secondary"/></a>
<br><a class="afont2b" href="/school/controller/ibConsole?categoryid=5"><spring:message code="label.ib"/></a>
<br><br><br><font class="font4b"><spring:message code="label.more"/></font>
<br><a class="afont2b" href="mailto:bookofschool@gmail.com"><spring:message code="label.contactus"/>
<img style="width:24px;height:24px;position:relative;top:9px;" src="/school/img/email.jpg" alt="bookofschool@gmail.com"/></a>
<br><a class="afont2b" href="#" rel="#basicinfo_overlay"><spring:message code="label.disclaimername"/></a>
</div>

<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>	
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b"><spring:message code="label.schoolselection"/></font>
<br><a class="afont2b" href="/school/controller/schoolAllocationReport?categoryid=0"><spring:message code="label.schoolallocationsummary0"/></a>
<br><a class="afont2b" href="/school/controller/schoolAllocationReport?categoryid=1"><spring:message code="label.schoolallocationsummary1"/></a>
<br><a class="afont2b" href="/school/controller/privateDssReport"><spring:message code="label.privatedssreport"/></a>
</div>	
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>	
<div style="position:relative;float:left;padding:25px;width:90px;">
<br><font class="font4b"><spring:message code="label.forum"/></font>
<br><a class="afont2b" href="/school/controller/askQuestion?type=hot"><spring:message code="label.askquestion"/></a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=hot"><spring:message code="label.hottopic"/></a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=0&maincategoryname=label.kindergarten&maincategoryuri=getForumContent"><spring:message code="label.kindergarten"/></a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=1&maincategoryname=label.primary&maincategoryuri=getForumContent"><spring:message code="label.primary"/></a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=2&maincategoryname=label.secondary&maincategoryuri=getForumContent"><spring:message code="label.secondary"/></a>

</div>	
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>	
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b"><spring:message code="label.yourprofile"/></font>
<br>
<a class="afont2b" href="#" title="Favorite" onclick='javascript:{ 
    					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							window.location="/school/controller/myFavoriteConsole?action=favorite"
						</c:when>
						<c:otherwise>alert("<spring:message code="label.pleaselogin"/>");</c:otherwise></c:choose>}'>
    						<spring:message code="label.favorite"/></a>
							<br><a class="afont2b" href="#" title="Account Setup" onclick='javascript:{ 
    					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							window.location="/school/controller/accountInfo"
						</c:when>
						<c:otherwise>alert("<spring:message code="label.pleaselogin"/>");</c:otherwise></c:choose>}'>
   						<spring:message code="label.setting"/>
   				</a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>	
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b"><spring:message code="label.schoolsearchtool"/></font>
<br><a class="afont2b" href="/school/controller/searchForm?nocache=<%=new java.util.Date().getTime()%>"  style="text-decoration:none" ><spring:message code="label.advancedsearch"/></a>
<br><a class="afont2b" href="/school/controller/reverseSearchForm"  style="text-decoration:none" ><spring:message code="label.reversesearch"/></a>
<br><a class="afont2b" href="/school/controller/schoolCompare?nocache=<%=new java.util.Date().getTime()%>"  style="text-decoration:none" ><spring:message code="label.schoolcompare"/></a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;">&nbsp;</div>	
<div style="position:relative;float:left;padding:25px;width:280px;">
    <br><font class="font4b"><spring:message code="label.ourapps"/></font>
    <div style="padding-top:10px;">
            <a class="download" target="_blank" href="https://itunes.apple.com/us/app/bookofschool/id1236504022">
                <img src="/school/img/apple-download.png?1495100274">
            </a>
             <a class="download" href="#" onclick="alert('<spring:message code='label.comingsoon'/>');">
                <img src="/school/img/google-download.png?1495100274">
             </a>

    </div>
<div style="position:relative;float:left;width:1px">&nbsp;</div>	
</div>
</div>
<!-- site map -->

   	</div>
  <!-- footer end --> 
</div>
<!-- footer-wrap end --> 

<div style="clear: both;">&nbsp;</div>
<div class="basicinfo_overlay" id="basicinfo_overlay">
<p class="font4s"><spring:message code="disclaimer"/></p>
</div>

<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'home')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'entityDetails')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolSearch')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'CaseSharingList')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolAllocationReport')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'eventFullCalendar')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'searchForm')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'siteSearch')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolCompareSelection')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'reverseSearchForm')
||  fn:contains(requestScope['javax.servlet.forward.request_uri'],'getHitSchoolReport')

}" >

<!--
<script src="https://js.kiwihk.net/bookofschool/v1/ypa_listing.js"  type="text/javascript"></script>
-->
</c:if>
<c:if test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolCompare')
}" >
<!--
<script src="https://js.kiwihk.net/bookofschool/v1/gemini.js" type="text/javascript"></script>
-->
</c:if>


<c:choose>
<c:when test="${fn:contains(header['user-agent'],'Mobile')
|| fn:contains(requestScope['javax.servlet.forward.request_uri'],'schoolCompare')
}">
    <script src="https://js.kiwihk.net/bookofschool/v1/ypa_listing_floating.js" type="text/javascript"></script>
</c:when>
<c:otherwise>
    <script type="text/javascript" src="/school/js/yahoo.js"></script>
</c:otherwise>
</c:choose>

</body>

</html>

</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>

