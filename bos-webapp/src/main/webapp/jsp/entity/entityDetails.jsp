<%@ include file="../common-header.jsp" %>

<jsp:include page="../menu.jsp"/>
<c:catch var="exception">
<c:if test="${requestScope.pollingtype ne 'polling' }">
<jsp:include page="pollingoverlay.jsp"/>
</c:if>
<c:set var="noofyear" value='5' />


<c:set var="compareCategory" value="${requestScope.entityVerticalCategoryList[0]}"/> 
	<c:set var="mapkey1" value="${compareCategory[1]['key']}${noofyear-1}"/> <!-- full name -->
	<c:set var="mapkey2" value="${compareCategory[2]['key']}${noofyear-1}"/> <!-- Address -->
	<c:set var="mapkey3" value="${compareCategory[3]['key']}${noofyear-1}"/> <!-- Telephone -->
	<c:set var="mapkey4" value="${compareCategory[4]['key']}${noofyear-1}"/> <!-- URL -->
	<c:set var="mapkey5" value="${compareCategory[5]['key']}${noofyear-1}"/> <!-- Language -->

	<c:set var="mapkey6" value="${compareCategory[6]['key']}${noofyear-1}"/> <!-- nominated -->
	<c:set var="mapkey7" value="${compareCategory[7]['key']}${noofyear-1}"/> <!-- throughtrain -->
	<c:set var="mapkey8" value="${compareCategory[8]['key']}${noofyear-1}"/> <!-- feeder -->
	<c:set var="mapkey9" value="${compareCategory[9]['key']}${noofyear-1}"/> <!-- school mission -->
	<c:set var="mapkey10" value="${compareCategory[10]['key']}${noofyear-1}"/> <!-- school motto -->
	<c:set var="mapkey11" value="${compareCategory[11]['key']}${noofyear-1}"/> <!-- yearofcommencement -->
	<c:set var="mapkey12" value="${compareCategory[12]['key']}${noofyear-1}"/> <!-- languagepolicy -->
	<c:set var="mapkey13" value="${compareCategory[13]['key']}${noofyear-1}"/> <!-- financetype -->
	<c:set var="mapkey14" value="${compareCategory[14]['key']}${noofyear-1}"/> <!-- poaschoolnet -->
	<c:set var="mapkey15" value="${compareCategory[15]['key']}${noofyear-1}"/> <!-- Nursery -->
    <c:set var="mapkey16" value="${compareCategory[16]['key']}${noofyear-1}"/> <!-- name chi -->
	<c:set var="mapkey17" value="${compareCategory[17]['key']}${noofyear-1}"/> <!-- name eng -->
	<c:set var="mapkey18" value="${compareCategory[18]['key']}${noofyear-1}"/> <!-- sex -->
	<c:set var="mapkey19" value="${compareCategory[19]['key']}${noofyear-1}"/> <!-- session -->
	<c:set var="mapkey20" value="${compareCategory[20]['key']}${noofyear-1}"/> <!-- principal -->
	<c:set var="mapkey21" value="${compareCategory[21]['key']}${noofyear-1}"/> <!-- religion -->
	<c:set var="mapkey22" value="${compareCategory[22]['key']}${noofyear-1}"/> <!-- nofotest or session for kindergarten-->
  	<c:set var="mapkey23" value="${compareCategory[23]['key']}${noofyear-1}"/> <!-- noofexam -->
   	<c:set var="mapkey24" value="${compareCategory[24]['key']}${noofyear-1}"/> <!-- elite -->


<script src="/school/js/rssdisplayer.js"></script>
<script src="/school/js/jquery.corner.js"></script>
<script type="text/javascript" charset="utf-8" src="/school/js/jquery.raty.min.js"></script>
<script type="text/javascript" >
	
	$('div.basicentityinfo').corner("round 9px");
	

	this.imagePreview = function(){	
	/* CONFIG */
		
		xOffset = 10;
		yOffset = 30;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$("a.preview").hover(function(e){
		this.t = this.title;
		this.title = "";	
		var c = (this.t != "") ? "<br/>" + this.t : "";
		$("body").append("<p id='preview'><img width='500px;' height='400px;' src='"+ this.href +"' alt='${compareCategory[16][mapkey16]}' /><font class='font1'>"+ c +"</font><br></p>");
 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast");						
    },
	function(){
		this.title = this.t;	
		$("#preview").remove();
    });	
	$("a.preview").mousemove(function(e){
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};

function getNavSchool(entityid,action,nav){
	document.forms["navschool"].entityid.value = entityid;
	document.forms["navschool"].action.value = action;
	document.forms["navschool"].nav.value = nav;
	document.forms["navschool"].submit();
}
	


function submitPolling(){
    document.forms["pollingform"].formsubmitsource.value='bos';
	document.forms["pollingform"].metric1.value = $('.metric1').raty('score') * 2;
	document.forms["pollingform"].metric2.value = $('.metric2').raty('score') * 2;
	document.forms["pollingform"].metric3.value = $('.metric3').raty('score') * 2;
	document.forms["pollingform"].metric4.value = $('.metric4').raty('score') * 2;
	if(document.forms["pollingform"].usercommenttext.value.length < 5 ){
		alert("<spring:message code='warning.notenoughtext'/> ");
		return false;
	}
	
	if(isNaN($('.metric1').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric1'/> ");
		return false;
	}
	if(isNaN($('.metric2').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric2'/> ");
		return false;
	}
	if(isNaN($('.metric3').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric3'/> ");
		return false;
	}
	if(isNaN($('.metric4').raty('score') * 2) ){
		alert("<spring:message code='label.pleasepoll'/>  <spring:message code='label.parentmetric4'/> ");
		return false;
	}
    $('#usercommenttext').val(nl2br($('#usercommenttext').val()));

	document.forms["pollingform"].submit();
}

function showPolling(){
    $("#polling").overlay().load();
}

$(document).ready(function() {
	
	
	
	$("#slideToggle").click(function() {
	    $(".slideTogglebox").toggle("slow");
	  });
	
	
	imagePreview();
	
	$('textarea.expand').focus(function () {
	    $(this).animate({ height: "8em" }, 500);
	});
	console.log($('textarea').val());
    console.log(br2nl($('textarea').val()));
    $('textarea:not(#questionanswer)').html(br2nl($('textarea').val()));

	$("#grading").tooltip({ 
		effect: 'slide',
		position: 'bottom center',
		offset: [-2, 10],
	    relative: true
	});
	$("#barchart").tooltip({ 
		effect: 'slide',
		position: 'bottom center',
		offset: [-2, 10],
	    relative: true
	});
   $("input[rel]").overlay();	
	
 
$('.metric1').raty({
  <c:if test="${not empty requestScope.yourscore['metric1'] }"> score:  ${requestScope.yourscore['metric1']}, </c:if>
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
  <c:if test="${not empty requestScope.yourscore['metric2'] }"> score:  ${requestScope.yourscore['metric2']}, </c:if>
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
  <c:if test="${not empty requestScope.yourscore['metric3'] }"> score:  ${requestScope.yourscore['metric3']}, </c:if>
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
	  <c:if test="${not empty requestScope.yourscore['metric4'] }"> score:  ${requestScope.yourscore['metric4']}, </c:if>
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

<!--  polling dialog -->
<div id="polling">
  <div>
    
    <h2><spring:message code="label.parentrating"/></h2>
    <c:set var="parent"><spring:message code='label.anonymous'/></c:set>
    <c:set var="parentwithname"><spring:message code='label.parent'/>${sessionScope.user['namelocal']}</c:set>

    <c:set var="defaultusercomment"><spring:message code='label.optionalcomment'/></c:set>
    
    <p class="font4" style="padding:10px;">
     <spring:message code="label.rateschoolbyparent" arguments="${compareCategory[16][mapkey16]}" argumentSeparator=";" />
    </p>
    <form action="saveComment" method="post" name="pollingform" id="pollingform" style="padding-left:40px;padding-right:40px;">
	<input type="hidden" name="formsubmitsource" value="polling" />
	<input type="hidden" name="entityid" value="${requestScope.entityid}" />
	<input type="hidden" name="action" value="compare" />
	<input type="hidden" name="type" value="polling" />
	<input type="hidden" name="schoolname" value="${compareCategory[16][mapkey16]}" />
	<input type="hidden" name="commenttext" id='commenttext' value='<spring:message code="label.parentrating"/>' />
	<input type="hidden" name="commentsubject" id='commentsubject' value='<spring:message code="label.parentratedsubject" arguments="${empty sessionScope.user ||  sessionScope.user['anonymous'] eq 'y' ? parent : parentwithname }" argumentSeparator=";"/>' />
	<input type="hidden" name="keywords" id='keywords' value='polling' />
   	<input type="hidden" name="metric1" value="" id="metric1" />
    <input type="hidden" name="metric2" value="" id="metric2" />
    <input type="hidden" name="metric3" value="" id="metric3" />
    <input type="hidden" name="metric4" value="" id="metric4" />
    <input type="hidden" name="metric5" value="0" id="metric5" />
    <input type="hidden" name="commentid" value="${requestScope.yourscore['commentid']}" id="commentid" />
    <input type="hidden" name="categoryid" value="${requestScope.categoryid}" id="categoryid" />
    					
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric1"/> : </span><span class="metric1"></span><span id="hint1"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric2"/> : </span><span class="metric2"></span><span id="hint2"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric3"/> : </span><span class="metric3"></span><span id="hint3"></span><br>
    <span style="position:relative;top:-4px;" class="font3"><spring:message code="label.parentmetric4"/> : </span><span class="metric4"></span><span id="hint4"></span><br>
   <br>
    <textarea rows="3" cols="78" class="expand" name="usercommenttext" id="usercommenttext" style="padding-top:8px;font-size:0.95em;color:rgb(170,170,170);width:400px;height:5em;" onclick="clickclear(this, '<spring:message code='label.optionalcomment'/>');document.getElementById('usercommenttext').style.color='black';" onblur="clickrecall(this,'<spring:message code='label.optionalcomment'/>')">${not empty requestScope.yourscore['comment'] &&  requestScope.yourscore['comment'] ne '-1' ? requestScope.yourscore['comment'] : defaultusercomment}</textarea>
    <span class="button_grn"><span class="bg_grn gradient" onclick="javascript:submitPolling()"><spring:message code="label.done"/></span></span>
    <br><br><br>
    </form>
<!-- yes/no buttons -->
  </div>
</div>



<script>
$(document).ready(function() {
  
    // select the overlay element - and "make it an overlay"
  $("#polling").overlay({

	    // custom top position
	    top: 160,
	
	    // some mask tweaks suitable for facebox-looking dialogs
	    mask: {
	
	    // you might also consider a "transparent" color for the mask
	    color: '#fff',
	
	    // load mask a little faster
	    loadSpeed: 200,
	
	    // very transparent
	    opacity: 0.5
	    },
	
	    // disable this for modal dialog-type of overlays
	    closeOnClick: false,
	    // if active polling type is parent polling, then show parent polling form
	    <c:if test="${sessionScope.autoPollingPopUp eq 'y' && requestScope.pollingtype eq 'polling' }">
	    load: true,
		</c:if>
	    onClose: function(){
	    	if($('.metric1').raty('score') > 0 ){
			//do nothing		   	
			}else{
				//ajaxRequest("/school/controller/refusepolling/${requestScope.entityid}");
	
			}
	    },

    
    });
    
    });
</script>

<div class="schooldetailscontainer">



<c:choose><c:when test="${not empty requestScope.rankingdistrict && requestScope.categoryid ne 5 }"><c:set var="rankingdistrict" value="${requestScope.rankingdistrict}"/></c:when><c:otherwise>
<c:set var="rankingdistrict" value="999"/></c:otherwise></c:choose>
	<c:choose><c:when test="${not empty requestScope.rankingfinancetype && requestScope.categoryid ne 5 }"><c:set var="rankingfinancetype" value="${requestScope.rankingfinancetype}"/></c:when><c:otherwise>
	<c:set var="rankingfinancetype" value="999"/></c:otherwise></c:choose>
	<c:choose>
	<c:when test="${requestScope.ranking <= rankingdistrict }">
			<c:choose>
			<c:when test="${requestScope.ranking <= rankingfinancetype }">
				<c:set var="ranking1"><font class="rating">${requestScope.ranking}</font><font class="fontsmall  d3-color-gray-3">(${requestScope.scoreMap['lastyearranking']})</font><div class="rating1text"><spring:message code="label.hongkong"/><spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font></div></c:set>
				<c:if test="${rankingfinancetype > 0}">
					<c:set var="ranking2">${compareCategory[13][mapkey13]}<spring:message code="label.ranking"/><font class="d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${rankingfinancetype}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearrankingfinancetype']}) </font></c:set>
				</c:if>
				<c:if test="${requestScope.rankingdistrict > 0}">
					<c:set var="ranking3">${poaschoolnetshortMap[compareCategory[14][mapkey14]]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${rankingdistrict}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearrankingdistrict']}) </font></c:set>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:set var="ranking1"><font class="rating">${rankingfinancetype}</font><font class="fontsmall  d3-color-gray-3">(${requestScope.scoreMap['lastyearrankingfinancetype']})</font><div class="rating1text">${compareCategory[13][mapkey13]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font></div></c:set>
				<c:set var="ranking2"><spring:message code="label.hongkong"/><spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font >${requestScope.ranking}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearranking']}) </font></c:set>
				<c:if test="${requestScope.rankingdistrict > 0}">
					<c:set var="ranking3">${poaschoolnetshortMap[compareCategory[14][mapkey14]]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${rankingdistrict}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearrankingdistrict']}) </font></c:set>
				</c:if>
			</c:otherwise>
			</c:choose>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${rankingdistrict <= rankingfinancetype }">
				<c:if test="${rankingdistrict > 0}">
				<c:set var="ranking1"><font class="rating">${rankingdistrict}</font><font class="fontsmall  d3-color-gray-3">(${requestScope.scoreMap['lastyearrankingdistrict']})</font><div class="rating1text">${poaschoolnetshortMap[compareCategory[14][mapkey14]]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font></div></c:set>
				</c:if>
				<c:if test="${rankingfinancetype > 0}">
				<c:set var="ranking2">${compareCategory[13][mapkey13]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${rankingfinancetype}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearrankingfinancetype']}) </font></c:set>
				</c:if>
				<c:set var="ranking3"><spring:message code="label.hongkong"/><spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${requestScope.ranking}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearranking']}) </font></c:set>
			</c:when>
			<c:otherwise>
			<c:if test="${rankingfinancetype > 0}">
				<c:set var="ranking1"><font class="rating">${rankingfinancetype}</font><font class="fontsmall  d3-color-gray-3">(${requestScope.scoreMap['lastyearrankingfinancetype']})</font><div class="rating1text">${compareCategory[13][mapkey13]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font></div></c:set>
			</c:if>
			<c:if test="${rankingdistrict > 0}">
				<c:set var="ranking2">${poaschoolnetshortMap[compareCategory[14][mapkey14]]}<spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font >${rankingdistrict}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearrankingdistrict']}) </font></c:set>
			</c:if>
				<c:set var="ranking3"><spring:message code="label.hongkong"/><spring:message code="label.ranking"/><font class="fontsmall d3-color-gray-3"> (<spring:message code="label.lastyear"/>) </font><font>${requestScope.ranking}</font><font class="fontsmall d3-color-gray-3"> (${requestScope.scoreMap['lastyearranking']}) </font></c:set>
		
			</c:otherwise>
		</c:choose>
	</c:otherwise>
	</c:choose>

<!-- 
<a href="#" onclick="javascript:{getNavSchool('${requestScope.entityid}','compare','prev')}" class="schooldetailsprev"><img src="/school/img/arrow-prev.png" alt="Arrow Prev"></a>
<a href="#" onclick="javascript:{getNavSchool('${requestScope.entityid}','compare','next')}" class="schooldetailsnext"><img src="/school/img/arrow-next.png" alt="Arrow Next"></a>
-->

<div class="simple_overlay" id="schooldetailsnavtype_overlay" style="padding:5px;width:250px;height=100px">
<form name="navschool" id="navschool" action="/school/controller/entityDetails" method="post" >
<input id="action" type="hidden" name="action" value="" />
<input id="nav" type="hidden" name="nav" value=""  />
<input id="entityid" type="hidden" name="entityid" value=""  />
<div style="padding:10px" class="font2">
<label <c:if test="${sessionScope.navtype == 'ranking' }">class="highlightnav"</c:if> for="radioOne0">
	<input type="radio" name="navtype" <c:if test="${sessionScope.navtype == 'ranking'}">checked</c:if> id="radioOne0" value="ranking"/>
	<spring:message code="label.hongkong"/><spring:message code="label.ranking"/>
</label><br class="clearboth">	
<c:if test="${not empty requestScope.rankingdistrict }">
<label for="radioOne1" <c:if test="${sessionScope.navtype == 'rankingdistrict' || (sessionScope.navtype ne 'ranking' && sessionScope.navtype ne 'rankingfinancetype' ) }">class="highlightnav"</c:if>>
	<input type="radio" name="navtype" <c:if test="${sessionScope.navtype == 'rankingdistrict' || (sessionScope.navtype ne 'ranking' && sessionScope.navtype ne 'rankingfinancetype' ) }">checked</c:if> id="radioOne1" value="rankingdistrict"/>
	${poaschoolnetshortMap[compareCategory[14][mapkey14]]}
	<spring:message code="label.ranking"/>
</label><br class="clearboth">	
</c:if>
<c:if test="${not empty requestScope.rankingfinancetype }">
	<label for="radioOne2" <c:if test="${sessionScope.navtype == 'rankingfinancetype' || (sessionScope.navtype ne 'ranking' && empty requestScope.rankingdistrict )}">class="highlightnav"</c:if>>
	<input type="radio" name="navtype" <c:if test="${sessionScope.navtype == 'rankingfinancetype' || (sessionScope.navtype ne 'ranking' && empty requestScope.rankingdistrict ) }">checked</c:if> id="radioOne2" value="rankingfinancetype"/>
	${compareCategory[13][mapkey13]}<spring:message code="label.ranking"/>
</label><br class="clearboth">	
</c:if>
</div>
</form>
</div>

<TABLE cellpadding="0" cellspacing="0" width="100%"><tr><td> 
<!--  Top Biggest Table -->
<TABLE cellpadding="0" cellspacing="0">
<tr>
		<td colspan="2">
			<div style="float:left;width:580px;" class="border-bottom-gray">
			<div class="fontSchoolNameChi d3-color-black">${compareCategory[16][mapkey16]}</div>
			<div class="fontSchoolNameEng d3-color-black">${compareCategory[17][mapkey17]}</div>
			<div class="fontlarge d3-color-grey-3" style="padding-top:2px;">${compareCategory[2][mapkey2]} | ${compareCategory[3][mapkey3]}</div>
			
			<br class="clearboth"/>
			<img src="/school/img/website.png" style="position:relative;top:3px;padding-left:10px;padding-right:5px;"><a  href="${compareCategory[4][mapkey4]}" target="_blank" >${  fn:length(compareCategory[4][mapkey4]) > 50 ? fn:substring(compareCategory[4][mapkey4],0,50) : compareCategory[4][mapkey4]}</a>
			<img src="/school/img/basicinfo.png" style="padding-right:5px;padding-left:8px;position:relative;top:3px;width:16px;height:14px"><a rel="#basicinfo_overlay" href="#"><spring:message code="label.basicinfo"/></a>
			
			</div>
			
			<img style="float:right;" src="/school/staticimage/CAT${requestScope.categoryid}/logo_${requestScope.chscid}.jpg" onerror="ImgError(this);" width="110px" height="110px" alt="${schoolName[1][schoolNameKey]}"/>

<br class="clearboth"/>
<div class="basicinfo_overlay" id="basicinfo_overlay">

		<div class="title parbase"><div class="custom-title tk">
	    		<div class="ib">
	        
	            <span class="category">
	                &nbsp;
	            </span>
	        	<div class="ib">
	            <span class="custom-title-line custom-title-line__l" ></span>
	            <font class="title fontbold">
	                <spring:message code="label.basicinfo"/>
	            </font>
	            <span class="custom-title-line custom-title-line__r"></span>
	        	</div>
	        	 
	    		</div>
		</div></div>
		<br><br><br>
		<div style="padding-left:20px;">
		<div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black"><spring:message code="label.schoolcategory"/></div>
		<div style="float:left;" class="d3-color-black">${compareCategory[18][mapkey18]} ${compareCategory[13][mapkey13]} ${compareCategory[21][mapkey21]}
		
		 <c:if  test="${not empty compareCategory[19][mapkey19]}">
        	${compareCategory[19][mapkey19]}
        </c:if>
        
		</div><br class="clear">
        <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black"><spring:message code="label.yearhistory"/></div>
		<div style="float:left;width:300px;" class="d3-color-black"><spring:message code="message.histroy" arguments="${compareCategory[11][mapkey11]};${compareCategory[20][mapkey20]}" htmlEscape="false" argumentSeparator=";"/></div><br class="clear">
        <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">&nbsp;</div>
		<div style="float:left;width:100px;" class="d3-color-gray-3">${compareCategory[10]['key']}: ${compareCategory[10][mapkey10]}</div><br class="clear">
        <br class="clear">

       	<c:if  test="${not empty compareCategory[5][mapkey5]}">
			<div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[5]['key']}</div>
			<div style="float:left;" class="d3-color-black">${compareCategory[5][mapkey5]}</div><br class="clear">
		</c:if>
		<c:if  test="${ fn:length(compareCategory[6][mapkey6]) gt 3 || fn:length(compareCategory[8][mapkey8]) gt 3 || fn:length(compareCategory[7][mapkey7]) gt 3 }">
			<div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black"><spring:message code="message.secondarylabel"/></div>
			<div style="float:left;" class="d3-color-black">
			 	<c:choose>
				<c:when  test="${not empty compareCategory[6][mapkey6] && compareCategory[6][mapkey6] ne '-' && fn:length(compareCategory[6][mapkey6]) gt 3 }">
					 ${compareCategory[6]['key']}: <font class="d3-color-gray">${compareCategory[6][mapkey6]}</font>
				</c:when>
				<c:when  test="${not empty compareCategory[7][mapkey7] && compareCategory[7][mapkey7]  ne '-' && fn:length(compareCategory[7][mapkey7]) gt 3 }">
					 ${compareCategory[7]['key']}: <font class="d3-color-gray">${compareCategory[7][mapkey7]}</font>
				</c:when>
				<c:when  test="${not empty compareCategory[8][mapkey8] && compareCategory[8][mapkey8]  ne '-' && fn:length(compareCategory[8][mapkey8]) gt 3 }">
					 ${compareCategory[8]['key']}: <font class="d3-color-gray">${compareCategory[8][mapkey8]}</font>
				</c:when>
				</c:choose>
			</div><br class="clear">
		</c:if>
    	<c:if  test="${not empty compareCategory[15][mapkey15]}">
			<div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[15]['key']}</div>
			<div style="float:left;" class="d3-color-black"><font class="d3-color-gray">${compareCategory[15][mapkey15]}</font></div><br class="clear">
		</c:if>
       
        <!--
        <c:if  test="${not empty compareCategory[16][mapkey16]}">
			<div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[16]['key']}</div>
			<div style="float:left;width:300px;" class="d3-color-black">${compareCategory[16][mapkey16]}</div><br class="clear">
        </c:if>
        -->
        <c:if  test="${not empty compareCategory[9][mapkey9]}">
            <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[9]['key']}</div>
            <div style="float:left;width:300px;" class="d3-color-black">${compareCategory[9][mapkey9]}</div><br class="clear">
        </c:if>

        <c:if  test="${not empty compareCategory[23][mapkey23]}">
            <br class="clear">
            <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[22]['key']}</div>
        	<div style="float:left;" class="d3-color-black"><font class="d3-color-gray">${not empty compareCategory[22][mapkey22] ? compareCategory[22][mapkey22] : "--"}</font></div><br class="clear">
            <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[23]['key']}</div>
        	<div style="float:left;" class="d3-color-black"><font class="d3-color-gray">${compareCategory[23][mapkey23]}</font></div><br class="clear">
            <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[24]['key']}</div>
        	<div style="float:left;width:300px;" class="d3-color-black"><font class="d3-color-gray">${compareCategory[24][mapkey24]}</font></div><br class="clear">
   		</c:if>
   		<c:if  test="${ requestScope.categoryid == '0'}">
            <br class="clear">
            <div style="float:left;width:130px;padding-bottom:5px;" class="d3-color-black">${compareCategory[22]['key']}</div>
            <div style="float:left;width:300px;" class="d3-color-black">${compareCategory[22][mapkey22]}</div><br class="clear">
        </c:if>
	</div>
	<div style="height:20px;"></div>
	</div>

	<br class="clearboth"/>
	<div style="float:left;width:8px;">&nbsp;</div>
    
	
	<div style="position:relative;float:left">
	<g:plusone size="medium"></g:plusone>
	<div style="float:left" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>
	<c:set var="statkey">entity-${entityid}</c:set>
	<font style="margin-right:30px;margin-left:10px;top:-4px;position:relative;" class="font3"><spring:message code="label.hitcount"/> ${objectStatMap[statkey].hitcounter}</font>
        </div>
        <div style="position:relative;float:right">
        <p id="slideToggle" style="cursor: pointer; cursor: hand;" class="fontmedium d3-color-gray-2" >
        <img style="position:relative;top:3px;left:-1px;" src="/school/img/gear_dim.png"/><spring:message code="label.schoolarea"/><img src="/school/img/arrow.png"/>
		</p>
		</div>
		<div class="slideTogglebox">
			<img style="position:relative;float:right;width:9px;height:9px;cursor: pointer; cursor: hand;right:-5px;top:-5px;" src="/school/img/closegreen.png" onclick='$(".slideTogglebox").toggle("slow");'>
			<a  href="/school/controller/entityForm?entityid=${requestScope.entityid}&action=edit&year=${requestScope.rankingyear}&categoryid=${requestScope.categoryid}" rel="#overlay_entityedit" style="text-decoration:none">
        		<img style="padding-right:5px;position:relative;top:-3px;" src="/school/img/greendot.png"/><spring:message code="label.schoolinfoedit"/>
			</a><br>
			<a  href="/school/controller/getEntityEventForm?entityid=${requestScope.entityid}&eventtype=openday" rel="#overlay_entityedit" style="text-decoration:none">
        		<img style="padding-right:5px;position:relative;top:-3px;" src="/school/img/greendot.png"/><spring:message code="label.openday"/>
			</a><br>
			<a  href="/school/controller/getEntityEventForm?entityid=${requestScope.entityid}&eventtype=introday" rel="#overlay_entityedit" style="text-decoration:none">
        		<img style="padding-right:5px;position:relative;top:-3px;" src="/school/img/greendot.png"/><spring:message code="label.introday"/>
			</a><br>
			<a  href="/school/controller/getEntityEventForm?entityid=${requestScope.entityid}&eventtype=applicationday" rel="#overlay_entityedit" style="text-decoration:none">
        		<img style="padding-right:5px;position:relative;top:-3px;" src="/school/img/greendot.png"/><spring:message code="label.applicationday"/>
			</a><br>
			<a  href="/school/controller/getEntityEventForm?entityid=${requestScope.entityid}&eventtype=principalsay" rel="#overlay_entityedit" style="text-decoration:none">
        		<img style="padding-right:5px;position:relative;top:-3px;" src="/school/img/greendot.png"/><spring:message code="label.principalsay"/>
			</a>
		
		</div>
		
 </td>
	</tr>
<tr><td colspan="2"><div class="border-bottom-gray"></div></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">
<c:choose>
    <c:when test="${requestScope.entityid eq '3851'|| requestScope.entityid eq '3860'}">
        <div class="closedschool">
            <spring:message code="closed.school.${requestScope.entityid}"/>
        </div>
    </c:when>
    <c:otherwise>
        <div class="important" style="height:45px;">

             <div style="padding-left:10px;float:left">
                         <a class="download" target="_blank" href="https://itunes.apple.com/us/app/bookofschool/id1236504022">
                             <img src="/school/img/apple-download.png?1495100274">
                         </a>
                      </div>
                     <div style="padding-left:10px;padding-top:10px;float:left">
                         <font style="font-size:14px;"><spring:message code="label.ourapps.desc"/></font>
                     </div>
        </div>
    </c:otherwise>
</c:choose>
</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">
<table style="margin: auto;"><tr><td>
<div style="position:relative;float:right;padding-left:0px;">
	<a style="position:relative;top:0px;right:0px;padding-left:30px;" href='/school/controller/parentKidListOverlay?entityid=${requestScope.entityid}' rel='#overlay_medium'>
			<img src="/school/img/parentsmall.png">
			<font class="font4b" style="padding-left:5px">${requestScope.schoolparentcount}</font> <font style="position:relative;left:-15px" class="entitybasicfield"> <spring:message code="label.totalusercount"/></font>
	</a>
			
	<div style="position:relative;top:20px;right:-45px;">
	<c:set var="digit" value="${fn:substring(requestScope.score, 0, 1)}" />
	<c:set var="decimal" value="${fn:substring(requestScope.score, 2, 4)}" />

	<img src="/school/img/logobookgreen.jpg" style="width:55px;height:40px;">
	<br><font style="font-size:0.8em; font-weight:normal;color:#000;position:relative;top:0px;left:5px"><spring:message code="label.schoolrating"/></font>
	<br><font style="font-size:2.8em; font-weight:bold;color:rgb(145,154,61);position:relative;top:0px;left:0px">${digit}<medium>.${decimal}</medium></font>
	</div>
</div>
<div style="position:relative;float:right; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;padding-left:15px;"></div>	
<div style="position:relative;float:right;padding-right:10px;top:70px;">
<a href="javascript:;"  onclick="javascript:{getNavSchool('${requestScope.entityid}','compare','next')}" >
		<span class="icon-frame icon-frame-text"><span class="icon-16 icon-16-rarrow"></span></span>
</a>
<div style="top:5px;position:relative;" class="font1"><a class="comment" rel="#schooldetailsnavtype_overlay"><font class="font1"><spring:message code="label.ordersetting"/></font></a></div>
</div>
<div class="entitybasicfield"  style="position:relative;float:right;padding-left:5px;padding-right:15px; width:130px;min-height:150px;text-align:center;">
<a style="position:relative;left:-10px;" id="grading"><spring:message code="label.grading"/></a>
<div class="tooltip">
		<table style="margin:0;float:left;position:relative">
		<tr>
			<td valign="top">
			<img src="/school/img/normal-distribution.jpg" alt="Standard deviation" style="float:left;margin:0 15px 20px 0;width:300px;	height: 200px; background-size: 100% 100%; " />
  			</td>
			<td><div style="text-align:left;padding:5px;">
			<spring:message code="label.gradingmethod"/></div>
			</td>
		</tr>
		</table>
	</div> 
<br><br>
${requestScope.categoryid eq '5' ||  empty requestScope.ranking ||  requestScope.ranking eq '999' ?  '<font class="rating">?</font>' : ranking1 }
<c:if test="${not (requestScope.categoryid eq '5' ||   empty requestScope.ranking ||  requestScope.ranking eq '999' ) }"><div style="position:relative;top:-10px;left:-25px;width:160px;text-align:center;color: #000000;">${requestScope.categoryid ne '5' ? ranking2 : '&nbsp;&nbsp;?'}</div>
<div style="position:relative;top:-8px;width:250px;text-align:center;left:-70px;color: #000000;">${requestScope.categoryid ne '5' ? ranking3 : '&nbsp;&nbsp;?'}</div></c:if>
</div>
<div style="position:relative;float:right;padding-right:20px;margin:0px;top:70px;">
<a href="javascript:;"  onclick="javascript:{getNavSchool('${requestScope.entityid}','compare','prev')}" >
		<span class="icon-frame icon-frame-text"><span class="icon-16 icon-16-larrow"></span></span>
</a>
</div>

			<c:choose>
				<c:when test="${requestScope.poll['timediffday'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffday']} <spring:message code="label.dayago"/></c:set>
				</c:when>
				<c:when test="${requestScope.poll['timediffhour'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffhour']} <spring:message code="label.hourago"/></c:set>
				</c:when>
				<c:when test="${requestScope.poll['timediffmin'] > 0}">
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffmin']} <spring:message code="label.minago"/></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="parentscorelastupdate">${requestScope.poll['timediffsec']} <spring:message code="label.secago"/></c:set>
				</c:otherwise>
			</c:choose>

<div style="position:relative;float:right;border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;padding-right:15px"></div>	
<div style="position:relative;float:right;padding-left:20px;">
<span style="float:right;top:45px;position:relative;padding-right:10px">
  	<a id="barchart" style="position:relative;top:-40px;right:0px;" ><img src="/school/img/chart.png"  /><font class="entitybasicfield" style="position:relative;top:-10px;left:-8px;"><spring:message code="label.voteresult"/></font></a>
	<div class="tooltiptripadvisorwhite">
	<p class="font2" style="padding-bottom:10px;"><spring:message code="label.noofparentpoll" arguments="${requestScope.poll['noofparent']}" argumentSeparator=";"/></p>
	<div class="graph">
   		<strong class="bar" style="width: ${requestScope.poll['metric1'] lt 1 ? 100 : requestScope.poll['metric1'] * 10 }%;"><spring:message code="label.parentmetric1"/> : ${requestScope.poll['metric1']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric1'] lt 1 ? 100 :requestScope.poll['metric2'] * 10 }%;"><spring:message code="label.parentmetric2"/> : ${requestScope.poll['metric2']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric1'] lt 1 ? 100 :requestScope.poll['metric3'] * 10 }%;"><spring:message code="label.parentmetric3"/> : ${requestScope.poll['metric3']}</strong></p>
	</div>
	<div class="graph">
   		<strong class="bar" style="width: ${ requestScope.poll['metric1'] lt 1 ? 100 :requestScope.poll['metric4'] * 10 }%;"><spring:message code="label.parentmetric4"/> : ${requestScope.poll['metric4']}</strong></p>
	</div>
	<p class="font1b" style="top:15px;left:0px;padding-top:5px;position:relative;float:right;"><spring:message code="label.lastmodified"/> ${parentscorelastupdate}</p>
	</div>

  	<div style="position:relative;top:-20px;border: 0px solid red;text-align:center; ">
 	<img src="/school/img/parent.png" style="width:46px;height:31px">
	<br><font style="font-size:0.8em; font-weight:normal;color:#000;position:relative;top:0px;left:0px"><spring:message code="label.parentrating"/></font>
        <br><font style="text-align:center;font-size:2.8em; font-weight:bold;color:rgb(145,154,61);position:relative;top:0px;left:0px"><c:choose><c:when test="${not empty requestScope.poll['parentscore'] }">${requestScope.poll['parentscore']}</c:when><c:otherwise>?</c:otherwise></c:choose></font>
        <c:if test="${ requestScope.parentscore gt 0}"><c:choose><c:when test="${ requestScope.parentscore gt requestScope.poll['parentscore'] }"><img src="/school/img/drop.png"></c:when>
        <c:when test="${ requestScope.parentscore eq requestScope.poll['parentscore'] }"><img src="/school/img/nochange.png"></c:when>
        <c:otherwise><img src="/school/img/up.png"></c:otherwise></c:choose><font class="font1" style="text-align:center">(${requestScope.parentscore})</font>
		<br class="clearboth"/>
		<font class="font1" style="text-align:center;position:relative;top:-5px;left:0px;"><spring:message code="label.lastmodified"/> ${parentscorelastupdate}</font></c:if>
		
	</div>
</span>	
</div>
</td></tr></table>
</td></tr>
	<tr><td colspan="2">
	<table style="margin: auto;"><tr><td>
		
		<a href='#'onclick="javascript:showPolling();">
		<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:100px;" class="submit" type="button"  value='<spring:message code="label.checkpollingrecord"/>' /></span></span>
		</a>
		<c:choose>
			<c:when test="${sessionScope.user['roleid'] eq 1 || (not empty sessionScope.user && requestScope.infavoritelist > 0)  }">
  			<a href="/school/controller/favoriteUserListOverlay?entityid=${requestScope.entityid}" rel="#schoolallocation_overlay" style="text-decoration:none">
  			<c:choose>
			<c:when test="${not empty requestScope.favoriteCount}"><c:set var="enrollcount">${requestScope.favoriteCount[requestScope.entityid]}</c:set></c:when>
			<c:otherwise><c:set var="enrollcount">0</c:set></c:otherwise>
			</c:choose>
			<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:100px;" class="submit" type="button"  value='<spring:message code="label.estimatedenrollment"/> (${enrollcount})' /></span></span>
			</a>
			</c:when>
  			<c:otherwise>
  			<a href="#"  onclick='javascript:{ alert("<spring:message code="label.andthenaddtofavorite"/>") }' style="text-decoration:none">
  			<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input style="width:100px;" class="submit" type="button"  value='<spring:message code="label.estimatedenrollment"/> (?) ' /></span></span>
			</a>
  			</c:otherwise>
  		</c:choose>
  		
		<c:if test="${requestScope.categoryid eq '0'|| requestScope.categoryid eq '1'}">
			<a href="/school/controller/schoolAllocationOverlay?entityid=${requestScope.entityid}&categoryid=${requestScope.categoryid}" rel="#schoolallocation_overlay" style="text-decoration:none">
				<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px"><input class="submit" type="button"  value='<spring:message code="label.schoolallocation${requestScope.sacategoryid}"/>' /></span></span>
			</a>
		</c:if>
			<c:choose>
			<c:when test="${not empty sessionScope.user}">
			<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px;width:130px;"><input style="width:130px;" onclick="javascript:saveviewedschoolsingle('${requestScope.entityid}','${sessionScope.user.id}','<spring:message code='label.favorite'/>','<spring:message code='label.favoriteschooladded'/>')"  class="submit" type="button"  value='<spring:message code="label.addtofavorite"/>' /></span></span>
			</c:when>
			<c:otherwise>
			<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px;width:130px;"><input style="width:130px;" onclick='javascript:{ alert("<spring:message code="label.pleaselogin"/>") }'  class="submit" type="button"  value='<spring:message code="label.addtofavorite"/>' /></span></span>
			</c:otherwise>
			</c:choose>
		
		<a href="/school/controller/schoolEventOverlay?entityid=${requestScope.entityid}&categoryid=${requestScope.categoryid}" rel="#schoolevent_overlay" style="text-decoration:none">
		<span class="wrpBtn" ><span class="button_ta ylw mdm" style="margin-left:5px;width:90px;"><input style="width:90px;" class="submit" type="button"  value='<spring:message code="label.schoolapplication"/>' /></span></span>
		</a>
		</td></tr>
	</table>
	
	</td></tr>
 	

	<tr>
		<td colspan="2">
			<br class="clear"><br class="clear">
			<div class="systemComment"><b>${requestScope.systemcomment[0]['subject']} : </b>${requestScope.systemcomment[0]['comment']}<br>
			<span style="float:right;margin:3px;"><font class="msg-details"><spring:message code="label.lastmodified"/>						

	
				<c:choose>
					<c:when test="${requestScope.systemcomment[0]['timediffday'] > 0}">
						${requestScope.systemcomment[0]['timediffday']} <spring:message code="label.dayago"/>
					</c:when>
					<c:when test="${requestScope.systemcomment[0]['timediffhour'] > 0}">
						 ${requestScope.systemcomment[0]['timediffhour']} <spring:message code="label.hourago"/>
					</c:when>
					<c:when test="${requestScope.systemcomment[0]['timediffmin'] > 0}">
						 ${requestScope.systemcomment[0]['timediffmin']} <spring:message code="label.minago"/>
					</c:when>
					<c:otherwise>
						 ${requestScope.systemcomment[0]['timediffsec']} <spring:message code="label.secago"/>
					</c:otherwise>
				</c:choose>
			</font></span>
			<c:if test="${not empty requestScope.parentscorecomment }">
			<br><br><font style="color:black;">${requestScope.parentscorecomment}</font>
			<span style="float:right;margin:3px;"><font class="msg-details" ><br><spring:message code="label.lastmodified"/>		
			${parentscorelastupdate}
			</font>
			</span>
			</c:if>
<br><br><br>
<div class="divider-small"></div>
		<c:choose>
	    	<c:when test="${not empty requestScope.categoryid  }"><jsp:include page="/controller/yahooSponsorSearchCommon"><jsp:param name="maxcount" value="3" /></jsp:include></c:when>
	    	<c:otherwise><jsp:include page="../ads/yahoocontentmatchtop.jsp"/></c:otherwise>
    	</c:choose>
			
<c:if test="${not empty requestScope.eventHistory['note-disabled'] }">
<br>
<div class="divider-small"></div>
<div class="basicentityinfo" style="background-color:#EFEFEF;top:20px;padding-left:30px;padding-top:10px;">

<font class="systemComment override" style="padding-left:30px;padding:top-3px;">${requestScope.eventHistory['note']}</font>

</div>
</c:if>

<br><br>
			</div>
		</td>
	</tr>

<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">
<!-- UNI In article tag -->
<br class="clearboth">
<div>
        <script type="text/javascript" src="https://ad.unimhk.com/show.php?id=mdcymdfmmdm3nzbi&inart=500"></script>
</div>
<!-- UNI In article tag -->
</td></tr>

<tr>
<td valign="top">
<div style="padding-top:0px;">&nbsp;</div>
<div class="dbl-bdr"><div class="wrapper-small ">
<!--  ======================== -->
<c:forEach begin="2013" end="${requestScope.rankingyear}"  var="i" varStatus="stat">
<c:set var="btn">
<a href="/school/controller/entityForm?entityid=${requestScope.entityid}&action=edit&year=${i}&categoryid=${requestScope.categoryid}" rel="#overlay_entityedit" style="text-decoration:none">
	<font class="fontbold fontxlarge">${i}</font>
</a>
</c:set>
<c:set var="myVar" value="${stat.first ? '' : myVar}|${btn}" />
</c:forEach>
<c:set var="btnArray" value="${fn:split(myVar, '|')}" />

<c:set var="primarysport" value='<%="\u9AD4\u80B2"%>' />
<c:set var="ranking" value='<%="\u6392\u540D"%>' />		
<c:set var="nt" value='<%="\u65B0\u754C"%>' />		
<c:set var="division" value='<%="\u7D44\u5225"%>' />		
<c:set var="choirchi" value='<%="\u5408\u5531\u968A"%>' />
<c:set var="instrumentschi" value='<%="\u4E2D\u570B\u6A02\u5668"%>' />
<c:set var="male" value='<%="\u7537"%>' />		
<c:set var="female" value='<%="\u5973"%>' />
<c:set var="schoolplacementchi" value='<%="\u6D3E\u4F4D"%>' />
<c:set var="lantau"	 value='<%="\u5927\u5DBC\u5C71" %>' />


<!--  START OF SCHOOL METRIC DIV -->
	<TABLE cellpadding="0" cellspacing="0" style="min-width: 540px;">
	<tr align="right" >
	<td style="border-bottom: 1px solid #FFF;">
	<div style="float:left;"><img src="/school/img/barchart.png" style="width:20px;height:20px;position:relative;top:0px;" /><a class="fontbold" style="position:relative; top:-5px;font-size:16px !important;" href="/school/controller/getCMSDetails?id=2"><spring:message code="label.howtorank"/></a></div>
	</td>
        <c:forEach var="btn" items="${btnArray}">
        <td style="border-bottom: 1px solid #FFF;padding-right:2px;">${btn}</td>
        </c:forEach>
	</tr>
	<tr><td colspan="${noofyear+1}" style="text-align: right"><spring:message code="label.updateingshort" text="default" arguments="${requestScope.rankingyear}"/></td></tr>
	<tbody>
	<c:forEach var="compareCategory" begin="1" items="${requestScope.entityVerticalCategoryList}" varStatus="rowCounterCategory">
		<c:forEach var="compare" items="${compareCategory}" varStatus="rowCounter">
		<c:set var="mapkey" value="key"/> 
		<c:set var="lastyearscore">${compare["key"]}lastyear</c:set>
		<c:set var="currentyearscore">${compare["key"]}currentyear</c:set>

		
			<c:choose>
			<c:when  test="${rowCounter.count == 1}">
			<tr><td colspan="${noofyear+1}" class="content-table-1">
			<!-- 
			<div class="contents-headline"><div class="contents-headlineInner"><div class="contents-headlineHeader"><div class="contents-headlineTL"></div>
			<div class="contents-headlineTR"></div></div><div class="contents-headlineBody">
			 -->
			<div style="padding:5px;">
				<font class="fontxlarge fontbold d3-color-black">
				 <spring:message code='label.${requestScope.metricCategory[compare["key"]]}'/>
				 <font class="fontsmall">(<spring:message code="label.lastyear"/>)</font> : ${requestScope.scoreMap[currentyearscore]}  <c:choose><c:when test="${not empty requestScope.scoreMap[lastyearscore] && requestScope.scoreMap[lastyearscore].toString() ne '?'}"><font class="fontsmall" style="position:relative;top:0px;" >(${requestScope.scoreMap[lastyearscore]})</font> <spring:message code="label.score"/></c:when><c:when test="${requestScope.scoreMap[lastyearscore].toString() eq '?' }"><font class="font1"> <spring:message code="label.noinformationranking"/></font></c:when></c:choose>
				</font>
				<c:choose>
			 		<c:when test="${requestScope.metricCategory[compare['key']] eq 'academic'}">
				 		<c:set var="constitute"><spring:message	code="label.constitute" arguments="${ requestScope.categoryid eq '0' ? '60' : '40'}"/></c:set>
				 	</c:when>
				 	<c:when test="${requestScope.metricCategory[compare['key']] eq 'schoolfee'}">
				 		<c:set var="constitute"></c:set>
				 	</c:when>
				 	<c:otherwise>
				 		<c:set var="constitute"><spring:message	code="label.constitute" arguments="${ requestScope.categoryid eq '0' ? '20' : '15'}"/></c:set>
				 	</c:otherwise>
			 	</c:choose>
			 	<span class="fontsmall d3-color-gray-1" style="float:right;poistion:relative;padding-right:5px">${constitute}</span>
			</div>
			
			<!-- 
			</div><div class="contents-headlineFooter"><div class="contents-headlineBL"></div><div class="contents-headlineBR"></div></div></div></div>
			 -->
			</td></tr>
			
			</c:when>
			<c:when test="${  requestScope.entityVerticalCategoryList[0][18][mapkey18]  eq male  &&  (fn:contains( compare['key'] , female)  )  }">
			
			</c:when>
			<c:when test="${   requestScope.entityVerticalCategoryList[0][18][mapkey18] eq female &&  (fn:contains( compare['key'] , male)  )  }">
			
			</c:when>
			<c:when test="${   (fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  || fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , lantau) ) &&  (fn:contains( compare['key'] , division)  )  }">
			
			</c:when>
			<c:when test="${  not fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  && not fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , lantau) &&  (fn:contains( compare['key'] , nt))  ||   (fn:contains( compare['key'] , lantau))  }">
			
			</c:when>
			<c:when test="${ fn:contains(compare['key'] , 'division') || fn:contains( compare['key'], 'Choir') || fn:contains( compare['key'], 'Musical Instruments') || fn:contains( compare['key'], choirchi) || fn:contains( compare['key'], instrumentschi)  }">
			
			</c:when>
			<c:otherwise>
			<c:set var="morelessnamekey1" value='<%="\u5B78\u6821\u8A2D\u65BD"%>'/>  <!--  school favilities secondary -->
			<c:set var="morelessnamekey2" value='<%="\u7279\u5225\u5BA4"%>'/>   <!-- special room  for primary school  -->
			<c:set var="morelessnamekey3" value='<%="\u5176\u4ED6"%>'/>   <!-- other for kindergarten  -->
			<c:set var="morelessnamekey4" value='<%="\u5b78\u524d\u8a55\u6838"%>'/>   <!-- pre school checking kindergarten  -->

			<c:set var="longtextappeared">n</c:set>

		 	<tr>
				<td valign="top" nowrap  <c:if test="${fn:contains( compare['key'], morelessnamekey1) || fn:contains( compare['key'], morelessnamekey2) || fn:contains( compare['key'], morelessnamekey3) || fn:contains( compare['key'], morelessnamekey4) }">colspan=1</c:if> >
				<div class="entitycategoryfield
				<c:if test="${ not (fn:contains( compare['key'], morelessnamekey1) || fn:contains( compare['key'], morelessnamekey2) || fn:contains( compare['key'], morelessnamekey3) || fn:contains( compare['key'], morelessnamekey4)) }">border-bottom-gray</c:if>
				" style="width:100px;"><img src="/school/img/list-bullet-red.png" style="position:relative;top:-2px;"> ${compare["key"]} :</div></td>
		        <c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">
		 		<c:set var="mapkey" value="${compare['key']}${colunmCounter.count-1}"/>
		 		<c:choose>
				<c:when test="${fn:contains( mapkey, morelessnamekey1) || fn:contains( mapkey, morelessnamekey2) || fn:contains( compare['key'], morelessnamekey3) || fn:contains( compare['key'], morelessnamekey4) }">
					<c:if test="${longtextappeared eq 'n'}">
	        	 		<c:set var="mapkey" value="${compare['key']}${noofyear-1}"/>
            			<td  colspan="${noofyear}" valign="top" align="left">
    		    			<div style="position:relative;left:6px;float:right" class="entitycategoryfield border-bottom-gray">${compare[mapkey]}</div>
				    	</td>
					</c:if>
					<c:set var="longtextappeared">y</c:set>
				</c:when>
				<c:when test="${fn:contains( mapkey, ranking) }">
						<c:set var="mapkeydiv" value="${compare['fieldname']}division${colunmCounter.count-1}"/>
						<c:set var="mapkeydivname" value="athleticsdivisionname${colunmCounter.count-1}"/>
						<td  colspan="1" valign="top" align="right" ${fn:length(compare[mapkey]) < 10 ? 'xnowrap' : '' }>  <!-- todo sport division not enough space-->
						<div class="entitycategoryfield ${colunmCounter.count eq noofyear ? 'd3-color-orange' : '' }">
						<c:choose>
								<c:when test="${not empty requestScope.entityVerticalCategoryList[rowCounterCategory.count][17][mapkeydivname] }"><div class="fontsmall d3-color-gray-2">${requestScope.entityVerticalCategoryList[rowCounterCategory.count][17][mapkeydivname] }</div></c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '1'}"><span class="fontsmall d3-color-gray-2"><spring:message code="label.divone"/></span></c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '2'}"><span class="fontsmall d3-color-gray-2"><spring:message code="label.divtwo"/></span></c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count][rowCounter.count+8][mapkeydiv] eq '3'}"><span class="fontsmall d3-color-gray-2"><spring:message code="label.divthree"/></span></c:when>
						</c:choose>
							${compare[mapkey] eq '0' || empty compare[mapkey] || compare[mapkey] eq '999' || compare[mapkey] eq '0.0' ? '-' : compare[mapkey] }</div>
						</td>
							
				</c:when>
				<c:otherwise>
					<td  colspan="1" valign="top" align="right" ${fn:length(compare[mapkey]) < 10 ? 'nowrap' : '' }>	 <!-- todo sport division not enough space-->
					<div class="border-bottom-gray entitycategoryfield ${colunmCounter.count eq noofyear ? 'd3-color-orange' : '' }">${compare[mapkey] eq '0' || empty compare[mapkey] || compare[mapkey] eq '999' || compare[mapkey] eq '0.0' ? '-' : compare[mapkey]}</div>
					</td>
				</c:otherwise>
				</c:choose>					
				</c:forEach>
			</tr>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:forEach>
	</tbody>
	</table>
</div></div>
	<!--  END OF SCHOOL METRIC DIV -->
	<!--  ======================== -->
	
</td>
<td valign="top" align="right">
    <TABLE cellpadding="0" cellspacing="0" style="border: 0px solid black;">
        <tr>
            <td>
            <jsp:include page="../common/radarChart.jsp"/>
            </td>
        </tr>
<!-- 6171: SKH Li Fook Hing Secondary School && T.W.G.Hs. Wong See Sum Primary School && The Hong Kong Taoist Association Ching Chung Secondary School-->
    <c:if test="${requestScope.entityid eq '6171' || requestScope.entityid eq '3593' ||  requestScope.entityid eq '6247' ||  requestScope.entityid eq '6035' ||  requestScope.entityid eq '3554' ||  requestScope.entityid eq '6168' ||  requestScope.entityid eq '3847' ||  requestScope.entityid eq '3551' ||  requestScope.entityid eq '6276' ||  requestScope.entityid eq '3714' ||  requestScope.entityid eq '6301' ||  requestScope.entityid eq '3619'  }">
        <tr>
            <td>

            <div class="talk-bubble tri-right border left-in" style="width:96% !important;max-width:250px">
              <div class="talktext">
                <div class="fontbold"><spring:message code="specialschoolresult.title.${requestScope.entityid}" text="default"/></div>
                <div class="fontmedium" style="float:left">
                <spring:message code="specialschoolresult.left.${requestScope.entityid}" text="default"/>
                <div>
                <div class="fontmedium" style="float:left">
                <spring:message code="specialschoolresult.right.${requestScope.entityid}" text="default"/>
                <div>
              </div>
            </div>
            </td>
        </tr>
    </c:if>

        <tr>
            <td>
            <div style="padding:10px;">
            <c:forEach var="photo" items="${requestScope.entityImages}" varStatus="rowCounter">
            <c:choose>
            <c:when test="${photo.external eq 'y'}"  >
            <a class="preview" title="By Hk linus at en.wikipedia [Public domain], from Wikimedia Commons" href="${photo.imagepath}"><img class="imagedropshadow" width="50" height="50" alt="Slide
            ${rowCounter.count}" src="${photo.imagepath}"/></a>
            </c:when>
            <c:otherwise>
            <a href="/school/staticimage/entityimage/${photo.imagepath}" class="preview"  ><img class="imagedropshadow" src="/school/staticimage/entityimage/${photo.imagepath}" width="50" height="50" alt="${schoolName[1][schoolNameKey]}"></a>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            </div>
            </td>
        </tr>
        <tr>
            <td>
            <jsp:include page="relatedCases.jsp"/>
            </td>
        </tr>
        <tr>
            <td>
            <jsp:include page="news.jsp"/>
            </td>
        </tr>
	</table>
  
</td>
</tr>
</table>

        <jsp:include page="../common/youtubeFeed.jsp"/>

<br>
<div class="divider-small"></div>
<jsp:include page="../common/rssFeed.jsp"/>

</td></tr></TABLE> <!--  Top Biggest Table -->
</div>

<jsp:include page="../common-footer.jsp"/>



<!-- overlayed element -->
<div class="apple_overlay_entity_allocation" id="schoolallocation_overlay" >
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
</div>
<div class="apple_overlay_eventview" id="schoolevent_overlay">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
</div>
<div class="apple_overlay_entity_allocation" id="overlay_entityedit">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>

</c:catch>
	<c:if test="${exception!=null}">
		<font class="fontxlarge d3-color-red"> ${exception.message}</font>
	</c:if>