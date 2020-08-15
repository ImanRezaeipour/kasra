<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ReportPolicyNew.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportPolicyNew"
    ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/CodeCondition/CodeCondition.ascx" TagName="CodeCondition"
    TagPrefix="uc5" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <style>
        .Cssfieldset
        {
            border-right: lightblue thin inset;
            border-top: lightblue thin solid;
            border-left: lightblue thin outset;
            border-bottom: lightblue thin solid;
        }
        #txtDesc
        {
            width: 250px;
            height: 55px;
        }
        .CssScroll
        {
            scrollbar-highlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #b0c4de;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width:80%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ReportPolicyNew.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset style="width: 710px; height: 30px;" class="Cssfieldset">
                    <legend style="color: #75A3D0">اطلاعات سياست گزاري</legend>
                    <div style="float: right;; text-align: left">
                        نام سياست گزاري : 
                    </div>
                    <div style="float: right;; text-align: left">
                        <input id="txtName" style="width: 201px;" type="text" runat="server"  class="txtControls" />
                    </div>
                    <div style="float: right; text-align: left">
                        شرح : 
                    </div>
                    <div style="float: right; text-align: right;">
                    <textarea id="txtDescr" style=" width: 329px;height: 68px;" runat="server" name="txtDescr"></textarea>
                        </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
            
                <fieldset style="width: 710px; height: 260px;" class="Cssfieldset">
                    <legend style="color: #75A3D0">اطلاعات گزارش</legend>
                    <div style="float: right; width: 16%; text-align: left">
                        نام گزارش :
                    </div>
                    <div style="float: right; width: 10%; text-align: left">
                        <select id="cmbReport" class="txtControls" style="width: 338px" runat="server" 
                            onchange="OnChangeCmbReport(this)">
                            <option></option>
                        </select>
                    </div>
                    <br></br>
                    <div style="float: center; width: 100%; text-align: center">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                            <input id="txtMenuItemID" type="hidden" runat="server" /> 
                                <div id="GridViewCountainer" style="vertical-align: top; float: center; width: 500px;
                                    height: 190px" align="center">
                                    <cc2:KasraGrid ID="GrdParameter" runat="server" OnRowDataBound="GrdParameter_RowDataBound">
                                    </cc2:KasraGrid>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset style="width: 710px; height: 30px;" class="Cssfieldset">
                    <legend style="color: #75A3D0">دريافت کنندگان </legend>
                    <table id="Table24" cellspacing="0" cellpadding="0" align="center" border="0" style="width: 100%;">
                        <tr>
                            <td valign="top" style="width: 30%" align="left">
                                <div style="float: right; width: 100%; text-align: right">
                                    <input id="rdbCreator" runat="server" name="rec" type="radio" />
                                    شخص تعريف کننده
                                </div>
                                <div style="float: right; width: 100%; text-align: right">
                                    <input id="rdbPersonel" runat="server" name="rec" type="radio" checked />
                                    پرسنل خاص
                                </div>
                            </td>
                            <td style="width: 50%" valign="top" align="center">
                                <div style="width: 291px;" align="right">
                                    <table id="reciever_Header">
                                        <tr>
                                            <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" checked>
                                            </td>
                                            <td class="CssHeaderStyle" style="width: 60px">
                                                شماره
                                            </td>
                                            <td class="CssHeaderStyle" style="width: 250px">
                                                نام
                                            </td>
                                            <td class="CssHeaderStyle" style="width: 40px">
                                                نوع
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="width: 291px; height: 200px;" class="CssScroll" align="right">
                                    <table id="reciever">
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input id="txtSaveXml" type="hidden" runat="server" />
            <input id="txtAlert" type="hidden" runat="server" />
            <input id="txtPolicyID" type="hidden" runat="server" />            
            <input id="txtValidate" type="hidden" runat="server" />                        
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtCompanyID" name="EDate" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSchedulingID" name="txtSchedulingID" runat="server" />
        <input type="text" id="txtXmlMember" name="txtXmlMember" runat="server" />
    </div>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/ReportPolicyNew.js"></script>
</asp:Content>
