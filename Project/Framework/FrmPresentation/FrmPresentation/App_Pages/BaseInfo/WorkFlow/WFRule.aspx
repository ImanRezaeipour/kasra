<%@ Page Title="-------------------------------------------------------------------------شرايط سند-------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="WFRule.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.WFRule"  ValidateRequest="false"%>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>             
  <script language="javascript" type="text/javascript">
      var MasterObj = "ctl00_ContentPlaceHolder1_";
      Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
      Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
      function BeginRequestHandler(sender, args) {
          document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
      }
      function EndRequestHandler(sender, args) {
          document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
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

    <table style="width: 100%">
        <tr>
            <td valign="top">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr style="height: 420px">
            <td id="tdGrid" align="center" valign="top" style="border: thin groove #000000; background-color: #C5D5E9;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                       <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewContainer">
                            <cc2:KasraGrid ID="GrdWFRule" runat="server" OnRowDataBound="Grid_RowDataBound">
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
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtWFDocSearch" name="txtWFDocSearch" runat="server" />
        <input type="text" id="txtWFDocID" name="txtDocID" runat="server" />
        <input type="text" id="txtWFDocTitle" name="txtWFDocTitle" runat="server" />
    </div>
     <script language="javascript">
         //*************************************Declaration*************************************
         document.dir = "RTL";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickGrd(SelectedRow) {
             if (LastSelectedRow != null) {
                 LastSelectedRow.className = LastSelectedRowClass;
             }
             LastSelectedRowClass = SelectedRow.className;
             LastSelectedRow = SelectedRow;
             SelectedRow.className = "CssSelectedItemStyle";

         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNew() {
             url = "WFRuleNew.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
                + "&WFDocTitle=" + $get(MasterObj + "txtWFDocTitle").value
                + "&WFRuleID=0"
                + "&WfDocID=" + $get(MasterObj + "txtWFDocID").value;
             returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:400px;dialogWidth:600px;center: Yes;help: no;status: no")
             if (returnValue == 1) {
                 OnClickBtnFilter();
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnEdit() {
             if (LastSelectedRow != null)
                 OndbClickGrd();
             else
                 alert("به منظور ويرايش يک سطر را انتخاب کنيد")
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OndbClickGrd() {
             url = "WFRuleNew.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
               + "&WFDocTitle=" + LastSelectedRow.cells(0).innerText
               + "&CodeID=" + LastSelectedRow.cells(1).innerText
               + "&MinDuration=" + LastSelectedRow.cells(4).innerText
               + "&MaxDuration=" + LastSelectedRow.cells(5).innerText
               + "&MinCount=" + LastSelectedRow.cells(6).innerText
               + "&MaxCount=" + LastSelectedRow.cells(7).innerText
               + "&WFRuleID=" + LastSelectedRow.getAttribute("RuleID")
               + "&WfDocID=" + LastSelectedRow.getAttribute("WfDocID")
               + "&Daily=" + LastSelectedRow.getAttribute("Daily")
               + "&Timely=" + LastSelectedRow.getAttribute("Timely");
             returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:400px;dialogWidth:600px;center: Yes;help: no;status: no")
             if (returnValue == 1) {
                 OnClickBtnFilter();
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnFilter() {
             $get(MasterObj + "txtSubmit").value = "Filter";
             $get(MasterObj + "BtnSubmit").click();
         }
         //**********************************EndThisPage*************************************
      </script>

</asp:Content>


