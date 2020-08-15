<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefinePageAccess.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.DefinePageAccess" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>

    <table>
        <tr>
            <td valign="top" align="right">
                <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"
                    ScriptMode="Release">
                </asp:ScriptManager>
                <table style="height: 499px; width: 952px;">
                    <tr style="height: 8px">
                        <td>
                            <table style="height: 3px">
                                <tr>
                                    <td style="width: 91px">
                                        نام زيرسيستم :
                                    </td>
                                    <td>
                                        <asp:DropDownList onchange="onChangeCmbSubSys()" onkeypress="return KeySort(this,false)"
                                            ID="CmbSubSysFilter" runat="server" Width="100px" Style="height: 22px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 64px">
                                        نام صفحه:
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList onkeypress="return KeySort(this,false)" ID="cmbPageName" runat="server"
                                                    Width="120px">
                                                </asp:DropDownList>
                                                <div style="display: none">
                                                    <asp:HiddenField ID="txtSubSysID" runat="server" />
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width: 127px">
                                        نام دسترسی داده ای:
                                    </td>
                                    <td style="width: 105px">
                                        <asp:DropDownList onkeypress="return KeySort(this,false)" ID="cmbDataAccessName"
                                            runat="server" Width="120px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        نوع دسترسی داده ای:
                                    </td>
                                    <td>
                                        <asp:DropDownList onkeypress="return KeySort(this,false)" ID="cmbDataAccessType"
                                            runat="server" Width="120px">
                                        </asp:DropDownList>
                                        &nbsp&nbsp&nbsp
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="DefinePageAccess.aspx" PageID="1116" />

                            <script type="text/javascript" language="javascript">
                             Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                             function BeginRequestHandler(sender, args) {
                                 //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
                                 document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                             }

                             function EndRequestHandler(sender, args) {
                                document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                                 
                                 var StrVal = $get(MasterObj + "txtSubmit").value
                                 $get(MasterObj + "txtAlert").value = StrVal
                                 //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                                 if (StrVal != "") {

                                     LastSelectedRow = "";
                                     CountChkSelected = 0
                                     if (document.getElementById("OToolBar_txtCurPage") != null) {
                                         if ($get(MasterObj + "lblTo").value == "") {
                                             document.getElementById('OToolBar_txtFromData').value = "";
                                             document.getElementById('OToolBar_txtToData').value = "";
                                             document.getElementById('OToolBar_txtTotalData').value = "";

                                             document.getElementById('OToolBar_BtnNext').disabled = true;
                                             document.getElementById('OToolBar_BtnPrv').disabled = true;
                                             document.getElementById('OToolBar_BtnFirst').disabled = true;
                                             document.getElementById('OToolBar_BtnLast').disabled = true;
                                         }
                                         else if ($get(MasterObj + "lblTo").value != "") {
                                             document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                             document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                             document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                             document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                             document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                                             if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                                                 document.getElementById('OToolBar_BtnNext').disabled = true
                                             else
                                                 document.getElementById('OToolBar_BtnNext').disabled = false;

                                             if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                                                 document.getElementById('OToolBar_BtnPrv').disabled = true
                                             else
                                                 document.getElementById('OToolBar_BtnPrv').disabled = false;

                                             document.getElementById('OToolBar_BtnFirst').disabled = false;
                                             document.getElementById('OToolBar_BtnLast').disabled = false;
                                         }
                                     }
                                 }
                                 SetChk();
                                 if (StrVal == "SaveGroupView") {
                                     $get(MasterObj + "txtAlert").value = "Modify"
                                     SetMsg($get(MasterObj + "txtAlert").value);
                                     PopupGridView.style.display = "none"
                                 }
                                 else if (StrVal == "Delete") {
                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Modify") {
                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Search") {
                                    PopupSearch.style.display = "none";
                                    LastSelectedRow = '';
                                 }
                                 $get(MasterObj + "txtSubmit").value = "";
                                 LastSelectedRow=null
                             }
                            </script>

                        </td>
                    </tr>
                    <tr>
                    <td style="height: 8px" align="right">
                    <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />
                            نمایش انتخاب شده ها
                    </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtPersonCode" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="lblTo" runat="server" />
                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                    <asp:HiddenField ID="txtPageAccessId" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                    <asp:HiddenField ID="txtPageId" runat="server" />
                                    <asp:HiddenField ID="txtDataAccessName" runat="server" />
                                    <asp:HiddenField ID="txtDataAccessType" runat="server" />
                                    <asp:HiddenField ID="txtXMLDelete" runat="server" />
                                    <asp:HiddenField ID="txtChkAllXML" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
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
                    <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
                    <input type="text" id="txtXMLModify" name="txtGroupView" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmitPageName" runat="server" Text="BtnSubmitPageName" OnClick="BtnSubmitPageName_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          var GroupID = '0';
          var LastSelectedRow = null;
          var LastSelectedRowClass = "";
          var strChk = "";
          var CountChkSelected = 0
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          document.getElementById('OToolBar_BtnPrv').disabled = true;
          document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
          document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
          document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
          document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
          document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
          if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
              document.getElementById('OToolBar_BtnNext').disabled = true
          else
              document.getElementById('OToolBar_BtnNext').disabled = false;
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnBlurtxtCurPage() {
              document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

              var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
              if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                  if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                      document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                  }
                  document.getElementById(MasterObj + "txtSubmit").value = "Const";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNext() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnLast() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnPrv() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFirst() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnEdit() {
              if (LastSelectedRow != null) {
                  url = "AddPageAccess.aspx?PageId=" + LastSelectedRow.PageId
                  + "&SubsysID=" + LastSelectedRow.SubsysID
                  //alert(LastSelectedRow.SubsysID)
                  rr = window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 800px;center: Yes;help: no;status: no")
                  if (rr == 1) {
                      $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else {
                alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OndbClickGrd() {
              OnClickBtnEdit()
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickGrdPageAccess(SelectedRow) {
              if (LastSelectedRow != null) {
                  LastSelectedRow.className = LastSelectedRowClass;
              }
              LastSelectedRowClass = SelectedRow.className;
              LastSelectedRow = SelectedRow;
              SelectedRow.className = "CssSelectedItemStyle";
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFilter() {       
              $get(MasterObj + "txtPageId").value = $get(MasterObj + "cmbPageName").value
              $get(MasterObj + "txtDataAccessName").value = $get(MasterObj + "cmbDataAccessName").value
              $get(MasterObj + "txtDataAccessType").value = $get(MasterObj + "cmbDataAccessType").value
//              alert($get(MasterObj + "txtPageId").value)
//              alert($get(MasterObj + "txtDataAccessName").value)
//              alert($get(MasterObj + "txtDataAccessType").value)
              $get(MasterObj + "txtSubmit").value = "Filter";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNew() {
              url = "AddPageAccess.aspx?PageId=0";
              rr = window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 800px;center: Yes;help: no;status: no")
              if (rr == 1) 
              {
                  $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnDel() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
             if (strChk != "") {
                 if (confirm("آيا از حذف مطمئنيد؟")) {
                     document.getElementById(MasterObj + "txtXMLDelete").value = "<Root>" + strChk + "</Root>"
                     $get(MasterObj + "txtSubmit").value = "Delete";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
             }
             else
                 alert("ابتدا سطرهاي مورد نظر را انتخاب نماييد")
          }
          ////_________________________________________________________________________________
          function OnClickChk(obj) {

              var oGrid = obj.parentElement;
              while (oGrid.tagName != "TABLE")
                  oGrid = oGrid.parentElement

              var oRow = obj.parentElement;
              while (oRow.tagName != "TR")
                  oRow = oRow.parentElement
              //-------------------------------  
              var oIndex = oRow.rowIndex

              var AccID = oGrid.rows(oIndex).getAttribute('PageAccessId');
              var CurPage = document.getElementById(MasterObj + "txtCurPage").value

              //========================================================
              if (obj.checked == true && CountChkSelected != oGrid.rows.length - 1)
                  CountChkSelected++;
              else if (obj.checked == false)
                  CountChkSelected--;

              if (CountChkSelected == oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != true)
                  oGrid.rows(0).cells(0).firstChild.checked = true
              else if (CountChkSelected != oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != false)
                  oGrid.rows(0).cells(0).firstChild.checked = false
              //========================================================
              var strXml = "<Root>" + strChk + "</Root>"
              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);
              //              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and PageAccessId=" + AccID + "]");
              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ PageAccessId=" + AccID + "]");
              //========================================================
              if (oXmlNodes.length > 0) {
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                      oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                  else
                      oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                  strXml = oXmlDoc.xml;
                  strChk = strXml.replace("<Root>", "");
                  strChk = strChk.replace("</Root>", "");
              }
              else {
                  strChk += "<Tb>"
                  //strChk += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                  strChk += "<PageAccessId>" + AccID + "</PageAccessId>"
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                      strChk += "<Selected>0</Selected>"
                  else
                      strChk += "<Selected>1</Selected>"

                  strChk += "</Tb>"
              }
//              $get(MasterObj + "txtSelectRow").value = strChk
//              $get(MasterObj + "txtTmpSelectRow").value = strChk
              
          }
          ////_________________________________________________________________________________
          function SetChk() {
              var i = 0;
              var j = 0;
              
              var OGrid = document.getElementById("GrdPageAccess");
              
              if (OGrid == null)
                  return
              var PageSize = OGrid.rows.length
              var strXml = "<Root>" + strChk + "</Root>"
              var CurPage = document.getElementById(MasterObj + "txtCurPage").value

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");
              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

              for (j = 0; j < oXmlNodes.length; j++) {
                  for (i = 1; i < PageSize; i++) {
                      if (OGrid.rows(i).getAttribute('PageAccessId') == oXmlNodes.item(j).selectSingleNode("PageAccessId").text) {
                          OGrid.rows(i).cells(0).firstChild.checked = true;
                          CountChkSelected++;
                      }
                  }
              }
              if (CountChkSelected == OGrid.rows.length - 1)
                  OGrid.rows(0).cells(0).firstChild.checked = true
              else
                  OGrid.rows(0).cells(0).firstChild.checked = false
          }
          ////_________________________________________________________________________________
          function OnClickHeaderChk(obj) {
              var OGrid = document.getElementById("GrdPageAccess");
              var oLen = OGrid.rows.length

              if (obj.checked == true)
                  CountChkSelected = oLen - 1
              else
                  CountChkSelected = 0


              for (var i = 1; i < oLen; i++) {
                  OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                  OnClickChk(OGrid.rows(i).cells(0).firstChild);
              }

          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function onChangeCmbSubSys() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              $get(MasterObj + "txtSubSysID").value = $get(MasterObj + "CmbSubSysFilter").value;
              $get(MasterObj + "txtSubmit").value = "PageFilter";
              document.getElementById(MasterObj + "BtnSubmitPageName").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function onclickchkAllSelected(obj) {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              var strXml = "<Root>" + strChk + "</Root>"
              document.getElementById(MasterObj + "txtChkAllXML").value = strXml
              document.getElementById(MasterObj + "txtSubmit").value = "Filter"
              document.getElementById(MasterObj + "BtnSubmit").click();
                                 // alert(strXml)
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
