<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="htmltitle" scope="request"><spring:message code="label.advancedsearch"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.advancedsearch"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.advancedsearch"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.advancedsearch"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.advancedsearch"/></c:set>

<%@ include file="common-header.jsp" %>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>
<script src="/school/js/apple.search.js"  djConfig="parseOnLoad: true"></script>


<jsp:include page="menu.jsp"/>


<div style="position:relative;float:right;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
    <c:set var="statkey">searchForm-1</c:set>
	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<jsp:include page="ads/wideKiwiAds.jsp"/>

<div class="dbl-bdr"><div class="wrapper">

<form action="/school/controller/siteSearch" method="post" name="siteSearch" id="siteSearch">
<input type="hidden" name="schcat0" value="<spring:message code='label.kindergarten'/>" />
<input type="hidden" name="schcat1" value="<spring:message code='label.primary'/>" /> 
<input type="hidden" name="schcat2" value="<spring:message code='label.secondary'/>" />
<input type="hidden" name="schcat5" value="<spring:message code='label.ib'/>" />

 
<div style="padding:30px 40px;text-align:left;">
    
    <p class="fontxxxlarge d3-color-black fontbold"><spring:message code="label.advancedsearch"/></p>
	<a style="float:right;position:relative;right:100px;top:-30px;" onclick='javascript:{ document.forms["siteSearch"].submit(); }' class="btn btn-red tk tk2"><span><spring:message code="label.search"/></span></a>
	  	
	<br>
	<div class="border-bottom-gray"></div><br>
      	<input class="searchTextField" style="width:500px;height:1.88em;float:left;position:relative;margin-right:5px;" type="text" value="<spring:message code='label.searchtextfield'/>" id="inputString" name="inputString" onclick="clickclear(this, '<spring:message code='label.searchtextfield'/>')" onblur="clickrecall(this,'<spring:message code='label.searchtextfield'/>')" />
      	
      	<br><br class="clear"/><br class="clear"/>
	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.school"/> : </span>
	<span style="float:left;position:relative;top:5px;">
	<label class="font4n" for="schoolcategory0"><spring:message code='label.kindergarten'/><input id="schoolcategory" class="search_form_checkbox" name="schoolcategory" value="0" type="checkbox"> </label>
	<label class="font4n" for="schoolcategory1"><spring:message code='label.primary'/><input id="schoolcategory" name="schoolcategory" class="search_form_checkbox" value="1" type="checkbox"> </label>
	<label class="font4n" for="schoolcategory2"><spring:message code='label.secondary'/><input id="schoolcategory" name="schoolcategory" class="search_form_checkbox" value="2" type="checkbox"> </label>
	<label class="font4n" for="schoolcategory5"><spring:message code='label.ib'/><input id="schoolcategory" name="schoolcategory" class="search_form_checkbox" value="5" type="checkbox"> </label>
 	</span>
 	<br class="clearboth">
 	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall"></span>
 	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.academic"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="metric1" name="metric1" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.sport"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="metric2" name="metric2" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.music"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="metric3" name="metric3" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.campus"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="metric4" name="metric4" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.teacher"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="metric5" name="metric5" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.schoolrating"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="score" name="score" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.parentrating"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="parentrating" name="parentrating" style="width:20px;height:12px;" maxlength="2">
	</span>
	<span style="float:left" class="font4 d3-color-gray">
	<spring:message code="label.ranking"/> </span>
	<span style="float:left;position:relative;top:5px;padding-right:5px;">
		<input type="text" id="systemranking" name="systemranking" style="width:20px;height:12px;" maxlength="2">
	</span>
	<br class="clear"><span style="float:left" class=" font4 d3-color-black labelwidthsmall">&nbsp;</span><span class="font4 d3-color-red"><spring:message code="label.scorerange"/></span>
	
	
	<br class="clearboth"><br class="clearboth">
	<div class="border-bottom-gray"></div>
	<br>
	<span style="float:left" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.address"/> : </span>
	<span style="float:left;position:relative;top:5px;">
		<input type="text" id="address" name="address" style="height:1.68em;width:200px;">
	</span>

	<br class="clearboth"><br class="clearboth">
    	<span style="float:left" class=" font4 d3-color-black labelwidthsmall">
    	<spring:message code="label.district"/> : </span>
    	<span style="float:left;position:relative;top:5px;">
        	<select id="poaschoolnet" name="poaschoolnet" style="width: 20em">
        	<option value="-1"> ----- </option>

        	<c:forEach var="poaschoolnet" items="${poaschoolnetlist}" varStatus="rowCounter">
        			<option value="${poaschoolnet['value']}">
                        ${poaschoolnet['description']} ${poaschoolnet['value']}
        			</option>
          </c:forEach>
            </select>
    </span>

    <br class="clearboth"><br class="clearboth"><br class="clearboth">
    <div class="border-bottom-gray"></div>
	<br class="clearboth">
	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.sex"/> : </span>
	<span style="float:left;position:relative;top:5px;">
	<label class="font4n" for="boy"><spring:message code='label.boy'/><input id="boy" name="boy" class="search_form_checkbox" value="<spring:message code='label.boy'/>" type="checkbox"> </label>
	<label class="font4n" for="girl"><spring:message code='label.girl'/><input id="girl" name="girl" class="search_form_checkbox" value="<spring:message code='label.girl'/>" type="checkbox"> </label>
	<label class="font4n" for="boygirl"><spring:message code='label.boygirl'/><input id="boygirl" name="boygirl" class="search_form_checkbox" value="<spring:message code='label.boygirl'/>" type="checkbox"> </label>
	</span>
	<br class="clearboth">

	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.language"/> : </span>
	<span style="float:left;position:relative;top:5px;">
	<label class="font4n" for="chinese"><spring:message code='label.chinese'/><input id="chinese" name="chinese" class="search_form_checkbox" value="<spring:message code='label.chinese.value'/>" type="checkbox"> </label>
	<label class="font4n" for="english"><spring:message code='label.english'/><input id="english" name="english" class="search_form_checkbox" value="<spring:message code='label.english.value'/>" type="checkbox"> </label>
	<label class="font4n" for="chineseenglish"><spring:message code='label.chinese.english'/><input id="chineseenglish" name="chineseenglish" class="search_form_checkbox" value="<spring:message code='label.chinese.english.value'/>" type="checkbox"> </label>
	<label class="font4n" for="chineseputonghua"><spring:message code='label.chinese.putonghua'/><input id="chineseputonghua" name="chineseputonghua" class="search_form_checkbox" value="<spring:message code='label.chinese.putonghua.value'/>" type="checkbox"> </label>
	<label class="font4n" for="chineseputonghuaenglish"><spring:message code='label.chinese.putonghua.english'/><input id="chineseputonghuaenglish" name="chineseputonghuaenglish" class="search_form_checkbox" value="<spring:message code='label.chinese.putonghua.english.value'/>" type="checkbox"> </label>

	</span>
	<br class="clearboth">
 	
	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.session"/> : </span>
	<span style="float:left;position:relative;top:5px;">
	<label class="font4n" for="nursery"><spring:message code="label.nursery"/><input id="nursery" name="nursery" class="search_form_checkbox" value="<spring:message code="label.nursery"/>" type="checkbox"> </label>
	<c:forEach var="session" items="${requestScope.schoolSessionList}" varStatus="rowCounter">
		<label class="font4n" for="session${rowCounter.count}">${session['session']}<input id="session" name="session" class="search_form_checkbox" value="${session['session']}" type="checkbox"> </label>
	</c:forEach>
	</span>
	<br class="clearboth">	

 	<br><br><div class="border-bottom-gray"></div>
 	<br>
 	
	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
 	<spring:message code="label.financetype"/> : </span>
	<span style="float:left;position:relative;top:5px;">
 	<c:forEach var="trainSchool" items="${requestScope.throughtrainSchoolList}" varStatus="rowCounter">
		<label class="font4n d3-color-black" for="${trainSchool['mode']}"><spring:message code="label.${trainSchool['mode']}"/><input id="${trainSchool['mode']}" name="${trainSchool['mode']}" class="search_form_checkbox" value="<spring:message code="label.${trainSchool['mode']}"/>" type="checkbox"> </label>
	</c:forEach>
	</span>
	
	<br class="clearboth">	

	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
 	<!-- <spring:message code="label.throughtrain"/> / <spring:message code="label.nominated"/> / <spring:message code="label.feeder"/> : --></span>
	<span style="float:left;position:relative;top:5px;">
	<c:forEach var="fschool" items="${requestScope.financetypeSchoolList}" varStatus="rowCounter">
		<label class="font4n d3-color-gray" for="financetype${rowCounter.count}">${fschool['financetype']}<input id="financetype" name="financetype" class="search_form_checkbox" value="${fschool['financetype']}" type="checkbox"> </label>
	</c:forEach>
	</span>
 	<br class="clearboth">	 	<br class="clearboth">	
 	

	<span style="float:left;top:-1px;position:relative;" class=" font4 d3-color-black labelwidthsmall">
	<spring:message code="label.yearhistory"/> : </span>
	<span style="float:left;position:relative;top:5px;">
	<label class="font4n" for="radioOne0"><input type="radio" name="yearofcommencement" <c:if test="${sessionScope.searchCriteria['yearofcommencement'] == '50'}">checked</c:if> id="radioOne0" value="50"/>
      	<spring:message code="label.fiftyyears"/>
	</label>
	<label class="font4n" for="radioOne1"><input type="radio" name="yearofcommencement" <c:if test="${sessionScope.searchCriteria['yearofcommencement'] == '100'}">checked</c:if> id="radioOne1" value="100"/>
		<spring:message code="label.hundredyears"/>
	</label>
	</span>
<br><br><br><br class="clear"/>
	<div class="border-bottom-gray"></div><br>
</div>

<a style="float:right;position:relative;right:140px;top:-30px;" onclick='javascript:{ document.forms["siteSearch"].submit(); }' class="btn btn-red tk tk2"><span><spring:message code="label.search"/></span></a>
	
 </form>
 </div></div>
       <br><br>
       <div style="float:right;position:relative;"><c:if test="${fn:contains(pageContext.request.serverName ,'bookofschool')}"><jsp:include page="ads/adsfactorrectangle.jsp"/></c:if></div>

<jsp:include page="common-footer.jsp"/>
