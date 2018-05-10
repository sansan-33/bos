<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="statusbox">
<img id="closemessage" style="float:right;cursor:pointer"  src="/school/img/cross.png"/>
<div id='message'><c:if test="${not empty requestScope.statusbox}">${requestScope.statusbox}</c:if></div>
</div>
