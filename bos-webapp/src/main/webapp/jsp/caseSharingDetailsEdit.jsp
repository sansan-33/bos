<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:useBean id="date" class="java.util.Date" />

<c:set var="htmltitle" scope="request"><spring:message code="label.casesharing"/> ${requestScope.casedetails['title']}</c:set>
<c:set var="htmlkeywords" scope="request"><spring:message code="label.casesharing"/>,${requestScope.casedetails['title']}</c:set>
<c:set var="htmldesc" scope="request"><spring:message code="label.casesharing"/> ${requestScope.casedetails['title']}</c:set>
<c:set var="htmlrobots" scope="request"><spring:message code="label.casesharing"/>, ${requestScope.casedetails['title']}</c:set>
<c:set var="htmlgooglebot" scope="request"><spring:message code="label.casesharing"/>, ${requestScope.casedetails['title']}</c:set>

<%@ include file="common-header.jsp" %>

<c:set var="currentyear"><fmt:formatDate value="${date}" pattern="yyyy" /></c:set>


<script type="text/javascript" src="/school/js/ajaxupload.js"></script> 
<script src="/school/js/jquery.corner.js"></script>
  	
  	
<script>

  $(document).ready(function(){
	  

	  
	  	$('#casecontent').corner();
	  	document.forms['case'].title.focus();
	  	loadEntityId('${requestScope.appliedschoolofferids}','${requestScope.appliedschooloffernames}','appliedschooloffer');
	  	loadEntityId('${requestScope.appliedschoolids}','${requestScope.appliedschoolnames}','appliedschool');
	  	
	  	var thumb1 = $('img#thumb1');	
	  	new AjaxUpload('imageUpload1', {
			action: $('form#imageUploadForm1').attr('action'),
			name: 'imageUpload',
			data: {"imagekey":"casesharing1"},
			cache: false,
			onSubmit: function(file, extension) {
				$('div.preview1').addClass('loading');
				console.log("loading");
			},
			onComplete: function(file, response) {
				thumb1.load(function(){
					$('div.preview1').removeClass('loading');
					thumb1.unbind();
				});
				thumb1.attr('src', response + '&' +  Math.random()*Math.random());
			}
		});
	  	
	  	var thumb2 = $('img#thumb2');	
	  	new AjaxUpload('imageUpload2', {
			action: $('form#imageUploadForm2').attr('action'),
			name: 'imageUpload',
			data: {"imagekey":"casesharing2"},
			cache: false,
			onSubmit: function(file, extension) {
				$('div.preview2').addClass('loading');
				console.log("loading");
			},
			onComplete: function(file, response) {
				thumb2.load(function(){
					$('div.preview2').removeClass('loading');
					thumb2.unbind();
				});
				thumb2.attr('src', response + '&' +  Math.random()*Math.random());
				console.log("done");
				
			}
		});
	  	
	  	var thumb3 = $('img#thumb3');	
	  	new AjaxUpload('imageUpload3', {
			action: $('form#imageUploadForm3').attr('action'),
			name: 'imageUpload',
			data: {"imagekey":"casesharing3"},
			cache: false,
			onSubmit: function(file, extension) {
				$('div.preview3').addClass('loading');
				console.log("loading");
			},
			onComplete: function(file, response) {
				thumb3.load(function(){
					$('div.preview3').removeClass('loading');
					thumb3.unbind();
				});
				thumb3.attr('src', response + '&' +  Math.random()*Math.random());
				console.log("done");
				
			}
		});
	});

</script>

<script language="JavaScript" type="text/javascript">
<!--
function checkform (form)
{
	$("#content").val($("#editor").val());
	var desc = $("#photodesc1").val();
	$("#imgdesc1").val(desc);
	desc = $("#photodesc2").val();
	$("#imgdesc2").val(desc);
	desc = $("#photodesc3").val();
	$("#imgdesc3").val(desc);
	
	var payee = $("#displaypayeename").val(); 
	$("#payeename").val(payee);
	
	if (form.currententity.value == "") {
    	alert( "<spring:message code='label.plschoose'/><spring:message code='label.currentschool'/>" );
    	form.currententity.focus();
    	return false ;
  	}
 	if (form.firstchoice.value == "") {
    	alert( "<spring:message code='label.plschoose'/><spring:message code='label.firstchoice'/>" );
    	form.firstchoice.focus();
    	return false ;
  	}
 	if (form.finalentity.value == "") {
    	alert( "<spring:message code='label.plschoose'/><spring:message code='label.finalchoose'/>" );
    	form.finalentity.focus();
    	return false ;
  	}
 	
	
	// Check all the fileds if parent going to publish
	if(form.publish.value == "y"){
		if (form.title.value == "") {
	    	alert( "<spring:message code='label.plsinput'/> <spring:message code='label.title'/>" );
	    	form.title.focus();
	    	return false ;
	  	}
	 	if (form.analysis.value == "") {
	    	alert( "<spring:message code='label.plsinput'/> <spring:message code='label.strategy'/>" );
	    	form.analysis.focus();
	    	return false ;
	  	}
	 	if (form.age.value == "") {
	    	alert( "<spring:message code='label.plschoose'/> <spring:message code='label.age'/>" );
	    	form.age.focus();
	    	return false ;
	  	}
		if (form.monthofbirth.value == "") {
	    	alert( "<spring:message code='label.plschoose'/> <spring:message code='label.monthofbirth'/>" );
	    	form.monthofbirth.focus();
	    	return false ;
	  	}
		if(!$('input:radio[name=sex]:checked').is(':checked')){
			alert( "<spring:message code='label.plschoose'/> <spring:message code='label.sex'/>" );
	    	form.sex.focus();
	    	return false ;
		}
		if(!$('input:radio[name=bigsmallkid]:checked').is(':checked')){
			alert( "<spring:message code='label.plschoose'/> <spring:message code='label.bigkid'/> / <spring:message code='label.smallkid'/>" );
	    	form.bigsmallkid.focus();
	    	return false ;
		}
		
		
	 	if (form.characterkid.value == "") {
	    	alert( "<spring:message code='label.plsinput'/> <spring:message code='label.character'/>" );
	    	form.characterkid.focus();
	    	return false ;
	  	}
	 	if (form.applicationresult.value == "") {
	    	alert( "<spring:message code='label.plsinput'/> <spring:message code='label.applicationresult'/>" );
	    	form.applicationresult.focus();
	    	return false ;
	  	}
	 	if (form.appliedschooloffer.value == "" && form.appliedschool.value == "") {
	    	alert( "<spring:message code='label.plschoose'/> <spring:message code='label.appliedschool'/>" );
	    	$('#appliedschoolfocus').css('border', 'solid 1px red');
	    	return false ;
	  	}
	 	if (form.content.value == "") {
	    	alert( "<spring:message code='label.plsinput'/><spring:message code='label.details'/>" );
	    	form.content.focus();
	    	return false ;
	  	}
	 	if (form.content.value.length > 2000 || form.content.value.length < 20) {
	    	alert( "<spring:message code='alert.content.size'/>" );
	    	form.content.focus();
	    	return false ;
	  	}
	 	
	 	if (form.payeename.value == "") {
	    	alert( "<spring:message code='label.plsinput'/><spring:message code='label.payeename'/>" );
	    	form.displaypayeename.focus();
	    	return false ;
	  	}
	}
 	form.submit();
  	// ** END **
}
//-->
</script>

<c:set var="labelpleaseselectschool"><spring:message code="label.reversesearchselect"/></c:set>

<jsp:include page="menu.jsp"/>
	<c:choose>
		<c:when test="${empty sessionScope.user }">
		<div class="important"><spring:message code="label.pleaselogin"/></div><br>
		<table style="margin: auto;">
				<tr>
				<td><span class="button_grn"><span class="bg_grn gradient" onclick='window.location="/school/controller/loginForm?loginType=signup"'><spring:message code="label.signup"/></span></span></td>
				<td><span style="padding-left:10px;padding-right:20px;"><spring:message code="label.or"/></span></td>
				<td><span class="button_grn"><span class="bg_grn gradient" onclick='window.location="/school/controller/loginForm?loginType=login"'><spring:message code="label.login"/></span></span></td>
				</tr>
		</table>
				
		</c:when>
		<c:otherwise>
				<c:if test="${sessionScope.user['roleid'] eq 1 }">
						<div style="position:relative;float:right;padding-right:15px;">
						<input type=radio name="view" value="approve"  onclick='javascript:{ window.location="/school/controller/approveCase?view=all&approved=y&id=${requestScope.casedetails["caseid"]}"; }' > <spring:message code='label.approved'/>
						<input type=radio name="view" value="waitingapproval"  onclick='javascript:{ window.location="/school/controller/approveCase?view=mycasesharing&approved=w&id=${requestScope.casedetails["caseid"]}"; }' > <spring:message code='label.waiting'/>
						<input type=radio name="view" value="rejected"  onclick='javascript:{ window.location="/school/controller/approveCase?view=mycasesharing&approved=r&id=${requestScope.casedetails["caseid"]}"; }' > <spring:message code='label.rejected'/>
						</div>
				</c:if>
				<br class="clear"/><br class="clear"/><br class="clear"/>
				<div class="wrapper" style="width:600px;">
				<div><img src="/school/img/top.gif" alt="" width="600" height="4" border="0" style="display:block;margin:0;"></div>
				<div class="d3-color-gray-1" style="display:block;margin:0;height:12px;padding-top:30px;padding-left:15px;padding-top:5px;border-left: 1px solid #DADADA;border-right: 1px solid #DADADA;background:  rgb(233,233,233) !important;"><br><spring:message code="label.casesharing.step1"/></div>
			  	<div class="db-detail-box colors-subtle item-detail-box icon-size-default" style="background:  #f2f2f2 !important;">
					
				<form name="case" action="saveCase" method="post">
				<input type="hidden" name="id" id="id" value="${requestScope.casedetails['caseid'] }"/>
				
				<input type="hidden" name="currententity" id="currententity" value="${requestScope.casedetails['currententityid'] }"/>
				<input type="hidden" name="firstchoice" id="firstchoice" value="${requestScope.casedetails['targetentityid'] }"/>
				<input type="hidden" name="finalentity" id="finalentity" value="${requestScope.casedetails['finalentityid'] }"/>
				<input type="hidden" name="content" id="content" value=""/>
				<input type="hidden" name="appliedschooloffer" id="appliedschooloffer" value="${requestScope.appliedschoolofferids}"/>
				<input type="hidden" name="appliedschool" id="appliedschool" value="${requestScope.appliedschoolids}"/>
				<input type="hidden" name="imgdesc1" id="imgdesc1" value=""/>
				<input type="hidden" name="imgdesc2" id="imgdesc2" value=""/>
				<input type="hidden" name="imgdesc3" id="imgdesc3" value=""/>
				<input type="hidden" name="payeename" id="payeename" value=""/>
				<input type="hidden" id="publish" name="publish" value=""/>	
				<input type="hidden" id="approved" name="approved" value="a"/>
					
					<div class="detail-icon ">
						<span class="d3-icon d3-icon-item d3-icon-item-64  d3-icon-item-green" style="margin-top:50px !important;">
							<span class="icon-item-gradient">
								<span class="icon-item-inner icon-item-default" style="background-image: url(/school/userimages/${not empty requestScope.casedetails['caseid'] ? requestScope.casedetails['userprofile'] : sessionScope.user['userprofile'] });"  onerror="UserImgError(this);">
								</span>
							</span>
						</span>
					</div>
					<div style="position:relative;float:left;top:70px;left:35px;" >
							<br><font class="font1b" style="padding-top:3px;">${sessionScope.user['namelocal']}</font><br>
							<font class="font1" style="padding-top:3px;"><spring:message code="label.userscore"/> : ${empty sessionScope.user['userscore'] ? '0' : sessionScope.user['userscore']}</font><br>
							<font class="font1" style="padding-top:3px;"><spring:message code="label.parentrating"/> : ${empty sessionScope.user['parentratingcount'] ? '0' : sessionScope.user['parentratingcount']}</font><br>
							<font class="font1" style="padding-top:3px;"><spring:message code="label.casesharing"/> : ${empty sessionScope.user['casesharingcount'] ? '0' : sessionScope.user['casesharingcount'] }</font><br>
					</div>
					
					<div class="detail-text">
						<p class="d3-color-gray fontxlarge">
						<span style="padding-right:27px;font-weight: normal !important;"><spring:message code='label.title'/>: </span><input name="title" id="title" style="width:278px;" type="text" value="${requestScope.casedetails['title']}"  />
						</p>
							<div class="d3-item-properties">
						
							<ul class="item-type">
								<li >
									<span class="d3-color-gray">
									<font class="formlabel" style="position:relative;top:-35px;padding-right:27px;"><spring:message code='label.strategy'/>:</font>  <textarea rows="2" cols="78" name="analysis" id="analysis" style="width:278px;" >${requestScope.casedetails['analysis'] }</textarea>
									</span>
								
								</li>
								<li class="d3-color-gray">
								<ul>
								<c:set var="boy"><spring:message code="label.boy"/></c:set>
			 	 				<c:set var="girl"><spring:message code="label.girl"/></c:set>
								<li class="d3-color-gray">
									<span style="padding-right:28px;"><spring:message code="label.maincharacter"/>:</span>
									<span class="font1">
										<input type=radio name=sex value="<spring:message code='label.boy'/>"  ${requestScope.casedetails['casesex'] eq boy ? 'checked' : ''}   > <spring:message code='label.boy'/> <input type=radio name=sex value="<spring:message code='label.girl'/>" ${requestScope.casedetails['casesex'] eq girl ? 'checked' : ''} > <spring:message code='label.girl'/>
									</span>
									<span style="padding-left:10px;"> 
									<select id="age" name="age" style="width:5em;'}">
								  		<option value=""><spring:message code="label.age"/></option>
								  		<c:forEach var="i" begin="2" end="12" step="1" varStatus ="status">
											<option value="${i}"  <c:if test="${requestScope.casedetails['age'] eq i }">selected</c:if> >
								                    		${i} <spring:message code="label.yearsold"/>
											</option>
								  		</c:forEach>
									</select>  
									</span> 
									<span>
										<select id="monthofbirth" name="monthofbirth" style="width:7em;'}">
									  		<option value=""><spring:message code="label.monthofbirth"/></option>
									  		<c:forEach var="i" begin="1" end="12" step="1" varStatus ="status">
												<option value="${i}"  <c:if test="${requestScope.casedetails['monthofbirth'] eq i }">selected</c:if> >
									                    		${i} <spring:message code="label.monthofbirth2"/>
												</option>
									  		</c:forEach>
										</select>
									</span>	  
									<span class="font1">
										<c:set var="bigkid">(<spring:message code="label.bigkid"/>)</c:set>
										<c:set var="smallkid">(<spring:message code="label.smallkid"/>)</c:set>
										<input type=radio name='bigsmallkid' id='bigsmallkid' value="b"  ${requestScope.casedetails['bigsmallkid'] == 'b' ? 'checked' : ''}   > <spring:message code='label.bigkid'/> <input type=radio name='bigsmallkid' value="s" ${requestScope.casedetails['bigsmallkid'] == 's' ? 'checked' : ''} > <spring:message code='label.smallkid'/>
									</span>
									</p></li>
									<li class="d3-color-gray"><p><font style="top:-32px;position:relative;"><spring:message code="label.character"/>: </font><textarea style="width:280px;" name="characterkid" id="characterkid">${requestScope.casedetails['characterkid']}</textarea></p></li>
									<li class="d3-color-gray">
										<div style="float:left;" > <spring:message code="label.currentschool"/>:</div>
										<a href='/school/controller/getSchoolSelect?bigselect=y&multipleselect=n&sessionkey=currentschool&hiddenfieldid=currententity&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_schoolselect'> 
											<div style="float:left;" class="styled-select font1b">
											<font id="displaycurrententity">${not empty requestScope.casedetails['currententity'] ? requestScope.casedetails['currententity'] : labelpleaseselectschool }</font>
											</div>
										</a>
										
									</li>
								</ul>
								</li>
								<br class="clear"/>
								<li><span class="d3-color-gray"><spring:message code="label.applicationyear"/>:
								<select id="applicationyear" name="applicationyear" style="width:22em;'}">
								  		<option value="">--</option>
								  		<c:forEach var="i" begin="${currentyear}" end="${currentyear + 1 }" step="1" varStatus ="status">
								  			<c:set var="yearrange">${i-1}-${i}</c:set>
											<option value="${yearrange}"  <c:if test="${requestScope.casedetails['applicationyear'] eq yearrange }">selected</c:if> >
								                    		${yearrange} 
											</option>
								  		</c:forEach>
									</select> 
									
								</span></li>
								<li><span class="d3-color-gray">
									<div style="float:left;"><spring:message code="label.firstchoice"/>:</div>
									<a href='/school/controller/getSchoolSelect?bigselect=y&multipleselect=n&hiddenfieldid=firstchoice&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_schoolselect'> 
								 		<div style="float:left;" class="styled-select font1b">
								 			<font id="displayfirstchoice">${not empty requestScope.casedetails['targetentity'] ? requestScope.casedetails['targetentity'] : labelpleaseselectschool }</font>
								 		</div>
								 	</a>
								 </span>
								 </li>
								
								<li><span class="d3-color-gray">
								<font style="position:relative;top:-30px;"><br class="clear"><spring:message code="label.applicationresult"/>:</font>
								<textarea rows="2" cols="78" style="width:278px;" name="applicationresult" id="applicationresult">${requestScope.casedetails['applicationresult']}</textarea><br>
								</li>
								<li><span class="d3-color-gray">
								<div style="float:left;"><spring:message code="label.finalchoose"/>:</div>
									<a href='/school/controller/getSchoolSelect?bigselect=y&multipleselect=n&hiddenfieldid=finalentity&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_schoolselect'> 
										<div style="float:left;" class="styled-select font1b">
										<font id="displayfinalentity">${not empty requestScope.casedetails['finalentity'] ? requestScope.casedetails['finalentity'] : labelpleaseselectschool }</font>
										</div>
									</a>
								</span>
								</li>
								
								<li>
									
									<span id="appliedschoolfocus" name="appliedschoolfocus" class="d3-color-gray"><br class="clear"><spring:message code="label.appliedschool"/>:
										<div id="casecontent" class="item-extras" style="padding:20px 10px 20px 40px;" >
										<c:set var="tick"><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(106,169,47);">&#10003;</span></c:set>
										<c:set var="cross"><span style="font-family: wingdings; font-size: 100%;font-weight:bold;color:rgb(121,33,49);">X</span></c:set>
										<a href='/school/controller/getSchoolSelect?bigselect=y&multipleselect=y&hiddenfieldid=appliedschooloffer&bigselect=y&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_schoolselect'> 
										<div class="styled-select font1b">
										<spring:message code="label.offer"/>  ${tick} <span style="float:right;padding-right:25px;"><span  id="displayappliedschooloffer" >${requestScope.casedetails['appliedentityoffercount']}</span> <spring:message code="label.totalschool"/></span>
										</div>
										</a>
										<p id="textappliedschooloffer" class="font1" style="padding: 5px 13px 8px 3px;"></p>
										
										<a href='/school/controller/getSchoolSelect?bigselect=y&multipleselect=y&hiddenfieldid=appliedschool&bigselect=y&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_schoolselect'> 
										<div class="styled-select font1b">
										<spring:message code="label.offer"/>  ${cross} <span style="float:right;padding-right:25px;"><span id="displayappliedschool" >${requestScope.casedetails['appliedentitycount']}</span> <spring:message code="label.totalschool"/></span>
										</div>
										</a>
										<p id="textappliedschool" class="font1" style="padding: 5px 13px 8px 3px;"></p>
										
										  
									</div>
									</span>
								</li>
							
								
							
							</ul>
							
							
							<span class="clear"><!-- --></span>
						</div>
					</div>
							
							
					<div style="padding: 30px;"><div class="line-type2-flat"></div></div>
					<p class="d3-color-gray-1" style="padding:5px 20px;"><spring:message code="label.casesharing.step2"/></p>	
							<div class="item-extras" id="casecontent" style="padding:20px;margin:0px 30px;">
							<font class="d3-color-gray" style="padding-bottom:10px;font-size:15px;"><spring:message code="label.details"/>:<br></font>
						    <br>
							<textarea id="editor" name="editor" style="width:480px;height:400px;">${requestScope.casedetails['content']}</textarea>
						
			
					</form>
			
								<br class="clear"><br class="clear">	
								<span class="d3-color-orange"><spring:message code="label.uploadfileinstruction"/></span>	
								<a name="imageupload"></a>
								<c:forEach var="i" begin="1" end="3" step="1" varStatus ="rowCounter">
									
									<div style="float:left;position:relative;padding-top:25px;">
									
										<div id="upload-area">
										<div class="preview${rowCounter.count }">
										<c:set var="defaultimage">/school/img/uploadyourimage.png</c:set>
										<c:set var="userimage">/school/userimages/${requestScope.userimage[rowCounter.count-1].filename}</c:set>
										
										<img id="thumb${rowCounter.count }" width="100px" height="100px" src="${empty requestScope.userimage[rowCounter.count-1].filename ? defaultimage : userimage}" />
										</div>
					
										<span class="wrap hotness">
										<form action="fileUpload"  id="imageUploadForm${rowCounter.count}">
											<input type="file" id="imageUpload${rowCounter.count}" name="imageUpload" size="20" /><a style="padding-left:5px;" href="#imageupload" onclick="deleteImage('casesharing${rowCounter.count}','thumb${rowCounter.count}')" ><spring:message code="label.delete"/> <img src="/school/img/rubbishbin.png"/></a><br>
											<c:set var="defaultdesc"><spring:message code='label.imagetextdesc'/></c:set>
											<textarea  style="width:248px;height:30px;" id="photodesc${rowCounter.count}" name="photodesc${rowCounter.count}" onclick="clickclear(this, '<spring:message code='label.imagetextdesc'/>');" onblur="clickrecall(this,'<spring:message code='label.imagetextdesc'/>')" >${not empty requestScope.userimage[rowCounter.count-1].description ? requestScope.userimage[rowCounter.count-1].description : defaultdesc}</textarea>
										</form>
										</span>
										</div>
								
									</div>
							
								</c:forEach>
								
								
						
					
								<br class="clear"><br class="clear"><br class="clear">
			
				</div>
				<div style="padding:5px 20px;"><div class="line-type2-flat"></div></div>	
				<p class="d3-color-gray-1" style="padding: 30px;"><spring:message code="label.casesharing.step3"/></p>
				<form name="payee" id="payee">
				<table style="margin: auto;">
				<tr>
				<td><font class="d3-color-gray" style="position:relative;top:-4px;"><spring:message code="label.payeename"/>: <input type="text" id="displaypayeename" name="displaypayeename" style="width:90px;" value="${requestScope.casedetails['payeename']}"  /></font></td>
				<td><span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ checkform(document.forms["case"]); }'><spring:message code="label.save"/></span></span>
				<td><span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ document.forms["case"].publish.value="y"; checkform(document.forms["case"]); }'><spring:message code="label.publish"/></span></span>
				</td>
				</tr>
				</table>
				</form>
			
			</div>
			<div><img src="/school/img/bottom.gif" alt="" width="600" height="4" border="0" style="display:block;margin:0"></div>
  		</c:otherwise>
	</c:choose>
	
       
<jsp:include page="common-footer.jsp"/>