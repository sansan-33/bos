<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="compareCategory" value="${requestScope.entityVerticalCategoryList[0]}"/>
<c:set var="mapkey16" value="${compareCategory[16]['key']}0"/> <!-- name chi -->

<script type="text/javascript">

//USAGE SYNTAX: new rssdisplayer("divid", "rssurl", numberofitems, "displayoptions")
//new rssdisplayer("feed", "http://hk.news.search.yahoo.com/rss?ei=UTF-8&p=${compareCategory[16][mapkey16]}&fr=FP-tab-news-t", 6, "date, description", "<spring:message code='label.relatednews'/>");


var API = "https://www.bookofschool.com/school/controller/api/rssfeeds/${compareCategory[16][mapkey16]}";
var USERNAME = '${apiMap["api.user"]}';
var PASSWORD = '${apiMap["api.pwd"]}';
$.ajax({
  url: API,
  type: "GET",
  dataType: "json",
  headers: {
      "Authorization": "Basic " + btoa(USERNAME + ":" + PASSWORD)
    },
  contentType: 'application/json; charset=utf-8',

  success: function(data) {
            console.log(JSON.stringify(data));
          var headeroutput="<h2>" + "<spring:message code='label.relatednews'/>" + "&nbsp;<font class='d3-color-orange'>(" + (data.feeds.length) + ")</font></h2></br>";
          var rssoutput="<span style=\"position:relative;left:0px;\">" + headeroutput;
          var divid = "feed";
          //document.write('<div id="'+divid+'">Loading feed...</div>');
                  this.feedcontainer=document.getElementById(divid);

          $.each(data.feeds, function(i, obj) {

            //use obj.id and obj.name here, for example:
            console.log(obj.title);
            var itemtitle="<span style=\"position:relative;left:0px;\">" + "<a style=\"position:relative;z-index:10;\" class=\"d3-color-blue-1 fontxxlarge fontbold\" href=\"" + obj.url + "\" target=\"_blank\">" + obj.title + "</a>"
            var itemdate= "<div style='position:relative;float:right;left:-10px;'>" + obj.date + "</div></span><br><br><br>";
            var itemdescription= ""+ obj.content;
            rssoutput+="" + itemtitle + " " + itemdate + "<div style=\"position:relative;left:0px;top:-20px;z-index:0;font-size:14px;\">" + itemdescription + "</div><br/>"

          });
          rssoutput+="</span>"
          this.feedcontainer.innerHTML=  rssoutput;


  },
  error: function() {
    //alert("ERROR!!!");
  }
});


</script>


<div id="feed"></div>

