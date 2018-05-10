<script type="text/javascript" src="/school/js/jquery.chained.mini.js" charset="utf-8"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="row-grey" style="margin:10px;padding:20px">
<select id="parentcategory" name="parentcategory" style="width: 8em;">
  <option value=""><spring:message code="label.reversesearchselect"/></option>
  <option value="1" <c:if test="${requestScope.parentSchoolCategory eq '1'}">selected</c:if> ><spring:message code="label.primary"/></option>
  <option value="2" <c:if test="${requestScope.parentSchoolCategory eq '2'}">selected</c:if> ><spring:message code="label.secondary"/></option>
</select>
<select id="parententityid" name="parententityid" style="width: 25em;">
  <option value="">--</option>
  <c:forEach var="primary" items="${requestScope.primarySchoolList}" varStatus="rowCounter">
			<option value="${primary['value']}" class="1" <c:if test="${requestScope.reverseSelectedSchool eq primary['value']}">selected</c:if> >
                    		${primary['description']} 
			</option>
  </c:forEach>
  <c:forEach var="secondary" items="${requestScope.secondarySchoolList}" varStatus="rowCounter">
			<option value="${secondary['value']}" class="2" <c:if test="${requestScope.reverseSelectedSchool eq secondary['value']}">selected</c:if> >
                    		${secondary['description']} 
			</option>
  </c:forEach>
 </select>
 <script type="text/javascript" charset="utf-8">
          $(function(){
              $("#parententityid").chained("#parentcategory"); 
          });
</script>
 </div>