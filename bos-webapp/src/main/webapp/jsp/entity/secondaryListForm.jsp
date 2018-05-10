<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <div id="secondarySchoolList">
    <form name="schoolListForm" action="saveSecondaryListForm" method="post">
	
	<table width="1080px">
<tr><td colspan="8" align="right">
	<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input onclick='javascript:{ document.forms["schoolListForm"].submit(); }'  class="submit" type="button"  value='Save' /></span></span>
    <font class="fonttiny">${requestScope.schoolList[0]['lastupdated']}</font>
</td></tr>	
<tr>
	   <TH width="30px">No.</TH>
        <TH width="280px">NAME</TH>
        <TH width="80px">Banding<br>音樂冠軍</TH>
        <TH width="70px">外籍老師<br>音樂亞軍</TH>
        <TH width="90px">4主科3322率<br>音樂季軍</TH>
        <TH width="90px">中文(達3率)<br>朗誦冠軍</TH>
        <TH width="90px">英文(達3率)<br>朗誦亞軍</TH>
        <TH width="100px">入大學百份比<br>朗誦季軍</TH>
        <TH width="70px">微調<br>其它(個人)</TH>
   </tr>
    <c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
  	<tr class=row${rowCounter.count % 2}>  
  		<td>${rowCounter.count}</td>
  		<td style="padding:5px;"><a href="/school/controller/entityDetails?entityid=${school['id']}&action=compare"><font style="font-size:15px;">${school['name']}</font><br><font class="font1">${school['nameeng']}</font></a></td>
  		<td style="height:65px;">
  		    <input style="width:40px;position:relative;top:4px;" size="2" type="text" name="banding" id="banding" value="${school['banding']}"/><font style="padding:2px;font-size:8px;${school['banding'] ne school['banding_dba'] ? 'color:red' : ''}">${school['banding_dba']}</font>
  		    <input style="width:40px;position:relative;top:4px;" size="2" type="text" name="musicfirst" id="musicfirst" value="${school['musicfirst']}"/><font style="padding:2px;font-size:8px;${school['musicfirst'] ne school['musicfirst_dba'] ? 'color:red' : ''}">${school['musicfirst_dba']}</font>
  		</td>
        <td>
            <input style="width:40px;position:relative;top:4px;" size="2" type="text" name="teacherforeign" id="teacherforeign" value="${school['teacherforeign']}"/><font style="padding:2px;font-size:8px;${school['teacherforeign'] ne school['teacherforeign_dba'] ? 'color:red' : ''}">${school['teacherforeign_dba']}</font>
  		    <input style="width:40px;position:relative;top:4px;" size="2" type="text" name="musicsecond" id="musicsecond" value="${school['musicsecond']}"/><font style="padding:2px;font-size:8px;${school['musicsecond'] ne school['musicsecond_dba'] ? 'color:red' : ''}">${school['musicsecond_dba']}</font>
        </td>
  		<td>
  		    <input style="width:50px;position:relative;top:4px;" size="2" type="text" name="hkdsepassrate" id="hkdsepassrate" value="${school['hkdsepassrate']}"/><font style="padding:2px;font-size:8px;${school['hkdsepassrate'] ne school['hkdsepassrate_dba'] ? 'color:red' : ''}">${school['hkdsepassrate_dba']}</font>
  		    <input style="width:50px;position:relative;top:4px;" size="2" type="text" name="musicthird" id="musicthird" value="${school['musicthird']}"/><font style="padding:2px;font-size:8px;${school['musicthird'] ne school['musicthird_dba'] ? 'color:red' : ''}">${school['musicthird_dba']}</font>
  		</td>
  		<td>
  		    <input style="width:45px;position:relative;top:4px;" size="2" type="text" name="chipassrate" id="chipassrate" value="${school['chipassrate']}"/><font style="padding:2px;font-size:8px;${school['chipassrate'] ne school['chipassrate_dba'] ? 'color:red' : ''}">${school['chipassrate_dba']}</font>
  		    <input style="width:45px;position:relative;top:4px;" size="2" type="text" name="speechfirst" id="speechfirst" value="${school['speechfirst']}"/><font style="padding:2px;font-size:8px;${school['speechfirst'] ne school['speechfirst_dba'] ? 'color:red' : ''}">${school['speechfirst_dba']}</font>
  		</td>
		<td>
		    <input style="width:45px;position:relative;top:4px;" size="2" type="text" name="engpassrate" id="engpassrate" value="${school['engpassrate']}"/><font style="padding:2px;font-size:8px;${school['engpassrate'] ne school['engpassrate_dba'] ? 'color:red' : ''}">${school['engpassrate_dba']}</font>
  		    <input style="width:45px;position:relative;top:4px;" size="2" type="text" name="speechsecond" id="speechsecond" value="${school['speechsecond']}"/><font style="padding:2px;font-size:8px;${school['speechsecond'] ne school['speechsecond_dba'] ? 'color:red' : ''}">${school['speechsecond_dba']}</font>
		</td>
  		<td>
  		    <input style="width:50px;position:relative;top:4px;" size="2" type="text" name="urate" id="urate" value="${school['urate']}"/><font style="padding:2px;font-size:8px;${school['urate'] ne school['urate_dba'] ? 'color:red' : ''}">${school['urate_dba']}</font>
  		    <input style="width:50px;position:relative;top:4px;" size="2" type="text" name="speechthird" id="speechthird" value="${school['speechthird']}"/><font style="padding:2px;font-size:8px;${school['speechthird'] ne school['speechthird_dba'] ? 'color:red' : ''}">${school['speechthird_dba']}</font>
  		</td>
  		<td>
  		    <input style="width:30px;position:relative;top:4px;" size="2" type="text" name="alpassrate" id="alpassrate" value="${school['alpassrate']}"/><font style="padding:2px;font-size:8px;${school['alpassrate'] ne school['alpassrate_dba'] ? 'color:red' : ''}">${school['alpassrate_dba']}</font>
  		    <input style="width:30px;position:relative;top:4px;" size="2" type="text" name="musicother" id="musicother" value="${school['musicother']}"/><font style="padding:2px;font-size:8px;${school['musicother'] ne school['musicother_dba'] ? 'color:red' : ''}">${school['musicother_dba']}</font>
  		</td>
  		
  		<input type="hidden" name="id" id="id" value="${school['id']}"/>
  		<input type="hidden" name="sixcoursesratio" id="sixcoursesratio" value="0"/>
  	</tr>
	</c:forEach>

	
	<tr><td colspan="8" align="right">
	<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input onclick='javascript:{ document.forms["schoolListForm"].submit(); }'  class="submit" type="button"  value='Save' /></span></span>
         </td></tr>

	</table>
</form>
  </div>




