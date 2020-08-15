<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneReport.aspx.cs" Inherits="TAPresentation.App_Pages.Karane.KaraneReport" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
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
            height:450px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server"  LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td align="right">
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table cellpadding="0" cellspacing="0" align="right">
                        <tr>
                            <td align="right">
                                <table  >
                                    <tr>
                                        <td align="right">
                                            نام آيتم کارانه :
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="CmbKaranereport" Width="200px" CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
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
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
  
                        <div id="DivGrid" class="DivStyle1">
                            <cc2:KasraGrid ID="GrdKarane" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="Grd_Sorting">
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
    </div>
   <script>
       var MasterObj = "ctl00_ContentPlaceHolder1_"
       WidthScreen = window.screen.width;
       $get("DivGrid").style.width = WidthScreen - 40;
       //*************************************Declaration*************************************
       var LastSelectedRow = null;
       var LastSelectedRowClass = "";
       document.dir = "rtl";
       document.getElementsByTagName("body")[0].scroll = "no";
       //**************************************EndDeclaration*****************************************       
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

       function BeginRequestHandler(sender, args) {

       }
       //====================================================================================
       function EndRequestHandler(sender, args) {
           $get("DivGrid").style.width = WidthScreen - 40;
           //---------------------------------------------------------------------------------
           var StrVal = $get(MasterObj + "txtSubmit").value
           if ($get(MasterObj + "txtAlert").value != "") {
               if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
                   alert($get(MasterObj + "txtAlert").value)
               else
                   SetMsg($get(MasterObj + "txtAlert").value);
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
       function OnClickBtnFilter() {
               $get(MasterObj + "txtSubmit").value = "Filter";
               $get(MasterObj + "BtnSubmit").click();
       }
       //========================================================
       function OnDblClickGrd() {
           var url = "KaraneReportDefinition.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ReportID=" + LastSelectedRow.getAttribute("ReportID")
           var DialogProperty = "dialogHeight: 550px;dialogWidth:" + window.screen.width + ";center: Yes;help: no;status:no#1;minimize: yes;resizable=1"
           returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
           if (returnValue == 1)
               OnClickBtnFilter();
       }
       //========================================================
       function OnClickBtnNew() {
           var url = "KaraneReportDefinition.aspx?ReportID=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
           var DialogProperty = "dialogHeight: 550px;dialogWidth:" + window.screen.width + ";center: Yes;help: no;status:no#1;minimize: yes;resizable=1"
           returnValue = window.showModalDialog(url, "", DialogProperty);
           if (returnValue == 1)
               OnClickBtnFilter();
       }
       //===============================================================================================
       function OnClickBtnDel() {
           if (LastSelectedRow != null) {
               if (confirm("آيا براي حذف مطمئنيد؟")) {
                   document.getElementById(MasterObj + "txtReportID").value = LastSelectedRow.getAttribute("ReportID")
                   $get(MasterObj + "txtSubmit").value = "Delete";
                   $get(MasterObj + "BtnSubmit").click();
               }

           }
           else
               alert('لطفا يک سطر از گريد انتخاب کنيد')
       }
       //===============================================================================================
       function OnClickBtnEdit() {
           if (LastSelectedRow != null) {
               OnDblClickGrd();
           }
           else
               alert("لطفا به منظور ويرايش یک سطر را انتخاب کنید")
       }
       //===============================================================================================
   </script>
</asp:Content>



