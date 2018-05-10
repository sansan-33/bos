
<%@ include file="common-header.jsp" %>
    
<style>
.formfieldname{
	display: block;float:left;position:relative;min-width:190px;left:20px;
}
</style>

<script type="text/javascript" src="/school/js/ajaxupload.js"></script> 
<script type="text/javascript" charset="utf-8" src="/school/js/jquery.raty.min.js"></script>

<script language="JavaScript" type="text/javascript">

function checkform ( form )
{

  // ** START **
 if (form.namelocal.value == "") {
    alert( "<spring:message code='label.plsinput'/><spring:message code='label.username'/>" );
    form.namelocal.focus();
    return false ;
  }
  if (form.password.value == "") {
	alert( "<spring:message code='label.plsinput'/><spring:message code='label.password'/>" );
    form.password.focus();
    return false ;
  }
  if (form.verify.value == "") {
	alert( "<spring:message code='label.plsinput'/><spring:message code='label.verify'/><spring:message code='label.password'/>" );
    form.verify.focus();
    return false ;
  }
  if (form.verify.value != form.password.value ) {
    alert( "<spring:message code='label.verifypassworderror'/>" );
    form.password.focus();
    return false ;
  }
  if (form.email.value == "") {
	alert( "<spring:message code='label.plsinput'/><spring:message code='label.email'/>" );
	form.email.focus();
    return false ;
  }
  
  if (form.roleid.value == "0" && form.entityid.value == "") {
	alert( "<spring:message code='label.plschoose'/><spring:message code='label.kidschool'/>" );
 	form.entityid.focus();
    return false ;
  }
  if (form.roleid.value == "2" && form.parententityid.value == "") {
		alert( "<spring:message code='label.plschoose'/><spring:message code='label.tutorgraduate'/>" );
	 	form.parententityid.focus();
	    return false ;
	  }
  if(form.roleid.value == "2"){
		
  	if(!$('#sexboy').is(':checked') && !$('#sexgirl').is(':checked')){
  		alert( "<spring:message code='label.plschoose'/><spring:message code='label.sex'/>" );
  	 	form.sex.focus();
  	    return false ;
  	}
  }
  if (form.answer.value == "") {
		alert( "<spring:message code='label.plsinput'/><spring:message code='label.spam'/>" );
	 	form.answer.focus();
	    return false ;
  }
  if(form.roleid.value == "0"){
      form.formsubmitsource.value='bos';
	  form.pollingentityid.value =form.entityid.value;
	  form.metric1.value = $('.metric1').raty('score') * 2;
	  form.metric2.value = $('.metric2').raty('score') * 2;
	  form.metric3.value = $('.metric3').raty('score') * 2;
	  form.metric4.value = $('.metric4').raty('score') * 2;
	  if(form.usercommenttext.value.length < 10 ){
		alert("<spring:message code='warning.notenoughtext'/> ");
		form.usercommenttext.focus();
		return false;
	  }
	  if(form.usercommenttext.value.indexOf("<spring:message code='label.optionalcomment'/>") > 0  ){
			alert("<spring:message code='warning.notenoughtext'/> ");
			form.usercommenttext.focus();
			return false;
	  }	
	  if(isNaN($('.metric1').raty('score') * 2) ){
			alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric1'/> ");
			return false;
	  }
	  if(isNaN($('.metric2').raty('score') * 2) ){
			alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric2'/> ");
			return false;
	  }
	  if(isNaN($('.metric3').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric3'/> ");
		return false;
	  }
	  if(isNaN($('.metric4').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric4'/> ");
		return false;
	  }
	  $('#usercommenttext').val(nl2br($('#usercommenttext').val()));

  }	
  
  setCookie('email', form.email.value);
  setCookie('password', form.password.value);
  // ** END **
  form.submit();
}
function checklogin ( form )
{
 
  if (form.password.value == "") {
	alert( "<spring:message code='label.plsinput'/><spring:message code='label.password'/>" );
	form.password.focus();
    return false ;
  }
  if (form.email.value == "") {
 	alert( "<spring:message code='label.plsinput'/><spring:message code='label.email'/>" );
	form.email.focus();
    return false ;
  }
  
  if (form.remember.checked) {
	  var email = $('#email').attr("value");
	  var password = $('#password').attr("value");
	  // set cookies to expire in 14 days
	  setCookie('email', email);
	  setCookie('password', password);
	  setCookie('remember', true);
  } else {
	  // reset cookies
	  setCookie('email', null);
	  setCookie('password', null);
	  setCookie('remember', null);
  }
  
  // ** END **
  form.submit();
}
function checkreset ( form )
{
 
  if (form.email.value == "") {
    alert( "<spring:message code='label.plsinput'/><spring:message code='label.email'/>" );
    form.email.focus();
    return false ;
  }
 

  // ** END **
  form.submit();
}

function setCookie(key, value) {  
    var expires = new Date();  
    expires.setTime(expires.getTime() + 31536000); //30 days  
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();  
    }  
   
 function getCookie(key) {  
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');  
    return keyValue ? keyValue[2] : null;  
    }  

</script>

<script  type="text/javascript">
$(document).ready(function() {
	<c:if  test="${requestScope.loginType eq 'login' }" >
	var remember = getCookie('remember');
	if ( remember == 'true' ) {
	var email = getCookie('email');
	var password = getCookie('password');
	// autofill the fields
	$('#email').attr("value", email);
	$('#password').attr("value", password);
	}
	</c:if>
	
});
</script>

<!-- activate tabs with JavaScript -->
<script>
  $(function() {
    $("#accordion").tabs(
    "#accordion div.pane",
    {tabs: 'h2', effect: 'slide', initialIndex: null}
  );
    });
  
</script>



<jsp:include page="menu.jsp">
  <jsp:param name="module" value="forminput" />
</jsp:include>


<table  style="margin: auto;"><tr>
	<td><span class="button_grn"><span class="bg_grn gradient" style="color:${requestScope.loginType eq 'signuptutor' ? 'green !important' : 'white'  }" onclick='javascript:{ window.location="/school/controller/loginForm?loginType=signuptutor"; }'><spring:message code="label.signuptutor"/></span></span></td>
	<td><span class="button_grn"><span class="bg_grn gradient" style="color:${requestScope.loginType eq 'signup' ? 'green !important'  : 'white'  }" onclick='javascript:{ window.location="/school/controller/loginForm?loginType=signup&isnew=true"; }'><spring:message code="label.signupparent"/></span></span></td>
	<td><span class="button_grn"><span class="bg_grn gradient" style="color:${requestScope.loginType eq 'resetpassword' ? 'green !important' : 'white'  }" onclick='javascript:{ window.location="/school/controller/loginForm?loginType=resetpassword"; }'><spring:message code="label.forgotpassword"/></span></span></td>
	<td><span><div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div></span></td>
	</tr></table>	
	
<c:choose>
<c:when test="${requestScope.loginType eq 'signup' }">
<div style="padding:15px 15px 15px 60px;width:540px">

  	<h1 style="border-bottom: 1px solid #AFADAC;margin-right:50px;"><spring:message code="label.signupparent"/></h1>
 
	<form name="login" action="/school/controller/login" method="post">
   	<input type="hidden" name="action" value="new">
   	<input type="hidden" name="roleid" value="0">
    <input type="hidden" name="formsubmitsource" value="polling">

	<div class="fontlarge d3-color-gray-2" style="padding:20px 90px 40px 20px;"><spring:message code="label.signupusage"/></div>
	
	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.username"/> :</div>
	<input style="margin-left:10px;width:300px;" type="text" name="namelocal" size="60" value="${requestScope.isnew eq 'true' ? '' :  requestScope.param['namelocal']}" /><br>
    
     <div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.password"/> :</div>
		<input style="margin-left:10px;width:300px;" type="password" name="password" size="60" value="${requestScope.isnew eq 'true' ? '' :  requestScope.param['password']}" /><br>
	
	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.verify"/><spring:message code="label.password"/>:</div>
	<input style="margin-left:10px;width:300px;" type="password" name="verify" size="60" value="${ requestScope.isnew eq 'true' ? '' :  requestScope.param['password']}" /><br>

	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.email"/>:</div>
	<input style="margin-left:10px;width:300px;" type="text" name="email" size="60" value="${ requestScope.isnew eq 'true' ? '' :  requestScope.param['email']}"  />
    <div class="fontlarge d3-color-red" style="padding:3px 0px 00px 200px;"><spring:message code="label.emailaslogin"/></div>
	<br><br><br>
	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.spam"/>:</div>
	<input name="answer" style="width:80px;top:-40px;position:relative;left:12px;" /><img style="top:-20px;position:relative;left:10px;" src="/school/stickyImg" /><br><br>
	
	
	
	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.kidschool"/>:</div> <br>
	<div style="padding:20px 0 20px 25px;"><jsp:include page="common/chainedSelectSchool.jsp"/></div>
	<div style="padding-left:25px">
	<jsp:include page="../jsp/common/pollingembed.jsp"/>
	</div>
	
	<c:if test="${not empty  sessionScope.schoolvstext}">
	<br class="clear">
	<div class="formfieldname font3b d3-color-gray-1"><spring:message code="label.signupviewedtofavorite"/>:</div><br><br>
	<div id="schoolvstext" class="schoolvstext" style="padding: 2px 90px 2px 10px;"> 
        	${sessionScope.schoolvstext}
	</div>
	</c:if>	

	
	<br><br>
	<div style="position:relative;float:right;right:200px;">
	
      <a  href="#" class="btn btn-red tk tk2" onclick='javascript:{ checkform(document.forms["login"]); }'><span><spring:message code="label.submit"/></span></a>
   </div>
	</form>
	<br><br>
	<br><br>
	<br><br>
</div>
</c:when>

<c:when test="${requestScope.loginType eq 'signuptutor' }">
<table style="width:610px;">
<tr>
<td valign="top">
<div class="dbl-bdr"><div class="wrapper large">
  	
  	<h2><spring:message code="label.signuptutor"/></h2>
    <table cellpadding=0 cellspacing=0  >
	<tr><td colspan="3">&nbsp;</td></tr>
	<!-- 
	<tr><td colspan="3"><div class="important"><spring:message code="label.signupusage"/></div></td></tr>
	 -->
	<tr><td colspan="3">&nbsp;</td></tr>
	<!-- 
	<tr><td width="30px">&nbsp;</td>
	<td colspan="2" >
	<div id="upload-area">
				<div class="preview">
					<img id="thumb" width="50px" height="50px" src="/school/userimages/${sessionScope.user['userprofile']}" />
				</div>

				<span class="wrap hotness">
					<form id="imageUploadForm" action="fileUpload" >
						<input type="file" id="imageUpload" name="imageUpload" size="20" /><br>
						<label class="font1"><spring:message code="label.profilepicture"/></label>
					</form>
				</span>
	</div>
	</td></tr>
 -->
 	
	<form name="logintutor" action="/school/controller/login" method="post">
   	<input type="hidden" name="action" value="new">
   	<input type="hidden" name="entityid" value="0">
   	<input type="hidden" name="roleid" value="2">
   	<input type="hidden" name="tutorcategorycount" value="${fn:length(requestScope.tutorCategoryList)}">

	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
	<td width="30px">&nbsp;</td><td width="150px"><font class="font3b  d3-color-gray-1"><spring:message code="label.username"/></font>:</td><td><input style="margin-left:10px;width:300px;" type="text" name="namelocal" size="60" value="${requestScope.param['namelocal']}" /></td>
        </tr>
	<tr>    
           <td width="30px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.password"/></font>:</td><td><input style="margin-left:10px;width:300px;" type="password" name="password" size="60" value="${requestScope.param['password']}" /></td>
	</tr>
	<tr>        
            <td width="30px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.verify"/><spring:message code="label.password"/></font>:</td><td><input style="margin-left:10px;width:300px;" type="password" name="verify" size="60" value="${requestScope.param['password']}" /></td>
	</tr>
    <tr>
	    <td width="30px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.email"/></font>: </td><td><input style="margin-left:10px;width:300px;" type="text" name="email" size="60" value="${requestScope.param['email']}"/></td>
	</tr>
    <tr>
	    <c:set var="boy"><spring:message code='label.boy'/></c:set>
	    <c:set var="girl"><spring:message code='label.girl'/></c:set>
	    
	    <td width="30px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.sex"/></font>: </td><td><span style="padding-left:20px;"></span><input type=radio name=sex id="sexboy" value="<spring:message code='label.boy'/>" ${ requestScope.param['sex'] eq boy  ? "checked" : "" }> <spring:message code='label.boy'/> <input type=radio name=sex id="sexgirl" value="<spring:message code='label.girl'/>" ${ requestScope.param['sex'] eq girl  ? "checked" : "" } > <spring:message code='label.girl'/> </td>
	</tr>
    <tr>
	    <td width="100px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.tutorgraduate"/></font>: </td><td><div style="padding-right:80px"><jsp:include page="common/chainedSelectParentSchool.jsp"/></div></td>
	</tr>
  	<tr>
	<td width="30px">&nbsp;</td><td width="120px"><font class="font3b d3-color-gray-1"><spring:message code="label.tutor"/><spring:message code="label.courseinstrumentcategory"/></font>:</td>
	<td>
    <div id="accordion" style="margin-left:9px;">
	    <c:forEach var="tutorcategory" items="${requestScope.tutorCategoryList}" varStatus="rowCounter">
  			<h2 style="height:30px;" ${ rowCounter.count eq 1 ? 'class=current' : ''}>
  			
  			<c:set var="tutorcategoryidkey">tutorcategoryid${rowCounter.count}</c:set>
  			<label class="tutorcategory${rowCounter.count}"  for="tutorcategory${rowCounter.count}" onclick="tooglecheckbox('${tutorcategoryidkey}');">
			<font class="font3">${rowCounter.count} &nbsp;</font> 
			<input onclick="tooglecheckbox('${tutorcategoryidkey}');" id="${tutorcategoryidkey}" name="${tutorcategoryidkey}" value="${tutorcategory['value']}" type="checkbox" ${not empty requestScope.param[tutorcategoryidkey] ? "checked" : ""} > 
  			${tutorcategory['description']}  </label>
  			
  			</h2>
			<div class="pane" ${ rowCounter.count eq 1 ? 'style="display:block"' : ''} >
			<font class="font1_5_B">${tutorcategory['tooltips']}</font>
			<br class="clearboth"><br class="clearboth">
	    	<img style="padding-left:25px;" src="/school/img/itemlist.png"/> 
	    	<c:choose>
				<c:when test="${tutorcategory['value'] eq 0}">
					<font class="font1" style="padding-right:0px;" ><spring:message code="label.tutorbestedu"/>:</font>
				</c:when>
				<c:otherwise>
					<font class="font1" style="padding-right:23px;" ><spring:message code="label.tutorbestquali"/>:</font> 
				</c:otherwise>
				</c:choose>
				<c:set var="bestdesckey">bestdesc${rowCounter.count}</c:set>
				<c:set var="tutorialexpkey">tutorialexp${rowCounter.count}</c:set>
				
			<input style="margin-left:10px;width:150px;" type="text" name="${bestdesckey}" size="60" value="${requestScope.param[bestdesckey] }" /><br>
			<img style="padding-left:25px;" src="/school/img/itemlist.png"/> <font class="font1" style="padding-right:35px;"><spring:message code="label.tutorialexp"/>:</font> 
			<input style="margin-left:11px;width:150px;" type="text" name="${tutorialexpkey}" size="60" value="${requestScope.param[tutorialexpkey] }" /><br>
		  	</div>
			
		</c:forEach>
		</div>
    </td>
	</tr>
  	
  	<tr>
	<td width="30px">&nbsp;</td><td width="120px" valign="top"><font class="font3b d3-color-gray-1"><spring:message code="label.tutorintro"/></font>:</td>
	<td>
	<textarea name="selfintro" id="selfintro" style="font-size:0.95em;color:rgb(170,170,170);width:345px;height:200px;margin-left:8px;" onclick="clickclear(this, '<spring:message code='label.defaultselfintro'/>');document.getElementById('selfintro').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.defaultselfintro'/>')"><c:choose><c:when test="${ not empty requestScope.param['selfintro'] }">${requestScope.param['selfintro']}</c:when><c:otherwise><spring:message code='label.defaultselfintro'/></c:otherwise></c:choose></textarea> 
   	</td>
	</tr>
  	
    <tr><td colspan="3">&nbsp;</td></tr>
	
    <tr>    
           <td width="30px">&nbsp;</td><td><font class="font3b  d3-color-gray-1"><spring:message code="label.spam"/></font>:</td>
           <td valign="top"><input name="answer" style="width:80px;top:-22px;position:relative;left:7px;" /><img src="/school/stickyImg" /></td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3" align="right">     
 		<a  href="#" class="btn btn-red tk tk2" onclick='javascript:{ checkform(document.forms["logintutor"]); }'>
			<span><spring:message code="label.submit"/></span></a>
       </td>
    </tr>
    
	</table>
	</form>
</div></div>
</td>
</tr>
</table>

</c:when>


<c:when test="${requestScope.loginType eq 'resetpassword' }" >
<table width="610px">
<tr>
<td valign="top">
<div class="dbl-bdr"><div class="wrapper large">
  <h2><spring:message code="label.resetpassword"/></h2>
  <br><br>

	<form name="resetpassword" action="/school/controller/resetPassword" method="post">
   	<table>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td><spring:message code="passwordreset.instruction"/>:</td><td><input type="text" name="email" size="40"/></td>
    </tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	 <tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" align="right">     
       <a  href="#" class="btn btn-red tk tk2" onclick='javascript:{ checkreset(document.forms["resetpassword"]); }'>
			<span><spring:message code="label.resetpassword"/></span></a>
        </td></tr>

	</table>
	</form>
</div></div>
</td>
</tr>
</table>
</c:when>
<c:otherwise>
<table width="600px">
<tr>
<td valign="top">
<div class="dbl-bdr"><div class="wrapper large">
  	<h2><spring:message code="label.login"/></h2>

	<form name="login" action="/school/controller/login" method="post" >
   	<table>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td><spring:message code="label.email"/>:</td><td><input type="text" name="email" size="40" id="email" /></td>
    </tr>
	<tr>    
        <td><spring:message code="label.password"/>:</td><td><input type="password" name="password" size="40" id="password" /></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2"><div class="line-type2-flat"></div></td></tr>
	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td>
			<label style="padding-right:10px;" for="remember"><spring:message code="label.rememberme"/>&nbsp;&nbsp;<input style="margin-top:8px;" type="checkbox" name="remember" id="remember"  checked /></label>
		</td>
		<td align="right">     
        <a  href="#" class="btn btn-red tk tk2" onclick='javascript:{checklogin(document.forms["login"]); }'><span><spring:message code="label.login"/></span></a>
        
        </td>
    </tr>
	</table>
	</form>
</div></div>
</td>
</tr>
</table>
</c:otherwise>
</c:choose>
<jsp:include page="common-footer.jsp"/>
