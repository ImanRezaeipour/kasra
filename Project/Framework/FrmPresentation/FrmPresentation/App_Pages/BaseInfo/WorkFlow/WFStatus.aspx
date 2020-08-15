<%@ Page Title="-------------------------------------------------------------------------------------Ê÷⁄Ì  ”‰œ--------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="WFStatus.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.WFStatus" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .DivStyle
        {
          
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            width:100%;
            height:200px; 
            float: center; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {

    }
    function EndRequestHandler(sender, args) {

        LastSelectedRow = null;
        var StrVal = $get(MasterObj + "txtSubmit").value
        if ($get(MasterObj + "txtAlert").value != "") {
            if ($get(MasterObj + "txtValidate").value == "0")
                alert($get(MasterObj + "txtAlert").value);
            else
                SetMsg($get(MasterObj + "txtAlert").value);
        }
        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
    }
    </script>
    <table width="90%">
        <tr style="display:none">
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">Å«—«„ — Â«Ì Ã” ÃÊ</legend>
                    <table style="width: 500px" align="right">
                        <tr>
                            <td>
                                ‰«„ ”‰œ :
                            </td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="TxtControls" ID="CmbWFDoc" Height="20px"
                                    Width="131px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                ‰Ê⁄&nbsp; ”‰œ:
                            </td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="TxtControls" ID="CmbWFDocType" Height="20px"
                                    Width="131px">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="1309" PageName="DifinitionCodeNew.aspx" Paging="1"
                    runat="server" />
            </td>
        </tr>
        </tr>
        <tr style="height: 420px">
            <td id="tdGrid" align="center" valign="top" style="border: thin groove #000000; background-color: #C5D5E9;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="CurPage" runat="server" />
                            <input type="text" runat="server" id="txtOnLineUser" name="txtOnLineUser" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="txtTempSearch" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtTmpPersonCode" runat="server" />
                            <asp:HiddenField ID="SearchRowIndex" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtSearchFlag" runat="server" />
                        </div>
                        <div id="GridViewWfStatus">
                            <cc2:KasraGrid ID="GrdWfStatus" class="DivStyle" style="vertical-align: top; float: right;" runat="server">
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
        <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
        <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtDocID" name="txtDocID" runat="server" />
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
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtTableNameSearch" name="txtTableNameSearch" runat="server" />
        <input type="text" id="txtWFDocSearch" name="txtWFDocSearch" runat="server" />
    </div>
    
     <script language="javascript" type="text/javascript">
         //*************************************Declaration*************************************
         document.dir = "RTL";
         var str = "";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         document.getElementById('OToolBar_BtnFilter').style.display = "none";
         document.getElementById('OToolBar_BtnShowAll').style.display = "none";
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNext() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnPrv() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnBlurtxtCurPage(obj) {
             if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                 document.getElementById(MasterObj + "txtCurPage").value = obj.value
                 document.getElementById(MasterObj + "txtSubmit").value = "Const"
                 document.getElementById(MasterObj + "BtnSubmit").click()
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnLast() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnFirst() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnFilter() {
             $get(MasterObj + "txtSubmit").value = "Filter";
             $get(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnShowAll() {
             $get(MasterObj + "CmbWFDocType").value = "0";
             $get(MasterObj + "CmbWFDoc").value = "0";
             document.getElementById(MasterObj + "txtSubmit").value = "Filter";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNew() {
             var OGrid = $get(MasterObj + "GrdWFStatus");
             var strConfirm="»« «‰ ”«» „Ãœœ Ê÷⁄Ì  «”‰«œ œ— Ã—Ì«‰ „„ò‰ «”  »Â„ »—Ì“œ ¬Ì« „ÿ„∆‰Ìœø"
             if (OGrid != null) {
                 if (confirm(strConfirm)) {
                     document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
             }
             else {
                 document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                 document.getElementById(MasterObj + "BtnSubmit").click();
             }
         }

         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        </script>
   </asp:Content>       