<%@page import="java.util.*" %>
<%
    Random rand = new Random();
    int n = rand.nextInt(3);
    String[] adspath = {"/school/jsp/ads/custom/300x250.jsp","/school/jsp/ads/custom/300x250img.jsp","/school/jsp/ads/custom/300x250img.jsp"};
%>


<iframe src="<%=adspath[n]%>" style="height:250px;width:308px;" scrolling="no">
</iframe>
