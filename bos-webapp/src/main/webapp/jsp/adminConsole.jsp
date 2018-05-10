<%@ include file="common-header.jsp" %>

<jsp:include page="menu.jsp"/>

<style>

/* jquery tools tabs */
/* root element for tabs  */
ul.css-tabs {
    margin:0 !important;
    padding:0;
    height:30px;
    border-bottom:1px solid #666;
}

/* single tab */
ul.css-tabs li {
    float:left;
    padding:0;
    margin:0;
    list-style-type:none;
}

/* link inside the tab. uses a background image */
ul.css-tabs a {
    float:left;
    font-size:13px;
    display:block;
    padding:5px 30px;
    text-decoration:none;
    border:1px solid #666;
    border-bottom:0px;
    height:18px;
    background-color:#efefef;
    color:#777;
    margin-right:2px;
    position:relative;
    top:1px;
    outline:0;
    -moz-border-radius:4px 4px 0 0;
}

ul.css-tabs a:hover {
    background-color:#F7F7F7;
    color:#333;
}

/* selected tab */
ul.css-tabs a.current {
    background-color:#ddd;
    border-bottom:1px solid #ddd;
    color:#000;
    cursor:default;
}


/* tab pane */
.css-panes div {
    border:1px solid #666;
    border-width:0 1px 1px 1px;
    min-height:150px;
    padding:15px 20px;
}


</style>

<h1>Admin Console</h1>

<c:if test="${sessionScope.user['roleid'] eq 1   }">

    <ul class="css-tabs">
        <li><a href="/school/controller/getSynchronizationForm">Synchronization</a></li>
        <li><a href="/school/controller/getSecondaryListForm">Secondary School</a></li>
        <li><a href="/school/controller/getPrimaryListForm">Primary School</a></li>
    </ul>

    <div class="css-panes">
        <div style="display:block;"></div>
    </div>

</c:if>

<c:if test="${sessionScope.user['roleid'] eq 5   }">

    <ul class="css-tabs">
        <li><a href="/school/controller/getSecondaryListForm">Secondary School</a></li>
    </ul>

    <div class="css-panes">
        <div style="display:block;"></div>
    </div>

</c:if>

<jsp:include page="common-footer.jsp"/>


 <script>
  $(function() {
     $("ul.css-tabs").tabs("div.css-panes > div", {effect: 'ajax'});
  });
  </script>



