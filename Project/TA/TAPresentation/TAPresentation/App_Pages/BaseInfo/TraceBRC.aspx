<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="TraceBRC.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.TraceBRC" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fieldsetStyle
        {
            width: 100%;
            height: 60px; 
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6
        }
        .btnNextStyle
        {
            cursor: pointer;
            background-image: url('../../App_Utility/Images/Icons/Right.gif');
            width: 20px
        }
        .btnPrevStyle
        {
            cursor: pointer; 
            background-image: url('../../App_Utility/Images/Icons/Left.gif');
            width: 20px;
        }
        .DivStyle
        {
            width: 1250px; 
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 180px; 
            float: right; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="1250">
        <tr>
            <td align="right">
                <fieldset dir="rtl"  class="fieldsetStyle" 
                    align="right">
                    <legend class="legendStyle" >Å«—«„ — Â«Ì Ã” ÃÊ</legend>
                    <table width="50%" align="right">
                        <tr>
                            <td align="right">
                                 «—ÌŒ :
                            </td>
                            <td align="right">
                                <uc3:KCalendar ID="KCalDate" runat="server" />
                            </td>
                            <td align="right">
                                Å—”‰·Ì :
                            </td>
                            <td align="right">
                                <uc4:ComboBox ID="cmbPersonCode" runat="server" />
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td width="100px">
                            <input type="button" runat="server" id="btnNext1" class="btnNextStyle" onclick="onClickNextStep()" />
                        </td>
                        <td width="100px" align="center">
                            <input type="text" runat="server" class="TxtControls"  style="width: 30px" id="txtStep" />
                        </td>
                        <td width="100px">
                            <input type="button" runat="server" id="btnPrev1" class="btnPrevStyle" onclick="OnClickPrevStep()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" width="1100px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="Div1" runat="server" class="DivStyle" 
                            align="center">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnFilter" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td width="100px">
                            <input type="button" runat="server" id="btnNext2" class="btnNextStyle"  onclick="onClickNextStep2()" />
                        </td>
                        <td width="100px" align="center">
                            <input type="text" runat="server" style="width: 30px"  class="TxtControls" id="txtStep2" />
                        </td>
                        <td width="100px">
                            <input type="button" runat="server" id="btnPrev2" class="btnPrevStyle" onclick="OnClickPrevStep2()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" width="1100px">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="Div2" runat="server" class="DivStyle" 
                            align="center">
                            <asp:PlaceHolder ID="Grid2" runat="Server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnFilter" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display:none" >
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                     <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
                     <asp:Button ID="BtnFilter" runat="server" Text="BtnFilter" OnClick="BtnFilter_Click" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtTraceStepID" name="txtTraceStepID" runat="server" />
                     <input type="text" id="txtTraceStepID2" name="txtTraceStepID2" runat="server" />
                    <input type="text" id="txtKCalDate" name="txtKCalDate" runat="server" />
                    <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
                     <input type="text" id="txtMaxTraceStepID" name="txtmaxTraceStepID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
     <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/TraceBRC.js"
        type="text/javascript"></script>
</asp:Content>

