<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

































<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<link rel="shortcut icon" href="/school/img/favicon.ico" />

 <!-- name -->
 <!-- name -->









<title>中學排名  學校大全</title>


 <META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">
 <meta property="og:image" content="http://www.bookofschool.com/school/img/logo_bos_fb.jpg" />





  	<meta name="description" content="中學排名 "/>
    <meta name="keywords" content="中學排名"/>
	<meta name="robots" content="中學排名"/>
  	<meta name="googlebot" content="中學排名"/>









  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bos.min.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/nav.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/search.css'>
	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/datatable.css'>
    <LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bubble.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/kiwi.css'>


<script src='https://s.yimg.com/uv/dm/scripts/syndication.js'></script>
<script src="/school/js/bos.js"  djConfig="parseOnLoad: true"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="/school/js/apple.search.js"  djConfig="parseOnLoad: true"></script>
<script src="/school/js/jquery.tools.min.js"></script>
<script src="/school/js/jquery-ui.custom.min.js"></script>


    <script type="text/javascript" src="/school/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/school/js/jquery.dataTables.min.bootstrap.js"></script>



<script type="text/javascript" language="javascript" src="/school/js/jquery.dropdownPlain.js"></script>

<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/menu.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bosfont.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bosd3.css'>
<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/breadcrumb.css'>



<script type="text/javascript" language="javascript">

    google.load("feeds", "1") //Load Google Ajax Feed API (version 1)
    var overlayElem;

$(document).ready(function()
{
    var updateTimer = 0;
	var timer=0;
    var input = '<img';


	 		$('#statusbox').hide();

	if($('#message').is(':empty')){
	 	$('#statusbox').hide();
    }
	//scroll the message box to the top offset of browser's scrool bar
	$(window).scroll(function()
	{
  		$('#statusbox').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});

	});
        //when the close button at right corner of the message box is clicked
	$('#closemessage').click(function()
	{
  		//the messagebox gets scrool down with top property and gets hidden with zero opacity
		$('#statusbox').hide();
	});
    $('#appsclosemessage').click(function()
	{
  		$('#appsbox').hide();
	});
	$("#report").tooltip({
		effect: 'slide',
		relative: true,
		 offset: [90, 2]
	}).dynamic({ bottom: { direction: 'down', bounce: true } });

    <!-- make all links with the 'rel' attribute open overlays -->

	$("a[rel]").click(function() { overlayElem = $(this); });

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

    if(isMobileDevice()){
        $('#appsbox').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 550},"slow");
        $('#appsbox').show();
        setTimeout(function() {$('#appsbox').fadeOut('slow');}, 8000);
    }

});

function showMessage(message){
		$("#message").text(message);
		$('#statusbox').animate({top:$(window).scrollTop()+"px",opacity:100},{queue: false, duration: 350},"slow");
		$('#statusbox').show();
		setTimeout(function() {$('#statusbox').fadeOut('slow');}, 5000);
	  }
</script>


<!-- Place this render call where appropriate -->
<script type="text/javascript">
  window.___gcfg = {lang: 'zh-TW'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>


<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-28080773-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>



</HEAD>

<body class="tundra">


<div id="fb-root"></div>
<script>

window.fbAsyncInit = function() {
    FB.init({
      appId      : '263990090354164',
      channelUrl : '//WWW.BOOKOFSCHOOL.COM/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


  $(document).ready(function(){

    FB.Event.subscribe('auth.login', function(response) {
  	   login();
  	});
  	FB.Event.subscribe('auth.logout', function(response) {
  	   logout();
  	});
  	FB.getLoginStatus(function(response) {
  	   if (response.session) {
  	      greet();
  	   }
  	});

  });

  function login(){
	   FB.api('/me', function(response) {
		 ajaxRequest('/school/controller/sociallogin/' + response.id + '/socialfbid/'+ response.name + '/' + response.email + '/' + Math.random()*Math.random());
		 //document.getElementById("favoritecount").innerHTML = '我喜愛的學校 (6)';
		 console.log('You have successfully logged in, '+response.name + ' / ' + response.id + '/' + response.email);
		 //location.reload(true);
 	   });
  }
   function logout(){

	   ajaxRequest('/school/controller/sociallogout/' + Math.random()*Math.random());
	   console.log('You have successfully logged out!');
	}
	function greet(){
	   FB.api('/me', function(response) {
		   console.log('Welcome, '+response.name + ' / ' + response.id + '/' + response.email);
	   });
	}

</script>





<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/search.css'>











<div id="statusbox">
<img id="closemessage" style="float:right;cursor:pointer"  src="/school/img/cross.png"/>
<div id='message'><c:if test="false"></c:if></div>
</div>



<div id="appsbox">
    <img id="appsclosemessage" style="float:right;cursor:pointer"  src="/school/img/cross.png"/>
    <div style="padding-top:30px;">
        <div style="padding-left:10px;float:left">
            <a class="download" target="_blank" href="https://itunes.apple.com/us/app/bookofschool/id1236504022">
                <img src="/school/img/apple-download.png?1495100274">
            </a>
            <a class="download" href="#" onclick="alert('即將推出');">
                <img src="/school/img/google-download.png?1495100274">
            </a>
        </div>
        <div style="padding-left:10px;padding-top:10px;float:left">
            <font style="font-size:15px;">請立即下載，您可以創建新評論，上傳學校圖片，並查看所有學校的詳細信息，活動和評論。</font>
        </div>
    </div>
</div>

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




<div id="bodycolumn">
<div id="BodyHeader" class="container">


<div id="ShellHeaderContent">
    <span id="XbcPointsBalanceShell"></span>
    <div id="ShellMeBarArea">
        <a href="/school/controller/home">
            <div id="ShellLogo"></div>
        </a>

            <div id="SignedInExperience">



                			<div id="HeadShotBox" class="SignedIn" title="LeonardBB">
                    		<a href="/school/controller/viewProfile?userid=1"><div class="avatarHeadshot" name="MeBarAvatar" style="background-size:60px 50px; background-image: url(http://www.bookofschool.com/school/userimages/1-logobookgreen.png); "></div></a>
			                </div>


                <div id="ShellMeBar" class="SignedIn">
                    <div id="GamerStatArea" class="GamerStatArea">



        					 <h1 class="gamertag" id="gamertag" name="MeBarGamerTag"><a href="/school/controller/viewProfile?userid=1">BOS</a></h1>
                   			   <div class="Stats">
	                            <a id="notifications"><div class="notifications" style="display:none" name="MeBarNotificationCount"></div></a>
	                            <a id="messages" href="/school/controller/getMessageUserList?mode=group&tab=groupmessagetab"><div class="messages" style="" name="MeBarMessageCount">5</div></a>
	                            <a id="gamerscore" href="/school/controller/accountInfo?tab=profiletab"><div class="gamerscore" style="" name="MeBarGamerScore">53</div></a>
	                        </div>


                    </div>
                    <div class="LinkArea" style="">





     	  				<span id="AdditionalLinks" class="AdditionalLinks">
                            <span class="nowrap" name="MeBarTier" id="tier" tier="3">
                            	歡迎





                            </span>
                            <span class="spread nowrap" name="PointsBalance" id="points"><span class="points">6<span class="pointsIcon"></span></span> <a href="/school/controller/myFavoriteConsole?action=favorite&tab=favoritetab">我喜愛的學校</a></span>
                            <span class="nowrap" id="ShellSubscriptionNotificationArea"></span>
                            <span class="spread"><a href="#" style="padding-left:3px;" title="Account Setup" onclick="window.location='/school/controller/accountInfo?tab=profiletab'" >帳戶</a></span>
                        	</span>

                                <span class="spread">
                                    <a href="#" onclick="javascript:{ window.location='/school/controller/adminConsole' }">管理控制台</a>
                                </span>

                            <span class="spread">
                             <a href="#" onclick="javascript:{ window.location='/school/controller/logout?currenturi=home' }">登出</a>
                         	 </span>



                        <span class="spread">



								<a href="?lang=en&reporttype=secondaryranking&schoolcategory=2" >ENGLISH</a>


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

 			<input id="SearchTextBox" type="text" name="inputString" class="TextBox WatermarkColor" maxlength="200" autocomplete="off" value="學校名稱 ..." name="inputString" onkeyup="lookup(this.value);"
onclick="clickclear(this, '學校名稱 ...')" onblur="clickrecall(this,'學校名稱 ...')" />
        	<input id="SearchButton" type="button" class="SubmitButton" onclick="document.forms['schoolSearch'].submit();" />
        </div>
   		 </form>

	 <ul class="dropdown">
	 			<li><a href="/school/controller/home" title="home">主頁</a></li>
				<li>
        				<a href="#">學校<img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/kidEducationConsole" title="兒童學習">兒童學習</a></li>
			    			<li><a href="/school/controller/kindergartenConsole?categoryid=0" title="幼稚園">幼稚園</a></li>
			    			<li><a href="/school/controller/primarySchoolConsole?categoryid=1" title="小學">小學</a></li>
			   				<li><a href="/school/controller/secondarySchoolConsole?categoryid=2" title="中學">中學</a></li>
			    			<li><a href="/school/controller/intlSchoolConsole?categoryid=5" title="國際學校">國際學校</a></li>
			  			</ul>
        		</li>

    			<li><a href="/school/controller/getCaseSharingList?view=all" title="case">個案分享</a></li>

			    <li>
        				<a href="#">排行榜<img style="padding-left:5px;" src="../img/newtrip.png"/><img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/getHitSchoolReport?schoolyear=2016">全港最受歡迎小學<img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=kindergartenranking&schoolcategory=0">全港幼稚園排名<img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=primaryranking&schoolcategory=1">全港小學排名<img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=secondaryranking&schoolcategory=2">全港中學排名<img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<!--
        					<li><a href="/school/controller/privateDssReport">全港直資私立小學入學申請</a></li>
        				    -->
        				</ul>
        		</li>
			    <li>
        				<a href="#">選校工具<img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/eventFullCalendar?view=list&year=2017&sortby=full#todayanchor">選校行事曆</a></li>
                			<li><a href="/school/controller/schoolAllocationReport?categoryid=0&schoolplacementyear=2016">全港升小派位概況</a></li>
                        	<li><a href="/school/controller/schoolAllocationReport?categoryid=1&schoolplacementyear=2016">全港升中派位概況</a></li>
                            <li><a href="/school/controller/searchForm?nocache=1495859132125" style="text-decoration:none">學校搜尋</a></li>
							<li><a href="/school/controller/reverseSearchForm?nocache=1495859132125"  style="text-decoration:none" >逆向搜尋</a></li>
							<li><a href="/school/controller/schoolCompare?nocache=1495859132125" style="text-decoration:none" >學校比較</a></li>
						</ul>
        		</li>
        	 	<li>
				<a href="/school/controller/getForumMenu">討論區</a>
   				</li>
<!--
   				<li><a href="/school/controller/getCourseList" title="tutor">找導師</a></li>
   -->
   	    </ul>
</div>
</div>


</div>
</div>




<!--  End of Top Menu Logo Login Sign Up and Logout-->
<div id="contents-wrap"> <!--  Start of contents-wrap -->

<div id="adone" style="position:relative;float:left;"></div>
<script language='JavaScript' type='text/javascript'>randomstr = new String (Math.random());randomstr = randomstr.substring(1,8);document.write ("<" + "script language='JavaScript' type='text/javascript' src='" + "https://servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=308298534471" + "'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=308298534471' ><img src='https://servedby.adsfactor.net/adv.php?sid=308298534471' border='0'></a></noscript>


<div style="padding-top:15px;"></div>
<table class="mastertable">
<!-- Start of Common Search Form -->
<!-- Start of navigation menu -->
<TR  height="1px" valign="top" width="100%" >
<td colspan="2" >
<!--
<div id="breadcrumb" class="breadcrumb">
	<ul class="floatcontainer">


	<li class="navbit lastnavbit"><span style="top:1px;position:relative;"> </span></li>
	</ul>
</div>
-->


<form action="/school/controller/schoolSearch" method="post" name="schoolbreadcrumb" id="schoolbreadcrumb">
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="-1" />
<input type="hidden" name="nursery" id="nursery" value="-1" />
<input type="hidden" name="poaschoolnets" id="poaschoolnets" value="-1" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="0" />
<input type="hidden" name="categoryid" id="categoryid" value="2" />
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













<table style="width:1120px;">
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td width="300px;">




<style>#ypaAdWrapper-bookofschool_right iframe{width:100%}</style>
<div id='ypaAdWrapper-bookofschool_right'></div>
</td>
<td valign="top" align="right">







<!-- Zone Tag : bookofschool MediumRectangle -->





<!-- Javascript tag: -->
<!-- begin Maximizer for channel: Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Medium Rectangle - 300 x 250 -->
<script language="JavaScript">
var zflag_nid="1044"; var zflag_cid="1775/1773"; var zflag_sid="402"; var zflag_width="300"; var zflag_height="250"; var zflag_sz="9";
</script>
<script language="JavaScript" src="https://tt3.zedo.com/jsc/tt3/fo.js"></script>
<!-- end Maximizer for channel: Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Medium Rectangle - 300 x 250 -->





</td>
<td valign="top" align="right"><div id="adtwo"></div>
<script language='JavaScript' type='text/javascript'>randomstr = new String (Math.random());randomstr = randomstr.substring(1,8);document.write ("<" + "script language='JavaScript' type='text/javascript' src='" + "https://servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=143407064470" + "'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=143407064470' ><img src='https://servedby.adsfactor.net/adv.php?sid=143407064470' border='0'></a></noscript></td></tr>
</table>
<br class="clear">

<br class="clear">
<div style="padding-top:60px;"></div>
<div style="border-bottom: 1px dashed grey;"></div>
<br><br class="clearboth">






<script type="text/javascript" charset="utf-8">

function visited(obj) {
	obj.style.color = "red";
	}

			/* Table initialisation */
			$(document).ready(function() {

				$('#searchTable').dataTable( {
					"aoColumnDefs": [{ "sType": "numeric", "aTargets": [ 9,10,12,13,14,15,16,17,18,20  ] }],
					"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
					"sPaginationType": "bootstrap",
					"aaSorting": [[18,'asc']],  /* default sort by ranking */
					"aoColumns": [
	                              {"iDataSort": 18},   /* 0.  rank */
                                  {"bSortable": false},                                             /* 1.  image */
	                              {"bSortable": false},                                             /* 2.  name */
	                              {"iDataSort": 12},    /* 3.  academic */
	                              {"iDataSort": 13},{"iDataSort": 14},                                                       /* 4,5. sport, music */
	                              {"iDataSort": 15},   /* 6.  teacher */
	                              {"iDataSort": 16},   /* 7.  campus */
	                              {"iDataSort": 20},   /* 8.  rating this year */
	                              {"iDataSort": 9},     /* 9.  rating total average*/
	                              {"bVisible": false},                                              /* 10.  +/- */
	                              {"iDataSort": 10},    /* 11. position +/- */
	                              {"bVisible": false},                                              /* 12. academic */
	                              {"bVisible": false},{"bVisible": false},                                               /* 13.14 sport, music  */
	                              {"bVisible": false},                                              /* 15. teacher */
	                              {"bVisible": false},                                              /* 16. campus */
	                              {"bVisible": false},                                              /* 17. entityscore */
	                              {"bVisible": false},                                              /* 18. ranking */
	                              {"bSortable": false},                                             /* 19. school allocation button */
	                              {"bVisible": false}                                               /* 20. this year rating only */
	                              ],
					"bLengthChange": false,
					"iDisplayLength": 100,
					"bFilter": false,
					"oLanguage": {
						"oPaginate": { "sNext": "下一頁",	"sPrevious": "前一頁"},
						"sLengthMenu": "_MENU_ 顯示結果",
						"sZeroRecords": "&nbsp;",
						"sSearch": "搜尋",
						"sInfo": "顯示 _START_ 至 _END_ 共 _TOTAL_ 結果",
						"sInfoEmpty": "顯示 0 至 0 共 0 結果",
						"sInfoFiltered": "(尋找 _MAX_ 結果)"
					}
				} );


			} );
</script>

<script type="text/javascript">

function showLastYear(){

	var value = '-1';
	if($('#lastyearrecordbox').prop('checked') == true)
		value = 'y';
	document.forms["schoolsearch"].lastyearrecord.value = value;
	document.forms["schoolsearch"].submit();

}

</script>

<form action="/school/controller/schoolSearch" method="post" name="schoolsearch" id="schoolsearch">
<input type="hidden" name="categoryid" id="categoryid" value="2" />
<input type="hidden" name="financetype" id="financetype" value="-1" />
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="-1" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="2" />
<input type="hidden" name="nominated" id="nominated" value="-1" />
<input type="hidden" name=feeder id="feeder" value="-1" />
<input type="hidden" name="throughtrain" id="throughtrain" value="-1" />
<input type="hidden" name="reporttype" id="reporttype" value="secondaryranking" />
<input type="hidden" name="lastyearrecord" id="lastyearrecord" value="-1" />


</form>


					<h1>全港中學排名(TOP 100)</h1>

					<br>
					<font class="fontxlarge fontbold d3-color-orange">我們在這次更新中, 增加升跌資料，希望將更準確的資料與大家分享。部分學校的排名可能有變，敬請留意。</font><br>
					<font class="fontlarge fontbold d3-color-orange">最後更新在 27-五月-17</font></p>
    				<br>

<!--
    				<br><font class="fontxlarge fontbold d3-color-orange">資料更新正進行中,排名將會有變化。預計今個星期內會完成</font></p>
    				<br>
-->
					<p class="fontbold d3-color-gray" style="padding-top:5px;">評分比重，學術佔40%，其餘四項佔15%。</p>
					<p class="fontbold d3-color-gray" style="padding-top:5px;">?=資料不全,排名只作參考</p>
                    <br>

					<div style="float:right;right:20px;position:relative;top:-60px;"><img src="/school/img/barchart.png" style="width:30px;height:30px;position:relative;top:5px;" /><a class="fontbold" style=" font-size:25px !important;" href="/school/controller/getCMSDetails?id=2">如何排名</a></div>


					<span style="position:relative;padding-bottom:10px;float:right;right:-70px;">
					<label class="fontmedium d3-color-gray" for="lastyearrecord">顯示去年評分&nbsp;<input id="lastyearrecordbox" name="lastyearrecordbox" value="y" type="checkbox" onclick="showLastYear();" > </label>
					</span>
					<div style="position:relative;float:right;padding-bottom:10px;" class="fb-like" data-send="false" data-width="30" data-layout="button_count"></div>

					<br class="clear"><br class="clear">




					<div class="fontxlarge d3-color-gray">全港 排名</div>
					<br class="clear"><br class="clear">
					<table class="bordered-table zebra-striped" id="searchTable">
						<thead>
						<tr>





						    <TH width="65" class="font2" style="text-align:center">排名</TH>
						    <th width="60"></th>
						    <TH width="360" class="fontmedium" >學校名稱</TH>

						    <TH width="65" class="font2">學術<font class="fontsmall"> 40%</font></TH>

						    <TH width="65" class="font2">體育<font class="fontsmall"> 15%</font></TH>
						    <TH width="65" class="font2">音樂<font class="fontsmall"> 15%</font></TH>

						    <TH width="70" class="font2">師資<font class="fontsmall">  15%</font></TH>
  						    <TH width="65" class="font2">校舍<font class="fontsmall">  15%</font></TH>
						    <TH width="70" class="font2">評級<font class="fontsmall">今年</font></TH>
						    <TH width="70" class="font2">評級<font class="fontsmall">總平均</font></TH>
						    <TH>&nbsp;</TH>
						    <TH width="45" class="font2">升跌</TH>

							<th>&nbsp;</th>

								<th>&nbsp;</th><th>&nbsp;</th>

							<th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th>


							<th width="1">&nbsp;</th>

						</tr>
						</thead>
						<tbody>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">1 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_3.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5890&action=compare"}'>
                                    <font class="fontbold">拔萃女書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Diocesan Girls' School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.83</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>10.0</td>

								    <td>10.0</td><td>10.0</td>

								<td>9.0</td><td>10.0</td><td>9.83</td><td>1</td>



										<td width="1px;"></td>


							<td>9.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">2 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_2.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5888&action=compare"}'>
                                    <font class="fontbold">拔萃男書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Diocesan Boys' School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.27</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>10.0</td><td>10.0</td>

								<td>8.0</td><td>10.0</td><td>9.27</td><td>2</td>



										<td width="1px;"></td>


							<td>9.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">3 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_50.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5937&action=compare"}'>
                                    <font class="fontbold">德望學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Good Hope School</font>
                                    <br><font class="fontsmall">黃大仙 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>10.0</td><td>9.5</td>

								<td>8.0</td><td>10.0</td><td>9.10</td><td>3</td>



										<td width="1px;"></td>


							<td>9.21</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">4 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_177.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6062&action=compare"}'>
                                    <font class="fontbold">喇沙書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">La Salle College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.06</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>10.0</td><td>9.5</td>

								<td>8.0</td><td>10.0</td><td>9.06</td><td>4</td>



										<td width="1px;"></td>


							<td>9.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">5 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_399.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6284&action=compare"}'>
                                    <font class="fontbold">協恩中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Heep Yunn School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.01</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>10.0</td>

								    <td>10.0</td><td>7.8</td>

								<td>8.0</td><td>9.0</td><td>9.01</td><td>5</td>



										<td width="1px;"></td>


							<td>9.26</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">6 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_288.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6173&action=compare"}'>
                                    <font class="fontbold">聖公會林護紀念中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Lam Woo Memorial Secondary School</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.74</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>10.0</td>

								    <td>6.5</td><td>9.0</td>

								<td>8.0</td><td>7.0</td><td>8.74</td><td>6</td>



										<td width="1px;"></td>


							<td>8.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">7 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_273.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6158&action=compare"}'>
                                    <font class="fontbold">聖保祿學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's Convent School</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.67</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>10.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>7.0</td><td>6.5</td><td>8.67</td><td>7</td>



										<td width="1px;"></td>


							<td>8.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">8 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_213.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6098&action=compare"}'>
                                    <font class="fontbold">瑪利諾修院學校（中學部）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Maryknoll Convent School (Secondary Section)</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.9 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.67 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.67</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.9</td>

								    <td>9.0</td><td>8.0</td>

								<td>8.0</td><td>9.0</td><td>8.67</td><td>8</td>



										<td width="1px;"></td>


							<td>8.67</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">9 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_211.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6096&action=compare"}'>
                                    <font class="fontbold">瑪利曼中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Marymount Secondary School</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.7 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.37 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.64</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.7</td>

								    <td>8.0</td><td>8.5</td>

								<td>8.0</td><td>8.0</td><td>8.64</td><td>9</td>



										<td width="1px;"></td>


							<td>8.37</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">10 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_275.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6160&action=compare"}'>
                                    <font class="fontbold">聖保羅男女中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's Co-educational College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.63</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>10.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>7.0</td><td>8.5</td><td>8.63</td><td>10</td>



										<td width="1px;"></td>


							<td>8.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">11 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_128.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6013&action=compare"}'>
                                    <font class="fontbold">皇仁書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Queen's College</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.71 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.50</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>8.0</td><td>9.0</td><td>8.50</td><td>11</td>



										<td width="1px;"></td>


							<td>8.71</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">12 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_311.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6196&action=compare"}'>
                                    <font class="fontbold">聖士提反女子中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Stephen's Girls' College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.7 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.23 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.41</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.7</td>

								    <td>8.0</td><td>8.5</td>

								<td>7.0</td><td>8.0</td><td>8.41</td><td>12</td>



										<td width="1px;"></td>


							<td>8.23</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">13 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_372.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6257&action=compare"}'>
                                    <font class="fontbold">香港華仁書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Wah Yan College Hong Kong</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.11 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.32</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>7.8</td>

								<td>7.0</td><td>9.0</td><td>8.32</td><td>13</td>



										<td width="1px;"></td>


							<td>8.11</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">14 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_418.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6303&action=compare"}'>
                                    <font class="fontbold">英華書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ying Wa College</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.8 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.06 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.21</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.8</td>

								    <td>8.0</td><td>9.0</td>

								<td>5.0</td><td>8.0</td><td>8.21</td><td>14</td>



										<td width="1px;"></td>


							<td>8.06</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">15 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_379.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6264&action=compare"}'>
                                    <font class="fontbold">香港培正中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pui Ching Middle School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.19</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>7.8</td>

								<td>6.5</td><td>9.0</td><td>8.19</td><td>15</td>



										<td width="1px;"></td>


							<td>8.04</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">16 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_153.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6038&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖瑪利書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Mary's Canossian College</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.18</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>5.0</td><td>8.0</td><td>8.18</td><td>16</td>



										<td width="1px;"></td>


							<td>7.97</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">17 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_389.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6274&action=compare"}'>
                                    <font class="fontbold">香港真光中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">True Light Middle School of Hong Kong</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.61 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.17</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>9.0</td><td>8.3</td>

								<td>8.0</td><td>8.0</td><td>8.17</td><td>17</td>



										<td width="1px;"></td>


							<td>8.61</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">18 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_125.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6010&action=compare"}'>
                                    <font class="fontbold">華仁書院（九龍）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Wah Yan College, Kowloon</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.14</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>10.0</td><td>9.0</td>

								<td>7.0</td><td>10.0</td><td>8.14</td><td>18</td>



										<td width="1px;"></td>


							<td>8.57</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">19 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_309.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6194&action=compare"}'>
                                    <font class="fontbold">聖若瑟書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Joseph's College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.00</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>7.5</td><td>5.0</td><td>8.00</td><td>19</td>



										<td width="1px;"></td>


							<td>8.07</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">20 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_417.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6302&action=compare"}'>
                                    <font class="fontbold">英華女學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ying Wa Girls' School</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.90</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>7.0</td><td>7.0</td><td>7.90</td><td>20</td>



										<td width="1px;"></td>


							<td>8.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">21 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_315.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6200&action=compare"}'>
                                    <font class="fontbold">聖言中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Sing Yin Secondary School</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.14 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.90</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>8.5</td>

								<td>9.0</td><td>6.5</td><td>7.90</td><td>21</td>



										<td width="1px;"></td>


							<td>8.14</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">22 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_126.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6011&action=compare"}'>
                                    <font class="fontbold">華英中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Wa Ying College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.88</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.5</td><td>5.0</td><td>7.88</td><td>22</td>



										<td width="1px;"></td>


							<td>7.90</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">23 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_302.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6187&action=compare"}'>
                                    <font class="fontbold">聖羅撒書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Rose of Lima's College</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.81</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>10.0</td>

								    <td>6.0</td><td>8.5</td>

								<td>7.0</td><td>6.5</td><td>7.81</td><td>23</td>



										<td width="1px;"></td>


							<td>8.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">24 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_151.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6036&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖方濟各書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Francis' Canossian College</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.81</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>7.0</td><td>7.0</td><td>7.81</td><td>24</td>



										<td width="1px;"></td>


							<td>7.79</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">25 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_27.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5914&action=compare"}'>
                                    <font class="fontbold">庇理羅士女子中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Belilios Public School</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.80</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>5.0</td><td>5.0</td><td>7.80</td><td>25</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">26 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_154.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6039&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖心書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Sacred Heart Canossian College</font>
                                    <br><font class="fontsmall">南區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.7 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.51 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.7</td>

								    <td>8.0</td><td>8.5</td>

								<td>5.0</td><td>5.0</td><td>7.76</td><td>26</td>



										<td width="1px;"></td>


							<td>7.51</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">27 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_219.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6104&action=compare"}'>
                                    <font class="fontbold">民生書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Munsang College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>7.0</td><td>9.0</td><td>7.76</td><td>27</td>



										<td width="1px;"></td>


							<td>7.83</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">28 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_145.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6030&action=compare"}'>
                                    <font class="fontbold">迦密柏雨中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Carmel Pak U Secondary School</font>
                                    <br><font class="fontsmall">大埔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.71 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.75</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>10.0</td>

								<td>8.0</td><td>7.0</td><td>7.75</td><td>28</td>



										<td width="1px;"></td>


							<td>7.71</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">29 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_419.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6304&action=compare"}'>
                                    <font class="fontbold">英皇書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">King's College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.7 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.01 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.69</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.7</td>

								    <td>8.0</td><td>9.0</td>

								<td>7.0</td><td>6.0</td><td>7.69</td><td>29</td>



										<td width="1px;"></td>


							<td>8.01</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">30 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_303.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6188&action=compare"}'>
                                    <font class="fontbold">聖馬可中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Mark's School</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.66</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>9.0</td>

								    <td>7.0</td><td>9.0</td>

								<td>7.0</td><td>5.0</td><td>7.66</td><td>30</td>



										<td width="1px;"></td>


							<td>7.86</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">31 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_269.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6154&action=compare"}'>
                                    <font class="fontbold">筲箕灣官立中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shau Kei Wan Government Secondary School</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.62</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>7.0</td><td>9.0</td><td>7.62</td><td>31</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">32 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_110.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5995&action=compare"}'>
                                    <font class="fontbold">港島民生書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Munsang College (Hong Kong Island)</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.59</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>4.8</td>

								<td>10.0</td><td>6.5</td><td>7.59</td><td>32</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">33 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_178.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6063&action=compare"}'>
                                    <font class="fontbold">藍田聖保祿中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's School (Lam Tin)</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.50 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.57</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>6.5</td><td>5.0</td><td>7.57</td><td>33</td>



										<td width="1px;"></td>


							<td>7.50</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">34 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_361.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6246&action=compare"}'>
                                    <font class="fontbold">香港道教聯合會鄧顯紀念中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Hong Kong Taoist Association Tang Hin Memorial Secondary School</font>
                                    <br><font class="fontsmall">北區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.56</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>9.0</td>

								    <td>6.0</td><td>7.5</td>

								<td>8.0</td><td>5.0</td><td>7.56</td><td>34</td>



										<td width="1px;"></td>


							<td>7.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">35 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_116.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6001&action=compare"}'>
                                    <font class="fontbold">高主教書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Raimondi College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.55</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>9.0</td>

								<td>7.0</td><td>8.0</td><td>7.55</td><td>35</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">36 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_431.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6316&action=compare"}'>
                                    <font class="fontbold">真光女書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">True Light Girls' College</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.52</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>8.3</td>

								<td>6.0</td><td>7.0</td><td>7.52</td><td>36</td>



										<td width="1px;"></td>


							<td>8.04</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">37 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_413.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6298&action=compare"}'>
                                    <font class="fontbold">伊利沙伯中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Queen Elizabeth School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.50</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>4.8</td>

								<td>7.0</td><td>8.0</td><td>7.50</td><td>37</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">38 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_455.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6340&action=compare"}'>
                                    <font class="fontbold">中華基金中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">The Chinese Foundation Secondary School</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.47 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.50</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>8.3</td>

								<td>9.0</td><td>7.0</td><td>7.50</td><td>38</td>



										<td width="1px;"></td>


							<td>7.47</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">39 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_291.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6176&action=compare"}'>
                                    <font class="fontbold">聖公會莫壽增會督中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Bishop Mok Sau Tseng Secondary School</font>
                                    <br><font class="fontsmall">大埔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.11 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.48</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>8.3</td>

								<td>6.5</td><td>5.0</td><td>7.48</td><td>39</td>



										<td width="1px;"></td>


							<td>7.11</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">40 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_338.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6223&action=compare"}'>
                                    <font class="fontbold">天主教母佑會蕭明中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Daughters of Mary Help of Christians Siu Ming Catholic Secondary School</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.61 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.48</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.3</td>

								<td>8.0</td><td>6.5</td><td>7.48</td><td>40</td>



										<td width="1px;"></td>


							<td>7.61</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">41 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_120.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6005&action=compare"}'>
                                    <font class="fontbold">觀塘瑪利諾書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kwun Tong Maryknoll College</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.45</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>7.5</td>

								<td>6.5</td><td>8.0</td><td>7.45</td><td>41</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">42 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_87.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5974&action=compare"}'>
                                    <font class="fontbold">風采中學（教育評議會主辦）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Elegantia College (Sponsored by Education Convergence)</font>
                                    <br><font class="fontsmall">北區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.37</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>10.0</td><td>8.0</td><td>7.37</td><td>42</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">43 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_65.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5952&action=compare"}'>
                                    <font class="fontbold">東華三院黃笏南中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">TWGHs Wong Fut Nam College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.33 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.35</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>7.8</td>

								<td>6.5</td><td>4.0</td><td>7.35</td><td>43</td>



										<td width="1px;"></td>


							<td>7.33</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">44 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_21.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5908&action=compare"}'>
                                    <font class="fontbold">保祿六世書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pope Paul VI College</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.34</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>7.8</td>

								<td>5.0</td><td>8.0</td><td>7.34</td><td>44</td>



										<td width="1px;"></td>


							<td>7.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">45 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_163.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6048&action=compare"}'>
                                    <font class="fontbold">景嶺書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">King Ling College</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.33</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>7.5</td>

								<td>9.0</td><td>6.5</td><td>7.33</td><td>45</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">46 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_371.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6256&action=compare"}'>
                                    <font class="fontbold">香港華人基督教聯會真道書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">HKCCCU Logos Academy</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.33</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>4.8</td>

								<td>8.0</td><td>9.0</td><td>7.33</td><td>46</td>



										<td width="1px;"></td>


							<td>7.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">47 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_334.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6219&action=compare"}'>
                                    <font class="fontbold">天主教崇德英文書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shung Tak Catholic English College</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.29</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>8.5</td>

								<td>5.0</td><td>7.0</td><td>7.29</td><td>47</td>



										<td width="1px;"></td>


							<td>7.07</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">48 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_432.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6317&action=compare"}'>
                                    <font class="fontbold">中華傳道會安柱中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">CNEC Christian College</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.14 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.27</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>8.0</td>

								<td>5.0</td><td>8.0</td><td>7.27</td><td>48</td>



										<td width="1px;"></td>


							<td>7.14</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">49 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_301.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6186&action=compare"}'>
                                    <font class="fontbold">聖類斯中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Louis School</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.26</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.0</td><td>8.0</td><td>7.26</td><td>49</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">50 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_378.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6263&action=compare"}'>
                                    <font class="fontbold">香港培道中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pooi To Middle School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.47 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.25</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>6.5</td>

								    <td>8.0</td><td>7.8</td>

								<td>8.0</td><td>9.0</td><td>7.25</td><td>50</td>



										<td width="1px;"></td>


							<td>7.47</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">51 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_279.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6164&action=compare"}'>
                                    <font class="fontbold">聖芳濟書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Francis Xavier's College</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.24</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.0</td><td>4.0</td><td>7.24</td><td>51</td>



										<td width="1px;"></td>


							<td>7.26</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">52 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_298.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6183&action=compare"}'>
                                    <font class="fontbold">聖嘉勒女書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Clare's Girls' School</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.20</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>7.0</td>

								    <td>9.0</td><td>7.8</td>

								<td>5.0</td><td>8.0</td><td>7.20</td><td>52</td>



										<td width="1px;"></td>


							<td>7.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">53 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_18.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5905&action=compare"}'>
                                    <font class="fontbold">保良局顏寶鈴書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">PLK Ngan Po Ling College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.20</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>8.3</td>

								<td>6.5</td><td>6.5</td><td>7.20</td><td>53</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">54 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_140.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6025&action=compare"}'>
                                    <font class="fontbold">基督教宣道會宣基中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Christian & Missionary Alliance Sun Kei Secondary School</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.19</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>8.3</td>

								<td>5.0</td><td>6.5</td><td>7.19</td><td>54</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">55 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_7.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5894&action=compare"}'>
                                    <font class="fontbold">保良局第一張永慶中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk No.1 W.H. Cheung College</font>
                                    <br><font class="fontsmall">黃大仙 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.18</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>9.0</td>

								    <td>6.5</td><td>4.5</td>

								<td>6.0</td><td>5.0</td><td>7.18</td><td>55</td>



										<td width="1px;"></td>


							<td>7.00</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">56 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_324.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6209&action=compare"}'>
                                    <font class="fontbold">順德聯誼總會梁銶琚中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shun Tak Fraternal Association Leung Kau Kui College</font>
                                    <br><font class="fontsmall">屯門 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.14 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.18</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>6.5</td><td>5.5</td>

								<td>7.0</td><td>4.0</td><td>7.18</td><td>56</td>



										<td width="1px;"></td>


							<td>7.14</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">57 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_420.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6305&action=compare"}'>
                                    <font class="fontbold">優才（楊殷有娣）書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">G.T. (Ellen Yeung) College</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.15</td>

                                <td style="padding-top:15px;" class="fontxlarge">-8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-8</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>5.3</td>

								<td>7.0</td><td>6.5</td><td>7.15</td><td>57</td>



										<td width="1px;"></td>


							<td>6.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">58 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_429.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6314&action=compare"}'>
                                    <font class="fontbold">張祝珊英文中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Cheung Chuk Shan College</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.14</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>9.0</td>

								    <td>7.0</td><td>8.0</td>

								<td>5.0</td><td>5.0</td><td>7.14</td><td>58</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">59 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_276.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6161&action=compare"}'>
                                    <font class="fontbold">聖保羅書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's College</font>
                                    <br><font class="fontsmall">中西區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.13</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>8.0</td><td>6.0</td><td>7.13</td><td>59</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">60 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_8.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5895&action=compare"}'>
                                    <font class="fontbold">保良局董玉娣中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Tang Yuk Tien College</font>
                                    <br><font class="fontsmall">屯門 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>6.5</td><td>4.0</td><td>7.10</td><td>60</td>



										<td width="1px;"></td>


							<td>6.97</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">61 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_262.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6147&action=compare"}'>
                                    <font class="fontbold">沙田崇真中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shatin Tsung Tsin Secondary School</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>7.8</td>

								<td>5.0</td><td>6.0</td><td>7.10</td><td>61</td>



										<td width="1px;"></td>


							<td>6.97</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">62 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_274.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6159&action=compare"}'>
                                    <font class="fontbold">聖保祿中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's Secondary School</font>
                                    <br><font class="fontsmall">灣仔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.5</td>

								<td>6.5</td><td>5.0</td><td>7.10</td><td>62</td>



										<td width="1px;"></td>


							<td>7.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">63 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_106.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5991&action=compare"}'>
                                    <font class="fontbold">福建中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Fukien Secondary School</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">7</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>9.5</td>

								<td>6.5</td><td>7.0</td><td>7.10</td><td>63</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">64 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_5.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5892&action=compare"}'>
                                    <font class="fontbold">保良局百周年李兆忠紀念中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Centenary Li Shiu Chung Memorial College</font>
                                    <br><font class="fontsmall">屯門 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.07</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>9.0</td>

								    <td>5.0</td><td>8.3</td>

								<td>5.0</td><td>4.0</td><td>7.07</td><td>64</td>



										<td width="1px;"></td>


							<td>7.04</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">65 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_24.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5911&action=compare"}'>
                                    <font class="fontbold">寶血會上智英文書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Holy Trinity College</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.07</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>9.0</td><td>4.0</td><td>7.07</td><td>65</td>



										<td width="1px;"></td>


							<td>7.21</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">66 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_152.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6037&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖家書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Holy Family Canossian College</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.06</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>8.0</td><td>5.0</td><td>7.06</td><td>66</td>



										<td width="1px;"></td>


							<td>7.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">67 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_300.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6185&action=compare"}'>
                                    <font class="fontbold">聖傑靈女子中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Catharine's School For Girls</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.05</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>7.05</td><td>67</td>



										<td width="1px;"></td>


							<td>6.97</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">68 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_312.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6197&action=compare"}'>
                                    <font class="fontbold">聖士提反書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Stephen's College</font>
                                    <br><font class="fontsmall">南區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.05</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>6.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>5.0</td><td>10.0</td><td>7.05</td><td>68</td>



										<td width="1px;"></td>


							<td>7.07</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">69 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_66.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5953&action=compare"}'>
                                    <font class="fontbold">東華三院甲寅年總理中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">TWGHs Kap Yan Directors' College</font>
                                    <br><font class="fontsmall">北區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.04</td>

                                <td style="padding-top:15px;" class="fontxlarge">-7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-7</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.5</td>

								<td>5.0</td><td>5.0</td><td>7.04</td><td>69</td>



										<td width="1px;"></td>


							<td>6.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">70 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_155.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6040&action=compare"}'>
                                    <font class="fontbold">嘉諾撒書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Canossa College</font>
                                    <br><font class="fontsmall">東區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.04</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>6.5</td><td>4.0</td><td>7.04</td><td>70</td>



										<td width="1px;"></td>


							<td>7.04</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">71 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_347.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6232&action=compare"}'>
                                    <font class="fontbold">王肇枝中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Wong Shiu Chi Secondary School</font>
                                    <br><font class="fontsmall">大埔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.04</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>6.5</td><td>7.0</td><td>7.04</td><td>71</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">72 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_102.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5987&action=compare"}'>
                                    <font class="fontbold">佛教善德英文中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Buddhist Sin Tak College</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.03</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>6.5</td><td>7.0</td><td>7.03</td><td>72</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">73 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_149.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6034&action=compare"}'>
                                    <font class="fontbold">迦密主恩中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Carmel Divine Grace Foundation Secondary School</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.01</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>7.01</td><td>73</td>



										<td width="1px;"></td>


							<td>6.90</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">74 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_388.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6273&action=compare"}'>
                                    <font class="fontbold">香港真光書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Hong Kong True Light College</font>
                                    <br><font class="fontsmall">南區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.00</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>6.0</td>

								    <td>8.0</td><td>8.0</td>

								<td>8.0</td><td>7.0</td><td>7.00</td><td>74</td>



										<td width="1px;"></td>


							<td>7.00</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">75 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_304.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6189&action=compare"}'>
                                    <font class="fontbold">聖瑪加利男女英文中小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Margaret's Co-Educational English Secondary and Primary School</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.11 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.99</td>

                                <td style="padding-top:15px;" class="fontxlarge">4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">4</font>
                                </td>
								<td>6.5</td>

								    <td>9.0</td><td>7.8</td>

								<td>6.5</td><td>7.0</td><td>6.99</td><td>75</td>



										<td width="1px;"></td>


							<td>7.11</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">76 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_247.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6132&action=compare"}'>
                                    <font class="fontbold">荃灣官立中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tsuen Wan Government Secondary School</font>
                                    <br><font class="fontsmall">荃灣 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.98</td>

                                <td style="padding-top:15px;" class="fontxlarge">6</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">6</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.5</td>

								<td>7.0</td><td>5.0</td><td>6.98</td><td>76</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">77 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_205.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6090&action=compare"}'>
                                    <font class="fontbold">旅港開平商會中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Hoi Ping Chamber of Commerce Secondary School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.50 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.98</td>

                                <td style="padding-top:15px;" class="fontxlarge">9</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">9</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>9.5</td>

								<td>5.0</td><td>5.0</td><td>6.98</td><td>77</td>



										<td width="1px;"></td>


							<td>7.50</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">78 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_326.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6211&action=compare"}'>
                                    <font class="fontbold">順德聯誼總會翁祐中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shun Tak Fraternal Association Yung Yau College</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.98</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>6.5</td>

								    <td>6.5</td><td>9.5</td>

								<td>5.0</td><td>8.0</td><td>6.98</td><td>78</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">79 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_36.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5923&action=compare"}'>
                                    <font class="fontbold">長沙灣天主教英文中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Cheung Sha Wan Catholic Secondary School</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.97</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>6.5</td>

								    <td>9.0</td><td>9.5</td>

								<td>6.0</td><td>5.0</td><td>6.97</td><td>79</td>



										<td width="1px;"></td>


							<td>7.00</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">80 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_148.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6033&action=compare"}'>
                                    <font class="fontbold">迦密中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Carmel Secondary School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">3.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.96</td>

                                <td style="padding-top:15px;" class="fontxlarge">-4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-4</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>3.5</td>

								<td>9.0</td><td>6.0</td><td>6.96</td><td>80</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">81 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_6.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5893&action=compare"}'>
                                    <font class="fontbold">保良局蔡繼有學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Choi Kai Yau School</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.95</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>6.0</td>

								<td>5.0</td><td>9.0</td><td>6.95</td><td>81</td>



										<td width="1px;"></td>


							<td>6.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">82 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_296.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6181&action=compare"}'>
                                    <font class="fontbold">聖公會曾肇添中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Tsang Shiu Tim Secondary School</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.33 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.93</td>

                                <td style="padding-top:15px;" class="fontxlarge">7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">7</font>
                                </td>
								<td>9.0</td>

								    <td>5.0</td><td>8.3</td>

								<td>7.0</td><td>4.0</td><td>6.93</td><td>82</td>



										<td width="1px;"></td>


							<td>7.33</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">83 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_232.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6117&action=compare"}'>
                                    <font class="fontbold">南亞路德會沐恩中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">SALEM-Immanuel Lutheran College</font>
                                    <br><font class="fontsmall">大埔 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.93</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>8.0</td><td>6.0</td><td>6.93</td><td>83</td>



										<td width="1px;"></td>


							<td>6.83</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">84 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_405.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6290&action=compare"}'>
                                    <font class="fontbold">新界鄉議局元朗區中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">N.T. Heung Yee Kuk Yuen Long District Secondary School</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.92</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>9.0</td>

								<td>4.0</td><td>5.0</td><td>6.92</td><td>84</td>



										<td width="1px;"></td>


							<td>6.86</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">85 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_367.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6252&action=compare"}'>
                                    <font class="fontbold">香港管理專業協會李國寶中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">HKMA David Li Kwok Po College</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.92</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>6.5</td><td>9.0</td>

								<td>5.0</td><td>7.0</td><td>6.92</td><td>85</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">86 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_236.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6121&action=compare"}'>
                                    <font class="fontbold">培僑書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pui Kiu College</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.92</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>6.5</td>

								    <td>6.0</td><td>6.0</td>

								<td>8.0</td><td>9.0</td><td>6.92</td><td>86</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">87 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_265.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6150&action=compare"}'>
                                    <font class="fontbold">沙田蘇浙公學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kiangsu-Chekiang College (Shatin)</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.90</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>6.5</td><td>6.0</td><td>6.90</td><td>87</td>



										<td width="1px;"></td>


							<td>7.04</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">88 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_305.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6190&action=compare"}'>
                                    <font class="fontbold">聖母玫瑰書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Our Lady of The Rosary College</font>
                                    <br><font class="fontsmall">深水埗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.76 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.87</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>8.3</td>

								<td>7.0</td><td>4.0</td><td>6.87</td><td>88</td>



										<td width="1px;"></td>


							<td>6.76</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">89 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_256.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6141&action=compare"}'>
                                    <font class="fontbold">仁濟醫院王華湘中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Yan Chai Hospital Wong Wha San Secondary School</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.86</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>6.0</td>

								    <td>8.0</td><td>5.3</td>

								<td>10.0</td><td>6.5</td><td>6.86</td><td>89</td>



										<td width="1px;"></td>


							<td>6.83</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">90 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_415.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6300&action=compare"}'>
                                    <font class="fontbold">伊利沙伯中學舊生會中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Queen Elizabeth School Old Students' Association Secondary School</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.54 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.80</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>6.5</td>

								    <td>6.5</td><td>4.8</td>

								<td>8.0</td><td>7.0</td><td>6.80</td><td>90</td>



										<td width="1px;"></td>


							<td>6.54</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">91 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_123.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6008&action=compare"}'>
                                    <font class="fontbold">何明華會督銀禧中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Bishop Hall Jubilee School</font>
                                    <br><font class="fontsmall">九龍城 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.77</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>7.0</td><td>4.0</td><td>6.77</td><td>91</td>



										<td width="1px;"></td>


							<td>6.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">92 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_13.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=5900&action=compare"}'>
                                    <font class="fontbold">保良局李城璧中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Lee Shing Pik College</font>
                                    <br><font class="fontsmall">荃灣 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.61 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>6.5</td>

								    <td>5.0</td><td>8.3</td>

								<td>6.5</td><td>7.0</td><td>6.76</td><td>92</td>



										<td width="1px;"></td>


							<td>6.61</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">93 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_139.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6024&action=compare"}'>
                                    <font class="fontbold">基督教香港信義會元朗信義中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">The ELCHK Yuen Long Lutheran Secondary School</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.75</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>5.0</td><td>9.0</td>

								<td>5.0</td><td>6.0</td><td>6.75</td><td>93</td>



										<td width="1px;"></td>


							<td>6.57</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">94 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_323.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6208&action=compare"}'>
                                    <font class="fontbold">順德聯誼總會李兆基中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shun Tak Fraternal Association Lee Shau Kee College</font>
                                    <br><font class="fontsmall">葵青 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.74</td>

                                <td style="padding-top:15px;" class="fontxlarge">6</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">6</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.0</td>

								<td>5.0</td><td>5.0</td><td>6.74</td><td>94</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">95 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_191.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6076&action=compare"}'>
                                    <font class="fontbold">梁式芝書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Leung Shek Chee College</font>
                                    <br><font class="fontsmall">觀塘 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.74</td>

                                <td style="padding-top:15px;" class="fontxlarge">7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">7</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>6.5</td>

								<td>8.0</td><td>5.0</td><td>6.74</td><td>95</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">96 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_289.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6174&action=compare"}'>
                                    <font class="fontbold">聖公會林裘謀中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Lam Kau Mow Secondary School</font>
                                    <br><font class="fontsmall">沙田 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.76 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.72</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>8.3</td>

								<td>5.0</td><td>5.0</td><td>6.72</td><td>96</td>



										<td width="1px;"></td>


							<td>6.76</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">97 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_156.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6041&action=compare"}'>
                                    <font class="fontbold">將軍澳官立中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tseung Kwan O Government Secondary School</font>
                                    <br><font class="fontsmall">西貢 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.72</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>6.5</td>

								    <td>7.0</td><td>8.0</td>

								<td>5.0</td><td>7.0</td><td>6.72</td><td>97</td>



										<td width="1px;"></td>


							<td>6.64</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">98 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_137.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6022&action=compare"}'>
                                    <font class="fontbold">基督教香港信義會心誠中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Fanling Lutheran Secondary School</font>
                                    <br><font class="fontsmall">北區 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.72</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>6.5</td>

								    <td>6.5</td><td>7.8</td>

								<td>5.0</td><td>9.0</td><td>6.72</td><td>98</td>



										<td width="1px;"></td>


							<td>6.83</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">99 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_376.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6261&action=compare"}'>
                                    <font class="fontbold">香港九龍塘基督教中華宣道會陳瑞芝紀念中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Christian Alliance S. C. Chan Memorial College</font>
                                    <br><font class="fontsmall">屯門 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.54 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.71</td>

                                <td style="padding-top:15px;" class="fontxlarge">-4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-4</font>
                                </td>
								<td>7.0</td>

								    <td>5.0</td><td>7.8</td>

								<td>8.0</td><td>4.0</td><td>6.71</td><td>99</td>



										<td width="1px;"></td>


							<td>6.54</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">100 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT2/logo_280.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=6165&action=compare"}'>
                                    <font class="fontbold">聖公會白約翰會督中學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">SKH Bishop Baker Secondary School</font>
                                    <br><font class="fontsmall">元朗 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.71</td>

                                <td style="padding-top:15px;" class="fontxlarge">-9</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-9</font>
                                </td>
								<td>6.5</td>

								    <td>6.0</td><td>5.5</td>

								<td>8.0</td><td>5.0</td><td>6.71</td><td>100</td>



										<td width="1px;"></td>


							<td>6.29</td>
						</tr>

						</tbody>
					</table>


<br><br><br><br>


<br class="clear"/>














	<table width="940px">
	<tr><td colspan="2">&nbsp;</td></tr>
   	<tr><td valign="top" style="width:500px;">







 <style>#ypaAdWrapper-bookofschool_search iframe{width:100%}</style>
 <div id='ypaAdWrapper-bookofschool_search'></div>


	</td>
	<td align="right">
 	<div id="adfour"></div>
<script language='JavaScript' type='text/javascript'>randomstr = new String (Math.random());randomstr = randomstr.substring(1,8);document.write ("<" + "script language='JavaScript' type='text/javascript' src='" + "https://servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=179885885001" + "'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=179885885001' ><img src='https://servedby.adsfactor.net/adv.php?sid=179885885001' border='0'></a></noscript>

	</td>
	</tr></table>


</td>
<td colspan="2">&nbsp;</td>





</div></td></tr>

</table>





</div> <!--  End of contents-wrap -->









    <script language='JavaScript' type='text/javascript'>if (!window.af) var af = (function() {return {getcookie:function(n){var m=n+'=';var ca=document.cookie.split(';');for(var i=0;i < ca.length;i++) {var c=ca[i];while (c.charAt(0)==' ') c = c.substring(1,c.length);if (c.indexOf(m) == 0) return c.substring(m.length,c.length);}return null;},existcookie:function(n){var m=af.getcookie(n);if (m!=null&&m!=''){return true;}else{return false;}}};})(); if(af.existcookie('__AF')){afid = af.getcookie('__AF'); } else {afid = 0; } randomstr = new String (Math.random()); randomstr = randomstr.substring(2,8); document.write("<" + "script language='JavaScript' type='text/javascript' src='"); document.write(('https:' == document.location.protocol ? 'https://' : 'http://')+"servedby.adsfactor.net/adj.php?ts=" + randomstr + "&amp;sid=819847944468&amp;afid=" + afid);if (document.af_used){document.write("&amp;ex=" + document.af_used);} if(window.location.href){document.write("&amp;location=" + encodeURIComponent(escape(window.location.href)));} if(document.referrer){document.write("&amp;referer=" + encodeURIComponent(escape(document.referrer)));} document.write("'><" + "/script>");</script><noscript><a href='https://servedby.adsfactor.net/adc.php?sid=819847944468' ><img src='https://servedby.adsfactor.net/adv.php?sid=819847944468' border='0'></a></noscript>




<div id="adthree"></div>




<script type="text/javascript" src="https://ad.unimhk.com/floating320.php?id=mdcymdfmmdm3nzbi"></script>
<table style="margin: auto;"><tr><td>







<!-- Zone Tag : bookofschool Leaderboard -->





<!-- Javascript tag: -->
<!-- begin ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Super Banner - 728 x 90 -->
<script language="JavaScript">
var zflag_nid="1044"; var zflag_cid="1775/1773"; var zflag_sid="402"; var zflag_width="728"; var zflag_height=90; var zflag_sz=14;
</script>
<script language="JavaScript" src="https://tt3.zedo.com/jsc/tt3/fo.js"></script>
<!-- end ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Super Banner - 728 x 90 -->






</td></tr></table>



<div id="footer-wrap" class="footer-wrap">
<div id="footer" class="clearfix">

<div style="padding-top:15px;">
	<br>
	<p class="fontlarge d3-color-gray-1" style="text-align: center; ">Bookofschool 學校大全為香港最受歡迎的選校攻略及校評發表平台，提供最齊全學校排名、最新入學申請資訊、及升小升中派位概況。 </p>
	<div style="position:relative;float:left;width:55px">&nbsp;</div>
	<span style="position:relative;float:left"><img src="/school/img/bos_logo_small.png" style="width:50px;height:50px;padding-right:10px;position:relative;top:-20px"></span>
	<span style="position:relative;left:15px; ">
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text"><font class="d3-color-green-4">951 間幼兒園，517 間小學和 456 間中學</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">106127 <font class="d3-color-green-4">篇家長評級</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">8086 <font class="d3-color-green-4">位家長注册</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">52 <font class="d3-color-green-4">位注册導師</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">28282643 <font class="d3-color-green-4">觀看次數</font></span>
    </span>
</div>
<br class="clear"/>
<div style="position:relative;float:left;left:140px;top:-20px;">
	<div  style="position:relative;float:left" ><g:plusone size="medium"></g:plusone></div>
	<div  style="position:relative;float:left" class="fb-like" data-send="false" data-width="600" data-show-faces="true"></div>
</div>

<div style="clear: both;">&nbsp;</div>
<!-- site map -->
<div style="text-align:left;border-top: 1px dashed rgb(198,191,180)">
<div style="position:relative;float:left;width:20px">&nbsp;</div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b">學校大全</font>
<br><a class="afont2b" href="/school/controller/kindergartenConsole?categoryid=0">幼稚園</a>
<br><a class="afont2b" href="/school/controller/primarySchoolConsole?categoryid=1">小學</a>
<br><a class="afont2b" href="/school/controller/secondarySchoolConsole?categoryid=2">中學</a>
<br><a class="afont2b" href="/school/controller/ibConsole?categoryid=5">國際學校</a>
<br><br><br><font class="font4b">更多</font>
<br><a class="afont2b" href="mailto:bookofschool@gmail.com">聯絡我們
<img style="width:24px;height:24px;position:relative;top:9px;" src="/school/img/email.jpg" alt="bookofschool@gmail.com"/></a>
<br><a class="afont2b" href="#" rel="#basicinfo_overlay">免責聲明</a>
</div>

<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b">選校攻略</font>
<br><a class="afont2b" href="/school/controller/schoolAllocationReport?categoryid=0">全港升小派位概況</a>
<br><a class="afont2b" href="/school/controller/schoolAllocationReport?categoryid=1">全港升中派位概況</a>
<br><a class="afont2b" href="/school/controller/privateDssReport">全港直資私立小學入學申請</a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>
<div style="position:relative;float:left;padding:25px;width:90px;">
<br><font class="font4b">討論區</font>
<br><a class="afont2b" href="/school/controller/askQuestion?type=hot">發問問題</a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=hot">熱門話題</a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=0&maincategoryname=label.kindergarten&maincategoryuri=getForumContent">幼稚園</a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=1&maincategoryname=label.primary&maincategoryuri=getForumContent">小學</a>
<br><a class="afont2b" href="/school/controller/getForumContentList?type=q&categoryid=2&maincategoryname=label.secondary&maincategoryuri=getForumContent">中學</a>

</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b">你的檔案</font>
<br>
<a class="afont2b" href="#" title="Favorite" onclick='javascript:{


							window.location="/school/controller/myFavoriteConsole?action=favorite"

						}'>
    						我喜愛的學校</a>
							<br><a class="afont2b" href="#" title="Account Setup" onclick='javascript:{


							window.location="/school/controller/accountInfo"

						}'>
   						個人資料
   				</a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b">選校工具</font>
<br><a class="afont2b" href="/school/controller/searchForm?nocache=1495859132484"  style="text-decoration:none" >學校搜尋</a>
<br><a class="afont2b" href="/school/controller/reverseSearchForm"  style="text-decoration:none" >逆向搜尋</a>
<br><a class="afont2b" href="/school/controller/schoolCompare?nocache=1495859132484"  style="text-decoration:none" >學校比較</a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;">&nbsp;</div>
<div style="position:relative;float:left;padding:25px;width:280px;">
    <br><font class="font4b">手機版</font>
    <div style="padding-top:10px;">
            <a class="download" target="_blank" href="https://itunes.apple.com/us/app/bookofschool/id1236504022">
                <img src="/school/img/apple-download.png?1495100274">
            </a>
             <a class="download" href="#" onclick="alert('即將推出');">
                <img src="/school/img/google-download.png?1495100274">
             </a>

    </div>
<div style="position:relative;float:left;width:1px">&nbsp;</div>
</div>
</div>
<!-- site map -->

   	</div>
  <!-- footer end -->
</div>
<!-- footer-wrap end -->


<div style="clear: both;">&nbsp;</div>
<div class="basicinfo_overlay" id="basicinfo_overlay">
<p class="font4s">免責聲明<br>本網站學校大全將 盡 力 確 保 彼 等 所 提 供 資 料 之 準 確 性 及 可 靠 性 ， 惟 彼 等 並 不 擔 保 該 等 資 料 之 準 確 性 及 可 靠 性 ， 且 概 不 會 就 因 有 關 資 料 之 任 何 不 確 或 遺 漏 而 引 致 之 任 何 損 失 或 損 害 承 擔 任 何 責 任 ( 不 論 是 否 與 侵 權 行 為 、 訂 立 契 約 或 其 他 方 面 有 關 ) 。 </p>
</div>


<script src="https://js.kiwihk.net/bookofschool/v1/ypa_listing.js"  type="text/javascript"></script>







    <script type="text/javascript" src="/school/js/yahoo.js"></script>



</body>

</html>







<!-- overlayed element -->
<div class="simple_overlay" id="schoolallocation_overlay" style="width:400px;">
  <!-- the external content is loaded inside this tag -->
  <div class="contentWrap" ></div>
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