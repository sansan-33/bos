<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="parent"><spring:message code='label.anonymous'/></c:set>
<c:set var="parentwithname"><spring:message code='label.parent'/>${sessionScope.user['namelocal']}</c:set>

<div id="custompolling">
<div>
<h2><spring:message code="polling.nationaleducationpolling"/></h2>
<form action="saveComment" method="post" name="custompollingform" id="custompollingform" style="padding-left:40px;padding-right:40px;">
	<input type="hidden" name="entityid" value="${requestScope.entityid}" />
	<input type="hidden" name="action" value="compare" />
	<input type="hidden" name="type" value="${requestScope.pollingtype}" />
	<input type="hidden" name="schoolname" value="${compareCategory[15][mapkey15]}" />
	<input type="hidden" name="commenttext" id='commenttext' value='<spring:message code="label.parentrating"/>' />
	<input type="hidden" name="commentsubject" id='commentsubject' value='<spring:message code="label.parentratedsubject" arguments="${empty sessionScope.user ||  sessionScope.user['anonymous'] eq 'y' ? parent : parentwithname }" argumentSeparator=";"/>' />
  	<input type="hidden" name="keywords" id='keywords' value='nationaleducation' />
   	<input type="hidden" name="metric1" value="0" id="metric1" />
    <input type="hidden" name="metric2" value="0" id="metric2" />
    <input type="hidden" name="metric3" value="0" id="metric3" />
    <input type="hidden" name="metric4" value="0" id="metric4" />
    <input type="hidden" name="metric5" value="0" id="metric5" />
    <input type="hidden" name="commentid" value="${requestScope.yourscore['commentid']}" id="commentid" />
    <p style="padding: 20px 10px;">
	    <spring:message code="polling.nationaledu.q1"/>
	    <input type="radio" name="ans1" value="0" onclick="document.forms['custompollingform'].metric1.value='0'" > <spring:message code="polling.agree"/>	
	    <input type="radio" name="ans1" value="1" onclick="document.forms['custompollingform'].metric1.value='1'"> <spring:message code="polling.notagree"/>
		<input type="radio" name="ans1" value="2" onclick="document.forms['custompollingform'].metric1.value='2'" checked> <spring:message code="polling.nocomment"/>
	</p>
	<p style="padding: 0px 10px 20px 10px;">
	    <spring:message code="polling.nationaledu.q2"/>
	    <input type="radio" name="ans2" value="0" onclick="document.forms['custompollingform'].metric2.value='0'"> <spring:message code="polling.yes"/>	
	    <input type="radio" name="ans2" value="1" onclick="document.forms['custompollingform'].metric2.value='1'"> <spring:message code="polling.no"/>
		<input type="radio" name="ans2" value="2" onclick="document.forms['custompollingform'].metric2.value='2'" checked> <spring:message code="polling.noidea"/>
	</p>
    <textarea rows="2" cols="78" class="expand" name="usercommenttext" id="usercommenttext" style="padding-top:8px;font-size:0.95em;color:rgb(170,170,170);width:400px;" onclick="clickclear(this, '<spring:message code='label.optionalcomment'/>');document.getElementById('usercommenttext').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.optionalcomment'/>')">${defaultusercomment}</textarea> 
    <span class="button_grn"><span class="bg_grn gradient" onclick="javascript:submitCustomPolling()"><spring:message code="label.done"/></span></span>
    <br><br><br>
 </form>  
 </div> 	
</div>



<script>
function submitCustomPolling(){
	if(document.forms["custompollingform"].usercommenttext.value.length < 5 ){
		alert("<spring:message code='warning.notenoughtext'/> ");
		return false;
	}
	document.forms["custompollingform"].submit();
}


$(document).ready(function() {
  
    
	$("#custompolling").overlay({
	    top: 160,
	    mask: {
	    color: '#fff',
	    loadSpeed: 200,
	    opacity: 0.5
	    },
	    closeOnClick: false,
	    <c:if test="${requestScope.polled eq 'n' }">
	    load: true,
		</c:if>
	    onClose: function(){
	    	if($('.metric1').raty('score') > 0 ){
			//do nothing		   	
			}else{
				//ajaxRequest("/school/controller/refusepolling/${requestScope.entityid}");
	
			}
    	},
    });
    });
</script>