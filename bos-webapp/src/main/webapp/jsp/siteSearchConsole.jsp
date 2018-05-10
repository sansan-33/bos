<%@ include file="common-header.jsp" %>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>
<jsp:include page="menu.jsp"/>

<jsp:include page="ads/wideKiwiAds.jsp"/>

	<div class="dbl-bdr"><div class="wrapper">

	<font class="fontlarge"><spring:message code="label.search"/>&nbsp;<font class="font4b">${requestScope.searchkeywords}</font></font>
	<font class="fontlarge"><spring:message code="label.searchresult" arguments="${fn:length(requestScope.resultList)}" argumentSeparator=";" /> </font>
	<a  style="float:right;position:relative;margin-top:20px;" href="/school/controller/schoolCompare?entityids=${requestScope.compareEntityid}" class="btn btn-red tk tk2"><span><spring:message code="label.compareimmediately" arguments="${totalschool}" argumentSeparator=";"  /></span></a>
    <br class="clear"><br class="clear"><br class="clear">  
      
	<div style="min-height:600px;">
	<c:set var="prevtype">''</c:set>
	<c:set var="schoolcounter">0</c:set>
	<c:forEach var="searchresult" items="${requestScope.resultList}" varStatus="rowCounter">
		<c:choose>
		<c:when test="${searchresult['searchcat'] eq 'school' }">
		   	<c:set var="compareEntityid" value="${rowCounter.first ? '' : compareEntityid}${searchresult['id']}," />
			<c:set var="schoolcounter">${schoolcounter + 1}</c:set>	
			<c:set var="searchcat"><spring:message code="label.school"/></c:set>
			<c:set var="searchurl">/school/controller/entityDetails?action=compare&entityid=</c:set>
			<c:set var="searchimg">/school/staticimage/CAT${searchresult['categoryid']}/logo_${searchresult['imgid']}.jpg</c:set>
		</c:when>
		<c:when test="${searchresult['searchcat'] eq 'reverse' }">
			<c:set var="searchcat"><spring:message code="label.reversesearch"/></c:set>
			<c:set var="searchurl">/school/controller/getForumDetails?id=</c:set>
			<c:choose>
			<c:when test="${searchresult['userid'] eq '1' }">
			<c:set var="searchimg">/school/img/logobookgreen.jpg</c:set>
			</c:when>
			<c:otherwise>
			<c:set var="searchimg">fb_default_icon.gif</c:set>
			</c:otherwise>
			</c:choose>	
		</c:when>
		<c:when test="${searchresult['searchcat'] eq 'compare' }">
			<c:set var="searchcat"><spring:message code="label.schoolcompare"/></c:set>
			<c:set var="searchurl">/school/controller/getForumDetails?id=</c:set>
			<c:choose>
			<c:when test="${searchresult['userid'] eq '1' }">
			<c:set var="searchimg">/school/img/logobookgreen.jpg</c:set>
			</c:when>
			<c:otherwise>
			<c:set var="searchimg">fb_default_icon.gif</c:set>
			</c:otherwise>
			</c:choose>	
	
		</c:when>
		</c:choose>
		<c:if test="${searchresult['searchcat'] ne prevtype }">
		<p class="font4b border-bottom-gray">${searchcat}</p>
		</c:if>
		<div  class="row10 commondiv" style="padding-left:12px;padding-top:5px;padding-bottom:5px;" onclick="document.location.href='${searchurl}${searchresult['id']}'">
			<c:if test="${searchresult['searchcat'] eq 'school' }"><font class="d3-color-green-2" style="position:relative;float:right;top:1px;"><spring:message code="label.schoolrating"/>:${searchresult['score']}</font></c:if>
			<img style="float: left; padding-right: 16px;padding-bottom: 30px;padding-top: 1px;" src="${searchimg}" width="80px" height="90px" onerror="ImgError(this);" />
			<div style="padding-bottom:3px;">
			<font class="fontxlarge d3-color-black" style="padding-left:5px;">${searchresult['name']}</font>
			</div>
			<div  style="padding-bottom:5px;">
			<font class="fontlarge d3-color-gray-3" style="padding-left:5px;">${searchresult['nameeng']}</font>
			</div>
			<div  style="padding-bottom:5px;">
      			<font class="fontlarge d3-color-gray-3" style="padding-left:5px;">${searchresult['address']}</font>
    		</div>
    		<div class="fontlarge d3-color-gray-3" style="padding-bottom:5px;"><font style="padding-left:5px;">${searchresult['desctext']}</font></div>

			<c:set var="metrics" value="${fn:split( searchresult['categoryid'] eq 0 ? 'metric1,metric4,metric5' : 'metric1,metric2,metric3,metric4,metric5', ',')}" />
          	<div>
          	    <c:forEach items="${metrics}" var="metric" varStatus="status">
                    <span style="padding-left:5px;" class="fontsmall d3-color-gray-3"><spring:message code="label.${metric}"/>:<font class="d3-color-black">${searchresult[metric]}</font></span>
                </c:forEach>
          	</div>
			<br>
			<div class="border-bottom-gray"></div>
		</div>
		<p class="clear"></p>
		<c:set var="prevtype">${searchresult['searchcat']}</c:set>
		
	</c:forEach>
	<!--  this is dummy line to prevent UI table display problem -->
	<p class="font4b">&nbsp;</p>

</div>
	
			</div></div>

<jsp:include page="common-footer.jsp"/>
