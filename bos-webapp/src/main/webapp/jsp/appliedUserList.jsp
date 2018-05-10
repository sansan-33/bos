<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tutor -->
<div id="tutorcourse">
  <div style="padding-left:20px;background-color: rgb(242,246,235);">
    <br><br><br>

					<br>
					<c:forEach var="applieduserlist" begin="0"  items="${requestScope.applieduserlist}" varStatus="rowCounter">
					<br class="clearboth">
					<div style="height:auto;padding:10px;">
					<div style="float:left;padding-right:10px;" class="font2" >
							<img style="padding-right:0px;" src="/school/img/unknown.gif"  onerror="ImgError(this);"  width="25px" height="25px"/><br>
									${applieduserlist['namelocal']}
									
					</div>
					<div style="float:left;border: 1px dashed white;width:280px;padding:10px;background-color:rgb(241,241,241);">
					
					<a style='padding-left:20px;' href='/school/controller/getChatDialog?id=${applieduserlist["questionanswerid"]}&type=c&entityid=${requestScope.courseid}&nocache=<%=new java.util.Date().getTime()%>' rel='#overlay_chat'> 
						<span class="wrpBtn" ><span class="button_ta mdm" style="margin-left:5px"><input style="width:50px;" class="submit" type="button"  value="<spring:message code='label.chathistory'/>" /></span></span>
					</a> 
					<br>
					</div> <!--  questionanswer box -->
					</div>
					<br><br>
					</c:forEach>
					
    				<c:if test="${empty requestScope.applieduserlist }"><spring:message code="label.noinformation"/></c:if>
    
    <br><br><br>
    
  </div>
</div>

<!-- make all links with the 'rel' attribute open overlays -->
<script>
$(function() {
	 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        effect: 'apple',
 
        onBeforeLoad: function() {
 
            // grab wrapper element inside content
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});
</script>