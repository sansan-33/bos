<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<!--  polling dialog -->
<div id="pollingembed">
  <div>
    
    <h2><spring:message code="label.parentrating"/></h2>
    <c:set var="anonymous"><spring:message code='label.anonymous'/></c:set>    
    <c:set var="defaultusercomment"><spring:message code='label.optionalcomment'/></c:set>    
    
    <p class="font4" style="padding:10px;">
     <spring:message code="label.signupkidschoolpolling" />
    </p>
    <input type="hidden" name="pollingentityid" value="" />
	<input type="hidden" name="type" value="polling" />
	<input type="hidden" name="schoolname" value="" />
	<input type="hidden" name="commenttext" id='commenttext' value='<spring:message code="label.parentrating"/>' />
	<input type="hidden" name="commentsubject" id='commentsubject' value='' />
	<input type="hidden" name="keywords" id='keywords' value='polling' />
   	<input type="hidden" name="metric1" value="" id="metric1" />
    <input type="hidden" name="metric2" value="" id="metric2" />
    <input type="hidden" name="metric3" value="" id="metric3" />
    <input type="hidden" name="metric4" value="" id="metric4" />
    <input type="hidden" name="metric5" value="0" id="metric5" />
    <input type="hidden" name="commentid" value="" id="commentid" />
    					
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric1"/> : </span><span class="metric1"></span><span id="hint1"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric2"/> : </span><span class="metric2"></span><span id="hint2"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric3"/> : </span><span class="metric3"></span><span id="hint3"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric4"/> : </span><span class="metric4"></span><span id="hint4"></span><br>
   <br>
    <textarea class="expand" name="usercommenttext" id="usercommenttext" style="padding-top:8px;font-size:0.95em;color:rgb(170,170,170);width:400px;height:50px;" >${not empty requestScope.param['usercomment'] ? requestScope.param['usercomment'] : ''}</textarea> 
    <br><br><br><br>
    
<!-- yes/no buttons -->
  </div>
</div>


<script type="text/javascript" >
$(document).ready(function() {
	
 
$('.metric1').raty({
  <c:if test="${not empty requestScope.param['metric1half'] }"> score:  ${requestScope.param['metric1half']}, </c:if>
  target		: '#hint1',
  hints:  ['<spring:message code="label.bad"/>', '<spring:message code="label.poor"/>', '<spring:message code="label.average"/>', '<spring:message code="label.good"/>', '<spring:message code="label.excellent"/>'],
  half      : true,
  size      : 24,
  path: '/school/img',
  starHalf  : 'pollhalf.png',
  starOff   : 'polloff.png',
  starOn    : 'pollon.png',
  click: function(score, evt) {
	    $('.metric1').raty('readOnly', false);
	  }
});

$('.metric2').raty({
  <c:if test="${not empty requestScope.param['metric2half'] }"> score:  ${requestScope.param['metric2half']}, </c:if>
  hints:  ['<spring:message code="label.teacher.bad"/>', '<spring:message code="label.teacher.poor"/>', '<spring:message code="label.teacher.average"/>', '<spring:message code="label.teacher.good"/>', '<spring:message code="label.teacher.excellent"/>'],
  target		: '#hint2',
  half      : true,
  size      : 24,
  path: '/school/img',
  starHalf  : 'pollhalf.png',
  starOff   : 'polloff.png',
  starOn    : 'pollon.png',
  click: function(score, evt) {
	    $('.metric2').raty('readOnly', false);
	  }

});
$('.metric3').raty({
  <c:if test="${not empty requestScope.param['metric3half'] }"> score:  ${requestScope.param['metric3half']}, </c:if>
  hints:  ['<spring:message code="label.homework.bad"/>', '<spring:message code="label.homework.poor"/>', '<spring:message code="label.homework.average"/>', '<spring:message code="label.homework.good"/>', '<spring:message code="label.homework.excellent"/>'],
  target		: '#hint3',
  half      : true,
  size      : 24,
  path: '/school/img',
  starHalf  : 'pollhalf.png',
  starOff   : 'polloff.png',
  starOn    : 'pollon.png',
  click: function(score, evt) {
	    $('.metric3').raty('readOnly', false);
	  }

});
$('.metric4').raty({
	  <c:if test="${not empty requestScope.param['metric4half'] }"> score:  ${requestScope.param['metric4half']}, </c:if>
	  hints:  ['<spring:message code="label.conduct"/><spring:message code="label.bad"/>', '<spring:message code="label.conduct"/><spring:message code="label.poor"/>', '<spring:message code="label.conduct"/><spring:message code="label.average"/>', '<spring:message code="label.conduct"/><spring:message code="label.good"/>', '<spring:message code="label.conduct"/><spring:message code="label.excellent"/>'],
	  target		: '#hint4',
	  half      : true,
	  size      : 24,
	  path: '/school/img',
	  starHalf  : 'pollhalf.png',
	  starOff   : 'polloff.png',
	  starOn    : 'pollon.png',
	  click: function(score, evt) {
		    $('.metric4').raty('readOnly', false);
		  }

	});  
});

</script>