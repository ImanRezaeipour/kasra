<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" 
CodeBehind="ReportPolicy.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportPolicy"  ValidateRequest="false"%>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
    <table width="80%" style="direction: rtl">
        <tr align="right">
            <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                        <div style="float: right; width: 10%; text-align: left">
                         نام الگو:
                        </div>
                          <div style="float: right; width: 10%; text-align: left">
                          <select id="cmbTemplate" class="txtControls" onchange="OnChangeCmbTemplate(this)"
                                            style="width: 200px" runat="server">
                                            <option></option>
                                        </select>
                        </div>
                         <div style="float: right; width: 10%; text-align: left">
                          نام گزارش
                            </div>
                            <div style="float: right; width: 10%; text-align: left">
                       <select id="cmbReport" class="txtControls" style="width: 200px" runat="server">
                                            <option></option>
                                        </select>
                            </div>
                            
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitTemplate" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
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
                            <asp:HiddenField ID="txtSortExpression" runat="server" /> 
                            <asp:HiddenField ID="txtSortDirection" runat="server" /> 
                        </div>
                            <cc2:KasraGrid ID="GrdPolicy" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdPolicy_Sorting">
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
        <asp:Button ID="BtnSubmitTemplate" runat="server" Text="Button" OnClick="BtnSubmitTemplate_Click" />        
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtCompanyID" name="EDate" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtPolicyID" name="txtPolicyID" runat="server" />
    </div>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/ReportPolicy.js"></script>
</asp:Content>
