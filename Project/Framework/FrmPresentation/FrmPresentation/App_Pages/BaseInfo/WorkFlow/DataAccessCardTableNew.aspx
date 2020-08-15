<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DataAccessCardTableNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.DataAccessCardTableNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register  Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .CssNewRow
    {
        background-color: #C7D0DF;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
    <table style="width: 600px">
        <%--Toolbar--%>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="DivStyle">
                    <tr>
                        <td>
                   
                            از تاريخ :
                        </td>
                        <td>
                            <uc1:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc1:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            تفويض از :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbDelegateOf" runat="server" />
                        </td>
                        <td>
                            به :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbDelegateTo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table style="width: 490px" align="right">
                                <tr>
                                    <td>
                                        از ساعت :
                                    </td>
                                    <td>
                                        <input id="txtSTime" type="text" class="TxtControls" style="width: 80px" runat="server"
                                            onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtSTime(this)" onkeydown="OnKeyDownTime(this)" />
                                    </td>
                                    <td>
                                        تا ساعت :
                                    </td>
                                    <td>
                                        <input id="txtETime" type="text" class="TxtControls" style="width: 80px" runat="server"
                                            onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtSTime(this)" onkeydown="OnKeyDownTime(this)" />
                                    </td>
                                    <td>
                                        وضعيت :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbActive" runat="server" Height="16px" Width="150px" 
                                            CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"  align="right">
                            <table  align="right">
                                <tr>
                                    <td  align="right">
                                        <asp:CheckBox ID="ChkAbsent" runat="server" />
                                        در صورت عدم حضور
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" id="TopRow" style="scrollbar-highlight-color: white; overflow: hidden;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" valign="top">
                            <fieldset dir="rtl" class="fieldsetStyle" >
                                <legend class="legendStyle">نوع سند</legend>
                                <div style="width: 510px" align="right">
                                    <table style="width: 510px">
                                        <tr>
                                            <td class="CssHeaderStyle" align='center' style='width: 10px'>
                                                <input type="checkbox" id="Chk" runat="server" onclick="OnClickHeaderChk(this)" />
                                            </td>
                                            <td class="CssHeaderStyle" align='center' style='width: 70px'>
                                                شناسه سند
                                            </td>
                                            <td class="CssHeaderStyle" align='center' style='width: 155px'>
                                                نام سند
                                            </td>
                                            <td class="CssHeaderStyle" align='center' style='width: 250px'>
                                                نام کد
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="overflow: auto; width: 510px; height: 370px">
                                        <table id="GrdValueSelector" align="right" style="width: 510px;" onclick="onClickGrdValueSelector()">
                                        </table>
                                    </div>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtSaveXML" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <div style="display: none">
                            <input type="text" id="txtAlert" name="txtAlert" runat="server" />
                            <input type="text" id="txtValidate" name="txtValidate" runat="server" />
                            <input type="text" id="txtDesc" name="txtDesc" runat="server" />
                            <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                            <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
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
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtAllPersViewOption" name="txtAllPersViewOption" runat="server" />
        <input type="text" id="txtDocTypes" name="txtDocTypes" runat="server" />
        <input type="text" id="txtXmlValueSelector" name="txtXmlValueSelector" runat="server" />
        <input type="text" id="txtCodeValue" name="txtCodeValue" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var CodeValue, CodeNames, CodeNamesTitle;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        BindGrid()
        //-------------------------------Description-----------------------------------------
        var strXml = $get(MasterObj + "txtDesc").value
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(strXml);
        var XmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/DAccessCrdTblDesc");

        if ($get(MasterObj + "txtID").value == "0") {
            $get(MasterObj + "CmbDelegateOf_txtPCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
            $get(MasterObj + "CmbDelegateOf_txtCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
            $get(MasterObj + "CmbDelegateOf_txtName").value = XmlNodes.item(0).selectSingleNode("OwnerName").text
        }
        else {
            
            if (XmlNodes.length > 0) {
                $get(MasterObj + "KCalSDate_txtYear").value = XmlNodes.item(0).selectSingleNode("SDate").text.substr(0, 4)
                $get(MasterObj + "KCalSDate_txtMonth").value = XmlNodes.item(0).selectSingleNode("SDate").text.substr(5, 2)
                $get(MasterObj + "KCalSDate_txtDay").value = XmlNodes.item(0).selectSingleNode("SDate").text.substr(8, 2)

                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                $get(MasterObj + "KCalEDate_txtYear").value = XmlNodes.item(0).selectSingleNode("EDate").text.substr(0, 4)
                $get(MasterObj + "KCalEDate_txtMonth").value = XmlNodes.item(0).selectSingleNode("EDate").text.substr(5, 2)
                $get(MasterObj + "KCalEDate_txtDay").value = XmlNodes.item(0).selectSingleNode("EDate").text.substr(8, 2)

                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

                $get(MasterObj + "CmbDelegateOf_txtPCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
                $get(MasterObj + "CmbDelegateOf_txtCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
                $get(MasterObj + "CmbDelegateOf_txtName").value = XmlNodes.item(0).selectSingleNode("OwnerName").text

                $get(MasterObj + "CmbDelegateTo_txtPCode").value = XmlNodes.item(0).selectSingleNode("DeputyID").text
                $get(MasterObj + "CmbDelegateTo_txtCode").value = XmlNodes.item(0).selectSingleNode("DeputyID").text
                $get(MasterObj + "CmbDelegateTo_txtName").value = XmlNodes.item(0).selectSingleNode("DeputyName").text

                $get(MasterObj + "txtSTime").value = XmlNodes.item(0).selectSingleNode("STime").text
                $get(MasterObj + "txtETime").value = XmlNodes.item(0).selectSingleNode("ETime").text

                if (XmlNodes.item(0).selectSingleNode("OwnerAbsent").text == "1")
                    $get(MasterObj + "ChkAbsent").checked = true;
                else
                    $get(MasterObj + "ChkAbsent").checked = false;
                
                if(XmlNodes.item(0).selectSingleNode("Active").text==0)
                    $get(MasterObj + "cmbActive").value = 27002
                else
                    $get(MasterObj + "cmbActive").value = 27001


                var DocTypeID, Code, CodeNames;
                DocTypeID = XmlNodes.item(0).selectSingleNode("DocTypeID").text
                Code = XmlNodes.item(0).selectSingleNode("Code").text
                CodeNames = XmlNodes.item(0).selectSingleNode("CodeNames").text
                SetGrid(DocTypeID,Code,CodeNames);
            }
        }
        //-----------------------------------------------------------------------------------
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //-----------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
        }
        //-----------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                    if ($get(MasterObj + "txtValidate").value != "1") {
                        alert($get(MasterObj + "txtAlert").value);
                    }
                    else
                        window.close();
                if (document.getElementById(MasterObj + "txtSubmit").value == "ModifyContinue") {
                    if ($get(MasterObj + "txtValidate").value != "1")
                        alert($get(MasterObj + "txtAlert").value);
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        OnClickBtnNew()
                    }
                }
            }
            $get(MasterObj + "txtAlert").value = ""
        }
        //------------------------------------------------------------------------------------
        function ChkISNOIMPTY() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

            var STime = $get(MasterObj + "txtSTime").value.replace(":", "");
            var ETime = $get(MasterObj + "txtETime").value.replace(":", "");

            if ($get(MasterObj + "KCalSDate_txtCalendar").value == "") {
                alert(".لطفا تاريخ شروع را وارد کنید");
                $get(MasterObj + "KCalSDate_txtCalendar").focus();
                return false;
            }
            else if ($get(MasterObj + "KCalEDate_txtCalendar").value == "") {
                alert(".لطفا تاريخ پايان را وارد کنید");
                $get(MasterObj + "KCalEDate_txtCalendar").focus();
                return false;
            }
            else if (EDate < SDate) {
                alert(".تاريخ پايان از تاريخ شروع بزرگتر است");
                $get(MasterObj + "KCalEDate_txtCalendar").focus();
                return false;
            }
            else if ($get(MasterObj + "CmbDelegateOf_txtCode").value == "") {
                alert(".لطفا پرسنل تفويض دهنده را وارد کنید");
                return false;
            }
            else if ($get(MasterObj + "CmbDelegateTo_txtCode").value == "") {
                alert(".لطفا پرسنل تفويض گیرنده را وارد کنید");
                //$get(MasterObj + "CmbDelegateTo_txtCode").focus();
                return false;
            }
            else if ($get(MasterObj + "txtSTime").value == "00:00" || $get(MasterObj + "txtSTime").value == "") {
                alert(".لطفا ساعت شروع را وارد کنید");
                $get(MasterObj + "txtSTime").focus();
                return false;
            }
            else if ($get(MasterObj + "txtETime").value == "00:00" || $get(MasterObj + "txtETime").value == "") {
                alert(".لطفا ساعت خاتمه را وارد کنید");
                $get(MasterObj + "txtETime").focus();
                return false;
            }
            else if (STime > ETime) {
                alert(".ساعت شروع بزرگتر از ساعت پایان است");
                $get(MasterObj + "txtETime").focus();
                return false;
            }
            else if ($get(MasterObj + "cmbActive").value == 0) {
                alert(". لطفا وضعيت را وارد کنید");
                return false;
            }
            else
                return true;

        }
        //------------------------------------------------------------------------------------
        function MakeSave() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
            var OGrid = $get("GrdValueSelector");

            var str = ""
            var DocTypeID = "";
            str += "<Root>"
            str += "<Tb>"
            str += "<ID>" + $get(MasterObj + "txtID").value + "</ID>";
            str += "<SDate>" + SDate + "</SDate>";
            str += "<EDate>" + EDate + "</EDate>";
            str += "<DelOFID>" + $get(MasterObj + "CmbDelegateOf_txtCode").value + "</DelOFID>";
            str += "<DelToID>" + $get(MasterObj + "CmbDelegateTo_txtCode").value + "</DelToID>";
            str += "<STime>" + $get(MasterObj + "txtSTime").value + "</STime>";
            str += "<ETime>" + $get(MasterObj + "txtETime").value + "</ETime>";
            str += "<Active>" + $get(MasterObj + "cmbActive").value + "</Active>";
            if ($get(MasterObj + "ChkAbsent").checked == true)
                str += "<OwnerAbsent>1</OwnerAbsent>";
            else
                str += "<OwnerAbsent>0</OwnerAbsent>";
            str += "</Tb>";
            for (var i = 0; i < OGrid.rows.length; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked) {
                    str += "<DocType>"
                    str += "<DocTypeID>" + OGrid.rows(i).cells(1).innerText + "</DocTypeID>";
                    if (OGrid.rows(i).cells(1).innerText == "1" || OGrid.rows(i).cells(1).innerText == "2")
                        str += "<Code>" + OGrid.rows(i).cells(3).children.item(0).getAttribute("CodeValue") + "</Code>";
                    str += "</DocType>";
                }
            }
            
            str += "</Root>"
            $get(MasterObj + "txtSaveXML").value = str;
        }
        //--------------------------------------------------------------------------------------------
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
            var strXml = $get(MasterObj + "txtDesc").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var XmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/DAccessCrdTblDesc");
            $get(MasterObj + "CmbDelegateOf_txtPCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
            $get(MasterObj + "CmbDelegateOf_txtCode").value = XmlNodes.item(0).selectSingleNode("OwnerID").text
            $get(MasterObj + "CmbDelegateOf_txtName").value = XmlNodes.item(0).selectSingleNode("OwnerName").text

            $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "txtKCalSDate").value.substr(0, 4)
            $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "txtKCalSDate").value.substr(5, 2)
            $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "txtKCalSDate").value.substr(8, 2)

            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

            $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "txtKCalEDate").value.substr(0, 4)
            $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "txtKCalEDate").value.substr(5, 2)
            $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "txtKCalEDate").value.substr(8, 2)

            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

            document.getElementById(MasterObj + "txtID").value = "0"
            document.getElementById(MasterObj + "CmbDelegateTo_txtPCode").value = "";
            document.getElementById(MasterObj + "CmbDelegateTo_txtCode").value = "";
            document.getElementById(MasterObj + "CmbDelegateTo_txtName").value = "";
            document.getElementById(MasterObj + "txtSTime").value = "00:00"
            document.getElementById(MasterObj + "txtETime").value = "00:00"
            document.getElementById(MasterObj + "cmbActive").value = 0;
            document.getElementById(MasterObj + "ChkAbsent").checked = false;
            BindGrid();
        }
        //====================================================================================================================
        function OnFocuseTxtSTime(obj) {
            obj.select();
        }
        //--------------------------------------------------------------------------------------
        function onclickbtnMultiSelect(obj) {
            var DocTypeID = obj.parentElement.parentElement.cells(1).innerText;
            var CodeGroupAcronym = DocTypeID == "1" ? "Hourlykartabl" : "dailykartabl";
            var strUrl = "/TAPresentation/App_Pages/BaseInfo/CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode"
                + "&CodeGroupAcronym=" + CodeGroupAcronym
                + "&CodeVlue=" + obj.getAttribute("CodeValue")
                + "&HidCmbCode=1";
            var rValue = window.showModalDialog(encodeURI(strUrl), "", 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')

            if (rValue != null && rValue != "") {
                LoadXMLCodeSelector(rValue)
                if (CodeNames.length > 35)
                    CodeNamesTitle = CodeNames.substr(0, 35) + '...';
                else
                    CodeNamesTitle = CodeNames;

                obj.setAttribute("CodeValue", CodeValue);
                obj.title = CodeNames;
                obj.parentElement.parentElement.cells(3).children.item(1).value = CodeNamesTitle;
                obj.parentElement.parentElement.cells(3).children.item(1).title = CodeNames;
            }
        }
        //*******************************************************************************
        function LoadXMLCodeSelector(rValue) {
            var strXml = rValue;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            if (oXmlDoc.documentElement != null) {
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (XmlNodes.length != 0) {
                    CodeNames = XmlNodes.item(0).selectSingleNode('Name').text;
                    CodeValue = XmlNodes.item(0).selectSingleNode('ID').text;
                }
            }
        }
        //--------------------------------------------------------------------------------------
        //=========================================Bind Grid=========================================       
        function BindGrid() {
            clearGrid();
            if (($get(MasterObj + "txtXmlValueSelector").value != "<Root></Root>"
             || $get(MasterObj + "txtXmlValueSelector").value != "<Root />") 
             && ($get(MasterObj + "txtXmlValueSelector").value.substring(0, 1) == "<")) {
                var str = $get(MasterObj + "txtXmlValueSelector").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
                var xmlNode = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (xmlNode.length > 0) {
                    for (var i = 0; i < xmlNode.length; i++) {
                        addRow(GrdValueSelector
                                , xmlNode.item(i).selectSingleNode("Value").text.toString()
                                , xmlNode.item(i).selectSingleNode("title").text.toString())
                    }
                }
            }
            SelectRow();
        }
        //----------------------------------------------------------------------------------------------
        function addRow(GrdValueSelector, Value, title) {
            var Row = GrdValueSelector.insertRow();
            Row.className = "CssNewRow"
            Row.insertCell();
            Row.cells(0).innerHTML = "<input type='checkbox' />"
            
            Row.insertCell();
            Row.cells(1).innerHTML = "<label style='text-align:right;'>" + title + "</label>";

            Row.insertCell();
            Row.cells(2).innerHTML = "<label style='text-align:right'>" + Value + "</label>";

            Row.insertCell();
            if (title == "1" || title == "2") {
                Row.cells(3).innerHTML = "<input class='HeaderStyle' onclick='onclickbtnMultiSelect(this)' style='width: 25px;cursor: hand; height: 22px' type='button' value='...' title='انتخاب کد' /><input  type='text' class='TxtControls'  style='width: 220px; height: 22px'disabled='true' />"
                Row.cells(3).children.item(0).setAttribute("CodeValue", "");
            }
            else
                Row.cells(3).innerHTML = "";

            Row.cells(0).style.width = "10px"
            Row.cells(1).style.width = "80px"
            Row.cells(2).style.width = "170px"
            Row.cells(3).style.width = "250px"
        }
        //----------------------------------------------------------------------------------------------
        function clearGrid() {
            while (GrdValueSelector.rows.length > 0)
                GrdValueSelector.deleteRow();
        }
        //----------------------------------------------------------------------------------------------
        function OnClickHeaderChk(obj) {
            for (var i = 0; i < GrdValueSelector.rows.length; i++) {
                if (obj.checked)
                    GrdValueSelector.rows(i).cells(0).firstChild.checked = true;
                else
                    GrdValueSelector.rows(i).cells(0).firstChild.checked = false;
            }
        }
        //==============================================================================================
        function SelectRow() {
            if ($get(MasterObj + "txtCodeValue").value != "") {
                var str = $get(MasterObj + "txtCodeValue").value
                str = str + ",";
                var LenSpl = getCntChar(',', str)
                if (LenSpl == 0)
                    LenSpl += 1
                var ArrCode = new Array(LenSpl)
                for (var i = 0; i < LenSpl; i++) {
                    ArrCode[i] = str.split(",")[i];
                    for (var j = 0; j < GrdValueSelector.rows.length; j++) {
                        if (GrdValueSelector.rows(j).cells(1).innerText == ArrCode[i])
                            GrdValueSelector.rows(j).cells(0).firstChild.checked = true;
                    }
                }
            }
        }
        //==========================================Style Grid=====================================
        function onClickGrdValueSelector() {
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "GrdValueSelector") {
                for (i = 0; i < GrdValueSelector.rows.length; i++) {
                    if (GrdValueSelector.rows(i).className == "CssSelectedItemStyle") {
                        GrdValueSelector.rows(i).className = "CssItemHeader4"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
            oRow.cells(0).firstChild.checked = true;
        }
        //-----------------------------------------------------------------------------------
        function SetGrid(DocTypeID, CodeID, CodeNames) {
            var OGrd = $get("GrdValueSelector");
            if (CodeNames.length > 35)
                CodeNamesTitle = CodeNames.substr(0, 35) + '...';
            else
                CodeNamesTitle = CodeNames;
            if (DocTypeID == 1) {
                OGrd.rows(0).cells(0).firstChild.checked = true;
                OGrd.rows(0).cells(3).children.item(0).setAttribute("CodeValue", CodeID);
                OGrd.rows(0).cells(3).children.item(0).title = CodeNames;
                OGrd.rows(0).cells(3).children.item(1).value = CodeNamesTitle;
            }
            else if (DocTypeID == 2) {
                OGrd.rows(1).cells(0).firstChild.checked = true;
                OGrd.rows(1).cells(3).children.item(0).setAttribute("CodeValue", CodeID);
                OGrd.rows(1).cells(3).children.item(0).title = CodeNames;
                OGrd.rows(1).cells(3).children.item(1).value = CodeNamesTitle;
            }
            else {
                for (var i = 2; i < OGrd.rows.length; i++) {
                    if (OGrd.rows(i).cells(1).innerText == DocTypeID)
                        OGrd.rows(i).cells(0).firstChild.checked = true;
                }
            }
        }
        //===========================================================================================
    </script>
</asp:Content>
