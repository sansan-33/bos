<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <div id="secondarySchoolList">
    <form name="schoolListForm" action="savePrimaryListForm" method="post">
	
	<table width="1080px">
<tr><td colspan="8" align="right">
	<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input onclick='javascript:{ document.forms["schoolListForm"].submit(); }'  class="submit" type="button"  value='Save' /></span></span>
    <font class="fonttiny">${requestScope.schoolList[0]['lastupdated']}</font>
</td></tr>	
<tr>
	   <TH width="30px">No.</TH>
       <TH width="420px">NAME</TH>
       <TH width="120px">Vacancy</TH>
       <TH width="120px">Admitted</TH>

        
       
   </tr>
    <c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
  	<tr class=row${rowCounter.count % 2}>  
  		<td>${rowCounter.count}</td>
  		<td style="padding:5px;"><font style="font-size:15px;">${school['name']}</font><br><font class="font1">${school['nameeng']}</font></td>
        <td><input style="width:60px;position:relative;top:4px;" size="2" type="text" name="vacancy" id="vacancy" value="${school['vacancy']}"/></td>
        <td><input style="width:60px;position:relative;top:4px;" size="2" type="text" name="admitted" id="admitted" value="${school['admitted']}"/></td>

  		<input type="hidden" name="id" id="id" value="${school['id']}"/>
  	</tr>
	</c:forEach>

	
	<tr><td colspan="8" align="right">
	<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input onclick='javascript:{ document.forms["schoolListForm"].submit(); }'  class="submit" type="button"  value='Save' /></span></span>
         </td></tr>

	</table>
</form>
  </div>




