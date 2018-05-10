<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 10000000) %></c:set>
<script type="text/javascript" src="http://cmh.hk.overture.com/js_flat_1_0/?config=20840581828&source=uni_hk_bookofschool_ctxt&ctxtUrl=${locationhref}&ctxtId=entertainment&ctxtCat=hk_t1_default_entertainment&maxCount=3&mkt=hk&cb=${rand}&type=entertainment"></script>


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
document.write('<a target="_new" href="' + clickURL + '">');
document.write(title + '</a></span>');
document.write('<br><span class="fontlarge d3-color-gray-1">' + descr + '</span><br>');
document.write('<span class="fontlarge d3-color-gray-3">' + sitehost + '</span></div>');
}

if(zSr.length > i){
	document.write('</div>');
}
</script>