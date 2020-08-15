<%@ Page Title="---------------------------------------------------------------------------------------انتخاب مشمولين/ غير مشمولين--------------------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true"
    CodeBehind="GroupMemberIncluded.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.GroupMemberIncluded" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 292px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">مشمولين</legend>
                                <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                                    <tr>
                                        <td valign="top">
                                            <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkAllPK" onclick='OnClickchkAllPK(this)' type="checkbox" runat="server" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            کليه پرسنل
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TRAllCardRest" style="display: none">
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkAllCardRest" onclick='OnClickchkAllRestCard(this)' type="checkbox"
                                                            runat="server" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            کليه کارتهاي متفرقه رستوارن
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkEPK" runat="server" onclick='OnClickchkEPK(this)' type="checkbox" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل زير مجموعه
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDD">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson" runat="server" name="GroupChk" type="radio" checked />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDC">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbCard" runat="server" name="GroupChk" type="radio" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            نمايش کارتهای متفرقه رستوران
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="TDT">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbOfficeTb" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            دفتر تابل
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="GroupMember_Header" style="width: 275px;">
                                                <tr>
                                                    <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                        <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                            type="checkbox" name="chkAll">
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        شماره
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                                <table align="center" id="GroupMember" style="width: 275px;">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <fieldset dir="rtl" style="width: 500px; height: 292px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: #FF0066">غير مشمولين</legend>
                                <table id="Table3" cellspacing="0" cellpadding="0" align="center" border="0">
                                    <tr>
                                        <td valign="top">
                                             <table id="Table4" cellspacing="1" cellpadding="1" border="0">
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkAllPK1" onclick='OnClickchkAllPK1(this)' type="checkbox" runat="server"/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            کليه پرسنل
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="chkEPK1" runat="server" onclick='OnClickchkEPK1(this)'  type="checkbox" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل زير مجموعه
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDD1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbDepartment1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 160px">
                                                        <div align="right">
                                                            واحد سازماني
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDG1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbGroup1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            گروه خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDP1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbPerson1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            پرسنل خاص
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TDC1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbCard1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)'/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            نمايش کارتهای متفرقه رستوران
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="Tr1">
                                                    <td style="width: 22px" align="center">
                                                        <input id="rdbOfficeTb1" runat="server" name="GroupChk1" type="radio" onclick='OnClickrdb1(this)' />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            دفتر تابل
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="GroupMember_Header1" style="width: 275px;">
                                                <tr>
                                                    <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                        <input id="chkAll1" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                            type="checkbox" />
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        شماره
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                        نام
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                        نوع
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                                <table align="center" id="GroupMember1" style="width: 275px;">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width: 500" align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtSDate" runat="server" />
                                    <asp:HiddenField ID="txtEDate" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtGroupMemberXML" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
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
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                     <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtID" runat="server" />
                    <input type="text" id="txtXML" runat="server" />
                    <input type="text" id="txtTypeView" runat="server" />
                    <input type="text" id="txtSystemID" runat="server" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id="txtAcronym" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/DataEntry/GroupMemberIncluded.js" type="text/javascript"></script>
</asp:Content>

