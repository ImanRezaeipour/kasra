<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineCardReaderFormatValue.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.DefineCardReaderFormatValue"
    Title="Untitled Page" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                &nbsp;مدل کارتخوان:
                            </td>
                            <td>
                                <input id="txtCardReaderModel" class="TxtControls" type="text" />
                            </td>
                            <td>
                                نوع کارتخوان:
                            </td>
                            <td>
                                <select id="CmbCardType" name="CmbCardType" style="width: 150px" class="TxtControls"
                                    runat="server">
                                    <option></option>
                                </select>&nbsp;
                            </td>
                            <td>
                                شرکت سازنده:
                            </td>
                            <td>
                                <select id="CmbBrand" name="D2" style="width: 120px" class="TxtControls" runat="server">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                رشته:
                            </td>
                            <td>
                                <input id="txtFormat" class="TxtControls" type="text" />
                            </td>
                            <td>
                                کد:
                            </td>
                            <td>
                                <select id="CmbCode" name="D3" style="width: 150px" class="TxtControls" runat="server">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
            <td style="border: medium groove #C0C0C0; background-color: #C5D5E9;">
                <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                    scrollbar-base-color: #b0c4de; height: 400px;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtPageSize" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtOrderString" runat="server" />
                            <asp:HiddenField ID="CurPage" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
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
        <input type="text" id="txtID" name="txtID" runat="server" />
        <!---------------------------------------------------------------------->
        <input type="text" id="txtModelTemp" name="txtModelTemp" runat="server" />
        <input type="text" id="txtTypeTemp" name="txtTypeTemp" runat="server" />
        <input type="text" id="txtBrandTemp" name="txtBrandTemp" runat="server" />
        <input type="text" id="txtFormatTemp" name="txtFormatTemp" runat="server" />
        <input type="text" id="txtCodeTemp" name="txtCodeTemp" runat="server" />
    </div>
    <div id="DivFormatValue" style="border: thin double #000000; display: none; position: absolute;
        top: 200px; left: 100px; width: 700px; height: 80px; background-color: #BECEE9;">
        <table width="100%">
            <tr>
                <td colspan="5" style="height: 5px" align="right">
                </td>
            </tr>
            <tr class="CssHeaderStyle">
                <td>
                    نام مدل کارتخوان
                </td>
                <td>
                    نوع
                </td>
                <td>
                    شرکت سازنده
                </td>
                <td>
                    رشته
                </td>
                <td>
                    کد
                </td>
            </tr>
            <tr>
                <td align="center" id="TDCardModel">
                </td>
                <td id="TDType">
                </td>
                <td id="TDFactory">
                </td>
                <td id="TDFormat">
                </td>
                <td>
                    <select id="CmbCodeNew" name="CmbCodeNew" style="width: 120px" class="TxtControls"
                        runat="server">
                        <option></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
                <td>
                    <input id="BtnFormatSave" onclick="onclickBtnFormatSaveNew()" type="button" value="ذخيره"
                        style="width: 80px" class="CssHeaderStyle" />
                </td>
                <td>
                    <input id="BtnFormatClose" onclick="onclickBtnFormatClose()" type="button" value="بستن"
                        style="width: 80px" class="CssHeaderStyle" />
                </td>
            </tr>
        </table>
    </div>

    <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/DefineCardReaderFormatValue.js"
        type="text/javascript"></script>

</asp:Content>
