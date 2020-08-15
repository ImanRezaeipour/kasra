<%@ Page Title="-----------------------------------------------تغيير ساختار----------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="RequestChangeShift.aspx.cs" ValidateRequest="false" Inherits="TAPresentation.App_Pages.DataEntry.RequestChangeShift" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
        .ChangedCell
        {
            border: 1px solid green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="true"
        AsyncPostBackTimeout="40000000" runat="server">
    </asp:ScriptManager>
    <table class="TableStyle">
        <tr>
            <td>
                پرسنلي :
            </td>
            <td colspan="3">
                <uc2:ComboBox ID="CmbPerson" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                از تاريخ:
            </td>
            <td>
                <uc4:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td>
                تا تاريخ :
            </td>
            <td>
                <uc4:KCalendar ID="KCalEDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <uc3:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4" valign="top" style="text-align: center">
                <fieldset dir="rtl" style="width: 400px; height: 150px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: #78BED6">ساختارهاي موجود</legend>
                    <div class="BlueScroll" style="width: 400px; height: 190px; overflow: auto">
                        <table id="XtableHeader" cellpadding="0" width="400px" cellspacing="1">
                            <thead>
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 80px; text-align: center">
                                        &nbsp;&nbsp;تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 100%; text-align: center">
                                        ساختار&nbsp;
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <table cellpadding="0" width="400px"  cellspacing="0" id="XtableStruct">
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                توضيحات:
            </td>
            <td colspan="3">
                <asp:TextBox ID="TxtDescript" TextMode="MultiLine" Width="100%" Height="50px" CssClass="TxtControls" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <!-------------------------------------------->
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtInstance" name="txtInstance" runat="server" />
         <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <!-------------------------------------------->
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />

        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel3" EnableViewState="true" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <select id="CmbStruct" name="CmbStruct" style="width: 200px" runat="server" class="TxtControls">
                    <option></option>
                </select>
                <input type="text" id="txtXml" name="txtXml" runat="server" />
                <input type="text" id="txtSave" name="txtSave" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <script src="../../App_Utility/Scripts/DataEntry/RequestChangeShift.js" type="text/javascript"></script>
</asp:Content>
