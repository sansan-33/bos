<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>


					<c:if test="${ not fn:contains(pageContext.request.serverName ,'localhost')}">
					<div style="float:right;position:relative;width:160px;">
						<jsp:include page="adsfactorsky.jsp"/>
						<jsp:include page="yahoohotspotthin.jsp"/>
					</div>
					</c:if>