<%@ include file="common-header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
<script src="/school/js/jquery-te-1.4.0.min.js"></script>
<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/jquery-te.css'>

<jsp:include page="menu.jsp"/>

<script language="JavaScript" type="text/javascript">
<!--
function checkform ()
{
  // ** START **
 if (document.forms["savequestionanswer"].subject.value == "") {
    alert( "<spring:message code='alert.subject'/>" );
    document.forms["savequestionanswer"].subject.focus();
    return false ;
  }
  if (document.forms["savequestionanswer"].questionanswer.value == "") {
    alert( "<spring:message code='alert.content'/>" );
    document.forms["savequestionanswer"].editorcomment.focus();
    return false ;
  }
  <c:if test="${requestScope.categoryid ne -1 || requestScope.type eq 'hot' }">
  if (document.forms["savequestionanswer"].entityid.value == "") {
	    alert( "<spring:message code='alert.school'/>" );
	    document.forms["savequestionanswer"].category.focus();
	    return false ;
	  }
  </c:if>
  <c:if test="${requestScope.type eq 'hot' || requestScope.type eq 'newspaper' }">
  document.forms["savequestionanswer"].categoryid.value = document.forms["savequestionanswer"].category.value;
  </c:if>

  document.forms["savequestionanswer"].submit();
  // ** END **
}
//-->
</script>

<form action="saveQuestionAnswer" method="post" name="savequestionanswer" id="savequestionanswer">
<input type="hidden" name="questionanswer" id='questionanswer' value="" />
<input type="hidden" name="type" value="${requestScope.type eq 'hot' || requestScope.type eq 'newspaper'  ? 'q' : requestScope.type }" />
<input type="hidden" name="categoryid" value="${requestScope.categoryid}" />


<input type="hidden" name="id" id="id" value="-1" />

<input type="hidden" name="maincategoryname" id="maincategoryname" value="${requestScope.maincategoryname}" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="getForumContent" />
<br>

<table cellpadding=0 cellspacing=0>
<tbody>
	<tr><td colspan="3"><br></td></tr>
	<TR VALIGN=top>
			<td>
		 		<table cellpadding=0 cellspacing=0>
			 		<TR>
			 			<td><font class="font2N"><spring:message code="label.title"/></font></td>
			 			<TD colspan="2">
			 			     <input id="subject" name="subject" style="width:38em;margin-left:12px;" type="text" value=""/>
			         	</TD>
			 		</TR>
			 		<c:choose>
			 			<c:when test="${requestScope.categoryid ne -1}">
					 		<tr><td colspan="3"><br></td></tr>
							<TR>
					 			<td><font class="font2N"><spring:message code="label.schoolname"/></font></td>
					 			<TD colspan="3">
					 			   	<select id="entityid" name="entityid" style="width: 39em;margin-left:10px;">
		 								<option value=""><spring:message code="label.reversesearchselect"/></option>
		  								<c:forEach var="school" items="${requestScope.schoollist}" varStatus="rowCounter">
											<option value="${school['value']}" >
		                    					${school['description']}
											</option>
								  		</c:forEach>
		  							</select>
		    					</TD>
					 		</TR>
				 		</c:when>
				 		<c:when test="${requestScope.type eq 'hot' }">
					 		<tr><td colspan="3">
					 		<div style="padding:20px 0px 20px 50px;"><jsp:include page="common/chainedSelectSchool.jsp"/></div>
					 		<td></tr>
				 		</c:when>
				 		<c:when test="${requestScope.type eq 'newspaper'}">
				 			<tr><td colspan="3">
					 		<div style="padding:20px 0px 20px 50px;"><jsp:include page="common/chainedSelectSchool.jsp"/></div>
					 		<td></tr>
					 		<tr>
					 		<td><font class="font2N"><spring:message code="label.tag"/></font></td>
					 		<td colspan="2">
					 		<input id="tag" name="tag" style="width:38em;margin-left:12px;" type="text" value="newspaper,<spring:message code='label.appledaily'/>"/>
					 		<td></tr>
				 		</c:when>
			 		</c:choose>
			 		<tr><td colspan="3"><br></td></tr>
					<tr>
			 			<td>&nbsp;</td>
			 			<TD colspan="2">
						<div style="padding-left:65px;float:left;">
                        	         	<textarea id="editorcomment" class="editor">
                        	         	</textarea>
                        	         	</div>

						</TD>
					</TR>
				</table>
			</TD>
		</TR>
</table>
</FORM>
<table style="margin: auto;">
	<tr>
	<td><span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ checkform(); }'><spring:message code="label.submit"/></span></span></td>
	</tr>
</table>


<form action="/school/controller/getForumContentList" method="post" name="forummenu" id="forummenu">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>

<jsp:include page="common-footer.jsp"/>

<script type="text/javascript">


$("textarea").jqte({
    change: function(){
        $('#questionanswer').val($('#editorcomment').val());
    }
   });

function getForumContent(id, categoryid,type,maincategoryname,maincategoryuri){

	document.forms["forummenu"].id.value = id;
	document.forms["forummenu"].categoryid.value = categoryid;
	document.forms["forummenu"].type.value = type;
	document.forms["forummenu"].maincategoryname.value = maincategoryname;
	document.forms["forummenu"].maincategoryuri.value = maincategoryuri;

	document.forms["forummenu"].submit();
}
</script>
