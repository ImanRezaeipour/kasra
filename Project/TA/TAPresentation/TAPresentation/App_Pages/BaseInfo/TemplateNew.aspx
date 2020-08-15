<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TemplateNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.TemplateNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssAlternatingItemStyle
        {
            direction: rtl;
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            background-color: OldLace;
            border-bottom-style: groove;
        }
        .CssItemStyle
        {
            direction: rtl;
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            background-color: #d5e1fd;
            border-bottom-style: groove;
        }
        .XItemStyle
        {
            background-color: #D5E1FD;
            font-family: tahoma Normal;
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

    <table>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" PageName="TemplateNew.aspx" />
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
                        if ($get(MasterObj + "txtAlert").value != "") {
                            if ($get(MasterObj + "txtAlertStatus").value == "2") {
                                if ($get(MasterObj + "txtAlert").value == "RepeatInfo")
                                    alert("الگو تکراري است");
                            }
                            else {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                returnValue = 1
                            }
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlertStatus").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            نام الگو
                        </td>
                        <td>
                            <input type="text" id="txtTemplateName" runat="server" class="TxtControls" style="width:300px" />
                        </td>
                      
                    </tr>
                    <tr>
                     <td>
                            مرحله اجرا
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="250px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td valign="top">
                            شرح
                        </td>
                        <td colspan="3">
                            <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 360px; height: 60px">
                            </textarea>
                        </td>
                       
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
                     <td colspan="2">
                     <table><tr> <td valign="top">
                            تعداد پارامتر
                        </td>
                        <td valign="top">
                            <input type="text" onblur="onblurtxtParameters()" onkeydown="OnKeyDownNum('integer',this.value)"
                                id="txtParameters" runat="server" style="width: 40px" class="TxtControls" />
                        </td><td>
                        <table id="XTabTable_Header" style="width: 590px; height: 26px;">
                                            <thead style="display: inline">
                                                <tr>
                                                    <td align="center" class="CssHeaderStyle" width="50px">
                                                    هشدار 
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 120px">
                                                        نام پارامتر
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" width="140px">
                                                        شرح پارامتر
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 100px">
                                                        مقدار پيش فرض
                                                    </td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 100px">
                                                        نوع
                                                    </td>
                                                    <td style="width:50px" class="CssHeaderStyle"></td>
                                                </tr>
                                            </thead>
                                        </table>
                            <div style="scrollbar-arrow-color: black; width: 620px; border-collapse: separate;
                                scrollbar-base-color: #b0c4de; height: 100px; scrollbar-highlight-color: white;
                                overflow: auto">
                                <table width="590px" id="XTabTable">
                                </table>
                            </div>
                        </td></tr></table></td>
                    </tr>
            <table>
                <tr>
                    <td valign="top">
                        متن
                    </td>
                    <td>
                        <textarea id="txtSQLCommand" class="TxtControls" dir="ltr" 
                        style="position: relative;width: 700px; height: 350px" runat="server" ></textarea>
                        <%--<textarea id="txtSQLCommand" wrap="OFF" dir="ltr" cols="105" rows="25" style="scrollbar-highlight-color: white;
                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                            position: relative;" runat="server"></textarea>--%>
                    </td>
                </tr>
            </table>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <asp:HiddenField id="txtUpdateTemplateName" runat="server"  />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtUpdateXml" name="txtUpdateXml" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                     <input type="text" id="txtSqlComm"  runat="server" name="txtSqlComm" class="TxtControls" />   
                    
                    <input type="text" id="txtPageID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                     <asp:DropDownList ID="cmbParamType" runat="server">
                    </asp:DropDownList>
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        
        $get(MasterObj + "txtDesc").value = ""
        //$get(MasterObj + "txtSQLCommand").value = ""
        var newrowindex = 0;
        BindPage();
        var rvlaue = ""
        document.body.scroll = "no";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
     
            if ($get(MasterObj + "txtUpdateXml").value != "") {
                var strXml = $get(MasterObj + "txtUpdateXml").value
//                alert( $get(MasterObj + "txtUpdateXml").value)
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/TemplateDescription");
                
               
                if (oXmlNodes.length > 0) {
                    $get(MasterObj + "txtTemplateName").value = oXmlNodes.item(0).selectSingleNode("TemplateName").text
                    $get(MasterObj + "cmbStep").value = oXmlNodes.item(0).selectSingleNode("StepID").text
                    $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Descriptin").text
                    //$get(MasterObj + "txtSQLCommand").value = oXmlNodes.item(0).selectSingleNode("TemplateCommand").text

                    var oGrid = document.all.item("XTabTable")
                    var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc1.async = "false";
                    oXmlDoc1.loadXML(strXml); 
                    var oXmlNodes1 = oXmlDoc1.documentElement.selectNodes("/BaseInfoEntity/GetParameter");

//                    alert(strXml)
//                    alert(oXmlNodes1.length)
                    $get(MasterObj + "txtParameters").value = oXmlNodes1.length// oXmlNodes.item(0).selectSingleNode("Parameters").text
                    //                    var ParamDescription = oXmlNodes.item(0).selectSingleNode("ParamDescription").text

                    //                    if (document.getElementById(MasterObj + "txtParameters").value == "")
                    //                        document.getElementById(MasterObj + "txtParameters").value = "0"
                    add_row()

                    var l = document.getElementById(MasterObj + "txtParameters").value//oXmlNodes1.length//oGrid.rows.length

                    for (var i = 0; i < l; i++) {
                        oGrid.rows(i).setAttribute("PrameterID", oXmlNodes1.item(i).selectSingleNode("ID").text)
                        if (oXmlNodes1.item(i).selectSingleNode("Kind").text == "1")
                            oGrid.rows(i).cells(0).childNodes(0).checked = true
                        // alert(oXmlNodes1.item(i).selectSingleNode("Name").text)
                        oGrid.rows(i).cells(1).childNodes(0).value = oXmlNodes1.item(i).selectSingleNode("Name").text
                        oGrid.rows(i).cells(2).childNodes(0).value = oXmlNodes1.item(i).selectSingleNode("Desc").text
                        oGrid.rows(i).cells(3).childNodes(0).value = oXmlNodes1.item(i).selectSingleNode("default").text
                        //oGrid.rows(i).cells(4).childNodes(0).innerText = oXmlNodes1.item(i).selectSingleNode("ParameterType").text
                        
                        if (oXmlNodes1.item(i).selectSingleNode("ParameterType").text != null && oXmlNodes1.item(i).selectSingleNode("ParameterType").text != "") {
                            var cObj = oGrid.rows(i).cells(4).firstChild;
                            var Lengthcmb = cObj.length
                            for (var k = 0; k < Lengthcmb; k++)
                            if (cObj[k].text == oXmlNodes1.item(i).selectSingleNode("ParameterType").text) {
                                    cObj.selectedIndex = k
                                }

                        }


                        if (oGrid.rows(i).cells(4).firstChild[oGrid.rows(i).cells(4).firstChild.selectedIndex].text == "Combo" || oGrid.rows(i).cells(4).firstChild[oGrid.rows(i).cells(4).firstChild.selectedIndex].text == "MultiSelect")
                            oGrid.rows(i).cells(5).firstChild.disabled = false;
                        else oGrid.rows(i).cells(5).firstChild.disabled = true;
                        //                           
                        oGrid.rows(i).setAttribute("rvlaue", oXmlNodes1.item(i).selectSingleNode("XMLType").text)
                    }
                    //oGrid.rows(i).cells(1).childNodes(0).value = ParamDescription.split('$')[i];
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtTemplateName").value = ""
            $get(MasterObj + "cmbStep").value = 0
            $get(MasterObj + "txtDesc").value = ""
            $get(MasterObj + "txtSQLCommand").value = ""
            $get(MasterObj + "txtParameters").value = ""
            document.getElementById(MasterObj + "txtXml").value = ""
            document.getElementById(MasterObj + "txtUpdateTemplateName").value = ""
            Cleargrd(XTabTable)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty() == true) {
                MakeXML(rvlaue)
               // alert(document.getElementById(MasterObj + "txtXml").value)
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML(rvlaue) {
            var XMLStr = "<Tb>"
            XMLStr = XMLStr + "<TemplateName>" + document.getElementById(MasterObj + "txtTemplateName").value + "</TemplateName>"
            XMLStr = XMLStr + "<Step>" + document.getElementById(MasterObj + "cmbStep").value + "</Step>"
            XMLStr = XMLStr + "<Desc>" + document.getElementById(MasterObj + "txtDesc").value + "</Desc>"
            //XMLStr = XMLStr + "<Parameters>" + document.getElementById(MasterObj + "txtParameters").value + "</Parameters>"
            // XMLStr = XMLStr + "<ParametersDesc>" + MakeParametersDesc() + "</ParametersDesc>"
            var oGrid = document.all.item("XTabTable")
            var l = oGrid.rows.length
            XMLStr = XMLStr + "</Tb>"
            for (var i = 0; i < l; i++) {
                XMLStr = XMLStr + "<Parameters>"
                if (oGrid.rows(i).cells(0).firstChild.checked)
                    XMLStr = XMLStr + "<PriorityHint>1</PriorityHint>"
                else
                    XMLStr = XMLStr + "<PriorityHint>0</PriorityHint>"
                XMLStr = XMLStr + "<Name>" + oGrid.rows(i).cells(1).firstChild.value + "</Name>"
                XMLStr = XMLStr + "<Desc>" + oGrid.rows(i).cells(2).firstChild.value + "</Desc>"
                XMLStr = XMLStr + "<Default>" + oGrid.rows(i).cells(3).firstChild.value + "</Default>"
                XMLStr = XMLStr + "<ParamType>" + oGrid.rows(i).cells(4).firstChild[oGrid.rows(i).cells(4).firstChild.selectedIndex].text + "</ParamType>"
                if (!oGrid.rows(i).cells(5).firstChild.disabled)
                    XMLStr = XMLStr + "<XMLType>" + oGrid.rows(i).getAttribute("rvlaue") + "</XMLType>"
                XMLStr = XMLStr + "<PrameterID>" + oGrid.rows(i).getAttribute("PrameterID") + "</PrameterID>"
                XMLStr = XMLStr + "</Parameters>"
            }
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"
//            alert(XMLStr)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeParametersDesc() {
            var oGrid = document.all.item("XTabTable")
            var l = oGrid.rows.length
            var i, str = ""
            for (i = 0; i < l; i++) {
                str += oGrid.rows(i).cells(1).firstChild.value + "$"
            }
            //alert(str)
            return str;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "txtTemplateName").value == "") {
                alert("لطفا نام الگو را وارد نمائید")
                document.getElementById(MasterObj + "txtTemplateName").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbStep").value == 0) {
                alert("لطفا مرحله اجرا را انتخاب نمائید")
                document.getElementById(MasterObj + "cmbStep").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDesc").value == 0) {
                alert("لطفا شرح را انتخاب نمائید")
                document.getElementById(MasterObj + "txtDesc").focus()
                return false;
            }
                       else if (checkEmptyParametersDesc()) {
                           return false
                       }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkEmptyParametersDesc() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length

            for (i = 0; i < lll; i++) {

                if ((oGrid.rows(i).cells(1).childNodes(0).value == "")) {
                    alert("لطفا نام پارامتر " + parseInt(parseInt(i) + 1) + " ام را وارد کنيد")
                    return true;
                }
                else if ((oGrid.rows(i).cells(4).childNodes(0).value == 0)) {
                    alert("لطفا نوع پارامتر را وارد کنيد")
                    oGrid.rows(i).cells(4).childNodes(0).setActive();
                    return true;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurtxtParameters() {
            var oGrid = document.all.item("XTabTable")
            if (document.getElementById(MasterObj + "txtParameters").value == "")
                document.getElementById(MasterObj + "txtParameters").value = "0"
            var count = document.getElementById(MasterObj + "txtParameters").value
            var l = oGrid.rows.length
            if (l < count) {
                add_row()
            }
            else if (l > count) {
                if (confirm("تعداد پارامترها از تعداد پارامترهاي موجود کمتر است ،با حذف " + (l - count) + "پارامتر از پارامترهاي موجود موافقيد ؟") == true)
                    Remove_row()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Remove_row() {
            var oGrid = document.all.item("XTabTable")
            var count = document.getElementById(MasterObj + "txtParameters").value
            var l = oGrid.rows.length
            var a
            for (a = newrowindex - 1; a >= count; a--) {
                newrowindex = newrowindex - 1
                oGrid.deleteRow(a)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function add_row() {
            var oGrid = document.all.item("XTabTable")
            var count = document.getElementById(MasterObj + "txtParameters").value
            var r = newrowindex
            var l = oGrid.rows.length
           
            for (newrowindex = r; newrowindex < count; newrowindex++) {
                oGrid.insertRow()
                oGrid.rows(newrowindex).setAttribute("PrameterID", 0)
                oGrid.rows(newrowindex).setAttribute("rvlaue", "")
                oGrid.rows(newrowindex).className = "XItemStyle";
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(0).innerHTML = "<INPUT  type='checkbox' style='WIDTH: 40px;' >"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(1).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 110px;'>"//"پارامتر " + parseInt(parseInt(newrowindex) + 1) + ":"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(2).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 130px;'>"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(3).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 90px;'>"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(4).innerHTML = "<select class=TxtControls style='height: 300px;width: 90px;' onchange='OnChangeCmbParamType(this)'>" + document.getElementById(MasterObj + "cmbParamType").innerHTML + "</select>"
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(5).innerHTML = "<input type='button' value='...' class='HeaderStyle' onclick='OnclickBtnCmb(this)' disabled='true' style='width: 25px;height: 22px'/>"
                  
                oGrid.rows(newrowindex).align = "center"
                oGrid.rows(newrowindex).cells(0).style.width = "50px"
                oGrid.rows(newrowindex).cells(1).style.width = "120px"
                oGrid.rows(newrowindex).cells(2).style.width = "140px"
                oGrid.rows(newrowindex).cells(3).style.width = "100px"
                oGrid.rows(newrowindex).cells(4).style.width = "100px"
                oGrid.rows(newrowindex).cells(5).style.width = "50px"
                oGrid.rows(newrowindex).cells(0).style.border = 0
                oGrid.rows(newrowindex).cells(1).style.border = 0
                oGrid.rows(newrowindex).cells(2).style.border = 0
                oGrid.rows(newrowindex).cells(3).style.border = 0
                oGrid.rows(newrowindex).cells(4).style.border = 0
                oGrid.rows(newrowindex).cells(5).style.border = 0
               
                if ((newrowindex % 2) == 0) {
                    oGrid.rows(newrowindex).cells(0).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(1).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(2).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(3).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(4).className = "CssItemStyle"
                    oGrid.rows(newrowindex).cells(5).className = "CssItemStyle"
                }
                else {
                    oGrid.rows(newrowindex).cells(0).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(1).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(2).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(3).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(4).className = "CssAlternatingItemStyle"
                    oGrid.rows(newrowindex).cells(5).className = "CssAlternatingItemStyle"
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeCmbParamType(obj) {
            var Row = obj.parentElement.parentElement;
            if (Row.cells(4).firstChild[Row.cells(4).firstChild.selectedIndex].text == "Combo" || Row.cells(4).firstChild[Row.cells(4).firstChild.selectedIndex].text == "MultiSelect")
                Row.cells(5).firstChild.disabled = false;
                else  Row.cells(5).firstChild.disabled = true;
            }
            //=================================================================================
            function OnclickBtnCmb(obj) {
                var Row = obj.parentElement.parentElement;
                var r = Row.getAttribute("rvlaue")
                r=ReplaceAll(r, '+', 'Sum')
                var strUrl = 'TemplateNewFillCombo.aspx?' + "&rvlaue=" + r + "&SessionID=" + $get(MasterObj + "txtSessionID").value
              rvlaue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 380px;dialogWidth: 350px;center: Yes;help: no;status: no;")
              if (rvlaue != null) {
                  Row.setAttribute("rvlaue", rvlaue)
//                  alert(rvlaue)
                  MakeXML(rvlaue)
              }
          }
         
    </script>

</asp:Content>
