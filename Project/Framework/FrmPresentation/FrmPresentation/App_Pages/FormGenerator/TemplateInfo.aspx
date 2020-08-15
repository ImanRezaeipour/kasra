<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TemplateInfo.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.TemplateInfo"
    ValidateRequest="false" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table width="80%" style="direction: rtl">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr align="right">
            <td>
                <div align="right" dir="rtl" style="height: 49px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table align="right" style="width: 100%">
                                <tr>
                                    <td style="width: 80px" align="right">
                                        <div align="right">
                                            نام الگو</div>
                                    </td>
                                    <td style="width: 175px">
                                        <select id="cmbTemplate" class="txtControls" onchange="OnChangeCmbTemplate(this)"
                                            style="width: 200px" runat="server">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td>
                                        <input id="txtTmpName" type="text" style="width: 100px" runat="server" />
                                    </td>
                                    <td style="width: 67px" align="right">
                                        <div align="right">
                                            نام گزارش</div>
                                    </td>
                                    <td style="width: 166px">
                                        <select id="cmbReport" class="txtControls" style="width: 200px" runat="server">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td>
                                        <input id="txtRepName" type="text" style="width: 100px" runat="server" />
                                    </td>
                                </tr>
                                <tr align="right">
                                    <td style="width: 80px" align="right">
                                        <div align="right">
                                        نام سيستم
                                    </td>
                                    <td style="width: 175px">
                                        <select id="cmbSubSystem" style="width: 197px" class="txtControls" runat="server">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td>
                                    </td>
                                    <td style="width: 67px">
                                        نام Object
                                    </td>
                                    <td style="width: 166px">
                                        <asp:DropDownList ID="cmbSp" runat="server" class="txtControls" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr align="right">
            <td align="right">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ReportInfo.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" /> 
                            <asp:HiddenField ID="txtMenu" runat="server" /> 
                            <asp:HiddenField ID="txtSortExpression" runat="server" /> 
                            <asp:HiddenField ID="txtSortDirection" runat="server" /> 
                        </div>
                            <cc2:KasraGrid ID="GrdTemplate" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdTemplate_Sorting">
                            </cc2:KasraGrid>
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
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSelectedSpName" name="txtSelectedSpName" runat="server" />
        <input type="text" id="txtVaridable" name="txtVaridable" runat="server" />
        <input type="text" id="txtMappingType" name="txtMappingType" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtXmlOperand" name="txtXmlOperand" runat="server" />
        <input type="text" id="txtXmlMenuItems" name="txtXmlMenuItems" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtTemplateID" name="txtTemplateID" runat="server" />
    </div>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/TemplateInfo.js"></script>
</asp:Content>
