<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="FrmPresentation.App_Pages.PageMain.TestPage" %>

<%@ Register src="../../App_Utility/PersonCombo/PersonCombo.ascx" tagname="PersonCombo" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <uc4:PersonCombo ID="dd" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    </form>
</body>
</html>
