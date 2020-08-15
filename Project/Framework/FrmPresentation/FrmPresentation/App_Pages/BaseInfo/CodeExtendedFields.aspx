<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CodeExtendedFields.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CodeExtendedFields" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script language ="javascript" type ="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         
  <script language="javascript" type="text/javascript">
      var MasterObj = "ctl00_ContentPlaceHolder1_";
      Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
      Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
      function BeginRequestHandler(sender, args) {
          
      }

      function EndRequestHandler(sender, args) {
          
          var StrVal = $get(MasterObj + "txtSubmit").value
          if ($get(MasterObj + "txtAlert").value != "") {
              SetMsg($get(MasterObj + "txtAlert").value);
          }
          //******************************************************************
          var OExGrid = document.getElementById("GrdExCode");
          for (var i = 1; i < OExGrid.rows.length; i++) {
              if (OExGrid.rows(i).cells(1).firstChild.tagName == 'SELECT')
                  OExGrid.rows(i).cells(1).firstChild.value = OExGrid.rows(i).getAttribute('SelectedVal1')
              if (OExGrid.rows(i).cells(3).firstChild != null) {
                  if (OExGrid.rows(i).cells(3).firstChild.tagName == 'SELECT')
                      OExGrid.rows(i).cells(3).firstChild.value = OExGrid.rows(i).getAttribute('SelectedVal2')
              }
          }
          //******************************************************************

          $get(MasterObj + "txtSubmit").value = "";
          $get(MasterObj + "txtAlert").value = "";


      }
    </script>

    <table>
        <tr>
            <td align="right" valign="top">
                <table >
                 
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                       </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 406px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                     <asp:HiddenField ID="CurPage" runat="server" />
                                        <asp:HiddenField ID="txtOnlineUser" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="txtTempSearch" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtTmpPersonCode" runat="server" />
                                        <asp:HiddenField ID="SearchRowIndex" runat="server" />
                                         <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    </div>
                                    <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                    <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
                    <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
                    <asp:HiddenField ID="txtCodeID" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtTmpPersonID" name="txtTmpPersonID" runat="server" />
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
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtExSaveXml" name="txtSubmit" runat="server" />
                    <input type="text" id="txtXmlGrid" name="txtSubmit" runat="server" />
                </div>
            </td>
        </tr>
    </table>
     
     <script type="text/javascript" language="javascript">

         //*************************************Declaration*************************************
         var str = "";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
         var lastPersonCode = "";
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";

         //*************************************EndDeclaration*************************************
         //*******************************************************************************
      
         var OExGrid = document.getElementById("GrdExCode");
         for (var i = 1; i < OExGrid.rows.length; i++) {
             if (OExGrid.rows(i).cells(1).firstChild.tagName == 'SELECT')
               //  alert(OExGrid.rows(i).getAttribute('SelectedVal1'));
                 OExGrid.rows(i).cells(1).firstChild.value = OExGrid.rows(i).getAttribute('SelectedVal1')
             if (OExGrid.rows(i).cells(3).firstChild != null) {
                 if (OExGrid.rows(i).cells(3).firstChild.tagName == 'SELECT')
                     //alert(OExGrid.rows(i).getAttribute('SelectedVal2'));
                     OExGrid.rows(i).cells(3).firstChild.value = OExGrid.rows(i).getAttribute('SelectedVal2')
             }
         }
         //*************************************OnLoad*************************************
    
         function OnClickBtnSave() {
             var StrXml = "";
             StrXml += '<Root>';
             var OExGrid = document.getElementById("GrdExCode");
             for (var i = 1; i < OExGrid.rows.length; i++) {
                 StrXml += '<ExFieldTab>';
                 StrXml += '<TFID1>' + OExGrid.rows(i).getAttribute('TFID1') + '</TFID1>';
                 if (OExGrid.rows(i).cells(1).firstChild.type == 'text')
                     StrXml += '<Value1>' + OExGrid.rows(i).cells(1).firstChild.value + '</Value1>';
                 else if (OExGrid.rows(i).cells(1).firstChild.type == 'checkbox')
                     StrXml += '<Value1>' + ((OExGrid.rows(i).cells(1).firstChild.checked) ? '1' : '0') + '</Value1>';

                 else if (OExGrid.rows(i).cells(1).firstChild.tagName == 'SELECT')
                     StrXml += '<Value1>' + (OExGrid.rows(i).cells(1).firstChild.value) + '</Value1>';

                 StrXml += '<TFID2>' + ((OExGrid.rows(i).getAttribute('TFID2') != "") ? OExGrid.rows(i).getAttribute('TFID2') : "0") + '</TFID2>';
                 if (OExGrid.rows(i).getAttribute('TFID2') != "") {
                     if (OExGrid.rows(i).cells(3).firstChild.type == 'text')
                         StrXml += '<Value2>' + OExGrid.rows(i).cells(3).firstChild.value + '</Value2>';

                     else if (OExGrid.rows(i).cells(3).firstChild.type == 'checkbox')
                         StrXml += '<Value2>' + ((OExGrid.rows(i).cells(3).firstChild.checked) ? '1' : '0') + '</Value2>';

                     else if (OExGrid.rows(i).cells(3).firstChild.tagName == 'SELECT')
                         StrXml += '<Value2>' + (OExGrid.rows(i).cells(3).firstChild.value) + '</Value2>';
                 }
                 else
                     StrXml += '<Value2></Value2>';
                 StrXml += '</ExFieldTab>';

             }
             StrXml += '</Root>';
             document.getElementById(MasterObj + "txtExSaveXml").value = StrXml;
             $get(MasterObj + "txtSubmit").value = "Save";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNew() {
             var OExGrid = document.getElementById("GrdExCode");
             for (var i = 1; i < OExGrid.rows.length; i++) {
                 if (OExGrid.rows(i).cells(1).firstChild.tagName == 'SELECT')
                     OExGrid.rows(i).cells(1).firstChild.value = 0;
                 if (OExGrid.rows(i).cells(3).firstChild != null) {
                     if (OExGrid.rows(i).cells(3).firstChild.tagName == 'SELECT')
                         OExGrid.rows(i).cells(3).firstChild.value = 0;
                 }
             }

         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnCancel() {
             window.close();
         }
         //**********************************EndThisPage*************************************
      </script>
</asp:Content>
