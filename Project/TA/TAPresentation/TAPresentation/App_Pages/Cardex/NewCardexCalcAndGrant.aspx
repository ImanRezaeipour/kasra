<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewCardexCalcAndGrant.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.NewCardexCalcAndGrant"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام کاردکس:
                        </td>
                        <td width="150px">
                            <select id="cmbCardexID" Width="130px"  onchange="onchangecmbCardexID()" runat="server" >
                                <option></option>
                            </select>
                            
                        </td>
                        <td>
                            دوره کاردکس:
                        </td>
                        <td>
                            <select id="cmbCardexPeriodID" Width="130px"  runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            نوع اعطا:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbType" runat="server" Width="130px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            تاریخ اعمال:
                        </td>
                        <td>
                            <uc1:KCalendar ID="KCalActionDate" runat="server" />
                        </td>
                        <td>
                            توضيحات:
                        </td>
                        <td colspan="3">
                            <input id="txtDesc" style="width: 427px;" type="text" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <input id="opTableCalc" type="radio" checked name="Group1"  />
                            محاسبه طبق جدول پائين&nbsp;&nbsp;&nbsp;
                            <input id="opRuleCalc" type="radio" name="Group1"  />محاسبه طبق قانون
                            تعريف شده&nbsp;&nbsp;&nbsp;
                            <input id="opLastUpdate" type="radio" name="Group1"  />
                            برابر با آخرين اعطاء&nbsp;&nbsp;&nbsp;
                            <input id="opLastBase" type="radio" name="Group1"  />
                            محاسبه طبق مقدار پايه
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="ttt" style="border: 1px double #3399FF" width="100%">
                    <tr>
                        <td>
                            <input id="chkPerson" type="radio" checked value="Radio1" name="Group" runat="server" />پرسنل
                            جديد&nbsp;
                            <input id="chkGroup" type="radio" value="Radio1" name="Group" runat="server" />گروه
                            جديد
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            <table id="grdPerson_Header" style="width: 695px;">
                                <tr>
                                    <td class="CssHeaderStyle" align="center" width="25px">
                                        <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                            type="checkbox" />
                                    </td>
                                    <td class="CssHeaderStyle" align="center" width="25px">
                                    </td>
                                    <td class="CssHeaderStyle" align="center" width="90px">
                                        شماره
                                    </td>
                                    <td class="CssHeaderStyle" align="center" width="150px">
                                        نام گروه/پرسنل
                                    </td>
                                    <td class="CssHeaderStyle" align="center" width="205px">
                                        مقدار ثابت
                                    </td>
                                    <td class="CssHeaderStyle" align="center" width="200px">
                                        به ازاء هر روز کارکرد
                                    </td>
                                </tr>
                            </table>
                            <div class="cssDiv" align="center" style="width: 710px; height: 350px;">
                                <table id="grdPerson" width="695px">
                                </table>
                            </div>
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
                        if (StrVal == "Save") {
                            returnValue = $get(MasterObj + "txtAlert").value
                            window.close()
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
                        </div>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        
                    </Triggers>
                </asp:UpdatePanel> 
                <div style="display:none">
                        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                <input type="text" id="txtCurDate" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                <input id="txtSubmit" runat="server" type="hidden" />
                <input type="text" id="txtCardexPeriodXML" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">
        
        var OUserFlag = ""
        var OSelectedMamber = ""
        var OValidUserXml = ""
        var tSelectedMamber = ""
        var newrowindex = 0

        var PageSize = 10
        var currentPage_X = 0
        var strXPathConditions = ""
        var PageSize_X = 10
        returnValue = ""
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowGroupPerson() {

            var strOptions = ""
            var url
            if (document.getElementById(MasterObj + "chkGroup").checked == true) {

                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=2&Type=Check&&WDFlag=0&ParentPage=NewCardexCalcAndGrant"
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "chkPerson").checked == true) {
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

                if (document.getElementById("grdPerson").rows.length > 0) {
                    if (confirm('پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟')) {
                        ClearGrd(document.getElementById("grdPerson"))
                        tSelectedMamber = ''
                    }
                }

                //===============
                switch (OUserFlag) {
                    case "P":
                        OSelectedMamber = GetDataPerson()
                        break;
                    default:
                        OSelectedMamber = GetDataGroup()
                }
                //===============

                if (OSelectedMamber != "") {
                    OValidUserXml = OSelectedMamber
                    XTableInitialize(document.getElementById("grdPerson"))
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function XTableInitialize(oGrd) {
            document.getElementById('OToolBar_txtCurPage').value = 0

            FillTabTable('First', oGrd)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
                    if (Username.length > 15) {
                        SUsername = Username.substr(0, 15) + "..."
                    }
                    else {
                        SUsername = Username
                    }
                    AddRow(oGrd
					, xmlNodes.item(x).selectSingleNode('UserFlag').text
					, xmlNodes.item(x).selectSingleNode('PersonID').text
					, Username
					, SUsername
					, xmlNodes.item(x).selectSingleNode('Selected').text
					, xmlNodes.item(x).selectSingleNode('Rationtxt').text
					, xmlNodes.item(x).selectSingleNode('RationDay').text
					, xmlNodes.item(x).selectSingleNode('RationHour').text
					, xmlNodes.item(x).selectSingleNode('Selected').text
					)
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRow(oGrid, UserFlag, UserID, Username, SUsername, Selected, Rationtxt, RationDay, RationHour) {
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
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()

            var tempSrc = "";
            var picTitle = "";
            var NameTitle = Username
            switch (UserFlag) {
                case "P":
                    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = 'پرسنل'
                    break
                case "G":
                    tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "'گروه پرسنلي'"
                    break
            }
            oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' onclick='OnClickChk(this)' >"

            if (Selected == 1) {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = true
            }
            else {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = false
            }
            oGrid.rows(newrowindex).cells(1).innerHTML = "<img src=" + tempSrc + " title=" + picTitle + "  border='0' />"
            oGrid.rows(newrowindex).cells(2).innerHTML = UserID;
            oGrid.rows(newrowindex).cells(3).innerHTML = "<div style='DISPLAY: inline; HEIGHT: 15px';width:100%; ms_positioning='FlowLayout' title='" + NameTitle + "'>" + SUsername + "</div>"
            oGrid.rows(newrowindex).cells(4).innerHTML = "<input type='text' onblur='txtOnblur1(this)' onkeydown='OnKeyDownNum(" + '"' + 'integer' + '"' + ",this.value)' style='WIDTH: 50px'/> روز <input type='text' onblur='txtOnblur1(this)' style='WIDTH: 50px'/> ساعت"
            oGrid.rows(newrowindex).cells(5).innerHTML = "<input type='text' onblur='txtOnblur2(this)' style='WIDTH: 50px'/> ساعت"
            if (Rationtxt == 1) {
                oGrid.rows(newrowindex).cells(4).childNodes(0).value = RationDay
                oGrid.rows(newrowindex).cells(4).childNodes(2).value = RationHour
                oGrid.rows(newrowindex).cells(5).childNodes(0).disabled = true
                oGrid.rows(newrowindex).cells(5).childNodes(0).className = "txtControlsReadonly"
            }
            else if (Rationtxt == 2) {
                oGrid.rows(newrowindex).cells(5).childNodes(0).value = RationHour
                oGrid.rows(newrowindex).cells(4).childNodes(0).disabled = true
                oGrid.rows(newrowindex).cells(4).childNodes(0).className = "txtControlsReadonly"
                oGrid.rows(newrowindex).cells(4).childNodes(2).disabled = true
                oGrid.rows(newrowindex).cells(4).childNodes(2).className = "txtControlsReadonly"
            }   
            
            oGrid.rows(newrowindex).align = "center"

            oGrid.rows(newrowindex).cells(0).style.width = "25px"
            oGrid.rows(newrowindex).cells(1).style.width = "25px"
            oGrid.rows(newrowindex).cells(2).style.width = "90px"
            oGrid.rows(newrowindex).cells(3).style.width = "150px"
            oGrid.rows(newrowindex).cells(4).style.width = "205px"
            oGrid.rows(newrowindex).cells(5).style.width = "200px"
            newrowindex = newrowindex + 1
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function GetDataPerson() {
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
                    strSelectedMamber += '<Person>'
                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('PersonCode').text + '</PersonID>'
                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('PersonName').text + '</Family>'
                    strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                    strSelectedMamber += '<Selected>1</Selected>'
                    strSelectedMamber += '<Rationtxt></Rationtxt>'
                    strSelectedMamber += '<RationDay></RationDay>'
                    strSelectedMamber += '<RationHour></RationHour>'
                    strSelectedMamber += '</Person>'
                }
            }
            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)
            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function GetDataGroup() {
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
                    strSelectedMamber += '<Person>'
                    strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('GroupId').text + '</PersonID>'
                    strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('GroupName').text + '</Family>'
                    strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                    strSelectedMamber += '<Selected>1</Selected>'
                    strSelectedMamber += '<Rationtxt></Rationtxt>'
                    strSelectedMamber += '<RationDay></RationDay>'
                    strSelectedMamber += '<RationHour></RationHour>'
                    strSelectedMamber += '</Person>'
                }
            }

            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)
            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function txtOnblur1(obj) {
           var oRow = obj.parentNode.parentNode
            if (oRow.cells(4).childNodes(2).value != "")
                Timechk(oRow.cells(4).childNodes(2))

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            var root = "/UserEntity/Person"
            xmlDoc.loadXML(tSelectedMamber);
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1][UserFlag='" + oRow.UserFlag + "'][PersonID='" + oRow.cells(2).innerText + "']");

            if ((obj.value != "") ||(oRow.cells(4).childNodes(2).value!="")) {
                oRow.cells(5).firstChild.disabled = true 
                oRow.cells(5).firstChild.className = "txtControlsReadonly"
                xmlNodes.item(0).selectSingleNode('Rationtxt').text = 1 
                xmlNodes.item(0).selectSingleNode('RationDay').text = oRow.cells(4).childNodes(0).value
                xmlNodes.item(0).selectSingleNode('RationHour').text = oRow.cells(4).childNodes(2).value
            }
            else {
                oRow.cells(5).firstChild.disabled = false
                oRow.cells(5).firstChild.className = ""
                xmlNodes.item(0).selectSingleNode('Rationtxt').text = 0
                xmlNodes.item(0).selectSingleNode('RationDay').text = ""
                xmlNodes.item(0).selectSingleNode('RationHour').text = ""
            }
            tSelectedMamber = xmlDoc.xml
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function txtOnblur2(obj) {
            var oRow = obj.parentNode.parentNode
            Timechk(obj)
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            var root = "/UserEntity/Person"
            xmlDoc.loadXML(tSelectedMamber);
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1][UserFlag='" + oRow.UserFlag + "'][PersonID='" + oRow.cells(2).innerText + "']");

            if (obj.value != "")  {
                oRow.cells(4).childNodes(0).disabled = true
                oRow.cells(4).childNodes(0).className = "txtControlsReadonly"
                oRow.cells(4).childNodes(2).disabled = true
                oRow.cells(4).childNodes(2).className = "txtControlsReadonly"
                xmlNodes.item(0).selectSingleNode('Rationtxt').text = 2
                xmlNodes.item(0).selectSingleNode('RationDay').text = ""
                xmlNodes.item(0).selectSingleNode('RationHour').text = obj.value
            }
            else {
                oRow.cells(4).childNodes(0).disabled = false
                oRow.cells(4).childNodes(0).className = ""
                oRow.cells(4).childNodes(2).disabled = false
                oRow.cells(4).childNodes(2).className = ""
                xmlNodes.item(0).selectSingleNode('Rationtxt').text = 0
                xmlNodes.item(0).selectSingleNode('RationDay').text = ""
                xmlNodes.item(0).selectSingleNode('RationHour').text = ""
            }
            tSelectedMamber = xmlDoc.xml
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            var oRow = obj.parentNode.parentNode
            if (tSelectedMamber != '') {
                xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(tSelectedMamber);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var root = "/UserEntity/Person"
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID='" + oRow.cells(2).innerText + "']");
                if (obj.checked)
                    xmlNodes.item(0).selectSingleNode('Selected').text = 1
                else
                    xmlNodes.item(0).selectSingleNode('Selected').text = 0
                tSelectedMamber = xmlDoc.xml
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnclickSelectAllChk(obj) {
            var oGrid = document.getElementById("grdPerson")
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            
            xmlNodes = xmlDoc.documentElement.selectNodes(root);
            var Glen = oGrid.rows.length
            for (var j = 0; j < Glen; j++) {
                oGrid.rows(j).cells(0).firstChild.checked = obj.checked
                if (obj.checked)
                    xmlNodes.item(j).selectSingleNode('Selected').text = 1
                else
                    xmlNodes.item(j).selectSingleNode('Selected').text = 0
            }
            tSelectedMamber = xmlDoc.xml
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            var oGrid = document.getElementById("grdPerson")
            if (oGrid.rows.length == 0) {
                alert("هيچ پرسنلي انتخاب نشده است!!")
                return false
            }
            else if (document.getElementById(MasterObj + "cmbCardexID").value == 0) {
                alert("کاردکس مورد نظر را انتخاب نمائيد!!")
                document.getElementById(MasterObj + "cmbCardexID").focus()
                return false
            }
            else if (document.getElementById(MasterObj + "cmbCardexPeriodID").value == 0) {
                alert("دوره کاردکس مورد نظر را انتخاب نمائيد!!")
                document.getElementById(MasterObj + "cmbCardexPeriodID").focus()
                return false
            }
            else if (document.getElementById(MasterObj + "cmbType").value == 0) {
                alert("اعطاي مورد نظر را انتخاب نمائيد!!")
                document.getElementById(MasterObj + "cmbType").focus()
                return false
            }
            else if ((document.getElementById(MasterObj + "KCalActionDate_txtDay").value == "") || (document.getElementById(MasterObj + "KCalActionDate_txtMonth").value == "") || (document.getElementById(MasterObj + "KCalActionDate_txtYear").value == "")) {
                alert("تاريخ اعمال را انتخاب نمائيد!!")
                return false
            }
            return true
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            if (checkNotEmpty()) {
                
                var Option=0
                if(document.getElementById("opRuleCalc").checked)
				    Option=1
			    else if(document.getElementById("opTableCalc").checked)
				    Option=2
			    else if(document.getElementById("opLastUpdate").checked)
				    Option=3
			    else if(document.getElementById("opLastBase").checked)
				    Option=4
    			
			    var strXml=""
			    strXml+="<Parameters>"
			    strXml+="<CardexID>"+document.getElementById(MasterObj+"cmbCardexID").value+"</CardexID>"
			    strXml+="<CardexPeriodID>"+document.getElementById(MasterObj+"cmbCardexPeriodID").value+"</CardexPeriodID>"
			    strXml+="<RationID>"+document.getElementById(MasterObj+"cmbType").value+"</RationID>"
			    strXml+="<ActionDate>"+document.getElementById(MasterObj + "KCalActionDate_txtYear").value +"/"+document.getElementById(MasterObj + "KCalActionDate_txtMonth").value +"/"+document.getElementById(MasterObj + "KCalActionDate_txtDay" ).value+"</ActionDate>"
			    strXml+="<Caption>"+document.getElementById(MasterObj + "txtDesc").value+"</Caption>"
			    strXml+="<GrantDate>"+document.getElementById(MasterObj + "txtCurDate").value+"</GrantDate>"
			    strXml+="<Option>"+Option+"</Option>"
			    strXml+="</Parameters>"
			    document.getElementById(MasterObj+"txtXMLSave").value="<RationEntity>"+strXml+tSelectedMamber+"</RationEntity>"
			   //alert(document.getElementById(MasterObj+"txtXMLSave").value)
			    document.getElementById(MasterObj + "txtSubmit").value = "Save";
			    document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbCardexID() {

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtCardexPeriodXML").value);
            var xmlNodes;

            if (document.getElementById(MasterObj + "cmbCardexID").value == 0) {
                xmlNodes = xmlDoc.documentElement.selectNodes("/CardexEntity/CardexPeriodName");
                document.getElementById(MasterObj + 'cmbCardexPeriodID').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbCardexPeriodID').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbCardexPeriodID').all(0).innerText = 'انتخاب نشده'
                document.getElementById(MasterObj + 'cmbCardexPeriodID').all(0).value = 0

                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').all(j).innerText = xmlNodes.item(i).selectSingleNode('CardexPeriodName').text
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').all(j).value = xmlNodes.item(i).selectSingleNode('PeriodID').text
                        j++
                    }
                }

                document.getElementById(MasterObj + "cmbCardexPeriodID").value = 0
            }
            else {

                xmlNodes = xmlDoc.documentElement.selectNodes("/CardexEntity/CardexPeriodName[CardexID=" + document.getElementById(MasterObj + "cmbCardexID").value + "]");
                document.getElementById(MasterObj + 'cmbCardexPeriodID').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbCardexPeriodID').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbCardexPeriodID').all(0).innerText = 'انتخاب نشده'
                document.getElementById(MasterObj + 'cmbCardexPeriodID').all(0).value = 0
                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').all(j).innerText = xmlNodes.item(i).selectSingleNode('CardexPeriodName').text
                        document.getElementById(MasterObj + 'cmbCardexPeriodID').all(j).value = xmlNodes.item(i).selectSingleNode('PeriodID').text
                        j++
                    }
                }
                if (xmlNodes.length == 1) {
                    document.getElementById(MasterObj + "cmbCardexPeriodID").value = xmlNodes.item(0).selectSingleNode('PeriodID').text
                }
                else {
                    document.getElementById(MasterObj + "cmbCardexPeriodID").value = 0
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
