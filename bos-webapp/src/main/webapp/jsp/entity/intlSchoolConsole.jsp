<%@ include file="../common-header.jsp" %>

<jsp:include page="../menu.jsp"/>


<c:set var="canada" value='<%="\u52A0\u62FF\u5927"%>' />
<c:set var="usa" value='<%="\u7F8E\u570B"%>' />
<c:set var="british" value='<%="\u82F1\u570B"%>' />
<c:set var="other" value='<%="\u5176\u5B83"%>' />
<c:set var="ib" value='<%="\u570B\u969B\u6587\u6191"%>' />
<c:set var="hksystem" value='<%="\u9999\u6E2F\u5F0F\u7684\u8AB2\u7A0B:\u5E7C\u7A1A\u5712 3\u5E74 2\u6B728\u500B\u6708-5\u6B72 (K1-K3) | \u5C0F\u5B78 6\u5E74 6-11\u6B72 (\u5C0F\u4E00\u81F3\u5C0F\u516D) | \u4E2D\u5B78 7\u5E74 12-18\u6B72 (\u4E2D\u4E00\u81F3\u4E2D\u4E03)"%>' />
	
	
	
	<p class="fontxlarge d3-color-gray-3" style="padding: 25px 35px;">${hksystem}</p>
	<div style="margin-left:40px;margin-top:20px;">
	<c:forEach var="school" items="${requestScope.schoolList}" varStatus="rowCounter">
	<c:set var='sys'>${school['schoolsystem']}</c:set>
		<div style="padding:10px;">
  			<div style="position:relative;float:left"><img style="width:50px;height:50px" src="/school/img/${fn:contains( sys, canada ) ? 'canada' : fn:contains( sys, usa ) ? 'usa' : fn:contains( sys, british ) ? 'british' : fn:contains( sys, ib ) ? 'ib' : 'other' }.png"></div>
			<div style="position:relative;float:left;padding-left:15px;padding-top:5px;" class="commondiv" onclick="getSchoolListBySystem('${school['schoolsystem'] }')">
			<font class="fontxxlarge d3-color-gray-1">${school['schoolsystem'] }</font><br>
			<font class="d3-color-gray-1">${school['schoolsystemdesc'] }</font><br>
			<font class="d3-color-gray-1">(${school['noofschool']} <spring:message code="label.totalschool"/>)</font>
			</div>
		</div>
		<br class="clear">
	</c:forEach>
	</div>
	
	
       
<jsp:include page="../common-footer.jsp"/>

