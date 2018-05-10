<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<c:choose>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'home') || requestScope['javax.servlet.forward.request_uri'] eq '/' }">
    <script language='JavaScript' type='text/javascript'>if (!window.af) var af = (function() {return {getcookie:function(n){var m=n+'=';var ca=document.cookie.split(';');for(var i=0;i < ca.length;i++) {var c=ca[i];while (c.charAt(0)==' ') c = c.substring(1,c.length);if (c.indexOf(m) == 0) return c.substring(m.length,c.length);}return null;},existcookie:function(n){var m=af.getcookie(n);if (m!=null&&m!=''){return true;}else{return false;}}};})(); if(af.existcookie('__AF')){afid = af.getcookie('__AF'); } else {afid = 0; } randomstr = new String (Math.random()); randomstr = randomstr.substring(2,8); document.write("<" + "script language='JavaScript' type='text/javascript' src='"); document.write(('https:' == document.location.protocol ? 'https://' : 'http://')+"servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=656131298162&amp;afid=" + afid);if (document.af_used){document.write("&amp;ex=" + document.af_used);} if(window.location.href){document.write("&amp;location=" + encodeURIComponent(escape(window.location.href)));} if(document.referrer){document.write("&amp;referer=" + encodeURIComponent(escape(document.referrer)));} document.write("'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=656131298162' ><img src='https://servedby.adsfactor.net/adv.php?sid=656131298162' border='0'></a></noscript>
</c:when>
<c:otherwise>
    <script language='JavaScript' type='text/javascript'>if (!window.af) var af = (function() {return {getcookie:function(n){var m=n+'=';var ca=document.cookie.split(';');for(var i=0;i < ca.length;i++) {var c=ca[i];while (c.charAt(0)==' ') c = c.substring(1,c.length);if (c.indexOf(m) == 0) return c.substring(m.length,c.length);}return null;},existcookie:function(n){var m=af.getcookie(n);if (m!=null&&m!=''){return true;}else{return false;}}};})(); if(af.existcookie('__AF')){afid = af.getcookie('__AF'); } else {afid = 0; } randomstr = new String (Math.random()); randomstr = randomstr.substring(2,8); document.write("<" + "script language='JavaScript' type='text/javascript' src='"); document.write(('https:' == document.location.protocol ? 'https://' : 'http://')+"servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=819847944468&amp;afid=" + afid);if (document.af_used){document.write("&amp;ex=" + document.af_used);} if(window.location.href){document.write("&amp;location=" + encodeURIComponent(escape(window.location.href)));} if(document.referrer){document.write("&amp;referer=" + encodeURIComponent(escape(document.referrer)));} document.write("'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=819847944468' ><img src='https://servedby.adsfactor.net/adv.php?sid=819847944468' border='0'></a></noscript>
</c:otherwise>
</c:choose>


<div id="adthree"></div>



