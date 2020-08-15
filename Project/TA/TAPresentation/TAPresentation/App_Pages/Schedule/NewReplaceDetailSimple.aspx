<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewReplaceDetailSimple.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.NewReplaceDetailSimple"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

   
    <table id="Table18" dir="rtl" style="width: 911px; height: 491px" cellspacing="0"
        cellpadding="0" border="0">
        <tr>
            <td dir="rtl" style="height: 1px" align="center">
                <table id="Table19" style="width: 563px; height: 47px" cellspacing="0" cellpadding="0"
                    width="563" align="right" border="0">
                    <tr>
                        <td style="width: 58px" align="left">
                            ازتاريخ:
                        </td>
                        <td style="width: 142px">
                            <uc2:KCalendar ID="StartDate" runat="server" />
                        </td>
                        <td style="width: 68px">
                            تا تاريخ:
                        </td>
                        <td>
                            <uc2:KCalendar ID="EndDate" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageName="NewReplaceDetailSimple.aspx" PageID="1317" runat="server" />
            </td>
        </tr>
        <tr>
            <td dir="rtl" valign="top" align="center">
                <table id="Table20" style="width: 897px; height: 362px" cellspacing="0" cellpadding="0"
                    align="center" border="0">
                    <tr>
                        <td style="width: 510px" valign="top" align="center">
                            <fieldset style="width: 485px; height: 345px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid">
                                <legend style="color: lightblue">انتخاب ساختار</legend>
                                <table id="Table21" style="width: 435px; height: 246px" cellspacing="0" cellpadding="0"
                                    border="0">
                                    <tr>
                                        <td style="width: 143px" valign="top" align="center">
                                            <div style="border-top: gray 2px solid; scrollbar-highlight-color: white;
                                                overflow: auto; border-left: gray 2px solid; width: 160px; scrollbar-arrow-color: black;
                                                scrollbar-base-color: #b0c4de; height: 280px; background-color: white">
                                                <table id="lstExist" ondblclick="OnClickBtnAdd()" cellpadding="0" cellspacing="0" onclick="onclicklstExist()" width="100%">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                        </td>
                                        <td style="width: 3px">
                                            <table id="Table22" style="width: 11px; height: 87px" cellspacing="1" cellpadding="1"
                                                width="11" border="0">
                                                <tr>
                                                    <td>
                                                        <input id="btnAdd" title="اضافه" style="background-image: url(../../App_Utility/Images/Icons/Left.gif);
                                                            width: 21px; cursor: pointer; background-repeat: no-repeat; height: 21px; background-color: transparent"
                                                            onclick="OnClickBtnAdd()" type="button" name="btnAdd">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnDelete" title="حذف" style="background-image: url('../../App_Utility/Images/Icons/Right.gif');
                                                            width: 19px; cursor: pointer; background-repeat: no-repeat;background-color: transparent; height: 20px" onclick="OnClickBtnDelete()"
                                                            type="button" name="btnDelete">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnDelAll" title="حذف همه" style="background-image: url(../../App_Utility/Images/Icons/Left2.gif);
                                                            width: 21px; cursor: pointer; background-repeat: no-repeat; background-color: transparent;height: 21px" onclick="OnClickBtnDelAll()"
                                                            type="button" name="btnDelAll">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="TDlstSelected" style="width: 167px" valign="top">
                                            <div  dir="rtl" style="border-top: gray 2px solid; scrollbar-highlight-color: white;
                                                overflow: auto; border-left: gray 2px solid; width: 148px; scrollbar-arrow-color: black;
                                                scrollbar-base-color: #b0c4de; height: 280px; background-color: white">
                                                <table id="lstSelected" onclick="onclicklstSelected()" cellspacing="0" cellpadding="0">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                        </td>
                                        <td id="TDselDate" style="width: 72px" valign="top" align="left">
                                            <div  dir="ltr" style="border-top: gray 2px solid; scrollbar-highlight-color: white;
                                                overflow: auto; border-left: gray 2px solid; width: 79px; scrollbar-arrow-color: black;
                                                scrollbar-base-color: #b0c4de; height: 280px; background-color: white">
                                                <table id="selDate" onclick="OnClickSelDate()" dir="ltr" cellspacing="0" cellpadding="0">
                                                    <thead style="display: none; direction: ltr">
                                                    </thead>
                                                </table>
                                            </div>
                                        </td>
                                        <td>
                                            <table id="Table23" style="width: 24px; height: 57px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        <input class="CssbtnUP" id="btnUP" title="حرکت به بالا" style="width: 24px; cursor: pointer;
                                                            height: 23px" onclick="OnclickbtnUP()" type="button" name="btnUP">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input  class="CssbtnDown" id="btnDown" title="حرکت به پايين" style="width: 24px;
                                                            cursor: pointer; height: 23px" onclick="onclickbtnDown()" type="button" 
                                                            name="btnDown" >
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td valign="top" align="center">
                            <fieldset dir="rtl" style="width: 379px; height: 345px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid"
                                align="middle">
                                <legend style="width: 85px; color: lightblue">انتخاب اعضا</legend>
                                <table id="Table24" style="width: 367px; height: 87.06%" cellspacing="0" cellpadding="0"
                                    width="367" align="center" border="0">
                                    <tr>
                                        <td style="width: 129px; height: 219px" valign="top" align="center">
                                            <table id="Table25" style="width: 114px; height: 139px" cellspacing="1" cellpadding="1"
                                                width="114" border="0">
                                                <tr>
                                                    <td style="width: 22px; height: 32px" align="center">
                                                    </td>
                                                    <td style="height: 32px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkWork" style="background-color:transparent" type="radio"  name="GroupChk">
                                                    </td>
                                                    <td>
                                                        برنامه&nbsp;کاري
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkShift" style="background-color:transparent" type="radio" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        گروه شيفت
                                                    </td>
                                                </tr>
                                                <tr style="display: none">
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkTabl" type="radio" style="background-color:transparent" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        دفتر تابل
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkPersonelGroup"  style="background-color:transparent" type="radio" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        گروه پرسنلي
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkPersonel" checked  style="background-color:transparent" type="radio" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        پرسنل
                                                    </td>
                                                </tr>
                                            </table>
                                            &nbsp;
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="Table26" style="width: 255px; height: 11px" cellpadding="0" cellspacing="0">
                                                <thead style="display: inline">
                                                    <tr>
                                                        <td class="CssHeaderStyle" style="width: 3px" align="center">
                                                            <input id="chkAllSimple" style="background-color:transparent" onclick="OnclickSelectAllChk(this)" type="checkbox" 
                                                                name="chkAll">
                                                        </td>
                                                        <td class="CssHeaderStyle" align="center">
                                                            نام
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 255px;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 91%">
                                                <table id="GrdValidUser">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
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
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if (StrVal != "") {
                            ShowResult()
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtResult" runat="server" />
                        </div>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
        <input id="txtDetailCollectionXml" runat="server" type="hidden" />
        <input id="txtOnLineUserID" runat="server" type="hidden" />
        <input id="txtServerDate" runat="server" type="hidden" />
        <input id="txtXmlSave" runat="server" type="hidden" />
        <input id="txtMode" runat="server" type="hidden" />
        <input id="txtFlagDo" runat="server" type="hidden" />
        <input id="txtSubmit" runat="server" type="hidden" />
        <input id="txtXmlData" runat="server" type="hidden" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>

    <script language="javascript" type="text/javascript">

        //        document.getElementById('OToolBar_BtnPrv').disabled = true;
        //        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        //        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        //        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        //        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
        //        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

        //        $get(MasterObj + "txtCurPage").value = $get(MasterObj + "txtPageNumber").value;

        var OUserFlag = ""
        var OSelectedMamber = ""
        var OValidUserXml = ""
        var tSelectedMamber = ""
        var newrowindex = 0

        var PageSize = 10
        var currentPage_X = 0
        var strXPathConditions = ""
        var PageSize_X = 10
        returnValue = 0

        var LastSelectedRow = null
        var LastSelectedRowClass = ""
        //_____________________________
        //----DownRowSimpleNew------------------------------------
        var lastob
        var optionId = 0
        var newrowindex = 0
        var LastSelectedDetail = null
        var LastObDetail = null
        var LastObDate = null
        //////////////////////////////////This Page//////////////////////////////////////

        //================================OnLoad=========================================
        BindDetailCollection()
        if (document.getElementById(MasterObj + "txtMode").value == "0")//Edit Mode
            PageLoad()
        //===============================================================================

        //*******************************************************************************
        function PageLoad() {

            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlData").value)
            var XmlNodes
            XmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/GetReplaceDetailMember")
            if (XmlNodes.length > 0) {
                var tempDate = XmlNodes.item(0).selectSingleNode("StartDate").text
                if (tempDate != '') {
                    document.getElementById(MasterObj + "StartDate_txtYear").value = tempDate.substr(6, 4)
                    document.getElementById(MasterObj + "StartDate_txtMonth").value = tempDate.substr(3, 2)
                    document.getElementById(MasterObj + "StartDate_txtDay").value = tempDate.substr(0, 2)
                }
                tempDate = XmlNodes.item(0).selectSingleNode("EndDate").text
                if (tempDate != '') {
                    document.getElementById(MasterObj + "EndDate_txtYear").value = tempDate.substr(6, 4)
                    document.getElementById(MasterObj + "EndDate_txtMonth").value = tempDate.substr(3, 2)
                    document.getElementById(MasterObj + "EndDate_txtDay").value = tempDate.substr(0, 2)
                }
                var oSelReplace = document.getElementById(MasterObj + "selReplace")

                //+++++++++++++++++++++++++++++++++++++++++++++++++
                var oSelReplace = document.getElementById(MasterObj + "selReplace")
                for (var j = 0; j < oSelReplace.length; j++)
                    if (oSelReplace.options(j).value == parseInt(XmlNodes.item(0).selectSingleNode("NewDetailID").text)) {
                    oSelReplace.selectedIndex = oSelReplace.options(j).index
                }
                //+++++++++++++++++++++++++++++++++++++++++++++++++
                var oSelCurrent = document.getElementById(MasterObj + "selCurrent")
                for (var j = 0; j < oSelCurrent.length; j++)
                    if (oSelCurrent.options(j).value == parseInt(XmlNodes.item(0).selectSingleNode("CurrentDatailID").text)) {
                    oSelCurrent.selectedIndex = oSelCurrent.options(j).index
                }
                //+++++++++++++++++++++++++++++++++++++++++++++++++
                var oSelShift = document.getElementById("SelShift")
                for (var j = 0; j < oSelShift.length; j++) {
                    if (oSelShift.options(j).innerText == parseInt(XmlNodes.item(0).selectSingleNode("ShiftCycleDayNo").text)) {
                        oSelShift.selectedIndex = oSelShift.options(j).index
                        break
                    }
                }
                //+++++++++++++++++++++++++++++++++++++++++++++++++

                SetWeeklyDay(XmlNodes.item(0).selectSingleNode("WeeklyDay").text.toString())
                //-------------------------CreateGrid--------------------------------
                var oName = ''
                ClearGrd(document.getElementById("GrdValidUser"))
                var strSelectedMamber = ""
                for (var i = 0; i < XmlNodes.length; i++) {
                    strSelectedMamber += '<Person>'
                    strSelectedMamber += '<PersonID>' + XmlNodes.item(i).selectSingleNode('MemberID').text + '</PersonID>'
                    strSelectedMamber += '<Family>' + XmlNodes.item(i).selectSingleNode('MemberName').text + '</Family>'
                    strSelectedMamber += '<UserFlag>' + XmlNodes.item(i).selectSingleNode('Type').text + '</UserFlag>'
                    strSelectedMamber += '<Selected>1</Selected>'
                    strSelectedMamber += '</Person>'
                }
                strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
                tSelectedMamber = strSelectedMamber
                XTableInitialize(document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function BindDetailCollection() {
            var oGrid = document.all.item("lstExist")
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtDetailCollectionXml").value)
            
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/DetailCollection")
            var i = 0

            //--------------------------------------
            oGrid.insertRow()
            oGrid.rows(0).insertCell()
            oGrid.rows(0).insertCell()
            oGrid.rows(0).insertCell()

            oGrid.rows(0).cells(0).innerHTML = "<IMG   style='BACKGROUND-IMAGE: url(../../App_Utility/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
            oGrid.rows(0).cells(1).innerText = "پيش فرض"

            oGrid.rows(0).cells(2).innerText = 0
            oGrid.rows(0).cells(2).style.display = "none"
            oGrid.rows(0).align = "Right"
            //-------------------------------------
            for (i = 1; i <= xmlNodes.length; i++) //BGH Last
            {
                oGrid.insertRow()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()

                oGrid.rows(i).cells(0).innerHTML = "<IMG  onClick='onClickShowDetailInfo()' style=' BACKGROUND-IMAGE: url(../../App_Utility/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
                oGrid.rows(i).cells(1).innerText = xmlNodes.item(i - 1).selectSingleNode('Name').text

                oGrid.rows(i).cells(2).innerText = xmlNodes.item(i - 1).selectSingleNode('DetailCollectionID').text
                oGrid.rows(i).cells(2).style.display = "none"

                oGrid.rows(i).align = "Right"
            }
        }
        //*******************************************************************************
        function onClickShowDetailInfo() {
            //            try {
            onclicklstExist()
            //                if (lastob != null) {
            //                    var url = "../BaseInfo/reportDayStructure.aspx?DId=" + lastob.cells(2).innerText
            //                    window.showModalDialog(url, "", "dialogHeight: 390px;dialogWidth: 470px;center: Yes;help: no;status:no")

            //                }
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function onclicklstExist() {
            //            try {
            var ob = window.event.srcElement
            while (ob.tagName != "TR") {
                ob = ob.parentElement
            }

            if (ob.tagName == "TR") {
                if (ob.parentElement.parentElement.id == "lstExist") {
                    if (lastob != null)
                        lastob.bgColor = ""
                    //ob.bgColor="#ccffff"
                    ob.bgColor = "#ffdfe7"

                    lastob = ob
                    if (LastObDetail != null)
                        LastObDetail.bgColor = ""
                    LastSelectedDetail = null
                    LastObDetail = null
                    if (LastObDate != null) {
                        LastObDate.bgColor = ""
                        LastObDat = null
                    }
                }
            }
            //            }
            //            catch (e)
            //		{ }
        }
        //*******************************************************************************
        function OnClickBtnCancel() {
            window.close()
        }
        //*******************************************************************************
        function OnClickBtnNew() {

            tSelectedMamber = ""
            document.getElementById("chkAll").checked = false
            document.getElementById('OToolBar_txtTotalPage').value = 0
            document.getElementById('OToolBar_txtCurPage').value = 0
            //----------------------------------------
            tempDate = document.getElementById(MasterObj + "txtServerDate").value

            document.getElementById(MasterObj + "StartDate_txtYear").value = tempDate.substr(0, 4)
            document.getElementById(MasterObj + "StartDate_txtMonth").value = tempDate.substr(5, 2)
            document.getElementById(MasterObj + "StartDate_txtDay").value = tempDate.substr(8, 2)

            document.getElementById(MasterObj + "EndDate_txtYear").value = tempDate.substr(0, 4)
            document.getElementById(MasterObj + "EndDate_txtMonth").value = tempDate.substr(5, 2)
            document.getElementById(MasterObj + "EndDate_txtDay").value = tempDate.substr(8, 2)
            //---------------------------------------
            ClearGrd(document.getElementById("GrdValidUser"))
            OnClickBtnDelAll()
        }
        //*******************************************************************************
        function ClearSelDate() {
            var j = document.getElementById("selDate").rows.length - 1
            for (; j >= 0; --j) {
                document.getElementById("selDate").deleteRow(j)
            }
        }
        //*******************************************************************************
        function OnClickBtnDelAll() {
            //            try {
            ClearSelDate()
            var ln = document.getElementById("lstSelected").rows.length
            
            for (var i = 0; i < ln; i++) {
                document.getElementById("lstSelected").deleteRow(0)
            }
            LastSelectedDetail = null
            LastObDetail = null
            if (LastObDate != null) {
                LastObDate.bgColor = ""
                LastObDat = null
            }
            optionId = 0
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            
            var oSelDate = document.getElementById("selDate")
            var oSelDetail = document.getElementById("lstSelected")
            var oGrid = document.getElementById("GrdUserSimple")

            if (CompareTime() == false) {
                return
            }
            if (document.getElementById("selDate").rows.length == 0) {
                alert('ابتدا بايد تاريخ را اضافه کنيد')
                return
            }
            if (oSelDate.rows.length != oSelDetail.rows.length) {
                alert('تعداد ساختار هاي انتخابي با طول روزها بايد يکسان باشد')
                return
            }

            document.getElementById(MasterObj + "txtFlagDo").value = 0
            //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            var XmlStr = "<ShiftEntity>"
            var oLen = oSelDate.rows.length
            var vDate = ''
            var DetailID = 0
            var repeated = 0
            for (var i = 0; i < oLen; i++) {
                DetailID = oSelDetail.rows(i).cells(1).innerText
                vDate = oSelDate.rows(i).cells(0).innerText

                if (DetailID != 0)	//اگر گزينه پيش فرض نيست
                {
                    XmlStr += "<ReplaceDetail><Date>" + vDate + "</Date>"
                    XmlStr += "<NewDetailID>" + DetailID + "</NewDetailID></ReplaceDetail>"
                    XmlStr += "<OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUserID").value + "</OnLineUserID>"
                }
            }
            if (DetailID != 0 && repeated && !confirm('در بين بازه تاريخ وارد شده ، بازه اي داراي تغيير ساختار است آيا مايل به جايگزيني هستيد ؟')) {
                return
            }
            //-----------------------------Members----------------------
            var tempUserFlag = ""
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1]");
            if (xmlNodes.length > 0) {
                for (var x = 0; x < xmlNodes.length; x++) {
                    XmlStr += "<Member>"
                    XmlStr += "<MemberID>" + xmlNodes.item(x).selectSingleNode('PersonID').text + "</MemberID>"
                    XmlStr += "<MemberName>" + xmlNodes.item(x).selectSingleNode('Family').text + "</MemberName>"
                    tempUserFlag = xmlNodes.item(x).selectSingleNode('UserFlag').text
                    if (tempUserFlag == "W") {
                        XmlStr += "<Type>S</Type>"
                    }
                    else if (tempUserFlag == "S") {
                        XmlStr += "<Type>G</Type>"
                    }
                    else {
                        XmlStr += "<Type>" + tempUserFlag + "</Type>"
                    }
                    //PesonelGroup:G,Shift:G,WorkSchedule:S,Personel:P
                    XmlStr += "</Member>"
                }
            }
            else {
                alert('لطفا اعضا را انتخاب کنيد')
                return
            }
            //-----------------------------------------------------------
            XmlStr += "</ShiftEntity>"
            document.getElementById(MasterObj + "txtXmlSave").value = XmlStr

         
            returnValue = 1
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //*******************************************************************************
        function CompareTime() {
//            try {
            var ED = document.getElementById(MasterObj + "EndDate_txtYear").value + document.getElementById(MasterObj + "EndDate_txtMonth").value + document.getElementById(MasterObj + "EndDate_txtDay").value
                var SD = document.getElementById(MasterObj + "StartDate_txtYear").value + document.getElementById(MasterObj + "StartDate_txtMonth").value + document.getElementById(MasterObj + "StartDate_txtDay").value
                if (ED < SD) {
                    alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                    return false
                }
                else {
                    return true
                }
//            }
//            catch (e) {
//                alert('اطلاعات نادرست است')
//            }
        }
        //*******************************************************************************
        function OnClickBtnShowGroupPerson() {
            var strOptions = ""
            var url
            if (document.getElementById("ChkWork").checked == true) {
                OUserFlag = "W"
                url = "WorkSchedule.aspx"
                strOptions = "dialogHeight: 500px;dialogWidth:600px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkShift").checked == true) {
                OUserFlag = "S"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=1&Type=Check"
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"

            }
            else if (document.getElementById("ChkTabl").checked == true) {
                OUserFlag = "T"
                url = "GetTableOffice.aspx"
                strOptions = "dialogHeight: 435px;dialogWidth: 430px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkPersonelGroup").checked == true) {
                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=2&Type=Check"
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkPersonel").checked == true) {
                OUserFlag = "P"
                var RequsterAction = window.event.srcElement.id

                if (RequsterAction.indexOf('OToolBar_') != -1) {
                    RequsterAction = RequsterAction.replace('OToolBar_', '')
                }
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?ShowFlag=0" + " &RequsterPageID=1317" + " &RequsterAction=" + RequsterAction;
                strOptions = "dialogHeight: 720px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else {
                alert('لطفا نوع عضويت را انتخاب کنيد')
                return
            }

            //------------------------------------------------------------
            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                url = ""
            }

            if (OSelectedMamber != undefined && OSelectedMamber != '' && OSelectedMamber != "<Root></Root>") {

                if (document.getElementById("GrdValidUser").rows.length > 0) {
                    if (confirm('پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟')) {
                        ClearGrd(document.getElementById("GrdValidUser"))
                        tSelectedMamber = ''
                    }
                }

                //===============
                switch (OUserFlag) {
                    case "P":
                        OSelectedMamber = GetDataPerson()
                        break;
                    case "T":
                        OSelectedMamber = GetTableOffice()
                        break
                    case "W":
                        OSelectedMamber = GetWorkSchedule()
                        break
                    default:
                        OSelectedMamber = GetDataGroup()
                }
                //===============
                if (OSelectedMamber != "") {

                    OValidUserXml = OSelectedMamber
                    XTableInitialize(document.getElementById("GrdValidUser"))
                }

            }
        }
        //*******************************************************************************
        function GetDataPerson() {
            //            try {
            var Username = '';
            var SUsername = '';

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");
            var strSelectedMamber=""
            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;

            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                       xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('PersonID').text
                    + " and UserFlag='" + OUserFlag + "']");
                       //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                       if (xmlNodes2.length == 0) {
                           strSelectedMamber += '<Person>'
                           strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('PersonID').text + '</PersonID>'
                           strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('PersonName').text + '</Family>'
                           strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                           strSelectedMamber += '<Selected>1</Selected>'
                           strSelectedMamber += '</Person>'
                       }
                }
            }

            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function GetDataGroup() {
            //            try {
            var Username = '';
            var SUsername = '';

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");
            var strSelectedMamber=""
            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;

            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                 //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('GroupId').text
                    + " and UserFlag='" + OUserFlag + "']");
                    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('GroupId').text + '</PersonID>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('GroupName').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }
            }

            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function GetWorkSchedule() {

            var Username = '';
            var SUsername = '';
            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/WorkSchedule[selected=1]");

            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;
            
            var strSelectedMamber = ""
            if (xmlNodes.length > 0) {
                for (var x = 0; x < xmlNodes.length; x++) {
                //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('ScheduleID').text
                    + " and UserFlag='" + OUserFlag + "']");
                       //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                       if (xmlNodes2.length == 0) {
                           strSelectedMamber += '<Person>'
                           strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('ScheduleID').text + '</PersonID>'
                           strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('Name').text + '</Family>'
                           strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                           strSelectedMamber += '<Selected>1</Selected>'
                           strSelectedMamber += '</Person>'
                       }
                }
            }
            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)

        }
        //*******************************************************************************
        function ClearGrd(obj) {
            //alert(obj.rows.length)
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //*******************************************************************************
        function XTableInitialize(oGrd) {
            document.getElementById('OToolBar_txtCurPage').value = 0
            document.getElementById("chkAll").checked = true
            FillTabTable('First', oGrd)
        }
        //*******************************************************************************
        function FillTabTable(direction, oGrd) {
            ClearGrd(oGrd)

            if (tSelectedMamber == "") {
                tSelectedMamber = "<UserEntity></UserEntity>"
            }

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            var x;

            var xPath = ''
            xPath = ''
            var root = "/UserEntity/Person"
            if (xPath != '' || strXPathConditions != '') {
                if (xPath != '' && strXPathConditions != '')
                    xPath = strXPathConditions + ' and ' + xPath
                if (xPath == '' && strXPathConditions != '')
                    xPath = strXPathConditions
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[" + xPath + "]");
            }
            else
                xmlNodes = xmlDoc.documentElement.selectNodes(root);

            if (xmlNodes.length == 0) {
                return;
            }
            var totalRecords
            totalRecords = xmlNodes.length


            document.getElementById('OToolBar_txtTotalPage').value = Math.ceil(totalRecords / PageSize_X)

            if (totalRecords > 0) {
                currentPage_X = parseInt(document.getElementById('OToolBar_txtCurPage').value)

                switch (direction) {
                    case "Const":
                        currentPage_X = currentPage_X
                        break
                    case "Next":
                        currentPage_X = parseInt(currentPage_X) + 1
                        break
                    case "Previous":
                        currentPage_X = parseInt(currentPage_X) - 1
                        break
                    case "First":
                        currentPage_X = 1
                        break
                    case "Last":
                        currentPage_X = parseInt(document.getElementById('OToolBar_txtTotalPage').value)
                        break
                }

                document.getElementById('OToolBar_txtCurPage').value = currentPage_X

                var endFor
                if (currentPage_X * PageSize_X - 1 < 0)
                    return
                if (totalRecords <= currentPage_X * PageSize_X - 1)
                    endFor = totalRecords - 1
                else
                    endFor = parseInt(document.getElementById('OToolBar_txtCurPage').value) * PageSize_X - 1

                x = (currentPage_X - 1) * PageSize_X
                //----------------------
                document.getElementById('OToolBar_txtFromData').value = x + 1;
                document.getElementById('OToolBar_txtToData').value = endFor + 1;
                document.getElementById('OToolBar_txtTotalData').value = totalRecords;
                //-----------------------
                var Param
                var Username, SUsername
                var FlagCheck = true
                for (; x <= endFor; ++x) {
                    Username = xmlNodes.item(x).selectSingleNode('Family').text
                    if (Username.length > 25) {
                        SUsername = Username.substr(0, 25) + "..."
                    }
                    else {
                        SUsername = Username
                    }
                    AddRow(oGrd
					, xmlNodes.item(x).selectSingleNode('UserFlag').text
					, xmlNodes.item(x).selectSingleNode('PersonID').text
					, Username
					, SUsername
					, xmlNodes.item(x).selectSingleNode('Selected').text)
                    if (xmlNodes.item(x).selectSingleNode('Selected').text == 0)
                        FlagCheck = false
                }

                document.getElementById("chkAll").checked = FlagCheck

            }
        }
        //*******************************************************************************
        function AddRow(oGrid, UserFlag, UserID, Username, SUsername, Selected) {
            //try
            //{
            //oGrid="GrdValidUser"
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";

            //Set Attribute
            oGrid.rows(newrowindex).setAttribute("UserID", UserID)
            oGrid.rows(newrowindex).setAttribute("UserFlag", UserFlag)
            oGrid.rows(newrowindex).setAttribute("Name", Username)

            //Create Cell
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()

            var tempSrc = "";
            var picTitle = "";
            var NameTitle = "(" + UserID + ")  " + Username
            switch (UserFlag) {
                case "P":
                    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = 'پرسنل'
                    break
                case "G":
                    tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "'گروه پرسنلي'"
                    break
                case "S":
                    tempSrc = "../../App_Utility/Images/Icons/time.gif"
                    picTitle = "'شيفت'"
                    break
                case "T":
                    tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "'دفتر تابل'"
                    break
                case "W":
                    tempSrc = "../../App_Utility/Images/Icons/Group.gif"
                    picTitle = "'برنامه کاري'"
                    break
            }
            oGrid.rows(newrowindex).cells(0).innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)' >"

            if (Selected == 1) {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = true
            }
            else {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = false
            }

            oGrid.rows(newrowindex).cells(1).innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
            oGrid.rows(newrowindex).cells(2).innerHTML = "<DIV style='DISPLAY: inline; HEIGHT: 15px';width:100%; ms_positioning='FlowLayout' title='" + NameTitle + "'>" + SUsername + "</DIV>"

            //Style
            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "25px"
            oGrid.rows(newrowindex).cells(1).style.width = "42px"
            oGrid.rows(newrowindex).cells(2).style.width = "200px"

            newrowindex = newrowindex + 1
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}

        }
        //*******************************************************************************
        function OnClickChk(obj) {
            var UserID = 0
            var UserFlag = ""

            UserID = obj.parentElement.parentElement.UserID
            UserFlag = obj.parentElement.parentElement.UserFlag


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

            if (obj.checked)
                xmlNodes.item(0).selectSingleNode('Selected').text = 1
            else {
                xmlNodes.item(0).selectSingleNode('Selected').text = 0
                document.getElementById("chkAll").checked = false
            }

            tSelectedMamber = xmlDoc.xml
        }
        //*******************************************************************************
        function ShowResult() {
            if (document.getElementById(MasterObj + "txtResult").value == "3" || document.getElementById(MasterObj + "txtResult").value == "5") {
                document.getElementById(MasterObj + "txtResult").value = ""

                if (confirm(document.getElementById(MasterObj + "txtAlert").value)) {
                    document.getElementById(MasterObj + "txtAlert").value = ""
                    document.getElementById(MasterObj + "txtFlagDo").value = 1
                    returnValue = 1
                    document.getElementById(MasterObj + "txtSubmit").value = "Save"
                    document.getElementById(MasterObj + "BtnSubmit").click()

                }
                else
                    document.getElementById(MasterObj + "txtAlert").value = ""
            }

            document.getElementById(MasterObj + "txtFlagDo").value = 0

            if (document.getElementById(MasterObj + "txtAlert").value != '') {
                //  alert(document.getElementById(MasterObj + "txtAlert").value)
                if (document.getElementById(MasterObj + "txtAlert").value == "Save" ||
                document.getElementById(MasterObj + "txtAlert").value == "SaveFail")
                    SetMsg(document.getElementById(MasterObj + "txtAlert").value)
                else
                    alert(document.getElementById(MasterObj + "txtAlert").value)
                document.getElementById(MasterObj + "txtAlert").value = ''
            }
        }
        //*******************************************************************************
        function OnClickBtnAdd() {

            //            try {
            if (lastob != null) {
                if (InsertDate() == false)
                    return 
                document.getElementById("lstSelected").insertRow()
                document.getElementById("lstSelected").rows(optionId).insertCell()
                document.getElementById("lstSelected").rows(optionId).insertCell()

                document.getElementById("lstSelected").rows(optionId).cells(0).innerText = (optionId + 1) + "_" + lastob.cells(1).innerText
                document.getElementById("lstSelected").rows(optionId).cells(1).innerText = lastob.cells(2).innerText
                document.getElementById("lstSelected").rows(optionId).cells(1).style.display = "none"
                
                document.getElementById("lstSelected").rows(optionId).cells(0).align = "Right"
                document.getElementById("lstSelected").rows(optionId).cells(1).align = "Right"
                optionId = optionId + 1
               
            }
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function InsertDate() {
            if (CompareTime() == false) {
                return false
            }
            var date;
            var addSD;
            var oGrid = document.all.item("selDate")
            var Len = oGrid.rows.length
            var SD
            var i=0;
            if (Len != 0) {
                i = Len
                date = document.all.item("selDate").rows(Len - 1).cells(0).innerText
            }
            else {
                i = 0;
                date = document.getElementById(MasterObj + "StartDate_txtYear").value + "/" + document.getElementById(MasterObj + "StartDate_txtMonth").value + "/" + document.getElementById(MasterObj + "StartDate_txtDay").value
            }
            //----------------------- 
            if (Len != 0)
                addSD = AddDate(date)
            else
                addSD = date
            //-----------------------
            SD = addSD.substr(0, 4) + addSD.substr(5, 2) + addSD.substr(8, 2)
            var ED = document.getElementById(MasterObj + "EndDate_txtYear").value + document.getElementById(MasterObj + "EndDate_txtMonth").value + document.getElementById(MasterObj + "EndDate_txtDay").value
            if (ED < SD) {
                alert('ايجاد بعدي در اين محدوده تاريخ ممکن نيست')
                return false
            }
            //-----------------------
            oGrid.insertRow()
            oGrid.rows(i).insertCell()
            oGrid.rows(i).cells(0).innerText = addSD
            oGrid.rows(i).align = "Left"
            return true
        }
        //*******************************************************************************
        function AddDate(D) {
            var d = parseInt(D.substr(D.length - 2, 2), 10)
            var m = parseInt(D.substr(D.length - 5, 2), 10)
            var y = parseInt(D.substr(0, D.length - 6), 10)

            if (m < 7) {

                if (d + 1 > 31) {
                    m++;
                    d = 1;
                }
                else
                    d++;
            }
            else if (m > 7 && m != 12) {
                if (d + 1 > 30) {
                    m++;
                    d = 1;
                }
                else
                    d++;

            }
            else {
                if ((d + 1 == 30 && !F_LeapPersian(y)) || (d + 1 == 31 && F_LeapPersian(y))) {
                    d = 1;
                    m = 1;
                    y++;
                }
                else
                    d++;
            }
            //-----------------------------------------------------------------
            var res = ""
            res = y + "/";

            if (m < 10)
                res += "0" + m + "/";
            else
                res += m + "/";

            if (d < 10)
                res += "0" + d;
            else
                res += d;
            //////
            return res;

        }
        //*******************************************************************************
        //  LEAP_PERSIAN  --  Is a given year a leap year in the Persian calendar ?
        function F_LeapPersian(year) {
            return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
        }
        //*******************************************************************************
        function OnClickBtnDelete() {
            //            try {
            if (lastob != null)
                lastob.bgColor = ""

            var i = LastSelectedDetail
            var a = new String()
            var txt = new String()
            if (LastSelectedDetail != null) {
                if (i >= 0) {
                    var j
                    var ln = document.getElementById("lstSelected").rows.length
                    for (j = i + 1; j < ln; j++) {
                        txt = document.getElementById("lstSelected").rows(j).cells(0).innerText
                        a = txt.split('_')
                        document.getElementById("lstSelected").rows(j).cells(0).innerText = (parseInt(a[0], 10) - 1) + '_' + a[1]
                    }
                    //LastSelectedDetail = i + 1
                    LastSelectedDetail=null
                    document.getElementById("lstSelected").deleteRow(i)
                    document.getElementById("selDate").deleteRow(i)
                    optionId = optionId - 1
                }
            }
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function OnClickSelDate() {
//            try {
                var oRow
                var rIndex
                if (window.event.srcElement.parentElement.tagName == 'TR') {
                    rIndex = window.event.srcElement.parentElement.rowIndex
                    oRow = window.event.srcElement.parentElement
                }
                else if (window.event.srcElement.parentElement.tagName == 'TD') {
                    rIndex = window.event.srcElement.parentElement.parentElement.rowIndex
                    oRow = window.event.srcElement.parentElement.parentElement
                }
                if (LastObDate != null)
                    LastObDate.bgColor = ""
                LastObDate = oRow
                LastObDate.bgColor = "#ffdfe7"
                //-----------------------
                var oLen = document.getElementById("lstSelected").rows.length
                var obj = document.getElementById("lstSelected")
                if (obj.rows(rIndex)) {
                    if (LastObDetail != null) {
                        LastObDetail.bgColor = ""
                        LastSelectedDetail = null
                        LastObDetail = null
                    }
                    obj.rows(rIndex).bgColor = "#ffdfe7"
                    LastSelectedDetail = rIndex
                    LastObDetail = obj.rows(rIndex)
                }
                else if (LastObDetail != null) {
                    LastObDetail.bgColor = ""
                    LastSelectedDetail = null
                    LastObDetail = null
                }
//            }
//            catch (e)
//			{ }
        }
        //*******************************************************************************
        function OnclickbtnUP() {
            //            try {
            if (LastSelectedDetail == null)
                return

            var i = LastSelectedDetail
            if (i > 0) {
                var txt1 = document.getElementById("lstSelected").rows(i - 1).cells(0).innerText
                var val1 = document.getElementById("lstSelected").rows(i - 1).cells(1).innerText
                var txt2 = document.getElementById("lstSelected").rows(i).cells(0).innerText
                var val2 = document.getElementById("lstSelected").rows(i).cells(1).innerText
                var arr1 = txt1.split('_')
                var arr2 = txt2.split('_')

                document.getElementById("lstSelected").rows(i).cells(0).innerText = arr2[0] + '_' + arr1[1]
                document.getElementById("lstSelected").rows(i).cells(1).innerText = val1
                document.getElementById("lstSelected").rows(i - 1).cells(0).innerText = arr1[0] + '_' + arr2[1]
                document.getElementById("lstSelected").rows(i - 1).cells(1).innerText = val2
                LastObDetail.bgColor = ""
                LastObDetail = document.getElementById("lstSelected").rows(i - 1)
                LastObDetail.bgColor = "#ffdfe7"
                LastSelectedDetail = i - 1

                //-----------------
                var LenSelDate = document.getElementById("selDate").rows.length
                var oSelDate = document.getElementById("selDate")
                if (LenSelDate >= 0 && oSelDate.rows(LastSelectedDetail)) {
                    if (LastObDate != null)
                        LastObDate.bgColor = ""
                    oSelDate.rows(LastSelectedDetail).bgColor = "#ffdfe7"
                    LastObDate = oSelDate.rows(LastSelectedDetail)

                }
                else if (LastObDate != null) {
                    LastObDate.bgColor = ""
                    LastObDat = null
                }
            }
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function onclickbtnDown() {
            //            try {
            if (LastSelectedDetail == null)
                return

            var i = LastSelectedDetail
            if (i != document.getElementById("lstSelected").rows.length - 1) {
                var txt1 = document.getElementById("lstSelected").rows(i + 1).cells(0).innerText
                var val1 = document.getElementById("lstSelected").rows(i + 1).cells(1).innerText
                var txt2 = document.getElementById("lstSelected").rows(i).cells(0).innerText
                var val2 = document.getElementById("lstSelected").rows(i).cells(1).innerText
                var arr1 = txt1.split('_')
                var arr2 = txt2.split('_')
                document.getElementById("lstSelected").rows(i).cells(0).innerText = arr2[0] + '_' + arr1[1]
                document.getElementById("lstSelected").rows(i).cells(1).innerText = val1
                document.getElementById("lstSelected").rows(i + 1).cells(0).innerText = arr1[0] + '_' + arr2[1]
                document.getElementById("lstSelected").rows(i + 1).cells(1).innerText = val2
                LastSelectedDetail = i + 1

                LastObDetail.bgColor = ""
                LastObDetail = document.getElementById("lstSelected").rows(i + 1)
                LastObDetail.bgColor = "#ffdfe7"
                //-------------------------------------
                var LenSelDate = document.getElementById("selDate").rows.length
                var oSelDate = document.getElementById("selDate")
                if (LenSelDate >= 0 && oSelDate.rows(LastSelectedDetail)) {
                    if (LastObDate != null)
                        LastObDate.bgColor = ""
                    oSelDate.rows(LastSelectedDetail).bgColor = "#ffdfe7"
                    LastObDate = oSelDate.rows(LastSelectedDetail)

                }
                else if (LastObDate != null) {
                    LastObDate.bgColor = ""
                    LastObDat = null
                }

            }
            //            }
            //            catch (e)
            //			{ }
        }
        //*******************************************************************************
        function onclicklstSelected() {
//            try {
            var oRow
            var oIndex
            if (window.event.srcElement.parentElement.tagName == 'TR') {
                oIndex = window.event.srcElement.parentElement.rowIndex
                oRow = window.event.srcElement.parentElement
            }
            else if (window.event.srcElement.parentElement.tagName == 'TD') {
                oIndex = window.event.srcElement.parentElement.parentElement.rowIndex
                oRow = window.event.srcElement.parentElement.parentElement

            }

            if (lastob != null)
                lastob.bgColor = ""

            if (LastObDetail != null)
                LastObDetail.bgColor = ""

            //-----------------------------
            LastSelectedDetail = oIndex
            LastObDetail = oRow
            LastObDetail.bgColor = "#ffdfe7"

            //----------------------------
            var LenSelDate = document.getElementById("selDate").rows.length
            var oSelDate = document.getElementById("selDate")
            if (LenSelDate >= 0 && oSelDate.rows(LastSelectedDetail)) {
                if (LastObDate != null)
                    LastObDate.bgColor = ""
                oSelDate.rows(LastSelectedDetail).bgColor = "#ffdfe7"
                LastObDate = oSelDate.rows(LastSelectedDetail)

            }
            else if (LastObDate != null) {
                LastObDate.bgColor = ""
                LastObDate = null
            }
//            }
//            catch (e)
//			{ }
        }
        //*******************************************************************************
        function OnclickSelectAllChk(obj) {
            var oGrid = document.getElementById("GrdValidUser")
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            var UserID = 0
            var UserFlag = ""
            var Glen = oGrid.rows.length
            for (var j = 0; j < Glen; j++) {
                oGrid.rows(j).cells(0).firstChild.checked = obj.checked
                UserID = oGrid.rows(j).UserID
                UserFlag = oGrid.rows(j).UserFlag
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

                if (obj.checked)
                    xmlNodes.item(0).selectSingleNode('Selected').text = 1
                else
                    xmlNodes.item(0).selectSingleNode('Selected').text = 0
            }
            tSelectedMamber= xmlDoc.xml
        }
        //*******************************************************************************
        function OnClickChk(obj) {
            var UserID = 0
            var UserFlag = ""

            UserID = obj.parentElement.parentElement.UserID
            UserFlag = obj.parentElement.parentElement.UserFlag


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

            if (obj.checked)
                xmlNodes.item(0).selectSingleNode('Selected').text = 1
            else
                xmlNodes.item(0).selectSingleNode('Selected').text = 0

            tSelectedMamber = xmlDoc.xml
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value)) {
                FillTabTable('Next', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1) {
                FillTabTable('Previous', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                FillTabTable('Const', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnClickBtnLast() {
            FillTabTable('Last', document.getElementById("GrdValidUser"))
        }
        //*******************************************************************************
        function OnClickBtnFirst() {
            FillTabTable('First', document.getElementById("GrdValidUser"))
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
