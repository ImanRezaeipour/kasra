<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signout.aspx.cs" Inherits="FrmPresentation.signout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript" >

        //    window.close()
        
        location.href = 'Login.aspx?Mode=SignOut'
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="display:none">
    <input type="text" id="txtSessionID" runat="server" />
    <input type="text" id="txtCompanyFinatialPeriodID" runat="server" />
    <input type="text" id="txtOnLineUserID" runat="server" />
    </div>
    </form>
</body>
</html>
