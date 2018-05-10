<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:if test="${ requestScope.adtype eq '5'}">
  <jsp:include page="catfish.jsp"/>
  <script>
      console.log('Show backup script from adsfactor: 5' );
  </script>
</c:if>