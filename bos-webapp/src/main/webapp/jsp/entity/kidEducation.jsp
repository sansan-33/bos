<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="htmltitle" scope="request"><spring:message code="label.kidedu"/></c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.kidedu"/>,<spring:message code="label.playgroup"/>,<spring:message code="label.kidedu.extra"/>,<spring:message code="label.kidedu.piano"/></c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.kidedu"/>,<spring:message code="label.playgroup"/>,<spring:message code="label.kidedu.extra"/>,<spring:message code="label.kidedu.piano"/></c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.kidedu"/>,<spring:message code="label.playgroup"/>,<spring:message code="label.kidedu.extra"/>,<spring:message code="label.kidedu.piano"/></c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.kidedu"/>,<spring:message code="label.playgroup"/>,<spring:message code="label.kidedu.extra"/>,<spring:message code="label.kidedu.piano"/></c:set>
<%@ include file="../common-header.jsp" %>

<script src="/school/js/jquery.corner.js"></script>
<script type="text/javascript" >
$('div.edu').corner("round 9px");
</script>

<jsp:include page="../menu.jsp"/>
 

<c:catch var="catchException">


<span class="d3-color-gray-1 fontxxxlarge" style="float:left;top:-2px;position:relative;"><spring:message code="label.kidedu"/></span><br><br><br>
<span class="d3-color-gray-2 fontxlarge" style="float:left;width:450px;padding-right:30px;"><spring:message code="label.kidedu.intro"/></span>
<br class="clear"><br class="clear">
<div style="position:relative;float:right;top:-100px;padding-top:10px;padding-bottom:10px;padding-right:30px;">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left;padding-right:3px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
		<c:set var="statkey">kidedu-1</c:set>

	<font style="margin-right:5px;margin-left:5px;top:-4px;position:relative;" class="font1"><spring:message code="label.hitcount"/>:<font class="d3-color-blue">${objectStatMap[statkey].hitcounter}</font></font>
</div>
<br class="clear">
<br><br><br>
<div class="edu">
<font class="fontxxlarge d3-color-orange-2"><spring:message code="label.playgroup"/></font><br><br>
<ul class="greendot" ><li ><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.playgroup1"/>"><font class="fontxlarge"><spring:message code="label.kidedu.playgroup1"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.playgroup2"/>"><font class="fontxlarge"><spring:message code="label.kidedu.playgroup2"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.playgroup3"/>"><font class="fontxlarge"><spring:message code="label.kidedu.playgroup3"/></font></a></li>

</ul>
</div>
<div class="edu"><font class="fontxxlarge d3-color-orange-2"><spring:message code="label.kidedu.extra"/></font><br><br>
<ul class="greendot" ><li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.drawing"/>"><font class="fontxlarge"><spring:message code="label.kidedu.drawing"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.math"/>"><font class="fontxlarge"><spring:message code="label.kidedu.math"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.language.speech"/>"><font class="fontxlarge"><spring:message code="label.language.speech"/></font></a></li>
</ul>

</div>
<div class="edu"><font class="fontxxlarge d3-color-orange-2"><spring:message code="label.kidedu.language"/></font><br><br>
<ul class="greendot" ><li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.language.english"/>"><font class="fontxlarge"><spring:message code="label.language.english"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.language.phonics"/>"><font class="fontxlarge"><spring:message code="label.language.phonics"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.language.mandarin"/>"><font class="fontxlarge"><spring:message code="label.language.mandarin"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.language.japanese"/>"><font class="fontxlarge"><spring:message code="label.language.japanese"/></font></a></li></ul>

</div>
<br class="clear"/><br class="clear"/><br class="clear"/>



<div class="edu">
<font class="fontxxlarge d3-color-orange-2"><spring:message code="label.kidedu.sport"/></font><br><br>
<ul class="greendot" ><li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.swimming"/>"><font class="fontxlarge"><spring:message code="label.kidedu.swimming"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.football"/>"><font class="fontxlarge"><spring:message code="label.kidedu.football"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.kungfu"/>"><font class="fontxlarge"><spring:message code="label.kidedu.kungfu"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.ballet"/>"><font class="fontxlarge"><spring:message code="label.kidedu.ballet"/></font></a></li>

</ul>
</div>
<div class="edu"><font class="fontxxlarge d3-color-orange-2"><spring:message code="label.kidedu.music"/></font><br><br>
<ul class="greendot" ><li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.piano"/>"><font class="fontxlarge"><spring:message code="label.kidedu.piano"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.violin"/>"><font class="fontxlarge"><spring:message code="label.kidedu.violin"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.drum"/>"><font class="fontxlarge"><spring:message code="label.kidedu.drum"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.flute"/>"><font class="fontxlarge"><spring:message code="label.kidedu.flute"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.guitar"/>"><font class="fontxlarge"><spring:message code="label.kidedu.guitar"/></font></a></li>

</ul>

</div>

<div class="edu"><font class="fontxxlarge d3-color-orange-2"><spring:message code="label.kidedu.group"/></font><br><br>
<ul class="greendot" ><li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.drama"/>"><font class="fontxlarge"><spring:message code="label.kidedu.drama"/></font></a></li>
<li><a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code="label.kidedu.choir"/>"><font class="fontxlarge"><spring:message code="label.kidedu.choir"/></font></a></li>

</ul>

</div>
<br class="clear">
<div style="padding-bottom:200px;"></div>
</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>

       
<jsp:include page="../common-footer.jsp"/>

