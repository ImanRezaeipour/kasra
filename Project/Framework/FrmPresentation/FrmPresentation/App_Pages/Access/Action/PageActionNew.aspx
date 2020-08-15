<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="PageActionNew.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action.PageActionNew" %>

<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 450px">
        <tr>
            <td style="height: 70px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 450px">
                    <tr>
                        <td>
                            زير سيستم :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbSubSystem" runat="server" Height="16px" Width="150px" CssClass="TxtControls"
                                onchange="OnChangeCmbSubSystem()">
                            </asp:DropDownList>
                        </td>
                        <td>
                            نام صفحه :
                        </td>
                        <td>
                            <select id="cmbPageNum" runat="server" class="TxtControls" style="height: 300px;
                                width: 150px" align="right" onchange="OnChgPageName()">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                align="center">
                <div align="right" style="width: 310px">
                    <table style="width: 410px">
                        <tr id="test">
                            <td class="CssHeaderStyle" align='center' style='width: 10px'>
                                <input type="checkbox" id="Chk" runat="server" onclick="OnClickHeaderChk(this)" />
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 150px'>
                                نام فعاليت
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 70px'>
                                کدفعاليت
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 30px'>
                                ترتيب
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 150px'>
                                نام فعاليت ارشد
                            </td>
                        </tr>
                    </table>
                    <div style="overflow: auto; width: 427px; height: 350px" align="right">
                        <table id="GrdPageActionNew" style="width: 410px;" onclick="onClickGrdPageActionNew()">
                        </table>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtXMLAction" runat="server" />
                        <div style="display: none">
                            <input type="text" id="txtAlert" name="txtAlert" runat="server" />
                            <input type="text" id="txtValidate" name="txtValidate" runat="server" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:DropDownList ID="cmbParentAction" runat="server">
        </asp:DropDownList>
        <input type="text" id="txtXmlSubSystem" name="txtXmlSubSystem" runat="server" />
        <input type="text" id="txtXMLDescription" name="txtXMLDescription" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script language="javascript" type="text/javascript">

        document.body.scroll = "no";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var IntValTemp = 0
        var strChk;

        //---------------------------------------Load Description-----------------------------
        if ($get(MasterObj + "txtXMLDescription").value != "<AccessEntity></AccessEntity>" || $get(MasterObj + "txtXMLDescription").value != "<AccessEntity />") {
            var str = $get(MasterObj + "txtXMLDescription").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(str)
            var XmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActTemp");
            if (XmlNode.length != 0) {
                if ($get(MasterObj + "txtID").value != "0") {
                    $get(MasterObj + "cmbSubSystem").value = XmlNode.item(0).selectSingleNode("SubSys").text.toString();
                    OnChangeCmbSubSystem()
                    $get(MasterObj + "cmbPageNum").value = XmlNode.item(0).selectSingleNode("PageName").text.toString();
                }
            }
        }
        //-----------------------------------------------------------------------------------


        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //---------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                SetMsg($get(MasterObj + "txtAlert").value);
                if (document.getElementById(MasterObj + "txtSubmit").value == "ModifyContinue")
                    OnClickBtnNew()
            }
            BindGrid();
            $get(MasterObj + "txtAlert").value = ""
            LastSelectedRow = null;
            LastSelectedRowClass = "";
        }
        //==========================================Style Grid=====================================
        function onClickGrdPageActionNew() {
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "GrdPageActionNew") {
                for (i = 0; i < GrdPageActionNew.rows.length; i++) {
                    if (GrdPageActionNew.rows(i).className == "CssSelectedItemStyle") {
                        GrdPageActionNew.rows(i).className = "CssItemHeader4"
                    }
                }

                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
        }
        //===========================================================================================
        BindGrid()
        //=========================================Bind Grid=========================================
        function BindGrid() {
            clearGrid();
            //alert($get(MasterObj + "txtXMLAction").value)
            if ($get(MasterObj + "txtXMLAction").value != "<AccessEntity></AccessEntity>" || $get(MasterObj + "txtXMLAction").value != "<AccessEntity />") {
                //alert($get(MasterObj + "txtXMLAction").value)
                var str = $get(MasterObj + "txtXMLAction").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
                var xmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew");
                if (xmlNode.length > 0) {
                    for (var i = 0; i < xmlNode.length; i++) {
                        addRow(GrdPageActionNew,
                                xmlNode.item(i).selectSingleNode("Chk").text.toString(), xmlNode.item(i).selectSingleNode("ID").text.toString(),
                                xmlNode.item(i).selectSingleNode("Name").text.toString(), xmlNode.item(i).selectSingleNode("Code").text.toString(),
                                xmlNode.item(i).selectSingleNode("IntVal").text.toString(), xmlNode.item(i).selectSingleNode("ParentID").text.toString())
                    }
                }
            }
        }
        //----------------------------------------------------------------------------------------------
        function addRow(GrdPageActionNew, ISChk, ID, Name, Code, IntVal, ParentID) {
            //alert(ParentID)
            var Row = GrdPageActionNew.insertRow();
            Row.attachEvent('onkeydown', onkeydownRowAction);

            Row.className = "CssItemHeader4"
            Row.setAttribute("ID", ID)

            Row.insertCell();
            Row.cells(0).innerHTML = "<input type='checkbox' onclick='onclickCHK(this)'  " + (ISChk == 1 ? "checked" : "") + "/>";

            Row.insertCell();
            Row.cells(1).innerText = Name;

            Row.insertCell();
            Row.cells(2).innerText = Code;

            Row.insertCell();
            Row.cells(3).innerHTML = "<input type='text' style='width : 20px' disabled='disabled'  />"
            Row.cells(3).firstChild.innerText = IntVal

            Row.insertCell();
            Row.cells(4).innerHTML = "<select id='cmbParent'  class='TxtControls' style='width: 100px'  onchange='onchangecmbParent(this)'  />" + document.getElementById(MasterObj + "cmbParentAction").innerHTML + "</select>"
            Row.cells(4).firstChild.value = ParentID
            
            //------------------------------Remove Action with the same Name for load-------------------------------------
            
            for (var j = 0; j < GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.length; j++) {
                if (GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.all(j).value == Row.ID)
                    GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.remove(j)
            }
                    
            Row.align = "center"

            Row.cells(0).style.width = "10px"
            Row.cells(1).style.width = "150px"
            Row.cells(2).style.width = "73px"
            Row.cells(3).style.width = "30px"
            Row.cells(4).style.width = "143px"

            IntValTemp = parseInt(IntVal)
        }
        //----------------------------------------------------------------------------------------------
        function clearGrid() {
            while (GrdPageActionNew.rows.length > 0)
                GrdPageActionNew.deleteRow();
        }
        //======================================================================================================================
        function onkeydownRowAction() {
            //alert(window.event.keyCode)
            //-------------------------------------------UpKey---------------------------------------------
            var FromIntval, ToIntVal
            flag = 1
            var FChk,FID,FName,FCode,FParent
            var str = $get(MasterObj + "txtXMLAction").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(str)
            

            if (window.event.keyCode == 38) {
                if (LastSelectedRow.rowIndex != 0) {
                    var From, To
                    From = LastSelectedRow.rowIndex;
                    To = parseInt(LastSelectedRow.rowIndex) - 1;
                    GrdPageActionNew.moveRow(From, To);
                    FromIntval = GrdPageActionNew.rows(From).cells(3).firstChild.value
                    ToIntVal = GrdPageActionNew.rows(To).cells(3).firstChild.value
                    GrdPageActionNew.rows(From).cells(3).firstChild.value = GrdPageActionNew.rows(To).cells(3).firstChild.value
                    GrdPageActionNew.rows(To).cells(3).firstChild.value = FromIntval
                    flag = 0
                    CorrectClass();
                    
                    //-----------------------------------inter Change to Xml----------------------------------
                    var xmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew[IntVal=" + FromIntval + "]");
                    var xmlNodeTemp = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew[IntVal=" + ToIntVal + "]");
                    if (xmlNode.length != 0) {
                        FID = xmlNode.item(0).selectSingleNode("ID").text
                        FChk = xmlNode.item(0).selectSingleNode("Chk").text
                        FName = xmlNode.item(0).selectSingleNode("Name").text
                        FCode = xmlNode.item(0).selectSingleNode("Code").text
                        FParent = xmlNode.item(0).selectSingleNode("ParentID").text

                        //------------------------------------------------------
                        xmlNode.item(0).selectSingleNode("ID").text = xmlNodeTemp.item(0).selectSingleNode("ID").text
                        xmlNode.item(0).selectSingleNode("Chk").text = xmlNodeTemp.item(0).selectSingleNode("Chk").text
                        xmlNode.item(0).selectSingleNode("Name").text = xmlNodeTemp.item(0).selectSingleNode("Name").text
                        xmlNode.item(0).selectSingleNode("Code").text = xmlNodeTemp.item(0).selectSingleNode("Code").text
                        xmlNode.item(0).selectSingleNode("ParentID").text = xmlNodeTemp.item(0).selectSingleNode("ParentID").text
                        //-----------------------------------------------------
                        xmlNodeTemp.item(0).selectSingleNode("ID").text = FID
                        xmlNodeTemp.item(0).selectSingleNode("Chk").text = FChk
                        xmlNodeTemp.item(0).selectSingleNode("Name").text = FName
                        xmlNodeTemp.item(0).selectSingleNode("Code").text = FCode
                        xmlNodeTemp.item(0).selectSingleNode("ParentID").text=FParent

                        $get(MasterObj + "txtXMLAction").value = oXmlDoc.xml;
                        //alert(oXmlDoc.xml)
                    }
                }
            }
            //------------------------------------------DownKey----------------------------------------------
            if (window.event.keyCode == 40) {
                if (LastSelectedRow.rowIndex < ((GrdPageActionNew.rows.length) - 1)) {
                    var From, To
                    From = LastSelectedRow.rowIndex;
                    To = parseInt(LastSelectedRow.rowIndex) + 1;
                    GrdPageActionNew.moveRow(From, To);
                    FromIntval = GrdPageActionNew.rows(From).cells(3).firstChild.value
                    ToIntVal = GrdPageActionNew.rows(To).cells(3).firstChild.value
                    GrdPageActionNew.rows(From).cells(3).firstChild.value = GrdPageActionNew.rows(To).cells(3).firstChild.value
                    GrdPageActionNew.rows(To).cells(3).firstChild.value = FromIntval
                    flag = 0
                    CorrectClass();

                    //-----------------------------------inter Change to Xml----------------------------------
                    var xmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew[IntVal=" + FromIntval + "]");
                    var xmlNodeTemp = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew[IntVal=" + ToIntVal + "]");
                    if (xmlNode.length != 0) {
                        FID = xmlNode.item(0).selectSingleNode("ID").text
                        FChk = xmlNode.item(0).selectSingleNode("Chk").text
                        FName = xmlNode.item(0).selectSingleNode("Name").text
                        FCode = xmlNode.item(0).selectSingleNode("Code").text
                        FParent = xmlNode.item(0).selectSingleNode("ParentID").text

                        //------------------------------------------------------
                        xmlNode.item(0).selectSingleNode("ID").text = xmlNodeTemp.item(0).selectSingleNode("ID").text
                        xmlNode.item(0).selectSingleNode("Chk").text = xmlNodeTemp.item(0).selectSingleNode("Chk").text
                        xmlNode.item(0).selectSingleNode("Name").text = xmlNodeTemp.item(0).selectSingleNode("Name").text
                        xmlNode.item(0).selectSingleNode("Code").text = xmlNodeTemp.item(0).selectSingleNode("Code").text
                        xmlNode.item(0).selectSingleNode("ParentID").text = xmlNodeTemp.item(0).selectSingleNode("ParentID").text
                        //-----------------------------------------------------
                        xmlNodeTemp.item(0).selectSingleNode("ID").text = FID
                        xmlNodeTemp.item(0).selectSingleNode("Chk").text = FChk
                        xmlNodeTemp.item(0).selectSingleNode("Name").text = FName
                        xmlNodeTemp.item(0).selectSingleNode("Code").text = FCode
                        xmlNodeTemp.item(0).selectSingleNode("ParentID").text = FParent

                        $get(MasterObj + "txtXMLAction").value = oXmlDoc.xml;
                        //alert(oXmlDoc.xml)
                    }
                }
            }
        }
        //----------------------------------Add Fun to Body For Select Row-----------------------------
        var flag = 0
        //---------------------------------------------------------------------------------------------
        document.body.attachEvent('onkeydown', onkeydownbody);
        //---------------------------------------------------------------------------------------------
        function onkeydownbody() {
            if (LastSelectedRow != null && flag == 0) {
                onkeydownRowAction()
                flag = 0
            }
        }
        //------------------------------------------------------------------------------------------------------
        function CorrectClass() {
            function CorrectClass() {
                for (var i = 0; i < XtableName.rows.length; i++) {
                    if (i % 2 == 0) {
                        GrdPageActionNew.rows(i).className = "CssItemStyle";
                        $('#IntvalUL')[0].childNodes[i].firstChild.style.background = "#d5e1fd";
                    }
                    else {
                        GrdPageActionNew.rows(i).className = "CssAlternatingItemStyle";
                        $('#IntvalUL')[0].childNodes[i].firstChild.style.background = "OldLace";
                    }
                }
            }
        }
        //==========================================================================================================
        function onclickCHK(obj) {
            var Row = obj.parentElement.parentElement;

            var oXmlDocChk = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocChk.loadXML($get(MasterObj + "txtXMLAction").value);
            var XmlNodeTmp = oXmlDocChk.documentElement.selectNodes("/AccessEntity/PageActNew[ID=" + Row.ID + "]");

            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true) {
                    var j
                    var find = 0
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                    //-------------------------------Add Action with checked to combo----------------------------------
                    for (var i = 0; i < GrdPageActionNew.rows.length; i++) {
                        j = GrdPageActionNew.rows(i).cells(4).firstChild.options.length
                        optionEl = document.createElement("OPTION");
                        GrdPageActionNew.rows(i).cells(4).firstChild.options.add(optionEl);
                        GrdPageActionNew.rows(i).cells(4).firstChild.all(j).innerText = GrdPageActionNew.rows(Row.rowIndex).cells(1).innerText
                        GrdPageActionNew.rows(i).cells(4).firstChild.all(j).value = Row.ID
                    }
                    //------------------------------Remove Action with the same Name-------------------------------------
                    for (var l = 0; l < GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.length; l++) {
                        if (GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.all(l).value == Row.ID) {
                            GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.remove(l)
                        }
                    }
                }
                else {
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                    //---------------------------------remove Action with remove checked---------------------------------
                    for (var i = 0; i < GrdPageActionNew.rows.length; i++) {
                        for (var j = 0; j < GrdPageActionNew.rows(i).cells(4).firstChild.options.length; j++) {
                            if (GrdPageActionNew.rows(i).cells(4).firstChild.all(j).value == Row.ID)
                                GrdPageActionNew.rows(i).cells(4).firstChild.options.remove(j)
                        }
                    }
                }
                $get(MasterObj + "txtXMLAction").value = oXmlDocChk.xml;
            }
        }
        //----------------------------------------------------------------------------------------------
        function OnClickHeaderChk(obj) {
            var grdLen = GrdPageActionNew.rows.length;
            for (var i = 0; i < grdLen; i++) {
                GrdPageActionNew.rows(i).cells(0).firstChild.checked = obj.checked
                onclickCHK(GrdPageActionNew.rows(i).cells(0).firstChild)
            }
        }
        //===========================================================================================
        function MakeActionStr() {
            if ($get(MasterObj + "txtXMLAction").value != "<AccessEntity></AccessEntity>" || $get(MasterObj + "txtXMLAction").value != "<AccessEntity />") {
                var IntValSave = 1
                var str = $get(MasterObj + "txtXMLAction").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
                var xmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageActNew");
                strChk = "";
                if (xmlNode.length > 0) {
                    for (var i = 0; i < xmlNode.length; i++) {
                        if (xmlNode.item(i).selectSingleNode("Chk").text == "1") {
                            strChk += "<Action>"
                            strChk += "<ActID>" + xmlNode.item(i).selectSingleNode("ID").text.toString() + "</ActID>"
                            strChk += "<IntVal>" + IntValSave + "</IntVal>"
                            strChk += "<ParentID>" + xmlNode.item(i).selectSingleNode("ParentID").text.toString() + "</ParentID>"
                            strChk += "</Action>"
                            IntValSave += 1
                        }
                    }
                }
            }
        }
        //----------------------------------------------------------------------------------------------------------------
        function MakeSave() {
            var Str = "<PageAct>"
            Str += "<ID>" + $get(MasterObj + "txtID").value + "</ID>";
            Str += "<PageID>" + $get(MasterObj + "cmbPageNum").value + "</PageID>"
            Str += "</PageAct>"
            MakeActionStr()
            Str += strChk
            $get(MasterObj + "txtXmlSave").value = "<Root>" + Str + "</Root>";
            //alert($get(MasterObj + "txtXmlSave").value)
        }
        //-----------------------------------------------------------------------------------------------------------------
        function ChkISNOIMPTY() {
            if ($get(MasterObj + "cmbSubSystem").value == 0) {
                alert(".لطفا نام زيرسيستم را وارد کنید")
                $get(MasterObj + "cmbSubSystem").select()
                $get(MasterObj + "cmbSubSystem").focus()
                return false;
            }
            else if ($get(MasterObj + "cmbPageNum").value == "") {
                alert(".لطفا نام صفحه را وارد کنید")
                $get(MasterObj + "cmbPageNum").select()
                $get(MasterObj + "cmbPageNum").focus()
                return false;
            }
            else
                return true;
        }
        //----------------------------------------------------------------------------------------------
        function OnClickBtnSave() {
            if (ChkISNOIMPTY()) {
                MakeSave()
                document.getElementById(MasterObj + "txtSubmit").value = "Modify"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //----------------------------------------------------------------------------------------------
        function OnClickBtnSaveContinue() {
            if (ChkISNOIMPTY()) {
                MakeSave()
                document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //----------------------------------------------------------------------------------------------
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtID").value = "0"
            document.getElementById(MasterObj + "cmbSubSystem").value = 0
            document.getElementById(MasterObj + "cmbPageNum").value = 0
            document.getElementById(MasterObj + "txtXMLAction").value = "<AccessEntity></AccessEntity>"
            clearGrid()
        }
        //----------------------------------------------------------------------------------------------
        function OnClickBtnSelect() {
            var strUrl = "SelectAction.aspx?" + "SessionID=" + $get(MasterObj + "txtSessionID").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 550px;dialogWidth:  700px;center: Yes;help: no;status: no;scroll: no;')
            //alert(rValue)
            if (rValue != null)
                BtnNewRowAction(rValue)
        }
        //----------------------------------------------------------------------------------------------
        function BtnNewRowAction(rValue) {
            //----------------------LoadXML---------------------------------------
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(rValue);
            var xmlNode = oXmlDoc.documentElement.selectNodes("/AccessEntity/SelectAction")
            var Length = xmlNode.length;
            var XmlNodesBaseLen = 0
            var find = 0

            if ($get(MasterObj + "txtXMLAction").value != "<AccessEntity></AccessEntity>" || $get(MasterObj + "txtXMLAction").value != "<AccessEntity />") {
                var strXmlBase = $get(MasterObj + "txtXMLAction").value
                var oXmlDocBase = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDocBase.async = "false";
                oXmlDocBase.loadXML(strXmlBase);
                var XmlNodesBase = oXmlDocBase.documentElement.selectNodes("/AccessEntity/PageActNew");
                XmlNodesBaseLen = XmlNodesBase.length
            }
            if (Length > 0) {
                for (var i = 0; i < Length; i++) {
                    for (var j = 0; j < XmlNodesBaseLen; j++) {
                        if (XmlNodesBase.item(j).selectSingleNode('ID').text.toString() == xmlNode.item(i).selectSingleNode('ID').text.toString()) {
                            find += 1;
                        }
                    }
                    if (find == 0) {
                        IntValTemp += 1
                        var Str = ""
                        Str += "<PageActNew>"
                        Str += "<Chk>1</Chk>"
                        Str += "<ID>" + xmlNode.item(i).selectSingleNode("ID").text.toString() + "</ID>"
                        Str += "<Name>" + xmlNode.item(i).selectSingleNode("AName").text.toString() + "</Name>"
                        Str += "<Code>" + xmlNode.item(i).selectSingleNode("ACode").text.toString() + "</Code>"
                        Str += "<IntVal>" + IntValTemp + "</IntVal>"
                        Str += "<ParentID>" + xmlNode.item(i).selectSingleNode("ID").text.toString() + "</ParentID>"
                        Str += "</PageActNew>"

                        if ($get(MasterObj + "txtXMLAction").value == "" || $get(MasterObj + "txtXMLAction").value == "<AccessEntity />") {
                            $get(MasterObj + "txtXMLAction").value = "<AccessEntity>" + Str + "</AccessEntity>"
                        }
                        else
                            $get(MasterObj + "txtXMLAction").value = $get(MasterObj + "txtXMLAction").value.replace("</AccessEntity>", Str + "</AccessEntity>")
                        //-------------------------------Add Action with checked to combo----------------------------------
                        //for (var j = 0; j < GrdPageActionNew.rows.length; j++) {
                            var Opt = $get(MasterObj + "cmbParentAction").options.length
                            optionEl = document.createElement("OPTION");
                            $get(MasterObj + "cmbParentAction").options.add(optionEl);
                            $get(MasterObj + "cmbParentAction").all(Opt).innerText = xmlNode.item(i).selectSingleNode("AName").text
                            $get(MasterObj + "cmbParentAction").all(Opt).value = xmlNode.item(i).selectSingleNode("ID").text
                       // }
                    }
                    find = 0;
                }
                //alert($get(MasterObj + "txtXMLAction").value)
                BindGrid()
                
                //------------------------------Remove Action with the same Name-------------------------------------
//                for (var l = 0; l < GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.length; l++) {
//                    if (GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.all(l).value == Row.ID) {
//                        GrdPageActionNew.rows(Row.rowIndex).cells(4).firstChild.options.remove(l)
//                    }
//                }
            }
        }
        //===========================================================================================
        function onchangecmbParent(obj) {
            var Row = obj.parentElement.parentElement;

            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML($get(MasterObj + "txtXMLAction").value);
            var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/AccessEntity/PageActNew[ID=" + Row.ID + "]");

            if (XmlNodeTmp.length > 0) {

                XmlNodeTmp.item(0).selectSingleNode('ParentID').text = obj.value

                $get(MasterObj + "txtXMLAction").value = oXmlDocSave.xml;
            }
        }
        //-------------------------------------------------------------------------------------------
        function OnChgPageName() {
            $get(MasterObj + "txtID").value = $get(MasterObj + "cmbPageNum").value
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //-------------------------------------------------------------------------------------------
        function OnChangeCmbSubSystem() {
            var strXml = $get(MasterObj + "txtXmlSubSystem").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //alert(oXmlDoc.xml)
            var XmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageName[flag=" + $get(MasterObj + "cmbSubSystem").value + "]");

            if (XmlNodes.length != 0) {
                $get(MasterObj + "cmbPageNum").innerHTML = "";
                optionEl = document.createElement("OPTION");
                $get(MasterObj + "cmbPageNum").options.add(optionEl);
                $get(MasterObj + "cmbPageNum").all(0).innerText = "انتخاب نشده"
                $get(MasterObj + "cmbPageNum").all(0).value = "0"
                for (var i = 0; i < XmlNodes.length; i++) {
                    optionEl = document.createElement("OPTION");
                    $get(MasterObj + "cmbPageNum").options.add(optionEl)
                    $get(MasterObj + "cmbPageNum").all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text
                    $get(MasterObj + "cmbPageNum").all(i + 1).value = XmlNodes.item(i).selectSingleNode('val').text
                }
            }
        }
    </script>
</asp:Content>
