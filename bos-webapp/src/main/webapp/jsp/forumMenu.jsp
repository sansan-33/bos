<%@ include file="common-header.jsp" %>

<LINK REL='stylesheet' TYPE='text/css' HREF='${pageContext.request.contextPath}/stylesheet/forum.css'>

<jsp:include page="menu.jsp"/>

<br>
<div class="contents-frame" style="left: 5px;position: relative;"><div class="contents-frame-lv1"><div class="contents-frame-lv2"><div class="contents-frame-inner-full">

	<c:if test="${sessionScope.user['roleid'] eq '1' }">
	<div style="position:relative;float:right;">
	<a href='/school/controller/askQuestion?id=0&type=newspaper'> <img src="/school/img/newspaper.jpeg" style="width:50px;height:40px" ></a>
    </div>
    </c:if>	
	<ul class="colors-subtle" style="padding:30px;">
		<li class="forumli">
			<img src="../img/hot.png" class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','','hot','label.hottopic','getForumContent')"><spring:message code="label.hottopic"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;"></font>
			<br><p class="d3-color-gray forumcategorydesc"  ><spring:message code="forum.hottopicdesc"/></p><br>
			</div>
			<br class="clear"/><br class="clear"/>
		</li>
		
		<li class="forumli">
			<img src="../img/kindergarten.png"  class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','0','q','label.kindergarten','getForumContent')"><spring:message code="label.kindergarten"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['0'] ? 0 : requestScope.forumcount['0']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" ><spring:message code="forum.kindergartendesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>
		
		<li class="forumli">
			<img src="../img/primary.png"  class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','1','q','label.primary','getForumContent')"><spring:message code="label.primary"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['1'] ? 0 : requestScope.forumcount['1']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" ><spring:message code="forum.primarydesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>

		<li class="forumli">
			<img src="../img/secondary.png"  class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','2','q','label.secondary','getForumContent')"><spring:message code="label.secondary"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['2'] ? 0 : requestScope.forumcount['2']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" ><spring:message code="forum.secondarydesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>

		<li class="forumli">
			<img src="../img/ib.png" class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','5','q','label.ib','getForumContent')"><spring:message code="label.ib"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['5'] ? 0 : requestScope.forumcount['5']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" ><spring:message code="forum.ibdesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>

		<li class="forumli">
			<img src="../img/course.png" class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','','tutor','label.tutormenu','getForumContent')"><spring:message code="label.tutormenu"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['tutor'] ? 0 : requestScope.forumcount['tutor']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" ><spring:message code="forum.extradesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>
		<li class="forumli">
			<img src="../img/light-bulb-icon.png" class="forumcategoryicon"/>
			<div class="forumcategory">
			<a class="d3-color-green-2" href="#" onclick="getForumContent('-1','','support','label.supportfeedback','getForumContent')"><spring:message code="label.supportfeedback"/><spring:message code="label.discussion"/></a> <font class="d3-color-gray" style="font-size:10px;">(<spring:message code="label.today"/>:${empty requestScope.forumcount['support'] ? 0 : requestScope.forumcount['support']}) </font>
			<br><p class="d3-color-gray forumcategorydesc" > <spring:message code="forum.supportfeedbackdesc"/></p><br>
			</div>
			<div class="line-type2-flat"></div>
			<br class="clear"/><br class="clear"/>
		</li>
		
	</ul>
</div></div></div></div>
	
<form action="/school/controller/getForumContentList" method="post" name="forummenu" id="forummenu">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>  	
       
<jsp:include page="common-footer.jsp"/>

<script type="text/javascript">

function getForumContent(id, categoryid,type,maincategoryname,maincategoryuri){

	reset_dt_view();
	document.forms["forummenu"].id.value = id;
	document.forms["forummenu"].categoryid.value = categoryid;
	document.forms["forummenu"].type.value = type;
	document.forms["forummenu"].maincategoryname.value = maincategoryname;
	document.forms["forummenu"].maincategoryuri.value = maincategoryuri;
	
	document.forms["forummenu"].submit();
}
</script>