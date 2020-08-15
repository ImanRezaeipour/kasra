<%@ Page Title="----------------------------------- مشخصات گروه بندي کد ----------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="DifinitionGroupCodeNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.DifinitionGroupCodeNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .DivStyle
        {
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 300px;
            width: 400px;
        }
        .FieldsetStyle
        {
            width: 400px;
            height: 300px;
            text-align: center;
        }
        .LengedStyle
        {
            font-size: 14px;
            color: #FF0066;
            font-weight: bold;
            font-family: 'KasraB Traffic';
        }
        .TopRowStyle
        {
            display: inline;
            scrollbar-highlight-color: white;
            overflow: hidden;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #b0c4de;
            width: 900px;
            height: 200px;
        }
        .DivStyle2
        {
            overflow: auto;
            width: 330px;
            height: 270px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
            <fieldset  dir="rtl" style="border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="middle">
                                <legend style="color: #75A3D0">پارامتر فيلتر</legend>
                <table>
                    <tr>
                        <td>
                            کد :
                        </td>
                        <td>
                            <uc2:combobox id="CmbCode" runat="server" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td width="600px">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="DifinitionGroupCodeNew.aspx" />
            </td>
        </tr>
        <tr>
            <td width="600px">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        نام گروه
                                    </td>
                                    <td>
                                        <input type="text" id="txtGroupCodeName" runat="server" class="TxtControls" style="width: 220px" />
                                    </td>
                                    <td>
                                        مخفف نام گروه
                                    </td>
                                    <td>
                                        <input type="text" id="txtAcronym" runat="server" class="TxtControls" style="width: 120px" />
                                    </td>
                                    <td>
                                        <input type="checkbox" id="chkVisible" runat="server" />نمايشي
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="checkbox" id="chkSelectedCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                                        کدهاي انتخاب شده
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr1">
                        <td style="width: 900;" align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset class="FieldsetStyle">
                                        <legend><font class="LengedStyle">انتخاب کد</font></legend>
                                        <div class="DivStyle">
                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                        </div>
                                    </fieldset>
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
                                    <asp:HiddenField ID="txtXmlChecked" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr id="Tr2">
                        <td width="900px" id="TopRow" class="TopRowStyle" valign="top" align="center">
                            <fieldset class="FieldsetStyle">
                                <legend><font class="LengedStyle">کدهای انتخاب شده</font></legend>
                                <table id="XTabTable_Header" width="330px" height="26px" align="center">
                                    <thead style="display: inline" align="center">
                                        <tr>
                                            <td class="CssHeaderStyle" align="center" style="width: 20px;">
                                            </td>
                                            <td class="CssHeaderStyle" align="center" style="width: 120px">
                                                شماره کد
                                            </td>
                                            <td class="CssHeaderStyle" align="center" style="width: 230px">
                                                نام کد
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle2" align="center">
                                    <table id="grdSub" width="330px" onclick="onClickGrdSub()">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        شرح
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" runat="server" class="TxtControls"
                                            Width="480px" Height="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
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
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCode" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtSelectedCode" runat="server" />
                    <input type="text" id="txtAllowEdit" runat="server" />
                    <input type="text" id="txtCodeNo" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/DifinitionGroupCodeNew.js"
        type="text/javascript"></script>
</asp:Content>
