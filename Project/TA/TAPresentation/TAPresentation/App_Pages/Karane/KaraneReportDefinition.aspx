<%@ Page Title="-------------------------------------------------------------------------------------------------------------------تعريف آيتم کارانه-----------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneReportDefinition.aspx.cs" ValidateRequest="false"  Inherits="TAPresentation.App_Pages.Karane.KaraneReportDefinition" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
<style>
  .DivStyle
        {
            border: thin groove #000000; 
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:400px; 
            width :1180px;
            float: center; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
        }
</style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Parameter" style=" width: 900px; height: 380px; ">
        <table style="width: 100%; height: 100%"  align="right">
            <tr>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr id="trFilter">
                <td>
                    <div align="right">
                        نام آيتم کارانه :
                        <select id="CmbKaraneRptName" style=" width:180px"  onchange="OnClickBtnFilter()" class='txtControls' runat="server">
                            <option></option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <uc1:ToolBar ID="OToolBar" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <table align="right" >
                        <tr>
                            <td>
                                نام آيتم کارانه :
                            </td>
                            <td>
                                <input type="text" style="width: 180px" class="TxtControls"  id="txtKaraneRptName"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="DivStyle">
                        <tr valign="top" align="left">
                            <td>
                                <div align="right">
                                    <img alt="" src="../../App_Utility/Images/Icons/S8.png" style="cursor: pointer" onclick="OnClickImgSearchName()" />
                                    کد انتخابي : &nbsp; &nbsp; 
                                    <input id="txtSearch" style="width:162px" onkeypress="OnKeypressTxtSearch(this.value),FKeyPress()" onkeydown="FKeyDown()"
                                        class="TxtControls" type="text" />
                                </div>
                            </td>
                            <td colspan="2" align="left">
                                <div align="left" dir="ltr" style="width: 100%">
                                    <input id="BtnUpItem" title="حرکت به بالا" class="CssMoveUpItem" onclick="OnClickBtnMoveItemField(-1)"
                                        type="button" name="BtnUpItem" />
                                    <input id="BtnDownItem" title="حرکت به پايين" class="CssMoveDownItem" onclick="OnClickBtnMoveItemField(1)"
                                        type="button" name="BtnDownItem" />
                                </div>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td >
                                <fieldset dir="rtl" style="width: 350px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                    border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                                    <legend style="color: #75A3D0">ليست کدها</legend>
                                    <div  runat="server" align="center" style="scrollbar-highlight-color: white;
                                        overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                        height: 350px; width:300px">
                                        <div id="GridViewCountainer" align="center">
                                            <cc2:KasraGrid ID="GrdCode" runat="server" OnRowDataBound="Grid_RowDataBound">
                                            </cc2:KasraGrid>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                            <td valign="top">
                                <table id="Table3" style="width: 35px; height: 80px" cellspacing="1" cellpadding="1"
                                    border="0">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="btnAddItem" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdNewCode')"
                                                type="button" name="btnback">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="btnDelItem" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdNewCode')"
                                                type="button" name="btnNext">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="btnAddAllItem" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewCode')"
                                                type="button" name="btnnNext">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="btnDelAllItem" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewCode')"
                                                type="button" name="btnnNext" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <fieldset dir="rtl" style="width: 790px; height: 350px; border-right: lightblue thin inset;
                                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                    align="middle">
                                    <legend style="color: #75A3D0">کدهاي نمايشي</legend>
                                    <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                        scrollbar-base-color: #b0c4de; height: 350px; width: 790px;">
                                        <table id="XTabTable_Header" cellpadding="0" style="width: 760px;" cellspacing="0"
                                            border="0">
                                            <thead style="display: inline">
                                                <tr class="CssHeaderStyle">
                                                    <td width="180px" align="center">
                                                        نام جاري
                                                    </td>
                                                    <td width="160px" align="center">
                                                        نام جديد
                                                    </td>
                                                    <td align="center" style="width: 80px">
                                                        سايز
                                                    </td>
                                                    <td align="center" style="width: 80px">
                                                        قابل ويرايش
                                                    </td>
                                                    <td align="center" style="width: 80px">
                                                        نمايشي
                                                    </td>
                                                    <td align="center" style="width: 100px">
                                                        ماهيت کد 
                                                    </td>
                                                    <td align="center" style="width: 60px">
                                                        پيش فرض
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <div style="height: 300px; width: 760px;">
                                            <table id="GrdNewCode" onclick="OnClickGrdCodeSub(this)">
                                                <thead style="display: none;">
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" runat="server" id="txtAlert" />
                <input type="text" runat="server" id="txtValidate" />
                <input type="hidden" id="txtXmlField" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtXmlOperand" name="txtXmlOperand" runat="server" />
        <input type="text" id="txtXmlMenuItems" name="txtXmlMenuItems" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
         <select
             runat="server" id="CmbCodeNature">
             <option></option>
         </select>
        <select runat="server" id="CmbValKind">
            <option></option>
        </select>
        <script src="../../App_Utility/Scripts/farsi.js" type="text/javascript"></script>
    </div>
    <script >
       // document.getElementsByTagName("body")[0].scroll = "no";
        document.dir = "RTL";
        var MasterObj = "ctl00_ContentPlaceHolder1_"
        , GrdNewCodeLastSelectedRow = null, GrdNewCodeLastSelectedRowClass = "", GrdNewParamRowIdx = -1;

        var LastSelectedRowGrd = null, LastSelectedRowClassGrd = "", GrdNewCodeRowIdx = -1;

        var VariableTypeID = 10 //شناسه تايپ کمبو
        var SaveDesignMode = 0
        var GrdPageParamRowIdx = 0;

        if ($get(MasterObj + "txtReportID").value != "") {
            $get("trFilter").style.display = "none";
            $get("OToolBar_BtnFilter").style.display = "none";
            document.getElementById(MasterObj + "CmbKaraneRptName").value = $get(MasterObj + "txtReportID").value;
            if ($get(MasterObj + "txtReportID").value != "0")
                LoadGrdNewCode();
        }
        //*******************************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

        }
        //*******************************************************************************
        function EndRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtAlert").value != "") {
                if (document.getElementById(MasterObj + "txtValidate").value == 0)
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = 1;
                }
            }
            if (document.getElementById(MasterObj + "txtSubmit").value == "Filter")
                LoadGrdNewCode();
            document.getElementById(MasterObj + "txtAlert").value = ""
            document.getElementById(MasterObj + "txtValidate").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = ""
        }
        //*******************************************************************************
        function OnClickBtnAddItem(GrdName) {
            if (LastSelectedRowGrd != null) {
                var oGrdCode = document.getElementById(MasterObj + "GrdCode");
                var oGrdNewCode = document.getElementById("GrdNewCode")
                if (!oGrdCode || !oGrdNewCode) //If No Row
                    return

                if (oGrdNewCode.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrd.cells(0).firstChild.innerText))//If Add Befor
                    return

                AddRow_GrdNewCode(LastSelectedRowGrd.cells(0).firstChild.innerText
                                    , LastSelectedRowGrd.cells(1).firstChild.innerText
                                    , LastSelectedRowGrd.cells(1).firstChild.innerText, 60, 0, 1,0,"")

            }
        }
        //*******************************************************************************
        function OnClickBtnDelItem(GrdName) {
            var oGrdNewCode = document.getElementById("GrdNewCode")
            if (GrdNewCodeLastSelectedRow == null)
                return
            oGrdNewCode.deleteRow(GrdNewCodeLastSelectedRow.rowIndex)
            GrdNewCodeRowIdx--;
            GrdNewCodeLastSelectedRow = null
            SetRowStyle(GrdName)
        }
        //*******************************************************************************
        function OnClickBtnDelAllItem(GrdName) {
            ClearGrd(GrdName)
        }
        //*******************************************************************************
        function OnClickBtnAddAllItem(GrdName) {
            ClearGrd(GrdName)
            var oGrdCode = document.getElementById(MasterObj + "GrdCode");
            if (!oGrdCode)
                return
            var len = oGrdCode.rows.length
            for (var i = 1; i < len; i++) {
                AddRow_GrdNewCode(oGrdCode.rows(i).cells(0).firstChild.innerText
                                    , oGrdCode.rows(i).cells(1).firstChild.innerText
                                    , oGrdCode.rows(i).cells(1).firstChild.innerText, 60, 0, 1
                                    ,0 ,"")
            }
        }
        //*******************************************************************************
        function AddRow_GrdNewCode(CodeID,CodeName,Caption,Size,Editable,Viewable,CodeNature,DefaultVal) {
            var oGrdNewCode = document.getElementById("GrdNewCode")
            oGrdNewCode.insertRow();
            GrdNewCodeRowIdx++;
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            oGrdNewCode.rows(GrdNewCodeRowIdx).insertCell()
            if (GrdNewCodeRowIdx % 2 == 0)
                oGrdNewCode.rows(GrdNewCodeRowIdx).className = "CssItemStyle"
            else
                oGrdNewCode.rows(GrdNewCodeRowIdx).className = "CssAlternatingItemStyle"

            oGrdNewCode.rows(GrdNewCodeRowIdx).setAttribute("CodeID", CodeID)

            var strName = ""

            if (CodeName.length > 20)
                strName = CodeName.substr(0, 20) + "..."
            else
                strName = CodeName

            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(0).innerHTML = strName
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(0).title = CodeName
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(1).innerHTML = "<INPUT type='text' class='txtControls' onfocus='OnFocus(this)' value='" + Caption + "' style='WIDTH:170px' />"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(2).innerHTML = "<INPUT type='text' class='txtControls' onfocus='OnFocus(this)' value='" + Size + "' style='WIDTH:60px' />"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(3).innerHTML = CreatComboEdit();
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(4).innerHTML = CreatComboView();

            if (Editable == 0)
                oGrdNewCode.rows(GrdNewCodeRowIdx).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbCodeNature").innerHTML + "</select>";
            else
                oGrdNewCode.rows(GrdNewCodeRowIdx).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbValKind").innerHTML + "</select>";

            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(6).innerHTML = "<INPUT type='text' class='txtControls' onkeydown='OnKeyDownTimeNew(this)' onfocus='OnFocus(this)' onblur='OnBlurTxtDefault(this)'  disabled=true  value='" + DefaultVal + "' style='WIDTH:60px' />"

            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(3).firstChild.value = Editable
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(4).firstChild.value = Viewable
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(5).firstChild.value = CodeNature

            if (Editable == 1)
                oGrdNewCode.rows(GrdNewCodeRowIdx).cells(6).firstChild.disabled = false;

            oGrdNewCode.rows(GrdNewCodeRowIdx).align = "center"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(0).style.width = "180px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(1).style.width = "160px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(2).style.width = "80px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(3).style.width = "80px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(4).style.width = "80px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(5).style.width = "100px"
            oGrdNewCode.rows(GrdNewCodeRowIdx).cells(6).style.width = "60px"
        }
        //*******************************************************************************
        function CreatComboEdit() {
            var strHtml = "<select class='TxtControls' onchange='OnChangeCmbEditable(this)' style='width:70px'>"
            strHtml += "<option value='0'>False</option>"
            strHtml += "<option value='1'>True</option>"
            strHtml += "</select>"
            return strHtml;
        }
        //*******************************************************************************
        function CreatComboView() {
            var strHtml = "<select class='TxtControls'  style='width:100px'>"
            strHtml += "<option value='0'>False</option>"
            strHtml += "<option value='1'>True</option>"
            strHtml += "</select>"
            return strHtml;
        }
        //*******************************************************************************
        function OnChangeCmbEditable(obj) {
            var OGrid = obj.parentElement.parentElement.parentElement;
            var rowIndex = obj.parentElement.parentElement.rowIndex
            if (obj.value == 1) {
                OGrid.rows(rowIndex).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'>" + document.getElementById(MasterObj + "CmbValKind").innerHTML + "</select>";
                OGrid.rows(rowIndex).cells(6).firstChild.disabled = false;
            }
            else {
                OGrid.rows(rowIndex).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'>" + document.getElementById(MasterObj + "CmbCodeNature").innerHTML + "</select>";
                OGrid.rows(rowIndex).cells(6).firstChild.disabled = true;
            }
        }
        //*******************************************************************************
        function OnFocus(obj) {
            obj.select();
            obj.focus();
        }
        //*******************************************************************************
        function CheckExists(GrdName, idx) {
            var oGrdCode = document.getElementById(MasterObj + "GrdCode");
            var oGrdNewCode = document.getElementById("GrdNewCode")
            if (!oGrdCode || !oGrdNewCode)
                return
            var len = oGrdNewCode.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrdNewCode.rows(i).CodeID == idx)
                    return false
            }
            return true
        }
        //*******************************************************************************
        function ClearGrd(GrdName) {
            var oGrdNewCode = document.getElementById("GrdNewCode")
            var len = oGrdNewCode.rows.length
            for (var i = 0; i < len; i++) {
                oGrdNewCode.deleteRow(0)
            }
            GrdNewCodeRowIdx = -1
        }
        //*******************************************************************************
        function OnClickGrdCodeSub(GrdNewCodeSelectedRow) {
            var oRow = window.event.srcElement.parentElement
            var rIndex
            while (oRow.tagName != 'TR')
                oRow = oRow.parentElement
            if (oRow.parentElement.parentElement.id != "GrdNewCode")
                return
            if (GrdNewCodeLastSelectedRow != null) {

                GrdNewCodeLastSelectedRow.className = GrdNewCodeLastSelectedRowClass;
            }
            GrdNewCodeLastSelectedRowClass = oRow.className;
            GrdNewCodeLastSelectedRow = oRow;
            oRow.className = "CssSelectedItemStyle";
        }
        //*******************************************************************************
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRowGrd != null) {
                LastSelectedRowGrd.className = LastSelectedRowClassGrd;
            }
            LastSelectedRowClass= SelectedRow.className;
            LastSelectedRowGrd = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //*******************************************************************************
        function OndbClickGrd() {
            OnClickBtnAddItem("GrdNewCode");
        }
        //*******************************************************************************
        function SetRowStyle(GrdName) {
            var oGrd = document.getElementById("GrdNewCode")
            var len = oGrd.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrd.rows(i).rowIndex % 2 == 0)
                    oGrd.rows(i).className = "CssItemStyle"
                else
                    oGrd.rows(i).className = "CssAlternatingItemStyle"
            }
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            if (CheckEmpty())
                return
            var FlagCode = 0, GLen
            var StrXml = "<Root>"
            var oCmbKaraneRptName = document.getElementById(MasterObj + "CmbKaraneRptName")
            //------------------------------------------
            document.getElementById(MasterObj + "txtReportID").value = oCmbKaraneRptName.value;
            StrXml += "<Info>"
            StrXml += "<ReportName>" + document.getElementById(MasterObj + "txtKaraneRptName").value + "</ReportName>"
            StrXml += "</Info>"

            var oGrdNewCode = document.getElementById("GrdNewCode")
            GLen = oGrdNewCode.rows.length
            for (var i = 0; i < GLen; i++) {
                if (oGrdNewCode.rows(i).cells(1).firstChild.value == "" || oGrdNewCode.rows(i).cells(2).firstChild.value == "") {
                    FlagCode = 1
                    break
                }
                var Editable = oGrdNewCode.rows(i).cells(3).firstChild.value;
                var CodeNature = oGrdNewCode.rows(i).cells(5).firstChild.value;
                var DefaultVal = oGrdNewCode.rows(i).cells(6).firstChild.value
                if (Editable == 1 && CodeNature == 18701 && DefaultVal!="")
                    DefaultVal = parseInt(DefaultVal.split(":")[0] * 60) + parseInt(DefaultVal.split(":")[1]);
                StrXml += "<Fields>"
                StrXml += "<FieldID>" + oGrdNewCode.rows(i).getAttribute("FieldID") + "</FieldID>"
                StrXml += "<CodeID>" + oGrdNewCode.rows(i).getAttribute("CodeID") + "</CodeID>"
                StrXml += "<CodeName>" + oGrdNewCode.rows(i).cells(1).firstChild.value + "</CodeName>"
                StrXml += "<Size>" + oGrdNewCode.rows(i).cells(2).firstChild.value + "</Size>"
                StrXml += "<Editable>" + Editable + "</Editable>"
                StrXml += "<Viewable>" + oGrdNewCode.rows(i).cells(4).firstChild.value + "</Viewable>"
                StrXml += "<CodeNature>" + CodeNature + "</CodeNature>"
                if (Editable == 1)
                    StrXml += "<DefaultValue>" + DefaultVal + "</DefaultValue>"
                StrXml += "<Intval>" + (i + 1) + "</Intval>"
                StrXml += "</Fields>"
                //**************************************************************
            }
            //------------------------------------------
            if (FlagCode == 1) {
                alert('لطفا اطلاعات گريد کد ها را تکمیل کنيد')
                return
            }
            //------------------------------------------
            StrXml += "</Root>"
            document.getElementById(MasterObj + "txtXmlSave").value = StrXml
            document.getElementById(MasterObj + 'txtSubmit').value = "Modify"
            document.getElementById(MasterObj + 'BtnSubmit').click()
        }
        //*******************************************************************************
        function OnClickImgSearchName() {
            SearchFieldName(document.getElementById("txtSearch").value)
        }
        //*******************************************************************************
        function SearchFieldName(oValue) {
            var oGrd = document.getElementById(MasterObj + "GrdCode");
            var len = oGrd.rows.length
            oValue = ReplaceAll(oValue, 'ک', 'ك')
            oValue = ReplaceAll(oValue, 'ي', 'ي')
            oValue = ReplaceAll(oValue, 'ی', 'ي')
            oValue = ReplaceAll(oValue, ' ', '')
            var caption = ''
            for (var i = 1; i < len; i++) {
                caption = oGrd.rows(i).cells(1).firstChild.innerText;
                caption = ReplaceAll(caption, ' ', '')
                if (getCntChar(oValue.toLowerCase(), caption.toLowerCase()) > 0) {
                    if (LastSelectedRowGrd != null) {
                        LastSelectedRowGrd.className = LastSelectedRowClassGrd;
                    }
                    LastSelectedRowClassGrd = oGrd.rows(i).className
                    LastSelectedRowGrd = oGrd.rows(i)
                    oGrd.rows(i).className = "CssSelectedItemStyle"
                    oGrd.rows(i).cells(0).focus()
                    return
                }
                else {
                    if (LastSelectedRowGrd != null)
                        LastSelectedRowGrd.className = LastSelectedRowClassGrd;
                }
            }
            if (oValue == "")
                if (LastSelectedRowGrd != null)
                    LastSelectedRowGrd.className = LastSelectedRowClassGrd;

        }
        //*******************************************************************************    
        function OnKeypressTxtSearch(oValue) {
            if (window.event.keyCode == 13) {
                SearchFieldName(oValue)
            }
        }
        //*******************************************************************************
        function OnClickBtnMoveItemField(Direction) {//Direction:-1 Up ___Direction:+1 Down
            if (GrdNewCodeLastSelectedRow != null && GrdNewCodeLastSelectedRow.rowIndex + Direction != -1) {
                var oGrdNewCode = document.getElementById("GrdNewCode")
                var tmpobj = new Object();
                var len = oGrdNewCode.rows.length
                var idx = GrdNewCodeLastSelectedRow.rowIndex + Direction
                var CNature1 = GrdNewCodeLastSelectedRow.cells(5).firstChild.value
                var CNature2 = oGrdNewCode.rows(idx).cells(5).firstChild.value 
                if (!oGrdNewCode.rows(idx))
                    return
                if (oGrdNewCode.rows(idx).cells(5).firstChild.all.item(0).value != GrdNewCodeLastSelectedRow.cells(5).firstChild.all.item(0).value) {
                    if (GrdNewCodeLastSelectedRow.cells(5).firstChild.value == "0"
                    || GrdNewCodeLastSelectedRow.cells(5).firstChild.value == "1"
                    || GrdNewCodeLastSelectedRow.cells(5).firstChild.value == "2"
                    || GrdNewCodeLastSelectedRow.cells(5).firstChild.value == "3")
                        GrdNewCodeLastSelectedRow.cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbValKind").innerHTML + "</select>"

                    else
                        GrdNewCodeLastSelectedRow.cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbCodeNature").innerHTML + "</select>"


                    if (oGrdNewCode.rows(idx).cells(5).firstChild.value == "0"
                    || oGrdNewCode.rows(idx).cells(5).firstChild.value == "1"
                    || oGrdNewCode.rows(idx).cells(5).firstChild.value == "2"
                    || oGrdNewCode.rows(idx).cells(5).firstChild.value == "3")
                        oGrdNewCode.rows(idx).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbValKind").innerHTML + "</select>"

                    else
                        oGrdNewCode.rows(idx).cells(5).innerHTML = "<select class='txtControls' style='WIDTH: 100px'   >" + document.getElementById(MasterObj + "CmbCodeNature").innerHTML + "</select>"

                }
                
                tmpobj.Caption = GrdNewCodeLastSelectedRow.cells(0).innerText
                tmpobj.CaptionT = GrdNewCodeLastSelectedRow.cells(0).title
                tmpobj.Name = GrdNewCodeLastSelectedRow.cells(1).firstChild.value
                tmpobj.Size = GrdNewCodeLastSelectedRow.cells(2).firstChild.value
                tmpobj.Editable = GrdNewCodeLastSelectedRow.cells(3).firstChild.value
                tmpobj.Viewable = GrdNewCodeLastSelectedRow.cells(4).firstChild.value
                tmpobj.CodeNature = GrdNewCodeLastSelectedRow.cells(5).firstChild.value
                tmpobj.DefaultValue = GrdNewCodeLastSelectedRow.cells(6).firstChild.value
                tmpobj.CodeID = GrdNewCodeLastSelectedRow.getAttribute("CodeID")

                GrdNewCodeLastSelectedRow.cells(0).innerText = oGrdNewCode.rows(idx).cells(0).innerText
                GrdNewCodeLastSelectedRow.cells(0).title = oGrdNewCode.rows(idx).cells(0).title
                GrdNewCodeLastSelectedRow.cells(1).firstChild.value = oGrdNewCode.rows(idx).cells(1).firstChild.value
                GrdNewCodeLastSelectedRow.cells(2).firstChild.value = oGrdNewCode.rows(idx).cells(2).firstChild.value
                GrdNewCodeLastSelectedRow.cells(3).firstChild.value = oGrdNewCode.rows(idx).cells(3).firstChild.value
                GrdNewCodeLastSelectedRow.cells(4).firstChild.value = oGrdNewCode.rows(idx).cells(4).firstChild.value

                if (oGrdNewCode.rows(idx).cells(5).firstChild.all.item(0).value != GrdNewCodeLastSelectedRow.cells(5).firstChild.all.item(0).value)
                    GrdNewCodeLastSelectedRow.cells(5).firstChild.value = CNature2;
                else
                    GrdNewCodeLastSelectedRow.cells(5).firstChild.value = oGrdNewCode.rows(idx).cells(5).firstChild.value
                GrdNewCodeLastSelectedRow.cells(6).firstChild.value = oGrdNewCode.rows(idx).cells(6).firstChild.value

                GrdNewCodeLastSelectedRow.setAttribute("CodeID", oGrdNewCode.rows(idx).getAttribute("CodeID"))

                oGrdNewCode.rows(idx).cells(0).innerText = tmpobj.Caption
                oGrdNewCode.rows(idx).cells(0).title = tmpobj.CaptionT
                oGrdNewCode.rows(idx).cells(1).firstChild.value = tmpobj.Name
                oGrdNewCode.rows(idx).cells(2).firstChild.value = tmpobj.Size
                oGrdNewCode.rows(idx).cells(3).firstChild.value = tmpobj.Editable
                oGrdNewCode.rows(idx).cells(4).firstChild.value = tmpobj.Viewable
                if (oGrdNewCode.rows(idx).cells(5).firstChild.all.item(0).value != GrdNewCodeLastSelectedRow.cells(5).firstChild.all.item(0).value)
                    oGrdNewCode.rows(idx).cells(5).firstChild.value = CNature1;
                else
                    oGrdNewCode.rows(idx).cells(5).firstChild.value = tmpobj.CodeNature;
                oGrdNewCode.rows(idx).cells(6).firstChild.value = tmpobj.DefaultValue
                oGrdNewCode.rows(idx).setAttribute("CodeID", tmpobj.CodeID)

                GrdNewCodeLastSelectedRow.className = GrdNewCodeLastSelectedRowClass;
                GrdNewCodeLastSelectedRowClass = oGrdNewCode.rows(idx).className;
                GrdNewCodeLastSelectedRow = oGrdNewCode.rows(idx);
                oGrdNewCode.rows(idx).className = "CssSelectedItemStyle";

            }
        }
        //*******************************************************************************
        function CheckEmpty() {
            if (document.getElementById(MasterObj + "txtKaraneRptName").value == "") {
                alert('لطفا نام گزارش کارانه را وارد کنيد')
                return true
            }
            if (document.getElementById("GrdNewCode").rows.length == 0) {
                alert('لطفا کدهاي مورد نظر را انتخاب کنيد')
                return true
            }
            return false
        }
        //*******************************************************************************
        function OnClickBtnFilter() {
            ClearGrd("GrdNewCode");
            $get(MasterObj + "txtReportID").value = $get(MasterObj + "CmbKaraneRptName").value;
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function LoadGrdNewCode() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);
            var XmlNode1 = oXmlDoc.documentElement.selectNodes("/KaraneEntity/RptInfo");
            $get(MasterObj + "txtKaraneRptName").value = XmlNode1.item(0).selectSingleNode("RptName").text

            var XmlNode = oXmlDoc.documentElement.selectNodes("/KaraneEntity/GetRptField");
            var len = XmlNode.length
            for (var i = 0; i < len; i++) {
                AddRow_GrdNewCode(XmlNode.item(i).selectSingleNode("CodeID").text
                                    , XmlNode.item(i).selectSingleNode("CodeName").text
                                    , XmlNode.item(i).selectSingleNode("Caption").text
                                    , XmlNode.item(i).selectSingleNode("Size").text
                                    , XmlNode.item(i).selectSingleNode("Editable").text
                                    , XmlNode.item(i).selectSingleNode("Viewable").text
                                    , XmlNode.item(i).selectSingleNode("CodeNature").text
                                    , XmlNode.item(i).selectSingleNode("DefaultValue").text)
            }
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            ClearGrd();
            $get(MasterObj + "txtReportID").value = "0";
            $get(MasterObj + "CmbKaraneRptName").value = "0";
            document.getElementById(MasterObj + "txtKaraneRptName").value = "";
        }
        //*******************************************************************************
        function OnKeyDownTimeNew(obj) {
            var rowIndex = obj.parentElement.parentElement.rowIndex;
            var OGrid = obj.parentElement.parentElement.parentElement;
            var CodeNature = OGrid.rows(rowIndex).cells(5).firstChild.selectedIndex;
            if (CodeNature == 0)
                OnKeyDownTime();
            else
                OnKeyDownInt(obj);
        }
        //*******************************************************************************
        function OnBlurTxtDefault(obj) {
            var rowIndex = obj.parentElement.parentElement.rowIndex;
            var OGrid = obj.parentElement.parentElement.parentElement;
            var CodeNature = OGrid.rows(rowIndex).cells(5).firstChild.selectedIndex;
            if (obj.value != "" || obj.value != "0") {
                if (CodeNature == 0)
                    TimechkNew(obj);
                else
                    obj.value = obj.value.split(":")[0];
            }
        }
        //*******************************************************************************
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
        //*******************************************************************************
    </script>
</asp:Content>
