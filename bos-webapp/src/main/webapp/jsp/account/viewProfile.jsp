<%@ include file="../common-header.jsp" %>
<jsp:include page="../menu.jsp"/>

<script type="text/javascript" src="/school/js/jquery.corner.js"></script>

<script type="text/javascript" language="javascript">
$('div.body-background').corner();
</script>



<div class="body-background" style="float:left;position:relative;">
			
			<img style="float:left;position:relative;padding-left:30px;" id="thumb" width="60px" height="60px;" src="/school/userimages/${requestScope.user['userprofile']}" onerror="UserImgError(this);" />
			<div style="position:relative;float:left;left:20px;top:5px;" >
			<div  class="d3-font d3-color-white">
					${requestScope.user['namelocal']}<br>
					<img style="width:22px;height:25px;padding-right:10px;" src="/school/img/${requestScope.user['bosrank']}"><span class="font6 d3-font-bold d3-shadow" style="position:relative;top:-4px;">${requestScope.user['userscore']}</span><br>
				  	<c:choose>
				  		<c:when test="${not empty requestScope.user['name'] }">
				  			<font class="font1">${requestScope.user['name']}<spring:message code="label.parent"/></font>
				  		</c:when>
				  		<c:otherwise>
				  			<font class="font1">${requestScope.user['nameparententity']}</font>
				  		</c:otherwise>
				  	</c:choose>
			</div>
			
			</div>
			<c:if test="${sessionScope.user['id'] ne requestScope.user['id'] }">
				<div style="position:relative;float:right;right:10px;top:0px;">
				<c:set var="submitform">javascript:{ submitChatForm(); }</c:set>
				<c:set var="alert">alert("<spring:message code="label.pleaselogin"/>");</c:set>
				 <span class="button_grn"><span class="bg_grn gradient" onclick='${not empty sessionScope.user ? submitform : alert }'><spring:message code="label.addfriend"/></span></span>
	        	</div>
        	</c:if>
        	
        	
    				
    				
			<br class="clear"/><br class="clear"/>
				<div class="content-background" style="position:relative;left:0px;">
					<div  class="d3-font d3-color-green-3" style="padding:30px;"> 
						<div><spring:message code="label.userjoindate"/> : <font class="d3-color-white d3-font-bold d3-shadow">${requestScope.user['created']}</font></div>
						
						<div  ><spring:message code="label.noofdayvisited"/> : <font class="d3-color-white d3-font-bold d3-shadow">${requestScope.user['logincount']}</font></div>
						<div class="commondiv" onclick="javascript:{window.location='/school/controller/getMyForumContentList?userid=${requestScope.user['id']}&isparentrating=y&tab=posttab'}"><spring:message code="label.parentrating"/> : <font class="d3-color-white d3-font-bold d3-shadow">${requestScope.user['parentratingcount']}</font></div>
						<div class="commondiv" onclick="javascript:{window.location='/school/controller/getMyForumContentList?userid=${requestScope.user['id']}&tab=posttab'}"><spring:message code="label.publishpost"/> : <font class="d3-color-white d3-font-bold d3-shadow">${empty requestScope.user['postcount'] ? '0' : requestScope.user['postcount'] }</font></div>
						<div class="commondiv" onclick="javascript:{window.location='/school/controller/getCaseSharingList?view=viewprofile&userid=${requestScope.user['id']}'}"><spring:message code="label.casesharing"/> : <font class="d3-color-white d3-font-bold d3-shadow">${empty requestScope.user['casesharingcount'] ? '0' : requestScope.user['casesharingcount'] }</font></div>
					</div>
				</div>
			</div>
			
<jsp:include page="../common-footer.jsp"/>
       
			<form action="saveQuestionAnswer" method="post" name="chatformactive" id="chatformactive" >
					<input type="hidden" name="userid" value="${requestScope.user['id']}" />
					<input type="hidden" name="userid" value="${sessionScope.user['id']}" />
					<input type="hidden" name="type" value="private" />
					<input type="hidden" name="entityid" value="" />
					<input type="hidden" name="channeltype" value="single" />
					<input type="hidden" name="createchannel" value="y" />
					<input type="hidden" name="subject" value='addfriend' />
					<input type="hidden" name="refresh" value='n' />
					<input type="hidden" name="parentid" value="0" />
					<input type="hidden" name="channelname" id="channelname" value="<spring:message code="label.message" />:${requestScope.user['namelocal']}+${sessionScope.user['namelocal']}"/>
					<input type="hidden" name="questionanswer" id="questionanswer" value="<spring:message code="label.addfriendactive" arguments="${requestScope.user['namelocal']}"  />"/>
			</form>
			
<script type="text/javascript" charset="utf-8">
function submitChatForm(){
	
		$.post("/school/controller/saveQuestionAnswerAJAX" , $("#chatformactive").serialize() , function(data) { // Do an AJAX call
			console.log(data);
			$('#friend').html(data);
			console.log('post done');
			
		});
		
		 showMessage('<spring:message code="label.addfriendactive" arguments="${requestScope.user['namelocal']}"  />');
	
	
}
</script>