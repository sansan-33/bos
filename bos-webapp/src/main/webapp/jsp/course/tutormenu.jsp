<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div style="padding-left:100px;position:relative;top:-20px;"><font class="font1"><spring:message code="label.tutor.module.desc"/></font></div>
<table style="margin: auto;">
<tr>
<td><div class="wrpBtn"><div class="button_ta ${requestScope.tutortab eq 0 ? 'org' : 'ylw' } lrg"><input class="submit" type="submit" onclick="javascript:{window.location='/school/controller/getCourseList?tutortab=0'}" value='<spring:message code='label.search'/>'/></div></div></td>
<td><div class="wrpBtn"><div class="button_ta ${requestScope.tutortab eq 1 ? 'org' : 'ylw' } lrg"><input class="submit" type="submit" onclick="javascript:{window.location='/school/controller/getParentTutorConsole?tutortab=1'}" value='<spring:message code="label.parent"/>'/></div></div></td>
<td><div class="wrpBtn"><div class="button_ta ${requestScope.tutortab eq 2 ? 'org' : 'ylw' } lrg"><input class="submit" type="submit" onclick="javascript:{window.location='/school/controller/getTutorConsole?tutortab=2'}" value='<spring:message code="label.tutor"/>'/></div></div></td>
<td><div class="wrpBtn"><div class="button_ta ${requestScope.tutortab eq 3 ? 'org' : 'ylw' } lrg"><input class="submit" type="submit" onclick="javascript:{window.location='/school/controller/getMatchedCourseConsole?tutortab=3'}" value='<spring:message code="label.automatch"/>'/></div></div></td>
</tr></table>	
