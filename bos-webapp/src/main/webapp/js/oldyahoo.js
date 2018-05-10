function getkeywords(key)
{	var match = window.location.href.match('[?&]' + key + '=([^&]+)');
	if (match == undefined) {return '';} else {return match ? match[1]:null;}}
function getIP() 
{	if(window.XDomainRequest) {xmlhttp = new XDomainRequest();} else if (window.XMLHttpRequest) {xmlhttp = new XMLHttpRequest(); } else { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); }
	xmlhttp.open("GET","http://api.hostip.info/get_html.php",false); xmlhttp.send();hostipInfo = xmlhttp.responseText.split("\n");var IP=false;
	for (var i=0; hostipInfo.length >= i; i++) {if(hostipInfo[i]){ipAddress = hostipInfo[i].split(": "); if ( ipAddress[0] == "IP" ) {IP = ipAddress[1];}}}return IP.trim();}

