<%@ Page Title="-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeUtilize.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CodeUtilize"
    ValidateRequest="false" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
 <%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>   
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table >
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset style="width: 500px; height: 350px; text-align: center;">
                                        <legend>
                                            <input type="radio" checked="true" runat="server" name="rdScript" id="rdCode" onclick="OnClickRdCode()" />
                                            <font style="font-size: 14px; color: #808080; font-weight: bold; font-family: 'KasraB Traffic';">
                                                ليست کد</font></legend>
                                        <div align="right" style="display:none">
                                            <input type="checkbox" id="chkSelectedCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                                            کدهاي انتخاب شده</div>
                                        <div id="GridViewSelectCode">
                                            <cc2:KasraGrid ID="GrdSelectCode" runat="server" OnRowDataBound="Grid_RowDataBound">
                                            </cc2:KasraGrid>
                                        </div>
                                    </fieldset>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset style="width: 500px; height: 350px; text-align: center;">
                                        <legend>
                                            <input type="radio" runat="server" name="rdScript" id="rdGroupCode" onclick="OnClickRdCode()" />
                                            <font style="font-size: 14px; color: #808080; font-weight: bold; font-family: 'KasraB Traffic';">
                                                ليست گروه کد</font></legend>
                                        <div align="right" style="display:none">
                                            <input type="checkbox" id="chkSelectedGroupCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                                            گروه کدهاي انتخاب شده</div>
                                        <div id="GrdGroupCode">
                                            <cc2:KasraGrid ID="GrdGroupCode" runat="server" OnRowDataBound="GridGroupCode_RowDataBound">
                                            </cc2:KasraGrid>
                                        </div>
                                    </fieldset>
                                    <asp:HiddenField ID="Totalpage2" runat="server" />
                                    <asp:HiddenField ID="txtCurPage2" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام محدوديت :
                        </td>
                        <td colspan="4">
                            <input type="text" runat="server" style="width:360px"  class="TxtControls" id="txtScriptName" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            محدوده اعتبار :
                        </td>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شرح :
                        </td>
                        <td colspan="4">
                            <asp:TextBox runat="server" CssClass="TxtControls"  Width="385px" Height="50px" ID="txtDescr" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit" OnClick="BtnSubmit2_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSelectedCode" runat="server" />
                    <input type="text" id="txtPageSize" runat="server" />
                    <input type="text" id="txtPageNumber" runat="server" />
                    <input type="text" id="txtPageSize2" runat="server" />
                    <input type="text" id="txtPageNumber2" runat="server" />
                    <input type="text" id="txtOrderString" runat="server" />
                    <input type="text" id="txtScriptID" runat="server" />
                    <input type="text" id="txtXmlSave" runat="server" />
                    <input type="text" id="txtP01" runat="server" />
                    <input type="text" id="txtTemplateName" runat="server" />
                    <input type="text" id="txtCodePID" name="txtCodePID" runat="server" />
                    <input type="text" id="txtGroupCodePID" name="txtGroupCodePID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
      <script language="javascript" type="text/javascript">
          //============================================Declaration========================================================
          var LastSelectedRow = null;
          var LastSelectedRowClass = "";
          var strChkCode = "", strCodes = "";
          var strChkGroupCode = "", strGroupCodes = "";
          var strMashmolin = "";
          var ScriptName1 = 'كدهاي مجاز به استفاده در مجوز'
          var ScriptName2 = 'گروه كدهاي مجاز به استفاده در مجوز'
          PageLoad();
          //==============================================================================================================
          function PageLoad() {
              if ($get(MasterObj + "txtTemplateName").value == "T_" + ScriptName1)
                  $get(MasterObj + "rdCode").checked = true;
              else if ($get(MasterObj + "txtTemplateName").value == "T_" + ScriptName2)
                  $get(MasterObj + "rdGroupCode").checked = true;
              else
                  $get(MasterObj + "rdCode").checked = true;
              OnClickRdCode();
              if ($get(MasterObj + "txtScriptID").value != "0") {
                  var Len = $get(MasterObj + "txtP01").value.split(',').length;
                  if ($get(MasterObj + "txtTemplateName").value == "T_" + ScriptName1) {
                      for (var i = 0; i < Len; i++) {
                          strChkCode += "<TbCode>";
                          strChkCode += "<CodeID>";
                          strChkCode += $get(MasterObj + "txtP01").value.split(',')[i]
                          strChkCode += "</CodeID>";
                          strChkCode += "<Selected>1</Selected>";
                          strChkCode += "</TbCode>";
                      }
                      SetChkCode();
                  }
                  else {
                      for (var i = 0; i < Len; i++) {
                          strChkGroupCode += "<TbCode>";
                          strChkGroupCode += "<GroupCodeId>";
                          strChkGroupCode += $get(MasterObj + "txtP01").value.split(',')[i]
                          strChkGroupCode += "</GroupCodeId>";
                          strChkGroupCode += "<Selected>1</Selected>";
                          strChkGroupCode += "</TbCode>";
                      }
                      SetChkGroupCode();
                  }
              }
          }
          //=====================================================AJAX=========================================================
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
              if (StrVal == "BtnNext" | StrVal == "BtnPrv" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const")
                  SetChkCode();
              if (StrVal == "BtnNext2" | StrVal == "BtnPrv2" | StrVal == "BtnFirst2" | StrVal == "BtnLast2" | StrVal == "Const2")
                  SetChkGroupCode();
              $get(MasterObj + "txtSubmit").value = "";
              $get(MasterObj + "txtAlert").value = "";
          }
          //=========================================Paging================================================================
          function OnClickBtnNext() {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              oRow = oRow.parentElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              if (oRow.id == MasterObj + "GrdSelectCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else if (oRow.id == MasterObj + "GrdGroupCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnNext2";
                  document.getElementById(MasterObj + "BtnSubmit2").click();
              }
          }
          //==============================================================================================================
          function OnClickBtnPrv() {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              oRow = oRow.parentElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              if (oRow.id == MasterObj + "GrdSelectCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else if (oRow.id == MasterObj + "GrdGroupCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv2";
                  document.getElementById(MasterObj + "BtnSubmit2").click();
              }
          }
          //==============================================================================================================
          function OnBlurtxtCurPage(obj) {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              oRow = oRow.parentElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                  if (oRow.id == MasterObj + "GrdSelectCode") {
                      document.getElementById(MasterObj + "txtCurPage").value = obj.value
                      document.getElementById(MasterObj + "txtSubmit").value = "Const"
                      document.getElementById(MasterObj + "BtnSubmit").click()
                  }
                  else if (oRow.id == MasterObj + "GrdGroupCode") {
                      document.getElementById(MasterObj + "txtCurPage2").value = obj.value
                      document.getElementById(MasterObj + "txtSubmit").value = "Const2"
                      document.getElementById(MasterObj + "BtnSubmit2").click()
                  }
              }
          }
          //==============================================================================================================
          function OnClickBtnLast() {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              oRow = oRow.parentElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              if (oRow.id == MasterObj + "GrdSelectCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else if (oRow.id == MasterObj + "GrdGroupCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnLast2";
                  document.getElementById(MasterObj + "BtnSubmit2").click();
              }
          }
          //==============================================================================================================
          function OnClickBtnFirst() {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              oRow = oRow.parentElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              if (oRow.id == MasterObj + "GrdSelectCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else if (oRow.id == MasterObj + "GrdGroupCode") {
                  document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst2";
                  document.getElementById(MasterObj + "BtnSubmit2").click();
              }
          }
          //==============================================================================================================
          function OnClickGrd(SelectedRow) {
              if (LastSelectedRow != null) {
                  LastSelectedRow.className = LastSelectedRowClass;
              }
              LastSelectedRowClass = SelectedRow.className;
              LastSelectedRow = SelectedRow;
              SelectedRow.className = "CssSelectedItemStyle";
          }
          //==============================================================================================================
          function OnClickBtnSelectScriptGroups() {
              var strUrl = "ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=13"
              var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 550px;dialogWidth: 1100px;center: Yes;help: no;status: no')
              strMashmolin = rValue;
          }
          //==============================================================================================================
          function OnClickBtnSave() {
              if (checkNotEmpty() == true) {
                  MakeXML()
                  $get(MasterObj + "txtSubmit").value = "Modify";
                  $get(MasterObj + "BtnSubmit").click();
              }
          }
          //==============================================================================================================
          function MakeXML() {
              var SDate = $get(MasterObj + "KCalSDate_txtYear").value + '/' + $get(MasterObj + "KCalSDate_txtMonth").value + '/' + $get(MasterObj + "KCalSDate_txtDay").value
              var EDate = $get(MasterObj + "KCalEDate_txtYear").value + '/' + $get(MasterObj + "KCalEDate_txtMonth").value + '/' + $get(MasterObj + "KCalEDate_txtDay").value
              var XMLStr = '<Root>';
              XMLStr += '<Tb>'
              XMLStr += '<ID>' + $get(MasterObj + "txtScriptID").value + '</ID>';
              XMLStr += '<Step>80</Step>'
              XMLStr += "<Desc>" + $get(MasterObj + "txtDescr").value + "</Desc>";
              XMLStr = XMLStr + "<Parameters>1</Parameters>"
              XMLStr += '<Name>' + $get(MasterObj + "txtScriptName").value + '</Name>'
              XMLStr += ' <SDate>' + SDate + '</SDate>'
              XMLStr += '<EDate>' + EDate + '</EDate>'
              XMLStr += '<Priority>1</Priority>'
              XMLStr += '<Active>1</Active>'
              XMLStr += '<TemplateName>' + (($get(MasterObj + "rdCode").checked) ? ScriptName1 : ScriptName2) + '</TemplateName>'
              XMLStr += '<Type>2</Type>'
              XMLStr += '</Tb>'
              XMLStr += '<Parameter>'
              XMLStr += '<ParameterValue>' + GetParameterVal() + '</ParameterValue>'
              XMLStr += '<ParameterNO>' + (($get(MasterObj + "rdCode").checked) ? $get(MasterObj + "txtCodePID").value : $get(MasterObj + "txtGroupCodePID").value) + '</ParameterNO>'
              XMLStr += '</Parameter>'
              XMLStr += strMashmolin
              XMLStr += '</Root>'
              $get(MasterObj + "txtXmlSave").value = XMLStr;
          }
          //==============================================================================================================
          function checkNotEmpty() {
              var SDate = $get(MasterObj + "KCalSDate_txtYear").value + '/' + $get(MasterObj + "KCalSDate_txtMonth").value + '/' + $get(MasterObj + "KCalSDate_txtDay").value
              var EDate = $get(MasterObj + "KCalEDate_txtYear").value + '/' + $get(MasterObj + "KCalEDate_txtMonth").value + '/' + $get(MasterObj + "KCalEDate_txtDay").value
              if (strChkCode == '' && strChkGroupCode=='') {
                  alert('لطفا کدها يا گروه کدهاي مورد نظر خود را انتخاب نماييد')
                  return false;
              }
              else if ($get(MasterObj + "txtScriptName").value == "") {
                  alert("لطفا نام محدوديت را وارد نماييد")
                  $get(MasterObj + "txtScriptName").focus()
                  return false;
              }
              else if ($get(MasterObj + "KCalSDate_txtCalendar").value == "") {
                  alert("لطفا تاريخ شروع را وارد نماييد")
                  $get(MasterObj + "KCalSDate_txtCalendar").focus()
                  return false;
              }
              else if ($get(MasterObj + "KCalEDAte_txtCalendar").value == "") {
                  alert("لطفا تاريخ خاتمه را وارد نماييد")
                  $get(MasterObj + "KCalEDAte_txtCalendar").focus()
                  return false;
              }
              if (SDate > EDate)
                  alert("تاريخ شروع بزرگتر از تاريخ پايان است");
              else
                  return true;
          }
          //==============================================================================================================
          function GetParameterVal() {
              if ($get(MasterObj + "rdCode").checked == true) {
                  var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                  oXmlDoc.async = "false";
                  strChkCode = "<Root>" + strChkCode + "</Root>";
                  oXmlDoc.loadXML(strChkCode);
                  var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[ Selected=1]");
                  var StrCodeId = "";
                  for (var i = 0; i < oXmlNodes.length; i++) {
                      {
                          if (StrCodeId == "")
                              StrCodeId = oXmlNodes.item(i).selectSingleNode("CodeID").text
                          else
                              StrCodeId = StrCodeId + "," + oXmlNodes.item(i).selectSingleNode("CodeID").text;
                      }
                  }
                  return StrCodeId;
              }
              else {
                  var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                  oXmlDoc.async = "false";
                  strChkGroupCode = "<Root>" + strChkGroupCode + "</Root>";
                  oXmlDoc.loadXML(strChkGroupCode);
                  var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[ Selected=1]");
                  var strGroupCodeID = "";
                  for (var i = 0; i < oXmlNodes.length; i++) {
                      {
                          if (strGroupCodeID == "")
                              strGroupCodeID = oXmlNodes.item(i).selectSingleNode("GroupCodeId").text
                          else
                              strGroupCodeID = strGroupCodeID + "," + oXmlNodes.item(i).selectSingleNode("GroupCodeId").text;
                      }
                  }
                  return strGroupCodeID;

              }
          }
          //==============================================================================================================
          function OnClickHeaderChk(obj) {
              var oRow = window.event.srcElement
              for (var i = 0; oRow.tagName != "TABLE"; i++) {
                  oRow = oRow.parentElement
              }
              var OGrid = obj.parentElement.parentElement.parentElement;
              var grdLen = OGrid.rows.length;
              if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                  grdLen = grdLen - 1;
              for (var i = 1; i < grdLen; i++) {
                  OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                  if (oRow.id == MasterObj + "GrdSelectCode")
                      OnClickChkCode(OGrid.rows(i).cells(0).firstChild);
                  else if (oRow.id == MasterObj + "GrdGroupCode")
                      OnClickChkGroupCode(OGrid.rows(i).cells(0).firstChild);
              }
          }
          //==============================================================================================================
          function OnClickChkCode(obj) {
              var oGrid = obj.parentElement;
              while (oGrid.tagName != "TABLE")
                  oGrid = oGrid.parentElement

              var oRow = obj.parentElement;
              while (oRow.tagName != "TR")
                  oRow = oRow.parentElement
              var oIndex = oRow.rowIndex
              //========================================================  
              var CodeID = oGrid.rows(oIndex).cells(1).innerText;
              if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                  if (strCodes.search(CodeID) == -1)
                      strCodes = ((strCodes == '') ? CodeID : strCodes + ',' + CodeID);
              }
              else {
                  if (strCodes.search(CodeID) != -1)
                      strCodes = strCodes.replace(CodeID + ',', '');
              }
              //========================================================
              var strXml = "<Root>" + strChkCode + "</Root>"

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + CodeID + "]");
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
                  strChkCode = strXml.replace("<Root>", "");
                  strChkCode = strChkCode.replace("</Root>", "");
              }
              else {
                  strChkCode += "<TbCode>"
                  strChkCode += "<CodeID>" + CodeID + "</CodeID>"
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                      strChkCode += "<Selected>0</Selected>"
                  else
                      strChkCode += "<Selected>1</Selected>"
                  strChkCode += "<CodeName>" + oGrid.rows(oIndex).cells(2).innerText + "</CodeName>";
                  strChkCode += "</TbCode>"
              }
             
          }
          //==============================================================================================================
          function OnClickChkGroupCode(obj) {
              var oGrid = obj.parentElement;
              while (oGrid.tagName != "TABLE")
                  oGrid = oGrid.parentElement

              var oRow = obj.parentElement;
              while (oRow.tagName != "TR")
                  oRow = oRow.parentElement
              var oIndex = oRow.rowIndex
              //========================================================
              var GroupCodeID = oGrid.rows(oIndex).cells(2).innerText;
              if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                  if (strGroupCodes.search(GroupCodeID) == -1)
                      strGroupCodes = ((strGroupCodes == '') ? GroupCodeID : strGroupCodes + ',' + GroupCodeID);
              }
              else {
                  if (strGroupCodes.search(GroupCodeID) != -1)
                      strGroupCodes = strGroupCodes.replace(GroupCodeID + ',', '');
              }
              //========================================================
              var strXml = "<Root>" + strChkGroupCode + "</Root>"

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ GroupCodeId=" + GroupCodeID + "]");
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
                  strChkGroupCode = strXml.replace("<Root>", "");
                  strChkGroupCode = strChkGroupCode.replace("</Root>", "");
              }
              else {
                  strChkGroupCode += "<TbCode>"
                  strChkGroupCode += "<GroupCodeId>" + GroupCodeID + "</GroupCodeId>"
                  if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                      strChkGroupCode += "<Selected>0</Selected>"
                  else
                      strChkGroupCode += "<Selected>1</Selected>"
                  strChkGroupCode += "<GroupCodeName>" + GroupCodeID + "</GroupCodeName>";
                  strChkGroupCode += "</TbCode>"
              }
          }
          //==============================================================================================================
          function SetChkCode() {
              var OGrid = document.getElementById(MasterObj + "GrdSelectCode");
              if (OGrid == null)
                  return
              var PageSize = OGrid.rows.length - 1;
              var strXml = "<Root>" + strChkCode + "</Root>"
              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode");
              for (var j = 0; j < oXmlNodes.length; j++) {
                  for (var i = 1; i < PageSize; i++) {
                      if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("CodeID").text) {
                          if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                              OGrid.rows(i).cells(0).firstChild.checked = true;
                          else
                              OGrid.rows(i).cells(0).firstChild.checked = false;
                      }
                  }
              }
          }
          //==============================================================================================================
          function SetChkGroupCode() {
              var OGrid = document.getElementById(MasterObj + "GrdGroupCode");
              if (OGrid == null)
                  return
              var PageSize = OGrid.rows.length - 1;
              var strXml = "<Root>" + strChkGroupCode + "</Root>"

              var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDoc.async = "false";
              oXmlDoc.loadXML(strXml);

              var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode");
              for (var j = 0; j < oXmlNodes.length; j++) {
                  for (var i = 1; i < PageSize; i++) {
                      if (OGrid.rows(i).cells(2).innerText == oXmlNodes.item(j).selectSingleNode("GroupCodeId").text) {
                          if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                              OGrid.rows(i).cells(0).firstChild.checked = true;
                          else
                              OGrid.rows(i).cells(0).firstChild.checked = false;
                      }
                  }
              }
          }
          //==============================================================================================================
          function OnClickChkSelectedGroup() {
              if (document.getElementById(MasterObj + "chkSelectedCode").checked == true) {
                  SelectedFlag = 1;
                  document.getElementById(MasterObj + "txtSelectedCode").value = 1;
                  document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else if (document.getElementById(MasterObj + "chkSelectedCode").checked == false) {
                  document.getElementById(MasterObj + "txtSelectedCode").value = 0;
                  document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //==============================================================================================================
          function OnClickRdCode() { 
              var OGrid = document.getElementById(MasterObj + "GrdSelectCode");
              var OGridGroupCode = document.getElementById(MasterObj + "GrdGroupCode");
              if (OGrid == null)
                  return
              var grdLen = OGrid.rows.length;
              if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                  grdLen = grdLen - 1;


              if (OGridGroupCode == null)
                  return
              var grdGroupCodeLen = OGridGroupCode.rows.length;
              if (OGridGroupCode.rows(grdGroupCodeLen - 1).getAttribute("Footer") == 1)
                  grdGroupCodeLen = grdGroupCodeLen - 1;

              if ($get(MasterObj + "rdCode").checked == true) {
                  for (var i = 0; i < grdLen; i++)
                      OGrid.rows(i).cells(0).firstChild.disabled = false;
                  for (var i = 0; i < grdGroupCodeLen; i++) {
                      OGridGroupCode.rows(i).cells(0).firstChild.disabled = true;
                      // OGridGroupCode.rows(i).cells(0).firstChild.checked = false;
                      // strChkGroupCode = "";
                      // strGroupCodes = "";
                  }
                  $get(MasterObj + "chkSelectedGroupCode").disabled = true;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnLast").disabled = true;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnLast").style.cursor = "";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnNext").disabled = true;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnNext").style.cursor = "";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnFirst").disabled = true;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnFirst").style.cursor = "";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnPrv").disabled = true;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnPrv").style.cursor = "";
                  $get(MasterObj + "GrdGroupCode_ctl12_txtCurPage").disabled = true;
                  //-----------------------------------------------------------------
                  $get(MasterObj + "chkSelectedCode").disabled = false;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnLast").disabled = false;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnLast").style.cursor = "pointer";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnNext").disabled = false;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnNext").style.cursor = "pointer";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnFirst").disabled = false;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnFirst").style.cursor = "pointer";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnPrv").disabled = false;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnPrv").style.cursor = "pointer";
                  $get(MasterObj + "GrdSelectCode_ctl12_txtCurPage").disabled = false;
              }
              else if ($get(MasterObj + "rdGroupCode").checked == true) {
                  for (var i = 0; i < grdGroupCodeLen; i++)
                      OGridGroupCode.rows(i).cells(0).firstChild.disabled = false;
                  for (var i = 0; i < grdLen; i++) {
                      OGrid.rows(i).cells(0).firstChild.disabled = true;
                      // OGrid.rows(i).cells(0).firstChild.checked = false;
                      // strChkCode = "";
                      //  strCodes = "";
                  }
                  $get(MasterObj + "chkSelectedCode").disabled = true;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnLast").disabled = true;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnLast").style.cursor = "";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnNext").disabled = true;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnNext").style.cursor = "";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnFirst").disabled = true;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnFirst").style.cursor = "";
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnPrv").disabled = true;
                  $get(MasterObj + "GrdSelectCode_ctl12_BtnPrv").style.cursor = "";
                  $get(MasterObj + "GrdSelectCode_ctl12_txtCurPage").disabled = true;
                  //-----------------------------------------------------------------
                  $get(MasterObj + "chkSelectedGroupCode").disabled = false;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnLast").disabled = false;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnLast").style.cursor = "pointer";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnNext").disabled = false;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnNext").style.cursor = "pointer";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnFirst").disabled = false;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnFirst").style.cursor = "pointer";
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnPrv").disabled = false;
                  $get(MasterObj + "GrdGroupCode_ctl12_BtnPrv").style.cursor = "pointer";
                  $get(MasterObj + "GrdGroupCode_ctl12_txtCurPage").disabled = false;
              }
          }
          //==============================================================================================================
     </script>
</asp:Content>