<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineCardReaderModel.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.DefineCardReaderModel" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .CssNew
        {
            font-size: 8pt;
            direction: rtl;
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            border-bottom-style: groove;
            background-color: #AEC8E1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td>
                            مدل کارتخوان:
                        </td>
                        <td>
                            <input type="text" name="txtCardModel" id="txtCardModel" class="TxtControls" style="width: 100px"
                                runat="server" />
                        </td>
                        <td>
                            نوع کارتخوان:
                        </td>
                        <td>
                            <select id="CmbCardType" runat="server" class="TxtControls" style="width: 100px">
                            </select>
                        </td>
                        <td>
                            شرکت سازنده:
                        </td>
                        <td>
                            <select id="CmbMakerCo" class="TxtControls" runat="server" style="width: 150px">
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table id="XTable_header" border="0" width="950px">
                    <thead>
                        <tr>
                            <td align="center" style="width: 30px" class="CssHeaderStyle">
                            </td>
                            <td colspan="4" align="center" style="width: 300px" class="CssHeaderStyle">
                                نام مدل
                            </td>
                            <td colspan="4" align="center" style="width: 300px" class="CssHeaderStyle">
                                نوع کارتخوان
                            </td>
                            <td colspan="4" align="center" style="width: 300px;" class="CssHeaderStyle">
                                شرکت سازنده
                            </td>
                        </tr>
                    </thead>
                </table>
                <div style="height: 480px; scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                    scrollbar-base-color: #b0c4de;">
                    <table id="XTable" width="950px" onclick="onclickGrd()" ondblclick="ondblclickGrd()">
                    </table>
                </div>
            </td>
        </tr>        
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtDeleteID" name="txtDeleteID" runat="server" />
        <input type="text" id="txtSave" name="txtSave" runat="server" />
        <input type="text" id="txtIOID" name="txtIOID" runat="server" />
        <input type="text" id="txtArray" name="txtArray" runat="server" />
        <a href="../../../App_Utility/Images/Icons/btnSubNodes.gif" id="Url"></a>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtXmlAll" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div id="DivBaseNew" style="border: thin double #000000; display: none; position: absolute;
        top: 120px; left: 200px; width: 600px; height: 80px; background-color: #93B7DB;">
        <table width="100%">
            <tr>
                <td colspan="6" style="height: 5px" align="right">
                </td>
            </tr>
            <tr>
                <td>
                    نام مدل:
                </td>
                <td>
                    <input type="text" name="txtCardModelNew" id="txtCardModelNew" class="TxtControls"
                        style="width: 100px" runat="server" />
                </td>
                <td>
                    نوع کارتخوان:
                </td>
                <td>
                    <select id="CmbCardTypeNew" runat="server" class="TxtControls" style="width: 100px"
                        name="CmbCardTypeNew">
                    </select>
                </td>
                <td>
                    شرکت سازنده:
                </td>
                <td>
                    <select id="CmbMakerCoNew" class="TxtControls" runat="server" style="width: 150px"
                        name="CmbMakerCoNew">
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                </td>
                <td>
                    <input id="BtnSaveNew" onclick="onclickBtnSaveNew()" type="button" value="ذخيره"
                        style="width: 80px; cursor: pointer" class="CssHeaderStyle" />
                </td>
                <td>
                    <input id="BtnClose" onclick="onclickBtnClose()" type="button" value="بستن" style="width: 80px;
                        cursor: pointer" class="CssHeaderStyle" />
                </td>
            </tr>
        </table>
    </div>
    <div id="DivFormat" style="border: thin double #000000; display: none; position: absolute;
        top: 200px; left: 100px; width: 850px; height: 80px; background-color: #BECEE9;">
        <table width="100%">
            <tr>
                <td colspan="20" style="height: 5px" align="right">
                </td>
            </tr>
            <tr class="CssHeaderStyle">
                <td>
                    کارت کد
                </td>
                <td>
                    نام اطلاعات
                </td>
                <td>
                    کاراکتر شروع
                </td>
                <td>
                    طول
                </td>
                <td>
                    فيلدجدول
                </td>
                <td>
                    کاراکترشروع شرط
                </td>
                <td>
                    طول شرط
                </td>
                <td>
                    مقدار شرط
                </td>
                <td>
                    فرمت رشته جايگزين
                </td>
                <td>
                    مقدار جايگزين
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="checkbox" id="ChkCardCode" onclick="OnClickChkCardCode()" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtName" id="txtName" class="TxtControls" style="width: 70px"
                        runat="server" />
                </td>
                <td>
                    <input type="text" name="txtSCHK" id="txtSCHK" onkeydown="OnKeyDownInt()" class="TxtControls"
                        style="width: 70px" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtLength" id="txtLength" onkeydown="OnKeyDownInt()" class="TxtControls"
                        style="width: 70px" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtField" id="txtField" class="TxtControls" style="width: 70px"
                        runat="server" />
                </td>
                <td>
                    <input type="text" name="txtCSCHK" id="txtCSCHK" onkeydown="OnKeyDownInt()" class="TxtControls"
                        style="width: 70px" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtCLength" id="txtCLength" onkeydown="OnKeyDownInt()" class="TxtControls"
                        style="width: 70px" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtCValue" id="txtCValue" class="TxtControls" style="width: 70px"
                        runat="server" />
                </td>
                <td>
                    <input type="text" name="txtReplaceFormat" id="txtReplaceFormat" class="TxtControls"
                        style="width: 70px" runat="server" />
                </td>
                <td>
                    <input type="text" name="txtReplaceValue" id="txtReplaceValue" class="TxtControls"
                        style="width: 70px" runat="server" />
                    <div id="DivCmbCardCode" style="display: none">
                        <select id="CmbCardCode" runat="server" style="width: 70px">
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                </td>
                <td>
                    <input id="BtnFormatSave" onclick="onclickBtnFormatSaveNew()" type="button" value="ذخيره"
                        style="width: 80px; cursor: pointer" class="CssHeaderStyle" />
                </td>
                <td>
                    <input id="BtnFormatClose" onclick="onclickBtnFormatClose()" type="button" value="بستن"
                        style="width: 80px; cursor: pointer" class="CssHeaderStyle" />
                </td>
            </tr>
        </table>
    </div>

    <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/DefineCardReaderModel.js"
        type="text/javascript"></script>

</asp:Content>
