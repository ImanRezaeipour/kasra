<%@ Page Title="======================انتخاب مشمولين============================" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="CreditScriptGroup.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.CreditScriptGroup" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="93%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table  width="93%" class="DivStyle">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                    <tr>
                        <td valign="top">
                            <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                <tr>
                                    <td style="width: 22px" align="center">
                                        <input id="chkAllPK" type="checkbox" runat="server" onclick='OnClickchkAllPK(this)' />
                                    </td>
                                    <td>
                                    </td>
                                   
                                     <td  id="TDchkAllPK">
                                        <div align="right">
                                            کليه پرسنل
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 22px" align="center">
                                        <input id="chkEPK" runat="server" type="checkbox" onclick='OnClickchkEPK(this)' />
                                    </td>
                                    <td>
                                    </td>
                                    <td id="TDchkEPK">
                                        <div align="right">
                                            پرسنل زير مجموعه
                                        </div>
                                    </td>
                                </tr>
                                <tr id="TDD">
                                    <td style="width: 22px" align="center">
                                       <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)'/>
                                    </td>
                                    <td>
                                    </td>
                                    <td  id="TDDepartment" style="width: 160px">
                                        <div align="right">
                                            واحد سازماني
                                        </div>
                                    </td>
                                </tr>
                                <tr id="TDG">
                                    <td style="width: 22px" align="center">
                                        <input id="rdbGroup" runat="server" name="GroupChk" type="radio" onclick='OnClickrdb(this)'/>
                                    </td>
                                    <td>
                                    </td>
                                    <td  id="TDGroup">
                                        <div align="right">
                                            گروه خاص
                                        </div>
                                    </td>
                                </tr>
                                <tr id="TDP">
                                    <td style="width: 22px" align="center">
                                        <input id="rdbPerson" runat="server" name="GroupChk" type="radio" checked onclick='OnClickrdb(this)' />
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <div align="right">
                                            پرسنل خاص
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="height: 219px" valign="top" align="center">
                            <table id="ScriptGroups_Header" style="width: 275px;">
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
                            <div style="overflow: auto; height: 300px" align="center">
                                <table align="center" id="ScriptGroups" style="width: 275px;vertical-align:top" >
                                    <thead style="display: none">
                                    </thead>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtScriptGroupXML" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
                     <input type="text" id="txtSelectPerson" name="txtSelectPerson" runat="server" />
                     <input type="text" id="txtSelectPersonGroup" name="txtSelectPersonGroup" runat="server" />
                     <input type="text" id="txtVal" name="txtVal" runat="server" />
                      <input type="text" id="txtXmlMode" name="txtXmlMode" runat="server" />
                     
                     
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/DataEntry/CreditScriptGroup.js?v=3" type="text/javascript"></script>
</asp:Content>
