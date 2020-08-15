<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ShowMessage.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.ShowMessage" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .cssMenu
        {
            padding: 0px;
            background-color: #5777AC;
        }
        .VertGradientBlue11
        {
            border: 0px ridge #000000;
            color: black;
            background-image: url('../../App_Utility/Images/Icons/BG03.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 5%;" class="cssMenu">
    </div>
    <div>
    <div style="vertical-align: top; text-align: center;">
        <table style="width: 95%; height: 70%;" cellspacing="0" cellpadding="0" border="0">
            <tr style="height: 20px;">
                <td align="right" style="font-family: Tahoma; text-align: right; font-size: 10pt;
                    font-weight: bold;" valign="bottom">
                    <span class="VertGradientBlue11" style="width: 200px; height: 30px; text-align: center;
                        font-size: large; vertical-align: top; font-weight: bold; font-family: B Titr"
                        align="center" runat="server">
                        &nbsp;&nbsp; عنوان &nbsp;&nbsp;
                    </span>
                    <span style="width:200px"></span>
                    <span class="VertGradientBlue11" style=" height: 30px;
        width: 350px; text-align: center; font-size: large; vertical-align: middle; font-weight: bold;
        font-family: B Titr" id="TdName" runat="server">
       
    </span>
                </td>
            </tr>
            <tr bgcolor="#F2F2F2">
                <td style="border-style: groove; border-width: 1px; border-color: #000000">
                    <asp:Label ID="txtMessageSubject" runat="server" Width="100%" Height="50px" wrap="true" Style="text-align: right;
                        font-size: medium; vertical-align: top; font-weight: bold; font-family: B Titr;
                        margin: 2 2 2 2; padding: 2 2 2 2;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 20px;">
                <td align="right" valign="bottom" style="text-align: right">
                    <div class="VertGradientBlue11" style="width: 200px; height: 30px; text-align: center;
                        font-size: large; vertical-align: top; font-weight: bold; font-family: B Titr"
                        align="center" id="Div1" runat="server">
                        &nbsp;&nbsp; متن پيام &nbsp;&nbsp;
                    </div>
                </td>
            </tr>
            <tr bgcolor="#F2F2F2">
                <td style="border-top-style: groove; border-right-style: groove; border-left-style: groove; border-top-width: 1px; border-right-width: 1px; border-left-width: 1px; border-top-color: #000000; border-right-color: #000000; border-left-color: #000000">
                    <label id="txtPrivateMsg" runat="server" style="width: 100%; height: 300px; overflow: auto;
                        text-align: right; font-size: medium; vertical-align: top; font-weight: bold;
                        font-family: B Titr">
                    </label>
                </td>
            </tr>
            <tr bgcolor="#F2F2F2" style="height:30px">
                <td style="border-right-style: groove;  border-left-style: groove; border-right-width: 1px; border-left-width: 1px; border-right-color: #000000; border-left-color: #000000">
                <br style="font-size:3px" />
                    <input type="button" class="CssHeaderStyle" style="font-weight: bold;
                        font-family: B Titr;font-size:14px; cursor: hand;width:120px;" value="تاييد" onclick="OnClickBtnOk()" id="Img2" dir="ltr" />
                     
                </td>
            </tr> 
            <tr bgcolor="#F2F2F2"><td style="border-right-style: groove; border-bottom-style: groove; border-left-style: groove; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-color: #000000; border-bottom-color: #000000; border-left-color: #000000"> <br style="font-size:3px" />   <span>
                      لطفا پس از خواندن پيام ، دکمه تاييد را کليک کنيد  <br style="font-size:3px" />
                      </span> </td></tr>           
        </table>
    </div>
        <div style="display: none">
            <cc1:MySecurity ID="OnLineUser" runat="server">
            </cc1:MySecurity>
            <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                runat="server" />
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
            <input type="text" id="txtFromPersonID" name="txtFromPersonID" runat="server" />
            <input type="text" id="txtMessages" name="txtMessages" runat="server" />
            <input type="text" id="txtToPersonID" name="txtToPersonID" runat="server" />
        </div>
    </div>
    <script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/DataEntry/ShowMessage.js">
       
    </script>
</asp:Content>
