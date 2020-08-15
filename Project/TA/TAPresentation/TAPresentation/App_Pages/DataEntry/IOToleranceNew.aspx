<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="IOToleranceNew.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.IOToleranceNew"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #cmbTraficType
        {
            width: 45px;
        }
        #txtStartTime
        {
            width: 45px;
        }
        #txtEndTime
        {
            width: 45px;
        }
        #txtReplaceTime
        {
            width: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
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
                            SetMsg($get(MasterObj + "txtAlert").value)
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                        
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            تاریخ شروع
                        </td>
                        <td>
                            <uc2:KCalendar ID="cldSdate" runat="server" />
                        </td>
                        <td>
                            تاریخ خاتمه
                        </td>
                        <td>
                            <uc2:KCalendar ID="cldEDate" runat="server" />
                        </td>
                        <td align="left">
                            فعال
                        </td>
                        <td align="right">
                            <input id="chkActive" type="checkbox" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            زمان شروع
                        </td>
                        <td>
                            <input id="txtStartTime" type="text" runat="server" onkeydown="OnKeyDownTime(this.value)"
                                onblur="Timechk(this)" style="width:60px"/>
                        </td>
                        <td>
                            زمان خاتمه
                        </td>
                        <td>
                            <input id="txtEndTime" type="text" runat="server" onkeydown="OnKeyDownTime(this.value);"
                                onblur="Timechk(this)" style="width:60px"/>
                        </td>
                        <td>
                            زمان جایگزین
                        </td>
                        <td>
                            <input id="txtReplaceTime" type="text" runat="server" onkeydown="OnKeyDownTime(this.value)"
                                onblur="Timechk(this)" style="width:60px"/>
                        </td>
                        <td>
                            نوع
                        </td>
                        <td>
                            <select id="cmbTraficType" runat="server">
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 752px;
                    height: 217px;">
                    <legend style="color: lightblue">اعضا</legend>
                    <table id="Table10" style="width: 98%; height: 89%" cellspacing="0" cellpadding="0"
                        align="center" border="0">
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td style="vertical-align: top">
                                            <fieldset dir="rtl" style="width: 177px; height: 112px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: lightblue">روز هفته</legend>
                                                <table id="Table15" style="width: 160px; height: 84px" cellspacing="0" cellpadding="0"
                                                    width="160" border="0">
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk0" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            شنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk1" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            يکشنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk2" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            دوشنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk3" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            سه شنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk4" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            چهارشنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk5" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            پنجشنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk6" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            جمعه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk7" style="background-color: transparent" type="checkbox">
                                                        </td>
                                                        <td align="right">
                                                            تعطیل
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top" align="center" style="width: 293px">
                                <table id="Table13" style="width: 73%; height: 59px" cellspacing="1" cellpadding="1"
                                    border="0">
                                    <tr>
                                        <td style="width: 22px; height: 32px" align="center">
                                            <input id="ChkDepartment" style="background-color: transparent" checked="true" type="radio"
                                                name="GroupChk" value="">
                                        </td>
                                        <td style="height: 32px">
                                            واحد سازماني&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 22px" align="center">
                                            <input id="ChkPersonelGroup" style="background-color: transparent" type="radio" value="ChkPersonelGroup"
                                                name="GroupChk">
                                        </td>
                                        <td>
                                            گروه
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 22px" align="center">
                                            <input id="ChkPersonel" type="radio" style="background-color: transparent" value="ChkPersonel"
                                                name="GroupChk">
                                        </td>
                                        <td>
                                            پرسنل
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 219px" valign="top" align="center">
                                <table id="XTabTable_Header" style="width: 324px; height: 11px;" cellpadding="0"
                                    cellspacing="0">
                                    <thead style="display: inline">
                                        <tr class="ShoperHeaderStyle">
                                            <td class="CssHeaderStyle" style="width: 3px" align="center">
                                                <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" name="chkAll">
                                            </td>
                                            <td class="CssHeaderStyle" align="center">
                                                نام
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 327px;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 100%; margin-right: 0px;">
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
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
                    <input type="text" id="txtSubmit" runat="server" />
                    <input type="text" id="txtIOToleranceID" runat="server" />
                    <input type="text" id="txtXML" runat="server" />
                    <input type="text" id="txtXmlMember" runat="server" />
                    <a href="../../App_Utility/Images/Icons/BlueTick.gif" id="urlActive"></a><a href="../../App_Utility/Images/Icons/Cross.gif"
                        id="urlNoActive"></a>
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
       
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var OUserFlag = ""
        var OSelectedMamber = ""
        var tSelectedMamber = ""
        var newrowindex = 0

        var currentPage_X = 0
        var strXPathConditions = ""
        var PageSize_X = 6
        
        var oMyObject = window.dialogArguments;
        if (oMyObject != '') {
            
            $get(MasterObj + "cldSdate_txtDay").value = oMyObject.document.getElementById("txtSdate").value.substr(0, 2);
            $get(MasterObj + "cldSdate_txtMonth").value = oMyObject.document.getElementById("txtSdate").value.substr(3, 2);
            $get(MasterObj + "cldSdate_txtYear").value = oMyObject.document.getElementById("txtSdate").value.substr(6, 4);
            $get(MasterObj + "cldEDate_txtDay").value = oMyObject.document.getElementById("txtEDate").value.substr(0, 2);
            $get(MasterObj + "cldEDate_txtMonth").value = oMyObject.document.getElementById("txtEDate").value.substr(3, 2);
            $get(MasterObj + "cldEDate_txtYear").value = oMyObject.document.getElementById("txtEDate").value.substr(6, 4);
           
            $get(MasterObj + "chkActive").checked = oMyObject.document.getElementById("chkActive").checked;
            $get(MasterObj + "txtStartTime").value = oMyObject.document.getElementById("txtStartTime").value;
            $get(MasterObj + "txtEndTime").value = oMyObject.document.getElementById("txtEndTime").value;
            $get(MasterObj + "txtReplaceTime").value = oMyObject.document.getElementById("txtReplaceTime").value;
            document.getElementById(MasterObj + "cmbTraficType").value = oMyObject.document.getElementById("txtTraficType").value
            var str = oMyObject.document.getElementById("txtDow").value
            if (str != '') {
                str = str.substr(1, str.length - 2);


                var array;
                array = str.split(',');

                for (var i = 0; i < array.length; i++) {


                    $get("Chk" + array[i]).checked = true;
                }
            }
            

            //-------------------------CreateGrid--------------------------------
            
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlMember").value)
            
            var XmlNodes
            XmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/IOToleranceMember")
            
            if (XmlNodes.length > 0) {
                var oName = '', len = XmlNodes.length, strSelectedMamber = ""
                ClearGrd(document.getElementById("GrdValidUser"))
                
                for (var i = 0; i < len; i++) {
                    
                    strSelectedMamber += '<Person>'
                    strSelectedMamber += '<PersonID>' + XmlNodes.item(i).selectSingleNode('PersonID').text + '</PersonID>'
                    strSelectedMamber += '<PersonCode>' + XmlNodes.item(i).selectSingleNode('PersonCode').text + '</PersonCode>'
                    strSelectedMamber += '<Family>' + XmlNodes.item(i).selectSingleNode('Family').text + '</Family>'
                    strSelectedMamber += '<UserFlag>' + XmlNodes.item(i).selectSingleNode('UserFlag').text + '</UserFlag>'
                    strSelectedMamber += '<Selected>1</Selected>'
                    strSelectedMamber += '</Person>'
                }
               
                strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
                tSelectedMamber = strSelectedMamber
                
                XTableInitialize(document.getElementById("GrdValidUser"))
            }
//            SetWeeklyDay(document.getElementById(MasterObj + "txtWeekDayStr").value)
            
        }

        //------------------------------------
        function OnClickBtnNew() {
            oMyObject = '';
            $get(MasterObj + "txtReplaceTime").value = "";
            $get(MasterObj + "txtStartTime").value = "";
            $get(MasterObj + "txtEndTime").value = "";
            for (var i = 0; i < 8; i++) {
                $get("Chk" + i).checked = false;
            }
            $get(MasterObj + "chkActive").checked = false
            document.getElementById(MasterObj + "cmbTraficType").value = 0;
            $get(MasterObj + "cldEDate_txtDay").value = "";
            $get(MasterObj + "cldEDate_txtMonth").value = "";
            $get(MasterObj + "cldEDate_txtYear").value = "";
            $get(MasterObj + "cldSdate_txtDay").value = "";
            $get(MasterObj + "cldSdate_txtMonth").value = "";
            $get(MasterObj + "cldSdate_txtYear").value = "";
            ClearGrd(document.getElementById("GrdValidUser"))
//*************************************************
            document.getElementById("ChkDepartment").checked = true
            document.getElementById("chkAll").checked = false

            document.getElementById('OToolBar_txtCurPage').value = ""
            document.getElementById("OToolBar_txtTotalPage").value = ""
            document.getElementById('OToolBar_txtFromData').value = ""
            document.getElementById('OToolBar_txtToData').value = ""
            document.getElementById('OToolBar_txtTotalData').value = ""
            OUserFlag = ""
            OSelectedMamber = ""
            tSelectedMamber = ""
            newrowindex = 0
            currentPage_X = 0
            strXPathConditions = ""
        }
//        //------------------------------------------
        function OnClickBtnSave() {
            if ($get(MasterObj + "txtStartTime").value == '' || $get(MasterObj + "txtEndTime").value == '' || $get(MasterObj + "cldSdate_txtYear").value == '' || $get(MasterObj + "cldSdate_txtMonth").value == '' || $get(MasterObj + "cldSdate_txtDay").value == '' || $get(MasterObj + "cldEdate_txtYear").value == '' || $get(MasterObj + "cldEdate_txtMonth").value == '' || $get(MasterObj + "cldEdate_txtDay").value == '' || $get(MasterObj + "txtReplaceTime").value == '') {
                alert('لطفا کلیه فیلدها را پر کنید')
                return;
            }
            if ($get(MasterObj + "cmbTraficType").value == 0) {
                alert('لطفا نوع را مشخص کنید')
                return
            }
            var cnt = 0;
            for (var i = 0; i < 8; i++) {
                if ($get("Chk" + i).checked == true) {
                    cnt = cnt + 1;
                }
            }
            
            if (cnt == 0) {
                alert('حداقل یکی از روزهای هفته انتخاب کنید')
                return;
            }
            var sdate = $get(MasterObj + "cldSdate_txtYear").value + $get(MasterObj + "cldSdate_txtMonth").value + $get(MasterObj + "cldSdate_txtDay").value;
            var edate = $get(MasterObj + "cldEdate_txtYear").value + $get(MasterObj + "cldEdate_txtMonth").value + $get(MasterObj + "cldEdate_txtDay").value;
            if (sdate > edate) {
                alert("تاریخ خاتمه باید بزرگتر از تاریخ شروع باشد")
                return;
            }
            if (sdate == edate && $get(MasterObj + "txtStartTime").value >= $get(MasterObj + "txtEndTime").value) {
                alert("زمان خاتمه باید بزرگتر از زمان شروع باشد")
                return;
            }
            var str = "<root>";
            str = str + "<tb>";
            if (oMyObject == '') {
                str = str + "<IOToleranceID>";
                str = str + "</IOToleranceID>";
            }
            else {
                str = str + "<IOToleranceID>";
                str = str + oMyObject.document.getElementById(MasterObj + "txtIOToleranceID").value
                str = str + "</IOToleranceID>";
            }
            str = str + "<STime>";
            str = str + $get(MasterObj + "txtStartTime").value;
            str = str + "</STime>";
            str = str + "<ETime>";
            str = str + $get(MasterObj + "txtEndTime").value;
            str = str + "</ETime>";
            str = str + "<SDate>";
            str = str + $get(MasterObj + "cldSdate_txtYear").value + '/' + $get(MasterObj + "cldSdate_txtMonth").value + '/' + $get(MasterObj + "cldSdate_txtDay").value;
            str = str + "</SDate>";
            str = str + "<EDate>";
            str = str + $get(MasterObj + "cldEdate_txtYear").value + '/' + $get(MasterObj + "cldEdate_txtMonth").value + '/' + $get(MasterObj + "cldEdate_txtDay").value;
            str = str + "</EDate>";
            str = str + "<Active>";
            str = str + $get(MasterObj + "chkActive").checked;
            str = str + "</Active>";
            str = str + "<Replace>";
            str = str + $get(MasterObj + "txtReplaceTime").value;
            str = str + "</Replace>";
            str = str + "<Dow>";
            var str2 = ',';
            for (var i = 0; i < 8; i++) {
                if ($get("Chk" + i).checked == true)
                    str2 = str2 + i + ',';
            }
            if (str2 == ',')
                str2 = '';
            str = str + str2;
            str = str + "</Dow>";
            str = str + "<Kind>";
            str = str + $get(MasterObj + "cmbTraficType").value;
            str = str + "</Kind>";
            //=================================================GetMember
            var oGrid = document.getElementById("GrdValidUser")
            if (tSelectedMamber == "" | tSelectedMamber == "<\UserEntity>") {
                alert("ابتدا اعضا را انتخاب نماييد")
                return
            }
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(tSelectedMamber)
            var XmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person")

            if (tSelectedMamber == "" || XmlNodes.length == 0) {
                alert('لطفا اعضا مورد نظر را انتخاب کنيد')
                return
            }
            var StrXmlPerson = ""
            StrXmlPerson = ReplaceAll(tSelectedMamber, "<UserEntity>", "")
            StrXmlPerson = ReplaceAll(StrXmlPerson, "</UserEntity>", "")

            //=================================================GetMember
            str = str + StrXmlPerson;
            str = str + "</tb>";
            str = str + "</root>";
            document.getElementById(MasterObj + "txtXML").value = str;
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement);
            document.getElementById(MasterObj + "txtSubmit").value = "save";
            document.getElementById(MasterObj + "btnSubmit").click();
            window.close();

        }
//        //------------------------------------------
        function OnClickBtnCancel() {
            window.close();
        }

        //------------------------------------
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value)) {
                FillTabTable('Next', document.getElementById("GrdValidUser"))
            }
        }
//        //*******************************************************************************
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1) {
                FillTabTable('Previous', document.getElementById("GrdValidUser"))
            }
        }
//        //*******************************************************************************
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
//        //*******************************************************************************
        function OnClickBtnLast() {
            FillTabTable('Last', document.getElementById("GrdValidUser"))
        }
//        //*******************************************************************************
        function OnClickBtnFirst() {
            FillTabTable('First', document.getElementById("GrdValidUser"))
        }
//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        //*******************************************************************************
        function OnClickBtnShowGroupPerson() {
            var strOptions = ""
            var url

            if (document.getElementById("ChkPersonelGroup").checked == true) {
                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=2&Type=Check &WDFlag=0 &ParentPage=CreditAdminNew.aspx"
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkDepartment").checked == true) {

                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
                strOptions = "dialogHeight: 650px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkPersonel").checked == true) {
                OUserFlag = "P"
                var RequsterAction = window.event.srcElement.id

                if (RequsterAction.indexOf('OToolBar_') != -1) {
                    RequsterAction = RequsterAction.replace('OToolBar_', '')
                }
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?ShowFlag=0" + " &RequsterPageID=1316" + " &RequsterAction=" + RequsterAction;
                strOptions = "dialogHeight: 720px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else {
                alert('لطفا نوع عضويت را انتخاب کنيد')
                return
            }

            //------------------------------------------------------------
            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                if (document.getElementById("ChkDepartment").checked) {
                    OUserFlag = OSelectedMamber.split("#")[0];
                    OSelectedMamber = OSelectedMamber.split("#")[1];
                }
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
                    case "DA":
                        OSelectedMamber = GetDepartment()
                        break
                    case "DS":
                        OSelectedMamber = GetDepartment()
                        break
                    default:
                        OSelectedMamber = GetDataGroup()
                }
                //===============
                if (OSelectedMamber != "") {
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
            var strSelectedMamber
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
                        strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('PersonCode').text + '</PersonCode>'
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
            var strSelectedMamber = ""

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");

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
                        strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('GroupId').text + '</PersonCode>'
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
        function GetDepartment() {

            var Username = '';
            var SUsername = '';
            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");

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
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('DepartmentID').text
                    + " and UserFlag='" + OUserFlag + "']");
                    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonID>'
                        strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonCode>'
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
//        //*******************************************************************************
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
//        //*******************************************************************************
        function XTableInitialize(oGrd) {
            document.getElementById('OToolBar_txtCurPage').value = 0
            document.getElementById("chkAll").checked = true
            FillTabTable('First', oGrd)
        }
//        //*******************************************************************************
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
//-------------------------------

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
                    if (Username.length > 30) {
                        SUsername = Username.substr(0, 30) + "..."
                    }
                    else {
                        SUsername = Username
                    }
                    AddRow(oGrd
					, xmlNodes.item(x).selectSingleNode('UserFlag').text
					, xmlNodes.item(x).selectSingleNode('PersonID').text
					, Username
					, SUsername
					, xmlNodes.item(x).selectSingleNode('PersonCode').text
					, xmlNodes.item(x).selectSingleNode('Selected').text)
                    if (xmlNodes.item(x).selectSingleNode('Selected').text == 0)
                        FlagCheck = false
                }

                document.getElementById("chkAll").checked = FlagCheck

            }
        }
//        //*******************************************************************************
        function AddRow(oGrid, UserFlag, UserID, Username, SUsername, UserCode, Selected) {
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
            var NameTitle = "(" + UserCode + ")  " + Username
            switch (UserFlag) {
                case "P":
                    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = 'پرسنل'
                    break
                case "G":
                    tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "'گروه'"
                    break
                case "S":
                    tempSrc = "../../App_Utility/Images/Icons/time.gif"
                    picTitle = "'شيفت'"
                    break
                case "DS":
                    tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "'واحدسازماني بدون زيرمجموعه'"
                    break
                case "DA":
                    tempSrc = "../../App_Utility/Images/Icons/Group.gif"
                    picTitle = "'واحدسازماني با زيرمجموعه'"
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
            oGrid.rows(newrowindex).cells(2).style.width = "300px"

            newrowindex = newrowindex + 1
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}

        }
//        //*******************************************************************************
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
//        //*******************************************************************************
        function OnclickSelectAllChk(obj) {

            var oGrid = document.getElementById("GrdValidUser")
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            if (tSelectedMamber == "")
                return

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
            tSelectedMamber = xmlDoc.xml
        }
        //*********************
    </script>

</asp:Content>
