<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="ValidPersonCardReader.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.ValidPersonCardReader" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register src="../../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 
        { 
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="600" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 70px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: lightblue">آيتم هاي جستجو</legend>
                    <table class="style1">
                        <tr>
                            <td>
                                شماره پرسنلي:
                            </td>
                            <td>
                                <%--<ComponentArt:ComboBox ID="CmbPerson" runat="server" Width="200" Style="font-size: medium;
                                    font-weight: bold" TextBoxEnabled="true" RunningMode="CallBack" AutoHighlight="false"
                                    AutoComplete="true" AutoFilter="true" DataTextField="DisplayName" DataFields="PersonCode,DisplayName"
                                    CssClass="comboBox" HoverCssClass="comboBoxHover" BorderColor="#528bc5" FocusedCssClass="comboBoxHover"
                                    TextBoxCssClass="TxtControls" TextBoxHoverCssClass="comboTextBoxHover" DropDownCssClass="comboDropDown"
                                    ItemClientTemplateId="itemTemplate" ItemCssClass="comboItem" ItemHoverCssClass="comboItemHover"
                                    SelectedItemCssClass="comboItemHover" DropHoverImageUrl="../../../App_Utility/Images/Icons/Down.gif"
                                    DropImageUrl="../../../App_Utility/Images/Icons/Down.gif" DropDownPageSize="10"
                                    DropDownWidth="300" OnDataRequested="ComboBox1_DataRequested" FilterField="PersonCode">
                                    <ClientTemplates>
                                        <ComponentArt:ClientTemplate ID="itemTemplate">
                                            <table border="1" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ece8f0">
                                                <tr class="dataRow">
                                                    <td class="dataCell" align="center" style="width: 100px;">
                                                        ## DataItem.getProperty('PersonCode') ##
                                                    </td>
                                                    <td class="dataCell">
                                                        ## DataItem.getProperty('DisplayName') ##&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                    </ClientTemplates>
                                    <DropDownHeader>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#cbd5de"
                                            border="1">
                                            <tr class="headingRow">
                                                <td class="headingCell" align="center" style="width: 100px;">
                                                    کد پرسنل
                                                </td>
                                                <td class="headingCell" align="center">
                                                    نام پرسنل
                                                </td>
                                            </tr>
                                        </table>
                                    </DropDownHeader>
                                </ComponentArt:ComboBox>--%>
                                <uc3:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                علت:
                            </td>
                            <td>
                                <select id="CmbCause" name="CmbCause" style="width: 100px" runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                از تاريخ:
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalSDate" runat="server" />
                                &nbsp;
                            </td>
                            <td>
                                تا تاريخ:
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalEDate" runat="server" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                فعاليت:
                            </td>
                            <td>
                                <select id="CmbAction" name="CmbAction" style="width: 150px" runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td colspan="4">
                                <input id="RadHard" type="checkbox" onclick="ChangeActionCombo()" name="limitedType"
                                    checked />
                                سخت افزاري&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="RadSoft" type="checkbox" onclick="ChangeActionCombo()" name="limitedType"
                                    checked />
                                نرم افزاري
                            </td>
                            <td>
                                گروه کارتخوان:
                            </td>
                            <td>
                                <select id="CmbCardReader" name="CmbCardReader" style="width: 100px" runat="server"
                                    class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="border: medium groove #C0C0C0; background-color: #C5D5E9; height: 400px"
                valign="top">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtSortExpression" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtSortDirection" runat="server" />
        <input type="text" id="txtOldSortExpression" runat="server" />
        <input type="text" id="txtHeaderIndex" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
        <!------------------------------------------------------------------------------>
        <input type="text" id="txtCauseIDTmp" name="txtCauseIDTmp" runat="server" />
        <input type="text" id="txtValidTypeTmp" name="txtValidTypeTmp" runat="server" />
        <input type="text" id="txtActionIDTmp" name="txtActionIDTmp" runat="server" />
        <input type="text" id="txtCardGroupTmp" name="txtCardGroupTmp" runat="server" />
        <input type="text" id="txtPersonCodeTemp" name="txtPersonCodeTemp" runat="server" /> 
         <input type="text" id="txtXMLDel" name="txtXMLDel" runat="server" />
          <input type="text" id="txtXML" name="txtXML" runat="server" />
    </div>

    <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/ValidPersonCardReader.js"
        type="text/javascript"></script>

</asp:Content>
