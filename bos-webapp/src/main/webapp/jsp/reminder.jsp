<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<HTML>
<HEAD>
 <META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <link rel="stylesheet" type="text/css" href="/school/stylesheet/date.css"/>
 <script>
    $(function() {
    	$(":date").dateinput();
    });
    </script>
	

</HEAD>
<body>
<div style="padding:80px 40px 40px 40px;">
<p class="font2 d3-color-gray-1"><spring:message code="label.reminder.desc"/>:${requestScope.reminder['name']}</p>
<br class="clear">
  <form name="remark" action="saveReminder">
   		
<table  class="font2 d3-color-gray-1">
			<tr>
				<td><spring:message code="label.reminder.status"/></td>
				<td><input id="status"  style=" width:194px;" type="text" value="${requestScope.reminder['status']}"  name="status"/></td>
			</tr>
			<tr>
				<td><spring:message code="label.reminder.application"/></td>
				<td><input type="date" id="application" name="application" value="${requestScope.reminder['application']}" /></td>
			</tr>
			<tr>
				<td><spring:message code="label.reminder.interview"/></td>
				<td><input id="interview" type="date" name="interview" value="${requestScope.reminder['interview']}"/></td>
			</tr>
			<tr>
				<td><spring:message code="label.reminder.result"/></td>
				<td><input id="announcement" type="date"  name="announcement" value="${requestScope.reminder['announcement']}"/></td>
			</tr>
			
			
			<tr><td><spring:message code="label.reminder.order"/></td>
				<td>
				<select id="grade" name="grade" >
					<option value="1"><spring:message code="label.reminder.ordertip"/></option>
           			<c:forEach var="i" begin="1" end="30">
        	           	<option value="${i}" <c:if test="${i eq requestScope.reminder['grade'] }">selected="true"</c:if> >
            	       	${i}
                      	</option>
  					</c:forEach>
	        	</select>
	       		</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td colspan="2" style="text-align:center;">
				<input type="hidden" name="entityid" value="${requestScope.reminder['entityid']}" id="entityid" />
				<input type="hidden" name="action" value="favorite" />
				<span class="button_grn"><span class="bg_grn gradient" onclick='javascript:{ document.forms["remark"].submit(); }'>OK</span>
				</td>
			</tr>
		</table>
</form>
	</div>
	</body>
</HTML>