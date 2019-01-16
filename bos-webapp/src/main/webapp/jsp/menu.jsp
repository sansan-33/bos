<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="internallink" scope="session">y</c:set>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="current_year" value="${now}" pattern="yyyy" />

<jsp:include page="status.jsp"/>
<jsp:include page="appsStatus.jsp"/>

<!-- overlayed element -->
<div class="apple_overlay" id="overlay">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<div class="apple_overlay_medium" id="overlay_medium">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<div class="apple_overlay_tutor" id="overlay_tutor">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<div class="apple_overlay_chat" id="overlay_chat">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<div class="apple_overlay_casesharing" id="overlay_casesharing">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>
<div class="apple_overlay_schoolselect" id="overlay_schoolselect">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap"></div>
</div>

<div style="float:right;position:relative;height:35px;width:400px;">
<p class="clear"/>
<div id="suggestions"></div>
</div>

<c:set var="signupalert">alert('<spring:message code='label.pleaselogin'/>')</c:set>
<c:set var="accountupdate">window.location='/school/controller/accountInfo?tab=profiletab'</c:set>

<div id="bodycolumn">
<div id="BodyHeader" class="container">


<div id="ShellHeaderContent">
    <span id="XbcPointsBalanceShell"></span>
    <div id="ShellMeBarArea">
        <a href="/school/controller/home">
            <div id="ShellLogo"></div>
        </a>
     
            <div id="SignedInExperience">
                 <c:choose>
						<c:when test="${empty sessionScope.user}">
                			<div id="HeadShotBox" class="SignedOut"></div>
                		</c:when>
                		<c:otherwise>
                			<div id="HeadShotBox" class="SignedIn" title="LeonardBB">
                    		<a href="/school/controller/viewProfile?userid=${sessionScope.user['id']}"><div class="avatarHeadshot" name="MeBarAvatar" style="background-size:60px 50px; background-image: url(http://www.bookofschool.com/school/userimages/${sessionScope.user['userprofile']}); "></div></a>
			                </div>	
                		</c:otherwise>
            	</c:choose>
                <div id="ShellMeBar" class="SignedIn">
                    <div id="GamerStatArea" class="GamerStatArea">
                        <c:choose>
						<c:when test="${empty sessionScope.user}">
							 <h1 class="gamertag" id="gamertag" name="MeBarGamerTag"><a href="/school/controller/loginForm?loginType=signup&isnew=true"><spring:message code="label.joinus"/></a></h1>
                  		</c:when>
    					<c:otherwise>
        					 <h1 class="gamertag" id="gamertag" name="MeBarGamerTag"><a href="/school/controller/viewProfile?userid=${sessionScope.user['id']}">${sessionScope.user['namelocal']}</a></h1>
                   			   <div class="Stats">
	                            <a id="notifications"><div class="notifications" style="display:none" name="MeBarNotificationCount"></div></a>  
	                            <a id="messages" href="/school/controller/getMessageUserList?mode=group&tab=groupmessagetab"><div class="messages" style="" name="MeBarMessageCount">${not empty requestScope.unreadmessagecount ? requestScope.unreadmessagecount : '0' }</div></a>
	                            <a id="gamerscore" href="/school/controller/accountInfo?tab=profiletab"><div class="gamerscore" style="" name="MeBarGamerScore">${sessionScope.user['userscore']}</div></a>
	                        </div>
                        </c:otherwise>
    					</c:choose>
                    </div>
                    <div class="LinkArea" style="">
                      
                        <c:choose>
						<c:when test="${empty sessionScope.user}">
						<a href="#" style="padding-left:3px;" title="Account Setup" onclick="${signupalert}" ><spring:message code="label.account"/></a>
                        <span class="spread"><a href="#" onclick="javascript:{ window.location='/school/controller/loginForm?loginType=signup' }">
	    						<spring:message code="label.signup"/></a></span>
                        <span class="spread">
                            <a href="#" onclick="javascript:{ window.location='/school/controller/loginForm?loginType=login' }">
	    					<spring:message code="label.login"/></a>
                        </span>
                   		
    					</c:when>
    					<c:otherwise>

     	  				<span id="AdditionalLinks" class="AdditionalLinks">
                            <span class="nowrap" name="MeBarTier" id="tier" tier="3">
                            	<spring:message code="label.welcome"/>
                            	<c:choose>
								<c:when test="${sessionScope.user['roleid'] eq '0' }">
									<c:if test="${not empty sessionScope.user['schoolname']}">
									<spring:message code="label.kidparentof" arguments="${fn:length(sessionScope.user['schoolname']) > 15 ? fn:substring(sessionScope.user['schoolname'], 0, 15) : sessionScope.user['schoolname'] }"/>
									</c:if>
								</c:when>
								<c:when test="${sessionScope.user['roleid'] eq '2'}">
									<spring:message code="label.tutor"/>
								</c:when>
								</c:choose>
						
                            </span>
                            <span class="spread nowrap" name="PointsBalance" id="points"><span class="points">${not empty sessionScope.favoritecount ? sessionScope.favoritecount : '0' }<span class="pointsIcon"></span></span> <a href="/school/controller/myFavoriteConsole?action=favorite&tab=favoritetab"><spring:message code="label.favorite"/></a></span>
                            <span class="nowrap" id="ShellSubscriptionNotificationArea"></span>
                            <span class="spread"><a href="#" style="padding-left:3px;" title="Account Setup" onclick="${accountupdate}" ><spring:message code="label.account"/></a></span>
                        	</span>
                        	<c:if test="${sessionScope.user['roleid'] eq '1' || sessionScope.user['roleid'] eq '5' }">
                                <span class="spread">
                                    <a href="#" onclick="javascript:{ window.location='/school/controller/adminConsole' }"><spring:message code="label.admin"/></a>
                                </span>
                            </c:if>
                            <span class="spread">
                             <a href="#" onclick="javascript:{ window.location='/school/controller/logout?currenturi=home' }"><spring:message code="label.logout"/></a>
                         	 </span>
                        	
    					</c:otherwise>
    					</c:choose>
                        <span class="spread">
                         	 <c:choose>
								<c:when test="${pageContext.response.locale eq 'en'}">
								<a href="?lang=zh&${pageContext.request.queryString}"><spring:message code="label.zh"/></a>
								</c:when>
								<c:otherwise>
								<a href="?lang=en&${pageContext.request.queryString}" >ENGLISH</a>
								</c:otherwise>
							</c:choose>
							</span>
                    </div>
                </div>
                <div id="MeBarDataLoader"></div>
                <div id="MeBarSubDataLoader"></div>
            </div>
     
    </div>
</div>

<div id="ShellNavigationBar">
<div class="bosmenu" >
		   <form name="schoolSearch" action="/school/controller/siteSearch" method="post">
		   <div class="SearchArea">
     
 			<input id="SearchTextBox" type="text" name="inputString" class="TextBox WatermarkColor" maxlength="200" autocomplete="off" value="<spring:message code='label.searchtextfield'/>" name="inputString" onkeyup="lookup(this.value);" 
onclick="clickclear(this, '<spring:message code='label.searchtextfield'/>')" onblur="clickrecall(this,'<spring:message code='label.searchtextfield'/>')" />
        	<input id="SearchButton" type="button" class="SubmitButton" onclick="document.forms['schoolSearch'].submit();" />
        </div>
   		 </form>
   				
	 <ul class="dropdown">
	 			<li><a href="/school/controller/home" title="home"><spring:message code="label.home"/></a></li>
				<li>
        				<a href="#"><spring:message code="label.school"/><img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/kidEducationConsole" title="<spring:message code="label.kidedu"/>"><spring:message code="label.kidedu"/></a></li>
			    			<li><a href="/school/controller/kindergartenConsole?categoryid=0" title="<spring:message code="label.kindergarten"/>"><spring:message code="label.kindergarten"/></a></li>
			    			<li><a href="/school/controller/primarySchoolConsole?categoryid=1" title="<spring:message code="label.primary"/>"><spring:message code="label.primary"/></a></li>
			   				<li><a href="/school/controller/secondarySchoolConsole?categoryid=2" title="<spring:message code="label.secondary"/>"><spring:message code="label.secondary"/></a></li>
			    			<li><a href="/school/controller/intlSchoolConsole?categoryid=5" title="<spring:message code="label.ib"/>"><spring:message code="label.ib"/></a></li>
			  			</ul>
        		</li>
        		
    			<li><a href="/school/controller/getCaseSharingList?view=all" title="case"><spring:message code="label.casesharing"/></a></li>
						
			    <li>
        				<a href="#"><spring:message code="label.rankingreport"/><img style="padding-left:5px;" src="../img/newtrip.png"/><img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/getHitSchoolReport?schoolyear=2018"><spring:message code="label.hitschool"/><img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=kindergartenranking&schoolcategory=0"><spring:message code="label.kindergartenranking"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=primaryranking&schoolcategory=1"><spring:message code="label.primaryranking"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=secondaryranking&schoolcategory=2"><spring:message code="label.secondaryranking"/></a></li>
        					<!--
        					<li><a href="/school/controller/privateDssReport"><spring:message code="label.privatedssreport"/></a></li>
        				    -->
        				</ul>
        		</li>
			    <li>
        				<a href="#"><spring:message code="label.schoolsearchtool"/><img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/eventFullCalendar?view=list&year=${current_year}&sortby=full#todayanchor"><spring:message code="label.eventcalendar"/></a></li>
                			<li><a href="/school/controller/schoolAllocationReport?categoryid=0&schoolplacementyear=2018"><spring:message code="label.schoolallocationsummary0"/></a></li>
                        	<li><a href="/school/controller/schoolAllocationReport?categoryid=1&schoolplacementyear=2018"><spring:message code="label.schoolallocationsummary1"/></a></li>
                            <li><a href="/school/controller/searchForm?nocache=<%=new java.util.Date().getTime()%>" style="text-decoration:none"><spring:message code="label.advancedsearch"/></a></li>
							<li><a href="/school/controller/reverseSearchForm?nocache=<%=new java.util.Date().getTime()%>"  style="text-decoration:none" ><spring:message code="label.reversesearch"/></a></li>
							<li><a href="/school/controller/schoolCompare?nocache=<%=new java.util.Date().getTime()%>" style="text-decoration:none" ><spring:message code="label.schoolcompare"/></a></li>
						</ul>
        		</li>
        	 	<li>
				<a href="/school/controller/getForumMenu"><spring:message code="label.forum"/></a>
   				</li>
<!--
   				<li><a href="/school/controller/getCourseList" title="tutor"><spring:message code="label.tutormenu"/></a></li>
   -->
   	    </ul>
</div>
</div>


</div>
</div>        




<!--  End of Top Menu Logo Login Sign Up and Logout-->
<div id="contents-wrap"> <!--  Start of contents-wrap -->
<c:if test="${ fn:contains(pageContext.request.serverName ,'bookofschool')}">
<jsp:include page="ads/adsfactorwide.jsp"/>
</c:if>

<div style="padding-top:15px;"></div>
<table class="mastertable">
<!-- Start of Common Search Form -->
<!-- Start of navigation menu --> 
<TR  height="1px" valign="top" width="100%" > 
<td colspan="2" > 
<!--
<div id="breadcrumb" class="breadcrumb">
	<ul class="floatcontainer">
	<c:forEach var="menu" items="${requestScope.topmenu}" varStatus="rowCounter">
		<c:choose>
	        <c:when test="${rowCounter.count eq 1 }">
				<li class="navbithome"><a href="/school/controller/${menu['URI']}" title="${menu['NAME']}"><img style="padding-right:5px;height:15px;" src="/school/img/navbit-home.png"/><img style="padding-left:5px" src="/school/img/navbit-arrow-right.png"/></a></li>
			</c:when>
	        <c:otherwise>
				<li class="navbit">
						<c:choose>
						<c:when test="${menu['SCRIPT'] eq 'true'}">
						<a href="#" onclick="${menu['URI']}">${menu['NAME']}</a>
						</c:when>
						<c:otherwise>
						<a href="/school/controller/${menu['URI']}" title="${menu['NAME']}">${menu['NAME']}</a>
						</c:otherwise>
						</c:choose>
					
				</li>
			</c:otherwise>  
	    </c:choose>
	</c:forEach>
	<c:set var="lastitemtrimed">${fn:substring(requestScope.topmenu[0]['LAST'], 0, 20)} .....</c:set>
	<li class="navbit lastnavbit"><span style="top:1px;position:relative;">${ fn:length(requestScope.topmenu[0]['LAST']) > 20 ? lastitemtrimed : requestScope.topmenu[0]['LAST'] } </span></li>
	</ul>
</div>
-->
<c:if test="${ fn:length(requestScope.topmenu) > 0 }">
<ul id="crumbs" class="crumbul" style="margin-right:12px;margin-left:5px;">
		<c:forEach var="menu" items="${requestScope.topmenu}" varStatus="rowCounter">
        		<c:choose>
        	        <c:when test="${rowCounter.count eq 1 }">
        				<li class="crumbli"><a href="/school/controller/${menu['URI']}" title="${menu['NAME']}"><img style="padding:5px;height:17px;" src="/school/img/navbit-home.png"/></a></li>
        			</c:when>
        	        <c:otherwise>
        				<li class="crumbli">
        						<c:choose>
        						<c:when test="${menu['SCRIPT'] eq 'true'}">
        						<a href="#" onclick="${menu['URI']}">${menu['NAME']}</a>
        						</c:when>
        						<c:otherwise>
        						<a href="/school/controller/${menu['URI']}" title="${menu['NAME']}">${menu['NAME']}</a>
        						</c:otherwise>
        						</c:choose>

        				</li>
        			</c:otherwise>
        	    </c:choose>
        	</c:forEach>
        	<c:set var="lastitemtrimed">${fn:substring(requestScope.topmenu[0]['LAST'], 0, 20)} .....</c:set>
        	<li class="crumbli">${ fn:length(requestScope.topmenu[0]['LAST']) > 20 ? lastitemtrimed : requestScope.topmenu[0]['LAST'] } </span></li>
</ul>
</c:if>

<form action="/school/controller/schoolSearch" method="post" name="schoolbreadcrumb" id="schoolbreadcrumb">
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="-1" />
<input type="hidden" name="nursery" id="nursery" value="-1" />
<input type="hidden" name="poaschoolnets" id="poaschoolnets" value="-1" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="0" />
<input type="hidden" name="categoryid" id="categoryid" value="${requestScope.categoryid}" />
<input type="hidden" name="financetype" id="financetype" value="-1" />
<input type="hidden" name="district" id="district" value="-1" />
</form>
<form action="/school/controller/ibConsole" method="post" name="ibschool" id="ibschool">
	<input type="hidden" name="schoolsystem" id="schoolsystem" value="-1" />
	<input type="hidden" name="categoryid" id="categoryid" value="5" />
</form>

<script>

    $("ul.dropdown li").hover(function(){

        $(this).addClass("hover");
        $('ul:first',this).css('visibility', 'visible');

    }, function(){

        $(this).removeClass("hover");
        $('ul:first',this).css('visibility', 'hidden');

    });

    $("ul.dropdown li ul li:has(ul)").find("a:first").append(" &raquo; ");

</script>

</td></TR>
<!-- End of navigation menu --> 
 <TR valign="top" width="580px"> <!-- Start of Main Body --> 
  <td>
  
  




  