<%@ page errorPage="/school/jsp/common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:set var="locationhref" scope="application"><%=java.net.URLEncoder.encode("http://" + request.getServerName() + request.getAttribute("javax.servlet.forward.request_uri") + "?" + request.getAttribute("javax.servlet.forward.query_string") ) %></c:set>
<c:set var="GURU_HANG" scope="application" value="false" />


<c:set var="searchresultdesc" value=""/>
<c:if test="${not empty sessionScope.searchCriteria['feeder'] && sessionScope.searchCriteria['feeder'] ne '-1'}"><c:set var="searchresultdesc">${searchresultdesc}<spring:message code="label.feeder"/></c:set></c:if>
<c:if test="${not empty sessionScope.searchCriteria['throughtrain'] && sessionScope.searchCriteria['throughtrain'] ne '-1'}"><c:set var="searchresultdesc" >${searchresultdesc}<spring:message code='label.throughtrain'/></c:set></c:if>
<c:if test="${not empty sessionScope.searchCriteria['nominated'] && sessionScope.searchCriteria['nominated'] ne '-1'}"><c:set var="searchresultdesc">${searchresultdesc}<spring:message code='label.nominated'/></c:set></c:if>
<c:if test="${not empty requestScope.poaschoolnetdesc && requestScope.poaschoolnetdesc ne 'null'}"><c:set var="searchresultdesc">${searchresultdesc}${requestScope.poaschoolnetdesc}</c:set></c:if>
<c:if test="${not empty sessionScope.searchCriteria['financetype'] && sessionScope.searchCriteria['financetype'] ne '-1'}"><c:set var="searchresultdesc" >${searchresultdesc}${sessionScope.searchCriteria['financetype']}</c:set></c:if>
<c:if test="${not empty requestScope.category}"><c:set var="searchresultdesc" >${searchresultdesc}<c:if test="${not empty requestScope.category}"><spring:message code='label.${requestScope.category}'/></c:if><spring:message code='label.ranking'/></c:set></c:if>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<link rel="shortcut icon" href="/school/img/favicon.ico" />
<c:set var="schoolName" value="${requestScope.entityVerticalCategoryList[0]}"/> 
<c:set var="schoolNameKey" value="${schoolName[1]['key']}0"/> <!-- name -->
<c:set var="titleparam" value=""/> <!-- name -->
<c:choose>
<c:when test="${requestScope.mode eq 'search'}"><c:set var="titleparam">${schoolName[1][schoolNameKey]} ${searchresultdesc}</c:set></c:when>
<c:when test="${requestScope.mode eq 'qadetails'}"><c:set var="titleparam">${requestScope.questionAnswerList[0]['SUBJECT']}</c:set></c:when>
<c:when test="${requestScope.mode eq 'details'}"><c:set var="titleparam">${schoolName[1][schoolNameKey]}</c:set></c:when>
<c:when test="${requestScope.mode eq 'calendar'}"><c:set var="titleparam">${requestScope.year} <spring:message code="label.eventcalendar"/> </c:set></c:when>

</c:choose>
<c:set var="sitetitledesc" scope="application" ><spring:message code="label.sitetitledesc"/></c:set>
<c:set var="htmltitle">${fn:trim(titleparam)} ${fn:trim(requestScope.htmltitle)} ${not empty requestScope.htmltitle ? " - " : "" }<spring:message code="label.sitename"/> ${fn:length(requestScope.htmltitle) > 0 || fn:length(titleparam) > 0 ? '' :  sitetitledesc}</c:set>
<title>${fn:trim(htmltitle)}</title>


 <META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">
 <meta property="og:image" content="http://www.bookofschool.com/school/img/logo_bos_fb.jpg" />
 <c:choose>
	<c:when  test="${not empty requestScope.htmlkeywords }">
   	<meta name="description" content="${requestScope.htmldesc}"/>
   	<meta name="keywords" content="${requestScope.htmlkeywords}"/>
  	<meta name="robots" content="${requestScope.htmlrobots}"/>
  	<meta name="googlebot" content="${requestScope.htmlgooglebot}"/>
  	</c:when>
  	
	<c:when  test="${not empty requestScope.systemcomment[0]['metadesc']}">
   	<meta name="description" content="${requestScope.systemcomment[0]['metadesc']}"/>
   	<meta name="keywords" content="${requestScope.systemcomment[0]['keywords']}"/>
  	<meta name="robots" content="${requestScope.systemcomment[0]['keywords']}"/>
  	<meta name="googlebot" content="${requestScope.systemcomment[0]['keywords']}"/>
  	</c:when>
  	<c:when  test="${not empty requestScope.searchmodeactive}">
  	<meta name="description" content="<c:if test="${sessionScope.searchCriteria['feeder'] ne '-1'}"><spring:message code="label.feeder"/></c:if><c:if test="${sessionScope.searchCriteria['throughtrain'] ne '-1'}"><spring:message code="label.throughtrain"/></c:if><c:if test="${sessionScope.searchCriteria['nominated'] ne '-1'}"><spring:message code="label.nominated"/></c:if><c:if test="${requestScope.poaschoolnetdesc ne 'null'}">${requestScope.poaschoolnetdesc}</c:if><c:if test="${sessionScope.searchCriteria['financetype'] ne '-1'}">${sessionScope.searchCriteria['financetype']}</c:if><c:if test="${not empty requestScope.category}"><spring:message code='label.${requestScope.category}'/></c:if><spring:message code='label.ranking'/> "/>
    <meta name="keywords" content="<c:if test="${sessionScope.searchCriteria['feeder'] ne '-1'}"><spring:message code="label.feeder"/></c:if><c:if test="${sessionScope.searchCriteria['throughtrain'] ne '-1'}"><spring:message code="label.throughtrain"/></c:if><c:if test="${sessionScope.searchCriteria['nominated'] ne '-1'}"><spring:message code="label.nominated"/></c:if><c:if test="${requestScope.poaschoolnetdesc ne 'null'}">${requestScope.poaschoolnetdesc}</c:if><c:if test="${sessionScope.searchCriteria['financetype'] ne '-1'}">${sessionScope.searchCriteria['financetype']}</c:if><c:if test="${not empty requestScope.category}"><spring:message code='label.${requestScope.category}'/></c:if><spring:message code='label.ranking'/>"/>
	<meta name="robots" content="<c:if test="${sessionScope.searchCriteria['feeder'] ne '-1'}"><spring:message code="label.feeder"/></c:if><c:if test="${sessionScope.searchCriteria['throughtrain'] ne '-1'}"><spring:message code="label.throughtrain"/></c:if><c:if test="${sessionScope.searchCriteria['nominated'] ne '-1'}"><spring:message code="label.nominated"/></c:if><c:if test="${requestScope.poaschoolnetdesc ne 'null'}">${requestScope.poaschoolnetdesc}</c:if><c:if test="${sessionScope.searchCriteria['financetype'] ne '-1'}">${sessionScope.searchCriteria['financetype']}</c:if><c:if test="${not empty requestScope.category}"><spring:message code='label.${requestScope.category}'/></c:if><spring:message code='label.ranking'/>"/>
  	<meta name="googlebot" content="<c:if test="${sessionScope.searchCriteria['feeder'] ne '-1'}"><spring:message code="label.feeder"/></c:if><c:if test="${sessionScope.searchCriteria['throughtrain'] ne '-1'}"><spring:message code="label.throughtrain"/></c:if><c:if test="${sessionScope.searchCriteria['nominated'] ne '-1'}"><spring:message code="label.nominated"/></c:if><c:if test="${requestScope.poaschoolnetdesc ne 'null'}">${requestScope.poaschoolnetdesc}</c:if><c:if test="${sessionScope.searchCriteria['financetype'] ne '-1'}">${sessionScope.searchCriteria['financetype']}</c:if><c:if test="${not empty requestScope.category}"><spring:message code='label.${requestScope.category}'/></c:if><spring:message code='label.ranking'/>"/>

  	</c:when>
  	<c:when  test="${not empty requestScope.questionAnswerList[0]['SUBJECT']}">
    <meta name="description" content="${requestScope.questionAnswerList[0]['SUBJECT']}"/>
    <meta name="keywords" content="${requestScope.questionAnswerList[0]['SUBJECT']}"/>
  	<meta name="robots" content="${requestScope.questionAnswerList[0]['SUBJECT']}"/>
  	<meta name="googlebot" content="${requestScope.questionAnswerList[0]['SUBJECT']}"/>
  	</c:when>
  	<c:when  test="${not empty schoolName[1][schoolNameKey]}">
    <meta name="description" content="${schoolName[1][schoolNameKey]}"/>
    <meta name="keywords" content="${schoolName[1][schoolNameKey]}"/>
	<meta name="robots" content="${schoolName[1][schoolNameKey]}"/>
  	<meta name="googlebot" content="${schoolName[1][schoolNameKey]}"/>
	</c:when>
  	<c:otherwise>
  	<meta name="description" content='<spring:message code="meta.desc"/>'/>
    <meta name="keywords" content="<spring:message code='meta.keywords'/>"/>
	<meta name="robots" content="<spring:message code='meta.keywords'/>"/>
  	<meta name="googlebot" content="<spring:message code='meta.keywords'/>"/>
	</c:otherwise>
</c:choose>


 
  	<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bos.min.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/nav.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/search.css'>
	<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/datatable.css'>
    <LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bubble.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/kiwi.css'>


<script src='https://s.yimg.com/uv/dm/scripts/syndication.js'></script>
<script src="/school/js/bos.js"  djConfig="parseOnLoad: true"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="/school/js/apple.search.js"  djConfig="parseOnLoad: true"></script>
<script src="/school/js/jquery.tools.min.js"></script>
<script src="/school/js/jquery-ui.custom.min.js"></script>

<c:if test="${ not fn:contains(requestScope['javax.servlet.forward.request_uri'],'entityDetails') }">
    <script type="text/javascript" src="/school/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/school/js/jquery.dataTables.min.bootstrap.js"></script>
</c:if>


<script type="text/javascript" language="javascript" src="/school/js/jquery.dropdownPlain.js"></script>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/menu.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bosfont.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/bosd3.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/breadcrumb.css'>


<script type="text/javascript" language="javascript">

    google.load("feeds", "1") //Load Google Ajax Feed API (version 1)
    var overlayElem;

$(document).ready(function()
{
    var updateTimer = 0;
	var timer=0;
    var input = '<img';

    <c:if test="${empty requestScope.statusbox}">
	 		$('#statusbox').hide();
    </c:if>
	if($('#message').is(':empty')){
	 	$('#statusbox').hide();
    }
	//scroll the message box to the top offset of browser's scrool bar
	$(window).scroll(function()
	{
  		$('#statusbox').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350}); 
	
	});
        //when the close button at right corner of the message box is clicked 
	$('#closemessage').click(function()
	{
  		//the messagebox gets scrool down with top property and gets hidden with zero opacity 
		$('#statusbox').hide();
	});
    $('#appsclosemessage').click(function()
	{
  		$('#appsbox').hide();
	});


    if(isMobileDevice()){
        $('#appsbox').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 550},"slow");
        $('#appsbox').show();
        setTimeout(function() {$('#appsbox').fadeOut('slow');}, 8000);
    }

});

function showMessage(message){
		$("#message").text(message);
		$('#statusbox').animate({top:$(window).scrollTop()+"px",opacity:100},{queue: false, duration: 350},"slow"); 
		$('#statusbox').show();
		setTimeout(function() {$('#statusbox').fadeOut('slow');}, 5000); 
	  }
</script>
		

<!-- Place this render call where appropriate -->
<script type="text/javascript">
  window.___gcfg = {lang: 'zh-TW'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>

<c:if test="${ not fn:contains(pageContext.request.serverName ,'localhost')}">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-28080773-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</c:if>


</HEAD>

<body class="tundra">

<div id="backupads"></div>

<c:if test="${ not fn:contains(pageContext.request.serverName ,'localhost')}">
<div id="fb-root"></div>
<script>

window.fbAsyncInit = function() {
    FB.init({
      appId      : '263990090354164',
      channelUrl : '//WWW.BOOKOFSCHOOL.COM/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

  
  $(document).ready(function(){
  
    FB.Event.subscribe('auth.login', function(response) {
  	   login();
  	});
  	FB.Event.subscribe('auth.logout', function(response) {
  	   logout();
  	});
  	FB.getLoginStatus(function(response) {
  	   if (response.session) {
  	      greet();
  	   }
  	});
	 
  });
  
  function login(){
	   FB.api('/me', function(response) {
		 ajaxRequest('/school/controller/sociallogin/' + response.id + '/socialfbid/'+ response.name + '/' + response.email + '/' + Math.random()*Math.random()); 
		 //document.getElementById("favoritecount").innerHTML = '<spring:message code="label.favorite"/> (${sessionScope.favoritecount})';
		 console.log('You have successfully logged in, '+response.name + ' / ' + response.id + '/' + response.email);
		 //location.reload(true);
 	   });
  }
   function logout(){
	   
	   ajaxRequest('/school/controller/sociallogout/' + Math.random()*Math.random());
	   console.log('You have successfully logged out!');
	}
	function greet(){
	   FB.api('/me', function(response) {
		   console.log('Welcome, '+response.name + ' / ' + response.id + '/' + response.email);
	   });
	}
  
</script>
</c:if>


