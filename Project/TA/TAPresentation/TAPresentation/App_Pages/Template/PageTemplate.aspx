<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageTemplate.aspx.cs" Inherits="TAPresentation.App_Pages.Template.PageTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="margin: 0px" scroll="yes" dir="rtl">
    <form id="form1" runat="server" style="margin: 0px">
       <div style=" padding: 0px; margin: 0px; background-color: #9999FF; width: 100%; height: 543px;" 
           dir="rtl">
           
            <asp:Panel ID="FilterPanel" runat="server">
            </asp:Panel>
            <asp:Panel ID="AdvanceFilterPanel" runat="server">
            </asp:Panel>
            <asp:Panel ID="ToolbarPanel"  runat="server">
                <table>
                    <tr>
                        <td align="right">
                            <table id="PaginTable" border="0" cellpadding="1" cellspacing="1" dir="rtl" 
                                style="WIDTH: 307px; HEIGHT: 40px">
                                <tr>
                                    <td>
                                        <asp:Button ID="LastBtn" runat="server" BackColor="Transparent" 
                                            BorderColor="Transparent" BorderStyle="None" Height="31px" onclick="LastBtn_Click" Text="Last" ToolTip="آخرين" 
                                            Width="27px" />
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="NextBtn" runat="server" BackColor="Transparent" 
                                            BorderColor="Transparent" BorderStyle="None" Height="26px" onclick="NextBtn_Click" Text="Next" ToolTip="بعدي" Width="30px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="PrevBtn" runat="server" BackColor="Transparent" 
                                            BorderColor="Transparent" BorderStyle="None" Height="27px" onclick="PrevBtn_Click" Text="Pre" ToolTip="قبلي" Width="21px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="FirstBtn" runat="server" BackColor="Transparent" 
                                            BorderColor="Transparent" BorderStyle="None" Height="31px" onclick="FirstBtn_Click" Text="First" ToolTip="اولين" 
                                            Width="26px" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label>
                                        تا
                                        <asp:Label ID="lblTo" runat="server" Text=""></asp:Label>
                                        از
                                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="GridPanel" runat="server">
            </asp:Panel>
           
       </div>
        <div style="display: none"> 
            <asp:TextBox ID="CurPage" runat="server" BackColor="White" BorderStyle="Groove" 
                CssClass="txtControls" Height="20px" ontextchanged="CurPage_TextChanged" 
                Visible="False" Width="16px">
            </asp:TextBox>
            <asp:TextBox ID="Totalpage" runat="server" BackColor="White" 
                BorderStyle="Groove" CssClass="txtControls" Height="20px" ReadOnly="True" 
                Visible="False" Width="16px">
            </asp:TextBox>
        </div>
    </form>
</body>

</html>
