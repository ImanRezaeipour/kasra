<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeCondition.aspx.cs" Inherits="TAPresentation.App_Utility.CodeCondition.CodeCondition1" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc3" %>
<%@ Register src="CodeCondition.ascx" tagname="CodeCondition" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <table >
        <tr>
            <td style="width:545px" >  
            <fieldset dir="rtl" class="fieldsetStyle">
           <legend class="legendStyle">پارامترهای جستجو</legend>
                <table>
                    <tr>
                        <td>
                            نام کد :
                        </td>
                        <td >
                            <uc3:ComboBox ID="CmbNameCode" runat="server" />
                        </td>
                    </tr>
                </table>
                 </fieldset>
            </td>
        </tr>
        <tr>
       <td>
        <table>
        <tr>
            <td style="width:490px">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptGroups.aspx" />
            </td>
        </tr>
        </table>
        </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width:600px" align="center">
                            <cc2:KasraGrid ID="GrdfrmCode" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                    
                        </div>
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
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
        <input type="text" id="txtAcronym" runat="server" />
        <input type="text" id="txtHidden" runat="server" />
        <input type="text" id="txtXML" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:DropDownList ID="cmbCodeOperand" runat="server">
        </asp:DropDownList>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
         <input type="text" id="txtSearchflag" name="txtSearchflag" runat="server" />
          <input type="text" id="txtXMLSaved" name="txtXMLSaved" runat="server" />
            <input type="text" id="txtCode" name="txtCode" runat="server" />
    </div>
    <script type="text/javascript" src="../Scripts/General.js"></script>
    <script type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.scroll = "no";
        var str1 = ""
        var s = $get(MasterObj + "txtXMLSaved").value
        var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocSave.loadXML(s);
        var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/DataEntryEntity/CodeCondition[Chk=1]");
        for (i = 0; i < XmlNodeTmp.length; i++) {
            str1 += "<CodeCondition>";
            str1 += "<Chk>1</Chk>"
            str1 += "<CodeID>" + XmlNodeTmp.item(i).selectSingleNode('CodeID').text + "</CodeID>"  
            str1 += "<CodeName>" + XmlNodeTmp.item(i).selectSingleNode('CodeName').text + "</CodeName>"
            str1 += "<operand>" + XmlNodeTmp.item(i).selectSingleNode('operand').text+ "</operand>"
            str1 += "<val>" + XmlNodeTmp.item(i).selectSingleNode('val').text + "</val>"
            str1 += "<Daily>" + XmlNodeTmp.item(i).selectSingleNode('Daily').text + "</Daily>"
            str1 += "</CodeCondition>"
        }


      //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            var StrVal = $get(MasterObj + "txtSubmit").value
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            LastSelectedRowClass = ""
            LastSelectedRow = null
            LastSelectedRowClass = ""
            if (document.getElementById(MasterObj + "txtHidden").value == "SelectCode")
                SetChkSelectCode()
                else
              SetChk()
           
           

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
//           $get(MasterObj + "txtSearchflag").value = "0"
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
//             $get(MasterObj + "txtSearchflag").value = "0"
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
         
        }
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
       // ======================================رنگی شدن سطر گرید با کلیک کردن روی سطر=====================================
        function OnClickGrd(SelectedRow) {
        
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //=================================================== Chkتيک خوردن همه ============================================

        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
            var grdLen = OGrid.rows.length;
            if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                if (document.getElementById(MasterObj + "txtHidden").value == "SelectCode")
                    OnClickChkSelectCode(OGrid.rows(i).cells(0).firstChild); 
                else
                OnClickChk(OGrid.rows(i).cells(0).firstChild); 
            }
        }
        //==============================================OnClickChk======================================================
        function OnClickChk(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var CodeID = TbObj.rows(RowIndex).getAttribute("CodeID")
            var val = TbObj.rows(RowIndex).cells(3).firstChild.value
            var Daily = TbObj.rows(RowIndex).getAttribute("Daily")
            var CodeName = TbObj.rows(RowIndex).cells(1).firstChild.innerText.trim();
            var operand = TbObj.rows(RowIndex).cells(2).firstChild.value
            var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<DataEntryEntity></DataEntryEntity>") && (strXML != "<DataEntryEntity/>"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/DataEntryEntity/CodeCondition[CodeID=" + CodeID + " and Daily=" + Daily + "]");
//                alert(XmlNodeTmp.length)
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true)
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                str1 = oXmlDocSave.xml;
                str1 = str1.replace("<DataEntryEntity>", "")
                str1 = str1.replace("</DataEntryEntity>", "")

            }
            else {

                str1 += "<CodeCondition>";
                str1 += "<Chk>1</Chk>"
                str1 += "<CodeID>" + CodeID + "</CodeID>"
                str1 += "<CodeName>" + CodeName + "</CodeName>"
                str1 += "<operand>" + operand + "</operand>"
                str1 += "<val>" + val + "</val>"
                str1 += "<Daily>" + Daily + "</Daily>"
                str1 += "</CodeCondition>";
                //alert(str1)
               SetChk()
            }
        }
        //================================================SetChk====================================================
        function SetChk() {
          
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
            oXml.loadXML(strXML);
            //                        alert(strXML)
            var XmlNode = oXml.documentElement.selectNodes("/DataEntryEntity/CodeCondition");

            if (XmlNode.length != 0) {
                var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
                if (OGrid != null) {
                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;

                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("CodeCondition[CodeID=" + OGrid.rows(i).getAttribute("CodeID") + "and Daily=" + OGrid.rows(i).getAttribute("Daily") + "]");
                        if (XmlNode1.length != 0) {
                            if (XmlNode1.item(0).selectSingleNode('Chk').text.toString() == "1") {
                                OGrid.rows(i).cells(0).firstChild.checked = true
                                if (XmlNode1.item(0).selectSingleNode('operand').text != "") {
                                    var ChSign = XmlNode1.item(0).selectSingleNode('operand').text == "LG" ? "<>" :
                                                XmlNode1.item(0).selectSingleNode('operand').text == "LE" ? "<=" :
                                                 XmlNode1.item(0).selectSingleNode('operand').text == "GE" ? ">=" :
                                                  XmlNode1.item(0).selectSingleNode('operand').text == "G" ? ">" :
                                                   XmlNode1.item(0).selectSingleNode('operand').text == "L" ? "<" : "=";
                                    OGrid.rows(i).cells(2).firstChild.value = ChSign;

                                    // alert(XmlNode1.item(0).selectSingleNode('val').text)
                                }
                                if (XmlNode1.item(0).selectSingleNode('Daily').text.toString() == "1")
                                    OGrid.rows(i).cells(3).firstChild.value = XmlNode1.item(0).selectSingleNode('val').text
                                else
                                    OGrid.rows(i).cells(3).firstChild.value = XmlNode1.item(0).selectSingleNode('val').text
                            }
                            else {

                                OGrid.rows(i).cells(0).firstChild.checked = false
                                if (XmlNode1.item(0).selectSingleNode('operand').text != "") {
                                    var ChSign = XmlNode1.item(0).selectSingleNode('operand').text == "LG" ? "<>" :
                                                XmlNode1.item(0).selectSingleNode('operand').text == "LE" ? "<=" :
                                                 XmlNode1.item(0).selectSingleNode('operand').text == "GE" ? ">=" :
                                                  XmlNode1.item(0).selectSingleNode('operand').text == "G" ? ">" :
                                                   XmlNode1.item(0).selectSingleNode('operand').text == "L" ? "<" : "=";
                                    OGrid.rows(i).cells(2).firstChild.value = ChSign;

                                    // alert(XmlNode1.item(0).selectSingleNode('val').text)
                                }
                                if (XmlNode1.item(0).selectSingleNode('Daily').text.toString() == "1")
                                    OGrid.rows(i).cells(3).firstChild.value = XmlNode1.item(0).selectSingleNode('val').text
                                else
                                    OGrid.rows(i).cells(3).firstChild.value = XmlNode1.item(0).selectSingleNode('val').text
                          }
                        }
                    }
                }
            }
        }
                        
            //=============================================جستجو کردن ==================================================
            function OnClickBtnSearch() {
                $get(MasterObj + "txtCode").value = document.getElementById(MasterObj + "CmbNameCode_txtCode").value
                if ($get(MasterObj + "txtCode").value != "") {
                    $get(MasterObj + "txtSearchflag").value = "1"
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }

                else {
                    var LastSelectedRow = null;
                    var LastSelectedRowClass = "";
                    $get(MasterObj + "txtSearchflag").value = "0"
                }
                

            }
            //===============================================================================================
            function OnchangeCodeID(obj) {
                var RowIndex = obj.parentElement.parentElement.rowIndex;
                var TbObj = obj.parentElement.parentElement.parentElement.parentElement
                var CodeID = TbObj.rows(RowIndex).getAttribute("CodeID")
                var val = TbObj.rows(RowIndex).cells(3).firstChild.innerText.trim()
                var Daily = TbObj.rows(RowIndex).getAttribute("Daily")
                var CodeName = TbObj.rows(RowIndex).cells(1).firstChild.innerText.trim();
                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '<>') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '<>', 'LG')
                }
                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '<=') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '<=', 'LE')
                }

                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '>=') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '>=', 'GE')
                }

                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '>') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '>', 'G')
                }
                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '<') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '<', 'L')
                }

                if (TbObj.rows(RowIndex).cells(2).firstChild.value == '=') {
                    var operand = ReplaceAll(TbObj.rows(RowIndex).cells(2).firstChild.value, '=', 'E')
                }

                    var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
                    TbObj.rows(RowIndex).cells(0).firstChild.checked = true
                    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDocSave.loadXML(strXML);
                    var XmlNodeTmp = "";
                    if ((strXML != "<DataEntryEntity></DataEntryEntity>") && (strXML != "<DataEntryEntity/>"))
                        XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/DataEntryEntity/CodeCondition[CodeID=" + CodeID + " and Daily=" + Daily + "]")
                    if (XmlNodeTmp.length > 0) {
                        if (XmlNodeTmp.item(0).selectSingleNode('operand').text != operand) {
                            XmlNodeTmp.item(0).selectSingleNode('operand').text = operand
                            XmlNodeTmp.item(0).selectSingleNode('Chk').text="1"
                            strXML = oXmlDocSave.xml
                            str1 = ReplaceAll(ReplaceAll(strXML, "<DataEntryEntity>", ""), "</DataEntryEntity>", "");
                        }
                                        
                    }
                    else {
                        str1 += "<CodeCondition>"
                        str1 += "<Chk>1</Chk>"
                        str1 += "<CodeID>" + CodeID + "</CodeID>"
                        str1 += "<CodeName>" + CodeName + "</CodeName>"
                        str1 += "<operand>" + operand + "</operand>"
                        str1 += "<val>" + val + "</val>"
                        str1 += "<Daily>" + Daily + "</Daily>"
                        str1 += "</CodeCondition>";
                    }

                    SetChk()
                }
         
            
 //===============================================================================================

      function OnblurCode(obj) {

          var RowIndex = obj.parentElement.parentElement.rowIndex;
          var TbObj = obj.parentElement.parentElement.parentElement.parentElement
          var CodeID = TbObj.rows(RowIndex).getAttribute("CodeID")
          var operand = TbObj.rows(RowIndex).cells(2).firstChild.value
          var Daily = TbObj.rows(RowIndex).getAttribute("Daily")
          var CodeName = TbObj.rows(RowIndex).cells(1).firstChild.innerText.trim();
          if (TbObj.rows(RowIndex).cells(3).firstChild.value != "") {
              TbObj.rows(RowIndex).cells(0).firstChild.checked = true;
              if (Daily == 1)
                  OnKeyDownInt(obj)
              else {
                  OnKeyDownTime(obj)
                  Timechk(obj)
              }
              var val = TbObj.rows(RowIndex).cells(3).firstChild.value
              var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
              var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
              oXmlDocSave.loadXML(strXML);
              //            alert(oXmlDocSave.xml)
              var XmlNodeTmp = "";
              if ((strXML != "<DataEntryEntity></DataEntryEntity>") && (strXML != "<DataEntryEntity/>"))
                  XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/DataEntryEntity/CodeCondition[CodeID=" + CodeID + " and Daily=" + Daily + "]")
              if (XmlNodeTmp.length > 0) {
                  
                  if (XmlNodeTmp.item(0).selectSingleNode('val').text != val) {
                      XmlNodeTmp.item(0).selectSingleNode('val').text = val
                      XmlNodeTmp.item(0).selectSingleNode('Chk').text = "1"
                      strXML = oXmlDocSave.xml
                      // alert( strXML)
                      str1 = ReplaceAll(ReplaceAll(strXML, "<DataEntryEntity>", ""), "</DataEntryEntity>", "");
                  }
                  //                  
              }
              else {
                  str1 += "<CodeCondition>"
                  str1 += "<Chk>1</Chk>"
                  str1 += "<CodeID>" + CodeID + "</CodeID>"
                  str1 += "<CodeName>" + CodeName + "</CodeName>"
                  str1 += "<operand>" + operand + "</operand>"
                  str1 += "<val>" + val + "</val>"
                  str1 += "<Daily>" + Daily + "</Daily>"
                  str1 += "</CodeCondition>";
              }

             SetChk()
          }

      }

//=====================================================چک کردن خالی نبودن آبجکت ها==========================================
            function ChkNotIsEmpty() {
    var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
    var lll = OGrid.rows.length
    for (i = 1; i < lll; i++) {
        if (document.getElementById(MasterObj + "txtHidden").value != "SelectCode") {
            if (OGrid.rows(i).cells(0).firstChild.checked) {
                if ((OGrid.rows(i).cells(2).childNodes(0).value != 0)) {
                    if ((OGrid.rows(i).cells(3).childNodes(0).value == "")) {
                        alert(" را وارد کنيد " + OGrid.rows(i).cells(1).innerText + "لطفا مقدار کد ")
                        return false;
                    }
                }
                else if ((OGrid.rows(i).cells(3).childNodes(0).value != "")) {
                    if ((OGrid.rows(i).cells(2).childNodes(0).value == 0)) {
                        alert("  را وارد کنيد" + OGrid.rows(i).cells(1).innerText + " لطفا عملگر کد")
                        return false;
                    }
                }
            }
        }
    }
    return true;
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!تایید کردن!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOk() {
            if (ChkNotIsEmpty()) {
               CreateStr()
                returnValue = strChk + "|" + HTM + "|" + TXT
                window.close();
            }
        }
 //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateStr() {
            HTM = "";
            TXT = "";
            strChk = "";
            var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
            var oLen = OGrid.rows.length
            var code = '', Action = '', val = '', c = 0;
            if (document.getElementById(MasterObj + "txtHidden").value != "SelectCode") {
                for (var i = 1; i < oLen; i++) {
                    if (OGrid.rows(i).cells(0).firstChild.checked) {
                        code = OGrid.rows(i).cells(1).title
                        Action = OGrid.rows(i).cells(2).childNodes(0).value
                        val = OGrid.rows(i).cells(3).childNodes(0).value
                        if (HTM != "") {
                            if (c < 2)
                                HTM += "<font style='color: #FF3399'>+</font>"
                            TXT += "+"
                        }
                        if (c < 2)
                            HTM += code + Action + val
                        TXT += code + Action + val
                        strChk += OGrid.rows(i).CodeID + "_" + Action + "$" + val + "#1;"
                        c++;
                    }
                }
                if (c > 2) HTM += "<font style='color: #FF3399'>+</font>" + "..."
            }
            if (document.getElementById(MasterObj + "txtHidden").value == "SelectCode") {
                for (var i = 1; i < oLen; i++) {
                    if (OGrid.rows(i).cells(0).firstChild.checked) {
                        code = OGrid.rows(i).getAttribute("CodeID")
                        if (HTM != "") {
                            HTM += "<font style='color: #FF3399'>,</font>"
                            TXT += ","
                        }
                        HTM += code
                        TXT += code
                        strChk += OGrid.rows(i).CodeID
                        c++;

                    }
                }

            }
        }

           
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!پاک کردن  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function OnClickBtnClear() {
            var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
            var lll = OGrid.rows.length
            if (OGrid.rows(lll - 1).getAttribute("Footer") == 1)
                lll = lll - 1;
            for (i = 0; i < lll ; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = false
                if (document.getElementById(MasterObj + "txtHidden").value != "SelectCode")
                {
                OGrid.rows(i).cells(2).firstChild.value = ""
                OGrid.rows(i).cells(3).firstChild.value = ""
                }
                var strXML = "<DataEntryEntity></DataEntryEntity>";
                var oXml = new ActiveXObject("Microsoft.XMLDOM");  
                strXML = oXml.xml
                str1 = ReplaceAll(ReplaceAll(strXML, "<DataEntryEntity>", ""), "</DataEntryEntity>", "");
                document.getElementById(MasterObj + "CmbNameCode_txtPCode").value = ""
                document.getElementById(MasterObj + "CmbNameCode_txtCode").value = ""
                document.getElementById(MasterObj + "CmbNameCode_txtName").value = ""
             
            }
        }

//        //==============================================OnClickChkSelectCode======================================================
        function OnClickChkSelectCode(obj) {
           
            var RowIndex = obj.parentElement.parentElement.rowIndex
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
           var CodeID = TbObj.rows(RowIndex).getAttribute("CodeID")
           var Daily = TbObj.rows(RowIndex).getAttribute("Daily")
            var CodeName = TbObj.rows(RowIndex).cells(1).firstChild.innerText.trim();
            var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<DataEntryEntity></DataEntryEntity>") && (strXML != "<DataEntryEntity/>"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/DataEntryEntity/CodeCondition[CodeID=" + CodeID + " and Daily=" + Daily + "]")
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true) 
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                str1 = oXmlDocSave.xml;
                str1 = str1.replace("<DataEntryEntity>", "")
                str1 = str1.replace("</DataEntryEntity>", "")

            }
            else {

                str1 += "<CodeCondition>";
                str1 += "<Chk>1</Chk>"
                str1 += "<CodeID>" + CodeID + "</CodeID>"
                str1 += "<CodeName>" + CodeName + "</CodeName>"
                str1 += "<Daily>" + Daily + "</Daily>"
                str1 += "</CodeCondition>";
                SetChkSelectCode()
            }
          
        }
//        //================================================SetChkSelectCode====================================================
        function SetChkSelectCode() {

            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            var strXML = "<DataEntryEntity>" + str1 + "</DataEntryEntity>";
            oXml.loadXML(strXML);
            var XmlNode = oXml.documentElement.selectNodes("/DataEntryEntity/CodeCondition");

            if (XmlNode.length != 0) {
                var OGrid = document.getElementById(MasterObj + "GrdfrmCode");
                if (OGrid != null) {
                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;
                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("CodeCondition[CodeID=" + OGrid.rows(i).getAttribute("CodeID") + "and Daily=" + OGrid.rows(i).getAttribute("Daily") + "]");
                        if (XmlNode1.length != 0) {
                            if (XmlNode1.item(0).selectSingleNode('Chk').text.toString() == "1")
                                OGrid.rows(i).cells(0).firstChild.checked = true
                            else
                                OGrid.rows(i).cells(0).firstChild.checked = false
                        }
                    }

                }

            }
        }


       
    </script>
</asp:Content>