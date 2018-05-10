function isMobileDevice111() {
    return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
};

function isMobileDevice() {
  var check = false;
  check = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
  return check;
};

function save_dt_view (oSettings, oData) {
	window.scrollTo(0, 0);
  localStorage.setItem( 'DataTables_forum', JSON.stringify(oData) );
}
function load_dt_view (oSettings) {
	return JSON.parse( localStorage.getItem('DataTables_forum') );
}
function reset_dt_view() {
  localStorage.removeItem('DataTables_forum');
}

function generateAd(adid,addiv){
    console.log("generate  ads from adsfactor id:" + adid + ",div:" + addiv);
     $.get('/school/controller/adController?id=' + adid, function(data) {$("#backupads").append(data);});
}
function clearSchoolCompare(id){

	$.post("/school/controller/clearSchoolCompare/" + id , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
			$('#schoolvstext').html(data); // Fill the suggestions box
	});
}
function addSchoolCompare(id){

	$.post("/school/controller/saveSchoolCompare/" + id , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		$('#schoolvstext').html(data); // Fill the suggestions box
	});
}
function saveviewedschoolsingle(entityid,userid,html,html2){
    
	$.post("/school/controller/saveFavorite/" + entityid + "/" + userid + "/like/1"  , {queryString: ""+ entityid+""}, function(data) { // Do an AJAX call
	    showMessage(html2);
		//document.getElementById("favoritecount").innerHTML = html + " ("+ data + ")";
	    document.getElementById("favoritecount").innerHTML =  data ;
	    
	});
	
}
function saveviewedschool(viewedentityid, userid, html, html2){

	$.post("/school/controller/saveFavorite/" + viewedentityid + "/" + userid + "/like/1" , {queryString: ""+ viewedentityid+""}, function(data) { // Do an AJAX call
	    showMessage(html2);
	    document.getElementById("favoritecount").innerHTML =  data ;
   });
	
}
function hideEvent(id){

	$.post("/school/controller/hideEvent/" + id  , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		showMessage(data); // Fill the suggestions box
	});
}
function hideComment(id){

	$.post("/school/controller/hideComment/" + id  , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		showMessage(data); // Fill the suggestions box
	});
}
function hideQA(id){

	$.post("/school/controller/hideQA/" + id  , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		showMessage(data); // Fill the suggestions box
	});
}
function voteHelpfulCase(id){

	$.post("/school/controller/voteHelpfulCase/" + id  , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		$("#helpfulcount").html(data);
	});
}
function deleteImage(imagekey,thumb){

	$.post("/school/controller/deleteImage/" + imagekey  , {queryString: ""+ imagekey+""}, function(data) { // Do an AJAX call
		//showMessage(data); // Fill the suggestions box
		$("#" + thumb).attr("src","/school/img/uploadyourimage.png");
	});
}
function likeComment(id,action){

	$.post("/school/controller/likeComment/" + id + "/" + action , {queryString: ""+ id+""}, function(data) { // Do an AJAX call
		showMessage(data); // Fill the suggestions box
	});
}
function ajaxRequest(uri){
	console.log("start ajaxRequest " + uri);
	
	/*
	
	$.post(uri , {queryString: ""}, function(data) { // Do an AJAX call
			console.log("Doing ajaxRequest " + uri);
			location.reload(true);
		});
	*/
	$.ajax({
        type: "post",
        url: uri,
        cache: false,
        success: function(msg) { 
        	console.log(msg); 
        	if(uri.indexOf("sociallogin") != -1){
        		window.location="/school/controller/home" ;
			}
        } // Do noting  
        });

}

function getSchoolListBySystem(schoolsystem){

	document.forms["ibschool"].schoolsystem.value = schoolsystem;
	document.forms["ibschool"].submit();
}
function getSchoolListMenu(poaschoolnet,schoolcategory){

	document.forms["schoolbreadcrumb"].poaschoolnet.value = poaschoolnet;
	document.forms["schoolbreadcrumb"].schoolcategory.value = schoolcategory;
	document.forms["schoolbreadcrumb"].submit();
}
function getSchoolListByFinanceTypeMenu(financetype,schoolcategory){

	document.forms["schoolbreadcrumb"].financetype.value = financetype;
	document.forms["schoolbreadcrumb"].schoolcategory.value = schoolcategory;
	document.forms["schoolbreadcrumb"].submit();
}
function getSchoolListByNurseryMenu(nursery,schoolcategory){

	document.forms["schoolbreadcrumb"].nursery.value = nursery;
	document.forms["schoolbreadcrumb"].schoolcategory.value = schoolcategory;
	document.forms["schoolbreadcrumb"].submit();
}

function getSchoolList(poaschoolnet,districtschoolbreadcrumb){

	document.forms["school"].poaschoolnet.value = poaschoolnet;
	document.forms["school"].poaschoolnets.value = '-1';
	document.forms["school"].districtschoolbreadcrumb.value = districtschoolbreadcrumb;
	document.forms["school"].submit();
}
function getSchoolListPrimary(poaschoolnet,districtschoolbreadcrumb){

	//$("#poaschoolnets").val(poaschoolnet);
	//$("#districtschoolbreadcrumb").val(districtschoolbreadcrumb);
	document.forms["school"].poaschoolnets.value = poaschoolnet;
	document.forms["school"].districtschoolbreadcrumb.value = districtschoolbreadcrumb;
	document.forms["school"].submit();
}
function getSchoolListByFinanceType(financetype){
    resetField();
	document.forms["school"].financetype.value = financetype;
	document.forms["school"].submit();
}
function getSchoolListByNursery(nursery){
    resetField();
	document.forms["school"].nursery.value = nursery;
	document.forms["school"].submit();
}
function getSchoolListByMode(mode){
    resetField();
	if(mode == '1'){
		document.forms["school"].feeder.value = mode;
	}else if(mode =='2'){
		document.forms["school"].nominated.value = mode;
	}else if(mode =='3'){
		document.forms["school"].throughtrain.value = mode;
	}
	document.forms["school"].submit();
}
function resetField(){

	document.forms["school"].poaschoolnet.value = '-1';
	document.forms["school"].poaschoolnets.value = '-1';
	document.forms["school"].districtschoolbreadcrumb.value = '-1';
  	document.forms["school"].financetype.value = '-1';
    document.forms["school"].nursery.value = '-1';
	document.forms["school"].feeder.value = '-1';
	document.forms["school"].nominated.value = '-1';
	document.forms["school"].throughtrain.value = '-1';
}

function ImgError(source){
    source.src = "../img/giga-star.png";
    source.onerror = "";
    return true;
}
function UserImgError(source){
    source.src = "../img/unknown.gif";
    source.onerror = "";
    return true;
}
function tooglecheckbox(element){
	    
		var $checkbox = $('#'+element);
        $checkbox.attr('checked', !$checkbox.is(':checked'));
	
}
function setEntityId(hiddenfieldid){
    
	
	$("#" +  hiddenfieldid ).val(document.forms['schoolselect'].entityid.value);
	var tmp = $.trim($("#entityid option:selected").text());
	var a = tmp.split("|");
	$("#display" +  hiddenfieldid ).html(a[1]);
	overlayElem.overlay().close();
	
}

function loadEntityId(entityids,entitynames,hiddenfieldid){
	if(entityids.length > 0 ){
		var entityIdArray=entityids.split(",");
		var entityNameArray=entitynames.split(",");
		for(var i=0; i< entityIdArray.length; i++){
			$("#text" +  hiddenfieldid ).html($("#text" +  hiddenfieldid ).html() + "<span id='schoolid" + entityIdArray[i] +"' > - " +entityNameArray[i] + "<a style='float:right;width:30px;' href='#' onclick='removeSchool(\"" + entityIdArray[i] + "\",\"" + hiddenfieldid + "\",\"" +   entityIdArray[i] + "\");'><img src='/school/img/closegreen.png'/></a><br class='clear'></span>" );
		}
	}
}
function appendEntityId(hiddenfieldid){
    
	$("#" +  hiddenfieldid ).val($("#" +  hiddenfieldid ).val() + "," +  document.forms['schoolselect'].entityid.value);
	var str=$("#" +  hiddenfieldid ).val();
	var n=str.substring(1).split(",");
	$("#display" +  hiddenfieldid ).html(n.length );
	var tmp = $.trim($("#entityid option:selected").text());
	var a = tmp.split("|");
	
	$("#text" +  hiddenfieldid ).html($("#text" +  hiddenfieldid ).html() + "<span id='schoolid" + $("#entityid option:selected").val() +"' > - " + a[1] + "<a style='float:right;width:30px;' href='#' onclick='removeSchool(\"" + $("#entityid option:selected").val() + "\",\"" + hiddenfieldid + "\",\"" +  $("#entityid option:selected").val() + "\");'><img src='/school/img/closegreen.png'/></a><br class='clear'></span>" );
	
	
}
function removeSchool(n,hiddenfieldid,entityid){
	$('#text' +  hiddenfieldid).children('#schoolid' + n).remove();
	var str=$("#" +  hiddenfieldid ).val();
	var entityArray=str.substring(1).split(",");
	
	var entityids="";
	
	for(var i=0; i< entityArray.length; i++){
		if(entityid != entityArray[i] ){
			entityids = entityids + "," + entityArray[i] ;
		}
	}
	$("#" +  hiddenfieldid ).val(entityids);
	$("#display" +  hiddenfieldid ).html(entityArray.length-1);
}


function nl2br (str, is_xhtml) {
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}

function br2nl(str) {
    return str.replace(/<br\s*\/?>/mg,"\r");
}