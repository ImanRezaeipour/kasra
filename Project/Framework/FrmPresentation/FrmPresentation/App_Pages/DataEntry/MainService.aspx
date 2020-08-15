<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainService.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.MainService" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <table >
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <input id="Upload" runat="server" name="Upload" type="file"/></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Comment" runat="server" BorderColor="Silver" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button" runat="server" BorderColor="Silver" 
                        BorderStyle="Groove" OnClick="OnUpload" 
                        Text="Upload" 
                        Width="80px" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="BtnSave" runat="server" BorderColor="Silver" 
                        BorderStyle="Groove" 
                        Text="Save" 
                        Width="80px" onclick="SaveFiles" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="BtnRead" runat="server" BorderColor="Silver" 
                        BorderStyle="Groove"  
                        Text="Read" 
                        Width="80px" onclick="ReadFile" />
                </td>
            </tr>
        </table>
    
        </div>
    </form>
</body>
</html>
