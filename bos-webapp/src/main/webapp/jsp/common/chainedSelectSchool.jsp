<script type="text/javascript" src="/school/js/jquery.chained.mini.js" charset="utf-8"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div style="">
<select id="category" name="category" style="width: 10em;">
  <option value=""><spring:message code="label.reversesearchselect"/></option>
  <option value="0" <c:if test="${requestScope.chainedSchoolCategory eq '0'}">selected</c:if> ><spring:message code="label.kindergarten"/></option>
  <option value="1" <c:if test="${requestScope.chainedSchoolCategory eq '1'}">selected</c:if> ><spring:message code="label.primary"/></option>
  <option value="2" <c:if test="${requestScope.chainedSchoolCategory eq '2'}">selected</c:if> ><spring:message code="label.secondary"/></option>
  <option value="5" <c:if test="${requestScope.chainedSchoolCategory eq '2'}">selected</c:if> ><spring:message code="label.ib"/></option>
</select>
<select id="entityid" name="entityid" style="width: ${not empty requestScope.selectbig && requestScope.selectbig eq 'y' ? '40em;' : '27em;'}">
  <option value="">---</option>
  <c:forEach var="kindergarten" items="${kindergartenSchoolList}" varStatus="rowCounter">
			<option value="${kindergarten['value']}" class="0" <c:if test="${requestScope.selectedSchool eq kindergarten['value']}">selected</c:if> >
                    		${kindergarten['description']} 
			</option>
  </c:forEach>
  <c:forEach var="primary" items="${primarySchoolList}" varStatus="rowCounter">
			<option value="${primary['value']}" class="1" <c:if test="${requestScope.selectedSchool eq primary['value']}">selected</c:if> >
                    		${primary['description']} 
			</option>
  </c:forEach>
  <c:forEach var="secondary" items="${secondarySchoolList}" varStatus="rowCounter">
			<option value="${secondary['value']}" class="2" <c:if test="${requestScope.selectedSchool eq secondary['value']}">selected</c:if> >
                    		${secondary['description']} 
			</option>
  </c:forEach>
  <c:forEach var="ib" items="${ibSchoolList}" varStatus="rowCounter">
  			<option value="${ib['value']}" class="5" <c:if test="${requestScope.selectedSchool eq ib['value']}">selected</c:if> >
                      		${ib['description']}
  			</option>
  </c:forEach>
 </select>
 <script type="text/javascript" charset="utf-8">
          $(function(){
              $("#entityid").chained("#category"); 
          });
</script>
 </div>