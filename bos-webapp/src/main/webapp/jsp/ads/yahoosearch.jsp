<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form method="GET" action="/school/controller/yahooSponsorSearch">
<div style="text-align:left;padding:0px 2px 10px 2px;">
<input type="text" name="keywords" style="width:180px">
<input class="yahoosearchbtn" type=submit value="<spring:message code='label.search'/>">
<br><br>
<span face="Tahoma" style="font-size: 9pt;padding-top:10px;">
<spring:message code='label.yahoohot'/> : <a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code='label.yahoohotkeywords1'/>"><spring:message code='label.yahoohotkeywords1'/></a> <a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code='label.yahoohotkeywords2'/>"><spring:message code='label.yahoohotkeywords2'/></a> <a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code='label.yahoohotkeywords3'/>"><spring:message code='label.yahoohotkeywords3'/></a> <a href="/school/controller/yahooSponsorSearch?keywords=<spring:message code='label.yahoohotkeywords4'/>"><spring:message code='label.yahoohotkeywords4'/></a>
</span>
</div>
</form>
