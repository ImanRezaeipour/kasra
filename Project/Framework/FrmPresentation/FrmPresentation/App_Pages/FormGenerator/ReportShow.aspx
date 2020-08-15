<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ReportShow.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportShow"
    Title="----------------------------------------------------------------------------------------------äãÇíÔ ÒÇÑÔ--------------------------------------------------------------------------------------------------------"
    ValidateRequest="false" EnableEventValidation="false" AsyncTimeout="600" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/CodeCondition/CodeCondition.ascx" TagName="CodeCondition"
    TagPrefix="uc5" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        div#GridViewCountainer
        {
            overflow: auto;
            scrollbar-hightlight-color: white;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
        }
        
        
        
        /* Locks table header */
        th
        {
            position: relative; /*IE5+ only*/
            top: expression(document.getElementById("GridViewCountainer").scrollTop-2);
            z-index: 99;
        }
    </style>
 
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600"
   LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
  <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" /></div>
    <div dir="rtl"  style="width: 100%; height: 100%;" >
        
        <table dir="rtl" style="width: 100%; height: 100%;"  >
            <tr>
                <td id="tdFilter" style="height: 50px">
                   <%-- <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>--%>
                        <div style="text-align:center;width:100%" align="center">
                            <asp:PlaceHolder ID="PHFilter" runat="server"></asp:PlaceHolder>
                          </div>
                           <div id="DivPHParam" runat="server" style="text-align:center;width:100%" align="center">
                            <asp:PlaceHolder ID="PHParam" runat="server"></asp:PlaceHolder>
                           </div>
                        <div id="DivPHField"  runat="server" style="text-align:center;width:100%" align="center">
                            <asp:PlaceHolder ID="PHField" runat="server"></asp:PlaceHolder>
                        </div>
                        <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                </td>
            </tr>
            <tr>
                <td style="height: 30px">
                    <div style="width: 90%">
                      
                        <uc1:ToolBar ID="OToolBar" Paging="0" runat="server" />
                    </div>
                </td>
            </tr>
            <tr>
                <td id="tdGrid" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="GridViewCountainer" style="width: 900px; height: 300px; vertical-align: top;"
                                align="center">
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="server"></asp:PlaceHolder>
                            </div>
                         <div style="display:none;">
                                <asp:TextBox ID="txtXmlParamInfo" runat="server"></asp:TextBox>
                                <asp:TextBox ID="lblFrom" runat="server" />
                                <asp:TextBox ID="lblTo" runat="server" />
                                <asp:TextBox ID="lblTotalpage" runat="server" />
                                <asp:TextBox ID="lblCurPage" runat="server" />
                                <asp:TextBox ID="lblTotal" runat="server" />
                                <asp:PlaceHolder ID="ExcelGridPlaceHolder" runat="server"></asp:PlaceHolder>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="BtnSendSubmitDirect" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPreview" EventName="Click"/>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="display: none;">
                      <asp:Button ID="BtnSendSubmitDirect" runat="server" Text="Button" onclick="BtnSendSubmitDirect_Click" />
                      <asp:Button ID="BtnSubmitPreview" runat="server" Text="Button" onclick="BtnSubmitPreview_Click" />  
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtShowAdvFilter" name="txtShowAdvFilter" runat="server" />
                    <asp:TextBox ID="txtXmlOperand" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtSubmit" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtMenuItemID" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtPageID" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtGridID" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtGridName" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtTemplateID" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtReportID" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
                    <input type="text" runat="server" id="txtSessionID" name="txtSessionID" />
                    <input type="text" runat="server" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" />
                    <asp:TextBox ID="txtXmlFilter" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtXmlAdvanceParameter" runat="server" />
                    <asp:TextBox ID="txtStrAdvanceField" runat="server" />
                    <asp:TextBox ID="txtStrAdvanceConditions" runat="server" />
                    <asp:TextBox ID="txtControlReport" runat="server" />
                    <asp:TextBox ID="txtAttributes" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtXmlExcelParam" runat="server" />
                    <asp:TextBox ID="txtXmlParam" runat="server" />    
                    <asp:TextBox ID="txtXmlAdvanceParam" runat="server" />
                   
                    <asp:Button ID="BtnSendSubmit" runat="server" OnClick="BtnSendSubmit_Click" />
                     <input type="text" runat="server" id="txtConditionMain" name="txtConditionMain" />
                     <cc1:MySecurity ID="OnLineUserSec" runat="server">
                     </cc1:MySecurity>
                      <input type="text" runat="server" id="txtCondition" name="txtCondition" />
                        <asp:TextBox ID="txtXmlAdvParamInfo" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
        </table>
    </div>
<script language="javascript" src="../../App_Utility/Scripts/FormGenerator/ReportShow.js?v=1.3" type="text/javascript"></script>
</asp:Content>
