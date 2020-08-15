<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ReportInfo.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportInfo"
    ValidateRequest="false" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"  LoadScriptsBeforeUI="False" ScriptMode="Release"></asp:ScriptManager>
    <table width="80%" style="direction: rtl">
        <tr align="right">
            <td>
            <div align="right" dir="rtl" style="height: 49px">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <table align="right" style="width: 100%">
                    <tr >
                    <td style="width: 80px"  align="right"><div align="right">‰«„ «·êÊ</div></td>
                        <td style="width: 175px" >
                         <select id="cmbTemplate" onchange="OnChangeCmbTemplate(this)" class="TxtControls" style="width: 200px" runat="server">
                                <option></option>
                            </select>
                            
                        </td>
                        <td>
                            <input id="txtTmpName" type="text" style="width: 100px" runat="server" />
                        </td>
                        <td style="width: 67px" align="right"><div align="right"> ‰«„ ê“«—‘</div></td>
                        <td style="width: 166px">
                           <select id="cmbReport" style="width: 200px" class="TxtControls" runat="server" >
                                <option></option>
                            </select>
                            
                        </td>
                        <td>
                            <input id="txtRepName" type="text" style="width: 100px" runat="server" />
                        </td>
                    </tr>
                    <tr align="right">
                    <td style="width: 80px" align="right"><div align="right">‰«„ ”Ì” „</td>
                        <td style="width: 175px">
                            
                            <select id="cmbSubSystem" style="width: 197px" class="TxtControls" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                        </td>
                        <td style="width: 67px" >
                        </td>
                        <td style="width: 166px">
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
                        <cc2:KasraGrid ID="GrdReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                            AllowSorting="true" AllowSendToPDF="false" OnSorting="GrdReport_Sorting"
                            AllowSendToExcel="false">
                        </cc2:KasraGrid>
                         <div style="display: none">
                            <asp:HiddenField ID="txtValidate" runat="server" />
                                <asp:HiddenField ID="txtAlert" runat="server" />
                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                <asp:HiddenField ID="Totalpage" runat="server" />
                                <asp:HiddenField ID="txtSortExpression" runat="server" /> 
                                <asp:HiddenField ID="txtSortDirection" runat="server" /> 
                            <asp:HiddenField ID="txtMenu" runat="server" /> 
                            </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:PostBackTrigger ControlID="BtnSubmitSend" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />        
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
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
    </div>
<script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/ReportInfo.js"></script>

</asp:Content>
