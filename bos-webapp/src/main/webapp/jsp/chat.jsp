<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

  	
<script  type="text/javascript">
$(document).ready(function() {
	
	$('textarea.expand').focus(function () {
	    $(this).animate({ height: "8em" }, 500);
	});
	
	$('textarea.expand').blur(function() {
		$(this).animate({ height: "2.4em" }, 500);
	});
});

</script>


<script type="text/javascript" charset="utf-8">
function submitChatForm(){
	
	if(document.forms["chatform"].questionanswer.value != "" || document.forms["chatform"].refresh.value =='y'){

		document.forms["chatform"].isrobot.value = 'bos';
		$.post("/school/controller/saveQuestionAnswerAJAX" , $("#chatform").serialize() , function(data) { // Do an AJAX call
			//console.log(data);
			$('#chatmsg').html(data);
			//console.log('post done');
			
			document.forms["chatform"].questionanswer.value = '';


		});
		
	}
	
	
}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- tutor -->
<a name="chatmsg-ap"></a>
<div id="tutorcourse">
  <div style="padding-left:3px;background-color: #EFEFEF;">
    		<form action="saveQuestionAnswer" method="post" name="chatform" id="chatform" >
					
					<input type="hidden" name="touchtableid" value="${requestScope.touchtableid}" />
					<input type="hidden" name="touchtablename" value="${requestScope.touchtablename}" />
					<input type="hidden" name="style" value="${requestScope.style}" />
					<input type="hidden" name="refresh" value="n" />
					<input type="hidden" name="isrobot" value="n" />
                    <input type="hidden" name="chatlistsize" value="n" />
					<input type="hidden" name="viewname" value="chat" />
					<input type="hidden" name="entityid" value="${requestScope.entityid}" />
					<input type="hidden" name="type" value="${requestScope.type}" />
					<input type="hidden" name="subject" value='<spring:message code="label.chat" />' />
					<input type="hidden" name="parentid" value="${not empty requestScope.questionanswerid && requestScope.questionanswerid > 0 ? requestScope.questionanswerid : 0}" />
					<c:if test="${requestScope.type eq 'case' || requestScope.type eq 'cms' || requestScope.type eq 'private' || requestScope.type eq 'event' } ">
					<p style="padding-left:10px;padding-top:10px;"> <a href="#chatmsg-ap" class="afont2b" onclick="document.forms['chatform'].refresh.value='y';document.forms['chatform'].chatlistsize.value='all';submitChatForm();" ><spring:message code="label.viewallcount" arguments="${not empty requestScope.chatmsgcount ? requestScope.chatmsgcount : 0 }" argumentSeparator=";"/></a>
					</c:if>
					<c:if test="${not empty requestScope.chattitle }">
						<div class="dbl-bdr"><div class="wrapper">
							<div class="title parbase"><div class="custom-title tk"><div class="ib">
		        
					            <span class="category">
					                ${requestScope.chattitle}
					            </span>
			        	
			        	 
					        	<div class="ib">
					            <span class="custom-title-line custom-title-line__l" ></span>
					            <font class="title fontbold">
					                <spring:message code="label.discussionforum"/>
					            </font>
					            <span class="custom-title-line custom-title-line__r"></span>
					        	</div>
		        	 
		    				</div></div></div>
						</div></div>
					
					</c:if>
					
					<c:if test="${requestScope.refreshdisabled ne 'y'}">
					<a href="#chatmsg-ap" onclick="document.forms['chatform'].refresh.value='y';submitChatForm();" style="position:relative;top:15px;right:0px;float:right">
					<img style="width:20px;height:20px;" src="/school/img/refresh.png"  />
					</a>
					</c:if>
				
				    <img style="float:left;position:relative;top:10px;margin-left:${requestScope.type eq 'e' ? '2': '18'}px;margin-right:2px;" id="thumb" width="${requestScope.type eq 'e' ? '25': '35'}px" height="${requestScope.type eq 'e' ? '25': '35'}px" src="/school/userimages/${sessionScope.user['userprofile']}" onerror="UserImgError(this);" />
					<textarea class="expand" name="questionanswer" id="questionanswer" style="font-size:0.95em;color:rgb(170,170,170);width:${not empty requestScope.textareawidth ? requestScope.textareawidth : 150 }px;height:${not empty requestScope.textareaheight ? requestScope.textareaheight : 2.4 }em;margin-left:5px;margin-top:10px;float:left;position:relative;"   onclick="clickclear(this, '<spring:message code='label.addareply'/>');document.getElementById('questionanswer').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.addareply'/>')" ><spring:message code='label.addareply'/></textarea>
					<div style="position:relative;top:10px;left:1px;float:left">
						<a   class="btn btn-red tk tk2" onclick="document.forms['chatform'].refresh.value='n';submitChatForm()">
						<span class="fontwhite" ><spring:message code="label.submit"/></span></a></div>
					<br class="clear"/><br class="clear"/>
					<div class="border-bottom-gray"></div>
					<br class="clear"/><br class="clear"/>
					<c:if test="${requestScope.type eq 'e'}">
					<div style="height:250px;overflow-x:hidden;overflow-y:scroll;background-color: #EFEFEF;">
					</c:if>
					<div id="chatmsg" class="chatmsg" > 
						${requestScope.chatmsg}
					</div>
					<c:if test="${requestScope.type eq 'e'}">
					</div>
					</c:if>
			</FORM>

    		
    
    <br><br><br>
    
  </div>
</div>