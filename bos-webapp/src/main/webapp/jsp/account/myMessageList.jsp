<%@ include file="../common-header.jsp" %>
<jsp:include page="../menu.jsp"/>

<jsp:include page="accountMenu.jsp"/>

<div class="container" style="width:550px;margin-left:40px;">
		<c:if test="${requestScope.mode eq 'group' }">
		
			<div class="d3-shadow d3-font d3-color-green-1" style="padding-bottom:5px;"><spring:message code="label.kidschool"/></div>
			<c:forEach var="school" items="${requestScope.myFavoriteSchoolList}" varStatus="rowCounter">
				<c:if test="${ rowCounter.count eq 2 }">
				<div class="d3-shadow d3-font d3-color-green-1" style="padding-bottom:5px;"><spring:message code="label.favoriteschool"/></div>
				</c:if>
				
				<c:set var="idtostring">${school['entityid']}</c:set>
				<div class="commondiv" style="padding: 5px 50px 5px 10px;" onclick="window.location='/school/controller/getMessageDetails?id=${school['entityid']}&type=e&action=compare'">
				<div style="float:left;margin-bottom:25px;margin-right:30px;" >
					<img src="/school/staticimage/CAT${school['categoryid']}/logo_${school['chscid']}.jpg" onerror="ImgError(this);"  width="55px" height="45px"/>
				</div>
			
				<c:if test="${school['inbox'] ne'0' }">
			  	<div style="float:right;margin-right:10px;"><img src="/school/img/d3bubble.png"/><font class="font1 d3-color-gray" >${school['inbox']}</font></div>
				</c:if>
				<span style="float:right;padding-right:15px;">
	  			<a style="position:relative;top:0px;right:0px;padding-left:30px;" href='/school/controller/parentKidListOverlay?entityid=${school["entityid"]}' rel='#overlay_medium'>
				<font style="position:relative;top:8px;display: block; float: right;min-width:35px;" class="font1"> <spring:message code="label.totalusercount"/></font>
			
				<font class="font4b" style="display: block; float: right;position:relative;top:4px;min-width:15px;">${empty requestScope.favoriteCount[idtostring] ? '0' : requestScope.favoriteCount[idtostring] }</font> 
				<img style="position:relative;display: block; float: right;width:15px;height:15px;top:5px;padding-right:5px;" src="/school/img/parentsmall.png">
			
				</a>
				</span>	
			  	
				<a href="/school/controller/getMessageDetails?id=${school['entityid']}&type=e&action=compare">
				<font class="font3 d3-color-gray" >${school['name']}</font><br>
				<font class="font1 d3-color-gray" >${school['nameeng']}</font></a><br>
				<c:if test="${not empty requestScope.lastmessage[idtostring]}">
					<img src="/school/img/quote_icon.png"/><font class="font4N d3-color-gray-2">${requestScope.lastmessage[idtostring]}</font></a><br class="clear">
				</c:if>
				<span class="clear"></span>
				
				</div>
				<div class="line-type2-flat" style="margin-top:3px;margin-bottom:5px;margin-right:50px;"></div>
			</c:forEach>
		</c:if>
		
		<c:if test="${requestScope.mode eq 'single' }">
			<div class="d3-shadow d3-font d3-color-green-1" style="padding-bottom:5px;"><spring:message code="label.friendlist"/></div>
			<c:forEach var="user" items="${requestScope.privateList}" varStatus="rowCounter">
				<c:set var="idtostring">${user['entityid']}</c:set>
				<c:set var="index">${sessionScope.user['id'] eq  user['userid1'] ? '2' : '1' }</c:set>
				<c:set var="userprofile">userprofile${index}</c:set>
				<c:set var="name">name${index}</c:set>
				<c:set var="kidschoolname">kidschoolname${index}</c:set>
				<div class="commondiv" style="padding:5px 50px 5px 10px;" onclick="window.location='/school/controller/getMessageDetails?id=${user['entityid']}&type=private&action=compare'">
			
				<div style="float:left;margin-bottom:28px;margin-right:30px;margin-left:10px;" >
					<img  src="/school/userimages/${user[userprofile]}"  onerror="UserImgError(this);"  width="30px" height="30px"/>
				</div>
				<c:if test="${user['inbox'] ne 0 }">
			  	<div style="float:right;margin-right:10px;"><img src="/school/img/d3bubble.png"/><font class="font1 d3-color-gray" >${user['inbox']}</font></div>
				</c:if>
				<a href="/school/controller/getMessageDetails?id=${user['entityid']}&type=private&action=compare">
				<font class="font3 d3-color-gray" >${user[name]}</font><br>
				<font class="font1 d3-color-gray" ><spring:message code="label.kidparentof" arguments="${user[kidschoolname]}"/></font></a><br>
				<c:if test="${not empty requestScope.lastprivatemessage[idtostring]}">
					<img src="/school/img/quote_icon.png"/><font class="font4N d3-color-gray-2">${requestScope.lastprivatemessage[idtostring]}</font></a><br class="clear">
				</c:if>
				<span class="clear"></span>
				</div>
				<div class="line-type2-flat" style="margin-top:3px;margin-bottom:5px;margin-right:50px;"></div>
				
	
			</c:forEach>
		</c:if>	
	</div>

<jsp:include page="../common-footer.jsp"/>
       
<!-- overlayed element -->
<div class="simple_overlay" id="schoolevent_overlay" style="width:220px;">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
</div>