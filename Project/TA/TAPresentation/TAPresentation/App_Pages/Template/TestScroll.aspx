<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestScroll.aspx.cs" Inherits="TAPresentation.App_Pages.TestScroll" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
        var oFullScrinFlag=0
        function SetScroll(type) {
            if (window.event.keyCode == 122) {
                if (oFullScrinFlag == 1)
                {
                    oFullScrinFlag=0
                    document.body.scroll = "yes"
                 }
                else if (oFullScrinFlag == 0) {
                    oFullScrinFlag=1
                    document.body.scroll = "no"
                }
            }
        };
    </script>
</head>
<body scroll="yes"  onkeydown="SetScroll()">
    <form id="form1" runat="server">
    <div>
    
        <input id="Button1" type="button"value="button" /></div>
    </form>
    <p>
        <input id="Text1" type="text" /></p>
</body>
</html>
