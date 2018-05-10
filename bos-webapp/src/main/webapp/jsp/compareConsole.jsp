<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="htmltitle" scope="request">${requestScope.schoolCompareAnalytics['title']}</c:set>
<c:set var="htmlkeywords" scope="request">${requestScope.schoolCompareAnalytics['keyword']}</c:set>
<c:set var="htmldesc" scope="request">${requestScope.schoolCompareAnalytics['desc']}</c:set>
<c:set var="htmlrobots" scope="request">${requestScope.schoolCompareAnalytics['keyword']}</c:set>
<c:set var="htmlgooglebot" scope="request">${requestScope.schoolCompareAnalytics['keyword']}</c:set>

<%@ include file="common-header.jsp" %>

<link type="text/css" rel="stylesheet" href="/school/stylesheet/applecompare.css" charset="utf-8" />

<style>
	
	
	a.adjust{
		padding:2px;
		display:block;
		font-weight:bold;
		font-size:8px;

		background:#eee;
		color:#333;
		border-radius:3px;
		-webkit-border-radius:3px;
		-moz-border-radius:3px;
		width:30px;
		text-align:center;
		text-decoration:none;
	}
		a.adjust:hover{
			background:#333;
			color:#FFF;
			-webkit-transition: all 400ms; /*safari and chrome */
			-moz-transition: all 400ms ease; /* firefox */
			-o-transition: all 400ms ease; /* opera */
			transition: all 400ms ease;
		}
	p.continued{
		margin-right:3px;
	}
	
</style>


<script  type="text/javascript">
$(document).ready(function() {

// The height of the content block when it's not expanded
var adjustheight = 50;
// The "more" link text
var moreText = "+  More";
// The "less" link text
var lessText = "- Less";

// Sets the .more-block div to the specified height and hides any content that overflows
$(".more-less .more-block").css('height', adjustheight).css('overflow', 'hidden');

// The section added to the bottom of the "more-less" div
// <p class="continued">[&hellip;]</p> removed
$(".more-less").append('<a href="#" class="adjust"></a>');

$("a.adjust").text(moreText);

$(".adjust").toggle(function() {
		$(this).parents("div:first").find(".more-block").css('height', 'auto').css('overflow', 'visible');
		// Hide the [...] when expanded
		$(this).parents("div:first").find("p.continued").css('display', 'none');
		$(this).text(lessText);
	}, function() {
		$(this).parents("div:first").find(".more-block").css('height', adjustheight).css('overflow', 'hidden');
		$(this).parents("div:first").find("p.continued").css('display', 'block');
		$(this).text(moreText);
});

$('#showhidetarget').show();
$('#showtrigger').hide();

$('a#showtrigger').click(function() {
    $('#showhidetarget').show();
    $('#showtrigger').hide(); // hide the show button
    $('#hidetrigger').show(); // show the hide button
  });
  $('a#hidetrigger').click(function() {
    $('#showhidetarget').hide();
    $('#hidetrigger').hide(); // hide the hide button
    $('#showtrigger').show(); // show the show button
  });

});  
</script>

<jsp:include page="menu.jsp"/>
 



<jsp:include page="ads/wideAds.jsp"/>
<br class="clear">


<c:set var="morelessnamekey1" value='<%="\u8FA6\u5B78\u5B97\u65E8"%>'/> 
<c:set var="morelessnamekey2" value='<%="\u7279\u5225\u5BA4"%>'/>   <!-- special room  for primary school  -->
<c:set var="morelessnamekey3" value='<%="\u5168\u6821\u8A9E\u6587\u653F\u7B56"%>'/> 
<c:set var="morelessnamekey4" value='<%="\u5B78\u6821\u8A2D\u65BD"%>'/> 
<c:set var="morelessnamekey5" value='<%="\u6821\u8A13"%>'/> 

<c:set var="mapkey1" value="${requestScope.entityVerticalCategoryList[0][1]['key']}0"/> <!-- full name -->
<c:set var="mapkey2" value="${requestScope.entityVerticalCategoryList[0][2]['key']}0"/> <!-- Address -->
<c:set var="mapkey17" value="${requestScope.entityVerticalCategoryList[0][17]['key']}0"/> <!-- sex -->

<c:set var="primarysport" value='<%="\u9AD4\u80B2"%>' />
<c:set var="ranking" value='<%="\u6392\u540D"%>' />		
<c:set var="nt" value='<%="\u65B0\u754C"%>' />		
<c:set var="division" value='<%="\u7D44\u5225"%>' />		
<c:set var="choirchi" value='<%="\u5408\u5531\u968A"%>' />
<c:set var="instrumentschi" value='<%="\u4E2D\u570B\u6A02\u5668"%>' />
<c:set var="male" value='<%="\u7537"%>' />		
<c:set var="female" value='<%="\u5973"%>' />

<c:set var="namekeyPOA" value='<%="\u5730\u5340"%>'/> 
<div style="float:right;position:relative;top:-20px;padding:40px 25px 0px 20px">
					
							<a class="btn btn-red tk tk2" onclick='javascript:document.location.href="/school/controller/schoolCompareSelection?selectbig=y&nocache=<%=new java.util.Date().getTime()%>"'><span><spring:message code="label.backtoschoolcompareselection"/></span></a>
						</div>
<div id="main">

<div id="compare" class="rounded" >

	<table class="comparison-table" cellspacing="0" summary="school compare">
	<thead class="specs-head">
		<tr>
			<th class="first-col"></th>
		  	<c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">
    		<th class="shuffle">
    		<a class="block" href="/school/controller/entityDetails?entityid=${requestScope.entityIDList[colunmCounter.count-1]}&action=compare" onclick="">
				
    		<span class="border" style="border:0px;"></span>
    		<h2>
    			<img class="imageshadow" src="/school/staticimage/CAT${requestScope.categoryid}/logo_${requestScope.chscidList[colunmCounter.count-1]}.jpg" onerror="ImgError(this);" alt="No Image" width="60px" height="60px"/>
    		</h2>
    		</a>
    		</th>
    		</c:forEach>
		</TR>
	</thead>
	<tbody class="specs-body">
		
		
		
		
		<c:forEach var="compareCategory" items="${requestScope.entityVerticalCategoryList}" varStatus="rowCounterCategory">
		<c:forEach var="compare" items="${compareCategory}" varStatus="rowCounter">
		    <c:set var="mapkey" value="key"/>
		    <c:set var="comparekey">${compare["key"]}currentyear</c:set>


			<c:choose>
			<c:when  test="${rowCounter.count == 1}">
				<c:if test="${compare['key'] ne 'b'}">
				<tr class=row${rowCounterCategory.count}1>
				<td valign="top" class="content-table-1" >
				<h3>
					<spring:message code='label.${requestScope.metricCategory[compare["key"]]}'/>
				</h3>
				</td>
				<c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">				
				<td align="right" class="content-table-1" >${requestScope.scoreList[colunmCounter.count-1][comparekey]}
				<c:if test="${compare['key'] ne 'b' && compare['key'] ne 'f' }"><spring:message code="label.score"/></c:if>
				</td>
				</c:forEach>
				</tr>
				</c:if>
			</c:when>
			<c:when test="${  requestScope.entityVerticalCategoryList[0][17][mapkey17]  eq male  &&  (fn:contains( compare['key'] , female)  )  }">
			
			</c:when>
			<c:when test="${   requestScope.entityVerticalCategoryList[0][17][mapkey17] eq female &&  (fn:contains( compare['key'] , male)  )  }">
			
			</c:when>
			<c:when test="${   fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  &&  (fn:contains( compare['key'] , division)  )  }">
			
			</c:when>
			<c:when test="${  not fn:contains( requestScope.entityVerticalCategoryList[0][2][mapkey2] , nt)  &&  (fn:contains( compare['key'] , nt)  )  }">
			
			</c:when>
			<c:when test="${ fn:contains(compare['key'] , 'division') || fn:contains( compare['key'], 'Choir') || fn:contains( compare['key'], 'Musical Instruments') || fn:contains( compare['key'], choirchi) || fn:contains( compare['key'], instrumentschi)  }">
			
			</c:when>
			<c:otherwise>
				<c:if test="${requestScope.excludeCompare[compare['key']] eq 'n'}">
					<tr class=${rowCounter.count eq 1 ? 'first-col' : 'display'}>
					<th class="first-col">${compare["key"]}</th>
					<c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">
					
					<td <c:choose><c:when test="${colunmCounter.count eq 1 && rowCounter.count eq 2 }"> class="shuffle"   </c:when><c:when test="${colunmCounter.count eq 1 }">class="shuffle"</c:when></c:choose> >
					<p>
			
			 			
					<c:set var="mapkey" value="${compare['key']}${colunmCounter.count-1}"/>
					<c:set var="namekey" value='<%="\u5B78\u6821\u540D\u7A31"%>'/> 
			  		<c:if test="${fn:contains( mapkey, namekey)}"><a href="/school/controller/entityDetails?entityid=${requestScope.entityIDList[colunmCounter.count-1]}&action=compare" style="text-decoration:none" ><c:if test="${colunmCounter.count eq 1}"><img style="float:left" src="/school/img/crown.png"></c:if></c:if>
			  		<c:if test="${fn:contains( mapkey, morelessnamekey1) || fn:contains( mapkey, morelessnamekey2) || fn:contains( mapkey, morelessnamekey3) || fn:contains( mapkey, morelessnamekey4) || fn:contains( mapkey, morelessnamekey5)}">
					<div class="more-less"><div class="more-block"><p></c:if>
    		  			
					<div class="font1_5">
			  			<!-- Start Real content here -->
						<c:choose>
						<c:when test="${fn:contains( mapkey, namekeyPOA)}">
							${poaschoolnetshortMap[compare[mapkey]]}
						</c:when>
						<c:when test="${fn:contains( mapkey, ranking) }">
							<c:set var="mapkeydiv" value="${compare['fieldname']}division${colunmCounter.count-1}"/>
							<c:set var="mapkeydivname" value="athleticsdivisionname${colunmCounter.count-1}"/>
							<span class="fonttiny d3-color-gray-2">
							<c:choose>
								<c:when test="${not empty requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][17][mapkeydivname] }">${requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][17][mapkeydivname] }</c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][rowCounter.count+8][mapkeydiv] eq '1'}"><spring:message code="label.divone"/></c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][rowCounter.count+8][mapkeydiv] eq '2'}"><spring:message code="label.divtwo"/></c:when>
  								<c:when test="${requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][rowCounter.count+8][mapkeydiv] eq '3'}"><spring:message code="label.divthree"/></c:when>
								<c:otherwise>${requestScope.entityVerticalCategoryList[rowCounterCategory.count-1][rowCounter.count+8][mapkeydiv]}</c:otherwise>
							</c:choose>
							</span>
								${compare[mapkey] eq '0' || compare[mapkey] eq '999' ? '-' : compare[mapkey]}
						</c:when>
						<c:otherwise>${compare[mapkey] eq '0' || compare[mapkey] eq '999' ? '-' : compare[mapkey]}</c:otherwise>
						</c:choose>
						<!-- End Real content here -->
					</div>
					<c:if test="${fn:contains( mapkey, morelessnamekey1) || fn:contains( mapkey, morelessnamekey2) || fn:contains( mapkey, morelessnamekey3) || fn:contains( mapkey, morelessnamekey4)}">
					</p></div></div>
					</c:if>
					<c:if test="${fn:contains( mapkey, namekey)}"></a></c:if>
					
					</p>
					</td>
					</c:forEach>
					</tr>
				</c:if>	
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:forEach>
		<tr>
        <td class="content-table-1"><h3><spring:message code="comment.ranking" arguments=" " /> / <spring:message code="label.schoolrating"/></h3></td>
        <c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">

            <td class="content-table-1"  align="right" >
        	   <font class="fontxxlarge">${requestScope.rankingList[colunmCounter.count-1]["ranking"]}</font><font style="line-height:1.0px;"> / ${requestScope.rankingList[colunmCounter.count-1]["score"]}</font>
        	</td>
        </c:forEach>
        </tr>
		<tr class="last-row">
								<th class="first-col"></th>
									<c:forEach var="varName" varStatus="colunmCounter" begin="0" end="${requestScope.recordCount-1}" step="1">
    	
									<td   <c:choose><c:when test="${colunmCounter.count eq 1}">class="shuffle"</c:when><c:otherwise>class="nano"</c:otherwise></c:choose> >
										
										<c:choose>
										<c:when test="${not empty sessionScope.user}">
										<a  href="#" onclick="javascript:saveviewedschoolsingle('${requestScope.entityIDList[colunmCounter.count-1]}','${sessionScope.user.id}','<spring:message code='label.favorite'/>','<spring:message code='label.favoriteschooladded'/>')"   ><spring:message code="label.addtofavorite"/></a>
										</c:when>
										<c:otherwise>
										<a  href="#" onclick='javascript:{ alert("<spring:message code="label.pleaselogin"/>") }'  ><spring:message code="label.addtofavorite"/> </a>
										</c:otherwise>
										</c:choose>
									</td>
										
    								</c:forEach>
								
		</tr>
	</tbody>
</table>

		
			<div class="expand-bottom roundedbottom">
				
				<div class="sosumi">
					
					<ul>
						<li class="fontxxxlarge fontbold"><spring:message code="label.analytics"/></li>
						<li>${requestScope.schoolCompareAnalytics['content']}</li>
						<li>
						<div style="float:right;padding-top:20px;padding-bottom:30px;">
							<a class="btn btn-red tk tk2" onclick='javascript:document.location.href="/school/controller/schoolCompareSelection?selectbig=y&nocache=<%=new java.util.Date().getTime()%>"'><span><spring:message code="label.backtoschoolcompareselection"/></span></a>
						</div>
						<br><br><br>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</div>



<jsp:include page="common-footer.jsp"/>

