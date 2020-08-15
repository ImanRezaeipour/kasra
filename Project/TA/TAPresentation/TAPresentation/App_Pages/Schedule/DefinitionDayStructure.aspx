<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefinitionDayStructure.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefinitionDayStructure"
    Title="------------------------------------------------------------------------تعريف ساختار----------------------------------------------------------------" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 796px" >
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server"  PageID="1301" Paging="1" PageName="DefinitionDayStructure.aspx" />
            </td>
        </tr>
       <%-- <tr>
            <td align="center">
                <asp:Button runat="server" ID="BtnCombinStruct" OnClientClick="return CombineStructure()" Text="ترکیب ساختار"/>
            </td>
        </tr>--%>
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

//                        if ($get(MasterObj + "txtAlert").value != "")
                        //                            SetMsg($get(MasterObj + "txtAlert").value);
                        
                        
                        newrowindex = 0
                        Drowindex = 0
                        LastSelectedRow = null
                        lastValue = ""
                        doNothingFlag = 0
                        ID = 0
                        NameValue = ""
                        DescValue = ""
                        oGrid = document.getElementById("grdSub")

                        bindGrid(oGrid)

                        if (document.getElementById(MasterObj + "txtAlert").value != "") {
                            if (document.getElementById(MasterObj + "txtValidate").value == 0)
                                alert($get(MasterObj + "txtAlert").value);
                            else
                                SetMsg($get(MasterObj + "txtAlert").value);
                            document.getElementById(MasterObj + "txtAlert").value = ""
                            returnValue = 1
                        }
                        document.getElementById(MasterObj + "txtValidate").value = ""
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlert").value = ""
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; "
                align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table id="XTabTable_Header" style="width: 709px; height: 26px;">
                            <thead style="display: inline">
                                <tr>
                                    <td class="style1" align="center">
                                        کد ساختار
                                    </td>
                                    <td class="style2" align="center">
                                        نام ساختار
                                    </td>
                                    <td class="style3" align="center">
                                        نام مخفف
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 215px">
                                        شرح ساختار
                                    </td>
                                </tr>
                            </thead>
                        </table>
                       <div style="overflow: auto; width: 726px; height: 437px; direction: rtl;">
                            <table id="grdSub" style="width: 709px;" ondblclick="ondbClickGrdSub()" onclick="onClickGrdSub()">
                                <thead style="display: none; width: 709px;">
                                </thead>
                            </table>
                        </div>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                             <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
                            <asp:HiddenField ID="txtXMLGrid" runat="server" />
                            <asp:HiddenField ID="txtDetailCollectionID" runat="server" />
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
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtStructureID" name="txtSubmit" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:HiddenField ID="txtTodayDate" runat="server" />
        <asp:HiddenField ID="txtDetailType" runat="server" />
        <select id="SelDetailType" runat="server">
            <option></option>
        </select>
        <input type="text" id="txtModal" runat="server" />
        <input type="text" id="txtMode" runat="server" />
    </div>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">
        document.body.scroll = "no";
        var str = "";

        window.name = "DefinitionDayStructure"
        aspnetForm.target = window.name

        var newrowindex = 0
        var Drowindex = 0
        var LastSelectedRow = null
        var lastValue = ""
        var doNothingFlag = 0
        var ID = 0
        var NameValue = ""
        var DescValue = ""
        var Mode = 0
        var DetailCollectonID = 0
        var eventResult = true;
        var Pnewrowindex = 0
        var LastSelectedTimeRow = null
        //================================OnLoad============================================
        //دکمه انصراف
//        if ($get(MasterObj + "txtModal").value == "1")
//            document.getElementById('OToolBar_BtnCancel').style.display = "inline"
//        else
        //            document.getElementById('OToolBar_BtnCancel').style.display = "none"
     
        var oGrid = document.getElementById("grdSub")

        bindGrid(oGrid)

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            url = "DefinitionDayStructureNew.aspx?StructureID=0" + " &SessionID=" + $get(MasterObj + "txtSessionID").value + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value;

            var rr = window.showModalDialog(url, window, "dialogHeight:550px;dialogWidth: 550px;center: Yes;help: no;status: no")
            if (rr == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) {
                url = "DefinitionDayStructureNew.aspx?StructureID=" + LastSelectedRow.StructureID
                + "&Name=" + LastSelectedRow.cells(2).innerText
                + "&Acronym=" + LastSelectedRow.cells(3).innerText
                + "&Desc=" + LastSelectedRow.cells(4).innerText
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value;
                url = encodeURI(url)
            
                var rr = window.showModalDialog(url, window, "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no")
                if (rr == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
            }
        }
        //======================================================
        function onClickGrdSub() {

            var oGrdSub = document.getElementById("grdSub")
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex

            if (oRow.parentElement.parentElement.id == "grdSub") {
                if (parseInt(index, 10) % 3 == 0) {
                    for (i = 0; i < oGrdSub.rows.length; i++) {
                        if (oGrdSub.rows(i).className == "CssSelectedItemStyle") {
                            oGrdSub.rows(i).className = "CssItemHeader4"
                        }
                    }
                    oRow.className = "CssSelectedItemStyle"
                    LastSelectedRow = oRow
                }
//                else if (parseInt(index, 10) - oGrdSub.rows.length < 3) {
//                    for (i = 0; i < oGrdSub.rows.length; i++) {
//                        if (oGrdSub.rows(i).className == "CssSelectedItemStyle") {
                //                            oGrdSub.rows(i).className = "CssItemHeader4"
//                        }
//                    }
//                    oRow.className = "CssSelectedItemStyle"
//                    LastSelectedRow = oRow
//                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ondbClickGrdSub() {
            try {
                var oGrdSub = document.getElementById("grdSub")
                var index = -1
                var oRow = event.srcElement

                //_______Find Row
                for (var i = 0; oRow.tagName != "TR"; i++)
                    oRow = oRow.parentElement
                index = oRow.rowIndex
                if (oRow.parentElement.parentElement.id == "grdSub") {
                 if (parseInt(index, 10) % 3 == 0) 
                    OnClickBtnEdit()
                }
            }
            catch (e) {
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            if (LastSelectedRow != null) {
                var Msg = "آيا براي حذف مطمئنيد؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtStructureID").value = LastSelectedRow.StructureID
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور حذف يک سطر را انتخاب کنيد")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function OnClickBtnSave() {
//            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
//            var strXML = "<Root>"
//            var oGrdSub = document.getElementById("grdSub")
//            var oSubTable
//            var TimesStructure = ""
//            var k = 0
//            var j
//            var Nochangflag = 0
//            var selectedFlag = 0
//            var dontSaveFlag = 1
//            var DID = 0
//            for (var i = 2; i < oGrdSub.rows.length; i = i + 3) {
//                strXML += "<Tb>"
//                //strXML += "<DetailCollectionID>" + oGrdSub.rows(i - 2).DetailCollectionID + "</DetailCollectionID>"
//                DID = oGrdSub.rows(i - 2).DetailCollectionID
//                oSubTable = oGrdSub.rows(i).cells(0).firstChild
//                j = 0
//                //selectedFlag = oGrdSub.rows(i - 2).Selected 
//                while (j < oSubTable.rows.length) {

//                    if (oSubTable.rows(j).TimesStructure == "") {
//                        alert('لطفا اطلاعات را کامل کنيد')
//                        j++;
//                        Nochangflag = 1
//                        return
//                    }
//                    else {
//                        if (oSubTable.rows(j).Selected == "1") {
//                            selectedFlag = 1
//                            dontSaveFlag = 0
//                        }
//                        strXML += "<Pro>"
//                        strXML += "<DetailCollectionID>" + DID + "</DetailCollectionID>"
//                        strXML += "<OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</OnLineUserID>"
//                        strXML += "<StartDate>" + oSubTable.rows(j).cells(0).firstChild.value + "</StartDate>"
//                        strXML += "<EndDate>" + oSubTable.rows(j).cells(1).firstChild.value + "</EndDate>"
//                        strXML += "<ProgramName>" + oSubTable.rows(j).cells(2).firstChild.value + "</ProgramName>"
//                        strXML += "<TimesStructure>" + oSubTable.rows(j).TimesStructure + "</TimesStructure>"
//                        // strXML += "<Selected>" + selectedFlag + "</Selected>"
//                        strXML += "</Pro>"
//                        j++;
//                    }
//                    //---------------------------
//                }

//                strXML += "</Tb>"
//                selectedFlag = 0

//            }
//            strXML += "</Root>"
//            // if (selectedFlag == 1)
//            //alert(strXML)

//            document.getElementById(MasterObj + "txtXMLSave").value = strXML;
//            document.getElementById(MasterObj + "txtSubmit").value = "Save";
//            document.getElementById(MasterObj + "BtnSubmit").click();
//        }
        //<><><><><><><><><><><><><><><><><><><>__Grid__<><><><><><><><><><><><><><><><><><><><><><><><><>
        function OnClickBtnCancel() {
            window.close();
        }
        //<><><><><><><><><><><><><><><><><><><>__Grid__<><><><><><><><><><><><><><><><><><><><><><><><><>
        function insertChildTable(oGrid, oIndex, SDate, EDate, Desc, NormalStart, NormalEnd, TimesStructure, Selected, DetailCollectionID) {
            var oIndex = Drowindex
            oGrid.insertRow()

            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
//            oGrid.rows(oIndex).insertCell()
//            oGrid.rows(oIndex).insertCell()

            oGrid.rows(oIndex).className = "CssItemHeader2"
            oGrid.rows(oIndex).setAttribute("Selected", Selected)
            oGrid.rows(oIndex).setAttribute("TimesStructure", TimesStructure)
            oGrid.rows(oIndex).setAttribute("DetailCollectionID", DetailCollectionID)

            oGrid.rows(oIndex).cells(0).innerHTML = "<IMG src='/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif' onclick='OnClickSubNode1(this)'>"
            oGrid.rows(oIndex).cells(1).innerText = SDate //"<INPUT type='text' dir='ltr' class='txtControls' style='WIDTH:70px' disabled value='" + SDate + "'  onkeydown='OnKeyDownDate(this.value)' onblur='FormatDate(),datechk(),onBlurTxtSD(this)' onfocus='onfocusTxtDate(this)' />"
            oGrid.rows(oIndex).cells(2).innerText = EDate//"<INPUT type='text' dir='ltr' class='txtControls' style='WIDTH:70px' value='" + EDate + "'  onkeydown='OnKeyDownDate(this.value)' onblur='FormatDate(),datechk(),onBlurTxtED(this)' onfocus='onfocusTxtDate(this)'/>"
            oGrid.rows(oIndex).cells(3).innerText = Desc//"<INPUT type='text' dir='rtl' class='txtControls' style='WIDTH:150px' value='" + title + "'  />"
            //oGrid.rows(oIndex).cells(2).innerHTML = "<asp:Label  runat='server'>" + title + "</asp:Label>"
            //oGrid.rows(oIndex).cells(4).innerText = NormalStart     //"<INPUT type='button' title='ايجاد' disabled style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TAPresentation/App_Utility/Images/Icons/NewIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnNewRow()'>"
           // oGrid.rows(oIndex).cells(5).innerText = NormalEnd   //"<INPUT type='button' title='ريز' style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TAPresentation/App_Utility/Images/Icons/Pro.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnProperties()' >"
            oGrid.rows(oIndex).cells(4).innerHTML = "<IMG src='/TAPresentation/App_Utility/Images/Icons/E1.png' title=',ويرايش زيرساختار' style='cursor:pointer' onclick='OnClickEditDetailCollection(this)'>"


            //            if (compareDates(EDate, '1399/12/29')) {
            //                oGrid.rows(oIndex).cells(4).firstChild.disabled = false;
            //                oGrid.rows(oIndex).cells(4).firstChild.style.cursor = "pointer";

            //            }
            oGrid.rows(oIndex).align = "center"

            oGrid.rows(oIndex).cells(0).style.width = "20px"
            oGrid.rows(oIndex).cells(4).style.width = "20px"
            oGrid.rows(oIndex).cells(1).style.width = "100px"
            oGrid.rows(oIndex).cells(2).style.width = "100px"
            oGrid.rows(oIndex).cells(3).style.width = "250px"
//            oGrid.rows(oIndex).cells(4).style.width = "150px"
//            oGrid.rows(oIndex).cells(5).style.width = "150px"
            oIndex = oIndex + 1
            //---------------------------------

            oGrid.insertRow()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).cells(0).colSpan = "6"
            oGrid.rows(oIndex).align = "center"
            oGrid.rows(oIndex).style.display = "none"

            //Create Attribute
            // oGrid.rows(oIndex).setAttribute("CssFlag", "2")

            var strHTML = "<TABLE  width='95%' class='CssItemHeader' dir='rtl' cellspacing='0' cellPadding='0' border='0'><TR>"

            strHTML += "<TD align='center' style='WIDTH:100px'>" + "ساعت شروع" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:100px'>" + "ساعت خاتمه" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:250px'>" + "نوع ساختار" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:150px'>" + "متعلق به" + "</TD>"
            strHTML += "</TR></TABLE>"
            oGrid.rows(oIndex).cells(0).innerHTML = strHTML
            oGrid.rows(oIndex).cells(0).align = "center"

            //-------------------------------
            oIndex = oIndex + 1
            createRows1(oGrid, TimesStructure, oIndex)

            oIndex = oIndex + 1
            Drowindex = oIndex
        }
        //___________________________________________________________________________________________
        function createRows1(oGrid, TimesStructure, oIndex) {

            oGrid.insertRow()
            oGrid.rows(oIndex).insertCell()

            oGrid.rows(oIndex).align = "center"
            oGrid.rows(oIndex).cells(0).colSpan = "6"
            oGrid.rows(oIndex).style.display = "none"
            var TableID = MasterObj + "TABLE1" + oIndex
            while (document.getElementById(TableID))
                TableID=TableID+"1"
            oGrid.rows(oIndex).cells(0).innerHTML = "<TABLE id='" + TableID + "' width='95%' dir='rtl' id='Test' cellPadding='0' border='0'></TABLE>"

            oIndex = oIndex + 1
            
            createRowsTime(document.getElementById(TableID), TimesStructure, oIndex)
            
        }
        //___________________________________________________________________________________________
        function OnClickSubNode1(SelectedImage) {
            // alert('Yes')
            var j;
            var i;
            var oRow = SelectedImage.parentElement.parentElement
            var oGrid1 = oRow.parentElement

            for (j = oRow.rowIndex; j < oGrid1.rows.length; ++j) {
                if (oGrid1.rows(j).cells(0).firstChild == SelectedImage) {


                    if (oGrid1.rows(j + 1).style.display == "none") {
                        SelectedImage.src = "/TAPresentation/App_Utility/Images/Icons/btnNodes.gif"
                        oGrid1.rows(j + 1).style.display = "inline"
                        oGrid1.rows(j + 2).style.display = "inline"
                    }
                    else {
                        SelectedImage.src = "/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif"
                        oGrid1.rows(j + 1).style.display = "none"
                        oGrid1.rows(j + 2).style.display = "none"
                    }
                }
            }
        }
        //___________________________________________________________________________________________
        function OnClickSubNode(SelectedImage) {
            // alert('Yes')
            var j;
            var i;
            var oRow = SelectedImage.parentElement.parentElement
            var oGrid1 = oRow.parentElement
            for (j = oRow.rowIndex; j < oGrid.rows.length; ++j) {
                if (oGrid1.rows(j).cells(0).firstChild == SelectedImage) {
                    if (oGrid1.rows(j + 1)) {
                        if (oGrid1.rows(j + 1).style.display == "none") {
                            SelectedImage.src = "/TAPresentation/App_Utility/Images/Icons/btnNodes.gif"
                            oGrid1.rows(j + 1).style.display = "inline"
                            oGrid1.rows(j + 2).style.display = "inline"
                        }
                        else if (oGrid1.rows(j + 1).style.display == "inline") {
                        SelectedImage.src = "/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif"
                            oGrid1.rows(j + 1).style.display = "none"
                            oGrid1.rows(j + 2).style.display = "none"
                        }
                    }
                }
            }
        }
        //___________________________________________________________________________________________
        function OnKeyDownDate(number) {
            var key = window.event.keyCode
            window.event.returnValue =
	        (
		        ((key >= 96) && (key <= 105)) ||
		        ((key >= 48) && (key <= 57)) ||
		        (key == 8) || (key == 9) || (key == 46) ||
		        ((key >= 35) && (key <= 40)) ||
		        (key == 191) || (key == 111)
	        )
        }
        //___________________________________________________________________________________________
        function bindGrid(oGrid) {
            var n = 0
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLGrid").value)
          
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var XmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/GetMainDetail")

            var XmlLen = XmlNodes.length
            //alert(XmlLen)
            if (XmlNodes.length > 0) {
                for (var k = 0; k < XmlLen; k++) {
                    addRow(oGrid, XmlNodes.item(k).selectSingleNode('StructureID').text.toString(),
                                XmlNodes.item(k).selectSingleNode('Name').text.toString(),
                                XmlNodes.item(k).selectSingleNode('Desc').text,
                                XmlNodes.item(k).selectSingleNode('Acronym').text
                    //, XmlNodes.item(k).selectSingleNode('CategoryID').text
                                , xmlDoc)
                }
            }
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function addRow(oGrid, StructureID, StName, Desc, Acronym, TimesStructureXml)
        //function addRow(oGrid, TimesStructure, StName, DetailCollectionID, Desc)
        {
            //----------------------

            oGrid.insertRow()

            //oGrid.rows(newrowindex).className = "CssItemStyle"
            //oGrid.rows(newrowindex).className = "CssAlternatingItemStyle"
            oGrid.rows(newrowindex).className = "CssItemHeader4"
            //CssItemHeader4


            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            //----visible column
            oGrid.rows(newrowindex).cells(0).innerHTML = "<IMG src='/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif' onclick='OnClickSubNode(this)'>"
            oGrid.rows(newrowindex).cells(1).innerText = StructureID
            oGrid.rows(newrowindex).cells(2).innerText = StName.slice(0, 20)
            oGrid.rows(newrowindex).cells(2).title = StName
            oGrid.rows(newrowindex).cells(3).innerText = Acronym
            oGrid.rows(newrowindex).cells(4).innerText = Desc.slice(0, 35)
            oGrid.rows(newrowindex).cells(4).title = Desc

            //----Create Attribute
            oGrid.rows(newrowindex).setAttribute("CssFlag", "1")
            oGrid.rows(newrowindex).setAttribute("StructureID", StructureID)
            oGrid.rows(newrowindex).setAttribute("Desc", Desc)
            oGrid.rows(newrowindex).setAttribute("Name", StName)



            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "20px"
            oGrid.rows(newrowindex).cells(1).style.width = "58px"
            oGrid.rows(newrowindex).cells(2).style.width = "136px"
            oGrid.rows(newrowindex).cells(3).style.width = "133px"
            oGrid.rows(newrowindex).cells(4).style.width = "215px"


            newrowindex = newrowindex + 1
            //var XmlNodes1 = TimesStructureXml.documentElement.selectNodes("/ScheduleEntity/GetDetailCollectionProgram[StructureID=" + StructureID + "]")

            //var len1 = XmlNodes1.length

            //if (len1 != 0) {
            //---------------------------------
            oGrid.insertRow()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).cells(0).colSpan = "5"
            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).style.display = "none"

            //Create Attribute
            oGrid.rows(newrowindex).setAttribute("CssFlag", "2")

            //var strHTML = "<TABLE  width='95%' class='CssItemHeader4' dir='rtl' cellspacing='0' cellPadding='0' border='0'><TR>"
            var strHTML = "<TABLE  width='95%' class='CssAlternatingItemStyle' dir='rtl' cellspacing='0' cellPadding='0' border='0'><TR>"
            strHTML += "<TD align='center' style='WIDTH:20px'></TD>"
            strHTML += "<TD align='center' style='WIDTH:130px'>" + "تاريخ شروع" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:70px'>" + "تاريخ خاتمه" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:250px'>" + "توضيحات زير ساختار" + "</TD>"
//            strHTML += "<TD align='center' style='WIDTH:150px'>" + "زمان نرمال شروع" + "</TD>"
//            strHTML += "<TD align='center' style='WIDTH:150px'>" + "زمان نرمال خاتمه" + "</TD>"
            strHTML += "<TD align='center' style='WIDTH:20px'><IMG src='/TAPresentation/App_Utility/Images/Icons/NewIcon.gif' title='ايجاد زيرساختار' style='cursor:pointer' onclick='OnClickNewDetailCollection(this)'></TD>"
            strHTML += "</TR></TABLE>"
            oGrid.rows(newrowindex).cells(0).innerHTML = strHTML
            oGrid.rows(newrowindex).cells(0).align = "center"
            newrowindex = newrowindex + 1
            //-------------------------------
            createRows(oGrid, TimesStructureXml, StName.slice(0, 20), StructureID)
            //}
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickEditDetailCollection(obj) {
            while (obj.tagName != "TR") {
                obj = obj.parentElement
            }

            var dd = obj.DetailCollectionID
            obj = obj.parentElement

            while (obj.tagName != "TR") {
                obj = obj.parentElement
            }
            obj = obj.previousSibling.previousSibling

            url = "DifinitionDetailCollection.aspx?StructureID=" + obj.cells(1).innerText
            + " &DetailCollectionID=" + dd
            + " &SessionID=" + $get(MasterObj + "txtSessionID").value
            + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value;

            var rr = window.showModalDialog(url, window, "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no")
            if (rr == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickNewDetailCollection(obj) {
            while (obj.tagName != "TR") {
                obj = obj.parentElement
            }
            obj = obj.parentElement
            while (obj.tagName != "TR") {
                obj = obj.parentElement
            }
            obj = obj.previousSibling

            url = "DifinitionDetailCollection.aspx?StructureID=" + obj.cells(1).innerText
            + " &DetailCollectionID=0"
            + " &SessionID=" + $get(MasterObj + "txtSessionID").value
            + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value;

            var rr = window.showModalDialog(url, window, "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no")
            if (rr == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function createRows(oGrid, TimesStructure, SName, StructureID) {

            oGrid.insertRow()
            oGrid.rows(newrowindex).insertCell()

            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).colSpan = "5"
            oGrid.rows(newrowindex).style.display = "none"
            var TableID = MasterObj + "TABLE" + newrowindex

            oGrid.rows(newrowindex).cells(0).innerHTML = "<TABLE id='" + TableID + "' width='95%' dir='rtl' id='Test' cellPadding='0' border='0'></TABLE>"

            newrowindex = newrowindex + 1

            var XmlNodes = TimesStructure.documentElement.selectNodes("/ScheduleEntity/GetDetailCollectionProgram[StructureID=" + StructureID + "]")

            var len = XmlNodes.length

            if (len != 0) {

                //                insertChildTable(document.all.item(TableID), 0,
                //                             document.getElementById(MasterObj + "txtTodayDate").value//, "1399/12/30", ""
                //                             , "0")

                //            }
                //            else {

                var oIndex = 0
                Drowindex = 0
                for (var i = 0; i < len; i++) {
                    insertChildTable(document.all.item(TableID),
                                     i,
                                     XmlNodes.item(i).selectSingleNode('StartDate').text,
                                    XmlNodes.item(i).selectSingleNode('EndDate').text,
                                    XmlNodes.item(i).selectSingleNode('Desc').text,
                                    XmlNodes.item(i).selectSingleNode('NormalStart').text,
                                    XmlNodes.item(i).selectSingleNode('NormalEnd').text,
                                     XmlNodes.item(i).selectSingleNode('TimesStructure').text,
                                     "0",
                                     XmlNodes.item(i).selectSingleNode('DetailCollectionID').text)
                                     //alert(XmlNodes.item(i).selectSingleNode('DetailCollectionID').text)
                }


                //                for (var k = document.all.item(TableID).rows.length - 1; k > 0; k--) {
                //                    if (document.all.item(TableID).rows(k).cells(3).innerText == "ÑæÒ ÈÚÏ" && document.all.item(TableID).rows(k).cells(0).innerHTML != "") {
                //                        document.all.item(TableID).rows(k).cells(5).style.display = "inline"
                //                        return
                //                    }
                //                }
                document.all.item(TableID).rows(0).cells(0).firstChild.disabled = false;
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function createRowsTime(opGrid, TimesStructure, oIndex1) {
            Mode = $get(MasterObj + "txtMode").value;
           // alert(Mode)
            Pnewrowindex = 0
            // var opGrid = document.getElementById("GrdSubTime")

            var caption = ""
//            if (Mode == 1) {
//                caption = 'روز قبل'
//            }
//            else {
//                caption = 'روز جاري'
//            }

            var arrRow = TimesStructure.split(';')
            var arrTime = ""
            var arrPro = ""
            var slice = ""



            var oIndex = 0
            for (var i = 0; i < arrRow.length - 1; i++) {
                slice = arrRow[i].split('$')
                arrTime = slice[0].split('_')
                arrPro = slice[1].split(',')

                if (arrTime[1] >= 0 && arrTime[1] < 1440)
                    caption = 'روز جاري'
                else if (arrTime[1] < 0)
                    caption = 'روز قبل'
                else
                    caption = 'روز بعد'

                AddRowTime(opGrid, oIndex, caption, getDetailTypeTitle(arrPro[0]), arrPro[0], GetTime(arrTime[0]), GetTime(arrTime[1]), "0")
                oIndex++
                for (var j = 1; j < arrPro.length; j++) {
                    AddRowTime(opGrid, oIndex, caption, getDetailTypeTitle(arrPro[j]), arrPro[j], "0", "0", "0")
                    oIndex++
                }
                if (GetTime(arrTime[1]) == "23:59") {
                    if (caption == 'روز جاري') {
                        caption = "<font color='red'>روز بعد</font>"
                    }
                    else {
                        caption = "<font color='green'>روز جاري</font>"
                    }
                }
            }
//            for (var k = opGrid.rows.length - 1; k > 0; k--) {
//                if (opGrid.rows(k).cells(3).innerText == "روز بعد" && opGrid.rows(k).cells(0).innerHTML != "") {
//                    //opGrid.rows(k).cells(5).style.display = "inline"
//                    return
//                }
//            }

            //            if (Mode == 1) {
            //                opGrid.rows(0).cells(0).firstChild.disabled = false
            //            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function GetTime(minute) {
            if (parseInt(minute) < 0)
                minute = parseInt(minute) + 1440

            else if (parseInt(minute) > 1439)
                minute = parseInt(minute) - 1440

            var hour = minute / 60
            hour = parseInt(hour, 10)
            var min = minute % 60
            min = parseInt(min, 10)
            var time = ""
            if (hour < 10) {
                time = "0" + hour + ":"
            }
            else {
                time = hour + ":"
            }
            if (min < 10) {
                time += "0" + min
            }
            else {
                time += min
            }
            return time
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRowTime(oGrid, oIndex, Caption, title, DetailTypeID, STime, ETime, Selected) {
           
            
            oGrid.insertRow()

            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()
            oGrid.rows(oIndex).insertCell()

            oGrid.rows(oIndex).className = "CssItemHeader5"
            oGrid.rows(oIndex).setAttribute("Caption", Caption)
            oGrid.rows(oIndex).setAttribute("Selected", Selected)
            //oGrid.rows(oIndex).setAttribute("DetailTypeID", DetailTypeID)
            //alert(STime.toString())
            if (STime.toString() != "0") {
                oGrid.rows(oIndex).cells(0).innerText = STime

            }
            else
                oGrid.rows(oIndex).cells(0).innerText = ""

            if (ETime.toString() != "0") {
                oGrid.rows(oIndex).cells(1).innerText = ETime
            }
            else
                oGrid.rows(oIndex).cells(1).innerText = ""

            // oGrid.rows(oIndex).cells(2).innerHTML = "<asp:Label  runat='server'>" + title + "</asp:Label>"
            //'<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeInt.innerHTML+'<SELECT>'
            oGrid.rows(oIndex).cells(2).innerText = title//'<SELECT style="WIDTH: 130px" onchange="OnChangeSelDetailType(this)" ' + document.getElementById(MasterObj + "SelDetailType").innerHTML + '<SELECT>'
            oGrid.rows(oIndex).cells(3).innerHTML = Caption//"<asp:Label  runat='server'>" + Caption + "</asp:Label>"
            //oGrid.rows(oIndex).cells(5).innerHTML = "<INPUT type='button' title='جديد'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TAPresentation/App_Utility/Images/Icons/NewIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnNewTime()'>"
            // oGrid.rows(oIndex).cells(4).innerHTML = "<INPUT type='button'  title='حذف'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TAPresentation/App_Utility/Images/Icons/DelIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickbtnDeleteTime(this)'>"
            // oGrid.rows(oIndex).cells(4).innerHTML = "<INPUT type='button' title='خصوصيات' style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TAPresentation/App_Utility/Images/Icons/Pro.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: pointer; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnPropertiesTime()' >"

            // oGrid.rows(oIndex).cells(2).firstChild.value = DetailTypeID

            oGrid.rows(oIndex).align = "center"
            //oGrid.rows(oIndex).cells(5).style.display = "none"

            oGrid.rows(oIndex).cells(0).style.width = "100px"
            oGrid.rows(oIndex).cells(1).style.width = "100px"
            oGrid.rows(oIndex).cells(2).style.width = "250px"
            oGrid.rows(oIndex).cells(3).style.width = "150px"
            

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function getDetailTypeTitle(DetailTypeID) {

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtDetailType").value)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var XmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/GetDetailType[DetailTypeID=" + DetailTypeID + "]")
            if (XmlNodes.length > 0) {
                return XmlNodes.item(0).selectSingleNode('Title').text
            }
            else {
                return ""
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickCombineStructure() {
            url = "CombineStructure.aspx?";
              url = encodeURI(url)

                var rr = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")
                if (rr == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
        }
    </script>

    <script language="vbscript">
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
		    eventResult = true
			if (not (val=""))and(not Isvaliddate(val)) then
 				Dim strQuestion, intReturn
				strQuestion="  ! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد"
				strQuestion=MsgBox(strQuestion, 0, "تاريخ شمسي اشتباه ")
				window.event.srcElement.focus()
				window.event.srcElement.select()
				eventResult=false
				window.event.returnvalue=false
			else
				if val<>"" then
					dim arr
					arr=split(val,"/",-1,0)
					if arr(0)<100  then  
						century="13"
					else	  
						century=""
					end if
					val=century & arr(0)& "/" & right("0" & arr(1),2)  
					val=val & "/" & right("0" & arr(2),2)   
					window.event.srcElement.value=val
				else 
					strQuestion="  ! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد"
					strQuestion=MsgBox(strQuestion, 0, "تاريخ شمسي اشتباه ")
					eventResult=false
				end if
			end if
		end function
		'********************
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
			    
			ybase_sh=int((sal-125)/ 99)*99+125
			    
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function

		'********************************************
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(2))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(0))
			    
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
			    
			if isshleap(sal)then 
				le=1 
			end if 
			    
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		
			if 99<sal and sal<1000 then
				Isvaliddate=false
			end if
			if sal>9999 then
				Isvaliddate=false
			end if
		end function
		'****************************

		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function InttoSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

				select case roz
					case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
					case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
					case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
			
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if

					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
			        
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if

					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if

					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select

			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if

			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if

			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
			    
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDtoInt(shd)
		dim  sal,mah,roz,Tr,arr
			    
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(2)) 
			mah=cint(arr(1))-1
			roz=cint(arr(0))-1
			Tr=0
			    
			if sal <100 then sal=1300+sal end if
			sal=sal-1314

			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
			    

			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
			    
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if

			SHDtoInt=Tr+roz
		else
			alert("اشكال در تاريخ شمسي")
			SHDtoInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
    </script>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .CssItemHeader4
        {
        	direction:rtl;
	        background-color :#c3d8f5;
          /* font-size: 8pt;
            direction: rtl;
            background-color: #E6E6FF;*/
        }
        .CssItemHeader5
        {
            font-size: 8pt;
            direction: rtl;
            background-color: #F9EAFF;
        }
        .style1
        {
            direction: rtl;
            font-size : 9pt;
            font-weight: bold;
            background-color: #83AFE5;
            width: 98px;
        }
        .style2
        {
            direction: rtl;
            font-size : 9pt;
            font-weight: bold;
            background-color: #83AFE5;
            width: 130px;
        }
        .style3
        {
            direction: rtl;
            font-size : 9pt;
            font-weight: bold;
            background-color: #83AFE5;
            width: 128px;
        }
    </style>
</asp:Content>
