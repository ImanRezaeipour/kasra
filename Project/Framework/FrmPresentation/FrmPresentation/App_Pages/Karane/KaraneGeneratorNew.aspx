<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneGeneratorNew.aspx.cs" Inherits="FrmPresentation.App_Pages.Karane.KaraneGeneratorNew" AsyncTimeout="1800" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .CssSumItemStyle
    {
	    direction: rtl; 
	    color: #FFFF00;
	    background-color: #006699;
	    cursor: default;
	    text-decoration: none;
    }
    .DivStyle1
    {
        border: thin groove #000000;
        background-color: #C5D5E9;
        scrollbar-hightlight-color: white;
        overflow: auto;
        scrollbar-arrow-color: black;
        scrollbar-base-color: #B1D3FF;
        height: 555px;
        width: 1180px;
        float: center;
        clear: right;
        clip: rect(auto, auto, auto, auto);
    }
    .GrdTxtControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#FFCCFF;
    }
     .GrdTxtSaveControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#D1FFC1;
    }
    .GrdTxtDisableControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color: #DDDDDD;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td >
                <fieldset dir="rtl" style=" width:100%;  height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="right">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                دوره:
                            </td>
                            <td>
                                <select id="CmbWorkPeriod" name="CmbWorkPeriod" style="width: 120px" 
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                <%--<input id="RDPerson" type="radio" name="RDFilter" checked value="0" />--%>
                                پرسنلي
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                         <%--   <td>
                                <input id="RDGroup" type="radio" name="RDFilter" value="1" />گروه
                            </td>
                            <td>
                                <select id="CmbGroup"  name="CmbGroup" style="width: 160px"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>--%>
                            <td>
                                <%--<input id="RDDepartment" type="radio" name="RDFilter" value="2" />--%>
                                واحد سازماني
                            </td>
                            <td>
                                <uc3:MultiDepartment ID="UCDepartment" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="tdGrid" align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <asp:HiddenField ID="txtCNameNature" runat="server" />
                        <asp:HiddenField ID="txtDocID" runat="server" />
                        <asp:HiddenField ID="txtWfDocID" runat="server" />
                        <asp:HiddenField ID="txtDocTypeID" runat="server" />
                        <div  class="DivStyle1" align="right">
                            <div id="GridViewCountainer">
                                <cc2:KasraGrid ID="GrdKaraneReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                                 AllowSendToPDF="true"  AllowSendToExcel="true">
                                </cc2:KasraGrid>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtStatusID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtMemberID" name="txtMemberID" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtMType" name="txtMType" runat="server" />
        <input type="text" id="txtMName" name="txtMName" runat="server" />
        <input type="text" runat="server" id="txtMenuItemID" />
        <input type="text" runat="server" id="txtOnLineUser" />
        <input type="text" runat="server" id="txtReportID" />
        <input type="text" runat="server" id="txtWPID" />
        <input type="text" runat="server" id="SDate" />
        <input type="text" runat="server" id="EDate" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtGridName" name="txtGridName" runat="server" />
        <input type="text" id="txtGridID" name="txtGridID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtConfirm" name="txtConfirm" runat="server" />
        <input type="text" id="txtCreator" name="txtCreator" runat="server" />
        <input type="text" id="txtOnlineUserCode" name="txtOnlineUserCode" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnlineDepID" name="txtOnlineDepID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script>
        if (document.getElementById('OToolBar_BtnErjaToStepBefor'))
            document.getElementById('OToolBar_BtnErjaToStepBefor').style.display = "none";
        if (document.getElementById('OToolBar_BtnErjaForReport'))
            document.getElementById('OToolBar_BtnErjaForReport').style.display = "none";
        if (document.getElementById('OToolBar_BtnNotAccept'))
            document.getElementById('OToolBar_BtnNotAccept').style.display = "none";
        //-------------------------------Declaration----------------------------------------------------
        document.dir = "RTL";
        var strConfirm = "";
        $get("OToolBar_TDTopToolBar").style.display = "none"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null, LastSelectedRowClass = "", idx = 0, OldVal = "";
        var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
        CNameNatureArr = CNameNatureArr.split(',');
        var SumArray = new Array;
        for (var i = 0; i < 100; i++)
            SumArray[i] = 0;
        //------------------------------Set Sum Row Color-----------------------------------------------
        SetSumRowColor();
        //------------------------------Set Sum Row Attribute-------------------------------------------
        SetSumRowAttr();
        //==================================PageLoad====================================================
        $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
        $get(MasterObj + "UCDepartment_cmbDepartment").value = $get(MasterObj + "txtOnlineDepID").value
        $get(MasterObj + "txtMName").value = $get(MasterObj + "UCDepartment_cmbDepartment").all.item($get(MasterObj + "UCDepartment_cmbDepartment").selectedIndex).text;
        if ($get(MasterObj + 'txtStatusID').value != "1") {
            document.getElementById('OToolBar_BtnSave').style.display = "none";
            document.getElementById('OToolBar_BtnConfirm').style.display = "none";
            if (document.getElementById('OToolBar_BtnErjaToStepBefor'))
                document.getElementById('OToolBar_BtnErjaToStepBefor').style.display = "none";
            if (document.getElementById('OToolBar_BtnErjaForReport'))
                document.getElementById('OToolBar_BtnErjaForReport').style.display = "none";
            if (document.getElementById('OToolBar_BtnNotAccept'))
                document.getElementById('OToolBar_BtnNotAccept').style.display = "none";
        }
        //*****************************************************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //*****************************************************************************************************
        function BeginRequestHandler(sender, args) {
            var StrVal = $get(MasterObj + "txtSubmit").value
            //-------------------------------------------------------------------------------------------------
            if (StrVal != "Save" && StrVal != "Confirm" && StrVal != "NotAccept" && StrVal != "Filter") {
                // ------------------------------Initialize SumArray-----------------------------------------
                var OGrid = $get(MasterObj + "GrdKaraneReport");
                if (OGrid)
                    var len = OGrid.rows.length
                else
                    return
                if (OGrid.rows(len - 3).cells(i) && OGrid.rows(len - 3).PersonelID == "-1")
                    idx = len - 3
                else if (OGrid.rows(len - 2).cells(i) && OGrid.rows(len - 2).PersonelID == "-1")
                    idx = len - 2
                //--------------------------------------------------
                if (OGrid) {
                    //----------------------------------------------
                    var CNature = 0;
                    //----------------------------------------------
                    for (var i = 0; i < OGrid.rows(1).cells.length; i++)
                        if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                            for (var j = 0; j < CNameNatureArr.length; j++) {
                                if (CNameNatureArr[j].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                                    var CNature = CNameNatureArr[j].split('#')[1]
                            }
                            if (CNature == "18701")
                                SumArray[i] = SetMinuteTime(OGrid.rows(idx).cells(i).innerText) - SetMinuteTime(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                            else
                                SumArray[i] = parseInt(OGrid.rows(idx).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                        }
                }
                //---------------------------------------------------------------------------------------------
            }
            else
                for (var i = 0; i < 100; i++)
                    SumArray[i] = 0;

        }
        //*****************************************************************************************************
        function EndRequestHandler(sender, args) {
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal == "Filter" || StrVal == "Save" || StrVal == "NotAccept") {
                CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
                CNameNatureArr = CNameNatureArr.split(',');
            }
            //--------------------------Set checkbox in Paging Grid---------------------------------------------
            if (StrVal == "BtnFirst" || StrVal == "BtnPrev" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "Const")
                SetChk();
            //--------------------------Check For Display Toolbar Button--------------------------------------------------
            if (StrVal == "Filter") {
                if ($get(MasterObj + 'txtOnlineDepID').value != $get(MasterObj + 'UCDepartment_cmbDepartment').value
            || $get(MasterObj + 'txtStatusID').value != "1") {
                    document.getElementById('OToolBar_BtnSave').style.display = "none";
                    document.getElementById('OToolBar_BtnConfirm').style.display = "none";
                }
                else {
                    document.getElementById('OToolBar_BtnSave').style.display = "inline";
                    document.getElementById('OToolBar_BtnConfirm').style.display = "inline";
                }
            }
            //------------------------------Set Sum Row Attribute----------------------------------------------
            SetSumRowAttr();
            //------------------------------Set Sum Row Attribute----------------------------------------------
            SetSumRowColor();
            //------------------------------Display None Grid After Confirm------------------------------------
            if ((StrVal == "Confirm" || strConfirm == "Confirm")
             && $get(MasterObj + "txtValidate").value == "1"
             && $get(MasterObj + "txtStatusID").value != "1") {
                $get("GridViewCountainer").style.display = "none";
                document.getElementById('OToolBar_BtnSave').style.display = "none";
                document.getElementById('OToolBar_BtnConfirm').style.display = "none";
            }
            //------------------------------Alert Message------------------------------------------------------
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value != "1") {
                    if ($get(MasterObj + "txtStatusID").value == "-1") {
                        var Msg = $get(MasterObj + "txtAlert").value;
                        if (confirm(Msg)) {
                            $get(MasterObj + "txtAlert").value = ""
                            $get(MasterObj + "txtValidate").value = ""
                            $get(MasterObj + "txtStatusID").value = ""
                            document.getElementById("ctl00_ProgressState").value = "0";
                            $get(MasterObj + "txtConfirm").value = -1;
                            strConfirm = "Confirm";
                            $get(MasterObj + "txtSubmit").value = "Confirm";
                            $get(MasterObj + "BtnSubmit2").click();
                            strConfirm = "Confirm";
                            //--------------------------------------------------------------------------------------------------
                            document.getElementById("ctl00_ProgressState").value = "1";
                        }
                    }
                    else
                        alert($get(MasterObj + "txtAlert").value);
               }
                else
                    SetMsg($get(MasterObj + "txtAlert").value);
            }
            //-------------------------------------------------------------------------------------------------
            $get(MasterObj + "txtAlert").value = ""
            $get(MasterObj + "txtValidate").value = ""
            $get(MasterObj + "txtSubmit").value = ""
            $get(MasterObj + "txtStatusID").value = ""
            if (StrVal == "Filter" || StrVal == "Save" || StrVal == "NotAccept")
                $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
            //-------------------------------------------------------------------------------------------------
            if (document.getElementById('OToolBar_BtnErjaToStepBefor'))
                document.getElementById('OToolBar_BtnErjaToStepBefor').style.display = "none";
            if (document.getElementById('OToolBar_BtnErjaForReport'))
                document.getElementById('OToolBar_BtnErjaForReport').style.display = "none";
            if (document.getElementById('OToolBar_BtnNotAccept'))
                document.getElementById('OToolBar_BtnNotAccept').style.display = "none";

        }
        //===============================================Paging=================================================
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
        //=============================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //=============================================================================
        function OnClickBtnFilter() {
            var PrsCode = document.getElementById(MasterObj + "CmbPerson_txtCode").value.trim();
            document.getElementById(MasterObj + "txtWPID").value = $get(MasterObj + "CmbWorkPeriod").value;
            if (document.getElementById(MasterObj + "UCDepartment_txtHidden").value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML("<Root>" + $get(MasterObj + "UCDepartment_txtHidden").value + "</Root>")
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DepartmentID=0 and Selected=1 ]");
                var oXmlNodes2 = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DepartmentID!=0 and Selected=1 ]");
            }
            if ((PrsCode == "") && (document.getElementById(MasterObj + "UCDepartment_cmbDepartment").value == "0" && (document.getElementById(MasterObj + "UCDepartment_txtHidden").value == "" || (oXmlNodes.length > 0 && oXmlNodes2.length == 0) || document.getElementById(MasterObj + "UCDepartment_txtHidden").value == "<Root></Root>"))) {
                alert("لطفا براي فيلتر يکي از آيتمهاي فيلتر را انتخاب کنيد")
            }
            else {
                if (PrsCode != "" && $get(MasterObj + "UCDepartment_cmbDepartment").value == "0")
                    document.getElementById(MasterObj + "txtMType").value = "P";
                else
                    document.getElementById(MasterObj + "txtMType").value = "D";

                if ($get(MasterObj + "txtMType").value == "P"
                 && PrsCode == $get(MasterObj + "txtOnlineUserCode").value)
                    alert("امکان فيلتر برای شخص آنلاين وجود ندارد ");
                else {

                    $get(MasterObj + "txtMemberID").value = $get(MasterObj + "UCDepartment_cmbDepartment").value;
                    $get(MasterObj + "txtMName").value = $get(MasterObj + "UCDepartment_cmbDepartment").all.item($get(MasterObj + "UCDepartment_cmbDepartment").selectedIndex).text;
                    // document.getElementById(MasterObj + "txtDepartment").value = "<Root>" + document.getElementById(MasterObj + "UCDepartment_txtHidden").value + "</Root>";
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //=========================================================================================================
        function SetChk() {
            var OGrid = document.getElementById(MasterObj + "GrdKaraneReport");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length - 1;
            var ColCount = OGrid.rows(0).cells.length;
            var strXml = $get(MasterObj + 'txtXmlSave').value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB");
            if (oXmlNodes.length > 0) {
                for (j = 0; j < oXmlNodes.length; j++) {
                    for (i = 1; i < PageSize; i++) {
                        if (OGrid.rows(i).PersonelID == oXmlNodes.item(j).selectSingleNode("PId").text) {
                            for (var k = 2; k < ColCount; k++) {
                                if (OGrid.rows(i).cells(k).cellIndex == oXmlNodes.item(j).selectSingleNode("cellIndex").text) {
                                    var cellIndex = OGrid.rows(i).cells(k).cellIndex;
                                    OGrid.rows(i).cells(cellIndex).firstChild.value = oXmlNodes.item(j).selectSingleNode("RealVal").text
                                }
                            }
                        }
                    }
                }
            }
        }
        //==================================================================================
        function OnBlurCellCode(Obj) {
            var cellIndex = Obj.parentElement.cellIndex;
            var CName = Obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
            var PId = Obj.parentElement.parentElement.PersonelID;
            var CNature = 0, TotalCodeCount = 0, i = 0, flag = false;
            for (i = 0; i < CNameNatureArr.length && !flag; i++) {
                if (CNameNatureArr[i].split('#')[0] == CName) {
                    CNature = CNameNatureArr[i].split('#')[1]
                    TotalCodeCount = CNameNatureArr[i].split('#')[2]
                    flag = true;
                }
            }
            if (Obj.value != "" || Obj.value != "0") {
                if (CNature == "18701")
                    TimechkNew(Obj);
                else
                    Obj.value = Obj.value.split(":")[0];
            }
            //--------------------Calc TotalCodeCount--------------------------
            if ((OldVal == "" || OldVal == "0") && (Obj.value != "" && Obj.value != "0")) {
                TotalCodeCount++;
                CNameNatureArr[i - 1] = CName + '#' + CNature + '#' + TotalCodeCount
            }
            else if ((OldVal != "" && OldVal != "0") && (Obj.value == "" || Obj.value == "0")) {
                TotalCodeCount--;
                CNameNatureArr[i - 1] = CName + '#' + CNature + '#' + TotalCodeCount
            }
            //-------------------------------------------------------------------
            var strXml = "";
            if (Obj.value != "" && OldVal != Obj.value) {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB[PId=" + PId + " and CName='" + CName + "']");
                ///////////////////////////////////////////////////////////////////////////////
                if (oXmlNodes.length > 0) {
                    var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                    $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
                }
                var Value = Obj.value;
                if (CNature == "18701")
                    Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
                strXml += "<TB>";
                strXml += "<PId>" + PId + "</PId>";
                strXml += "<CName>" + CName + "</CName>";

                strXml += "<Val>" + Value + "</Val>";
                strXml += "<RealVal>" + Obj.value + "</RealVal>";
                strXml += "<cellIndex>" + cellIndex + "</cellIndex>";
                strXml += "</TB>";
                var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocTemp.async = "false";
                oXmlDocTemp.loadXML("<Root>" + strXml + "</Root>")
                var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/TB");
                oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
                $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;

                //---------------------------Set Sum Row Value-----------------------------------------------------
                var OGrid = $get(MasterObj + "GrdKaraneReport");
                //------------------------------------------------------------------------------------------------
                var CellVal = 0;
                if (OGrid) {
                    for (var i = 1; i < idx; i++) {
                        if (OGrid.rows(i).cells(cellIndex).firstChild.value != "" && OGrid.rows(i).cells(cellIndex).firstChild.value != "00:00")
                            if (CNature == "18701")
                                CellVal += parseInt(SetMinuteTime(OGrid.rows(i).cells(cellIndex).firstChild.value));
                            else
                                CellVal += parseInt(OGrid.rows(i).cells(cellIndex).firstChild.value);
                    }
                    if (CNature == "18701")
                        OGrid.rows(idx).cells(cellIndex).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal"))) + parseInt((CellVal - OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex]);
                    else
                        OGrid.rows(idx).cells(cellIndex).innerText = parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal") == "00:00" ? 0 : OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal")) + parseInt(CellVal - parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex];
                    //-----------------------سطر میانگین----------------------------------------------------------
                    if (CNature == "18701") {
                        var SumVal = SetHourlyTime(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).innerText) / TotalCodeCount);
                        OGrid.rows(idx + 1).cells(cellIndex).innerText = SumVal;
                    }
                    else {
                        var SumVal = OGrid.rows(idx).cells(cellIndex).innerText / TotalCodeCount;
                        SumVal = SumVal.toString();
                        if (SumVal.split('.').length > 1)
                            OGrid.rows(idx + 1).cells(cellIndex).innerText = SumVal.split('.')[0] + '.' + SumVal.split('.')[1].substr(0, 2);
                        else
                            OGrid.rows(idx + 1).cells(cellIndex).innerText = SumVal.split('.')[0]
                    }
                }
            }
            //-------------------------------------------------------------------------------------------------
        }
        //==============================================================================================================
        function OnClickBtnSave() {
            $get(MasterObj + "txtConfirm").value = 0;
            $get(MasterObj + "txtSubmit").value = "Save";
            $get(MasterObj + "BtnSubmit").click();
        }
        //==============================================================================================================
        function OnClickBtnConfirm() {
            $get(MasterObj + "txtConfirm").value = 1;
            $get(MasterObj + "txtSubmit").value = "Confirm";
            $get(MasterObj + "BtnSubmit2").click();
        }
        //==============================================================================================================
        function OnClickBtnNotAccept() {
            $get(MasterObj + "txtConfirm").value = 2;
            $get(MasterObj + "txtSubmit").value = "NotAccept";
            $get(MasterObj + "BtnSubmit").click();
        }
        //==============================================================================================================
        function OnClickBtnErjaToStepBefor() {
            var Msg = "آیا برای ارجاع به مرحله قبل مطمئنید؟"
            if (confirm(Msg)) {
                $get(MasterObj + "txtConfirm").value = -1;
                $get(MasterObj + "txtSubmit").value = "Confirm";
                $get(MasterObj + "BtnSubmit2").click();
            }
        }
        //==============================================================================================================
        function OnClickBtnErjaForReport() {
            $get(MasterObj + "txtConfirm").value = -4;
            $get(MasterObj + "txtSubmit").value = "Confirm";
            $get(MasterObj + "BtnSubmit").click();
        }
        //==============================================================================================================
        function OnFocusCellCode(obj) {
            obj.select();
            obj.focus();
            OldVal = obj.value;
        }
        //==============================================================================================================
        function checkEnter(obj) {
            try {
                var OGrid = obj.parentElement.parentElement.parentElement;
                var grdLen = OGrid.rows.length;
                if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                    grdLen = grdLen - 1;

                var row = obj.parentElement.parentElement;
                var CellIndex = obj.parentElement.cellIndex;
                var CellLeng = ColCount = OGrid.rows(0).cells.length;
                //-----------------------مقدار دهی نوع کلید فشرده شده-----------      
                WindowEvent = window.event.keyCode
                //-----------------------------------------------تشخیص نوع کلید
                switch (WindowEvent) {
                    case 40: //---------------اروکی بالا
                        var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
                        if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                        }
                        else if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                            rowIndex = rowIndex + 1
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                        }
                        break;
                    case 39: //---------------اروکی راست    
                        CellIndex = CellIndex - 1;
                        while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex > 1) {
                            CellIndex = CellIndex - 1;
                        }
                        if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                            OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus();
                            OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
                        }
                        break;
                    case 38: //----------------اروکی پایین
                        var rowIndex = parseInt(row.rowIndex) - 1; //----------index ردیف جدید
                        if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                        }
                        else if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                            rowIndex = rowIndex - 1;
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                        }
                        break;
                    case 37: //----------------اروکی چپ
                        CellIndex = CellIndex < ColCount - 1 ? CellIndex + 1 : CellIndex;
                        while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex < ColCount - 1)
                            CellIndex = CellIndex + 1;
                        if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                            OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
                        }
                        break;
                    case 13:
                        var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
                        if (OGrid.rows(rowIndex) != null && rowIndex != 0) {
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                            OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                        }
                        break;
                }
            }
            catch (ex) { }
        }
        //==============================================================================================================
        function OnKeyDownTimeNew(obj) {
            var cellIndex = obj.parentElement.cellIndex;
            var CName = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
            var CNature = 0;
            for (var i = 0; i < CNameNatureArr.length; i++) {
                if (CNameNatureArr[i].split('#')[0] == CName)
                    CNature = CNameNatureArr[i].split('#')[1]
            }
            if (CNature == "18701")
                OnKeyDownTime();
            else
                OnKeyDownInt(obj); //OnKeyDownNum('double',obj);
        }
        //===============================================================================================================
        function TimechkNew(Obj) {
            if (Obj.value.split(":").length == 1)
                Obj.value = Obj.value + ":00";
            else
                if (Obj.value.split(":")[1] > 59) {
                    alert("!لطفا ساعت صحيح را وارد کنيد");
                    Obj.select();
                    Obj.focus();
                }
        }
        //===============================================================================================================
        function OnClickBtnFlow() {
            var DocID = $get(MasterObj + "txtDocID").value;
            var WFDocId = $get(MasterObj + "txtWfDocID").value;
            var DocTypeID = $get(MasterObj + "txtDocTypeID").value;

            var OGrid = document.getElementById(MasterObj + "GrdKaraneReport");
            if (OGrid != null) {
                if (DocID == 0)
                    DocID = 999999999;

                if (WFDocId == 0)
                    WFDocId = 999999999;

                if (DocTypeID == 0)
                    window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
                else
                    window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
            }

        }
        //===============================================================================================================
        function SetSumRowColor() {
            var oGrd = document.getElementById(MasterObj + "GrdKaraneReport"), i = 0
            if (oGrd)
                var len = oGrd.rows.length
            else
                return
            if (oGrd.rows(len - 3).cells(i) && oGrd.rows(len - 3).PersonelID == "-1")
                idx = len - 3
            else if (oGrd.rows(len - 2).cells(i) && oGrd.rows(len - 2).PersonelID == "-1")
                idx = len - 2
          
            try {
                if (idx != 0) {
                    while (oGrd.rows(idx).cells(i)) {
                        oGrd.rows(idx).className = ""
                        oGrd.rows(idx).cells(i).className = ""
                        oGrd.rows(idx).className = "CssSumItemStyle"
                        oGrd.rows(idx).cells(i).className = "CssSumItemStyle"
                        oGrd.rows(idx).cells(0).innerText = "مجموع کل";

                        oGrd.rows(idx + 1).className = ""
                        oGrd.rows(idx + 1).cells(i).className = ""
                        oGrd.rows(idx + 1).className = "CssSumItemStyle"
                        oGrd.rows(idx + 1).cells(i).className = "CssSumItemStyle"
                        oGrd.rows(idx + 1).cells(0).innerText = "ميانگين کل";
                        i++
                    }
                }
            }
            catch (ex) { }
        }
        //================================================================================================================
        function SetMinuteTime(Time) {
            var Hour = Time.split(':')[0]
            var Minute = Time.split(':')[1];
            if (Hour.substr(0, 1) == '0')
                Hour = Hour.substr(1, 2);
            if (Minute.substr(0, 1) == '0')
                Minute = Minute.substr(1, 2);
            return parseInt(Hour) * 60 + parseInt(Minute)
        }
        //================================================================================================================
        function SetHourlyTime(Sum) {
            var SignFlag = Sum < 0 ? 1 : 0;
            Sum = Math.abs(Sum);
            var Hour = parseInt(Sum / 60).toString();
            var Minute = Sum % 60
            if (Hour.toString().length == 1)
                Hour = "0" + Hour;
            if (Minute.toString().length == 1)
                Minute = "0" + Minute;
            return Hour + ":" + Minute + (SignFlag == 1 ? "-" : "");
        }
        //===============================================================================================================
        function OnClickBtnLog() {
            var CheckVal = $('[name="RDFilter"]:checked').val()
            var MemberID, MType;
            switch (CheckVal) {
                case "0":
                    MType = "P";
                    MemberID = PrsCode;
                    break;
                case "1":
                    MType = "G";
                    MemberID = $get(MasterObj + "CmbGroup").value;
                    break;
                case "2":
                    MType = "D";
                    MemberID = $get(MasterObj + "UCDepartment_cmbDepartment").value;

                    break;
            }
            var url = "KaraneLog.aspx?ReportID=" + $get(MasterObj + "txtReportID").value
             + "&WPID=" + $get(MasterObj + "CmbWorkPeriod").value + "&MemberID=" + MemberID + "&MType=" + MType
             + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            window.showModalDialog(url, "", "dialogHeight: 400px;dialogWidth:800px;center: Yes;help: no;status: no")
        }
        //=================================================================================================================
        function SetSumRowAttr() {
            var OGrid = $get(MasterObj + "GrdKaraneReport");
            if (OGrid)
                var len = OGrid.rows.length
            else
                return
            if (OGrid.rows(len - 3).cells(i) && OGrid.rows(len - 3).PersonelID == "-1")
                idx = len - 3
            else if (OGrid.rows(len - 2).cells(i) && OGrid.rows(len - 2).PersonelID == "-1")
                idx = len - 2
            //---------------------------------------------
            if (OGrid) {
                //----------------------------------------------
                var CNature = 0, TotalCodeCount = 0;
                //----------------------------------------------
                for (var i = 0; i < OGrid.rows(1).cells.length; i++) {
                    if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                        var PageVal = 0;
                        for (var k = 0; k < CNameNatureArr.length; k++) {
                            if (CNameNatureArr[k].split('#')[0] == OGrid.rows(0).cells(i).innerText) {
                                CNature = CNameNatureArr[k].split('#')[1]
                                TotalCodeCount = CNameNatureArr[k].split('#')[2]
                            }
                        }
                        for (var j = 1; j < idx; j++) {
                            if (OGrid.rows(j).cells(i).firstChild.value != "" && OGrid.rows(j).cells(i).firstChild.value != "00:00")
                                if (CNature == "18701")
                                    PageVal += parseInt(SetMinuteTime(OGrid.rows(j).cells(i).firstChild.value));
                                else
                                    PageVal += parseInt(OGrid.rows(j).cells(i).firstChild.value);
                        }

                        OGrid.rows(idx).cells(i).PageVal = PageVal;
                        if (CNature == "18701")
                            OGrid.rows(idx).cells(i).innerText = SetHourlyTime(parseInt(SumArray[i]) + SetMinuteTime(OGrid.rows(idx).cells(i).innerText));
                        else
                            OGrid.rows(idx).cells(i).innerText = parseInt(SumArray[i]) + parseInt(OGrid.rows(idx).cells(i).innerText);
                        //------------------سطر میانگین--------------------------------------------------------
                        if (CNature == "18701") {
                            if (TotalCodeCount != "0")
                                var SumVal = SetHourlyTime(SetMinuteTime(OGrid.rows(idx).cells(i).innerText) / TotalCodeCount);
                            else
                                SumVal = "00:00";
                            OGrid.rows(idx + 1).cells(i).innerText = SumVal; //.split(':')[0] + ':' + SumVal.split(':')[1].substr(0, 2);

                        }
                        else {
                            if (TotalCodeCount != "0")
                                var SumVal = parseInt(OGrid.rows(idx).cells(i).innerText) / parseInt(TotalCodeCount);
                            else
                                SumVal = 0;
                            SumVal = SumVal.toString();
                            if (SumVal.split('.').length > 1)
                                OGrid.rows(idx + 1).cells(i).innerText = SumVal.split('.')[0] + '.' + SumVal.split('.')[1].substr(0, 2);
                            else
                                OGrid.rows(idx + 1).cells(i).innerText = SumVal.split('.')[0]
                        }

                    }
                }
            }
            //-------------------------------------------------------------------------------------------------
        }
        //=================================================================================================================
        function OnClickBtnAllPDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=================================================================================================================
        function OnClickBtnOnePDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=================================================================================================================
        function OnClickBtnAllExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=================================================================================================================
        function OnClickBtnOneExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=================================================================================================================

    </script>
</asp:Content>

