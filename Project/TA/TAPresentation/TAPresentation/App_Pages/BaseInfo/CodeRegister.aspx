<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeRegister.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CodeRegister"
    ValidateRequest="false" %>
    
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>

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

                if ($get(MasterObj + "txtAlert").value != "") {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    returnValue = 1
                }

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                if (StrVal == "Filter" | StrVal == "BtnNext" | StrVal == "BtnPrv" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {

                    if (document.getElementById(MasterObj + "txtSelectedCode").value == 1 && SelectedFlag == 1) {
                        document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
                        document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
                        strChk = ""
                        strChk += document.getElementById(MasterObj + "txtXmlChecked").value;
                        clearGrid(oGrid);
                        bindGrid(oGrid);

                        ////////////                                document.getElementById("Tr1").style.display = "none";
                        ////////////                                document.getElementById("Tr2").style.display = "inline";
                    }
                    ////////////                            else {
                    ////////////                                document.getElementById("Tr1").style.display = "inline";
                    ////////////                                document.getElementById("Tr2").style.display = "none";
                    ////////////                            }


                }

            }
                </script>
                
    
    <table style="width: 300px">
    <tr><td><uc1:ToolBar ID="OToolBar" runat="server" /></td></tr>
    <tr><td >
                                        <input type="checkbox" id="chkSelectedCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                                        کدهاي انتخاب شده
                                    </td></tr>
    <tr><td >
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
    <fieldset style="width:400px; height: 300px; text-align: center;">
                                        <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                            ليست کد</font></legend>
                                        <div style="scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #B1D3FF; height: 300px; width: 400px;">
                                            <div id="GridViewSelectCode" >
                            <cc2:KasraGrid ID="GrdSelectCode" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                                            
                                        </div>
                                        </fieldset>
                                        <asp:HiddenField ID="txtSDate" runat="server" />
                                    <asp:HiddenField ID="txtEDate" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    <asp:HiddenField ID="txtOrderString" runat="server" />
                                    <asp:HiddenField ID="txtXmlChecked" runat="server" />
                                
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
        </td></tr>
    <tr><td style="display: inline">
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
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCode" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtSelectedCode" runat="server" />
                    <input type="text" id="txtAllowEdit" runat="server" />
              
                </div>
        </td></tr>
        
    </table>
    
      <script language="javascript" type="text/javascript">

          var LastSelectedRow = null;
          var LastSelectedRowClass = "";
          //var oGrid = document.getElementById("grdSub");
          var strChk = "";
          var newrowindex = 0;
          var SelectedFlag = 0;
          var SelectedFlagEdit = 0;
          //document.getElementById("Tr2").style.display = "none";


          if (document.getElementById(MasterObj + "txtAllowEdit").value == "0") {
              document.getElementById(MasterObj + "txtGroupCodeName").disabled = true;
              document.getElementById(MasterObj + "chkVisible").disabled = true;
              document.getElementById('OToolBar_BtnSave').disabled = true;
              document.getElementById('OToolBar_BtnNew').disabled = true;
          }
          //-------------------------------------------------------------------
          if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {
              document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
              document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
              strChk = document.getElementById(MasterObj + "txtXmlChecked").value;
          }
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
          function OnClickBtnCancel() {
              window.close()
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnSelectGroup() {
              var strUrl = "ScriptGroups.aspx?ScriptID=0"
            + "&Type=chk"
                            + "&InstanceID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=13"
              var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 670px;center: Yes;help: no;status: no')
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnSelectScriptGroups() {
              var strUrl = "ScriptGroups.aspx?ScriptID=0"
            + "&Type=chk"
                            + "&InstanceID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=13"
              var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 590px;dialogWidth: 670px;center: Yes;help: no;status: no')
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnSave() {
              if (checkNotEmpty() == true) {
                  MakeXML()
                  //alert(document.getElementById(MasterObj + "txtXml").value)
                  document.getElementById(MasterObj + "txtSubmit").value = "Save";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function MakeXML() {
              var Visible = 0
              if ($get(MasterObj + "chkVisible").checked == true)
                  Visible = 1
              var XMLStr = "<Tb>"
              XMLStr = XMLStr + "<GroupCode>" + document.getElementById(MasterObj + "txtGroupCode").value + "</GroupCode>"
              XMLStr = XMLStr + "<GroupCodeName>" + document.getElementById(MasterObj + "txtGroupCodeName").value + "</GroupCodeName>"
              XMLStr = XMLStr + "<Visible>" + Visible + "</Visible>"
              XMLStr = XMLStr + "<Desc>" + document.getElementById(MasterObj + "txtDesc").value + "</Desc>"
              XMLStr = XMLStr + "<Acronym>" + document.getElementById(MasterObj + "txtAcronym").value + "</Acronym>"
              XMLStr = XMLStr + "</Tb>"
              XMLStr = XMLStr + strChk
              document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function checkNotEmpty() {

              if (document.getElementById(MasterObj + "txtGroupCodeName").value == "") {
                  alert("لطفا نام گروه را وارد نمائید")
                  document.getElementById(MasterObj + "txtGroupCodeName").focus()
                  return false;
              }
              else if (document.getElementById(MasterObj + "txtAcronym").value == "") {
                  alert("لطفا مخفف نام گروه را وارد نمائید")
                  document.getElementById(MasterObj + "txtAcronym").focus()
                  return false;
              }
              return true;
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickHeaderChk(obj) {
              var OGrid = document.getElementById("GrdSelectCode");
              var oLen = OGrid.rows.length

              for (var i = 1; i < oLen; i++) {
                  OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                  OnClickChk(OGrid.rows(i).cells(0).firstChild);
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickChk(obj) {

              var StrClientChk = "";
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
                      //                oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                  }
                  else {
                      var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                      f.selectSingleNode("Selected").text = 0;
                      oXmlDoc.childNodes[0].appendChild(f);
                      //                oXmlNodes.item(0).selectSingleNode("Selected").text = 0
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

              var OGrid = document.getElementById("GrdSelectCode");
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
              if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {

                  if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {

                      SelectedFlag = 1;
                      document.getElementById(MasterObj + "txtSelectedCode").value = 1;
                      document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
                  //////////////            else if (document.getElementById(MasterObj + "chkSelectedCode").checked == true && SelectedFlag == 1) {
                  //////////////                clearGrid(oGrid);
                  //////////////                bindGrid(oGrid);
                  ////////////                document.getElementById("Tr1").style.display = "none";
                  ////////////                document.getElementById("Tr2").style.display = "inline";
                  //////////////            }
                  else if (document.getElementById(MasterObj + "chkSelectedCode").checked == false) {
                      document.getElementById(MasterObj + "txtSelectedCode").value = 0;
                      document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else {
                  if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {
                      if (strChk != "<Root></Root>")
                          clearGrid(oGrid);
                      bindGrid(oGrid);
                  }
                  else {
                      //////////////                document.getElementById("Tr1").style.display = "inline";
                      //////////////                document.getElementById("Tr2").style.display = "none";
                      SetChk();
                  }

              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function clearGrid(oGrid) {
              while (oGrid.rows.length > 0) {
                  oGrid.deleteRow(0);
              }
          }
          //====================================================
          function bindGrid(oGrid) {

              clearGrid(oGrid);
              newrowindex = 0;

              // strChk.replace();
              var strXml = "<Root>" + strChk + "</Root>";

              var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
              xmlDoc.loadXML(strXml)
              xmlDoc.setProperty("SelectionLanguage", "XPath")
              var XmlNodes = xmlDoc.documentElement.selectNodes("/Root/TbCode[Selected=1]")

              var len = XmlNodes.length

              var oIndex = 0
              //////////////        document.getElementById("Tr1").style.display = "none";
              //////////////        document.getElementById("Tr2").style.display = "inline";
              for (var i = 0; i < len; i++) {
                  AddRow(oGrid,
                                 XmlNodes.item(i).selectSingleNode('CodeID').text,
                                 XmlNodes.item(i).selectSingleNode('CodeName').text);
              }


          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function AddRow(oGrid, CodeNo, CodeName) {
              oGrid.insertRow();
              oGrid.rows(newrowindex).insertCell()
              oGrid.rows(newrowindex).insertCell()
              oGrid.rows(newrowindex).insertCell()
              oGrid.rows(newrowindex).className = "CssItemStyle"
              oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' checked=true   style='WIDTH:20px' onclick='OnClickChkSelectedGrid(this)'  />";
              oGrid.rows(newrowindex).cells(1).innerHTML = "<asp:Label  runat='server'>" + CodeNo + "</asp:Label>"

              oGrid.rows(newrowindex).cells(2).innerHTML = "<asp:Label  runat='server' >" + CodeName + "</asp:Label>"

              oGrid.rows(newrowindex).align = "center"
              oGrid.rows(newrowindex).dir = "rtl"

              oGrid.rows(newrowindex).cells(0).style.width = "20px"
              oGrid.rows(newrowindex).cells(1).style.width = "120px"
              oGrid.rows(newrowindex).cells(2).style.width = "230px"
              oGrid.rows(newrowindex).cells(1).align = "right"
              oGrid.rows(newrowindex).cells(2).align = "right"

              newrowindex = newrowindex + 1
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function onClickGrdSub() {
              var oGrdSub = document.getElementById("grdSub")
              var index = -1
              var oRow = event.srcElement

              //_______Find Row
              for (var i = 0; oRow.tagName != "TR"; i++)
                  oRow = oRow.parentElement
              index = oRow.rowIndex
              if (oRow.parentElement.parentElement.id == "grdSub") {
                  for (i = 0; i < oGrdSub.rows.length; i++) {
                      if (oGrdSub.rows(i).className == "CssSelectedItemStyle") {
                          oGrdSub.rows(i).className = "CssItemStyle"
                      }
                  }
                  oRow.className = "CssSelectedItemStyle"
                  LastSelectedRow = oRow
              }

          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickChkSelectedGrid(obj) {
              var strXml = "<Root>" + strChk + "</Root>";
              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml)


              if (obj.checked == false) {
                  obj.parentElement.parentElement.style.display = "none";
                  var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM")
                  oXmlDoc1.async = "false";
                  oXmlDoc1.loadXML("<Root></Root>")

                  if (oXmlDoc.xml != oXmlDoc1.xml && oXmlDoc.xml != "<Root></Root>") {
                      var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[CodeID=" + obj.parentElement.parentElement.cells(1).innerText + "]");

                      if (xmlNodes.length != 0) {
                          var f = oXmlDoc.documentElement.removeChild(xmlNodes.item(0));
                          f.selectSingleNode("Selected").text = 0;
                          oXmlDoc.childNodes[0].appendChild(f);
                          strChk = oXmlDoc.xml;

                      }
                  }
              }
              strChk = strChk.replace("<Root>", "");
              strChk = strChk.replace("</Root>", "");

          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     </script>
</asp:Content>