<%@ Page Title="========================================================================گزارش کارانه=================================================================" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneGenerator.aspx.cs" ValidateRequest="false" Inherits="FrmPresentation.App_Pages.Karane.KaraneGenerator" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc4" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .CssSumItemStyle
    {
	    direction: rtl;
	    color: #FFFF00;
	    background-color: #006699;
	    cursor: default;
	    text-decoration: none;
    }
    .DivStyle1
    {
        border: thin groove #000000;
        background-color: #C5D5E9;
        scrollbar-hightlight-color: white;
        overflow: auto;
        scrollbar-arrow-color: black;
        scrollbar-base-color: #B1D3FF;
        height: 455px;
        width: 1300px;
        float: center;
        clear: right;
        clip: rect(auto, auto, auto, auto);
    }
    .GrdTxtControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#FFCCFF;
    }
     .GrdTxtSaveControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#D1FFC1;
    }
    .GrdTxtDisableControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color: #DDDDDD;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%"  >
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="right">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                دوره :
                            </td>
                            <td>
                                <select id="CmbWorkPeriod" name="CmbWorkPeriod" style="width: 120px" onkeydown="OnKeyEnter(this)"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td id="tdPerson">
                                <input id="RDPerson" style="display: none" type="radio" name="RDFilter" checked value="0" />
                                پرسنلي :
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td id="TDGroupName">
                                گروه :
                            </td>
                            <td id="TDGroup">
                                <select id="CmbGroup" runat="server" class="TxtControls" style="width: 170px">
                                </select>
                            </td>
                            <td>
                                <input id="RDDepartment" style="display: none" type="radio" name="RDFilter" value="2" />
                                واحد سازماني :
                            </td>
                            <td id="TDNewCombo">
                                <uc4:MultiPerson ID="MultiDepartment" runat="server" />
                            </td>
                            <td id="TDOldCombo" style="display: none">
                                <uc3:MultiDepartment ID="UCDepartment" runat="server" />
                            </td>
                            <td id="TDCHKChildren">
                                <input type="checkbox" id="chkChildren" runat="server" />
                            </td>
                            <td id="TDChildren">
                                پرسنل زیر مجموعه
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
            <td id="tdGrid" align="right" valign="top" colspan="2">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <asp:HiddenField ID="txtStatusID" runat="server" />
                        <asp:HiddenField ID="txtCNameNature" runat="server" />
                        <asp:HiddenField ID="txtDocID" runat="server" />
                        <asp:HiddenField ID="txtDocTypeID" runat="server" />
                        <asp:HiddenField ID="txtConfirmStatus" runat="server" />
                        <asp:HiddenField ID="txtXMLJsScriptMember" runat="server" />
                        <asp:HiddenField ID="txtJsScript"  runat="server" />
                        <div id="GridViewCountainer" class="DivStyle1" align="right">
                            <cc2:KasraGrid ID="GrdKaraneReport" runat="server" OnRowDataBound="Grid_RowDataBound" 
                            AllowSendToPDF="true"  AllowSendToExcel="true">
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
    <script src="/FrmPresentation/App_Utility/Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <div id="DivDesc" style="background-color: White; border: 2px solid Black; display: inline;
        position: absolute; top: 200; left: 200;">
        <table cellpadding="0" cellspacing="0">
            <tr style="background-color: Black; height: 10px">
                <td style='width: 17px; height: 10px'>
                    <img src="/FrmPresentation/App_Utility/Images/Icons/close1.png" style="background-color: Black;"
                        onclick="onclickBtnCloseDesc()" width="15px" height="15px" />
                </td>
                <td style="width: 150px; background-color: Black; color: White">
                    -------توضيحات-------
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <asp:TextBox ID="txtDescript" CssClass="TxtControls" onblur="onblurtxtDescript()"
                        Width="167" Height="150" TextMode="MultiLine" Wrap="true" Style="direction: rtl"
                        runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtPCodeTemp" name="txtPCodeTemp" runat="server" />
        <input type="text" id="txtMemberID" name="txtMemberID" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtMName" name="txtMName" runat="server" />
        <input type="text" id="txtMType" name="txtMType" runat="server" />
        <input type="text" runat="server" id="txtMenuItemID" />
        <input type="text" runat="server" id="txtOnLineUser" />
        <input type="text" runat="server" id="txtReportID" />
        <input type="text" runat="server" id="txtWPID" />
        <input type="text" runat="server" id="SDate" />
        <input type="text" runat="server" id="EDate" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtGridName" name="txtGridName" runat="server" />
        <input type="text" id="txtGridID" name="txtGridID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />    
        <input type="text" id="txtConfirm" name="txtConfirm" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtCreator" name="txtCreator" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
        <input type="text" id="txtChkChildren" name="txtChkChildren" runat="server" />
        <input type="text" id="txtKaraneComboboxOption" name="txtKaraneComboboxOption" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/JsTemplate/Karane/KaraneGenerator.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Karane/KaraneGenerator.js?vs=1.2" type="text/javascript"></script>
</asp:Content>

