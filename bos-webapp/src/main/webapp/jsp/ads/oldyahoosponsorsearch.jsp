<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<c:set var="language">${not empty param.language ? param.language : ''}</c:set>
<c:set var="referer"><%=request.getHeader("Referer") %></c:set>
<c:choose>
<c:when test="${ fn:contains(referer, 'yahoo')}">
<c:set var="keywords">${param['p']}</c:set> 
</c:when>
<c:when test="${ fn:contains(referer, 'bing')}">
<c:set var="keywords">${param['q']}</c:set> 
</c:when>
<c:when test="${ fn:contains(referer, 'google')}">
<c:set var="keywords">${param['q']}</c:set> 
</c:when>
<c:when test="${ fn:contains(referer, 'baidu')}">
<c:set var="keywords">${param['wd']}</c:set> 
</c:when>
</c:choose>
<c:choose>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'Allocation') }">
<c:set var="keywords"><spring:message code="label.schoolallocationkeyword" /></c:set> 
</c:when>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'Forum') && requestScope.type eq 'tutor' }">
<c:set var="keywords"><spring:message code="label.tutor" /></c:set> 
</c:when>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'Forum') && requestScope.type eq 'support' }">
<c:set var="keywords"><spring:message code="label.supportfeedback" /></c:set> 
</c:when>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'kidEducationConsole') }">
<c:set var="keywords"><spring:message code="label.kidedu" /></c:set> 
</c:when>

<c:when test="${requestScope.categoryid eq '0' }">
<c:set var="keywords"><spring:message code="label.kindergarten${language}" /></c:set> 
</c:when>
<c:when test="${requestScope.categoryid eq '1' }">
<c:set var="keywords"><spring:message code="label.primary${language}" /></c:set> 
</c:when>
<c:when test="${requestScope.categoryid eq '2' }">
<c:set var="keywords"><spring:message code="label.secondary${language}" /></c:set> 
</c:when>
<c:when test="${requestScope.categoryid eq '5' }">
<c:set var="keywords"><spring:message code="label.ib${language}" /></c:set> 
</c:when>

</c:choose>
<c:if test="${empty keywords || fn:length(keywords) < 1 }">
<c:set var="keywords">school</c:set>
</c:if>

<c:set var="maxcount">${not empty param.maxcount ? param.maxcount : '6'}</c:set>


<script>
document.write('<scr'+'ipt type="text/javascript" language="javascript" src="https://js-apac-ss.ysm.yahoo.com/d/search/p/standard/js/hk/flat/mpd/rlb/?Keywords='+ encodeURIComponent('${keywords}') +'&Partner=uni_hk_bookofschool_pm&keywordCharEnc=utf8&outputCharEnc=utf8&mkt=hk&maxCount=${maxcount}&urlFilters=bookofschool_hk&serveUrl='+ encodeURIComponent(location.href) +'&affilData='+ encodeURIComponent('ip=${requestScope.ip}&ua='+ navigator.userAgent) +'"></scr'+'ipt>');
</script>


<SCRIPT type="text/javascript">
var i=6;

//alert(zSr.length);
if(zSr.length > i){
	document.write('<div>');
	document.write('<div style="color:#585858;font-size:12px;float:right;"><a href="http://hk.searchmarketing.yahoo.com/?o=HK0025" target="_blank"><font color="#C0C0C0"><spring:message code="label.yahooads.sponsorsite"/></font></a></div>');
	document.write('<br class="clear">');
}


while(i < zSr.length) {
var descr = zSr[i++]; 
var unused1 = zSr[i++]; 
var clickURL = zSr[i++]; 
var title = zSr[i++]; 
var sitehost = zSr[i++]; 
var unused2 = zSr[i++]; 

var javascriptClickURL = "javascript:window.open('" + clickURL + "')";
document.write('<div class="commondiv" style="padding:5px;" onclick="' + javascriptClickURL +  '"  ><span class="fontlarge d3-color-blue-1 fontbold">');
//document.write('<div style="height:70px;"><img style="position:relative;float:left;" src="http://ysm.unimhk.com/thumbnail.php?l=' + sitehost + '" width="70"></div>');
document.write('<a target="_new" href="' + clickURL
+ '">');
document.write(title + '</a></span>');
document.write('<br><span class="fontlarge d3-color-gray-1">' + descr + '</span><br>');
document.write('<span class="fontlarge d3-color-gray-3">' + sitehost + '</span></div><div class="clear"></div>');
}

if(zSr.length > i){
	document.write('</div>');
}
</script>


