<%@ Page Title="--------------------------------------------انتخاب کد------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"  AutoEventWireup="true" CodeBehind="SelectMultiCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.SelectMultiCode" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }

        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            if (StrVal == "Filter" | StrVal == "BtnNext" | StrVal == "BtnPrv" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                if (document.getElementById(MasterObj + "txtSelectedCodeFlag").value == 1 && SelectedFlag == 1) {
                    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
                    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
                    strChk = ""
                    strChk += document.getElementById(MasterObj + "txtXmlChecked").value;
                }
            }
            if (StrVal != "") {
                SetChk();
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
    </script>
                
    
    <table style="width: 300px">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr style="display:none">
            <td>
                <input type="checkbox" id="chkSelectedCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                کدهاي انتخاب شده
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset style="width: 400px; height: 300px; text-align: center;">
                            <legend><font style="font-size: 14px; color: #78BED6; font-weight: bold; font-family: 'KasraB Traffic';">
                                ليست کدها</font></legend>
                            <div style="scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                scrollbar-base-color: #B1D3FF; height: 300px; width: 400px;">
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </div>
                        </fieldset>
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtXmlChecked" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="display: inline">
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
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
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtSelectedCodeFlag" runat="server" />
                     <input type="text" id="txtSelectedCode" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    
      <script language="javascript" type="text/javascript">

          var LastSelectedRow = null;
          var LastSelectedRowClass = "";
          var strChk = "";
          var SelectedFlag = 0;
          //-------------------------------------------------------------------
          if ($get(MasterObj + "txtSelectedCode").value != "") {
              strChk = $get(MasterObj + "txtSelectedCode").value;
              SetChk();
          }
          ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
              document.getElementById(MasterObj + "txtSubmit").value = "Filter";
              document.getElementById(MasterObj + "BtnSubmit").click();
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
          function OnClickBtnOk() {
              document.getElementById(MasterObj + "txtXml").value = "<Root>" + strChk + "</Root>"
              window.returnValue = document.getElementById(MasterObj + "txtXml").value;
              window.close();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickHeaderChk(obj) {
              var OGrid = document.getElementById("GrdMultiCode");
              var oLen = OGrid.rows.length
              for (var i = 1; i < oLen; i++) {
                  OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                  OnClickChk(OGrid.rows(i).cells(0).firstChild);
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickChk(obj) {
              var oGrid = obj.parentElement;
              while (oGrid.tagName != "TABLE")
                  oGrid = oGrid.parentElement

              var oRow = obj.parentElement;
              while (oRow.tagName != "TR")
                  oRow = oRow.parentElement
              var oIndex = oRow.rowIndex
              //========================================================
              var strXml = "<Root>" + strChk + "</Root>"

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + "]");
              //========================================================
              if (oXmlNodes.length > 0) {
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                      var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                      f.selectSingleNode("Selected").text = 1;
                      oXmlDoc.childNodes[0].appendChild(f);
                  }
                  else {
                      var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                      f.selectSingleNode("Selected").text = 0;
                      oXmlDoc.childNodes[0].appendChild(f);
                  }


                  strXml = oXmlDoc.xml;
                  strChk = strXml.replace("<Root>", "");
                  strChk = strChk.replace("</Root>", "");
              }
              else {
                  strChk += "<TbCode>"
                  strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                      strChk += "<Selected>0</Selected>"
                  else
                      strChk += "<Selected>1</Selected>"
                  strChk += "<CodeName>" + oGrid.rows(oIndex).cells(2).innerText + "</CodeName>";
                  strChk += "</TbCode>"
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function SetChk() {
              var i = 0;
              var j = 0;
              var OGrid = document.getElementById("GrdMultiCode");
              if (OGrid == null)
                  return
              var PageSize = OGrid.rows.length
              var strXml = "<Root>" + strChk + "</Root>"

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);
              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode");
              for (j = 0; j < oXmlNodes.length; j++) {
                  for (i = 1; i < PageSize; i++) {
                      if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("CodeID").text) {
                          if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                              OGrid.rows(i).cells(0).firstChild.checked = true;
                          else
                              OGrid.rows(i).cells(0).firstChild.checked = false;
                      }
                  }
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickChkSelectedGroup() {
              if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {
                  SelectedFlag = 1;
                  document.getElementById(MasterObj + "txtSelectedCodeFlag").value = 1;
              }
              else if (document.getElementById(MasterObj + "chkSelectedCode").checked == false)
                  document.getElementById(MasterObj + "txtSelectedCodeFlag").value = 0;
              document.getElementById(MasterObj + "txtSubmit").value = "Filter";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     </script>
</asp:Content>
