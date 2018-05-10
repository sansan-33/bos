<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="appsbox">
    <img id="appsclosemessage" style="float:right;cursor:pointer"  src="/school/img/cross.png"/>
    <div style="padding-top:30px;">
        <div style="padding-left:10px;float:left">
            <a class="download" target="_blank" href="https://itunes.apple.com/us/app/bookofschool/id1236504022">
                <img src="/school/img/apple-download.png?1495100274">
            </a>
            <a class="download" href="#" onclick="alert('<spring:message code='label.comingsoon'/>');">
                <img src="/school/img/google-download.png?1495100274">
            </a>
        </div>
        <div style="padding-left:10px;padding-top:10px;float:left">
            <font style="font-size:15px;"><spring:message code="label.ourapps.desc"/></font>
        </div>
    </div>
</div>