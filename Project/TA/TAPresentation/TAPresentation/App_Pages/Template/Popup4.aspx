<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup4.aspx.cs" Inherits="TAPresentation.App_Pages.Template.Popup4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <LINK href="../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet">
    <script language="javascript">
    //form1.BtnSave.focus()
        function fLoop() {
            var j = 0;
            for (var i = 0; i > 100; i++) {
                if (i == 100) {
                    form1.rr.focus();

                }
            }
        }
        ///==========================================================================================
        function onClickBtnSave() {
            //alert(gg.style.pixelLeft)
            //TDTitle
            //alert(form1.txtAlert)
            form1.txtAlert.value="ذخيره شد"
            //document.getElementById("TDTitle").title = form1.txtAlert.value //$get("txtAlert").value
            document.getElementById("TDTitle").innerHTML = "<font color=white size=3 weight=bold face=Kasra Traffic Normal><b>"
            document.getElementById("TDTitle").innerHTML +=form1.txtAlert.value
            document.getElementById("TDTitle").innerHTML +="</b></font>"
            
            setTimeout('showWin()', delay * 500);
            
        }
       ////=======================================================================================================
        var dir = "1";  //  Which direction does window come from (0 for top - 1 for left)
        var delay = "1"; 
        var isDOM = document.getElementById ? 1 : 0;
        var isIE = document.all ? 1 : 0;
        function showWin() 
        {
            if (isDOM) { document.getElementById("popup").style.display = ""; }
            else if (isIE) { popup.style.display = ""; }
            window.setInterval("closeWin()", 4000);
        }
        function closeWin() {
            if (isDOM) { document.getElementById("popup").style.display = "none" }
            else if (isIE) { popup.style.display = "none"; }
            
        }
</script>
    </head>
<body scroll="no">


    <form id="form1" runat="server">
    <div id="ft" >
        <input id="BtnSave" name="BtnSave" onclick="onClickBtnSave()" type="button" value="button" />&nbsp;&nbsp;
        <input id="rr" name="rr" type="text" runat="server" /></div>
 
   <div>
   <script>
       //Mozopacity:0.85 ;
       if (navigator.appName == "Microsoft Internet Explorer") {
           if (dir == "0") { document.write('<div id="loc" style="position:absolute;top:300px" align="center">'); }
           if (dir == "1") { document.write('<div id="loc" style="position:absolute;top:450px; left:-300">'); }

           //if (dir == "0") { document.write('<div id="loc" style="position:relative; top:'+screen.height+' align="center">'); }
           //if (dir == "1") { document.write('<div id="loc" style="position:relative; left:' + screen.width + '">'); }

           //if (dir == "0") { document.write('<div id="loc" style="position:relative; top:0" align="center">'); }
           //if (dir == "1") { document.write('<div id="loc" style="position:relative; left:0">'); }
       }
       else document.write('<div id="loc" style="position:absolute" align="center">');
    </script>
    
        <table id="popup" cellSpacing="0" cellPadding="0" border="0" bgcolor="white" style="display:none; BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid;BORDER-LEFT: lightsteelblue 2px solid; BORDER-BOTTOM: #346fa4 2px solid;  " width="100" height="100">
           <tr>
            <td align="center" id="TDTitle" valign="middle" class="VertGradientBlue2" width="100%" height="10px">
            </td>
            <td valign="top" class="VertGradientBlue2"><font color="white" size="3" face="arial">
                <span onclick="closeWin()" style="cursor:hand" title="بستن"><img alt="" src="../../App_Utility/Images/close1.png" /></span></font>
             </td>
           </tr>
         </table>
  
    <script>
        
        function slide(dir) {
        
            if (dir == "1" && loc.style.pixelLeft < (screen.width - 300) / 2) {
            //if (dir == "1" && loc.style.pixelLeft < (screen.width)) {
                //if (dir == "1" && loc.style.pixelLeft < 900) {
                loc.style.position="absolute";
                loc.style.pixelLeft +=5;
                move = setTimeout("slide(dir)", 50);
            }
            if (dir == "0" && loc.style.pixelTop < (screen.height - 300) / 2) {
            //if (dir == "0" && loc.style.pixelTop < (screen.height)) {
            //if (dir == "0" && loc.style.pixelTop < 900) {
                loc.style.pixelTop += 5;
                move = setTimeout("slide(dir)", 50);
            }
        }
        if (navigator.appName == "Microsoft Internet Explorer") slide(dir);
    </script>
   </div>
   
    <div  style="DISPLAY: none">
        <input id="txtAlert" name="txtAlert" type="text"/>
    </div>
   
    </form>
   
</body>
</html>
