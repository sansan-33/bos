<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div style="background-color: rgb(244,242,236);	width:600px; margin:0px auto; padding:5px; min-height:400px;"> 
<table cellpadding="0" cellsapcing="0">
<tr>
<td valign="top">
<div class="pbox1"><div class="pbox1Inner"><div class="pbox1Header"><div class="pbox1TL"></div><div class="pbox1TR"></div></div><div class="pbox1Body">

<a href="http://www.bookofschool.com" title="Home"><br>
<span style="position:relative;top:5px;left:2px;width:140px;">
<img style="position:relative;float:left;" src="https://www.bookofschool.com/school/img/logobook.png" width="70" height="54"/>
<span style="position:relative;padding-top:5px;">
<font style="font-size:1.0em;font-weight:bold;color:rgb(2,80,124);"><spring:message code="label.sitenamechi"/></font><br>
<font style="font-size:0.7em;font-weight:bold;color:rgb(2,80,124);">bookofschool</font>
</span>
</span>
</a>
<br><br>
<h3><spring:message code="label.howtouse"/></h3>
<div class="line-type1-flat"></div>  
  

	<table cellpadding="0" cellsapcing="0" width="600px" height="500px">
		<tr><td>&nbsp;</td></tr>
		<tr class="row10">
			<td>
				<div style="font-size:15px;font-weight:bolder;margin:5px;"><spring:message code="label.schoolrating"/></div>
				<div class="line-type1-flat"></div>
				<img src="../img/giga-star.png" style="float:right;margin:5px;"/>
				<div style="font-size:12px;margin:5px;"><spring:message code="label.gradingmethod"/></div> 
			</td>
    		</tr>
		<tr class="row11">
			<td>
				<div style="font-size:15px;font-weight:bolder;margin:5px;"><spring:message code="label.schoolselection"/></div>
				<div class="line-type1-flat"></div>
				<img src="../img/search.png" style="float:left;margin:25px;"/>
				<div style="font-size:12px;margin:5px;"><spring:message code="label.schoolselectiondesc"/></div> 
			</td>
    		</tr>
		<tr class="row10">
			<td>
				<div style="font-size:15px;font-weight:bolder;margin:5px;"><spring:message code="label.schoolcompare"/></div>
				<div class="line-type1-flat"></div>
				<img src="../img/treasure.png" style="float:right;margin:25px;"/>
				<div style="font-size:12px;margin:5px;"><spring:message code="label.schoolcomparedesc"/></div> 
			</td>
			
    		</tr>
		<tr class="row11">
			<td>
				<div style="font-size:15px;font-weight:bolder;margin:5px;"><spring:message code="label.reversesearch"/></div>
				<div class="line-type1-flat"></div>
				<img src="../img/search.png" style="float:left;margin:25px;"/>
				<div style="font-size:12px;margin:5px;"><spring:message code="label.reversesearchdesc"/></div> 
			</td>
    		</tr>
		<tr class="row10">
			<td>
				<div style="font-size:15px;font-weight:bolder;margin:5px;"><spring:message code="label.schoolapplication"/></div>
				<div class="line-type1-flat"></div>
				<img src="../img/calendarKid.png" style="float:right;margin:25px;"/>
				<div style="font-size:12px;margin:5px;"><spring:message code="label.schoolapplicationdesc"/></div> 
			</td>
    		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td colspan="2"><div class="line-type2-flat"></div></td></tr>
		<tr><td colspan="2">&nbsp;</td></tr>
	</table>

</div><div class="pbox1Footer"><div class="pbox1BL"></div><div class="pbox1BR"></div></div></div></div>
</td>
</tr>
</table>
</div>

