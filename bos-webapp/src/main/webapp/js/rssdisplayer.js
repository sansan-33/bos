
function rssdisplayer(divid, url, feedlimit, showoptions, header){

    //feednami.loadGoogleFormat(url,callback)
    this.showoptions=showoptions || "" //get string of options to show ("date" and/or "description")
    //var feedpointer=new google.feeds.Feed(url) //create new instance of Google Ajax Feed API
    //feedpointer.setNumEntries(feedlimit) //set number of items to display
    document.write('<div id="'+divid+'">Loading feed...</div>')
    this.feedcontainer=document.getElementById(divid)
    var displayer=this
    feednami.loadGoogleFormat(url,function(r){displayer.formatoutput(r,header)})

    //feedpointer.load(function(r){displayer.formatoutput(r,header)}) //call Feed.load() to retrieve and output RSS feed

}

Date.prototype.yyyymmdd = function() {
    var yyyy = this.getFullYear().toString();
	var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
	var dd  = this.getDate().toString();
	return yyyy + "-" +  (mm[1]?mm:"0"+mm[0]) + "-" +  (dd[1]?dd:"0"+dd[0]); // padding
};


rssdisplayer.prototype.formatdate=function(datestr){
    var itemdate=new Date(datestr)
    return "<span style='color:gray; font-size: 90%'>"+itemdate.yyyymmdd()+"</span>"
}

rssdisplayer.prototype.formatoutput=function(result,header){
    console.log();
    if (!result.error){ //if RSS feed successfully fetched
        var thefeeds=result.feed.entries //get all feed entries as a JSON array
        var headeroutput="<h2>" + header + "&nbsp;<font class='d3-color-orange'>(" + (thefeeds.length) + ")</font></h2></br>";
        var rssoutput="<span style=\"position:relative;left:0px;\">" + headeroutput;
        for (var i=0; i<thefeeds.length; i++){ //loop through entries
            console.log("thefeeds[i].title " + thefeeds[i].title);
            var itemtitle="<span style=\"position:relative;left:5px;\">" + "<a style=\"position:relative;z-index:10;\" class=\"d3-color-blue-1 fontxlarge fontbold\" href=\"" + thefeeds[i].link + "\" target=\"_blank\">" + thefeeds[i].title + "</a>"
            var itemdate= (/date/i.test(this.showoptions)? this.formatdate(thefeeds[i].publishedDate) : "" ) + "</span><br><br><br>";
            var itemdescription=/description/i.test(this.showoptions)? ""+thefeeds[i].content : /snippet/i.test(this.showoptions)? ""+thefeeds[i].contentSnippet  : ""
            rssoutput+="" + itemtitle + " " + itemdate + "<div style=\"position:relative;left:0px;top:-25px;z-index:0;\">" + itemdescription + "</div><br/>"
        }
    rssoutput+="</span>"
    this.feedcontainer.innerHTML=  rssoutput;
}
else{ //else, output error
//alert("Error fetching feeds: "+result.error.message)
}
}

//USAGE SYNTAX: new rssdisplayer("divid", "rssurl", numberofitems, "displayoptions")
//new rssdisplayer("adiv", "http://www.cssdrive.com/index.php/news/rss_2.0/", 5, "date, description")