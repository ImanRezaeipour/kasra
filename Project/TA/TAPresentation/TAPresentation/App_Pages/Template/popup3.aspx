<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popup3.aspx.cs" Inherits="TAPresentation.App_Pages.Template.popup3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
<head>


<script>
var dir =   "1";  //  Which direction does window come from (0 for top - 1 for left)
var delay = "1";  //  How long before window appears (seconds)


// published by: scripts.tropicalpcsolutions.com
// Some cross browser code done by js-x.com

var isDOM=document.getElementById?1:0;
var isIE=document.all?1:0;
function showWin(){
	if(isDOM) {document.getElementById("popup").style.display="";}
	else if(isIE){popup.style.display = ""; }
}
function closeWin(){
	if(isDOM) {document.getElementById("popup").style.display="none"}
	else if(isIE){popup.style.display = "none";}
}
</script>



</head>
<body onLoad="setTimeout('showWin()',delay*1000)">




<script>
if (navigator.appName=="Microsoft Internet Explorer"){
	if (dir == "0"){document.write('<div id="loc" style="position:relative; top:-300" align="center">');}
	if (dir == "1"){document.write('<div id="loc" style="position:relative; left:-300">');}
}
else document.write('<div id="loc" style="position:relative" align="center">');
</script>
<table id="popup" cellSpacing="0" cellPadding="0" border="1" bgcolor="white" style="display:none; border-color:black;" width="300" height="300">
<tr>
<td align="left" valign="top" bgcolor="blue" width="100%" height="10px">
<font color=white size=2 face=arial><b>
<!--################### Your page title goes here  -->
Your Title Here...
</b></font>
</td>
<td width="10px" height="10px" bgcolor="red" align="right">
<font color="white" size="3" face="arial"><span onclick="closeWin()" style="cursor:hand" title="Click here to close this window"><b>X</b></span></font>
</td></tr>
<tr>
<td colspan="2">
<font color=black size=2 face=arial><b><center>
<!--################### Your window content here goes  -->



Your Content Here...</center></b></font>


<!--################### End content here -->
</td></tr></table>
</div>
<script>
function slide(dir){
	if (dir == "1" && loc.style.pixelLeft < (screen.width-300)/2){
		loc.style.pixelLeft+=5; 
		move=setTimeout("slide(dir)",50);
        }
	if (dir == "0" && loc.style.pixelTop < (screen.height-300)/2){
		loc.style.pixelTop+=5; 
		move=setTimeout("slide(dir)",50);
        }
}
if (navigator.appName=="Microsoft Internet Explorer") slide(dir);
</script>




</body></html>

