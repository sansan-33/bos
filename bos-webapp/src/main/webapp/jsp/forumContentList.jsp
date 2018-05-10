<%@ include file="common-header.jsp" %>

<script type="text/javascript" charset="utf-8">
		
			/* Table initialisation */
			$(document).ready(function() {

				$('#forumTable').dataTable( {
					"bProcessing": true,
					"bServerSide": true,
					"bLengthChange": false,
					"sAjaxSource": "/school/controller/getForumContentListData?categoryid=${requestScope.categoryid}&type=${requestScope.type}&isparentrating=${requestScope.isparentrating}&userid=${requestScope.requestuserid}",
					"sDom": "<'top'iflp<'clear'>>rt<'bottom'iflp<'clear'>>'",
					"iDisplayLength": 25,
					"sPaginationType": "bootstrap",
					"bStateSave": true,
					"fnStateSave": function(oSettings, oData) { save_dt_view(oSettings, oData); },
				    "fnStateLoad": function(oSettings) { return load_dt_view(oSettings); },
					"bFilter": false,
					"bPaginate": true,
					"oLanguage": {
						"oPaginate": { "sNext": "<spring:message code='label.nextpage'/>",	"sPrevious": "<spring:message code='label.previouspage'/>"},
						"sLengthMenu": "_MENU_ <spring:message code='label.recordsperpage'/>",
						"sZeroRecords": "&nbsp;",
						"sSearch": "<spring:message code='label.search'/>", 
						"sInfo": "<spring:message code='label.showing'/> _START_ <spring:message code='label.to'/> _END_ <spring:message code='label.of'/> _TOTAL_ <spring:message code='label.records'/>",
						"sInfoEmpty": "<spring:message code='label.showing'/> 0 <spring:message code='label.to'/> 0 <spring:message code='label.of'/> 0 <spring:message code='label.records'/>",
						"sInfoFiltered": "(<spring:message code='label.filter'/> _MAX_ <spring:message code='label.records'/>)"
			
					}
				} );
				
			} );
</script>

<jsp:include page="menu.jsp"/>

<c:choose>
<c:when test="${not empty requestScope.mypost && sessionScope.user['id'] eq requestScope.requestuserid}">
<jsp:include page="account/accountMenu.jsp"/>
<div style="padding: 0px 30px 0 30px;">
</c:when>
<c:when test="${not empty requestScope.mypost}">
<span  class="font4 d3-color-gray-1">${requestScope.forumcontentlist[0]['username']}<spring:message code='label.publishpost'/></span><br class="clear"><br class="clear">
</c:when>
</c:choose>
					<c:set var="parentrating"><spring:message code='label.parentrating'/></c:set>
					<c:set var="signupalert">alert("<spring:message code='label.pleaselogin'/>")</c:set>
					<c:set var="askquestion">window.location="/school/controller/askQuestion?id=0&type=${requestScope.topmenu[0]["type"]}&categoryid=${requestScope.topmenu[0]["categoryid"]}&maincategoryname=${requestScope.topmenu[0]["maincategoryname"]}&maincategoryuri=getForumContent"</c:set>
					
					
					<jsp:include page="ads/wideAds.jsp"/>
					
					<div style="border-bottom: 1px dashed grey;"></div>	
					<br class="clearboth">	
					<c:if test="${empty requestScope.mypost }">
					<div style="position:relative;float:left;"><span class="button_grn"><span class="bg_grn gradient" onclick='${not empty sessionScope.user ? askquestion : signupalert }'><spring:message code="label.askquestion"/></span></span>
     				</div>
     				</c:if>
					<br class="clearboth">
					<div style="float:left;position:relative;">
					<table width="1080px" class="bordered-table zebra-striped" id="forumTable">
						<thead> 
						<tr>
							<TH width="400"><font class="fontlarge"><spring:message code="forum.subject"/></font></TH>
							<TH width="60"><font class="fontlarge"><spring:message code="forum.author"/></font></TH>
					        <TH width="70"><font class="fontlarge"><spring:message code="forum.reply"/>/<spring:message code="forum.view"/></font></TH>
					        <TH width="60"><font class="fontlarge"><spring:message code="label.lastupdate"/></font></TH>
					  </tr>
						</thead> 
						<tbody>
						<tr>
							<td colspan="5" class="dataTables_empty"><spring:message code="label.loadingdata"/></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<TH width="400"><font class="fontlarge"><spring:message code="forum.subject"/></font></TH>
                            <TH width="60"><font class="fontlarge"><spring:message code="forum.author"/></font></TH>
                            <TH width="70"><font class="fontlarge"><spring:message code="forum.reply"/>/<spring:message code="forum.view"/></font></TH>
                            <TH width="60"><font class="fontlarge"><spring:message code="label.lastupdate"/></font></TH>
						</tr>
					</tfoot>
					</table>
					</div>

					
					
<c:if test="${not empty requestScope.mypost}">
</div>
</c:if>

					<br class="clearboth"><br class="clearboth">	
<div style="border-bottom: 1px dashed grey;"></div>	
					<br class="clearboth">	



<jsp:include page="common-footer.jsp"/>





<form action="/school/controller/getForumDetails" method="post" name="forum" id="forum">
<input type="hidden" name="id" id="id" value="-1" />
<input type="hidden" name="categoryid" id="categoryid" value="-1" />
<input type="hidden" name="type" id="type" value="-1" />
<input type="hidden" name="maincategoryname" id="maincategoryname" value="-1" />
<input type="hidden" name="maincategoryuri" id="maincategoryuri" value="-1" />
</form>  	
       

<script type="text/javascript">

function getForumContent(id,categoryid,type,maincategoryname,maincategoryuri){

	document.forms["forum"].id.value = id;
	document.forms["forum"].categoryid.value = categoryid;
	document.forms["forum"].type.value = type;
	document.forms["forum"].maincategoryname.value = maincategoryname;
	document.forms["forum"].maincategoryuri.value = maincategoryuri;
	
	document.forms["forum"].submit();
}
</script>
