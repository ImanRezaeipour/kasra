<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="TraceResult.aspx.cs" Inherits="TAPresentation.App_Pages.SystemTrace.TraceResult" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .SelectedTabStyle
        {
            background-color: gray;
            color: White;
            border-left: 1px solid yellow;
            border-top: 1px solid yellow;
            border-right: 1px solid yellow;
            border-bottom: 1px solid gray;
        }
        .CssDataRowStyle
        {
            background-color: White;
        }
        .CssSelectedItemStyles1
        {
            background-color: #FFD599;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table scroll="no">
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            تاریخ
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalDate" runat="server" />
                        </td>
                        <td>
                            پرسنليِ
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                            کد
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbCode" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            مرحله اجرا
                        </td>
                        <td>
                            <select id="cmbStep" runat="server" name="cmbStep" style="width: 320px" class="TxtControls"
                                onchange="onChangeCmbStep()">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            قانون
                        </td>
                        <td>
                            <select id="CmbScriptName" runat="server" name="CmbScriptName" style="width: 320px"
                                class="TxtControls" onchange="onChangeCmbScriptName()">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            گروه کد
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbGroupCode" runat="server" Height="16px" Width="150px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
         <tr>
            <td>مراحل محاسبه
                <input id="txtTraceStep1" runat="server" type="text" value="" onblur="OnBlurTraceStep()" style="width: 50px" onkeydown="OnKeyDownIntTrace(this)"/> 
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table cellpadding="0" cellspacing="0" class="CssGrdStyle" width="1100px" style="border-left: 1px solid yellow;
                    border-bottom: 1px solid yellow; border-right: 1px solid yellow; border-top: 1px solid yellow;"
                    id="TBLGrdCode" bgcolor="gray">
                    <tr>
                        <td>
                            <fieldset>
                                <legend style="color: White">گزارش کدهايِ اولیه/  مرحله محاسبه از <input id="txtFirstMinTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/> تا  <input id="txtFirstMaxTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/></legend>
                                <div id="GridViewFirstCode">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="Totalpage" runat="server" />
                                            <asp:HiddenField ID="txtAlert" runat="server" />
                                            <asp:HiddenField ID="txtValidate" runat="server" />
                                            <asp:HiddenField ID="txtCurPage" runat="server" />
                                            <cc2:KasraGrid ID="GrdFirstCode" runat="server" OnRowDataBound="Grid_RowDataBoundFirstCode"
                                                AllowPaging="True">
                                            </cc2:KasraGrid>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend style="color: White">گزارش کدهايِ ساعتيِ/  مرحله محاسبه از <input id="txtTimeMinTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/> تا  <input id="txtTimeMaxTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/></legend>
                                <div id="GridViewTimeCode">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="Totalpage1" runat="server" />
                                            <asp:HiddenField ID="txtCurPage1" runat="server" />
                                            <cc2:KasraGrid ID="GrdTimeCode" runat="server" OnRowDataBound="Grid_RowDataBoundTimeCode"
                                                AllowPaging="True">
                                            </cc2:KasraGrid>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit1" EventName="click" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend style="color: White">گزارش کدهايِ روزانه/  مرحله محاسبه از <input id="txtDailyMinTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/> تا  <input id="txtDailyMaxTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/></legend>
                                <div id="GridViewDailyCode">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="Totalpage2" runat="server" />
                                            <asp:HiddenField ID="txtCurPage2" runat="server" />
                                          
                                            <cc2:KasraGrid ID="GrdDailyCode" runat="server" OnRowDataBound="Grid_RowDataBoundDailyCode"
                                                AllowPaging="True">
                                            </cc2:KasraGrid>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend style="color: White">گزارش کدهايِ دوره/  مرحله محاسبه از <input id="txtPeriodMinTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/> تا  <input id="txtPeriodMaxTrace" runat="server" type="text" value="" disabled="True" style="width: 30px;background-color: gray;height: 20px"/> </legend>
                                <div id="GridViewPeriodCode">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="Totalpage3" runat="server" />
                                            <asp:HiddenField ID="txtCurPage3" runat="server" />
                                            <cc2:KasraGrid ID="GrdPeriodCode" runat="server" OnRowDataBound="Grid_RowDataBoundPeriodCode"
                                                AllowPaging="True">
                                            </cc2:KasraGrid>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtDate" runat="server" />
                <asp:HiddenField ID="txtpersonCode" runat="server" />
                <asp:HiddenField ID="txtCode" runat="server" />
                <asp:HiddenField ID="txtTraceStep" runat="server" />
                <asp:HiddenField ID="txtScript" runat="server" />
                <asp:HiddenField ID="txtStep" runat="server" />
                <asp:HiddenField ID="txtGroupCode" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit1" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:HiddenField ID="txtOnLineUser" runat="server" />
        <input type="text" id="txtOutputFormat" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit1" runat="server" Text="BtnSubmit" OnClick="BtnSubmit1_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="BtnSubmit" OnClick="BtnSubmit3_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtCodeInfo" name="txtCodeInfo" runat="server" />
        <input type="text" id="txtXmlScript" name="txtXmlScript" runat="server" />
        <input type="text" id="txtXmlStep" name="txtXmlStep" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/SystemTrace/TraceResult.js" type="text/javascript"></script>
</asp:Content>
