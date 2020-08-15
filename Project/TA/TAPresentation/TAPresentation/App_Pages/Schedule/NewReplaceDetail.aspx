<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewReplaceDetail.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.NewReplaceDetail"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

   

    <table id="Table2" style="width: 666px; height: 510px" cellspacing="0" cellpadding="0"
        border="0">
        <tr>
            <td dir="rtl" style="" valign="top" align="center">
                <table style="width: 73%">
                    <tr>
                        <td style="width: 79px">
                            ازتاریخ
                        </td>
                        <td style="width: 115px">
                            <uc1:KCalendar ID="StartDate" runat="server" />
                        </td>
                        <td style="width: 45px">
                            تا تاریخ
                        </td>
                        <td style="width: 106px">
                            <uc1:KCalendar ID="EndDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 79px">
                            ساختار جاري
                        </td>
                        <td style="width: 115px">
                            <asp:DropDownList ID="selCurrent" runat="server" Style="margin-right: 0px;" Height="16px"
                                Width="150px" DataTextField="Title" DataValueField="Val">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 88px">
                            ساختار جايگزين
                        </td>
                        <td style="width: 85px">
                            <asp:DropDownList ID="selReplace" runat="server" Style="margin-right: 0px; width: 150px"
                                DataTextField="Title" DataValueField="Val">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center">
                <uc2:ToolBar ID="OToolBar" PageName="NewReplaceDetail.aspx" PageID="1316" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table id="Table8" style="width: 628px; height: 296px" cellspacing="0" cellpadding="0"
                    align="center" border="0">
                    <tr>
                        <td dir="rtl" style="height: 306px" valign="top" align="right">
                            <fieldset dir="rtl" style="width: 177px; height: 112px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="middle">
                                <legend style="color: lightblue">روز هفته</legend>
                                <table id="Table15" style="width: 160px; height: 84px" cellspacing="0" cellpadding="0"
                                    width="160" border="0">
                                    <tr>
                                        <td align="left">
                                            <input id="Chk0" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            شنبه
                                        </td>
                                        <td align="left">
                                            <input id="Chk1" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            يکشنبه
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <input id="Chk2" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            دوشنبه
                                        </td>
                                        <td align="left">
                                            <input id="Chk3" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            سه شنبه
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <input id="Chk4"  style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            چهارشنبه
                                        </td>
                                        <td align="left">
                                            <input id="Chk5" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            پنجشنبه
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <input id="Chk6" style="background-color:transparent" type="checkbox">
                                        </td>
                                        <td align="right">
                                            جمعه
                                        </td>
                                        <td align="left">
                                        </td>
                                        <td align="right">
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            <fieldset dir="rtl" style="width: 177px; height: 74px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid"
                                align="middle">
                                <legend style="color: lightblue">برنامه کاري</legend>
                                <table id="Table5" style="width: 175px; height: 30px" cellspacing="1" cellpadding="1"
                                    border="0">
                                    <tr valign="top">
                                        <td>
                                            روز
                                        </td>
                                        <td>
                                            <select id="SelShift" style="width: 44px" name="SelShift">
                                                <option selected></option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>
                                                <option>13</option>
                                                <option>14</option>
                                                <option>15</option>
                                                <option>16</option>
                                                <option>17</option>
                                                <option>18</option>
                                                <option>19</option>
                                                <option>20</option>
                                                <option>21</option>
                                                <option>22</option>
                                                <option>23</option>
                                                <option>24</option>
                                                <option>25</option>
                                                <option>26</option>
                                                <option>27</option>
                                                <option>28</option>
                                                <option>29</option>
                                                <option>30</option>
                                                <option>31</option>
                                            </select>
                                        </td>
                                        <td>
                                            ام از چرخه شيفت
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td style="width: 445px; height: 306px" valign="top" align="right">
                            <fieldset dir="rtl" style="width: 436px; height: 298px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid"
                                align="middle">
                                <legend style="width: 30px; color: lightblue">اعضا</legend>
                                <table id="Table10" style="width: 425px; height: 87.06%" cellspacing="0" cellpadding="0"
                                    width="425" align="center" border="0">
                                    <tr>
                                        <td style="width: 129px; height: 219px" valign="top" align="center">
                                            <table id="Table13" style="width: 114px; height: 139px" cellspacing="1" cellpadding="1"
                                                width="114" border="0">
                                                <tr>
                                                    <td style="width: 22px; height: 32px" align="center">
                                                    </td>
                                                    <td style="height: 32px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkWork" style="background-color:transparent" type="radio" value="ChkWork" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        برنامه&nbsp;کاري
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkShift" style="background-color:transparent"  type="radio" value="ChkShift" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        گروه شيفت
                                                    </td>
                                                </tr>
                                                <tr style="display: none">
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkTabl" style="background-color:transparent" type="radio" value="ChkTabl" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        دفتر تابل
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkPersonelGroup" style="background-color:transparent" type="radio" value="ChkPersonelGroup" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        گروه پرسنلي
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px" align="center">
                                                        <input id="ChkPersonel" type="radio" style="background-color:transparent" checked value="ChkPersonel" name="GroupChk">
                                                    </td>
                                                    <td>
                                                        پرسنل
                                                    </td>
                                                </tr>
                                            </table>
                                            &nbsp;
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="XTabTable_Header" style="width: 255px; height: 11px;" cellpadding="0"
                                                cellspacing="0">
                                                <thead style="display: inline">
                                                    <tr class="ShoperHeaderStyle">
                                                        <td class="CssHeaderStyle" style="width: 3px" align="center">
                                                            <input id="chkAll" style="background-color:transparent" onclick="OnclickSelectAllChk(this)" type="checkbox"
                                                                 name="chkAll">
                                                        </td>
                                                        <td class="CssHeaderStyle" align="center">
                                                            نام
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 255px;
                                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 78.9%">
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
        <input id="txtServerDate" runat="server" type="hidden" />
        <input id="txtOnLineUserID" runat="server" type="hidden" />
        <input id="txtReplaceDetailID" runat="server" type="hidden" />
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
        var PageSize_X = 7
        returnValue = 0
        
        if (document.getElementById(MasterObj + "txtMode").value=="0")//Edit Mode
            PageLoad()
        //////////////////////////////////This Page//////////////////////////////////////

        function OnClickBtnCancel() {
            window.close()
        }
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
                var oSelShift = document.getElementById( "SelShift")
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
                tSelectedMamber= strSelectedMamber
                XTableInitialize(document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function SetWeeklyDay(InputStr) {
            try {
                ClearWeeklyDay()
                var oDay = ""
                oDay = InputStr.split(',')
                for (var n = 0; n < oDay.length; n++) {
                    switch (oDay[n]) {
                        case '0':
                            document.getElementById("Chk0").checked = true
                            break
                        case '1':
                            document.getElementById("Chk1").checked = true
                            break
                        case '2':
                            document.getElementById("Chk2").checked = true
                            break
                        case '3':
                            document.getElementById("Chk3").checked = true
                            break
                        case '4':
                            document.getElementById("Chk4").checked = true
                            break
                        case '5':
                            document.getElementById("Chk5").checked = true
                            break
                        case '6':
                            document.getElementById("Chk6").checked = true
                            break
                    }
                }
            }
            catch (e) {
                alert('اطلاعات نادرست است')
            }
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtMode").value = 1//Insert Mode
            
            document.getElementById(MasterObj + "selCurrent").value = 0
            document.getElementById(MasterObj + "selReplace").value = 0
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
            document.all.item("SelShift").selectedIndex = 0
            ClearGrd(document.getElementById("GrdValidUser"))
            ClearWeeklyDay()
            document.getElementById(MasterObj + "txtReplaceDetailID").value = "0"


        }
        //*******************************************************************************
        function ClearWeeklyDay() {
            //            try {
            var strResut = ""
            var ChkName = ""
            for (var i = 0; i < 7; i++) {
                ChkName = "Chk" + i.toString()
                document.getElementById(ChkName).checked = false

            }
            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            
            //            try {
            /*if(document.getElementById("TxtName").value=="")
            {
            alert('لطفا نام تغيير را مشخص کنيد')
            return
            }*/
            //-----------------------------------
            var XmlStr = "<OfficeEntity><ReplaceDetail>"
            var oSelCurrent = document.getElementById(MasterObj + "selCurrent")
            var oSelReplace = document.getElementById(MasterObj + "selReplace")
            var oSelShift = document.all.item("SelShift")
            var oGrid = document.getElementById("GrdValidUser")
            var DID = 0
            //-----------------------------------
            if (oSelReplace.value == 0 || oSelReplace.value == -1) {
                alert('لطفا ساختار جايگزين را مشخص کنيد')
                return
            }
            //-----------------------------------
            document.getElementById(MasterObj + "txtFlagDo").value = 0
            
            if (document.getElementById(MasterObj + "txtReplaceDetailID").value == "0")
                document.getElementById(MasterObj + "txtMode").value = 1    //Insert
            else
                document.getElementById(MasterObj + "txtMode").value = 0    //Update

            XmlStr += "<ReplaceDetailID>" + document.getElementById(MasterObj + "txtReplaceDetailID").value + "</ReplaceDetailID>"


            //XmlStr+="<ReplaceDetailName>"+document.getElementById("TxtName").value+"</ReplaceDetailName>"

            //-----------------------------------
            var sDate = document.getElementById(MasterObj + "StartDate_txtYear").value + "/" + document.getElementById(MasterObj + "StartDate_txtMonth").value + "/" + document.getElementById(MasterObj + "StartDate_txtDay").value
            if (sDate == "//") {
                sDate = ""
                alert('لطفا تاريخ شروع را وارد کنيد')
                return
            }
            XmlStr += "<StartDate>" + sDate + "</StartDate>"
            //-----------------------------------

            var eDate = document.getElementById(MasterObj + "EndDate_txtYear").value + "/" + document.getElementById(MasterObj + "EndDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EndDate_txtDay").value
            if (eDate == "//") {
                eDate = ""
                alert('لطفا تاريخ پايان را وارد کنيد')
                return
            }
            if (compareTime() == false) {
                return
            }
            XmlStr += "<EndDate>" + eDate + "</EndDate>"


            if (CreateWeeklyDay() != "") {
                XmlStr += "<WeeklyDay>" + CreateWeeklyDay() + "</WeeklyDay>"
            }
            if (oSelShift.selectedIndex != 0) {
                XmlStr += "<ShiftCycleDayNo>" + oSelShift.options(oSelShift.selectedIndex).innerText + "</ShiftCycleDayNo>"
            }
            if (oSelCurrent.selectedIndex != 0) {
                XmlStr += "<CurrentDatailID>" + oSelCurrent.options(oSelCurrent.selectedIndex).value + "</CurrentDatailID>"

            }
            XmlStr += "<NewDetailID>" + oSelReplace.options(oSelReplace.selectedIndex).value + "</NewDetailID>"
            XmlStr += "<OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUserID").value + "</OnLineUserID>"
            	
            XmlStr += "</ReplaceDetail>"


            //==============================Get Member
            //document.getElementById("tSelectedMamber").value
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

            //==============================Get Member
            XmlStr += "</OfficeEntity>"
            document.getElementById(MasterObj + "txtXmlSave").value = XmlStr
            returnValue=1
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click()
            

            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function compareTime() {
            var EDate = document.getElementById(MasterObj + "EndDate_txtYear").value + document.getElementById(MasterObj + "EndDate_txtMonth").value + document.getElementById(MasterObj + "EndDate_txtDay").value
            var SDate = document.getElementById(MasterObj + "StartDate_txtYear").value + document.getElementById(MasterObj + "StartDate_txtMonth").value + document.getElementById(MasterObj + "StartDate_txtDay").value
            if (EDate < SDate) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else {
                return true
            }
        }
        //*******************************************************************************
        function CreateWeeklyDay() {

            var strResut = ","
            var ChkName = ""
            for (var i = 0; i < 7; i++) {
                ChkName = "Chk" + i.toString()
                if (document.getElementById(ChkName).checked == true) {
                    strResut += i.toString() + ','
                }
            }
            //------------------------
            if (strResut == ",")
                strResut = ""
            //------------------------
            return strResut

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
                document.getElementById('OToolBar_txtFromData').value = x+1;
                document.getElementById('OToolBar_txtToData').value = endFor+1;
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
