<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>























<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<link rel="shortcut icon" href="/school/img/favicon.ico" />

 <!-- name -->
 <!-- name -->









<title>小學排名  學校大全</title>


 <META http-equiv='Content-Type' content='text/html;charset=utf-8'>
 <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
 <META HTTP-EQUIV="Expires" CONTENT="-1">
 <meta property="og:image" content="http://www.bookofschool.com/school/img/logo_bos_fb.jpg" />





  	<meta name="description" content="小學排名 "/>
    <meta name="keywords" content="小學排名"/>
	<meta name="robots" content="小學排名"/>
  	<meta name="googlebot" content="小學排名"/>









  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bos.min.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/nav.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/search.css'>
	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/datatable.css'>
    <LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/bubble.css'>
  	<LINK REL='stylesheet' TYPE='text/css' HREF='/school/stylesheet/kiwi.css'>


<!-- <script src='https://s.yimg.com/uv/dm/scripts/syndication.js'></script> -->
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

<div id="backupads"></div>


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
		 //document.getElementById("favoritecount").innerHTML = '我喜愛的學校 ()';
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


                			<div id="HeadShotBox" class="SignedOut"></div>



                <div id="ShellMeBar" class="SignedIn">
                    <div id="GamerStatArea" class="GamerStatArea">


							 <h1 class="gamertag" id="gamertag" name="MeBarGamerTag"><a href="/school/controller/loginForm?loginType=signup&isnew=true">成為會員</a></h1>



                    </div>
                    <div class="LinkArea" style="">



						<a href="#" style="padding-left:3px;" title="Account Setup" onclick="alert('您必須登入到BookofSchool帳戶,然後就可以使用這功能！')" >帳戶</a>
                        <span class="spread"><a href="#" onclick="javascript:{ window.location='/school/controller/loginForm?loginType=signup' }">
	    						建立帳號</a></span>
                        <span class="spread">
                            <a href="#" onclick="javascript:{ window.location='/school/controller/loginForm?loginType=login' }">
	    					登入</a>
                        </span>




                        <span class="spread">



								<a href="?lang=en&reporttype=primaryranking&schoolcategory=1" >ENGLISH</a>


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
        					<li><a href="/school/controller/getHitSchoolReport?schoolyear=2018">全港最受歡迎小學<img style="padding-left:5px;" src="../img/newtrip.png"/></a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=kindergartenranking&schoolcategory=0">全港幼稚園排名</a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=primaryranking&schoolcategory=1">全港小學排名</a></li>
        					<li><a href="/school/controller/schoolSearch?reporttype=secondaryranking&schoolcategory=2">全港中學排名</a></li>
        					<!--
        					<li><a href="/school/controller/privateDssReport">全港直資私立小學入學申請</a></li>
        				    -->
        				</ul>
        		</li>
			    <li>
        				<a href="#">選校工具<img style="padding-left:10px;" src="/school/img/dropDownArrow.png"></a>
        				<ul>
        					<li><a href="/school/controller/eventFullCalendar?view=list&year=2019&sortby=full#todayanchor">選校行事曆</a></li>
                			<li><a href="/school/controller/schoolAllocationReport?categoryid=0&schoolplacementyear=2018">全港升小派位概況</a></li>
                        	<li><a href="/school/controller/schoolAllocationReport?categoryid=1&schoolplacementyear=2018">全港升中派位概況</a></li>
                            <li><a href="/school/controller/searchForm?nocache=1559197807555" style="text-decoration:none">學校搜尋</a></li>
							<li><a href="/school/controller/reverseSearchForm?nocache=1559197807555"  style="text-decoration:none" >逆向搜尋</a></li>
							<li><a href="/school/controller/schoolCompare?nocache=1559197807555" style="text-decoration:none" >學校比較</a></li>
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
<input type="hidden" name="categoryid" id="categoryid" value="1" />
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
<!-- begin ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Medium Rectangle - 300 x 250 -->
<script language="JavaScript">
var zflag_nid="1044"; var zflag_cid="1775/1773"; var zflag_sid=402; var zflag_width=300; var zflag_height=250; var zflag_sz=9;
</script>
<script language="JavaScript" src="https://tt3.zedo.com/jsc/tt3/fo.js"></script>
<!-- end ZEDO for channel:  Bookofschool.com_ROS , publisher: Bookofschool , Ad Dimension: Medium Rectangle - 300 x 250 -->





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
<input type="hidden" name="categoryid" id="categoryid" value="1" />
<input type="hidden" name="financetype" id="financetype" value="-1" />
<input type="hidden" name="poaschoolnet" id="poaschoolnet" value="-1" />
<input type="hidden" name="schoolcategory" id="schoolcategory" value="1" />
<input type="hidden" name="nominated" id="nominated" value="-1" />
<input type="hidden" name=feeder id="feeder" value="-1" />
<input type="hidden" name="throughtrain" id="throughtrain" value="-1" />
<input type="hidden" name="reporttype" id="reporttype" value="primaryranking" />
<input type="hidden" name="lastyearrecord" id="lastyearrecord" value="-1" />


</form>


					<h1>全港小學排名(TOP 100)</h1>

					<br>
					<font class="fontxlarge fontbold d3-color-orange">我們在這次更新中, 增加升跌資料，希望將更準確的資料與大家分享。部分學校的排名可能有變，敬請留意。</font><br>
					<font class="fontlarge fontbold d3-color-orange">最後更新在 16-二月-19</font></p>
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

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3932&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">1 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_528.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3932&action=compare"}'>
                                    <font class="fontbold">拔萃女小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Diocesan Girls' Junior School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.54</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>10.0</td>

								    <td>10.0</td><td>10.0</td>

								<td>8.0</td><td>9.0</td><td>9.54</td><td>1</td>



										<td width="1px;"></td>


							<td>9.57</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3494&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">2 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_78.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3494&action=compare"}'>
                                    <font class="fontbold">拔萃男書院附屬小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Diocesan Boys' School Primary Division</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.36 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.36</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>10.0</td><td>9.5</td>

								<td>9.0</td><td>10.0</td><td>9.36</td><td>2</td>



										<td width="1px;"></td>


							<td>9.36</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3656&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">3 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_246.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3656&action=compare"}'>
                                    <font class="fontbold">聖保羅男女中學附屬小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's Co-educational College Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.25</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>10.0</td>

								    <td>9.0</td><td>10.0</td>

								<td>7.0</td><td>9.0</td><td>9.25</td><td>3</td>



										<td width="1px;"></td>


							<td>9.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3503&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">4 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_87.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3503&action=compare"}'>
                                    <font class="fontbold">喇沙小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">La Salle Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 41校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">9.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">9.24</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>9.0</td>

								    <td>10.0</td><td>8.3</td>

								<td>10.0</td><td>9.0</td><td>9.24</td><td>4</td>



										<td width="1px;"></td>


							<td>9.19</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3850&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">5 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_443.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3850&action=compare"}'>
                                    <font class="fontbold">德望小學暨幼稚園</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Good Hope Primary School cum Kindergarten</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.80</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>10.0</td><td>9.5</td>

								<td>8.0</td><td>10.0</td><td>8.80</td><td>5</td>



										<td width="1px;"></td>


							<td>8.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3528&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">6 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_114.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3528&action=compare"}'>
                                    <font class="fontbold">九龍塘學校（小學部）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kowloon Tong School (Primary Section)</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.55</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>5.0</td><td>8.0</td><td>8.55</td><td>6</td>



										<td width="1px;"></td>


							<td>8.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3832&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">7 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_425.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3832&action=compare"}'>
                                    <font class="fontbold">聖保祿學校（小學部）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's Convent School (Primary Section)</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.53</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>10.0</td>

								    <td>9.0</td><td>8.3</td>

								<td>7.0</td><td>8.0</td><td>8.53</td><td>7</td>



										<td width="1px;"></td>


							<td>8.90</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3933&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">8 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_529.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3933&action=compare"}'>
                                    <font class="fontbold">保良局陳守仁小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">P.L.K. Camões Tan Siu Lin Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.49</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>10.0</td>

								    <td>8.0</td><td>9.5</td>

								<td>5.0</td><td>7.5</td><td>8.49</td><td>8</td>



										<td width="1px;"></td>


							<td>8.57</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3686&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">9 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_276.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3686&action=compare"}'>
                                    <font class="fontbold">英華小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ying Wa Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.47</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>10.0</td><td>10.0</td>

								<td>7.0</td><td>9.0</td><td>8.47</td><td>9</td>



										<td width="1px;"></td>


							<td>8.57</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3923&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">10 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_518.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3923&action=compare"}'>
                                    <font class="fontbold">油蔴地天主教小學（海泓道）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Yaumati Catholic Primary School (Hoi Wang Road)</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 31校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.32</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.0</td><td>8.0</td><td>8.32</td><td>10</td>



										<td width="1px;"></td>


							<td>8.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3505&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">11 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_89.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3505&action=compare"}'>
                                    <font class="fontbold">九龍塘宣道小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Alliance Primary School, Kowloon Tong</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.26</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>9.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>7.0</td><td>7.0</td><td>8.26</td><td>11</td>



										<td width="1px;"></td>


							<td>8.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3504&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">12 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_88.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3504&action=compare"}'>
                                    <font class="fontbold">瑪利諾修院學校（小學部）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Maryknoll Convent School (Primary Section)</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 41校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.24</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>8.0</td>

								<td>8.0</td><td>10.0</td><td>8.24</td><td>12</td>



										<td width="1px;"></td>


							<td>8.43</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3514&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">13 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_99.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3514&action=compare"}'>
                                    <font class="fontbold">協恩中學附屬小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Heep Yunn Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 34校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.54 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.23</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>10.0</td><td>7.8</td>

								<td>6.0</td><td>8.0</td><td>8.23</td><td>13</td>



										<td width="1px;"></td>


							<td>7.54</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3550&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">14 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_136.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3550&action=compare"}'>
                                    <font class="fontbold">聖公會德田李兆強小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Tak Tin Lee Shiu Keung Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.47 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.11</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>8.3</td>

								<td>7.0</td><td>9.0</td><td>8.11</td><td>14</td>



										<td width="1px;"></td>


							<td>8.47</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3913&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">15 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_507.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3913&action=compare"}'>
                                    <font class="fontbold">循道學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Methodist School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 31校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.50 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">8.01</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>9.0</td>

								    <td>7.0</td><td>8.5</td>

								<td>9.0</td><td>8.0</td><td>8.01</td><td>15</td>



										<td width="1px;"></td>


							<td>8.50</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3814&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">16 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_407.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3814&action=compare"}'>
                                    <font class="fontbold">瑪利曼小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Marymount Primary School</font>
                                    <br><font class="fontsmall">灣仔 12校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.97</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>6.5</td><td>9.0</td><td>7.97</td><td>16</td>



										<td width="1px;"></td>


							<td>8.00</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3568&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">17 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_154.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3568&action=compare"}'>
                                    <font class="fontbold">聖公會仁立紀念小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Yan Laap Memorial Primary School</font>
                                    <br><font class="fontsmall">荔景/葵涌/大窩口 65校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.95</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>10.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.0</td><td>8.0</td><td>7.95</td><td>17</td>



										<td width="1px;"></td>


							<td>8.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3915&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">18 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_510.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3915&action=compare"}'>
                                    <font class="fontbold">大角嘴天主教小學（海帆道）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tai Kok Tsui Catholic Primary School (Hoi Fan Road)</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 32校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.94</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>9.0</td>

								<td>8.0</td><td>8.0</td><td>7.94</td><td>18</td>



										<td width="1px;"></td>


							<td>7.57</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3442&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">19 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_25.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3442&action=compare"}'>
                                    <font class="fontbold">中華基督教會基灣小學（愛蝶灣）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Kei Wan Primary School (Aldrich Bay)</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 16校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.93</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>9.0</td>

								    <td>6.5</td><td>8.5</td>

								<td>6.5</td><td>6.0</td><td>7.93</td><td>19</td>



										<td width="1px;"></td>


							<td>7.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3426&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">20 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_9.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3426&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖心學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Sacred Heart Canossian School</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.91</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>8.0</td>

								<td>10.0</td><td>4.0</td><td>7.91</td><td>20</td>



										<td width="1px;"></td>


							<td>7.86</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3428&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">21 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_11.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3428&action=compare"}'>
                                    <font class="fontbold">聖士提反女子中學附屬小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Stephen's Girls' Primary School</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.87</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>9.0</td><td>4.0</td><td>7.87</td><td>21</td>



										<td width="1px;"></td>


							<td>7.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3827&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">22 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_420.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3827&action=compare"}'>
                                    <font class="fontbold">香港真光中學（小學部）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">The True Light Middle School of Hong Kong (Primary Section)</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.86</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>6.0</td><td>10.0</td><td>7.86</td><td>22</td>



										<td width="1px;"></td>


							<td>7.83</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3666&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">23 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_256.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3666&action=compare"}'>
                                    <font class="fontbold">聖方濟各英文小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Francis of Assisi's English Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>8.0</td>

								<td>6.5</td><td>4.0</td><td>7.76</td><td>23</td>



										<td width="1px;"></td>


							<td>7.64</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3492&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">24 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_76.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3492&action=compare"}'>
                                    <font class="fontbold">聖羅撒學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Rose of Lima's School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 34校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.73</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>10.0</td>

								    <td>8.0</td><td>8.0</td>

								<td>6.5</td><td>5.0</td><td>7.73</td><td>24</td>



										<td width="1px;"></td>


							<td>8.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3693&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">25 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_283.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3693&action=compare"}'>
                                    <font class="fontbold">崇真小學暨幼稚園</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tsung Tsin Primary School And Kindergarten</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.72</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>8.0</td>

								<td>7.0</td><td>8.0</td><td>7.72</td><td>25</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3918&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">26 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_513.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3918&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖瑪利學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Mary's Canossian School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 31校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.69</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>8.5</td>

								<td>7.0</td><td>7.0</td><td>7.69</td><td>26</td>



										<td width="1px;"></td>


							<td>7.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3680&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">27 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_270.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3680&action=compare"}'>
                                    <font class="fontbold">荔枝角天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Laichikok Catholic Primary School</font>
                                    <br><font class="fontsmall">深水埗 40校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.14 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.69</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>7.0</td><td>6.5</td><td>7.69</td><td>27</td>



										<td width="1px;"></td>


							<td>8.14</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3775&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">28 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_368.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3775&action=compare"}'>
                                    <font class="fontbold">大埔舊墟公立學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tai Po Old Market Public School</font>
                                    <br><font class="fontsmall">大埔 84校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.68</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>4.8</td>

								<td>8.0</td><td>7.0</td><td>7.68</td><td>28</td>



										<td width="1px;"></td>


							<td>7.83</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3735&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">29 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_325.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3735&action=compare"}'>
                                    <font class="fontbold">浸信會沙田圍呂明才小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Baptist (STW) Lui Ming Choi Primary School</font>
                                    <br><font class="fontsmall">沙田 91校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.63</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>9.5</td>

								<td>6.5</td><td>7.0</td><td>7.63</td><td>29</td>



										<td width="1px;"></td>


							<td>7.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3660&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">30 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_250.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3660&action=compare"}'>
                                    <font class="fontbold">聖公會田灣始南小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Tin Wan Chi Nam Primary School</font>
                                    <br><font class="fontsmall">薄扶林/香港仔/黃竹坑/赤柱 18校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.63</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>7.0</td><td>6.0</td><td>7.63</td><td>30</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3449&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">31 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_33.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3449&action=compare"}'>
                                    <font class="fontbold">香港嘉諾撒學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Canossa School (Hong Kong)</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 14校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.60</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>8.0</td><td>7.0</td><td>7.60</td><td>31</td>



										<td width="1px;"></td>


							<td>7.83</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3640&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">32 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_229.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3640&action=compare"}'>
                                    <font class="fontbold">將軍澳天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tseung Kwan O Catholic Primary School</font>
                                    <br><font class="fontsmall">西貢/將軍澳 95校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.53</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>8.0</td>

								<td>6.5</td><td>6.5</td><td>7.53</td><td>32</td>



										<td width="1px;"></td>


							<td>7.57</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3587&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">33 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_173.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3587&action=compare"}'>
                                    <font class="fontbold">聖公會仁立小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Yan Laap Primary School</font>
                                    <br><font class="fontsmall">荔景/葵涌/大窩口 65校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.51</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>10.0</td>

								    <td>8.0</td><td>8.5</td>

								<td>5.0</td><td>5.0</td><td>7.51</td><td>33</td>



										<td width="1px;"></td>


							<td>8.07</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3831&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">34 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_424.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3831&action=compare"}'>
                                    <font class="fontbold">聖若瑟小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Joseph's Primary School</font>
                                    <br><font class="fontsmall">灣仔 12校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.45</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>8.0</td>

								    <td>10.0</td><td>7.5</td>

								<td>7.0</td><td>5.0</td><td>7.45</td><td>34</td>



										<td width="1px;"></td>


							<td>7.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3446&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">35 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_29.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3446&action=compare"}'>
                                    <font class="fontbold">北角循道學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Chinese Methodist School (North Point)</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 14校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.45</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.3</td>

								<td>8.0</td><td>5.0</td><td>7.45</td><td>35</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3497&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">36 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_81.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3497&action=compare"}'>
                                    <font class="fontbold">黃埔宣道小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Alliance Primary School, Whampoa</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 35校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.45</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>8.0</td>

								<td>6.5</td><td>6.5</td><td>7.45</td><td>36</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3859&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">37 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_452.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3859&action=compare"}'>
                                    <font class="fontbold">保良局錦泰小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Grandmont Primary School</font>
                                    <br><font class="fontsmall">黃大仙 45校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.44</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>6.0</td><td>8.0</td><td>7.44</td><td>37</td>



										<td width="1px;"></td>


							<td>7.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3483&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">38 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_67.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3483&action=compare"}'>
                                    <font class="fontbold">聖公會偉倫小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Wei Lun Primary School</font>
                                    <br><font class="fontsmall">離島/東涌 99校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.40</td>

                                <td style="padding-top:15px;" class="fontxlarge">7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">7</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>8.5</td>

								<td>6.5</td><td>10.0</td><td>7.40</td><td>38</td>



										<td width="1px;"></td>


							<td>8.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3777&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">39 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_370.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3777&action=compare"}'>
                                    <font class="fontbold">香港教育大學賽馬會小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">The Education University of Hong Kong Jockey Club Primary School</font>
                                    <br><font class="fontsmall">大埔 84校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.50 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.36</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>7.5</td>

								<td>10.0</td><td>7.0</td><td>7.36</td><td>39</td>



										<td width="1px;"></td>


							<td>7.50</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3824&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">40 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_417.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3824&action=compare"}'>
                                    <font class="fontbold">聖公會聖雅各小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. St. James' Primary School</font>
                                    <br><font class="fontsmall">灣仔 12校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.33 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.35</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>5.3</td>

								<td>6.0</td><td>9.0</td><td>7.35</td><td>40</td>



										<td width="1px;"></td>


							<td>7.33</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3574&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">41 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_160.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3574&action=compare"}'>
                                    <font class="fontbold">聖公會青衣主恩小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Tsing Yi Chu Yan Primary School</font>
                                    <br><font class="fontsmall">青衣 66校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.35</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>7.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>6.0</td><td>7.0</td><td>7.35</td><td>41</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3792&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">42 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_385.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3792&action=compare"}'>
                                    <font class="fontbold">香港浸信會聯會小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Hong Kong Baptist Convention Primary School</font>
                                    <br><font class="fontsmall">荃灣 62校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.34</td>

                                <td style="padding-top:15px;" class="fontxlarge">9</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">9</font>
                                </td>
								<td>9.0</td>

								    <td>9.0</td><td>8.5</td>

								<td>7.0</td><td>5.0</td><td>7.34</td><td>42</td>



										<td width="1px;"></td>


							<td>8.07</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3472&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">43 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_56.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3472&action=compare"}'>
                                    <font class="fontbold">青松侯寶垣小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ching Chung Hau Po Woon Primary School</font>
                                    <br><font class="fontsmall">離島/東涌 98校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.34</td>

                                <td style="padding-top:15px;" class="fontxlarge">11</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">11</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>9.5</td>

								<td>7.0</td><td>8.0</td><td>7.34</td><td>43</td>



										<td width="1px;"></td>


							<td>8.07</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3863&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">44 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_457.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3863&action=compare"}'>
                                    <font class="fontbold">華德學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Bishop Walsh Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 41校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.32</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>7.32</td><td>44</td>



										<td width="1px;"></td>


							<td>6.90</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3645&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">45 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_234.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3645&action=compare"}'>
                                    <font class="fontbold">將軍澳循道衛理小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tseung Kwan O Methodist Primary School</font>
                                    <br><font class="fontsmall">西貢/將軍澳 95校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.32</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>7.0</td>

								    <td>5.0</td><td>9.0</td>

								<td>8.0</td><td>9.0</td><td>7.32</td><td>45</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3539&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">46 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_125.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3539&action=compare"}'>
                                    <font class="fontbold">藍田循道衛理小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Lam Tin Methodist Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.31</td>

                                <td style="padding-top:15px;" class="fontxlarge">-12</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-12</font>
                                </td>
								<td>5.0</td>

								    <td>6.0</td><td>7.8</td>

								<td>8.0</td><td>7.0</td><td>7.31</td><td>46</td>



										<td width="1px;"></td>


							<td>6.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3639&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">47 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_228.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3639&action=compare"}'>
                                    <font class="fontbold">優才（楊殷有娣）書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">G.T. (Ellen Yeung) College</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.71 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.31</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>8.0</td>

								<td>10.0</td><td>7.0</td><td>7.31</td><td>47</td>



										<td width="1px;"></td>


							<td>7.71</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3427&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">48 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_10.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3427&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖心學校私立部</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Sacred Heart Canossian School, Private Section</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.29</td>

                                <td style="padding-top:15px;" class="fontxlarge">8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">8</font>
                                </td>
								<td>8.0</td>

								    <td>9.0</td><td>8.3</td>

								<td>7.0</td><td>7.0</td><td>7.29</td><td>48</td>



										<td width="1px;"></td>


							<td>7.90</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3519&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">49 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_104.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3519&action=compare"}'>
                                    <font class="fontbold">民生書院小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Munsang College Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.28</td>

                                <td style="padding-top:15px;" class="fontxlarge">4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">4</font>
                                </td>
								<td>7.0</td>

								    <td>9.0</td><td>9.0</td>

								<td>5.0</td><td>9.0</td><td>7.28</td><td>49</td>



										<td width="1px;"></td>


							<td>7.57</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3922&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">50 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_517.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3922&action=compare"}'>
                                    <font class="fontbold">油蔴地天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Yaumati Catholic Primary School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 31校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.25</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>9.0</td>

								    <td>7.0</td><td>8.0</td>

								<td>4.0</td><td>5.0</td><td>7.25</td><td>50</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3697&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">51 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_287.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3697&action=compare"}'>
                                    <font class="fontbold">中華基督教會協和小學（長沙灣）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Heep Woh Primary School (Cheung Sha Wan)</font>
                                    <br><font class="fontsmall">深水埗 40校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.25</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.5</td>

								<td>5.0</td><td>6.5</td><td>7.25</td><td>51</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3495&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">52 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_79.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3495&action=compare"}'>
                                    <font class="fontbold">香港培正小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pui Ching Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.04 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.25</td>

                                <td style="padding-top:15px;" class="fontxlarge">-8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-8</font>
                                </td>
								<td>7.0</td>

								    <td>9.0</td><td>8.3</td>

								<td>4.0</td><td>7.0</td><td>7.25</td><td>52</td>



										<td width="1px;"></td>


							<td>7.04</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3726&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">53 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_316.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3726&action=compare"}'>
                                    <font class="fontbold">聖公會馬鞍山主風小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Ma On Shan Holy Spirit Primary School</font>
                                    <br><font class="fontsmall">沙田 89校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.24</td>

                                <td style="padding-top:15px;" class="fontxlarge">8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">8</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>8.5</td>

								<td>7.0</td><td>8.0</td><td>7.24</td><td>53</td>



										<td width="1px;"></td>


							<td>7.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3797&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">54 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_390.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3797&action=compare"}'>
                                    <font class="fontbold">中華基督教會基慧小學（馬灣）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Kei Wai Primary School (Ma Wan)</font>
                                    <br><font class="fontsmall">荃灣 62校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.23</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>6.0</td><td>6.5</td><td>7.23</td><td>54</td>



										<td width="1px;"></td>


							<td>7.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3454&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">55 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_38.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3454&action=compare"}'>
                                    <font class="fontbold">滬江小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shanghai Alumni Primary School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 14校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.21</td>

                                <td style="padding-top:15px;" class="fontxlarge">-8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-8</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>6.5</td>

								<td>5.0</td><td>5.0</td><td>7.21</td><td>55</td>



										<td width="1px;"></td>


							<td>6.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3424&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">56 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_7.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3424&action=compare"}'>
                                    <font class="fontbold">中西區聖安多尼學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Central & Western District St. Anthony's School</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.21</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>8.0</td><td>5.0</td><td>7.21</td><td>56</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3662&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">57 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_252.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3662&action=compare"}'>
                                    <font class="fontbold">聖士提反書院附屬小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Stephen's College Preparatory School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.21</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>5.0</td>

								    <td>8.0</td><td>8.3</td>

								<td>9.0</td><td>10.0</td><td>7.21</td><td>57</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3854&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">58 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_447.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3854&action=compare"}'>
                                    <font class="fontbold">保良局何壽南小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">P.L.K. Stanley Ho Sau Nan Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 34校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.50 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.20</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.5</td>

								<td>8.0</td><td>6.5</td><td>7.20</td><td>58</td>



										<td width="1px;"></td>


							<td>7.50</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3448&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">59 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_32.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3448&action=compare"}'>
                                    <font class="fontbold">勵志會梁李秀娛紀念小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">The Endeavourers Leung Lee Sau Yu Memorial Primary School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 16校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.43 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.20</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>6.5</td>

								    <td>6.5</td><td>9.0</td>

								<td>9.0</td><td>8.0</td><td>7.20</td><td>59</td>



										<td width="1px;"></td>


							<td>7.43</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3898&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">60 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_492.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3898&action=compare"}'>
                                    <font class="fontbold">和富慈善基金李宗德小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">W F Joseph Lee Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.19</td>

                                <td style="padding-top:15px;" class="fontxlarge">6</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">6</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.5</td>

								<td>8.0</td><td>7.0</td><td>7.19</td><td>60</td>



										<td width="1px;"></td>


							<td>7.79</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3689&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">61 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_279.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3689&action=compare"}'>
                                    <font class="fontbold">九龍禮賢學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kowloon Rhenish School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.54 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.18</td>

                                <td style="padding-top:15px;" class="fontxlarge">-15</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-15</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>5.3</td>

								<td>5.0</td><td>5.0</td><td>7.18</td><td>61</td>



										<td width="1px;"></td>


							<td>6.54</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3549&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">62 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_135.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3549&action=compare"}'>
                                    <font class="fontbold">聖公會李兆強小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Lee Shiu Keung Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.26 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.16</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>5.0</td><td>7.0</td><td>7.16</td><td>62</td>



										<td width="1px;"></td>


							<td>7.26</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3457&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">63 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_41.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3457&action=compare"}'>
                                    <font class="fontbold">中華基督教會基灣小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Kei Wan Primary School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 16校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.11 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.10</td>

                                <td style="padding-top:15px;" class="fontxlarge">5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">5</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>8.3</td>

								<td>6.0</td><td>5.0</td><td>7.10</td><td>63</td>



										<td width="1px;"></td>


							<td>7.11</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3422&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">64 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_5.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3422&action=compare"}'>
                                    <font class="fontbold">英皇書院同學會小學第二校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">King's College Old Boys' Association Primary School No. 2</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.09</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>7.0</td>

								    <td>6.0</td><td>7.5</td>

								<td>7.0</td><td>5.0</td><td>7.09</td><td>64</td>



										<td width="1px;"></td>


							<td>6.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3455&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">65 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_39.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3455&action=compare"}'>
                                    <font class="fontbold">太古小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Taikoo Primary School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 14校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.09</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>4.8</td>

								<td>6.0</td><td>8.0</td><td>7.09</td><td>65</td>



										<td width="1px;"></td>


							<td>6.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3544&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">66 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_130.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3544&action=compare"}'>
                                    <font class="fontbold">中華基督教會基法小學（油塘）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Kei Faat Primary School (Yau Tong)</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.08</td>

                                <td style="padding-top:15px;" class="fontxlarge">-8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-8</font>
                                </td>
								<td>6.0</td>

								    <td>6.0</td><td>5.0</td>

								<td>8.0</td><td>7.0</td><td>7.08</td><td>66</td>



										<td width="1px;"></td>


							<td>6.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3498&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">67 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_82.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3498&action=compare"}'>
                                    <font class="fontbold">聖公會奉基千禧小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Fung Kei Millennium Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 35校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.07</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>4.8</td>

								<td>5.0</td><td>5.0</td><td>7.07</td><td>67</td>



										<td width="1px;"></td>


							<td>6.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3521&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">68 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_106.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3521&action=compare"}'>
                                    <font class="fontbold">天神嘉諾撒學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Holy Angels Canossian School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 35校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.06</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>7.06</td><td>68</td>



										<td width="1px;"></td>


							<td>6.90</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3420&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">69 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_2.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3420&action=compare"}'>
                                    <font class="fontbold">聖保羅書院小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Paul's College Primary School</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.06</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>5.0</td>

								    <td>9.0</td><td>8.0</td>

								<td>10.0</td><td>6.0</td><td>7.06</td><td>69</td>



										<td width="1px;"></td>


							<td>6.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3803&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">70 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_396.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3803&action=compare"}'>
                                    <font class="fontbold">天主教石鐘山紀念小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shak Chung Shan Memorial Catholic Primary School</font>
                                    <br><font class="fontsmall">荃灣 62校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.61 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.05</td>

                                <td style="padding-top:15px;" class="fontxlarge">6</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">6</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>8.3</td>

								<td>9.0</td><td>5.0</td><td>7.05</td><td>70</td>



										<td width="1px;"></td>


							<td>7.61</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3517&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">71 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_102.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3517&action=compare"}'>
                                    <font class="fontbold">馬頭涌官立小學（紅磡灣）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ma Tau Chung Government Primary School (Hung Hom Bay)</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 35校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.54 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.04</td>

                                <td style="padding-top:15px;" class="fontxlarge">-4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-4</font>
                                </td>
								<td>5.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>8.0</td><td>7.0</td><td>7.04</td><td>71</td>



										<td width="1px;"></td>


							<td>6.54</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3737&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">72 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_327.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3737&action=compare"}'>
                                    <font class="fontbold">培僑書院</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pui Kiu College</font>
                                    <br><font class="fontsmall"> &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">10.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.36 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.04</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>5.0</td>

								    <td>8.0</td><td>9.5</td>

								<td>9.0</td><td>10.0</td><td>7.04</td><td>72</td>



										<td width="1px;"></td>


							<td>7.36</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3444&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">73 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_27.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3444&action=compare"}'>
                                    <font class="fontbold">北角衞理小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">North Point Methodist Primary School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 14校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.40 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.02</td>

                                <td style="padding-top:15px;" class="fontxlarge">4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">4</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>8.0</td><td>5.0</td><td>7.02</td><td>73</td>



										<td width="1px;"></td>


							<td>7.40</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3709&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">74 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_299.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3709&action=compare"}'>
                                    <font class="fontbold">馬鞍山循道衛理小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Ma On Shan Methodist Primary School</font>
                                    <br><font class="fontsmall">沙田 89校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.02</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>7.0</td>

								    <td>6.5</td><td>6.5</td>

								<td>6.5</td><td>7.0</td><td>7.02</td><td>74</td>



										<td width="1px;"></td>


							<td>6.79</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3929&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">75 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_525.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3929&action=compare"}'>
                                    <font class="fontbold">大角嘴天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tai Kok Tsui Catholic Primary School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 32校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.19 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.01</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>7.0</td><td>8.0</td><td>7.01</td><td>75</td>



										<td width="1px;"></td>


							<td>7.19</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3925&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">76 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_521.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3925&action=compare"}'>
                                    <font class="fontbold">中華基督教會協和小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Heep Woh Primary School</font>
                                    <br><font class="fontsmall">油麻地/尖沙咀/旺角 32校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">8.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">7.00</td>

                                <td style="padding-top:15px;" class="fontxlarge">8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">8</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>9.0</td>

								<td>6.0</td><td>6.0</td><td>7.00</td><td>76</td>



										<td width="1px;"></td>


							<td>8.00</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3540&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">77 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_126.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3540&action=compare"}'>
                                    <font class="fontbold">九龍灣聖若翰天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kowloon Bay St. John The Baptist Catholic Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 46校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.69 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.99</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>8.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>8.0</td><td>7.0</td><td>6.99</td><td>77</td>



										<td width="1px;"></td>


							<td>7.69</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3823&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">78 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_416.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3823&action=compare"}'>
                                    <font class="fontbold">番禺會所華仁小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Pun U Association Wah Yan Primary School</font>
                                    <br><font class="fontsmall">灣仔 12校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.83 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.98</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>7.0</td>

								    <td>9.0</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>6.98</td><td>78</td>



										<td width="1px;"></td>


							<td>6.83</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3555&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">79 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_141.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3555&action=compare"}'>
                                    <font class="fontbold">聖愛德華天主教小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Edward's Catholic Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.36 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.98</td>

                                <td style="padding-top:15px;" class="fontxlarge">-8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-8</font>
                                </td>
								<td>6.5</td>

								    <td>7.0</td><td>5.0</td>

								<td>7.0</td><td>6.0</td><td>6.98</td><td>79</td>



										<td width="1px;"></td>


							<td>6.36</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3463&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">80 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_47.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3463&action=compare"}'>
                                    <font class="fontbold">筲箕灣崇真學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Shaukiwan Tsung Tsin School</font>
                                    <br><font class="fontsmall">北角/筲箕灣/柴灣 16校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.11 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.90</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>6.5</td>

								    <td>7.0</td><td>8.3</td>

								<td>9.0</td><td>6.0</td><td>6.90</td><td>80</td>



										<td width="1px;"></td>


							<td>7.11</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3551&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">81 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_137.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3551&action=compare"}'>
                                    <font class="fontbold">聖公會油塘基顯小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Yautong Kei Hin Primary School</font>
                                    <br><font class="fontsmall">九龍灣/牛頭角/觀塘/油塘 48校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.89</td>

                                <td style="padding-top:15px;" class="fontxlarge">17</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">17</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>8.0</td><td>8.0</td><td>6.89</td><td>81</td>



										<td width="1px;"></td>


							<td>7.97</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3633&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">82 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_222.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3633&action=compare"}'>
                                    <font class="fontbold">保良局黃永樹小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">P.L.K. Wong Wing Shu Primary School</font>
                                    <br><font class="fontsmall">西貢/將軍澳 95校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">3.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.64 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.88</td>

                                <td style="padding-top:15px;" class="fontxlarge">-4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-4</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>5.5</td>

								<td>3.0</td><td>8.0</td><td>6.88</td><td>82</td>



										<td width="1px;"></td>


							<td>6.64</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3648&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">83 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_237.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3648&action=compare"}'>
                                    <font class="fontbold">東華三院王余家潔紀念小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">TWGHs Wong Yee Jar Jat Memorial Primary School</font>
                                    <br><font class="fontsmall">西貢/將軍澳 95校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.88</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>6.5</td>

								    <td>7.0</td><td>8.3</td>

								<td>5.0</td><td>9.0</td><td>6.88</td><td>83</td>



										<td width="1px;"></td>


							<td>6.97</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3714&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">84 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_304.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3714&action=compare"}'>
                                    <font class="fontbold">浸信會呂明才小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Baptist Lui Ming Choi Primary School</font>
                                    <br><font class="fontsmall">沙田 91校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.00 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.87</td>

                                <td style="padding-top:15px;" class="fontxlarge">-1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-1</font>
                                </td>
								<td>8.0</td>

								    <td>6.0</td><td>9.0</td>

								<td>5.0</td><td>5.0</td><td>6.87</td><td>84</td>



										<td width="1px;"></td>


							<td>7.00</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3776&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">85 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_369.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3776&action=compare"}'>
                                    <font class="fontbold">大埔舊墟公立學校（寶湖道）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Tai Po Old Market Public School (Plover Cove)</font>
                                    <br><font class="fontsmall">大埔 84校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.3 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.61 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.87</td>

                                <td style="padding-top:15px;" class="fontxlarge">11</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">11</font>
                                </td>
								<td>8.0</td>

								    <td>8.0</td><td>5.3</td>

								<td>9.0</td><td>7.0</td><td>6.87</td><td>85</td>



										<td width="1px;"></td>


							<td>7.61</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3509&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">86 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_93.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3509&action=compare"}'>
                                    <font class="fontbold">拔萃小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Diocesan Preparatory School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 41校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.86</td>

                                <td style="padding-top:15px;" class="fontxlarge">4</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">4</font>
                                </td>
								<td>8.0</td>

								    <td>5.0</td><td>7.5</td>

								<td>6.5</td><td>7.5</td><td>6.86</td><td>86</td>



										<td width="1px;"></td>


							<td>7.21</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3751&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">87 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_342.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3751&action=compare"}'>
                                    <font class="fontbold">保良局志豪小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Horizon East Primary School</font>
                                    <br><font class="fontsmall">屯門 70校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.86 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.85</td>

                                <td style="padding-top:15px;" class="fontxlarge">-5</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-5</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>8.5</td>

								<td>5.0</td><td>6.5</td><td>6.85</td><td>87</td>



										<td width="1px;"></td>


							<td>6.86</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3844&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">88 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_437.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3844&action=compare"}'>
                                    <font class="fontbold">嘉諾撒小學（新蒲崗）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Canossa Primary School (San Po Kong)</font>
                                    <br><font class="fontsmall">黃大仙 45校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.76 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.83</td>

                                <td style="padding-top:15px;" class="fontxlarge">-3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-3</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>7.8</td>

								<td>5.0</td><td>6.5</td><td>6.83</td><td>88</td>



										<td width="1px;"></td>


							<td>6.76</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3591&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">89 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_177.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3591&action=compare"}'>
                                    <font class="fontbold">聖公會青衣邨何澤芸小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Tsing Yi Estate Ho Chak Wan Primary School</font>
                                    <br><font class="fontsmall">青衣 66校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.79 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.82</td>

                                <td style="padding-top:15px;" class="fontxlarge">-2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-2</font>
                                </td>
								<td>6.5</td>

								    <td>8.0</td><td>6.0</td>

								<td>7.0</td><td>7.0</td><td>6.82</td><td>89</td>



										<td width="1px;"></td>


							<td>6.79</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3590&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">90 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_176.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3590&action=compare"}'>
                                    <font class="fontbold">保良局世德小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Po Leung Kuk Castar Primary School</font>
                                    <br><font class="fontsmall">青衣 66校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.81</td>

                                <td style="padding-top:15px;" class="fontxlarge">2</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">2</font>
                                </td>
								<td>6.5</td>

								    <td>9.0</td><td>8.5</td>

								<td>5.0</td><td>6.5</td><td>6.81</td><td>90</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3682&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">91 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_272.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3682&action=compare"}'>
                                    <font class="fontbold">聖公會基福小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Kei Fook Primary School</font>
                                    <br><font class="fontsmall">深水埗 40校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.80</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>4.8</td>

								<td>5.0</td><td>8.0</td><td>6.80</td><td>91</td>



										<td width="1px;"></td>


							<td>6.90</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3810&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">92 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_403.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3810&action=compare"}'>
                                    <font class="fontbold">寶血會伍季明紀念學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Kwai-ming Wu Memorial School of The Precious Blood</font>
                                    <br><font class="fontsmall">荃灣 62校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">8.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.07 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.80</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>7.0</td>

								    <td>7.0</td><td>8.5</td>

								<td>8.0</td><td>5.0</td><td>6.80</td><td>92</td>



										<td width="1px;"></td>


							<td>7.07</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3669&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">93 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_259.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3669&action=compare"}'>
                                    <font class="fontbold">聖公會聖紀文小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. St. Clement's Primary School</font>
                                    <br><font class="fontsmall">深水埗 40校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.57 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.79</td>

                                <td style="padding-top:15px;" class="fontxlarge">-7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-7</font>
                                </td>
								<td>7.0</td>

								    <td>6.5</td><td>7.5</td>

								<td>7.0</td><td>4.0</td><td>6.79</td><td>93</td>



										<td width="1px;"></td>


							<td>6.57</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3437&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">94 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_20.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3437&action=compare"}'>
                                    <font class="fontbold">聖安多尼學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Anthony's School</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.93 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.79</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>6.0</td><td>7.5</td>

								<td>9.0</td><td>5.0</td><td>6.79</td><td>94</td>



										<td width="1px;"></td>


							<td>6.93</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3431&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">95 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_14.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3431&action=compare"}'>
                                    <font class="fontbold">聖公會基恩小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">S.K.H. Kei Yan Primary School</font>
                                    <br><font class="fontsmall">中西區 11校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">4.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.47 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.78</td>

                                <td style="padding-top:15px;" class="fontxlarge">-7</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">



                                            <span class="rank-fall"></span>



                                   <font class="fontxlarge" style="position:relative;top:-3px;">-7</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>4.8</td>

								<td>5.0</td><td>5.0</td><td>6.78</td><td>95</td>



										<td width="1px;"></td>


							<td>6.47</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3500&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">96 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_84.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3500&action=compare"}'>
                                    <font class="fontbold">中華基督教會基華小學（九龍塘）</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">C.C.C. Kei Wa Primary School (Kowloon Tong)</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 41校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.90 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.78</td>

                                <td style="padding-top:15px;" class="fontxlarge">1</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">1</font>
                                </td>
								<td>8.0</td>

								    <td>6.5</td><td>7.8</td>

								<td>5.0</td><td>5.0</td><td>6.78</td><td>96</td>



										<td width="1px;"></td>


							<td>6.90</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3786&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">97 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_379.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3786&action=compare"}'>
                                    <font class="fontbold">港九街坊婦女會孫方中小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">HKKKWA Sun Fong Chung Primary School</font>
                                    <br><font class="fontsmall">大埔 84校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.77</td>

                                <td style="padding-top:15px;" class="fontxlarge">8</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">8</font>
                                </td>
								<td>6.5</td>

								    <td>8.0</td><td>9.5</td>

								<td>9.0</td><td>5.0</td><td>6.77</td><td>97</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3510&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">98 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_95.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3510&action=compare"}'>
                                    <font class="fontbold">陳瑞祺（喇沙）小學</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Chan Sui Ki (La Salle) Primary School</font>
                                    <br><font class="fontsmall">九龍城/何文田/紅磡 34校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.5 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">4.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.29 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">6</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">6</font>
                                </td>
								<td>9.0</td>

								    <td>8.0</td><td>5.5</td>

								<td>4.0</td><td>6.5</td><td>6.76</td><td>98</td>



										<td width="1px;"></td>


							<td>7.29</td>
						</tr>

						  	<tr class=odd style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3818&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">99 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_411.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3818&action=compare"}'>
                                    <font class="fontbold">嘉諾撒聖方濟各學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">St. Francis' Canossian School</font>
                                    <br><font class="fontsmall">灣仔 12校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">8.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">7.8 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">6.97 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.76</td>

                                <td style="padding-top:15px;" class="fontxlarge">0</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">




                                            <span class="rank-equal"></span>


                                   <font class="fontxlarge" style="position:relative;top:-3px;">0</font>
                                </td>
								<td>7.0</td>

								    <td>8.0</td><td>7.8</td>

								<td>7.0</td><td>5.0</td><td>6.76</td><td>99</td>



										<td width="1px;"></td>


							<td>6.97</td>
						</tr>

						  	<tr class=even style="CURSOR: pointer; cursor: hand;"

	    					  	onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3793&action=compare"}'

						  	>

                                <td style="color:#a0a0a0;padding-top:35px;text-align:center;font-size:32px;font-weight:100;">100 <font class="d3-color-gray-3" style="font-size:9px;"></font></td>
                                <td style="padding-left:0px;padding-right:20px;padding-top:10px;"><img class="imagedropshadow" src="/school/staticimage/CAT1/logo_386.jpg" onerror="ImgError(this);" width="55px" height="55px"/></td>
                                <td  class="fontxlarge" style="line-height:150%;padding-top:10px;padding-bottom:5px;" onclick='javascript:{window.location="/school/controller/entityDetails?entityid=3793&action=compare"}'>
                                    <font class="fontbold">寶血會思源學校</font><font  class="fontlarge d3-color-black"></font><br><font  class="fontmedium">Si Yuan School of the Precious Blood</font>
                                    <br><font class="fontsmall">荃灣 62校網 &nbsp;&nbsp; </font>
                                </td>


	  							<td style="padding-top:15px;" class="fontxlarge">7.0 <font class="fonttiny d3-color-gray-3"></font> </td>

	  							<td style="padding-top:15px;" class="fontxlarge">6.5 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>




	  							<td style="padding-top:15px;" class="fontxlarge">9.0 <font class="fonttiny d3-color-gray-3"></font></td>
	  							<td style="padding-top:15px;" class="fontxlarge">5.0 <font class="fonttiny d3-color-gray-3"></font></td>
						  		<td style="padding-top:15px;" class="fontxlarge">7.21 <font class="fonttiny d3-color-gray-3"></font></td>
                                <td style="padding-top:15px;" class="fontxlarge">6.75</td>

                                <td style="padding-top:15px;" class="fontxlarge">3</td>
                                <td style="padding-top:10px;" class="tbl-prevrank-icon fontlarge">


                                            <span class="rank-rise"></span>




                                   <font class="fontxlarge" style="position:relative;top:-3px;">3</font>
                                </td>
								<td>7.0</td>

								    <td>6.5</td><td>9.0</td>

								<td>9.0</td><td>5.0</td><td>6.75</td><td>100</td>



										<td width="1px;"></td>


							<td>7.21</td>
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
var zflag_nid="1044"; var zflag_cid="1775/1773"; var zflag_sid="402"; var zflag_width="728"; var zflag_height="90"; var zflag_sz="14";
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
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">159920 <font class="d3-color-green-4">篇家長評級</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">11322 <font class="d3-color-green-4">位家長注册</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">52 <font class="d3-color-green-4">位注册導師</font></span>
	<span style="margin-right:30px;margin-left:7px;top:3px;position:relative;float:left" class="rating1text">105620882 <font class="d3-color-green-4">觀看次數</font></span>
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


						alert("您必須登入到BookofSchool帳戶,然後就可以使用這功能！");}'>
    						我喜愛的學校</a>
							<br><a class="afont2b" href="#" title="Account Setup" onclick='javascript:{


						alert("您必須登入到BookofSchool帳戶,然後就可以使用這功能！");}'>
   						個人資料
   				</a>
</div>
<div style="position:relative;float:left; border-left: 1px solid rgb(198,191,180);min-height:100px;top:30px;"></div>
<div style="position:relative;float:left;padding:25px;width:100px;">
<br><font class="font4b">選校工具</font>
<br><a class="afont2b" href="/school/controller/searchForm?nocache=1559197808171"  style="text-decoration:none" >學校搜尋</a>
<br><a class="afont2b" href="/school/controller/reverseSearchForm"  style="text-decoration:none" >逆向搜尋</a>
<br><a class="afont2b" href="/school/controller/schoolCompare?nocache=1559197808171"  style="text-decoration:none" >學校比較</a>
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