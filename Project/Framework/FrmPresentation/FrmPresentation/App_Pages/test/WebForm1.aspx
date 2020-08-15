<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FrmPresentation.App_Pages.test.WebForm1" %>

<%@ Register src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" tagname="MultiDepartment" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <uc1:MultiDepartment ID="MultiDepartment1" runat="server" />
   
    </form>
</body>
</html>
