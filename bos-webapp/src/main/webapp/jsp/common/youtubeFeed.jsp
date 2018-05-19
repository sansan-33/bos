<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="compareCategory" value="${requestScope.entityVerticalCategoryList[0]}"/> 
 <c:set var="mapkey16" value="${compareCategory[16]['key']}0"/> <!-- name chi -->

<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/redmond/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript" src="/school/js/jquery.youtubepopup.js"></script>

<style>
.titlec {
  font-size: 14px;
  height: 35px;
  width: 170px;
  padding:10px;
}
ul.videos li {
  float: left;
  width: 16em;
  margin: 0.5em 0.1em 2.5em 0.5em;
}
ul.videos
{
  margin-bottom: 1em;
  padding-left : 0em;
  margin-left: 0em;
  list-style: none;
}
</style>
<script type="text/javascript" src="https://swfobject.googlecode.com/svn/trunk/swfobject/swfobject.js"></script>




<!-- 6171: SKH Li Fook Hing Secondary School -->
<c:choose>
    <c:when test="${requestScope.entityid eq '6171'}">


        <br>
        <div class="divider-small"></div>
        <ul class="videos">
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/5c4C4Rc0c2s" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">校園生活回顧2015 2016結業篇</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/LwbulhWz5nY" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">20週年</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/zzvoB5LWVz8" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">Beauty and the Beast 2016</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/nWfQl3ut9wE" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">校園生活回顧2015 2016畢業篇 </div>
            </li>
        </ul>
        <br class="clearboth"/>

    </c:when>
    <c:when test="${requestScope.entityid eq '6035'}">

        <br>
        <div class="divider-small"></div>
        <ul class="videos">
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/FqP3J1nw7Lw" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">香港中文大學健康教育及促進健康中心製作，「透過社區聯繫培育正向價值」</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/OTLWfHzdhJQ" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">香港青年協會讚好校園，「校長訪問」</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/EIwbTaYEwKQ" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">香港青年協會讚好校園，「麥生訪問」</div>
            </li>
            <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/8ycavl40cIw?t=1m38s" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">「友‧導向」師友計劃</div>
            </li>
             <li>
                <iframe width="190" height="125" src="https://www.youtube.com/embed/9ViffMvdRKk" frameborder="0" allowfullscreen></iframe>
                <br><div class="titlec">我校畢業典禮活動重溫</div>
             </li>
        </ul>
        <br class="clearboth"/>

    </c:when>
    <c:otherwise>
        <br>
        <div class="divider-small"></div>
        <script type="text/javascript">
        $(function () {
            $("img.youtube").YouTubePopup({idAttribute: 'youtubeid'});
        });

            function showMyVideos2(data) {
              console.log("showMyVideos2 " + data.items)
              var feed = data.items;
              console.log("showMyVideos2 " + feed[0].snippet.title)
              var entries = feed || [];

              console.log("entries " + entries)

              var maxlength=12;
              if(entries.length < maxlength)
                  maxlength=entries.length;

              var html = ['<h2><spring:message code="label.youtubefeed"/>&nbsp;<font class="d3-color-orange">(' + maxlength  + ')</font></h2></br>'];
              html.push('<ul class="videos">');
              for (var i = 0; i < maxlength; i++) {
                var entry = entries[i];
                console.log("entry: " + entry.id.videoId);
                var title = entry.snippet.title.substr(0, 45);
                var youtubeid  = entry.id.videoId.split('/').reverse()[0];
                var thumbnailUrl = entry.snippet.thumbnails.medium.url;
                console.log("thumbnailUrl: " + thumbnailUrl);
                if(title.indexOf('9 UP') == -1  && title.indexOf('versus 0.2 Certi') ){
                    html.push('<li>',
                        '<img class="youtube" youtubeid="',youtubeid ,'" style="cursor: pointer;" src="', thumbnailUrl, '" width="190" height="125"/></br>',
                          '<div class="titlec">', title, '...</div></li>');
                          }
              }
              html.push('</ul><br style="clear: left;"/>');
              document.getElementById('videos2').innerHTML = html.join('');

            }
            </script>



            <div id="videos2"></div>




            <script
                type="text/javascript"
                src="https://www.googleapis.com/youtube/v3/search?q=${compareCategory[16][mapkey16]}&type=video&part=snippet&key=AIzaSyDvklaED8nVPIai_v0H2xkF1cibULNpE_w&callback=showMyVideos2&max-results=30&format=5">
            </script>

    </c:otherwise>
</c:choose>







