<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" type="text/css" href="/school/stylesheet/date.css"/>


<!-- wysihtml5 parser rules -->
<script src="/school/js/advanced.js"></script>
<!-- Library -->
<script src="/school/js/wysihtml5-0.3.0.js"></script>


<style>
  
  small {
    display: block;
    margin-top: 40px;
    font-size: 9px;
  }
  
  small,
  small a {
    color: #666;
  }
  
  .wysihtml5-command-active {
    font-weight: bold;
  }
  
  [data-wysihtml5-dialog] {
    margin: 5px 0 0;
    padding: 5px;
    border: 1px solid #666;
  }
  
  
</style>



<c:catch var="catchException">


 
 
<script type="text/javascript">
 
    $(function() {

    	$(":date").dateinput();
    });



    //$("#note").jqte();
    function checkform (form)
    {
    	
    	 // ** START **
    	 if (form.title.value == "" || form.title.value == "<spring:message code='label.title'/>") {
    	    alert( "<spring:message code='label.plsinput'/><spring:message code='label.title'/>" );
    	    form.title.focus();
    	    return false ;
    	  }
    	  if (form.startdate.value == "") {
    		alert( "<spring:message code='label.plschoose'/><spring:message code='label.from'/>" );
    	    form.startdate.focus();
    	    return false ;
    	  }
    	  if (form.enddate.value == "") {
    		alert( "<spring:message code='label.plschoose'/><spring:message code='label.to'/>" );
    	    form.enddate.focus();
    	    return false ;
    	  }
    	  
    	  if (form.eventtype.value != 'importantday'  && form.entityid.value == "") {
    		alert("<spring:message code='label.plschoose'/><spring:message code='label.reversesearchselect'/>" );
    		form.entityid.focus();
    	    return false ;
    	  }
    	  if (form.eventtype.value == "") {
      		alert( "<spring:message code='label.plschoose'/><spring:message code='label.eventtype'/>" );
      		form.eventtype.focus();
      	    return false ;
      	  }
    	  if (form.answer.value == "") {
    			alert( "<spring:message code='label.plsinput'/><spring:message code='label.spam'/>" );
    		 	form.answer.focus();
    		    return false ;
    	  }
    	  if (form.note.value == "" || form.title.value == "<spring:message code='label.details'/>" ) {
      		alert( "<spring:message code='label.plsinput'/><spring:message code='label.details'/>" );
      		form.note.focus();
      	    return false ;
      	  }
    	  
    	$('#event').submit();
  	// ** END **
	}
    </script>

<%
  	HashMap<String,Object> event = new HashMap<String,Object>();
	event = request.getAttribute("event") != null && !((HashMap<String,Object>) request.getAttribute("event")).isEmpty() ? (HashMap<String,Object>) request.getAttribute("event")  : (HashMap<String,Object>) session.getAttribute("event");
  	pageContext.setAttribute("event", event);
%>

<div style="padding:35px 20px 50px 50px;">	


<div class="fontxxxlarge d3-color-gray-1 fontblod fontshadow"  ><spring:message code="label.newevent"/></div>
<div style="margin-top:10px;float:left;position:relative" class="fontxlarge d3-color-gray-3"><spring:message code="label.submitcalendarevent"/></div>

<br class="clear"/><br class="clear"/><br class="clear"/>
 <form name="event" action="/school/controller/saveEventCalendar" method="post" id="event">
   			<input type="hidden" name="id" value="${requestScope.event['id']}" id="id" />
			<input type="hidden" name="view" value="${requestScope.view}" id="view" />
            <input type="hidden" name="active" value="y" id="active" />
		
			<c:set var="defaulttitle"><spring:message code='label.title'/></c:set>
			<c:set var="defaultnote"><spring:message code='label.details'/></c:set>
		


					<textarea id="title" name="title" style="width:475px;height:20px;" onclick="clickclear(this, '<spring:message code='label.title'/>');" onblur="clickrecall(this,'<spring:message code='label.title'/>')">${not empty event["title"] && fn:length(event["title"]) > 0 ?  event["title"] :  defaulttitle}</textarea>

					<div style="padding: 10px 0px 25px 0px;border-bottom: 1px solid #c9c9c9;margin-right:100px;">
					<input type="date" id="startdate" name="startdate" value="${event['startdate']}" />
					<font class="d3-color-gray-1" style="padding-left:5px;"><spring:message code="label.to"/>: </font>
					<input type="date" id="enddate" name="enddate" value="${event['enddate']}" />
					</div>

					<div style="padding-bottom:10px;padding-top:30px;"><jsp:include page="../common/chainedSelectSchool.jsp"/></div>
				
				
					<div style="padding-bottom:10px;float:left">		
					<select id="eventtype" name="eventtype" style="width: 15em;">
					 	<option value=""><spring:message code="label.eventtype"/></option>
			 		 	<option value="openday" <c:if test="${event['eventtype'] eq 'openday'}">selected</c:if> ><spring:message code="label.openday"/></option>
			  			<option value="introday" <c:if test="${event['eventtype'] eq 'introday'}">selected</c:if> ><spring:message code="label.introday"/></option>
			  			<option value="applicationday" <c:if test="${event['eventtype'] eq 'applicationday'}">selected</c:if> ><spring:message code="label.applicationday"/></option>
			  			<c:if test="${event['eventtype'] eq 'importantday'}">
			  			<option value="importantday" <c:if test="${event['eventtype'] eq 'importantday'}">selected</c:if> ><spring:message code="label.importantday"/></option>
			  			
			  			</c:if>
			  			
					</select>
					</div>
					<div style="padding:5px 0 5px 20px;float:left" class="formfieldname font3b d3-color-gray-1"><spring:message code="label.spam"/>:</div>
					
					<div style="padding:8px 0 5px 2px;float:left">
					<input name="answer" style="width:80px;top:-40px;position:relative;left:12px;" /><img style="top:-20px;position:relative;left:10px;" src="/school/stickyImg" />
					</div>
				<c:if test="${event['error.captcha'] eq 'y' }"><font class="d3-color-red"><spring:message code="error.captcha"/></font></c:if>	
				
<div style="float:left;position:relative;top:-20px;">
<div id="wysihtml5-toolbar" style="display: none;">
    <a data-wysihtml5-command="bold" title="CTRL+B">bold</a> |
    <a data-wysihtml5-command="italic" title="CTRL+I">italic</a> |
    <a data-wysihtml5-command="createLink">insert link</a> |
    <a data-wysihtml5-command="insertImage">insert image</a> |
    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1">h1</a> |
    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2">h2</a> |
    <a data-wysihtml5-command="insertUnorderedList">insertUnorderedList</a> |
    <a data-wysihtml5-command="insertOrderedList">insertOrderedList</a> |
    <a data-wysihtml5-action="change_view">switch to html view</a>
    
    <div data-wysihtml5-dialog="createLink" style="display: none;padding-top:4px;padding-bottom:20px;">
      <label>
        Link:
        <input data-wysihtml5-dialog-field="href" value="http://">
      </label>
      <a data-wysihtml5-dialog-action="save">OK</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">Cancel</a>
    </div>
    
    <div data-wysihtml5-dialog="insertImage" style="display: none;padding-top:4px;padding-bottom:20px;">
      <label>
        Image:
        <input data-wysihtml5-dialog-field="src" value="http://">
      </label>
      <label>
        Align:
        <select data-wysihtml5-dialog-field="className">
          <option value="">default</option>
          <option value="wysiwyg-float-left">left</option>
          <option value="wysiwyg-float-right">right</option>
        </select>
      </label>
      <a data-wysihtml5-dialog-action="save">OK</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">Cancel</a>
    </div>  


</div>
</div>




				<div style="float:left;position:relative;top:10px;">
				<textarea id="note" name="note" style="width:475px;height:120px;"   onclick="clickclear(this, '<spring:message code='label.details'/>');" onblur="clickrecall(this,'<spring:message code='label.details'/>')">${not empty event["note"] && fn:length(event["note"]) > 0 ?  event["note"] :  defaultnote}</textarea>
				</div>
				
				<div style="position:relative;float:right;top:100px;">
   				<span class="button_grn"><span class="bg_grn gradient" onclick="javascript:{checkform(document.forms['event'])}">OK</span>
				</span>
				</div>

</form>
</div>

</c:catch>
<c:if test="${not empty catchException}">
${catchException.message}
</c:if>


<script>
var editor = new wysihtml5.Editor("note", { // id of textarea element
  toolbar:      "wysihtml5-toolbar", // id of toolbar element
  stylesheets:  "../stylesheet/editor_stylesheet.css",
  parserRules:  wysihtml5ParserRules // defined in parser rules set 
});
</script>
