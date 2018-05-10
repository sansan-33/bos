<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/tabs.css'>


<div style="width:600px;position:relative;top:-1px;left:5px;background:white;"> 


	<div style="padding:10px;">
		<a  style="float:left;position:relative;" href="/school/controller/viewProfile?userid=${sessionScope.user['id']}">
			<img  width="70px" height="70px" src="/school/userimages/${sessionScope.user['userprofile']}" onerror="UserImgError(this);" />
		</a>
		<div style="float:left;position:relative;left:10px;top:5px;">
			<font class="font5 d3-color-gray-1">${sessionScope.user['namelocal']}</font>
			<br><font class="font5 d3-color-yellow-1"><spring:message code="label.userscore"/><img style="padding-left:5px;width:14px;height:16px;" src="/school/img/${sessionScope.user['rank']}"/> : ${sessionScope.user['userscore']}</font>
			<br><font class="font1 d3-color-blue" style="padding-left:5px;"><spring:message code="label.userjoindate"/> : <fmt:formatDate pattern="dd-MMM-yyyy" value="${sessionScope.user['created']}" /></font>
		</div>
		<div style="float:right;position:relative;">
			<img src="/school/staticimage/CAT${requestScope.school['categoryid']}/logo_${requestScope.school['chscid']}.jpg" onerror="ImgError(this);"  width="55px" height="45px"/>
		</div>
	</div>		
	<br class="clear"/><br class="clear"/>
	
	<div id="container" style="width:600px;position:relative;top:0px;left:0px;background:rgb(233,233,233);padding:5px 5px 5px 5px; "> 
 
	<ul class="menumain" >  
            <li id="favorite" ${requestScope.tab eq 'favoritetab' ? 'class="active"' : '' }><a href="/school/controller/myFavoriteConsole?action=favorite&tab=favoritetab"><img style="width:13px;height:13px;top:1px;position:relative;" src="/school/img/favorite24.png"/><spring:message code="label.favorite"/><c:if test="${not empty sessionScope.favoritecount}"> (${sessionScope.favoritecount})</c:if></a></li>  
            <li id="profile" ${requestScope.tab eq 'profiletab' ? 'class="active"' : '' }><a href="/school/controller/accountInfo?tab=profiletab"><spring:message code="label.profile"/></a></li> 
            <li id="post" ${requestScope.tab eq 'posttab' ? 'class="active"' : '' }><a  href="/school/controller/getMyForumContentList?tab=posttab"><spring:message code="label.post"/></a></li> 
            <li id="message" ${requestScope.tab eq 'groupmessagetab' ? 'class="active"' : '' }><a href="/school/controller/getMessageUserList?mode=group&tab=groupmessagetab"><spring:message code="label.groupmessage"/></a></li> 
            <li id="message" ${requestScope.tab eq 'privatemessagetab' ? 'class="active"' : '' }><a href="/school/controller/getMessageUserList?mode=single&tab=privatemessagetab"><img style="padding-right:4px;" src="/school/img/visitors.png"/><span><spring:message code="label.message"/></a></li> 
    </ul>
    
    <span class="clear"></span>  
    <div></div>
	</div>



</div>




