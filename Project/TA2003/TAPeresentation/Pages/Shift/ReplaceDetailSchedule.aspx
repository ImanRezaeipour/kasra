<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ReplaceDetailSchedule.aspx.vb" Inherits="TA.ReplaceDetailSchedule" validateRequest="false" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>---------------------------------------------------------------------------------------- €ÌÌ— 
			»—‰«„Â ò«—Ì 
			--------------------------------------------------------------------------------------------------------------</title>
		<meta content="False" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/General.js"></script>
		<script language="javascript">
		    var newrowindex = 0
		    var LastSelectedRow = null
		    var LastSelectedRowClass = ""
		    //_____________________________
		    var strXPathConditions = ""
		    var PageSize = 10
		    var PageSize_X = 7
		    var currentPage_X = 0
		    //_____________________________
		    var oRequst = new ActiveXObject("Microsoft.XMLHTTP")
		    //----DownRowSimpleNew------------------------------------
		    var lastob
		    var optionId = 0
		    var newrowindex = 0
		    var oRequest = new ActiveXObject("Microsoft.XMLHTTP")
		    var LastSelectedDetail = null
		    var LastObDetail = null
		    var LastObDate = null
		    //================================================================================================================				
		    function OnClickChk(obj) {
		        var UserID = 0
		        var UserFlag = ""

		        UserID = obj.parentElement.parentElement.UserID
		        UserFlag = obj.parentElement.parentElement.UserFlag


		        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("tSelectedMamber").value);
		        xmlDoc.setProperty("SelectionLanguage", "XPath");
		        var root = "/UserEntity/Person"
		        var xmlNodes = xmlDoc.documentElement.selectNodes(root)
		        xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

		        if (obj.checked)
		            xmlNodes.item(0).selectSingleNode('Selected').text = 1
		        else
		            xmlNodes.item(0).selectSingleNode('Selected').text = 0

		        document.getElementById("tSelectedMamber").value = xmlDoc.xml
		    }
		    //================================================================================================================		
		    function XTableInitialize(oGrd) {
		        Form1.CurPage_X.value = 0
		        document.getElementById("CurPage_XS").value = 0

		        document.getElementById("chkAll").checked = true
		        document.getElementById("chkAllSimple").checked = true

		        FillTabTable('First', oGrd)
		    }
		    //================================================================================================================		
		    function FillTabTable(direction, oGrd) {
		        clearGrid(oGrd)

		        if (document.getElementById("tSelectedMamber").value == "") {
		            document.getElementById("tSelectedMamber").value = "<UserEntity></UserEntity>"
		        }
//                alert(document.getElementById("tSelectedMamber").value)
		        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("tSelectedMamber").value);
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


		        Form1.ToatalPage_X.value = Math.ceil(totalRecords / PageSize_X)
		        Form1.ToatalPage_XS.value = Math.ceil(totalRecords / PageSize_X)

		        if (totalRecords > 0) {
		            if (oGrd == document.getElementById("GrdValidUser"))
		                currentPage_X = parseInt(Form1.CurPage_X.value)
		            else if (oGrd == document.getElementById("GrdUserSimple"))
		                currentPage_X = parseInt(Form1.CurPage_XS.value)


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
		                    currentPage_X = parseInt(Form1.ToatalPage_X.value)
		                    break
		            }
		            Form1.CurPage_X.value = currentPage_X
		            document.getElementById("CurPage_XS").value = currentPage_X

		            var endFor
		            if (currentPage_X * PageSize_X - 1 < 0)
		                return
		            if (totalRecords <= currentPage_X * PageSize_X - 1)
		                endFor = totalRecords - 1
		            else
		                endFor = parseInt(Form1.CurPage_X.value) * PageSize_X - 1

		            x = (currentPage_X - 1) * PageSize_X

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
		            if (oGrd == GrdValidUser)
		                document.getElementById("chkAll").checked = FlagCheck
		            else
		                document.getElementById("chkAllSimple").checked = FlagCheck

		        }
		    }
		    //=================================================================================================================		
		    function CurPage_XTextChanged(flagGrid) {
		        var cnt = 0
		        var oGrd
		        if (flagGrid == 1) {
		            oGrd = document.getElementById("GrdValidUser")
		            if (parseInt(Form1.CurPage_X.value) <= parseInt(document.getElementById("ToatalPage_X").value) && parseInt(Form1.CurPage_X.value) > 0) {
		                FillTabTable('Const', oGrd)
		            }
		        }
		        else if (flagGrid == 2) {
		            oGrd = document.getElementById("GrdUserSimple")
		            if (parseInt(document.getElementById("CurPage_XS").value) <= parseInt(document.getElementById("ToatalPage_XS").value) && parseInt(document.getElementById("CurPage_XS").value) > 0) {
		                FillTabTable('Const', oGrd)
		            }
		        }

		    }
		    ////______________________________________________________________________________
		    function NextBtn_XClick(flagGrid) {
		        var cnt = 0
		        var oGrd
		        if (flagGrid == 1)
		            oGrd = document.getElementById("GrdValidUser")
		        else if (flagGrid == 2)
		            oGrd = document.getElementById("GrdUserSimple")

		        if (parseInt(Form1.CurPage_X.value) < parseInt(Form1.ToatalPage_X.value)) {
		            FillTabTable('Next', oGrd)
		        }
		    }
		    ////______________________________________________________________________________
		    function PrevBtn_XClick(flagGrid) {
		        var cnt = 0
		        var oGrd
		        if (flagGrid == 1)
		            oGrd = document.getElementById("GrdValidUser")
		        else if (flagGrid == 2)
		            oGrd = document.getElementById("GrdUserSimple")

		        if (parseInt(Form1.CurPage_X.value) > 1) {
		            FillTabTable('Previous', oGrd)
		        }
		    }
		    ////______________________________________________________________________________
		    function FirstBtn_XClick(flagGrid) {
		        var cnt = 0
		        var oGrd
		        if (flagGrid == 1)
		            oGrd = document.getElementById("GrdValidUser")
		        else if (flagGrid == 2)
		            oGrd = document.getElementById("GrdUserSimple")
		        FillTabTable('First', oGrd)
		    }
		    ////______________________________________________________________________________
		    function LastBtn_XClick(flagGrid) {
		        var cnt = 0
		        var oGrd
		        if (flagGrid == 1)
		            oGrd = document.getElementById("GrdValidUser")
		        else if (flagGrid == 2)
		            oGrd = document.getElementById("GrdUserSimple")

		        FillTabTable('Last', oGrd)
		    }
		    //================================================================================================================							
		    function onClickBtnSSave() {
		        try {
		            var oSelDate = document.getElementById("selDate")
		            var oSelDetail = document.getElementById("lstSelected")
		            var oGrid = document.getElementById("GrdUserSimple")

		            if (compareTimeS() == false) {
		                return
		            }
		            if (document.getElementById("selDate").rows.length == 0) {
		                alert('«» œ« »«Ìœ  «—ÌŒ —« «÷«›Â ò‰Ìœ')
		                return
		            }
		            if (oSelDate.rows.length != oSelDetail.rows.length) {
		                alert(' ⁄œ«œ ”«Œ «— Â«Ì «‰ Œ«»Ì »« ÿÊ· —Ê“Â« »«Ìœ Ìò”«‰ »«‘œ')
		                return
		            }


		            //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		            var XmlStr = "<ShiftEntity>"
		            var oLen = oSelDate.rows.length
		            var vDate = ''
		            var DetailID = 0
		            var repeated = 0
		            for (var i = 0; i < oLen; i++) {
		                DetailID = oSelDetail.rows(i).cells(1).innerText
		                vDate = oSelDate.rows(i).cells(0).innerText

		                if (DetailID != 0)	//«ê— ê“Ì‰Â ÅÌ‘ ›—÷ ‰Ì” 
		                {
		                    XmlStr += "<ReplaceDetail><Date>" + vDate + "</Date>"
		                    XmlStr += "<NewDetailID>" + DetailID + "</NewDetailID></ReplaceDetail>"
		                }
		            }
		            if (DetailID != 0 && repeated && !confirm('œ— »Ì‰ »«“Â  «—ÌŒ Ê«—œ ‘œÂ ° »«“Â «Ì œ«—«Ì  €ÌÌ— ”«Œ «— «”  ¬Ì« „«Ì· »Â Ã«Ìê“Ì‰Ì Â” Ìœ ø')) {
		                return
		            }
		            //-----------------------------Members----------------------
                    
		            var tempUserFlag = ""
		            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		            xmlDoc.loadXML(document.getElementById("tSelectedMamber").value);
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
		                alert('·ÿ›« «⁄÷« —« «‰ Œ«» ò‰Ìœ')
		                return
		            }
		            //-----------------------------------------------------------
		            XmlStr += "</ShiftEntity>"
		            document.getElementById("txtXmlSave").value = XmlStr

		            document.getElementById("txtDetailHTML").value = document.getElementById("TDlstSelected").innerHTML
		            document.getElementById("txtDateHTML").value = document.getElementById("TDselDate").innerHTML
		            //alert(XmlStr)
		            document.getElementById("txtSubmit").value = "SimpleSave"
		            document.getElementById("Form1").submit()
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================													
		    function OnClickSelDate() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================											
		    function onChangeCmbName() {
		        if (document.getElementById("cmbName").value != "" && document.getElementById("cmbName").value != "0") {
		            document.getElementById("txtPersonID").value = document.getElementById("cmbName").value
		        }
		        else {
		            document.getElementById("txtPersonID").value = ""
		        }
		    }
		    //================================================================================================================											
		    function onBlurTxtPersonID() {

		        if (document.getElementById("txtPersonID").value != "") {
		            document.getElementById("cmbName").value = document.getElementById("txtPersonID").value
		            if (document.getElementById("cmbName").value == "") {
		                alert('‘„«—Â Å—”‰·Ì ‰«œ—”  «” ')
		                document.getElementById("cmbName").value = 0
		                document.getElementById("txtPersonID").value = ""
		                document.getElementById("txtPersonID").focus()
		                return
		            }
		        }
		        else
		            document.getElementById("cmbName").value = 0

		    }
		    //================================================================================================================											
		    function OnKeyDownInt(number) {
		        var key = window.event.keyCode
		        window.event.returnValue =
				(
					((key >= 96) && (key <= 105)) ||
					((key >= 48) && (key <= 57)) ||
					(key == 8) || (key == 9) || (key == 46) ||
					((key >= 35) && (key <= 40))
				)
		    }
		    //================================================================================================================									
		    function CheckDateSimple(oDate) {
		        try {
		            if (document.getElementById("txtXmlDetail").value != "") {
		                var SD
		                var ED
		                //oDate=oDate.substring(6,10)+oDate.substring(3,5)+oDate.substring(0,2)
		                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
		                xmlDoc.async = "false"
		                xmlDoc.loadXML(document.getElementById("txtXmlDetail").value)
		                var XmlNodes = xmlDoc.documentElement.selectNodes("/ShiftEntity/GetReplaceDetail")
		                if (XmlNodes.length != 0) {
		                    for (var i = 0; i < XmlNodes.length; i++) {
		                        SD = XmlNodes.item(i).selectSingleNode('StartDate').text.substring(6, 10) + XmlNodes.item(i).selectSingleNode('StartDate').text.substring(3, 5) + XmlNodes.item(i).selectSingleNode('StartDate').text.substring(0, 2)
		                        ED = XmlNodes.item(i).selectSingleNode('EndDate').text.substring(6, 10) + XmlNodes.item(i).selectSingleNode('EndDate').text.substring(3, 5) + XmlNodes.item(i).selectSingleNode('EndDate').text.substring(0, 2)

		                        if (oDate >= SD && oDate <= ED) {
		                            return true
		                        }
		                    }
		                }
		            }
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================									
		    function CheckDate(StartDate, EndDate, DID) {
		        try {
		            if (document.getElementById("txtXmlDetail").value != "") {
		                var SD
		                var ED
		                StartDate = StartDate.substring(0, 4) + StartDate.substring(5, 7) + StartDate.substring(8, 10)
		                EndDate = EndDate.substring(0, 4) + EndDate.substring(5, 7) + EndDate.substring(8, 10)
		                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
		                xmlDoc.async = "false"
		                xmlDoc.loadXML(document.getElementById("txtXmlDetail").value)
		                var XmlNodes = xmlDoc.documentElement.selectNodes("/ShiftEntity/GetReplaceDetail")
		                if (XmlNodes.length != 0) {
		                    for (var i = 0; i < XmlNodes.length; i++) {
		                        SD = XmlNodes.item(i).selectSingleNode('StartDate').text.substring(6, 10) + XmlNodes.item(i).selectSingleNode('StartDate').text.substring(3, 5) + XmlNodes.item(i).selectSingleNode('StartDate').text.substring(0, 2)
		                        ED = XmlNodes.item(i).selectSingleNode('EndDate').text.substring(6, 10) + XmlNodes.item(i).selectSingleNode('EndDate').text.substring(3, 5) + XmlNodes.item(i).selectSingleNode('EndDate').text.substring(0, 2)
		                        if (DID != XmlNodes.item(i).selectSingleNode('ReplaceDetailID').text && ((StartDate >= SD && StartDate <= ED) || (EndDate >= SD && EndDate <= ED) || (SD >= EndDate && SD <= StartDate) || (ED >= EndDate && ED <= StartDate))) {
		                            return true
		                        }
		                    }
		                }
		            }
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================					
		    function ClearSelDate() {
		        var j = document.getElementById("selDate").rows.length - 1
		        for (; j >= 0; --j) {
		            document.getElementById("selDate").deleteRow(j)
		        }
		    }
		    //================================================================================================================			
		    function onClickBtnSelectPersonSimple() {
		        //try
		        //{
//                alert(100)
		        var strOptions = ""
		        var url
		        if (document.getElementById("ChkWorkS").checked == true) {
		            document.getElementById("txtUserFlag").value = "W"
		            url = "WorkSchedule.aspx"
		            strOptions = "dialogHeight: 455px;dialogWidth:370px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkShiftS").checked == true) {
		            document.getElementById("txtUserFlag").value = "S"
		            url = "../BaseInfo/ValidGroupWithFilter.aspx?CategoryId=2"
		            strOptions = "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no"

		        }
		        else if (document.getElementById("ChkTablS").checked == true) {
		            document.getElementById("txtUserFlag").value = "T"
		            url = "GetTableOffice.aspx"
		            strOptions = "dialogHeight: 435px;dialogWidth: 430px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkPersonelGroupS").checked == true) {
		            document.getElementById("txtUserFlag").value = "G"
		            url = "../BaseInfo/ValidGroupWithFilter.aspx?CategoryId=1"
		            strOptions = "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkPersonelS").checked == true) {
		            document.getElementById("txtUserFlag").value = "P"
		            url = "../Person/PersonTab.aspx?TypeAccess=" + document.getElementById("txtPageAccess").value + "&SessionID=" + Form1.txtSessionID.value
		            strOptions = "dialogHeight: 720px;dialogWidth: 700px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkRoleS").checked == true) {
		            url = "../BaseInfo/Role.aspx" + "?SessionID=" + Form1.txtSessionID.value
		            strOptions = "dialogHeight: 650px;dialogWidth: 650px;center: Yes;help: no;status: no"
		            document.getElementById("txtUserFlag").value = "R"
		        }
		        else {
		            return
		        }
		        //------------------------------------------------------------
		        if (url != "") {
		            document.getElementById("txtSelectedMamber").value = window.showModalDialog(url, "", strOptions)
		            //alert(document.getElementById("txtSelectedMamber").value)
		            url = ""
		        }
		        if (document.getElementById("txtSelectedMamber").value != '') {

		            if (document.getElementById("GrdUserSimple").rows.length > 0) {
		                if (confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø')) {
		                    //Cleargrd(GrdValidUser)
		                    clearGrid(document.getElementById("GrdUserSimple"))
		                    document.getElementById("tSelectedMamber").value = ''
		                }
		            }

		            //===============
		            switch (document.getElementById("txtUserFlag").value) {
		                case 'P':
		                    document.getElementById("txtSelectedMamber").value = GetDataPerson()
		                    break;
		                case 'T':
		                    document.getElementById("txtSelectedMamber").value = GetTableOffice()
		                    break
		                case 'W':
		                    document.getElementById("txtSelectedMamber").value = GetWorkSchedule()
		                    break
		                case 'R':
		                    document.getElementById("txtSelectedMamber").value = GetDataRole()
		                    break
		                default:
		                    document.getElementById("txtSelectedMamber").value = GetDataGroup()
		            }
		            //===============
		            if (document.getElementById("txtSelectedMamber").value != "") {
		                document.getElementById("txtValidUserXml").value = document.getElementById("txtSelectedMamber").value
		                XTableInitialize(GrdUserSimple)
		            }

		        }
		        //}
		        //catch(e)
		        //{}
		    }
		    //================================================================================================================										
		    function GetDataRole() {
		        var MemberName = '';
		        var SMemberName = '';


//		        xmlDoc = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc.loadXML(document.getElementById("txtSelectedMamber").value);
//		        xmlDoc.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes;
//		        xmlNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/Role[Selected=1]");


//		        if (Form1.tSelectedMamber.value == "")
//		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

//		        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc2.loadXML(Form1.tSelectedMamber.value);
//		        xmlDoc2.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes2;

//		        var strSelectedMamber = ''
//		        if (xmlNodes.length != 0) {
//		            for (x = 0; x < xmlNodes.length; x++) {
//		                xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('DepartmentID').text + " and UserFlag='R']");

//		                if (xmlNodes2.length == 0) {
//		                    strSelectedMamber += '<Person>'
//		                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonID>'
//		                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('DepartmentTitle').text + '</Family>'
//		                    strSelectedMamber += '<UserFlag>' + document.getElementById("txtUserFlag").value + '</UserFlag>'
//		                    strSelectedMamber += '<Selected>1</Selected>'
//		                    strSelectedMamber += '</Person>'
//		                }
//		            }
//		        }

//		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

//		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
		        //		        return (strSelectedMamber)


		        var strSelectedMamber = document.getElementById("txtSelectedMamber").value
		        strSelectedMamber = strSelectedMamber.replace("<UserEntity>", "")
		        strSelectedMamber = strSelectedMamber.replace("</UserEntity>", "")

		        if (Form1.tSelectedMamber.value == "")
		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'

		        return (strSelectedMamber)


		    }
		    //================================================================================================================								
		    function OnClickBtnSCancel() {
		        document.getElementById("TopRow").style.display = "inline"
		        document.getElementById("DownRowSimpleNew").style.display = "none"
		    }
		    //================================================================================================================						
		    function onClickBtnNewSimple() {
		        document.getElementById("TopRow").style.display = "none"
		        document.getElementById("DownRowSimpleNew").style.display = "inline"
		        Form1.tSelectedMamber.value = ""
		        document.getElementById("chkAllSimple").checked = false
		        Form1.ToatalPage_XS.value = 0
		        document.getElementById("CurPage_XS").value = 0

		        onClickBtnSNew()
		    }
		    //================================================================================================================				
		    function onClickBtnSNew() {
		        try {
		            ClearSelDate()
		            onclickbtnnNext()

		            document.getElementById("chkAllSimple").checked = false
		            Form1.ToatalPage_XS.value = 0
		            document.getElementById("CurPage_XS").value = 0

		            clearGrid(document.getElementById("GrdUserSimple"))
		        }
		        catch (e)
			{ }

		    }
		    //================================================================================================================						
		    function compareTimeS() {
		        try {
		            var ED = document.getElementById("ED_txtYear").value + document.getElementById("ED_txtMonth").value + document.getElementById("ED_txtDay").value
		            var SD = document.getElementById("SD_txtYear").value + document.getElementById("SD_txtMonth").value + document.getElementById("SD_txtDay").value
		            if (ED < SD) {
		                alert(' «—ÌŒ Å«Ì«‰ »«Ìœ »“—ê — «“  «—ÌŒ ‘—Ê⁄ »«‘œ')
		                return false
		            }
		            else {
		                return true
		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //================================================================================================================				
		    function clearGrid(oGird) {
		        try {
		            var j = oGird.rows.length - 1
		            for (; j >= 0; --j) {
		                oGird.deleteRow(j)
		            }
		            newrowindex = 0
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }

		    //================================================================================================================		
		    function OnClickBtnAdd() {
		        try {
		            if (!compareTimeS()) {
		                return
		            }
		            var SD = document.getElementById("SD_txtYear").value + "/" + document.getElementById("SD_txtMonth").value + "/" + document.getElementById("SD_txtDay").value
		            var ED = document.getElementById("ED_txtYear").value + "/" + document.getElementById("ED_txtMonth").value + "/" + document.getElementById("ED_txtDay").value
		            if (SD == "//")
		                SD = ""

		            if (ED == "//")
		                ED = ""

		            if (ED == "" || SD == "") {
		                alert('·ÿ›«  «—ÌŒ —« Ê«—œ ò‰Ìœ')
		                return
		            }
		            //--------------Ajax-------------------------
		            ClearSelDate()
		            var url = ''
		            url = "ReplaceDetailSchedule.aspx?AjaxSend=AjaxSimple &SD=" + SD + "&ED=" + ED
		            oRequest.open("post", url, true)
		            oRequest.onreadyStateChange = AjaxFunctionSimple
		            oRequest.send(null)
		            //-------------------------------------------
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================						
		    function AjaxFunctionSimple() {
		        try {
		            var strAjax = ""
		            var oGrid = document.getElementById("GrdUserSimple")
		            if (oRequest.readyState == 4) {
		                if (oRequest.status == 200) {
		                    strAjax = oRequest.responseText
		                    if (strAjax == "")
		                        strAjax = "<ShiftEntity></ShiftEntity>"
		                    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
		                    xmlDoc.async = "false"
		                    xmlDoc.loadXML(strAjax)

		                    var XmlNodes = xmlDoc.documentElement.selectNodes("/ShiftEntity/GetDailyDate")
		                    //**********************************
		                    ClearSelDate()
		                    var oGrid = document.all.item("selDate")
		                    if (XmlNodes.length != 0) {
		                        for (var i = 0; i < XmlNodes.length; i++) {
		                            oGrid.insertRow()
		                            oGrid.rows(i).insertCell()
		                            oGrid.rows(i).cells(0).innerText = XmlNodes.item(i).selectSingleNode('Date').text
		                            oGrid.rows(i).align = "Right"
		                        }


		                    }
		                }
		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }

		    //================================================================================================================				
		    function BindDetailCollection() {
		        var oGrid = document.all.item("lstExist")
		        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("txtDetailCollectionXml").value)

		        xmlDoc.setProperty("SelectionLanguage", "XPath");
		        var xmlNodes;
		        xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDetailCollection")
		        var i = 0

		        //--------------------------------------
		        oGrid.insertRow()
		        oGrid.rows(0).insertCell()
		        oGrid.rows(0).insertCell()
		        oGrid.rows(0).insertCell()

		        oGrid.rows(0).cells(0).innerHTML = "<IMG title='‰„«Ì‘ Ã“∆Ì« '  style='BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
		        oGrid.rows(0).cells(1).innerText = "ÅÌ‘ ›—÷"

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

		            oGrid.rows(i).cells(0).innerHTML = "<IMG title='‰„«Ì‘ Ã“∆Ì« ' onClick='onClickShowDetailInfo()' style='CURSOR: hand; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/info.gif); WIDTH: 12px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 12px' height='20' alt='' src='' width='12'>"
		            oGrid.rows(i).cells(1).innerText = xmlNodes.item(i - 1).selectSingleNode('Name').text

		            oGrid.rows(i).cells(2).innerText = xmlNodes.item(i - 1).selectSingleNode('DetailCollectionID').text
		            oGrid.rows(i).cells(2).style.display = "none"

		            oGrid.rows(i).align = "Right"
		        }
		    }
		    //================================================================================================================		
		    function onClickShowDetailInfo() {
		        try {
		            onclicklstExist()
		            if (lastob != null) {
		                var url = "../BaseInfo/reportDayStructure.aspx?DId=" + lastob.cells(2).innerText
		                window.showModalDialog(url, "", "dialogHeight: 390px;dialogWidth: 470px;center: Yes;help: no;status:no")

		            }
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================		
		    function onclickbtnDown() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================		
		    function onclickbtnUP() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================		
		    function onclicklstSelected() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================							
		    function onclickbtnnNext() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================				
		    function onclickbtnNext() {
		        try {
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
		                    LastSelectedDetail = i + 1
		                    document.getElementById("lstSelected").deleteRow(i)
		                    optionId = optionId - 1
		                }
		            }
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================				
		    function onclicklstExist() {
		        try {
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
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================							
		    function onclickbtnback() {

		        try {
		            if (lastob != null) {
		                document.getElementById("lstSelected").insertRow()
		                document.getElementById("lstSelected").rows(optionId).insertCell()
		                document.getElementById("lstSelected").rows(optionId).insertCell()

		                document.getElementById("lstSelected").rows(optionId).cells(0).innerText = (optionId + 1) + "_" + lastob.cells(1).innerText
		                document.getElementById("lstSelected").rows(optionId).cells(1).innerText = lastob.cells(2).innerText
		                document.getElementById("lstSelected").rows(optionId).cells(1).style.display = "none"
		                optionId = optionId + 1

		                document.getElementById("lstSelected").rows(optionId).cells(0).align = "Right"
		                document.getElementById("lstSelected").rows(optionId).cells(1).align = "Right"


		            }
		        }
		        catch (e)
			{ }
		    }
		    //================================================================================================================	
		    function OnClickbtnTOPCancel() {
		        window.close()
		    }
		    //============================================================================================
		    function onClickBtnSearch() {
		        var Date = document.getElementById("StartDate_txtYear").value + "/" + document.getElementById("StartDate_txtMonth").value + "/" + document.getElementById("StartDate_txtDay").value
		        if (Date == "//") {
		            Date = ""
		        }
		        document.getElementById('txtSDate').value = Date//.substr(2,10)
		        Date = document.getElementById("EndDate_txtYear").value + "/" + document.getElementById("EndDate_txtMonth").value + "/" + document.getElementById("EndDate_txtDay").value
		        if (Date == "//") {
		            Date = ""
		        }
		        var ED = document.getElementById("EndDate_txtYear").value + document.getElementById("EndDate_txtMonth").value + document.getElementById("EndDate_txtDay").value
		        var SD = document.getElementById("StartDate_txtYear").value + document.getElementById("StartDate_txtMonth").value + document.getElementById("StartDate_txtDay").value
		        if (ED < SD) {
		            alert(' «—ÌŒ Å«Ì«‰ »«Ìœ »“—ê — «“  «—ÌŒ ‘—Ê⁄ »«‘œ')
		            return
		        }
		        document.getElementById('txtEDate').value = Date//.substr(2,10)
		        document.getElementById('txtSearch').value = "LimitShow"
		        document.getElementById('form1').submit()
		    }
		    //============================================================================================
		    function onClickBtnNewRD() {
		        try {
		            //document.getElementById("TxtName").value=""
		            document.getElementById("SelCurrent").value = 0
		            document.getElementById("SelReplace").value = 0
		            Form1.tSelectedMamber.value = ""
		            document.getElementById("chkAll").checked = false
		            Form1.ToatalPage_X.value = 0
		            document.getElementById("CurPage_X").value = 0
		            //----------------------------------------
		            tempDate = document.getElementById("txtServerDate").value

		            document.getElementById("SDate_txtYear").value = tempDate.substr(0, 4)
		            document.getElementById("SDate_txtMonth").value = tempDate.substr(5, 2)
		            document.getElementById("SDate_txtDay").value = tempDate.substr(8, 2)

		            document.getElementById("EDate_txtYear").value = tempDate.substr(0, 4)
		            document.getElementById("EDate_txtMonth").value = tempDate.substr(5, 2)
		            document.getElementById("EDate_txtDay").value = tempDate.substr(8, 2)
		            //---------------------------------------
		            document.all.item("SelShift").selectedIndex = 0
		            clearGrid(document.getElementById("GrdValidUser"))
		            ClearWeeklyDay()
		            document.getElementById("txtMode").value = "New"

		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function onClickBtnDelete() {
		        try {
		            if (LastSelectedRow != null) {
		                if (confirm('¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø')) {
		                    document.getElementById("TxtID").value = LastSelectedRow.RDId
		                    document.getElementById("txtMemberID").value = LastSelectedRow.MemberID
		                    document.getElementById("txtSubmit").value = "Delete"
		                    document.getElementById("Form1").submit()
		                }
		            }
		            else {
		                alert('·ÿ›« ”ÿ— „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ')
		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function onClickBtnEdit() {
		        try {
		            if (LastSelectedRow == null) {
		                alert('·ÿ›« ”ÿ— „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ')
		            }
		            else {
		                document.getElementById("txtMode").value = "Edit"
		                //--------------Ajax-------------------------
		                oRequst.open("post", "ReplaceDetailSchedule.aspx?AjaxSend=Ajax &RID=" + LastSelectedRow.RDId, true)
		                oRequst.onreadyStateChange = AjaxFunction
//                        alert(AjaxFunction)
		                oRequst.send(null)
		                //-------------------------------------------
		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function AjaxFunction() {
		        //try
		        //{
		        var strAjax = ""
		        var oGrid = document.getElementById("GrdValidUser")
		        if (oRequst.readyState == 4) {
		            if (oRequst.status == 200) {
		                strAjax = oRequst.responseText
		                if (strAjax != "") {
		                    var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
		                    xmlDoc.async = "false"
		                    xmlDoc.loadXML(strAjax)
		                    var XmlNodes
		                    XmlNodes = xmlDoc.documentElement.selectNodes("/ShiftEntity/GetReplaceDetailMember")
		                    if (XmlNodes.length > 0) {
		                        //document.getElementById("TxtName").value=XmlNodes.item(0).selectSingleNode("ReplaceDetailName").text
		                        var tempDate = XmlNodes.item(0).selectSingleNode("StartDate").text
		                        if (tempDate != '') {
		                            document.getElementById("SDate_txtYear").value = '13' + tempDate.substr(6, 4)
		                            document.getElementById("SDate_txtMonth").value = tempDate.substr(3, 2)
		                            document.getElementById("SDate_txtDay").value = tempDate.substr(0, 2)
		                        }
		                        tempDate = XmlNodes.item(0).selectSingleNode("EndDate").text
		                        if (tempDate != '') {
		                            document.getElementById("EDate_txtYear").value = '13' + tempDate.substr(6, 4)
		                            document.getElementById("EDate_txtMonth").value = tempDate.substr(3, 2)
		                            document.getElementById("EDate_txtDay").value = tempDate.substr(0, 2)
		                        }
		                        var oSelReplace = document.getElementById("SelReplace")

		                        //+++++++++++++++++++++++++++++++++++++++++++++++++
		                        var oSelReplace = document.getElementById("SelReplace")
		                        for (var j = 0; j < oSelReplace.length; j++)
		                            if (oSelReplace.options(j).value == parseInt(XmlNodes.item(0).selectSingleNode("NewDetailID").text)) {
		                                oSelReplace.selectedIndex = oSelReplace.options(j).index
		                            }
		                        //+++++++++++++++++++++++++++++++++++++++++++++++++
		                        var oSelCurrent = document.getElementById("SelCurrent")
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
		                        clearGrid(document.getElementById("GrdValidUser"))
		                        var strSelectedMamber = ""
		                        for (var i = 0; i < XmlNodes.length; i++) {
		                            //oName=XmlNodes.item(i).selectSingleNode('MemberName').text
		                            //AddRow(oGrid,XmlNodes.item(i).selectSingleNode('Type').text,XmlNodes.item(i).selectSingleNode('MemberID').text,oName,oName.substr(oName,20),1)	

		                            strSelectedMamber += '<Person>'
		                            strSelectedMamber += '<PersonID>' + XmlNodes.item(i).selectSingleNode('MemberID').text + '</PersonID>'
		                            strSelectedMamber += '<Family>' + XmlNodes.item(i).selectSingleNode('MemberName').text + '</Family>'
		                            strSelectedMamber += '<UserFlag>' + XmlNodes.item(i).selectSingleNode('Type').text + '</UserFlag>'
		                            strSelectedMamber += '<Selected>1</Selected>'
		                            strSelectedMamber += '</Person>'
		                        }
		                        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
		                        Form1.tSelectedMamber.value = strSelectedMamber
		                        XTableInitialize(document.getElementById("GrdValidUser"))
		                        //-------------------------------------------------------------------
		                        document.getElementById("TopRow").style.display = "none"
		                        document.getElementById("DownRow").style.display = "inline"
		                    }
		                }
		            }
		        }
		        //}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}	
		    }
		    //============================================================================================
		    function ClearWeeklyDay() {
		        try {
		            var strResut = ""
		            var ChkName = ""
		            for (var i = 0; i < 7; i++) {
		                ChkName = "Chk" + i.toString()
		                document.getElementById(ChkName).checked = false

		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
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
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function onClickBtnSave() {
		        url = "SchedulePresent.aspx"
		        strOptions = "dialogHeight: 400px;dialogWidth: 500px;center: Yes;help: no;status: no"
		        var StrReturn
		        StrReturn = window.showModalDialog(url, "", strOptions)
//                alert(StrReturn)
		        Form1.txtSchedulePresent.value = StrReturn

		        try {
		            /*if(document.getElementById("TxtName").value=="")
		            {
		            alert('·ÿ›« ‰«„  €ÌÌ— —« „‘Œ’ ò‰Ìœ')
		            return
		            }*/
		            //-----------------------------------
		            var XmlStr1 = "<ReplaceDetail>"
		            var oSelCurrent = document.getElementById("SelCurrent")
		            var oSelReplace = document.getElementById("SelReplace")
		            var oSelShift = document.all.item("SelShift")
		            var oGrid = document.getElementById("GrdValidUser")
		            var DID = 0
		            //-----------------------------------
		            if (oSelReplace.value == 0 || oSelReplace.value == -1) {
		                alert('·ÿ›« ”«Œ «— Ã«Ìê“Ì‰ —« „‘Œ’ ò‰Ìœ')
		                return
		            }
		            //-----------------------------------
		            if (document.getElementById("txtMode").value == "Edit") {
		                if (LastSelectedRow == null)
		                    DID = document.getElementById("txtLastRID").value
		                else
		                    DID = LastSelectedRow.RDId
                           
		                document.getElementById("txtSubmit").value = "Update"
		                XmlStr1 += "<ReplaceDetailID>" + DID + "</ReplaceDetailID>"

		            }
		            else if (document.getElementById("txtMode").value == "New") {
		                document.getElementById("txtSubmit").value = "Insert"
		                XmlStr1 += "<ReplaceDetailID>0</ReplaceDetailID>"
		            }
		            //XmlStr1+="<ReplaceDetailName>"+document.getElementById("TxtName").value+"</ReplaceDetailName>"
		            //XmlStr1+="<ReplaceDetailName></ReplaceDetailName>"
		            //-----------------------------------	
		            var sDate = document.getElementById("SDate_txtYear").value + "/" + document.getElementById("SDate_txtMonth").value + "/" + document.getElementById("SDate_txtDay").value
		            if (sDate == "//") {
		                sDate = ""
		                alert('·ÿ›«  «—ÌŒ ‘—Ê⁄ —« Ê«—œ ò‰Ìœ')
		                return
		            }
		            XmlStr1 += "<StartDate>" + sDate + "</StartDate>"
		            //-----------------------------------

		            var eDate = document.getElementById("EDate_txtYear").value + "/" + document.getElementById("EDate_txtMonth").value + "/" + document.getElementById("EDate_txtDay").value
		            if (eDate == "//") {
		                eDate = ""
		                alert('·ÿ›«  «—ÌŒ Å«Ì«‰ —« Ê«—œ ò‰Ìœ')
		                return
		            }
		            if (compareTime() == false) {
		                return
		            }
		            XmlStr1 += "<EndDate>" + eDate + "</EndDate>"


		            if (CreateWeeklyDay() != "") {
		                XmlStr1 += "<WeeklyDay>" + CreateWeeklyDay() + "</WeeklyDay>"
		            }
		            if (oSelShift.selectedIndex != 0) {
		                XmlStr1 += "<ShiftCycleDayNo>" + oSelShift.options(oSelShift.selectedIndex).innerText + "</ShiftCycleDayNo>"
		                document.getElementById("txtIndex").value = oSelShift.selectedIndex
		            }
		            else {
		                document.getElementById("txtIndex").value = 0
		            }
		            if (oSelCurrent.selectedIndex != 0) {
		                XmlStr1 += "<CurrentDatailID>" + oSelCurrent.options(oSelCurrent.selectedIndex).value + "</CurrentDatailID>"

		            }
		            XmlStr1 += "<NewDetailID>" + oSelReplace.options(oSelReplace.selectedIndex).value + "</NewDetailID>"



		            //==============================Get Member
		            var tempUserFlag = ""
		            var XmlStr = "";
		            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		            xmlDoc.loadXML(document.getElementById("tSelectedMamber").value);
//                    alert(document.getElementById("tSelectedMamber").value)

		            xmlDoc.setProperty("SelectionLanguage", "XPath");
		            var root = "/UserEntity/Person"
		            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
		            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1]");
//		            alert(xmlNodes.length)
//                   alert(tempUserFlag)
		            if (xmlNodes.length > 0) {
		                for (var x = 0; x < xmlNodes.length; x++) {
		                    XmlStr += XmlStr1
//		              						XmlStr+="<Member>"
		                    XmlStr += "<MemberID>" + xmlNodes.item(x).selectSingleNode('PersonID').text + "</MemberID>"
		                    XmlStr += "<MemberName>" + xmlNodes.item(x).selectSingleNode('Family').text + "</MemberName>"
		                    tempUserFlag = xmlNodes.item(x).selectSingleNode('UserFlag').text
//                            alert(XmlStr)
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
//		                   						XmlStr += "</Member>"
		                    XmlStr += "</ReplaceDetail>"
//                            alert(XmlStr)
		                }
		            }
		            else {
		                alert('·ÿ›« «⁄÷« —« «‰ Œ«» ò‰Ìœ')
		                return
		            }

		            //==============================Get Member
		            XmlStr += "</OfficeEntity>"

		            document.getElementById("txtXmlSave").value = "<OfficeEntity>" + XmlStr
//	            alert(document.getElementById("txtXmlSave").value)
	            document.getElementById("txtLastRID").value = DID
		            document.getElementById("Form1").submit()

		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }

		    }
		    //============================================================================================
		    function compareTime() {
		        try {
		            var EDate = document.getElementById("EDate_txtYear").value + document.getElementById("EDate_txtMonth").value + document.getElementById("EDate_txtDay").value
		            var SDate = document.getElementById("SDate_txtYear").value + document.getElementById("SDate_txtMonth").value + document.getElementById("SDate_txtDay").value
		            if (EDate < SDate) {
		                alert(' «—ÌŒ Å«Ì«‰ »«Ìœ »“—ê — «“  «—ÌŒ ‘—Ê⁄ »«‘œ')
		                return false
		            }
		            else {
		                return true
		            }
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    //str format in like: 1,2,3,5,
		    function CreateWeeklyDay() {
		        try {
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
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function onclickgrdShift(SelectedRow) {
		        try {
		            //====================
		            if (LastSelectedRow != null) {
		                LastSelectedRow.className = LastSelectedRowClass;
		            }
		            LastSelectedRowClass = SelectedRow.className;
		            LastSelectedRow = SelectedRow;
		            SelectedRow.className = "CssSelectedItemStyle";
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    function ondblclickgrdShift(SelectedRow) {
		        onClickBtnEdit()
		    }
		    //============================================================================================
		    function onClickbtnNew() {
		        try {
		            //document.getElementById("TxtName").value=""
		            document.getElementById("SelCurrent").value = 0
		            document.getElementById("SelReplace").value = 0
		            document.getElementById("chkAll").checked = false
		            Form1.ToatalPage_X.value = 0
		            document.getElementById("CurPage_X").value = 0
		            //----------------------------------------
		            tempDate = document.getElementById("txtServerDate").value

		            document.getElementById("SDate_txtYear").value = tempDate.substr(0, 4)
		            document.getElementById("SDate_txtMonth").value = tempDate.substr(5, 2)
		            document.getElementById("SDate_txtDay").value = tempDate.substr(8, 2)

		            document.getElementById("EDate_txtYear").value = tempDate.substr(0, 4)
		            document.getElementById("EDate_txtMonth").value = tempDate.substr(5, 2)
		            document.getElementById("EDate_txtDay").value = tempDate.substr(8, 2)
		            Form1.tSelectedMamber.value = ""
		            //---------------------------------------

		            document.all.item("SelShift").selectedIndex = 0
		            clearGrid(document.getElementById("GrdValidUser"))
		            ClearWeeklyDay()
		            document.getElementById("DownRow").style.display = "inline"
		            document.getElementById("TopRow").style.display = "none"
		            document.getElementById("txtMode").value = "New"
		        }
		        catch (e) {
		            alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        }
		    }
		    //============================================================================================
		    function onClickBtnCancel() {
		        document.getElementById("DownRow").style.display = "none"
		        document.getElementById("TopRow").style.display = "inline"

		    }
		    //============================================================================================
		    function SelectAllChk_Onclick(oGrid, obj) {
		        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("tSelectedMamber").value);
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
		        document.getElementById("tSelectedMamber").value = xmlDoc.xml
		    }

		    //============================================================================================
		    function onClickBtnSelectPerson() {
		        //try
		        //{
		        var strOptions = ""
		        var url
		        //				if(document.getElementById("ChkWork").checked==true)
		        //				{
		        //					document.getElementById("txtUserFlag").value="W"
		        //					url="WorkSchedule.aspx"	
		        //					strOptions="dialogHeight: 455px;dialogWidth:370px;center: Yes;help: no;status: no"
		        //				}
		        //	else 
		        //                if(document.getElementById("ChkShift").checked==true)
		        //				{
		        //					document.getElementById("txtUserFlag").value="S"
		        //					url="../BaseInfo/ValidGroupWithFilter.aspx?CategoryId=2"	
		        //					strOptions="dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no"

		        //				}
		        //	else 
		        
		        if (document.getElementById("ChkTabl").checked == true) {
		            document.getElementById("txtUserFlag").value = "T"
		            //		            url = "GetTableOffice.aspx"
		           
		            url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value + "&CompanyPeriodID=" + Form1.txtGetCompanyFinatialPeriodID.value + "&OnLineUser=" + Form1.txtUserID.value
		            strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkPersonelGroup").checked == true) {
		           document.getElementById("txtUserFlag").value = "G"
		           		          //	  url = "../BaseInfo/ValidGroupWithFilter.aspx?CategoryId=1"
	            url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value;
		            strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkPersonel").checked == true) {
		            document.getElementById("txtUserFlag").value = "P"
		            //		            url = "../Person/PersonTab.aspx" + "?SessionID=" + Form1.txtSessionID.value
		            url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value;
		            strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
		        }
		        else if (document.getElementById("ChkRole").checked == true) {
		            //		            url = "../BaseInfo/Role.aspx" + "?SessionID=" + Form1.txtSessionID.value
		            url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + Form1.txtSessionID.value
		            strOptions = "dialogHeight: 620px;dialogWidth:720px;center: Yes;help: no;status: no"
		            document.getElementById("txtUserFlag").value = "R"
		        }
		        else {
		            return
		        }
		        //------------------------------------------------------------

		        if (url != "" ) {
          
		            document.getElementById("txtSelectedMamber").value = window.showModalDialog(url, "", strOptions)
		            if ((document.getElementById("txtUserFlag").value == "R")) {
		                if (document.getElementById("txtSelectedMamber").value != undefined)
		                    document.getElementById("txtSelectedMamber").value = document.getElementById("txtSelectedMamber").value.substring(3, document.getElementById("txtSelectedMamber").value.length)
		            }
		               
		            var strSelectedMamber=""
		            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
		            oXmlDocSave.loadXML(document.getElementById("txtSelectedMamber").value);

                   
                    if (document.getElementById("txtSelectedMamber").value != "undefined" && document.getElementById("txtSelectedMamber").value != "" && document.getElementById("txtSelectedMamber").value != null && document.getElementById("txtSelectedMamber").value != "efined") {
		                var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/Tb");

		                switch (document.getElementById("txtUserFlag").value) {

		                    case 'P':
		                        for (i = 0; i < XmlNodeTmp.length; i++) {
		                            strSelectedMamber += "<Person>";
		                            strSelectedMamber += "<PersonID>" + XmlNodeTmp.item(i).selectSingleNode('PID').text + "</PersonID>"
		                            strSelectedMamber += "<Family>" + XmlNodeTmp.item(i).selectSingleNode('PName').text + "</Family>"
		                            strSelectedMamber += "<UserFlag>" + document.getElementById("txtUserFlag").value + "</UserFlag>"
		                            strSelectedMamber += "<Selected>1</Selected>"
		                            strSelectedMamber += "</Person>"

		                        }
		                        break
		                    case 'G':
		                        for (i = 0; i < XmlNodeTmp.length; i++) {
		                            strSelectedMamber += "<Person>";
		                            strSelectedMamber += "<PersonID>" + XmlNodeTmp.item(i).selectSingleNode('GroupId').text + "</PersonID>"
		                            strSelectedMamber += "<Family>" + XmlNodeTmp.item(i).selectSingleNode('GroupName').text + "</Family>"
		                            strSelectedMamber += "<UserFlag>" + document.getElementById("txtUserFlag").value + "</UserFlag>"
		                            strSelectedMamber += "<Selected>1</Selected>"
		                            strSelectedMamber += "</Person>"

		                            //                                alert(strSelectedMamber)
		                        }
		                        break

		                    case 'R':
		                        for (i = 0; i < XmlNodeTmp.length; i++) {
		                            strSelectedMamber += "<Person>";
		                            strSelectedMamber += "<PersonID>" + XmlNodeTmp.item(i).selectSingleNode('DID').text + "</PersonID>"
		                            strSelectedMamber += "<Family>" + XmlNodeTmp.item(i).selectSingleNode('DName').text + "</Family>"
		                            strSelectedMamber += "<UserFlag>" + document.getElementById("txtUserFlag").value + "</UserFlag>"
		                            strSelectedMamber += "<Selected>1</Selected>"
		                            strSelectedMamber += "</Person>"

		                        }
		                        break


		                    case 'T':
		                        for (i = 0; i < XmlNodeTmp.length; i++) {
		                            strSelectedMamber += "<Person>";
		                            strSelectedMamber += "<PersonID>" + XmlNodeTmp.item(i).selectSingleNode('TID').text + "</PersonID>"
		                            strSelectedMamber += "<Family>" + XmlNodeTmp.item(i).selectSingleNode('TName').text + "</Family>"
		                            strSelectedMamber += "<UserFlag>" + document.getElementById("txtUserFlag").value + "</UserFlag>"
		                            strSelectedMamber += "<Selected>1</Selected>"
		                            strSelectedMamber += "</Person>"


		                        }
		                        break
		                }
		            }
		       

		            document.getElementById("txtSelectedMamber").value = strSelectedMamber
//                    alert( document.getElementById("txtSelectedMamber").value)
		            url = ""
		        }
		        if (document.getElementById("txtSelectedMamber").value != '') {

		            if (document.getElementById("GrdValidUser").rows.length > 0) {
		                if (confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø')) {
		                    Cleargrd(GrdValidUser)
		                    document.getElementById("tSelectedMamber").value = ''
		                }
		            }

		            //===============
		            switch (document.getElementById("txtUserFlag").value) {
		                case "P":
		                    document.getElementById("txtSelectedMamber").value = GetDataPerson()
		                    break;
		                case "T":
		                    document.getElementById("txtSelectedMamber").value = GetTableOffice()
		                    break
		                case "W":
		                    document.getElementById("txtSelectedMamber").value = GetWorkSchedule()
		                    break
		                case 'R':
		                    document.getElementById("txtSelectedMamber").value = GetDataRole()
		                    break
		                case 'G':
		                    document.getElementById("txtSelectedMamber").value = GetDataGroup()
		                    break

		                default: //'S'
		                    document.getElementById("txtSelectedMamber").value = GetDataGroup()
		            }
		            //===============
		            if (document.getElementById("txtSelectedMamber").value != "") {
		                document.getElementById("txtValidUserXml").value = document.getElementById("txtSelectedMamber").value
		                //alert(document.getElementById("tSelectedMamber").value)
		                XTableInitialize(GrdValidUser)
		            }

		        }
		        //}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}
		    }

		    //============================================================================================
		    function GetTableOffice() {
		        //try
		        //{
//		        var Username = '';
//		        var SUsername = '';
//		        if (Form1.tSelectedMamber.value == "")
//		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

//		        xmlDoc = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc.loadXML(document.getElementById("txtSelectedMamber").value);
//		        xmlDoc.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes = xmlDoc.documentElement.selectNodes("/OfficeEntity/GetOfficeTable[selected=1]");

//		        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc2.loadXML(Form1.tSelectedMamber.value);
//		        xmlDoc2.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes2, strSelectedMamber = ""

//		        if (xmlNodes.length > 0) {
//		            for (var x = 0; x < xmlNodes.length; x++) {
//		                xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('TableOfficeId').text + " and UserFlag='T']");
//		                if (xmlNodes2.length == 0) {
//		                    strSelectedMamber += '<Person>'
//		                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('TableOfficeId').text + '</PersonID>'
//		                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('BTableOfficeName').text + '</Family>'
//		                    strSelectedMamber += '<UserFlag>' + document.getElementById("txtUserFlag").value + '</UserFlag>'
//		                    strSelectedMamber += '<Selected>1</Selected>'
//		                    strSelectedMamber += '</Person>'
//		                }
//		            }

//		        }
//		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)
//		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
//		        return (strSelectedMamber)





		        var strSelectedMamber = document.getElementById("txtSelectedMamber").value
		        strSelectedMamber = strSelectedMamber.replace("<UserEntity>", "")
		        strSelectedMamber = strSelectedMamber.replace("</UserEntity>", "")

		        if (Form1.tSelectedMamber.value == "")
		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'

		        return (strSelectedMamber)




		        //}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}	
		    }
		    //============================================================================================
		    function GetDataPerson() {
		        ////try
		        //{
		        /*var Username='';
		        var SUsername='';			
		        xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("txtSelectedMamber").value);
		        xmlDoc.setProperty("SelectionLanguage", "XPath");
		        var xmlNodes;
		        xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/Person[Selected=1]");
				
		        var strSelectedMamber
		        if(Form1.tSelectedMamber.value=="")
		        Form1.tSelectedMamber.value="<BaseInfoEntity></BaseInfoEntity>"
				
		        xmlDoc2 = new ActiveXObject("MsXml2.DomDocument")
		        xmlDoc2.loadXML(document.getElementById("tSelectedMamber").value)
		        xmlDoc2.setProperty("SelectionLanguage", "XPath")
		        var xmlNodes2;
				
		        if(xmlNodes.length!=0)
		        {
		        for(x=0;x<xmlNodes.length;x++)
		        {
		        xmlNodes2=xmlDoc2.documentElement.selectNodes("/BaseInfoEntity/GetValidTypeForUser[UserID="+xmlNodes.item(x).selectSingleNode('PersonID').text+" and UserFlag='P']")// and TypeCreditID="+parseInt(Form1.txtTypeCreditID.value)+"]");
						
		        if (xmlNodes2.length==0)
		        {
		        Username=xmlNodes.item(x).selectSingleNode('Family').text
						
		        if (Username.length>25)
		        {
		        SUsername=Username.substr(0,25)+"..."
		        }
		        else
		        {
		        SUsername=Username
		        }
		        strSelectedMamber+='<GetValidTypeForUser>'
		        strSelectedMamber+='<ID>0</ID>'
		        strSelectedMamber+='<UserFlag>'+document.getElementById("txtUserFlag").value+'</UserFlag>'
		        strSelectedMamber+='<UserID>'+xmlNodes.item(x).selectSingleNode('PersonID').text+'</UserID>'
		        strSelectedMamber+='<Username>'+Username+'</Username>'
		        strSelectedMamber+='<UserPersonID>'+xmlNodes.item(x).selectSingleNode('PersonID').text+'</UserPersonID>'
		        strSelectedMamber+='<SUsername>'+SUsername+'</SUsername>'	
		        strSelectedMamber+='</GetValidTypeForUser>'
		        }
		        }
		        }*/
		        var strSelectedMamber = document.getElementById("txtSelectedMamber").value
		        strSelectedMamber = strSelectedMamber.replace("<UserEntity>", "")
		        strSelectedMamber = strSelectedMamber.replace("</UserEntity>", "")

		        if (Form1.tSelectedMamber.value == "")
		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'

		        return (strSelectedMamber)
		        //}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}
		    }
		    //====================================================================================
		    function GetWorkSchedule() {
		        //try
		        //{	
		        var Username = '';
		        var SUsername = '';
		        xmlDoc = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc.loadXML(document.getElementById("txtSelectedMamber").value);
		        xmlDoc.setProperty("SelectionLanguage", "XPath");
		        var xmlNodes;
		        xmlNodes = xmlDoc.documentElement.selectNodes("/ShiftEntity/GetWorkSchedule[selected=1]");

		        if (Form1.tSelectedMamber.value == "")
		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

		        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
		        xmlDoc2.loadXML(Form1.tSelectedMamber.value);
		        xmlDoc2.setProperty("SelectionLanguage", "XPath");
		        var xmlNodes2, strSelectedMamber = ""

		        if (xmlNodes.length > 0) {
		            for (var x = 0; x < xmlNodes.length; x++) {
		                xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('ScheduleID').text + " and UserFlag='W']");

		                if (xmlNodes2.length == 0) {
		                    strSelectedMamber += '<Person>'
		                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('ScheduleID').text + '</PersonID>'
		                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('Name').text + '</Family>'
		                    strSelectedMamber += '<UserFlag>' + document.getElementById("txtUserFlag").value + '</UserFlag>'
		                    strSelectedMamber += '<Selected>1</Selected>'
		                    strSelectedMamber += '</Person>'
		                }
		            }
		        }
		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
		        return (strSelectedMamber)
		        //	}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}
		    }
		    //===================================================================================
		    function GetDataGroup() {
		        //try
		        //{
//		        var Username = '', SUsername = ''

//		        xmlDoc = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc.loadXML(document.getElementById("txtSelectedMamber").value);
//		        xmlDoc.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetGroup[Selected=1]");

//		        if (Form1.tSelectedMamber.value == "")
//		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

//		        var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
//		        xmlDoc2.loadXML(Form1.tSelectedMamber.value);
//		        xmlDoc2.setProperty("SelectionLanguage", "XPath");
//		        var xmlNodes2, strSelectedMamber = ''

//		        if (xmlNodes.length != 0) {
//		            for (x = 0; x < xmlNodes.length; x++) {
//		                xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('GroupID').text
//						+ " and UserFlag='" + document.getElementById("txtUserFlag").value + "']");
//		                if (xmlNodes2.length == 0) {
//		                    strSelectedMamber += '<Person>'
//		                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('GroupID').text + '</PersonID>'
//		                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('Groupname').text + '</Family>'
//		                    strSelectedMamber += '<UserFlag>' + document.getElementById("txtUserFlag").value + '</UserFlag>'
//		                    strSelectedMamber += '<Selected>1</Selected>'
//		                    strSelectedMamber += '</Person>'
//		                }
//		            }
//		        }

//		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

//		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
//		        return (strSelectedMamber)




		        var strSelectedMamber = document.getElementById("txtSelectedMamber").value
		        strSelectedMamber = strSelectedMamber.replace("<UserEntity>", "")
		        strSelectedMamber = strSelectedMamber.replace("</UserEntity>", "")

		        if (Form1.tSelectedMamber.value == "")
		            Form1.tSelectedMamber.value = "<UserEntity></UserEntity>"

		        Form1.tSelectedMamber.value = Form1.tSelectedMamber.value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

		        strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'

		        return (strSelectedMamber)




		        //	}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}
		    }
		    //============================================================================================
		    function ExistsRow(oGrid, Name, ID) {
		        Name = Name.substr(Name, 25)
		        var RowId
		        var RowName
		        var GrdSub = oGrid
		        var rIndex = newrowindex

		        for (var j = 0; j < rIndex; j++) {
		            RowId = GrdSub.rows(j).UserID
		            RowName = GrdSub.rows(j).cells(2).innerText
		            if (RowId == ID && RowName == Name) {
		                return true
		            }
		        }
		        return false
		    }
		    //============================================================================================
		    function AddRow(oGrid, UserFlag, UserID, Username, SUsername, Selected) {
		        //try
		        //{
		        //oGrid="GrdValidUser"
		        oGrid.insertRow()
		        oGrid.rows(newrowindex).className = "XItemStyle";

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
		                tempSrc = "../../../Includes/Images/Icons/Personel.gif"
		                picTitle = 'Å—”‰·'
		                break
		            case "G":
		                tempSrc = "../../../Includes/Images/Icons/PGroup.gif"
		                picTitle = "'ê—ÊÂ Å—”‰·Ì'"
		                break
		            case "S":
		                tempSrc = "../../../Includes/Images/Icons/time.gif"
		                picTitle = "'‘Ì› '"
		                break
		            case "T":
		                tempSrc = "../../../Includes/Images/Icons/protectandshareworkbook.gif"
		                picTitle = "'œ› —  «»·'"
		                break
		            case "W":
		                tempSrc = "../../../Includes/Images/Icons/Group.gif"
		                picTitle = "'»—‰«„Â ò«—Ì'"
		                break
		            case "R":
		                tempSrc = "'../../../Includes/Images/Icons/u7.gif'"
		                picTitle = "'Ê«Õœ ”«“„«‰Ì'"
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
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}

		    }
		    //============================================================================================
		    function Cleargrd(obj) {
		        var j = obj.rows.length - 1
		        for (; j >= 0; --j)
		            obj.deleteRow(j)
		        newrowindex = 0
		    }
		    //============================================================================================
		    function BindGrid(strMember, oGrid) {
		        if (strMember == "")
		            return
		        var oName = ''
		        clearGrid(oGrid)
		        var root = ''
		        if (oGrid == document.getElementById("GrdUserSimple"))
		            root = "/ShiftEntity/Member"
		        else
		            root = "/OfficeEntity/Member"

		        var tempUserFlag = ""
		        var Type = ""
		        var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
		        xmlDoc.async = "false"
		        xmlDoc.loadXML(strMember)
		        var XmlNodes = xmlDoc.documentElement.selectNodes(root)
		        var strSelectedMamber = ""

		        if (XmlNodes.length > 0) {
		            for (var i = 0; i < XmlNodes.length; i++) {
		                oName = XmlNodes.item(i).selectSingleNode('MemberName').text
		                Type = XmlNodes.item(i).selectSingleNode('Type').text

		                if (Type == 'S') {
		                    tempUserFlag = "W"
		                }
		                else if (Type == 'G') {
		                    tempUserFlag = "S"
		                }
		                else {
		                    tempUserFlag = Type
		                }

		                strSelectedMamber += '<Person>'
		                strSelectedMamber += '<PersonID>' + XmlNodes.item(i).selectSingleNode('MemberID').text + '</PersonID>'
		                strSelectedMamber += '<Family>' + oName + '</Family>'
		                strSelectedMamber += '<UserFlag>' + Type + '</UserFlag>'
		                strSelectedMamber += '<Selected>1</Selected>'
		                strSelectedMamber += '</Person>'

		                //AddRow(oGrid,tempUserFlag,XmlNodes.item(i).selectSingleNode('MemberID').text,oName,oName.substr(oName,20),1)	
		            }
		            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
		            Form1.tSelectedMamber.value = strSelectedMamber
		            XTableInitialize(oGrid)
		        }
		    }
		    //============================================================================================
		    function initPage() {
		        document.all.item("SelShift").selectedIndex = document.getElementById("txtIndex").value
		        if (document.getElementById("txtResult").value == "3" || document.getElementById("txtResult").value == "5") {
		            document.getElementById("txtResult").value = ""
		            if (document.getElementById("txtSaveMode").value == "1") {

		                BindGrid(document.getElementById("txtXmlSave").value, document.getElementById("GrdUserSimple"))
		                document.getElementById("TDlstSelected").innerHTML = ""
		                document.getElementById("TDselDate").innerHTML = ""
		                document.getElementById("TDlstSelected").innerHTML = document.getElementById("txtDetailHTML").value
		                document.getElementById("TDselDate").innerHTML = document.getElementById("txtDateHTML").value

		                document.getElementById("TopRow").style.display = "none"
		                document.getElementById("DownRow").style.display = "none"
		                document.getElementById("DownRowSimpleNew").style.display = "inline"
		            }
		            else {
		                BindGrid(document.getElementById("txtXmlSave").value, document.getElementById("GrdValidUser"))
		                document.getElementById("TopRow").style.display = "none"
		                document.getElementById("DownRow").style.display = "inline"
		                document.getElementById("DownRowSimpleNew").style.display = "none"
		            }

		            if (confirm(document.getElementById("txtAlert").value)) {
		                document.getElementById("txtAlert").value = ""
		                document.getElementById("txtFlagDo").value = 1

		                if (document.getElementById("txtSaveMode").value == "1") {
		                    document.getElementById("txtSubmit").value = "SimpleSave"
		                    document.getElementById("txtMode").value = ""
		                    document.getElementById("txtSaveMode").value = 0
		                    document.getElementById("Form1").submit()
		                }
		                else if (document.getElementById("txtMode").value == "Edit") {
		                    document.getElementById("txtSubmit").value = "Update"
		                    document.getElementById("Form1").submit()
		                }
		                else {
		                    document.getElementById("txtSubmit").value = "Insert"
		                    document.getElementById("Form1").submit()
		                }
		            }
		            else
		                document.getElementById("txtAlert").value = ""
		        }
		        else if (document.getElementById("txtResult").value == "2" || document.getElementById("txtResult").value == "4") {
		            document.getElementById("txtFlagDo").value = 0
		            document.getElementById("txtResult").value = ""
		            if (document.getElementById("txtSaveMode").value == "1") {

		                document.getElementById("txtSaveMode").value = 0
		                document.getElementById("TopRow").style.display = "none"
		                document.getElementById("DownRow").style.display = "none"
		                document.getElementById("DownRowSimpleNew").style.display = "inline"
		                BindGrid(document.getElementById("txtXmlSave").value, document.getElementById("GrdUserSimple"))

		                document.getElementById("TDlstSelected").innerHTML = ""
		                document.getElementById("TDselDate").innerHTML = ""
		                document.getElementById("TDlstSelected").innerHTML = document.getElementById("txtDetailHTML").value
		                document.getElementById("TDselDate").innerHTML = document.getElementById("txtDateHTML").value
		            }
		            else {
		                document.getElementById("TopRow").style.display = "none"
		                document.getElementById("DownRow").style.display = "inline"
		                document.getElementById("DownRowSimpleNew").style.display = "none"
		                BindGrid(document.getElementById("txtXmlSave").value, document.getElementById("GrdValidUser"))

		            }

		            alert(document.getElementById("txtAlert").value)
		            document.getElementById("txtAlert").value = ''
		        }
		        else {
		            document.getElementById("txtFlagDo").value = 0
		        }
		        if (document.getElementById("txtAlert").value != '') {
		            alert(document.getElementById("txtAlert").value)
		            document.getElementById("txtAlert").value = ''
		        }
		    }
		    //============================================================================================
		    function pageLoad() {
		        //try
		        //{	
		        window.name = "ChangeShiftSchedule"
		        Form1.target = window.name

//		    

		        if (Form1.txtModalflag.value == "11") {
		            document.all.item('btnTOPCancel').style.display = 'inline'
		        }
		        //-------------------------

		        document.getElementById("tSelectedMamber").value = ""
		        BindDetailCollection()

		        //Sort
		        var grdName = '<%=request("grdName")%>'
		        var strCells = '<%=request("strCells")%>'
		        var strType = '<%=request("strType")%>'
		        onLoadGrdHeaderForSort(grdName, strCells, strType)

		        initPage()
		        document.getElementById("txtSaveMode").value = 0
		        if (document.getElementById("txtPageAccess").value == "0") {
		            document.getElementById("btnNew").disabled = false//true
		            //					document.getElementById("btnNewSimple").disabled=false
		        }

		        //}
		        //catch(e)
		        //{
		        //alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		        //}
		    }
		    //============================================================================================


        </script>
	</HEAD>
	<body dir="rtl" onclick="onclickBodyForSort('ReplaceDetailSchedule.aspx',grdShift)" bottomMargin="0"
		leftMargin="0" topMargin="0" scroll="yes" onload="pageLoad()" rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" style="WIDTH: 100%; HEIGHT: 100%" cellSpacing="0"
							cellPadding="0" align="center" border="0">
							<tr>
								<td dir="rtl" vAlign="middle" align="center">
									<TABLE id="Table1" dir="rtl" style="WIDTH: 821px; HEIGHT: 426px" cellSpacing="0" cellPadding="0"
										border="0">
										<TR>
											<TD dir="rtl" align="center">
												<TABLE id="Page" dir="rtl" style="WIDTH: 854px; HEIGHT: 404px" cellSpacing="1" cellPadding="1"
													align="center" border="0">
													<TR>
														<TD id="TopRow" style="DISPLAY: inline" vAlign="middle" align="center">
															<TABLE class="CssPage" id="Table4" style="WIDTH: 954px; HEIGHT: 491px" cellSpacing="0"
																cellPadding="0" width="954" align="center" border="0">
																<TR>
																	<TD vAlign="top" align="center">
																		<TABLE id="Tabl10" dir="rtl" style="WIDTH: 960px; HEIGHT: 466px" cellSpacing="2" cellPadding="2"
																			width="960" align="center" border="0">
																			<TR>
																				<TD vAlign="middle" align="center">
																					<TABLE id="Table17" style="WIDTH: 909px; HEIGHT: 400px" height="400" cellSpacing="1" cellPadding="1"
																						width="909" border="0">
																						<TR>
																							<TD style="WIDTH: 50px"></TD>
																							<TD vAlign="top">
																								<TABLE class="CssPage" id="Table11" style="WIDTH: 915px; HEIGHT: 86px" cellSpacing="0"
																									cellPadding="2" width="915" align="center" border="0">
																									<TR>
																										<TD style=" HEIGHT: 39px" vAlign="bottom" align="left">«“  «—ÌŒ:</TD>
																										<TD style=" HEIGHT: 39px" vAlign="bottom" align="right"><uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
																										<TD style=" HEIGHT: 39px" vAlign="bottom" align="left"> «  «—ÌŒ:</TD>
																										<TD style=" HEIGHT: 39px" vAlign="bottom" align="right"><uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>
																										<TD style= "HEIGHT: 39px" vAlign="bottom" align="left">”«Œ «— Ã«—Ì:</TD>
																										<TD style="HEIGHT: 39px" vAlign="bottom" align="right"><cc1:lcombo id="selCurrentTopRow" runat="server" DataValueField="DetailCollectionID" DataTextField="Name"
																												ConnectionName="GenCnn" Width="137px" CssClass="txtControls"></cc1:lcombo></TD>
																										<TD style="HEIGHT: 39px" vAlign="bottom" align="right">”«Œ «— Ã«Ìê“Ì‰:</TD>
																										<TD style="HEIGHT: 39px" vAlign="bottom" align="right"><cc1:lcombo id="selReplaceTopRow" runat="server" DataValueField="DetailCollectionID" DataTextField="Name"
																												Width="137" CssClass="txtControls"></cc1:lcombo></TD>
																									</TR>
																									<TR>
																										<TD align="left">‘„«—Â Å—”‰·Ì:</TD>
																										<TD ><INPUT class="txtControls"  id="txtPersonID" onblur="onBlurTxtPersonID()"
																												style=" HEIGHT: 22px" size="11" name="txtPersonID" runat="server"></TD>
																										<TD  align="left">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ:</TD>
																										<TD ><cc1:lcombo id="cmbName" onblur="onChangeCmbName()" runat="server" ConnectionName="GenCnn" Width="132px"
																												CssClass="txtControls" onchange="onChangeCmbName()"></cc1:lcombo></TD>
																										<TD style=""></TD>
																										<TD></TD>
																										<TD align="left" colSpan="2"><INPUT class="CssBtnLimitSerach" id="btnSearch" title="‰„«Ì‘ „ÕœÊœ" style="WIDTH: 96px; HEIGHT: 32px; CURSOR: hand"
																												onclick="onClickBtnSearch()" type="button" name="btnSearch"><INPUT class="CssBtnShow" id="btnShow" style="CURSOR: hand" type="button" name="btnShow"
																												runat="server"></TD>
																									</TR>
																								</TABLE>
																								<TABLE id="Table16" style="WIDTH: 257px; HEIGHT: 40px" cellSpacing="1" cellPadding="1"
																									align="center" border="0">
																									<TR>
																										<TD><asp:button id="LastBtn1" runat="server" Width="39px" CssClass="CssLastPage" ToolTip="¬Œ—Ì‰"
																												BorderColor="Transparent" BorderStyle="None" BackColor="Transparent" Height="31px"></asp:button></TD>
																										<TD align="right"><asp:button id="NextBtn1" runat="server" Width="42px" CssClass="CssNextPage" ToolTip="»⁄œÌ"
																												BorderColor="Transparent" BorderStyle="None" BackColor="Transparent" Height="26px"></asp:button></TD>
																										<TD style="WIDTH: 35px" vAlign="middle" align="right"><asp:textbox id="CurPage1" tabIndex="1" runat="server" Width="40px" CssClass="txtControls" BorderStyle="Groove"
																												Height="20px" AutoPostBack="True"></asp:textbox></TD>
																										<TD dir="rtl" vAlign="middle" align="center">«“</TD>
																										<TD style="WIDTH: 40px" vAlign="middle" align="left"><asp:textbox id="Totalpage1" runat="server" Width="40px" CssClass="txtControls" BorderStyle="Groove"
																												BackColor="White" Height="20px" ReadOnly="True"></asp:textbox></TD>
																										<TD style="WIDTH: 39px"><asp:button id="PrevBtn1" runat="server" Width="33px" CssClass="CssPrevPage" ToolTip="ﬁ»·Ì"
																												BorderColor="Transparent" BorderStyle="None" BackColor="Transparent" Height="27px"></asp:button></TD>
																										<TD><asp:button id="FirstBtn1" runat="server" Width="34px" CssClass="CssFirstPage" ToolTip="«Ê·Ì‰"
																												BorderColor="Transparent" BorderStyle="None" BackColor="Transparent" Height="31px"></asp:button></TD>
																										<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" name="txtReturnMessage1" runat="server">
																											<asp:button id="Button1" style="DISPLAY: none" runat="server" Width="1px" Text="Button"></asp:button><asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
																									</TR>
																								</TABLE>
																								<cc1:automationgrid id="grdShift" dir="rtl" runat="server" Width="882px" Height="350px" SelectRowOnMouseMove="False"
																									SelectRowOnClick="True" HtcAddress=" " ClientPageSize="0" SendXML="DoNotSend" CreateClientSideScripts="False"
																									ClientSorting="False" EnableClientPager="False" Scrolling="True" UsingKeyBoard="False" ShowHeader="False"
																									AutoGenerateColumns="False" name="grdNumResult">
																									<ITEMSTYLE CssClass="CssItemStyle" VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="tahoma"
																										Font-Size="8.5pt"></ITEMSTYLE>
																									<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="tahoma"
																										Font-Size="8.5pt" Font-Bold="True"></HEADERSTYLE>
																									<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle" HorizontalAlign="Center" Font-Names="tahoma"
																										Font-Size="8.5pt"></ALTERNATINGITEMSTYLE>
																									<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																									<EDITITEMSTYLE VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="tahoma" Font-Size="8.5pt"></EDITITEMSTYLE>
																									<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle" HorizontalAlign="Center" Font-Names="tahoma" Font-Size="8.5pt"></SELECTEDITEMSTYLE>
																									<COLUMNS>
																										<ASP:BOUNDCOLUMN HeaderText="RDId" DataField="ReplaceDetailID" Visible="False">
																											<HEADERSTYLE Width="1px" HorizontalAlign="Center"></HEADERSTYLE>
																											<ITEMSTYLE Width="1px"></ITEMSTYLE>
																										</ASP:BOUNDCOLUMN>
																										<ASP:BOUNDCOLUMN HeaderText="MemberID" DataField="MemberID" Visible="False">
																											<HEADERSTYLE Width="1px"></HEADERSTYLE>
																											<ITEMSTYLE Width="1px"></ITEMSTYLE>
																										</ASP:BOUNDCOLUMN>
																										<ASP:TEMPLATECOLUMN HeaderText="«⁄÷«">
																											<HEADERSTYLE Width="150px"></HEADERSTYLE>
																											<ITEMSTYLE Width="150px"></ITEMSTYLE>
																											<ITEMTEMPLATE>
																												<asp:Label id=Label5 title='<%# DataBinder.Eval(Container, "DataItem.MemberName") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.SMemberName") %>'>
																												</asp:Label>
																											</ITEMTEMPLATE>
																										</ASP:TEMPLATECOLUMN>
																										<ASP:TEMPLATECOLUMN HeaderText="‰«„  €ÌÌ—" Visible="False">
																											<HEADERSTYLE Width="100px"></HEADERSTYLE>
																											<ITEMSTYLE Width="100px"></ITEMSTYLE>
																											<ITEMTEMPLATE>
																												<asp:Label id=Label1 title='<%# DataBinder.Eval(Container, "DataItem.ReplaceDetailName") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.SReplaceDetailName") %>'>
																												</asp:Label>
																											</ITEMTEMPLATE>
																										</ASP:TEMPLATECOLUMN>
																										<ASP:BOUNDCOLUMN HeaderText="«“  «—ÌŒ" DataField="StartDate">
																											<HEADERSTYLE Width="70px"></HEADERSTYLE>
																											<ITEMSTYLE Width="70px"></ITEMSTYLE>
																										</ASP:BOUNDCOLUMN>
																										<ASP:BOUNDCOLUMN HeaderText=" «  «—ÌŒ" DataField="EndDate">
																											<HEADERSTYLE Width="70px"></HEADERSTYLE>
																											<ITEMSTYLE Width="70px"></ITEMSTYLE>
																										</ASP:BOUNDCOLUMN>
																										<ASP:TEMPLATECOLUMN HeaderText="—Ê“Â«Ì Â› Â">
																											<HEADERSTYLE Width="120px"></HEADERSTYLE>
																											<ITEMSTYLE Width="120px"></ITEMSTYLE>
																											<ITEMTEMPLATE>
																												<asp:Label id=Label2 title='<%# DataBinder.Eval(Container, "DataItem.WeeklyDayStr") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.SWeeklyDayStr") %>'>
																												</asp:Label>
																											</ITEMTEMPLATE>
																										</ASP:TEMPLATECOLUMN>
																										<ASP:BOUNDCOLUMN HeaderText="—Ê“ ç—ŒÂ ‘Ì› " DataField="ShiftCycleDayNo">
																											<HEADERSTYLE Width="90px"></HEADERSTYLE>
																											<ITEMSTYLE Width="90px"></ITEMSTYLE>
																										</ASP:BOUNDCOLUMN>
																										<ASP:TEMPLATECOLUMN HeaderText="”«Œ «— Ã«—Ì">
																											<HEADERSTYLE Width="140px"></HEADERSTYLE>
																											<ITEMSTYLE Width="140px"></ITEMSTYLE>
																											<ITEMTEMPLATE>
																												<asp:Label id=Label3 title='<%# DataBinder.Eval(Container, "DataItem.CurrentDatailName") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.SCurrentDatailName") %>'>
																												</asp:Label>
																											</ITEMTEMPLATE>
																										</ASP:TEMPLATECOLUMN>
																										<ASP:TEMPLATECOLUMN HeaderText="”«Œ «— Ã«Ìê“Ì‰">
																											<HEADERSTYLE Width="140px"></HEADERSTYLE>
																											<ITEMSTYLE Width="140px"></ITEMSTYLE>
																											<ITEMTEMPLATE>
																												<asp:Label id=Label4 title='<%# DataBinder.Eval(Container, "DataItem.NewDetailName") %>' runat="server" Width="100%" Text='<%# DataBinder.Eval(Container, "DataItem.SNewDetailName") %>'>
																												</asp:Label>
																											</ITEMTEMPLATE>
																										</ASP:TEMPLATECOLUMN>
																									</COLUMNS>
																								</cc1:automationgrid></TD>
																						</TR>
																					</TABLE>
																					<HR style="WIDTH: 585px; HEIGHT: 1px; COLOR: black" align="center" SIZE="1">
																					<TABLE id="Table12" style="WIDTH: 191px; HEIGHT: 34px" cellSpacing="3" cellPadding="2"
																						width="191" align="center" border="0">
																						<TR>
																							<%--<TD align="center"><INPUT class="CssBtnNew" id="btnNewSimple" title="«ÌÃ«œ œ” Â «Ì" style="CURSOR: hand" onclick="onClickBtnNewSimple()"
																									type="button" name="btnNewSimple"></TD>--%>
																							<TD align="center"><INPUT class="CssBtnNew" id="btnNew" title="«ÌÃ«œ" style="CURSOR: hand" onclick="onClickbtnNew()"
																									type="button" name="btnNew"></TD>
																							<TD align="center"><INPUT class="CssBtnEdit" id="btnEdit" title="«’·«Õ" style="CURSOR: hand" onclick="onClickBtnEdit()"
																									type="button" name="btnEdit"></TD>
																							<TD align="center"><INPUT class="CssBtnDelete" id="btnDelete" title="Õ–›" style="CURSOR: hand" onclick="onClickBtnDelete()"
																									type="button" name="btnDelete"></TD>
																							<TD align="center"><INPUT class="CssBtnCancel" id="btnTOPCancel" style="DISPLAY: none; CURSOR: hand" onclick="OnClickbtnTOPCancel()"
																									type="button" name="btnTOPCancel"></TD>
																						</TR>
																					</TABLE>
																				</TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD id="DownRow" dir="rtl" style="DISPLAY: none" vAlign="top" align="center">
															<TABLE class="CssPage" id="Table2" style="WIDTH: 636px; HEIGHT: 510px" cellSpacing="0"
																cellPadding="0" width="636" border="0">
																<TR>
																	<TD dir="rtl" style="HEIGHT: 425px" vAlign="top" align="center">
																		<TABLE id="Table6" style="WIDTH: 474px; HEIGHT: 2px" cellSpacing="0" cellPadding="0" width="474"
																			align="center">
																			<TR>
																				<TD vAlign="top" align="right">
																					<TABLE id="Table3" style="WIDTH: 454px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="454"
																						border="0">
																					</TABLE>
																					<TABLE id="Table9" cellSpacing="0" cellPadding="1" width="100%" border="0">
																					</TABLE>
																					<TABLE id="Table7" style="WIDTH: 461px; HEIGHT: 64px" cellSpacing="0" cellPadding="1" width="461"
																						border="0">
																						<TR>
																							<TD align="left">«“  «—ÌŒ:</TD>
																							<TD align="right"><uc1:textdate id="SDate" runat="server"></uc1:textdate></TD>
																							<TD align="left"> «  «—ÌŒ:</TD>
																							<TD align="right"><uc1:textdate id="EDate" runat="server"></uc1:textdate></TD>
																						</TR>
																						<TR>
																							<TD>”«Œ «— Ã«—Ì:</TD>
																							<TD><cc1:lcombo id="SelCurrent" runat="server" DataValueField="DetailCollectionID" DataTextField="Name"
																									Width="153px" CssClass="txtControls"></cc1:lcombo></TD>
																							<TD>”«Œ «— Ã«Ìê“Ì‰:</TD>
																							<TD><cc1:lcombo id="SelReplace" runat="server" DataValueField="DetailCollectionID" DataTextField="Name"
																									Width="153" CssClass="txtControls"></cc1:lcombo></TD>
																						</TR>
																					</TABLE>
																				</TD>
																			</TR>
																		</TABLE>
																		<TABLE id="Table8" style="WIDTH: 630px; HEIGHT: 306px" cellSpacing="0" cellPadding="0"
																			width="630" align="center" border="0">
																			<TR>
																				<TD style="WIDTH: 445px; HEIGHT: 306px" vAlign="top" align="right">
																					<FIELDSET class="CssPage" dir="rtl" style="WIDTH: 436px; HEIGHT: 298px" align="middle"><LEGEND style="WIDTH: 30px">«⁄÷«</LEGEND>
																						<TABLE id="Table10" style="WIDTH: 425px; HEIGHT: 87.06%" cellSpacing="0" cellPadding="0"
																							width="425" align="center" border="0">
																							<TR>
																								<TD style="WIDTH: 129px; HEIGHT: 219px" vAlign="top" align="center">
																									<TABLE id="Table13" style="WIDTH: 114px; HEIGHT: 139px" cellSpacing="1" cellPadding="1"
																										width="114" border="0">
																										<TR>
																											<TD style="WIDTH: 22px; HEIGHT: 32px" align="center"></TD>
																											<TD style="HEIGHT: 32px"></TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px; HEIGHT: 22px" align="center"><INPUT id="ChkRole" type="radio" value="ChkWork" name="GroupChk"></TD>
																											<TD style="HEIGHT: 22px">Ê«Õœ ”«“„«‰Ì
																											</TD>
																										</TR>
																										<%--<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkWork" type="radio" value="ChkWork" name="GroupChk"></TD>
																											<TD>»—‰«„Â&nbsp;ò«—Ì</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkShift" type="radio" value="ChkShift" name="GroupChk"></TD>
																											<TD>ê—ÊÂ ‘Ì› </TD>
																										</TR>--%>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkTabl" type="radio" value="ChkTabl" name="GroupChk"></TD>
																											<TD>œ› —  «»·</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkPersonelGroup" type="radio" value="ChkPersonelGroup" name="GroupChk"></TD>
																											<TD>ê—ÊÂ Å—”‰·Ì</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkPersonel" type="radio" value="ChkPersonel" name="GroupChk"></TD>
																											<TD>Å—”‰·</TD>
																										</TR>
																									</TABLE>
																									<INPUT class="btnSelectPerson" id="BtnSelectPerson" title="«‰ Œ«» «⁄÷«Ì ê—ÊÂ" style="WIDTH: 125px; HEIGHT: 32px; CURSOR: hand"
																										onclick="onClickBtnSelectPerson()" type="button" name="BtnSelectPerson">
																								</TD>
																								<TD style="HEIGHT: 219px" vAlign="top" align="center">
																									<TABLE id="Table27" style="WIDTH: 280px; HEIGHT: 14px" height="14" cellSpacing="1" cellPadding="1"
																										align="center" border="0">
																										<TR>
																											<TD align="right"><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick(1)"
																													type="button" name="LastBtn_X"></TD>
																											<TD align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick(1)"
																													type="button" name="NextBtn_X"></TD>
																											<TD vAlign="middle" align="right"><INPUT id="CurPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																													onchange="CurPage_XTextChanged(1)" name="CurPage_X"></TD>
																											<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
																											<TD vAlign="middle"><INPUT id="ToatalPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																													size="6" name="ToatalPage_X"></TD>
																											<TD><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick(1)"
																													type="button" name="PrevBtn_X"></TD>
																											<TD><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick(1)"
																													type="button" name="FirstBtn_X"></TD>
																											<TD style="DISPLAY: none"></TD>
																										</TR>
																									</TABLE>
																									<TABLE id="XTabTable_Header" style="WIDTH: 255px; HEIGHT: 35px">
																										<THEAD style="DISPLAY: inline">
																											<TR class="ShoperHeaderStyle">
																												<TD class="Headerstyle" style="WIDTH: 3px" align="center"><INPUT id="chkAll" onclick="SelectAllChk_Onclick(GrdValidUser,this)" type="checkbox" CHECKED
																														name="chkAll"></TD>
																												<TD class="Headerstyle" align="center">‰«„
																												</TD>
																											</TR>
																										</THEAD>
																									</TABLE>
																									<DIV class="DivStyle" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 255px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 78.9%; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto">
																										<TABLE id="GrdValidUser">
																											<THEAD style="DISPLAY: none">
																											</THEAD>
																										</TABLE>
																									</DIV>
																								</TD>
																							</TR>
																						</TABLE>
																					</FIELDSET>
																				</TD>
																				<TD dir="rtl" style="HEIGHT: 306px" vAlign="top" align="right">
																					<FIELDSET class="CssPage" dir="rtl" style="WIDTH: 177px; HEIGHT: 112px" align="middle"><LEGEND>—Ê“ 
																							Â› Â</LEGEND>
																						<TABLE id="Table15" style="WIDTH: 160px; HEIGHT: 84px" cellSpacing="0" cellPadding="0"
																							width="160" border="0">
																							<TR>
																								<TD align="left"><INPUT id="Chk0" type="checkbox" runat="server"></TD>
																								<TD align="right">‘‰»Â</TD>
																								<TD align="left"><INPUT id="Chk1" type="checkbox" runat="server"></TD>
																								<TD align="right">Ìò‘‰»Â</TD>
																							</TR>
																							<TR>
																								<TD align="left"><INPUT id="Chk2" type="checkbox" runat="server"></TD>
																								<TD align="right">œÊ‘‰»Â</TD>
																								<TD align="left"><INPUT id="Chk3" type="checkbox" runat="server"></TD>
																								<TD align="right">”Â ‘‰»Â</TD>
																							</TR>
																							<TR>
																								<TD align="left"><INPUT id="Chk4" type="checkbox" runat="server"></TD>
																								<TD align="right">çÂ«—‘‰»Â</TD>
																								<TD align="left"><INPUT id="Chk5" type="checkbox" runat="server"></TD>
																								<TD align="right">Å‰Ã‘‰»Â</TD>
																							</TR>
																							<TR>
																								<TD align="left"><INPUT id="Chk6" type="checkbox" runat="server"></TD>
																								<TD align="right">Ã„⁄Â</TD>
																								<TD align="left"></TD>
																								<TD align="right"></TD>
																							</TR>
																						</TABLE>
																					</FIELDSET>
																					<FIELDSET class="CssPage" dir="rtl" style="WIDTH: 177px; HEIGHT: 74px" align="middle"><LEGEND>»—‰«„Â 
																							ò«—Ì</LEGEND>
																						<TABLE id="Table5" style="WIDTH: 171px; HEIGHT: 30px" cellSpacing="1" cellPadding="1" border="0">
																							<TR vAlign="top">
																								<TD>—Ê“</TD>
																								<TD><SELECT id="SelShift" style="WIDTH: 44px" name="SelShift">
																										<OPTION selected></OPTION>
																										<OPTION>1</OPTION>
																										<OPTION>2</OPTION>
																										<OPTION>3</OPTION>
																										<OPTION>4</OPTION>
																										<OPTION>5</OPTION>
																										<OPTION>6</OPTION>
																										<OPTION>7</OPTION>
																										<OPTION>8</OPTION>
																										<OPTION>9</OPTION>
																										<OPTION>10</OPTION>
																										<OPTION>11</OPTION>
																										<OPTION>12</OPTION>
																										<OPTION>13</OPTION>
																										<OPTION>14</OPTION>
																										<OPTION>15</OPTION>
																										<OPTION>16</OPTION>
																										<OPTION>17</OPTION>
																										<OPTION>18</OPTION>
																										<OPTION>19</OPTION>
																										<OPTION>20</OPTION>
																										<OPTION>21</OPTION>
																										<OPTION>22</OPTION>
																										<OPTION>23</OPTION>
																										<OPTION>24</OPTION>
																										<OPTION>25</OPTION>
																										<OPTION>26</OPTION>
																										<OPTION>27</OPTION>
																										<OPTION>28</OPTION>
																										<OPTION>29</OPTION>
																										<OPTION>30</OPTION>
																										<OPTION>31</OPTION>
																									</SELECT>
																								</TD>
																								<TD>«„ «“ ç—ŒÂ ‘Ì› </TD>
																							</TR>
																						</TABLE>
																					</FIELDSET>
																				</TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
																<TR>
																	<TD vAlign="top" align="center">
																		<TABLE id="Table14" style="WIDTH: 114px; HEIGHT: 42px" cellSpacing="2" cellPadding="3"
																			width="114" align="center" border="0">
																			<TR>
																				<TD align="center"><INPUT class="CssBtnNew" id="btnNewRD" title="«ÌÃ«œ" style="CURSOR: hand" onclick="onClickBtnNewRD()"
																						type="button" name="btnNew"></TD>
																				<TD align="center"><INPUT class="CssBtnSave" id="btnSave" title="–ŒÌ—Â" style="CURSOR: hand" onclick="onClickBtnSave()"
																						type="button" name="BtnSave"></TD>
																				<TD align="center"><INPUT class="CssBtnCancel" id="btnCancel" title="«‰’—«›" style="CURSOR: hand" onclick="onClickBtnCancel()"
																						type="button" name="btnCancel"></TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD id="DownRowSimpleNew" style="DISPLAY: none" vAlign="top" align="center">
															<TABLE class="CssPage" id="Table18" dir="rtl" style="WIDTH: 972px; HEIGHT: 491px" cellSpacing="0"
																cellPadding="0" border="0">
																<TR>
																	<TD dir="rtl" style="HEIGHT: 1px" align="center">
																		<TABLE id="Table19" style="WIDTH: 563px; HEIGHT: 47px" cellSpacing="0" cellPadding="0"
																			width="563" align="right" border="0">
																			<TR>
																				<TD style="WIDTH: 58px" align="left">«“ «—ÌŒ:</TD>
																				<TD style="WIDTH: 142px"><uc1:textdate id="SD" runat="server"></uc1:textdate></TD>
																				<TD style="WIDTH: 40px"> «  «—ÌŒ:</TD>
																				<TD><uc1:textdate id="ED" runat="server"></uc1:textdate><INPUT id="BtnAdd" title="«÷«›Â" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/btnSelected_d.GIF); BORDER-BOTTOM-STYLE: solid; BORDER-BOTTOM-COLOR: #788bc2; BORDER-RIGHT-STYLE: solid; BACKGROUND-COLOR: transparent; BORDER-TOP-COLOR: #788bc2; WIDTH: 25px; BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: center center; BORDER-TOP-STYLE: solid; HEIGHT: 24px; BORDER-RIGHT-COLOR: #788bc2; BORDER-LEFT-STYLE: solid; BORDER-LEFT-COLOR: #788bc2; CURSOR: hand"
																						onclick="OnClickBtnAdd()" name="BtnAdd"></TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
																<TR>
																	<TD dir="rtl" vAlign="top" align="center">
																		<TABLE id="Table20" style="WIDTH: 925px; HEIGHT: 362px" cellSpacing="0" cellPadding="0"
																			width="925" align="center" border="0">
																			<TR>
																				<TD style="WIDTH: 510px" vAlign="top" align="center">
																					<FIELDSET class="CssPage" style="WIDTH: 485px; HEIGHT: 345px"><LEGEND>«‰ Œ«» ”«Œ «—</LEGEND>
																						<TABLE id="Table21" style="WIDTH: 450px; HEIGHT: 246px" cellSpacing="0" cellPadding="0"
																							width="450" border="0">
																							<TR>
																								<TD style="WIDTH: 143px" vAlign="top" align="center">
																									<div class="txtControls" style="SCROLLBAR-ARROW-COLOR: black; BORDER-LEFT: gray 2px solid; BACKGROUND-COLOR: white; WIDTH: 160px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 280px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; BORDER-TOP: gray 2px solid">
																										<TABLE id="lstExist" ondblclick="onclickbtnback()" onclick="onclicklstExist()" width="100%">
																											<THEAD style="DISPLAY: none">
																											</THEAD>
																										</TABLE>
																									</div>
																								</TD>
																								<TD style="WIDTH: 3px">
																									<TABLE id="Table22" style="WIDTH: 11px; HEIGHT: 87px" cellSpacing="1" cellPadding="1" width="11"
																										border="0">
																										<TR>
																											<TD><INPUT class="btnNext" id="btnback" title="«÷«›Â" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Left.gif); BACKGROUND-COLOR: transparent; WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px; CURSOR: hand"
																													onclick="onclickbtnback()" type="button" name="btnback">
																											</TD>
																										</TR>
																										<TR>
																											<TD><INPUT class="btnNext" id="btnNext" title="Õ–›" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Right.gif); WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px; CURSOR: hand"
																													onclick="onclickbtnNext()" type="button" name="btnNext">
																											</TD>
																										</TR>
																										<TR>
																											<TD><INPUT class="btnNext" id="btnnNext" title="Õ–› Â„Â" style="BACKGROUND-IMAGE: url(/TA/Includes/Images/Buttons/Left2.gif); WIDTH: 21px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px; CURSOR: hand"
																													onclick="onclickbtnnNext()" type="button" name="btnnNext">
																											</TD>
																										</TR>
																									</TABLE>
																								</TD>
																								<td id="TDlstSelected" style="WIDTH: 167px" vAlign="top">
																									<div class="txtControls" dir="rtl" style="SCROLLBAR-ARROW-COLOR: black; BORDER-LEFT: gray 2px solid; BACKGROUND-COLOR: white; WIDTH: 148px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 280px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; BORDER-TOP: gray 2px solid">
																										<TABLE id="lstSelected" onclick="onclicklstSelected()" cellSpacing="0" cellPadding="0">
																											<THEAD style="DISPLAY: none">
																											</THEAD>
																										</TABLE>
																									</div>
																								</td>
																								<TD id="TDselDate" style="WIDTH: 72px" vAlign="top" align="right">
																									<div class="txtControls" dir="rtl" style="SCROLLBAR-ARROW-COLOR: black; BORDER-LEFT: gray 2px solid; BACKGROUND-COLOR: white; WIDTH: 97px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 280px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; BORDER-TOP: gray 2px solid">
																										<TABLE id="selDate" onclick="OnClickSelDate()" cellSpacing="0" cellPadding="0">
																											<THEAD style="DISPLAY: none">
																											</THEAD>
																										</TABLE>
																									</div>
																								</TD>
																								<TD>
																									<TABLE id="Table23" style="WIDTH: 26px; HEIGHT: 57px" cellSpacing="1" cellPadding="1" width="26"
																										border="0">
																										<TR>
																											<TD><INPUT class="CssbtnUP" id="btnUP" title="Õ—ò  »Â »«·«" style="WIDTH: 24px; HEIGHT: 23px; CURSOR: hand"
																													onclick="onclickbtnUP()" type="button" name="btnUP"></TD>
																										</TR>
																										<TR>
																											<TD><INPUT class="CssBtnDown" id="btnDown" title="Õ—ò  »Â Å«ÌÌ‰" style="WIDTH: 24px; HEIGHT: 23px; CURSOR: hand"
																													onclick="onclickbtnDown()" type="button" name="btnDown"></TD>
																										</TR>
																									</TABLE>
																								</TD>
																							</TR>
																						</TABLE>
																					</FIELDSET>
																				</TD>
																				<TD vAlign="top" align="center">&nbsp;
																					<FIELDSET class="CssPage" dir="rtl" style="WIDTH: 441px; HEIGHT: 345px" align="middle"><LEGEND style="WIDTH: 30px">«‰ Œ«» 
																							«⁄÷«</LEGEND>
																						<TABLE id="Table24" style="WIDTH: 367px; HEIGHT: 87.06%" cellSpacing="0" cellPadding="0"
																							width="367" align="center" border="0">
																							<TR>
																								<TD style="WIDTH: 129px; HEIGHT: 219px" vAlign="top" align="center">
																									<TABLE id="Table25" style="WIDTH: 114px; HEIGHT: 139px" cellSpacing="1" cellPadding="1"
																										width="114" border="0">
																										<TR>
																											<TD style="WIDTH: 22px; HEIGHT: 32px" align="center"></TD>
																											<TD style="HEIGHT: 32px"></TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkRoleS" type="radio" value="ChkWork" name="GroupChk"></TD>
																											<TD>Ê«Õœ ”«“„«‰Ì
																											</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkWorkS" type="radio" value="ChkWork" name="GroupChk"></TD>
																											<TD>»—‰«„Â&nbsp;ò«—Ì</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkShiftS" type="radio" value="ChkShift" name="GroupChk"></TD>
																											<TD>ê—ÊÂ ‘Ì› </TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkTablS" type="radio" value="ChkTabl" name="GroupChk"></TD>
																											<TD>œ› —  «»·</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkPersonelGroupS" type="radio" value="ChkPersonelGroup" name="GroupChk"></TD>
																											<TD>ê—ÊÂ Å—”‰·Ì</TD>
																										</TR>
																										<TR>
																											<TD style="WIDTH: 22px" align="center"><INPUT id="ChkPersonelS" type="radio" value="ChkPersonel" name="GroupChk" CHECKED></TD>
																											<TD>Å—”‰·</TD>
																										</TR>
																									</TABLE>
																									<INPUT class="btnSelectPerson" id="btnSelectPersonSimple" title="«‰ Œ«» «⁄÷«Ì ê—ÊÂ" style="WIDTH: 125px; HEIGHT: 32px"
																										onclick="onClickBtnSelectPersonSimple()" type="button" name="BtnSelectPerson">
																								</TD>
																								<TD style="HEIGHT: 219px" vAlign="top" align="center">
																									<TABLE id="Table29" style="WIDTH: 280px; HEIGHT: 14px" height="14" cellSpacing="1" cellPadding="1"
																										align="center" border="0">
																										<TR>
																											<TD align="right"><INPUT class="CssLastPage" id="LastBtn_XS" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick(2)"
																													type="button" name="LastBtn_XS"></TD>
																											<TD align="right"><INPUT class="CssNextPage" id="NextBtn_XS" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick(2)"
																													type="button" name="NextBtn_XS"></TD>
																											<TD vAlign="middle" align="right"><INPUT id="CurPage_XS" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																													onchange="CurPage_XTextChanged(2)" name="CurPage_XS"></TD>
																											<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
																											<TD vAlign="middle"><INPUT id="ToatalPage_XS" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
																													size="6" name="ToatalPage_XS"></TD>
																											<TD><INPUT class="CssPrevPage" id="PrevBtn_XS" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick(2)"
																													type="button" name="PrevBtn_XS"></TD>
																											<TD><INPUT class="CssFirstPage" id="FirstBtn_XS" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick(2)"
																													type="button" name="FirstBtn_XS"></TD>
																											<TD style="DISPLAY: none"></TD>
																										</TR>
																									</TABLE>
																									<TABLE id="Table26" style="WIDTH: 255px; HEIGHT: 35px">
																										<THEAD style="DISPLAY: inline">
																											<TR class="ShoperHeaderStyle">
																												<TD class="Headerstyle" style="WIDTH: 3px" align="center"><INPUT id="chkAllSimple" onclick="SelectAllChk_Onclick(GrdUserSimple,this)" type="checkbox"
																														CHECKED name="chkAllSimple"></TD>
																												<TD class="Headerstyle" align="center">‰«„
																												</TD>
																											</TR>
																										</THEAD>
																									</TABLE>
																									<DIV class="DivStyle" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 255px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 78.9%; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto">
																										<TABLE id="GrdUserSimple">
																											<THEAD style="DISPLAY: none">
																											</THEAD>
																										</TABLE>
																									</DIV>
																								</TD>
																						<%--	</TR>--%>
																						</TABLE>
																					</FIELDSET>
																				</TD>
																			</TR>
																		</TABLE>
																		<HR style="WIDTH: 301px; HEIGHT: 1px; COLOR: black" align="center" SIZE="1">
																		<TABLE id="Table28" style="WIDTH: 114px; HEIGHT: 42px" cellSpacing="2" cellPadding="3"
																			width="114" align="center" border="0">
																			<TR>
																				<TD align="center"><INPUT class="CssBtnNew" id="btnSNew" title="«ÌÃ«œ" style="CURSOR: hand" onclick="onClickBtnSNew()"
																						type="button" name="btnNew"></TD>
																				<TD align="center"><INPUT class="CssBtnSave" id="btnSaveSimple" title="–ŒÌ—Â" style="CURSOR: hand" onclick="onClickBtnSSave()"
																						type="button" name="BtnSave"></TD>
																				<TD align="center"><INPUT class="CssBtnCancel" id="btnSCancel" title="«‰’—«›" style="CURSOR: hand" onclick="OnClickBtnSCancel()"
																						type="button" name="btnCancel"></TD>
																			</TR>
																		</TABLE>
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<td style="DISPLAY: none">
												<input id="txtSessionID" runat="server" NAME="txtSessionID" />
                                                
												<cc1:mysecurity id="OnLineUser" runat="server">
                                                </cc1:mysecurity>
                                                <input type="text"  id="tSelectedMamber" name="tSelectedMamber" runat="server" />
												<input type="text" id="txtSubmit" name="txtSubmit" runat="server" /> 
                                                <input type="text" id="txtValidUserXml" name="txtValidUserXml" runat="server" />
												<input  type="text" id="txtSelectedMamber" name="txtSelectedMamber" runat="server" /> 
                                                <input  type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
												<input  type="text" id="txtAlert" name="txtAlert" runat="server" /> 
                                                <input  type="text" id="txtXmlDetail" name="txtXmlDetail" runat="server" />
												<input  type="text" id="TxtID" name="txtXml" runat="server" />
                                                 <input type="text" id="txtAjax" name="txtAjax" runat="server" />
												<input type="text"  id="txtServerDate" name="txtServerDate" runat="server" />
                                                 <input  type="text" id="txtSDate" name="txtSDate" runat="server" />
												<input type="text"  id="txtEDate" name="txtEDate" runat="server" />
                                                <input  type="text" id="txtSearch" name="txtSearch" runat="server" />
												<input type="text" id="txtModalflag" name="txtModalflag" runat="server" />
                                                <input  type="text" id="txtMemberID" name="txtMemberID" runat="server" />
												<INPUT  type="text" id="txtDetailCollectionXml" name="txtDetailCollectionXml" runat="Server" />
												<input  type="text" id="txtFlagDo" name="txtFlagDo" runat="server" /> 
                                                <input type="text" id="txtConfirm" name="txtConfirm" runat="server" />
												<input  type="text" id="txtMode" name="txtMode" runat="server" /> 
                                                <input  type="text" id="txtXmlGrid" name="txtXmlGrid" runat="server" />
												<input type="text" id="txtResult" name="txtResult" runat="server" /> 
                                                <input  type="text" id="txtLastRID" name="txtLastRID" runat="server" />
												<input  type="text" id="txtSaveMode" name="txtSaveMode" runat="server" /> 
                                                <input type="text" id="txtDetailHTML" name="txtDetailHTML" runat="server" />
												<input type="text" id="txtDateHTML" name="txtDateHTML" runat="server" />
                                                 <input type="text" id="txtUserFlag" name="txtUserFlag" runat="server" />
												<input type="text" id="txtIndex" name="txtIndex" runat="server" />
                                                 <input type="text" id="txtPageAccess" name="txtPageAccess" runat="server" />
                                                 <input type="text"  id="txtUserID" name="txtUserID" runat="server" />
												<input type="text" id="txtSchedulePresent" name="txtSchedulePresent" runat="server" /> 
                                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"	runat="server" />
                                                   
											</td>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
                    
						
					
				</tr>
			</table>
		</form>
	</body>
</HTML>
