<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Group.aspx.vb" Inherits="FrameWork.Group"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Group</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"  />
    <meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
    <meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Includes/Styles/GroupStyle.css" type="text/css" rel="stylesheet">
    <script src="../../Includes/Scripts/GroupGeneral.js"></script>
    <script src="../../Includes/Scripts/KeySorting.js"></script>
    <script language="javascript">
        var oReqHttp;
        var PageSize = 10;
        var currentPage_X = 0;
        var LastSelectedRowgrd = null;
        var LastSelectedRowClassgrd = "";



        //   alert(Form1.txtXMLCmbPage.value);
        function ChangeColorcmbSubSys(MemberId, Type) {
            //===================================================================
            var xmlDocSubSys = new ActiveXObject("Microsoft.XMLDOM");
            xmlDocSubSys.async = "false";
            xmlDocSubSys.loadXML(Form1.txtXmlSubSys.value);

            var XmlNodeSubSys = xmlDocSubSys.documentElement.selectNodes("/UserEntity/Instance");
            //===================================================================		       
            var tSubSysId = Form1.selSubSys.value
            var ttSubSysId = tSubSysId
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLMemberAccess.value);
            var xml1;
            var x;
            if (MemberId != "") {
                var subSysId
                for (x = 1; x < document.all('selSubSys').length; x++)
                    document.all('selSubSys').all(x).style.color = 'black'

                for (x = 0; x < XmlNodeSubSys.length; x++) {
                    xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/MemberAccess[MemberId=" + MemberId + " and Type='" + Type + "' and (AccessId=" + XmlNodeSubSys.item(x).selectSingleNode("SubSysID").text + "0000 or AccessId=" + XmlNodeSubSys.item(x).selectSingleNode("SubSysID").text + "1000 or AccessId=" + XmlNodeSubSys.item(x).selectSingleNode("SubSysID").text + "11000)]");
                    if (xml1.length > 0) {
                        subSysId = XmlNodeSubSys.item(x).selectSingleNode("SubSysID").text;
                        Form1.selSubSys.value = subSysId

                        document.all('selSubSys').all(parseInt(Form1.selSubSys.selectedIndex)).style.color = 'red'

                        if (tSubSysId == subSysId) {
                            if (tSubSysId == document.all('selSubSys').length - 1)
                                ttSubSysId = 1
                            else
                                ttSubSysId = document.all('selSubSys').length - 1
                        }

                        Form1.selSubSys.value = ttSubSysId

                    }
                    Form1.selSubSys.value = tSubSysId
                }
            }
            else {
                for (x = 1; x < document.all('selSubSys').length; x++)
                    document.all('selSubSys').all(x).style.color = 'black'
            }

        }
        function GetDataPerson(SelectedMember) {

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(SelectedMember);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");

            if (Form1.XMLGroupMember.value == "")
                Form1.XMLGroupMember.value = "<UserEntity></UserEntity>"

            var strOldMamber = Form1.XMLGroupMember.value
            xmlOld = new ActiveXObject("MsXml2.DomDocument");
            xmlOld.loadXML(strOldMamber);
            xmlOld.setProperty("SelectionLanguage", "XPath");
            var xmlNodesOld

            for (x = 0; x < xmlNodes.length; x++) {
                xmlNodesOld = xmlOld.documentElement.selectNodes("/UserEntity/XMLGroupMember[PersonID=" + xmlNodes.item(x).selectSingleNode('PCode').text + "]");
                if (xmlNodesOld.length == 0) {
                    strOldMamber = strOldMamber.replace('<UserEntity>', '')
                    strOldMamber = strOldMamber.replace('</UserEntity>', '')
                    strOldMamber += '<XMLGroupMember>'
                    strOldMamber += '<GroupId>' + Form1.GroupId.value + '</GroupId>'
                    strOldMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('PCode').text + '</PersonID>'
                    strOldMamber += '<FullName>' + xmlNodes.item(x).selectSingleNode('PName').text + '</FullName>'
                    strOldMamber += '<PID>' + xmlNodes.item(x).selectSingleNode('PID').text + '</PID>'
                    strOldMamber += '<Selected>1</Selected>'
                    strOldMamber += '</XMLGroupMember>'
                    strOldMamber = '<UserEntity>' + strOldMamber + '</UserEntity>'
                }
                else {
                    xmlOld = new ActiveXObject("MsXml2.DomDocument");
                    xmlOld.loadXML(strOldMamber);
                    xmlOld.setProperty("SelectionLanguage", "XPath");

                    xmlNodesOld.item(0).selectSingleNode('Selected').text = 1
                    strOldMamber = xmlOld.xml
                }
            }
            return (strOldMamber)
        }
        function onBlurPersonIdGrd() {
            if (Form1.PersonIdGrd.value == "") Form1.cmbFamilyGrd.value = "0"
            else Form1.cmbFamilyGrd.value = Form1.PersonIdGrd.value
        }
        function onchangecmbFamilyGrd() {
            if (Form1.cmbFamilyGrd.value == "0") Form1.PersonIdGrd.value = ""
            else Form1.PersonIdGrd.value = Form1.cmbFamilyGrd.value
        }
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j) obj.deleteRow(j)
        }
        function AddRow(oGrid, AttrName, AttrValue, PID, Selected, Param) {

            newrowindex = oGrid.rows.length
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "XItemStyle";
            oGrid.rows(newrowindex).setAttribute(AttrName, AttrValue)
            oGrid.rows(newrowindex).setAttribute("PID", PID)
            oGrid.rows(newrowindex).insertCell()
            if (Selected == 1) oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' checked onclick='chkOnClick(this)'/>"
            else oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' onclick='chkOnClick(this)'/>"
            var cell = 1
            var p = new String
            var x = 0

            while (x < getCntChar(',', Param)) {
                p = getArray(Param, x, ',')
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(cell).innerText = p.substring(1, p.length - 1)

                cell = cell + 1
                x = x + 1
            }

            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "40px"
            oGrid.rows(newrowindex).cells(1).style.width = "150px"
            oGrid.rows(newrowindex).cells(2).style.width = "250px"

        }
        function LoadSelectedPerson(direction) {
            Cleargrd(grdPerson)

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            var xmlNodes, x, totalRecords, Param, endFor
            if (Form1.GroupId.value == '') Form1.GroupId.value = '0'

            if (Form1.XMLGroupMember.value == "") Form1.XMLGroupMember.value = "<UserEntity></UserEntity>"
            xmlDoc.loadXML(Form1.XMLGroupMember.value);
            xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/XMLGroupMember");
            totalRecords = xmlNodes.length
            Form1.ToatalPage_X.value = Math.ceil(totalRecords / PageSize)
            if (totalRecords > 0) {
                currentPage_X = parseInt(Form1.CurPage_X.value)
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
                if (currentPage_X * PageSize - 1 < 0) return
                if (totalRecords <= currentPage_X * PageSize - 1) endFor = totalRecords - 1
                else endFor = parseInt(Form1.CurPage_X.value) * PageSize - 1
                x = (currentPage_X - 1) * PageSize
                for (; x <= endFor; ++x) {
                    Param = '"' + xmlNodes.item(x).selectSingleNode('PersonID').text + '","' + xmlNodes.item(x).selectSingleNode('FullName').text + '",'

                    AddRow(grdPerson, "PersonID", xmlNodes.item(x).selectSingleNode('PersonID').text, xmlNodes.item(x).selectSingleNode('PID').text, xmlNodes.item(x).selectSingleNode('Selected').text, Param)
                }
            }
            return
        }
        function CurPage_XTextChanged() {
            if (parseInt(Form1.CurPage_X.value) <= parseInt(Form1.ToatalPage_X.value) && Form1.CurPage_X.value > 0)
                LoadSelectedPerson('Const')
        }
        function NextBtn_XClick() {
            if (parseInt(Form1.CurPage_X.value) < parseInt(Form1.ToatalPage_X.value))
                LoadSelectedPerson('Next')
        }
        function PrevBtn_XClick() {
            if (parseInt(Form1.CurPage_X.value) > 1)
                LoadSelectedPerson('Previous')
        }
        function FirstBtn_XClick() { LoadSelectedPerson('First') }
        function LastBtn_XClick() { LoadSelectedPerson('Last') }
        function chkOnClick(chk) {
            var PersonID, PID
            PersonID = chk.parentElement.parentElement.PersonID
            PID = chk.parentElement.parentElement.PID
            //alert(PersonID)
            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(Form1.XMLGroupMember.value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/XMLGroupMember[PersonID=" + PersonID + " and PID=" + PID + "]");
            //alert(xmlNodes.item(0).selectSingleNode('Selected').text)
            if (chk.checked == false)
                xmlNodes.item(0).selectSingleNode('Selected').text = 0
            else if (chk.checked == true)
                xmlNodes.item(0).selectSingleNode('Selected').text = 1
            Form1.XMLGroupMember.value = xmlDoc.xml
        }
        function ViewGrid() {
            document.all("TdCnt").innerText = "تعداد گروههاي در حال نمايش :" + grdGroup.rows.length
            document.all.item("RowGrid").style.display = "inline"
            document.all.item("RowEdit").style.display = "none"
            Form1.Active.value = "Grid"
        }
        function ViewEdit() {
            document.all.item("RowGrid").style.display = "none"
            document.all.item("RowEdit").style.display = "inline"
            LoadSelectedPerson('First')
            Form1.Active.value = "Edit"
        }
        function onclickgrdGroup(SelectedRow) {
            var obj
            obj = grdGroup
            if (LastSelectedRowgrd != null)
                LastSelectedRowgrd.className = LastSelectedRowClassgrd
            LastSelectedRowClassgrd = SelectedRow.className
            LastSelectedRowgrd = SelectedRow
            SelectedRow.className = "CssSelectedItemStyle"
            Form1.GroupId.value = SelectedRow.GroupId
        }
        function ondblclickgrdGroup() {
            var url = "Group.aspx?AjaxSend=dblclick &GroupId=" + Form1.GroupId.value;
            oReqHttp = new ActiveXObject("Microsoft.XMLHTTP");
            oReqHttp.onreadystatechange = RequestProcessor;
            oReqHttp.open("Post", url, true);
            oReqHttp.send(null);
        }
        function RequestProcessor() {

            if (oReqHttp.readyState == 4 || oReqHttp.readyState == 'complete') {
                if (oReqHttp.status == 200) {
                    if (oReqHttp.responseText != "") {
                        Form1.XMLGroupMember.value = oReqHttp.responseText.split("<!")[0];
                        //alert(oReqHttp.responseText.split("<!")[0].length)
                        //alert(Form1.XMLGroupMember.value.length)

                        ViewEdit()

                        LoadDataGroup()

                    }
                }
            }
            return true;
        }
        function LoadDataGroup() {

            window.status = "لطفا صبر کنيد : بارگذاري مشخصات گروه"

            ChangeColorcmbSubSys(Form1.GroupId.value, 'G')

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLGroupTitle.value);
            Form1.txtPersonId.value = ""
            document.getElementById("LblName").innerText = ""
            var xml1;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/Group[GroupID='" + Form1.GroupId.value + "']");
            if (xml1.length > 0) {
                Form1.GroupName.value = xml1.item(0).selectSingleNode('GroupName').text
                Form1.Descr.value = xml1.item(0).selectSingleNode('Descr').text
                LoadDataTreeRole(Form1.GroupId.value, 'G')
                window.status = ""
            }

        }
        function onchangeselSubSys() { LoadDataTreeRole(Form1.GroupId.value, 'G') }
        function LoadDataTreeRole(MemberId, Type) {
            ClearXMLTreeRole(document.all("Tree2")(1).all)
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLMemberAccess.value);
            var xml1, x1
            var xmlDocs = new ActiveXObject("Microsoft.XMLDOM");
            xmlDocs.async = "false";


            xmlDocs.loadXML(Form1.XMLRole.value);
            var xmls1;
            var objCollection = document.all("Tree2")(1).all
            var t;

            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/MemberAccess[MemberId=" + MemberId + "]");

            var c = 0
            for (t = 0; t < objCollection.length; ++t) {
                if (objCollection.item(t).tagName == "INPUT") {
                    objCollection.item(t).checked = false
                    objCollection.item(t).style.backgroundColor = ''
                    for (var x1 = 0; x1 < xml1.length; ++x1) {
                        if (objCollection.item(t).accID == xml1.item(x1).childNodes(0).text) {
                            xmls1 = xmlDocs.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
                            xmls1.childNodes(3).text = xml1.item(x1).childNodes(3).text
                            xmls1.childNodes(5).text = xml1.item(x1).childNodes(4).text
                            switch (xml1.item(x1).childNodes(3).text) {
                                case "1":
                                    objCollection.item(t).checked = true
                                    objCollection.item(t).style.backgroundColor = '#dcdcdc'
                                    break;
                                case "2":
                                    objCollection.item(t).checked = true
                                    objCollection.item(t).style.backgroundColor = ''
                                    break;
                                default:
                                    objCollection.item(t).checked = false
                                    objCollection.item(t).style.backgroundColor = ''
                                    xmls1.childNodes(3).text = 0
                                    xmls1.childNodes(5).text = 0
                            }
                            break;
                        }
                    }
                }
            }
            Form1.XMLRole.value = xmlDocs.xml
        }
        function ManageCheckChild1(Chk) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1;
            var x1;
            var objCollection = document.all("Tree2")(1).all
            var t;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + Chk.accID + " and Type!='P']");
            for (x1 = 0; x1 < xml1.length; ++x1) {
                for (t = objCollection.length - 1; t > 0; --t) {
                    if (objCollection.item(t).tagName == "INPUT") {
                        if (objCollection.item(t).accID == xml1.item(x1).childNodes(1).text) {
                            objCollection.item(t).checked = true
                            objCollection.item(t).style.backgroundColor = ''
                            break
                        }
                    }
                }
            }
        }
        function WriteCurCntChildForChilds(Chk) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1, x1, xmls1;
            var objCollection = document.all("Tree2")(1).all
            var t;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + Chk.accID + " and Type!='P']");
            for (x1 = 0; x1 < xml1.length; ++x1) {
                for (t = objCollection.length - 1; t > 0; --t) {
                    if (objCollection.item(t).tagName == "INPUT") {
                        if (objCollection.item(t).accID == xml1.item(x1).childNodes(1).text) {
                            xmls1 = xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='S']");
                            xmls1.childNodes(5).text = parseInt(xmls1.childNodes(4).text) + 1
                            xmls1.childNodes(3).text = 2
                            break
                        }
                    }
                }
            }
            Form1.XMLRole.value = xmlDoc.xml
        }
        function ManageCheckChild0(Chk) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1;
            var x1;
            var xmls1;
            var objCollection = document.all("Tree2")(1).all
            var t;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + Chk.accID + " and Type!='P']");
            for (x1 = 0; x1 < xml1.length; ++x1) {
                for (t = objCollection.length - 1; t > 0; --t) {
                    if (objCollection.item(t).tagName == "INPUT") {
                        if (objCollection.item(t).accID == xml1.item(x1).childNodes(1).text) {
                            objCollection.item(t).checked = false
                            objCollection.item(t).style.backgroundColor = ''
                            xmls1 = xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='S']");
                            xmls1.childNodes(5).text = 0
                            xmls1.childNodes(3).text = 0
                            break
                        }
                    }
                }
            }
            Form1.XMLRole.value = xmlDoc.xml
        }
        function WriteCurCntChildForParents(Chk) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1;
            var x1;
            var xml2;
            var x2;
            var xmls1;
            var xmls2;
            var objCollection = document.all("Tree2")(1).all
            var t;
            var cnt
            cnt = 0
            var levelx1
            levelx1 = 0
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + Chk.accID + " and Type='P']");

            for (x1 = 0; x1 < xml1.length; ++x1) {

                levelx1 = parseInt(xml1.item(x1).childNodes(6).text) + 1
                xml2 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='C' and CurLevel=" + levelx1 + "]");

                for (x2 = 0; x2 < xml2.length; ++x2) {
                    xmls1 = xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml2.item(x2).childNodes(1).text + " and Type='S']");
                    if (xmls1 != null) {
                        if (xmls1.childNodes(5).text != 0) {
                            cnt = cnt + parseInt(xmls1.childNodes(5).text)
                        }
                        if (cnt == xmls1.childNodes(4).text & xmls1.childNodes(5).text != 0) {
                            cnt = cnt + 1
                        }
                    }
                }

                xmls2 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='S']");

                if (xmls2.length > 0) {
                    if (cnt == 0)
                        cnt = 1;
                    xmls2.item(0).childNodes(5).text = cnt;
                }

                if (cnt >= xmls2.item(0).childNodes(4).text) {
                    ManageColorParent(xmls2.item(0).childNodes(1).text, 2)//checked=true and backcolor=gray
                    xmls2.item(0).childNodes(3).text = 2
                }
                if (cnt < xmls2.item(0).childNodes(4).text & cnt != 0) {
                    ManageColorParent(xmls2.item(0).childNodes(1).text, 1)//checked=true and backcolor=gray
                    xmls2.item(0).childNodes(3).text = 1
                }
                if (cnt == 0) {
                    ManageColorParent(xmls2.item(0).childNodes(1).text, 0)//checked=false and backcolor=''
                    xmls2.item(0).childNodes(3).text = 0
                }

            }
            cnt = 0
            Form1.XMLRole.value = xmlDoc.xml
        }
        function ManageColorParent(RoleId, flag) {
            var objCollection = document.all("Tree2")(1).all
            var t;
            switch (flag) {
                case 2:
                    for (t = objCollection.length - 1; t > 0; --t) {
                        if (objCollection.item(t).tagName == "INPUT") {
                            if (objCollection.item(t).accID == RoleId) {
                                objCollection.item(t).checked = true
                                objCollection.item(t).style.backgroundColor = ''
                                break
                            }
                        }
                    }
                    break;
                case 1:
                    for (t = objCollection.length - 1; t > 0; --t) {
                        if (objCollection.item(t).tagName == "INPUT") {
                            if (objCollection.item(t).accID == RoleId) {
                                objCollection.item(t).checked = true
                                objCollection.item(t).style.backgroundColor = '#dcdcdc'
                                break
                            }
                        }
                    }
                    break;
                case 0:
                    for (t = objCollection.length - 1; t > 0; --t) {
                        if (objCollection.item(t).tagName == "INPUT") {
                            if (objCollection.item(t).accID == RoleId) {
                                objCollection.item(t).checked = false
                                objCollection.item(t).style.backgroundColor = ''
                                break
                            }
                        }
                    }
                    break;
            }
        }
        function ManageCheck(Chk) {
            if (Chk.checked == true) {
                ManageCheckChild1(Chk)
                WriteCurCntChildForChilds(Chk)
                WriteCurCntChildForParents(Chk)
            }
            else {

                ManageCheckChild0(Chk)

                WriteCurCntChildForParents(Chk)

            }
        }
        function onclickbtnSave() {
            if (Form1.GroupName.value == "") {
                alert("لطفا نام گروه را وارد نمائيد")
                document.getElementById("GroupName").focus()
                return
            }

            MakeXMLGroup()

            MakeXMLAccessRole()

            if (Form1.GroupId.value == "")
                Form1.GroupId.value = "0"
            Form1.ModeSave.value = "SaveGroup"
            Form1.ModeDelete.value = ""
            Form1.submit()
        }
        function MakeXMLGroup() {
            var oGrid
            var iIndex
            var Type
            var strXMLGroup = "<UserEntity>"
            var strXMLMember = ""
            if (Form1.GroupId.value == "")
                Form1.GroupId.value == "0"
            strXMLGroup += "<GroupTitle>"
            strXMLGroup += "<GroupId>" + Form1.GroupId.value + "</GroupId>";
            strXMLGroup += "<GroupName>" + Form1.GroupName.value + "</GroupName>";
            strXMLGroup += "<Descr>" + Form1.Descr.value + "</Descr>";
            strXMLGroup += "<Type>U</Type>";
            strXMLGroup += "</GroupTitle>";
            strXMLMember = Form1.XMLGroupMember.value

            strXMLMember = strXMLMember.replace('<UserEntity>', '')
            strXMLMember = strXMLMember.replace('</UserEntity>', '')
            strXMLGroup = strXMLGroup + strXMLMember + "</UserEntity>"

            Form1.XMLGroup.value = strXMLGroup
        }
        function MakeXMLAccessRole() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);

            var xml1;
            var x1;
            var strXMLAccessRole = ""

            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S' and Checked!=0]");

            for (x1 = 0; x1 < xml1.length; ++x1) {
                strXMLAccessRole += "<MemberAccess>"
                strXMLAccessRole += "<AccessId>" + xml1.item(x1).childNodes(1).text + "</AccessId>";
                strXMLAccessRole += "<FlagChecked>" + xml1.item(x1).childNodes(3).text + "</FlagChecked>";
                strXMLAccessRole += "<CurCntChild>" + xml1.item(x1).childNodes(5).text + "</CurCntChild>";
                strXMLAccessRole += "</MemberAccess>";
            }
            if (strXMLAccessRole != "")
                Form1.XMLAccessRole.value = "<UserEntity>" + strXMLAccessRole + "</UserEntity>"
            else
                Form1.XMLAccessRole.value = "<UserEntity></UserEntity>"

        }
        function onclickbtnNew1() {
            NewGroup()
            ChangeColorcmbSubSys("", "G");
            document.all.item("RowGrid").style.display = "none"
            document.all.item("RowEdit").style.display = "inline"
            Cleargrd(grdPerson)
            Form1.Active.value = "Edit"
        }
        function NewGroup() {
            Form1.GroupId.value = ""
            Form1.GroupName.value = ""
            Form1.Descr.value = ""
            ClearCheckTreeRole(document.all("Tree2")(1).all)
            Form1.XMLGroupMember.value = ''
            Form1.CurPage_X.value = ''
            Form1.ToatalPage_X.value = ''
            if (LastSelectedRowgrd != "" && LastSelectedRowgrd != null)
                LastSelectedRowgrd.className = LastSelectedRowClassgrd;
            LastSelectedRowgrd = null;
            LastSelectedRowClassgrd = null;
        }
        function ClearXMLTreeRole(objCollection) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1;
            var x1;
            var xmls1;
            var t;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S']");
            for (x1 = 0; x1 < xml1.length; ++x1) {
                xmls1 = xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
                xmls1.childNodes(3).text = 0
                xmls1.childNodes(5).text = 0
            }
            Form1.XMLRole.value = xmlDoc.xml
        }
        function ClearCheckTreeRole(objCollection) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.XMLRole.value);
            var xml1;
            var x1;
            var xmls1;
            var t;
            xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S']");

            for (t = objCollection.length - 1; t > 0; --t)
                if (objCollection.item(t).tagName == "INPUT")
                    for (x1 = 0; x1 < xml1.length; ++x1)
                        if (objCollection.item(t).accID == xml1.item(x1).childNodes(0).text) {
                            xmls1 = xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
                            xmls1.childNodes(3).text = 0
                            xmls1.childNodes(5).text = 0
                            objCollection.item(t).checked = false
                            objCollection.item(t).style.backgroundColor = ''
                            break
                        }
            Form1.XMLRole.value = xmlDoc.xml
        }
        function onclickbtnEdit1() {
            if (LastSelectedRowgrd != null && LastSelectedRowgrd != "") {
                ondblclickgrdGroup()
            }
            else alert("به منظور ويرايش يک گروه را انتخاب کنيد");
        }
        function onclickbtnDelete1() {
            if (Form1.GroupId.value != "") {
                if (confirm("آيا براي حذف مطمئنيد ")) {
                    Form1.ModeDelete.value = "DeleteGroup"
                    Form1.ModeSave.value = ""
                    Form1.submit()
                }
            }
            else
                alert('لطفا سطر مورد نظر را انتخاب کنيد')
        }
        function onclickbtnNew() {
            document.all.item('CmbSearch').innerHTML = "";
            cmbPerson = document.all.item('CmbSearch')
            cmbPerson.innerHTML = ""
            optionEl = document.createElement("OPTION")
            cmbPerson.options.add(optionEl)
            document.all('CmbSearch').all(0).innerText = "انتخاب نشده"
            document.all('CmbSearch').all(0).value = 0
            Form1.txtPersonId.value = ""
            document.getElementById("LblName").innerText = ""
            NewGroup()
            Cleargrd(grdPerson)
        }
        function onclickbtnCancel() {
            ViewGrid()
        }
        function onBlurtxtPersonId() {
            if (Form1.txtPersonId.value == "")
                Form1.txtPersonId.value = 0
            if (document.getElementById('XMLGroupMember').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false"
                oXmlDoc.loadXML(document.getElementById('XMLGroupMember').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/UserEntity/XMLGroupMember[PersonID=' + document.getElementById("txtPersonId").value + ']')
                if (xmlNodes.length != 0) {
                    document.getElementById("LblName").innerText = xmlNodes.item(0).selectSingleNode("FullName").text
                }

                if (xmlNodes.length == 0) {
                    Form1.txtPersonId.value = ""
                    document.getElementById("LblName").innerText = ""
                }
                else {
                    if (Form1.txtPersonId.value == 0) {
                        Form1.txtPersonId.value = ""
                        Form1.CurPage_X.value = 1
                        CurPage_XTextChanged()
                    }
                    else
                        SearchonClientGrd(Form1.txtPersonId, Form1.XMLGroupMember, '/UserEntity/XMLGroupMember', 'PersonID', PageSize, grdPerson, '')
                }
            }
        }
        function onclickBtnSelectPerson() {

            url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + Form1.txtSessionID.value;
            rr = window.showModalDialog(url, "", "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no")

            //rr=ReplaceAll(rr,'','')

            if (rr != '') {
                Form1.XMLGroupMember.value = GetDataPerson(rr)
                LoadSelectedPerson('First')
            }
        }
        function onLoad() {

            switch (Form1.Active.value) {
                case "":
                    ViewGrid()
                    onChangeCmbSys();
                    
                    break;
                case "Grid":
                    ViewGrid()
                    onChangeCmbSys();
                    break;
                case "Edit":
                    ViewEdit()
                    onChangeCmbSys();
                    break;
                case "onChangeSubSysId":
                    LoadDataGroup()
                    ViewEdit()
                    break
            }
            if (Form1.ModeDelete.value == "DeleteGroup") {
                ViewGrid()
                alert('گروه حذف شد')
                Form1.ModeDelete.value = ""
                return;
            }

            if (Form1.ModeSave.value == "SaveGroup") {
                if (Form1.GroupId.value == "")
                    Form1.GroupId.value = "0"
                ChangeColorcmbSubSys(Form1.GroupId.value, 'G')
                LoadDataTreeRole(Form1.GroupId.value, 'G')
                LoadSelectedPerson('First')
                alert('گروه ذخيره شد')
                Form1.ModeSave.value = ""
                return;
            }
            //For Bind Combo Page
            onChangeCmbSys();
            if (document.getElementById("txtCmbsysvalue").value == Form1.CmbSubSys.value)
                Form1.CmbPage.value = document.getElementById("txtCmbPageValue").value;
            else {
                    Form1.CmbPage.value = "0";
                document.getElementById("txtCmbPageValue").value = "0";
            }
        }
        function onClickbtnRefreshPerson(obj) {
            var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + Form1.txtSessionID.value + "&MenuItemID=1306";
            var strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            var Result = Result = window.showModalDialog(url, "", strOptions);
            if (Result != "" && Result != undefined) {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(Result);
                oXmlDoc.setProperty("SelectionLanguage", "XPath");
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (oXmlNodes.length != 0) {
                    Form1.PersonIdGrd.value = oXmlNodes.item(0).selectSingleNode('PCode').text;
                    Form1.cmbFamilyGrd.value = oXmlNodes.item(0).selectSingleNode('PName').text;
                    Form1.cmbFamilyGrd.value = Form1.PersonIdGrd.value
                }
            }
        }
        function onChangeCmbSys() {
            //baraye zamani ke faghat subsys change mishavad
            if (document.getElementById("txtCmbsysvalue").value != Form1.CmbSubSys.value)
                document.getElementById("txtCmbPageValue").value = "0";
          
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(Form1.txtXMLCmbPage.value);
            var xmlNodes;

            document.getElementById("CmbPage").innerHTML = ""
            if (document.getElementById("CmbSubSys").value != 0 && document.getElementById("CmbSubSys").value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/NewDataSet/Lookup[SubsysID=" + document.getElementById("CmbSubSys").value + " ]");
                if (document.getElementById("CmbSubSys").value == "1")
                    xmlNodes = xmlDoc.documentElement.selectNodes("/NewDataSet/Lookup[SubsysID=" + document.getElementById("CmbSubSys").value + " or (SubsysID=111) ]");
                if (document.getElementById("CmbSubSys").value == "13")
                    xmlNodes = xmlDoc.documentElement.selectNodes("/NewDataSet/Lookup[SubsysID=" + document.getElementById("CmbSubSys").value + " or (SubsysID=131) ]");
            }
            else {

                xmlNodes = xmlDoc.documentElement.selectNodes("/NewDataSet/Lookup"); // [SubsysID != 0]
            }
            var j = 1
            //            if (document.getElementById("CmbSubSys").value != 0) {
            optionEl = document.createElement("OPTION")
            document.getElementById("CmbPage").options.add(optionEl)
            document.getElementById("CmbPage").all(0).innerText = "انتخاب نشده";
            document.getElementById("CmbPage").all(0).value = "0";
            document.getElementById("CmbPage").all(0).value = "0";
            //            }
            for (var i = 0; i < xmlNodes.length; ++i) {
                optionEl = document.createElement("OPTION")
                document.getElementById("CmbPage").options.add(optionEl)
                document.getElementById("CmbPage").all(j).innerText = xmlNodes.item(i).selectSingleNode('Title').text
                document.getElementById("CmbPage").all(j).value = xmlNodes.item(i).selectSingleNode('Val').text
                j++
            }
            //document.getElementById("CmbPage").value = document.getElementById("txtCreditType").value;
        }
        function onChangeCmbPageValue() {
           
            //----------------------------------------------
            if (document.getElementById("CmbPage").value!="0" && document.getElementById("CmbPage").value!="") {

            var xmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc1.async = "false";
            xmlDoc1.loadXML(Form1.txtXMLCmbPage.value);
            var xmlNodes1;
            xmlNodes1 = xmlDoc1.documentElement.selectNodes("/NewDataSet/Lookup[Val=" + document.getElementById("CmbPage").value + " ]");
            if (xmlNodes1.item(0).selectSingleNode('SubsysID').text == "111" )
                xmlNodes1.item(0).selectSingleNode('SubsysID').text = "1"
            if (xmlNodes1.item(0).selectSingleNode('SubsysID').text == "131")
                xmlNodes1.item(0).selectSingleNode('SubsysID').text="13"
            document.getElementById("CmbSubSys").value = xmlNodes1.item(0).selectSingleNode('SubsysID').text;
            }
            document.getElementById("txtCmbsysvalue").value = Form1.CmbSubSys.value;
            document.getElementById("txtCmbPageValue").value = Form1.CmbPage.value;
        }
       

    </script>
</head>
<body id="Body" dir="rtl" bottommargin="0" leftmargin="0" topmargin="0" scroll="yes"
    onload="onLoad()" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <table class="CssLayer2" id="Table7" height="100%" cellspacing="0" cellpadding="0"
        width="100%" border="1">
        <tr>
            <td align="center">
                <table class="CssPage" id="Table10" style="width: 682px; height: 561px" cellspacing="0"
                    cellpadding="0" border="0">
                    <tr>
                        <td id="RowGrid" valign="top" align="center">
                            <table id="Table14" height="543" cellspacing="1" cellpadding="1" width="559" align="center"
                                border="0">
                                <tr>
                                    <td style="height: 25px" valign="top" align="center">
                                        <table id="Table15" style="width: 641px; height: 43px" cellspacing="5" cellpadding="0"
                                            width="641" align="right" bgcolor="#91b7df" border="0">
                                            <tr>
                                                <td class="VertGradient1" id="TdGridGroup" style="border-right: lightblue thin inset;
                                                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;
                                                    height: 33px" align="center" width="33%">
                                                    گروه&nbsp;هاي کاربري
                                                </td>
                                                <td id="TdCnt" style="font-weight: bold; font-size: 12px; color: #ffffff" align="right"
                                                    width="60%">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right">
                                        <table id="Table16" style="width: 672px; height: 304px" height="304" cellspacing="1"
                                            cellpadding="1" width="672" align="right" border="0">
                                            <tr>
                                                <td style="display: inline; height: 1px" valign="top" align="right">
                                                    <table id="Table19" style="width: 583px; height: 40px" cellspacing="1" cellpadding="1"
                                                        width="583" align="right" border="0">
                                                        <tr>
                                                            <td style="width: 468px" valign="middle">
                                                                <table id="Table20" style="width: 451px; height: 32px" cellspacing="1" cellpadding="1"
                                                                    width="451" align="right" border="0">
                                                                    <tr>
                                                                        <td style="width: 72px">
                                                                            پرسنلی
                                                                        </td>
                                                                        <td style="width: 99px">
                                                                            <input class="TxtControls" id="PersonIdGrd" onblur="onBlurPersonIdGrd()" style="width: 125px;
                                                                                height: 20px" type="text" size="7" name="PersonIdGrd" runat="server">
                                                                        </td>
                                                                        <td style="width: 117px" align="left">
                                                                            نام
                                                                        </td>
                                                                        <td align="left">
                                                                            <cc1:lcombo id="cmbFamilyGrd" runat="server" onchange="onchangecmbFamilyGrd()" CssClass="TxtControls"
                                                                                Width="200px">
                                                                            </cc1:lcombo>
                                                                        </td>
                                                                        <td>
                                                                            <input id="btnRefreshPerson" class="CssHeaderStyle" onclick="onClickbtnRefreshPerson(this)"
                                                                                style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 72px">
                                                                            زیرسیستم
                                                                        </td>
                                                                        <td style="width: 99px">
                                                                            <cc1:lcombo id="CmbSubSys" ConnectionName="SysCnn" runat="server" CssClass="TxtControls"
                                                                                LookupName="SubSys" Width="130px" onchange="onChangeCmbSys()">
                                                                            </cc1:lcombo>
                                                                            <%--<select id="CmbSubSys" runat="server" name="CmbSubSys" style="width: 125px" class="TxtControls"
                                                                                onchange="onChangeCmbSys()">
                                                                                <option></option>
                                                                            </select>--%>
                                                                        </td>
                                                                        <td style="width: 117px">
                                                                            صفحه
                                                                        </td>
                                                                        <td>
                                                                            <%--  <cc1:lcombo id="CmbPage" runat="server" ConnectionName="SysCnn" CssClass="TxtControls"
                                                                                Width="200px">
                                                                            </cc1:lcombo>--%>
                                                                            <select id="CmbPage" runat="server" name="CmbPage" style="width: 200px" class="TxtControls"
                                                                                onchange="onChangeCmbPageValue()">
                                                                                <option></option>
                                                                            </select>
                                                                        </td>
                                                                        <td colspan="2">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td valign="middle" align="right" colspan="1">
                                                                &nbsp;
                                                                <input class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="width: 99px; height: 32px;
                                                                    cursor: hand;" type="button" name="btnSearch" runat="server">&nbsp;&nbsp;<input class="CssBtnShow"
                                                                        id="btnShow" dir="rtl" style="width: 70px; height: 32px; cursor: hand;" type="button"
                                                                        name="btnSearch" runat="server">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="RowGridGroup" style="display: inline; height: 230px" valign="top" align="right">
                                                    <cc1:automationgrid id="grdGroup" runat="server" CssClass="CssbackColor" Width="636px"
                                                        AutoGenerateColumns="False" SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0"
                                                        Scrolling="True" EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False"
                                                        UsingKeyBoard="False" CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" "
                                                        Height="320px">
                                                        <itemstyle cssclass="CssItemStyle"></itemstyle>
                                                        <headerstyle cssclass="CssHeaderStyle" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                                                        <alternatingitemstyle cssclass="CssAlternatingItemStyle"></alternatingitemstyle>
                                                        <footerstyle cssclass="CssEditItemStyle "></footerstyle>
                                                        <columns>
																	<ASP:BOUNDCOLUMN HeaderText="نام گروه" DataField="GroupName">
																		<HEADERSTYLE Width="200px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="200px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN>
																		<HEADERSTYLE Width="5px"></HEADERSTYLE>
																		<ITEMSTYLE Width="5px"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG 
                        title='<%#SetTitle(DataBinder.Eval(Container.DataItem,"Type"))%>' 
                        src='<%#SetSrc(DataBinder.Eval(Container.DataItem,"Type"))%>' 
                        align=middle border=0 name=IMG>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="شرح" DataField="Descr">
																		<HEADERSTYLE Width="330px"></HEADERSTYLE>
																		<ITEMSTYLE Width="330px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Type" DataField="Type" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="GroupID" DataField="GroupID" Visible="False">
																		<HEADERSTYLE Width="100px"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</columns>
                                                        <selecteditemstyle cssclass="CssSelectedItemStyle"></selecteditemstyle>
                                                    </cc1:automationgrid>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="display: inline" valign="top" align="center">
                                                    <hr class="CssHorizontalLine" style="width: 591px; height: 2px" size="2">
                                                    <table id="Table17" style="width: 172px; height: 36px" cellspacing="1" cellpadding="1"
                                                        width="172" border="0">
                                                        <tr>
                                                            <td>
                                                                <input class="CssBtnNew" id="btnNew1" onclick="onclickbtnNew1()" type="button" name="btnNew1"
                                                                    style="cursor: hand;">
                                                            </td>
                                                            <td>
                                                                <input class="CssBtnEdit" id="btnEdit1" onclick="onclickbtnEdit1()" type="button"
                                                                    name="btnEdit1" style="cursor: hand;">
                                                            </td>
                                                            <td>
                                                                <input class="CssBtnDelete" id="btnDelete1" onclick="onclickbtnDelete1()" type="button"
                                                                    name="btnDelete1" style="cursor: hand;">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="RowEdit" style="display: inline" valign="top" align="right">
                            <table id="Table18" style="width: 696px; height: 582px" cellspacing="5" cellpadding="0"
                                align="right" border="0">
                                <tbody class="label">
                                    <tr>
                                        <td class="Label" style="height: 601px" valign="top" align="center" width="50%" colspan="1">
                                            <table class="label" id="Table8" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; width: 263px; border-bottom: lightblue thin solid;
                                                height: 501px" cellspacing="0" cellpadding="0" width="263" align="right" border="0">
                                                <tbody class="label">
                                                    <tr>
                                                        <td class="Label" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                            border-left: lightblue thin outset; width: 340px; border-bottom: lightblue thin solid;
                                                            height: 50px" valign="top" width="60%" bgcolor="#91b7df">
                                                            <table id="Table2" cellspacing="5" cellpadding="0" align="right" border="0">
                                                                <tr>
                                                                    <td class="VertGradient1" id="TdDefGroup" style="border-right: lightblue thin inset;
                                                                        border-top: lightblue thin solid; border-left: lightblue thin outset; width: 332px;
                                                                        border-bottom: lightblue thin solid; height: 33px" align="center" width="50%">
                                                                        گروه هاي کاربري
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="Label" style="height: 386px" valign="top" width="60%">
                                                            <table class="label" id="Table11" dir="rtl" style="width: 365px; height: 551px" height="551"
                                                                width="365" align="right" border="0">
                                                                <tr>
                                                                    <td id="RowDefGroup" style="display: inline; height: 176px" valign="top" width="100%">
                                                                        <table id="Table3" height="100%" cellspacing="1" cellpadding="1" width="100%" align="right"
                                                                            border="0">
                                                                            <tr>
                                                                                <td style="height: 15px">
                                                                                    نام
                                                                                </td>
                                                                                <td style="height: 15px">
                                                                                    <asp:TextBox ID="GroupName" runat="server" CssClass="TxtControls" Width="280px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 18px" valign="top">
                                                                                    شرح
                                                                                </td>
                                                                                <td style="height: 18px">
                                                                                    <asp:TextBox ID="Descr" runat="server" CssClass="TxtControls" Width="280px" Height="48px"
                                                                                        TextMode="MultiLine"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 33px" valign="top" align="center" colspan="2">
                                                                                    <input class="btnSelectPerson" id="btnSelectPerson" style="width: 125px; height: 30px;
                                                                                        cursor: hand;" onclick="onclickBtnSelectPerson()" type="button" name="btnSelectPerson">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 41px" valign="top" colspan="2">
                                                                                    <table id="Table13" style="width: 356px; height: 46px" cellspacing="1" cellpadding="1"
                                                                                        width="356" border="0">
                                                                                        <tr>
                                                                                            <td>
                                                                                                ش.پرسنلي
                                                                                            </td>
                                                                                            <td>
                                                                                                <input class="txtControls" id="txtPersonId" onblur="onBlurtxtPersonId()" style="width: 52px;
                                                                                                    height: 21px" type="text" size="3" name="txtPersonId" runat="server">
                                                                                            </td>
                                                                                            <td>
                                                                                                نام
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="LblName" runat="server" Width="215px" ForeColor="DeepPink"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" colspan="2">
                                                                                    <div class="DivStyle" style="width: 345px; height: 300px">
                                                                                        <table id="Table4" style="width: 344px; height: 300px" cellspacing="1" cellpadding="1"
                                                                                            width="344" align="right" border="0">
                                                                                            <tr>
                                                                                                <td style="height: 18px" align="center">
                                                                                                    <table id="Table12" style="width: 264px; height: 8px" cellspacing="1" cellpadding="1"
                                                                                                        align="center" border="0">
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <input class="CssLastPage" id="LastBtn_X" style="width: 35px; height: 35px" onclick="LastBtn_XClick()"
                                                                                                                    type="button" name="LastBtn_X">
                                                                                                            </td>
                                                                                                            <td align="right">
                                                                                                                <input class="CssNextPage" id="NextBtn_X" style="width: 35px; height: 35px; cursor: hand;"
                                                                                                                    onclick="NextBtn_XClick()" type="button" name="NextBtn_X">
                                                                                                            </td>
                                                                                                            <td valign="middle" align="right">
                                                                                                                <input id="CurPage_X" style="width: 50px; border-top-style: groove; border-right-style: groove;
                                                                                                                    border-left-style: groove; height: 25px; border-bottom-style: groove" type="text"
                                                                                                                    onchange="CurPage_XTextChanged()" name="CurPage_X">
                                                                                                            </td>
                                                                                                            <td dir="rtl" valign="middle" align="right">
                                                                                                                &nbsp;از
                                                                                                            </td>
                                                                                                            <td valign="middle">
                                                                                                                <input id="ToatalPage_X" style="width: 50px; border-top-style: groove; border-right-style: groove;
                                                                                                                    border-left-style: groove; height: 25px; border-bottom-style: groove" type="text"
                                                                                                                    size="12" name="ToatalPage_X">
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <input class="CssPrevPage" id="PrevBtn_X" style="width: 35px; height: 35px" onclick="PrevBtn_XClick()"
                                                                                                                    type="button" name="PrevBtn_X">
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <input class="CssFirstPage" id="FirstBtn_X" style="width: 35px; height: 35px" onclick="FirstBtn_XClick()"
                                                                                                                    type="button" name="FirstBtn_X">
                                                                                                            </td>
                                                                                                            <td style="display: none">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td valign="top">
                                                                                                    <table id="grdPerson_Header">
                                                                                                        <thead style="display: inline">
                                                                                                            <tr class="ShoperHeaderStyle">
                                                                                                                <td class="Headerstyle" align="center" width="35">
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                                <td class="Headerstyle" align="center" width="150">
                                                                                                                    شماره پرسنلي
                                                                                                                </td>
                                                                                                                <td class="Headerstyle" align="center" width="250">
                                                                                                                    عنوان
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                    </table>
                                                                                                    <table id="grdPerson">
                                                                                                        <thead style="display: none">
                                                                                                            <tr>
                                                                                                                <td align="center">
                                                                                                                </td>
                                                                                                                <td align="center">
                                                                                                                </td>
                                                                                                                <td align="center">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td style="height: 601px" valign="top" align="right">
                                            <table id="TableAccess" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; width: 315px; border-bottom: lightblue thin solid;
                                                height: 578px" height="578" cellspacing="1" cellpadding="1" width="315" border="0">
                                                <tr>
                                                    <td style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                        border-left: lightblue thin outset; width: 340px; border-bottom: lightblue thin solid;
                                                        height: 50px" valign="top" bgcolor="#91b7df">
                                                        <table id="Table9" style="height: 43px" height="43" cellspacing="5" cellpadding="0"
                                                            width="100%" align="right" border="0">
                                                            <tr>
                                                                <td class="VertGradient1" id="TdTreeRole" style="border-right: lightblue thin inset;
                                                                    border-top: lightblue thin solid; border-left: lightblue thin outset; width: 332px;
                                                                    border-bottom: lightblue thin solid; height: 33px" onclick="onclickTdTreeRole()"
                                                                    align="center" width="50%">
                                                                    حقوق دسترسي سيستمها
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="right">
                                                        <table id="Table6" style="height: 405px" height="421" cellspacing="0" cellpadding="0"
                                                            width="100%" align="right">
                                                            <tr>
                                                                <td valign="top" colspan="2">
                                                                    <table id="Table1" style="width: 298px; height: 36px" cellspacing="1" cellpadding="1"
                                                                        width="298" align="right" border="0">
                                                                        <tr>
                                                                            <td style="width: 68px" valign="middle">
                                                                                نام سيستم
                                                                            </td>
                                                                            <td valign="middle">
                                                                                <cc1:lcombo id="selSubSys" ConnectionName="SysCnn" runat="server" CssClass="TxtControls"
                                                                                    LookupName="SubSys" Width="156px">
                                                                                </cc1:lcombo>
                                                                            </td>
                                                                            <td valign="top">
                                                                                <input class="CssBtnLimitSerach" id="BtnLimitSubSys" dir="rtl" title="نمايش محدود"
                                                                                    style="width: 35px; height: 32px; cursor: hand;" type="button" name="BtnLimitSubSys"
                                                                                    runat="server">
                                                                            </td>
                                                                            <td valign="top">
                                                                                <input class="CssBtnShow" id="BtnShowSubSys" dir="rtl" title="نمايش" style="width: 35px;
                                                                                    height: 32px; cursor: hand; display: none;" type="button" name="BtnShowSubSys"
                                                                                    runat="server">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td id="Td3" dir="rtl" style="height: 313px" valign="top" colspan="2">
                                                                    <div id="divTreeRole" style="scrollbar-highlight-color: white; overflow: auto; width: 300px;
                                                                        scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 513px" align="right"
                                                                        runat="server">
                                                                        <cc1:tree id="Tree2" runat="server" Width="219px">
                                                                        </cc1:tree></div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Label" valign="top" align="center" width="50%" colspan="2">
                                            <hr class="CssHorizontalLine" style="width: 100%; height: 2px" size="1">
                                            <table id="Table5" style="width: 3px; height: 38px" align="center" border="0">
                                                <tr>
                                                    <td width="33%">
                                                        <input class="CssbtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew"
                                                            style="cursor: hand;">
                                                    </td>
                                                    <td width="33%">
                                                        <input class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"
                                                            style="cursor: hand;">
                                                    </td>
                                                    <td width="33%">
                                                        <input class="CssbtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button"
                                                            name="btnCancel" style="cursor: hand;">
                                                    </td>
                                                    <td style="display: none">
                                                        <input type="text" id="txtSessionID" runat="server" name="txtSessionID">
                                                        <input id="parent" style="width: 1px" type="hidden" name="parent">
                                                        <input id="BeforePrevStyle" style="width: 1px" type="hidden" size="1" name="BeforePrevStyle">
                                                        <input id="PrevrecID" style="width: 1px" type="hidden" size="1" name="PrevrecID">
                                                        <input id="recID" style="width: 1px" type="hidden" size="1" name="recID">
                                                        <input id="PageName" style="width: 1px" type="hidden" size="1" value="Group" name="PageName">
                                                        <cc1:mysecurity id="onlineuser" runat="server">
                                                        </cc1:mysecurity><asp:TextBox ID="XMLRole" Style="display: none" runat="server" Width="200px"></asp:TextBox><asp:TextBox
                                                            ID="XMLAccessRole" Style="display: none" runat="server" Width="1px"></asp:TextBox><input
                                                                id="Active" style="display: none; width: 1px" type="text" name="Active" runat="server">
                                                        <input id="GroupId" style="display: none; width: 1px" type="text" name="GroupId"
                                                            runat="server">
                                                        <input id="txtCompanyFinatialPeriodID" style="display: none; width: 1px" type="text"
                                                            name="txtCompanyFinatialPeriodID" runat="server">
                                                        <input id="XMLGroup" style="display: none; width: 1px" type="text" name="XMLGroup"
                                                            runat="server">
                                                        <input id="ModeSave" style="display: none; width: 1px" type="text" name="ModeSave"
                                                            runat="server">
                                                        <input id="XMLGroupMember" style="display: none; width: 1px" type="text" name="XMLGroupMember"
                                                            runat="server">
                                                        <input id="ModeDelete" style="display: none; width: 1px" type="text" name="ModeDelete"
                                                            runat="server">
                                                        <asp:TextBox ID="XMLMemberAccess" Style="display: none" runat="server"></asp:TextBox><input
                                                            id="XMLGroupTitle" style="display: none; width: 1px" type="text" name="XMLGroupTitle"
                                                            runat="server">
                                                        <input id="txtXmlSubSys" style="display: none; width: 100px" type="text" name="txtXmlSubSys"
                                                            runat="server">
                                                        <input id="txtXMLCmbPage" style="display: none; width: 1px" type="text" name="txtXMLCmbPage"
                                                            runat="server" />
                                                        <input id="txtCmbPageValue" style="display: none; width: 1px" type="text" name="txtCmbPageValue"
                                                            runat="server" />
                                                        <input id="txtCmbsysvalue" style="display: none; width: 1px" type="text" name="txtCmbsysvalue"
                                                            runat="server" />
                                                        <input id="txtXMLCmbSubSys" style="display: none; width: 1px" type="text" name="txtXMLCmbSubSys"
                                                            runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
