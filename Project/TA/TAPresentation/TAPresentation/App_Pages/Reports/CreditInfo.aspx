<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CreditInfo.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.CreditInfo"
    Title="-----------------------------------------------------مجوز---------------------------------------------------------------"
    ValidateRequest="false" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td align="center" id="TDPersonInfo" style="display: none">
                <table id="Table1" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; width: 444px; border-bottom: lightblue thin solid;
                    height: 29px" cellspacing="1" cellpadding="1" align="center" border="0">
                    <tr>
                        <td class="style2">
                            شماره پرسنلي:
                        </td>
                        <td id="PersonIDTD" style="width: 60px; color: #ff0000" runat="server">
                            &nbsp;
                        </td>
                        <td class="style1">
                            نام پرسنل:
                        </td>
                        <td id="NameTD" style="color: #ff0000" runat="server">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%">
            <td align="center" id="TDTopRow">
                <table style="height: 25px;">
                    <tr>
                        <td>
                            شماره پرسنلي:
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPersonelInfo" runat="server" />
                        </td>
                        <%-- <td>
                            نام و نام خانوادگي:
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <contenttemplate>
                                    <input id="PersonNameSearch" runat="server" name="PersonNameSearch" style="width: 115px"
                                        class="TxtControls" type="text" /><input id="ImgRefreshPersonSearch" name="ImgRefreshPersonSearch"
                                            onclick="onClickImgRefreshPersonSearch()" style="width: 25px; cursor: pointer; height: 22px;"
                                            class="HeaderStyle" type="button" value="..." />
                                </contenttemplate>
                                <triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                </triggers>
                            </asp:UpdatePanel>
                        </td>--%>
                        <td>
                            گروه مجوز:
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbGroup" onchange="OnChangeCmbGroup()"
                                runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            نوع مجوز:
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbType" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            از تاريخ:
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSD" runat="server" />
                        </td>
                        <td>
                            تا تاريخ:
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalED" runat="server" />
                        </td>
                        <td>
                            گروه پرسنلي
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbPerson" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" id="TDToolbar" style="width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 100%;">
                            <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <input id="txtAlert" runat="server" type="text" />
                            <input id="txtValidate" runat="server" type="text" />
                        </div>
                        <div id="DivGrd" runat="server" align="center">
                            <cc2:KasraGrid ID="GrdCredit" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:mysecurity id="OnLineUser" runat="server">
        </cc1:mysecurity>
        <input id="txtPersonCode" runat="server" type="text" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtXMLCredite" name="txtXMLCredite" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtGrdHeight" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtWPID" name="txtFlagAccess" runat="server" />
        <input id="txtSDate" name="txtSDate" type="text" runat="server" />
        <input id="txtEDate" name="txtEDate" type="text" runat="server" />
        <input id="txtPageMode" name="txtPageMode" type="text" runat="server" />
        <input id="txtCreditID" name="txtPageMode" type="text" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtDelAccess" name="txtDelAccess" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/Reports/CreditInfo.js"
        type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 65px;
        }
        .style2
        {
            width: 97px;
        }
    </style>
</asp:Content>
