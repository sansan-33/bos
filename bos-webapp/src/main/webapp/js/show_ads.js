var adClientUrl=window.location.href;
var adWidth=ad_width ;
var adHeight=ad_height ;
var adId=ad_id;
//adId=1;
var url;

if(ad_id=="1")
{
   url="https://ad.unimhk.com/show.php?id=mdcymdfmmdm3nzbi&sz=300";
}
else if(ad_id=="2")
{
  url="https://ad.unimhk.com/show.php?id=mdcymdfmmdm3nzbi&sz=728";
}
else
{
  url="https://ad.unimhk.com/show.php?id=mdcymdfmmdm3nzbi&sz=30";
}

console.log('Show backup script: ' + url);

document.write('<script type="text/javascript" src="' + url + '"></script>');


//document.write('<iframe src="'+url+'" frameborder="0" scrolling="no" width="'+adWidth+'px" height="'+adHeight+'px" name="bookofschool"></iframe>');
