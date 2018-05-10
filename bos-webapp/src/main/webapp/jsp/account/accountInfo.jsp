<%@ include file="../common-header.jsp" %>
<jsp:include page="../menu.jsp"/>


<script type="text/javascript" src="/school/js/ajaxupload.js"></script> 
<!-- activate tabs with JavaScript -->
<script>
  $(function() {
    $("#accordion").tabs(
    "#accordion div.pane",
    {tabs: 'h2', effect: 'slide', initialIndex: null}
  );
    });

  $(document).ready(function(){

		var thumb = $('img#thumb');	

		new AjaxUpload('imageUpload', {
			action: $('form#imageUploadForm').attr('action'),
			name: 'imageUpload',
			data: {"imagekey":"userprofile"},
			cache: false,
			onSubmit: function(file, extension) {
				$('div.preview').addClass('loading');
			},
			onComplete: function(file, response) {
				thumb.load(function(){
					$('div.preview').removeClass('loading');
					thumb.unbind();
				});
				thumb.attr('src', response + '&' +  Math.random()*Math.random());
			}
		});
	});

</script>

<jsp:include page="accountMenu.jsp"/>

<div class="imamazingbgtop2"></div>
<div class="imamazingbgmiddle2">
<TABLE width=100%  cellpadding=0 cellspacing=0>
<tr><td width="30px">&nbsp;</td>
	<td colspan="2" >
	<div id="upload-area">
				<div class="preview">
					<img id="thumb" width="70px" height="70px" src="/school/userimages/${sessionScope.user['userprofile']}" />
				</div>

				<span class="wrap hotness">
					<form id="imageUploadForm" action="fileUpload" >
						<input type="file" id="imageUpload" name="imageUpload" size="20" /><br>
						<label class="font1"><spring:message code="label.profilepicture"/></label>
					</form>
				</span>
	</div>
</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
<form name="account" action="accountInfo" method="post">
<tr>  
	<td width="40px">&nbsp;</td>
	<td width="120px"><font class="font3b"><spring:message code="label.username"/></font></td>
 	<td><input style="margin-left:30px;width:250px;" type="text" name="namelocal" value="${sessionScope.user['namelocal']}" size="60"></td>
</tr>
<tr>
    <td width="40px">&nbsp;</td><td><font class="font3b"><spring:message code="label.password"/></font>:</td><td><input style="margin-left:30px;width:250px;" type="password" name="password" size="60" value="${sessionScope.user['password']}" /></td>
</tr>
<tr>  
	<td width="40px">&nbsp;</td>
	<td></td>
 	<td>
 	<label for="anonymous">
 	<input style="margin-left:35px" type="checkbox" name="anonymous" id="anonymous" <c:if test="${sessionScope.user['anonymous'] == 'y'}">checked</c:if> value="y">
	</label>
	<font style="padding-left:10px;" class="font1 d3-color-gray"><spring:message code="label.parentrating"/>/<spring:message code="label.writeareview"/><spring:message code="label.showanonymous"/></font>
	</td>			
</tr>
 	
 	<c:choose>
 	<c:when test="${sessionScope.user['roleid'] eq '2' }">
 		<tr><td colspan="3">&nbsp;</td></tr>
 	 	<tr>
 	 		<c:set var="boy"><spring:message code="label.boy"/></c:set>
 	 		<c:set var="girl"><spring:message code="label.girl"/></c:set>
	    	<td width="30px">&nbsp;</td><td><font class="font3b" ><spring:message code="label.sex"/></font>: </td><td>&nbsp;&nbsp;<input style="margin-left:30px" type=radio name=sex value="<spring:message code='label.boy'/>"  ${sessionScope.user['sex'] eq boy ? 'checked' : ''}   > <spring:message code='label.boy'/> <input type=radio name=sex value="<spring:message code='label.girl'/>" ${sessionScope.user['sex'] eq girl ? 'checked' : ''} > <spring:message code='label.girl'/> </td>
		</tr>
		<tr>
		<td width="30px">&nbsp;</td><td><font class="font3b" ><spring:message code="label.tutordistrict"/></font>: </td><td>&nbsp;&nbsp;
	    <div style="float:left;padding-left:30px;">
		<select id="lookupdistrict1" style="width: 8em;" name="lookupdistrict1" >
		  	<option value=""><spring:message code="label.districtsearchselect"/></option>
			<c:forEach var="district" items="${requestScope.districtList}" varStatus="rowCounter">
					<option value="${district['value']}"  <c:if test="${sessionScope.user['lookupdistrict1'] eq district['value']}">selected</c:if> >
		                    		${district['description']}  
					</option>
		  	</c:forEach>
		  	<option value="all">ALL</option>
		</select>
		</div>
		<div style="float:left;padding-left:3px;">
		<select id="lookupdistrict2" style="width: 8em;" name="lookupdistrict2" >
		  	<option value=""><spring:message code="label.districtsearchselect"/> ${ssessionScope.user['lookupdistrict2']}</option>
			<c:forEach var="district" items="${requestScope.districtList}" varStatus="rowCounter">
					<option value="${district['value']}"  <c:if test="${ssessionScope.user['lookupdistrict2'] eq district['value']}">selected</c:if> >
		                    		${district['description']}  
					</option>
		  	</c:forEach>
		  	<option value="all">ALL</option>
		</select>
		</div>
		  <div style="float:left;padding-left:3px;">
		<select id="lookupdistrict3" style="width: 8em;" name="lookupdistrict3" >
		  	<option value=""><spring:message code="label.districtsearchselect"/></option>
			<c:forEach var="district" items="${requestScope.districtList}" varStatus="rowCounter">
					<option value="${district['value']}"  <c:if test="${sessionScope.user['lookupdistrict3'] eq district['value']}">selected</c:if> >
		                    		${district['description']}  
					</option>
		  	</c:forEach>
		  	<option value="all">ALL</option>
		</select>
		</div>
		</td>
		</tr>
	  	<tr>
		    <td width="100px">&nbsp;</td><td><font class="font3b"><spring:message code="label.tutorgraduate"/></font>: </td><td><div style="padding:20px 0px 20px 90px;"><jsp:include page="../common/chainedSelectParentSchool.jsp"/></div></td>
		</tr>
	
		<tr>
		<td width="30px">&nbsp;</td><td width="120px" valign="top"><font class="font3b"><spring:message code="label.tutor"/><spring:message code="label.courseinstrumentcategory"/></font>:</td>
		<td>
		<div id="accordion" style="margin-left:9px;">
	    <c:forEach var="tutorcategory" items="${requestScope.tutorCategoryList}" varStatus="rowCounter">
			<c:set var="bestdesc">bestdesc${rowCounter.count-1}</c:set>
			<c:set var="tutorialexp">tutorialexp${rowCounter.count-1}</c:set>
			<c:set var="tutormaxgrade">tutormaxgrade${rowCounter.count-1}</c:set>
			<c:set var="tutorcategoryid">tutorcategoryid${rowCounter.count-1}</c:set>
  			<h2 style="height:30px;" ${ rowCounter.count eq 1 ? 'class=current' : ''}>
  			<label class="normal" for="tutorcategory${rowCounter.count}" onclick="tooglecheckbox('tutorcategoryid${rowCounter.count}');" ><font class="font3${not empty sessionScope.user[tutorcategoryid] ? 'green' : '' }">${rowCounter.count} &nbsp;</font> 
  			<input onclick="tooglecheckbox('tutorcategoryid${rowCounter.count}');" id="tutorcategoryid${rowCounter.count}" name="tutorcategoryid${rowCounter.count}" value="${tutorcategory['value']}" type="checkbox" ${not empty sessionScope.user[tutorcategoryid] ? 'checked' : '' } > 
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
				<input style="margin-left:10px;width:150px;" type="text" name="bestdesc${rowCounter.count}" size="60" value="${sessionScope.user[bestdesc]}" /><br>
				<img style="padding-left:25px;" src="/school/img/itemlist.png"/> <font class="font1" style="padding-right:35px;"><spring:message code="label.tutorialexp"/>:</font> <input style="margin-left:10px;width:150px;" type="text" name="tutorialexp${rowCounter.count}" size="60" value="${sessionScope.user[tutorialexp]}" /><br>
		  	</div>
			
		</c:forEach>
		</div>
		</td>
		</tr>
	  	<tr>
		<td width="30px">&nbsp;</td><td width="120px" valign="top"><font class="font3b"><spring:message code="label.tutorintro"/></font>:</td>
		<td>
		<textarea name="selfintro" id="selfintro" style="font-size:0.95em;color:rgb(170,170,170);width:345px;height:200px;margin-left:8px;">${sessionScope.user["selfintro"]}</textarea> 
	   	</td>
		</tr>
    </c:when>
    <c:otherwise>
    	<tr><td colspan="3">&nbsp;</td></tr>
	    <tr>
		   <td width="100px">&nbsp;</td><td colspan="2"><font class="font3b"><spring:message code="label.kidschool"/></font>: </td>
		</tr>
		<tr> 
		   <td colspan="3"><div style="padding:20px 0px 20px 90px;"><jsp:include page="../common/chainedSelectSchool.jsp"/></div></td>
		</tr>
<!-- 
	    <tr>
		    <td width="100px">&nbsp;</td><td><font class="font3b"><spring:message code="label.parentschool"/></font>: </td><td><div style="padding-right:80px"><jsp:include page="../common/chainedSelectParentSchool.jsp"/></div></td>
		</tr>
 -->
	</c:otherwise>	
	</c:choose>
<tr>
<td>
<input type="hidden" name="action" value="update">
<input type="hidden" name="email" value="${sessionScope.user['email']}">

</td>
<td>
</td>
</tr>
</table>
<br>
<br>
</div>
<div class="imamazingbgbottom2">
<table style="margin: auto;">
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>     
        <span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ document.forms["account"].submit(); }'><spring:message code="label.submit"/></span></span>
    </td>
    </tr></table>
</div>

</form>
<jsp:include page="../common-footer.jsp"/>
       
