<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="KaranePackReport.aspx.cs" Inherits="FrmPresentation.App_Pages.Karane.KaranePackReport" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .DivStyle1
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:350px; 
            width:100%; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table width="100%">
         <tr>
             <td>
                 <asp:ScriptManager ID="ScriptManager2" runat="server" LoadScriptsBeforeUI="false">
                 </asp:ScriptManager>
             </td>
         </tr>
         <tr>
             <td>
                 <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                     border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                     align="right">
                     <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                     <table align="right">
                         <tr>
                             <td>
                                 آيتم کارانه :
                             </td>
                             <td>
                                 <asp:DropDownList ID="CmbKaraneRptName" runat="server" class="TxtControls" Style="width: 180px">
                                 </asp:DropDownList>
                             </td>
                             <td>
                                 دوره :
                             </td>
                             <td>
                                 <asp:DropDownList ID="CmbWorkPeriod" runat="server" class="TxtControls" Style="width: 120px">
                                 </asp:DropDownList>
                             </td>
                             <td>
                                 واحد سازمانی :
                             </td>
                             <td>
                                 <asp:DropDownList ID="CmbDept" runat="server" class="TxtControls" Style="width: 150px">
                                 </asp:DropDownList>
                             </td>
                             <td>
                                 وضعيت :
                             </td>
                             <td>
                                 <asp:DropDownList ID="CmbKaraneStatus" runat="server" class="TxtControls" Style="width: 150px">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                     </table>
                 </fieldset>
             </td>
         </tr>
         <tr>
             <td align="center">
                 <uc1:ToolBar ID="OToolBar" runat="server" />
             </td>
         </tr>
         <tr>
             <td>
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                     <ContentTemplate>
                         <asp:HiddenField ID="txtAlert" runat="server" />
                         <asp:HiddenField ID="txtValidate" runat="server" />
                         <asp:HiddenField ID="txtCurPage" runat="server" />
                         <asp:HiddenField ID="Totalpage" runat="server" />
                         <asp:HiddenField ID="txtSortExpression" runat="server" />
                         <asp:HiddenField ID="txtSortDirection" runat="server" />
                         <div id="DivGrid" class="DivStyle1" align="center">
                             <cc2:KasraGrid ID="GrdKaranePackReport" runat="server" OnRowDataBound="Grid_RowDataBound">
                             </cc2:KasraGrid>
                         </div>
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <input type="text" id="txtMType" name="txtMType" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
    </div>
   <script>
       var MasterObj = "ctl00_ContentPlaceHolder1_"
       //*************************************Declaration*************************************
       var LastSelectedRow = null;
       var LastSelectedRowClass = "";
       document.dir = "rtl";
       document.getElementsByTagName("body")[0].scroll = "no";

       var Ogrid = document.getElementById(MasterObj + "GrdKaraneLog");
       if (Ogrid) {
           for (var i = 1; i < Ogrid.rows.length; ++i) {
               if (Ogrid.rows[i].RowID == 1)
                   Ogrid.rows[i].style.display = "none";
               else
                   Ogrid.rows[i].style.display = "inline";
           }
       }
       //**************************************EndDeclaration*****************************************       
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

       function BeginRequestHandler(sender, args) {

       }
       //====================================================================================
       function EndRequestHandler(sender, args) {
           //---------------------------------------------------------------------------------
           var StrVal = $get(MasterObj + "txtSubmit").value
           if ($get(MasterObj + "txtAlert").value != "") {
               if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
                   alert($get(MasterObj + "txtAlert").value)
               else
                   SetMsg($get(MasterObj + "txtAlert").value);
           }

           var Ogrid = document.getElementById(MasterObj + "GrdKaraneLog");
           if (Ogrid) {
               for (var i = 1; i < Ogrid.rows.length; ++i) {
                   if (Ogrid.rows[i].RowID == 1)
                       Ogrid.rows[i].style.display = "none";
                   else
                       Ogrid.rows[i].style.display = "inline";
               }
           }
           $get(MasterObj + "txtSubmit").value = "";
           $get(MasterObj + "txtAlert").value = "";
           LastSelectedRow = null;
       }
       //===============================================Paging================================================
       function OnBlurtxtCurPage(obj) {
           if (obj.value != 0 && obj.value.replace(" ", "") != "") {
               document.getElementById(MasterObj + "txtCurPage").value = obj.value
               document.getElementById(MasterObj + "txtSubmit").value = "Const"
               document.getElementById(MasterObj + "BtnSubmit").click()
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnNext() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnLast() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnPrv() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnFirst() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickGrd(SelectedRow) {
           if (LastSelectedRow != null)
               LastSelectedRow.className = LastSelectedRowClass
           LastSelectedRowClass = SelectedRow.className
           LastSelectedRow = SelectedRow
           SelectedRow.className = "CssSelectedItemStyle"
       }
       //====================================================
       function OnClickBtnFlow(obj) {
           var OGrid = document.getElementById(MasterObj + "GrdKaranePackReport");
           if (OGrid != null) {
               var oRow = window.event.srcElement.parentElement
               while (oRow.tagName != "TR")
                   oRow = oRow.parentElement
               var DocID = oRow.getAttribute('PackID')
               var DocTypeID = 12
               window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
           }
       }
       //====================================================
       function OnClickBtnFilter() {
               $get(MasterObj + "txtSubmit").value = "Filter";
               $get(MasterObj + "BtnSubmit").click();
       }
       //==================================================================
       function OnClickBtnExcel() {
           $get(MasterObj + "txtSubmit").value = "SendToExcel"
           $get(MasterObj + "BtnSubmitSend").click()
       }
       //==================================================================
       function OnClickBtnPDF() {
           $get(MasterObj + "txtSubmit").value = "SendToPDF"
           $get(MasterObj + "BtnSubmitSend").click()
       }
       //==================================================================
   </script>
</asp:Content>





