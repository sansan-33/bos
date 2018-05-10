<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<c:choose>
<c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'home') || requestScope['javax.servlet.forward.request_uri'] eq '/' }">

<!-- Javascript tag: -->
<!-- begin ZEDO for channel:  Bookofschool.com_Homepage , publisher: Bookofschool , Ad Dimension: Half Page - 300 x 600 -->
<script language="JavaScript">
var zflag_nid="1044"; var zflag_cid="1774/1773"; var zflag_sid="402"; var zflag_width="300"; var zflag_height="600"; var zflag_sz="38";
</script>
<script language="JavaScript" src="https://tt3.zedo.com/jsc/tt3/fo.js"></script>
<!-- end ZEDO for channel:  Bookofschool.com_Homepage , publisher: Bookofschool , Ad Dimension: Half Page - 300 x 600 -->

</c:when>
<c:otherwise>

<!-- Javascript tag: -->
<!-- begin ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Half Page - 300 x 600 -->
<script language="JavaScript">
var zflag_nid="1044"; var zflag_cid="1775/1773"; var zflag_sid="402"; var zflag_width="300"; var zflag_height="600"; var zflag_sz="38";
</script>
<script language="JavaScript" src="https://tt3.zedo.com/jsc/tt3/fo.js"></script>
<!-- end ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Half Page - 300 x 600 -->

</c:otherwise>
</c:choose>