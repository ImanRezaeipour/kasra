<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectPerson.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.SelectPerson"
    MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"
    Title=".....................................انتخاب پرسنل................................." %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table scroll="no">
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 750px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                            <table style="width: 100%">
                                <tr>
                                    <td align="right" style="width: 3%" style="text-align: right">
                                        <nobr>پرسنلی :</nobr>
                                    </td>
                                    <td align="right" style="width: 47%" style="text-align: right">
                                        <asp:DropDownList ID="CmbPersonCodeSearch" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtPersonCode" onkeydown="OnKeyDownInt(this)" type="text" runat="server"
                                            dir="rtl" style="width: 108px" class="TxtControls" />
                                    </td>
                                    <td align="right" style="width: 10%" style="text-align: right">
                                        <nobr>نام خانوادکی و نام:</nobr>
                                    </td>
                                    <td align="right" style="width: 40%" style="text-align: right">
                                        <asp:DropDownList ID="cmbPersonNameSearch" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtPersonName" type="text" runat="server" dir="rtl" style="width: 100px"
                                            class="TxtControls" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 3%" style="text-align: right">
                                        <nobr>کد واحد سازماني :</nobr>
                                    </td>
                                    <td style="width: 47%" style="text-align: right">
                                        <uc2:ComboBox ID="CmbCodeDepts" runat="server" />
                                    </td>
                                    <td align="right" style="width: 10%" style="text-align: right">
                                        <nobr> نام واحد سازمانی:</nobr>
                                    </td>
                                    <td align="right" style="width: 40%" style="text-align: right">
                                        <asp:DropDownList ID="cmbDeptsNameSearch" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtDeptsName" type="text" runat="server" dir="rtl" style="width: 100px"
                                            class="TxtControls" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="text-align: right">
                                        <nobr> کد سمت :</nobr>
                                    </td>
                                    <td align="right" style="text-align: right">
                                        <asp:DropDownList ID="cmbRoleCodeSearch" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtRoleCode" type="text" runat="server" dir="rtl" style="width: 108px"
                                            class="TxtControls" />
                                    </td>
                                    <td align="right" style="text-align: right">
                                        نام سمت :
                                    </td>
                                    <td align="right" style="text-align: right">
                                        <asp:DropDownList ID="cmbRoleSearch" runat="server" Width="100px" class="TxtControls">
                                            <asp:ListItem Selected="True">شروع شود با</asp:ListItem>
                                            <asp:ListItem>برابر</asp:ListItem>
                                            <asp:ListItem>مخالف</asp:ListItem>
                                            <asp:ListItem>داراي</asp:ListItem>
                                        </asp:DropDownList>
                                        <input id="txtRole" type="text" runat="server" dir="rtl" style="width: 100px" class="TxtControls" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="text-align: right">
                                        گروه :
                                    </td>
                                    <td align="right" style="text-align: right">
                                        <asp:DropDownList ID="cmbGroup" runat="server" Width="210px" class="TxtControls">
                                        </asp:DropDownList>
                                        <input id="BtnShowGroup" name="BtnShowGroup" class="CssHeaderStyle" onclick="onClickselectGroup()"
                                            style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." />
                                    </td>
                                    <td colspan="2" align="right" style="text-align: right">
                                        <input id="rdbSemat" runat="server" name="semat" type="radio" checked="true" />دارای
                                        سمت
                                        <input id="rdbNoSemat" runat="server" name="semat" type="radio" />
                                        بدون سمت
                                        <br /><br />
                                       <center><span style="color:Red;font-weight:bold">لطفا جستجو کنيد</span></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="text-align: right">
                                        کد کارت:
                                    </td>
                                    <td align="right" style="text-align: right">
                                        <input id="txtCardNO" type="text" runat="server" dir="rtl" style="width: 100px" class="TxtControls" />
                                    </td>
                                    <td>
                                      <%--  <input type="checkbox" id="chkAll" name="chkAll" onclick="OnClickBtnChkAllPage(this)" runat="server" />
                                        انتخاب همه--%>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 406px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtPersonFlag" runat="server" />
                                        <asp:HiddenField ID="txtShowFlag" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtSearchFlag" runat="server" />
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="hdnPersonCode" runat="server" />
                                        <asp:HiddenField ID="hdnPersonName" runat="server" />
                                        <asp:HiddenField ID="hdnDepartment" runat="server" />
                                        <asp:HiddenField ID="hdnRoleCodeType" runat="server" />
                                        <asp:HiddenField ID="hdnDepartmentType" runat="server" />
                                        <asp:HiddenField ID="hdnGroupID" runat="server" />
                                        <asp:HiddenField ID="hdnPage" runat="server" />
                                    </div>
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
                    <asp:HiddenField ID="txtOnLineUser" runat="server" />
                    <input type="text" id="txtOutputFormat" runat="server" />
                    <input type="text" id="txtHidden" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtTmpPersonCode" name="txtTmpPersonCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtMode" name="txtMode" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtMenuItemID" name="txtMenuItemID" runat="server" />
                    <input type="text" id="txtXmlGroup" name="txtXmlGroup" runat="server" />
                    <input type="text" id="txtChkGroup" name="txtChkGroup" runat="server" />
                    <input type="text" id="txtIDParent" name="txtIDParent" runat="server" />
                    <input type="text" id="txtCheckAllMode" name="txtIDParent" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../../App_Utility/Scripts/BaseInfo/Person/SelectPerson.js?v=1.5"
        type="text/javascript"></script>
</asp:Content>
