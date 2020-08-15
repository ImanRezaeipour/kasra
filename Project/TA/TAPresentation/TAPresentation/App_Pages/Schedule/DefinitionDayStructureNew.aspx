<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefinitionDayStructureNew.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefinitionDayStructureNew"
    ValidateRequest="false" 
    Title="--------------------------------------------------------------------------------------------------------------------"
    %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" Paging=1 runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";

                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if (document.getElementById(MasterObj + "txtAlert").value != "") {
                            if (document.getElementById(MasterObj + "txtValidate").value == 0)
                                alert($get(MasterObj + "txtAlert").value);
                            else
                                SetMsg($get(MasterObj + "txtAlert").value);
                            document.getElementById(MasterObj + "txtAlert").value = ""
                            returnValue = 1
                        }
                        
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام ساختار:
                        </td>
                        <td>
                            <input id="txtName" class="TxtControls" name="txtName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام مخفف:
                        </td>
                        <td>
                            <input id="txtAcronym" class="TxtControls" name="txtName" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            توضيحات:
                        </td>
                        <td>
                            <input style="z-index: 0; width: 331px; height: 60px" id="txtDesc" class="TxtControls"
                                name="txtDesc" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 289px">
                            <fieldset style="z-index: 0; width: 436px; height: 298px" dir="rtl" class="CssPage"
                                align="middle">
                                <legend style="width: 30px">اعضا</legend>
                                <table style="width: 425px; height: 87.06%" id="Table10" border="0" cellspacing="0"
                                    cellpadding="0" width="425" align="center">
                                    <tr>
                                        <td style="width: 129px; height: 219px" valign="top" align="center">
                                            <table style="width: 114px; height: 139px" id="Table13" border="0" cellspacing="1"
                                                cellpadding="1" width="114">
                                                <tr>
                                                    <td style="width: 22px; height: 22px" valign="bottom" align="center">
                                                        <input id="ChkRole" type="radio" name="GroupChk" checked />
                                                    </td>
                                                    <td style="height: 22px" valign="bottom">
                                                        واحد سازماني
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px; height: 22px" valign="bottom" align="center">
                                                        <input id="ChkTabl" type="radio" name="GroupChk" />
                                                    </td>
                                                    <td style="height: 22px" valign="bottom">
                                                        دفتر تابل
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px; height: 22px" valign="bottom" align="center">
                                                        <input id="ChkPersonelGroup" type="radio" name="GroupChk" />
                                                    </td>
                                                    <td style="height: 22px" valign="bottom">
                                                        گروه پرسنلي
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 22px; height: 22px" valign="bottom" align="center">
                                                        <input id="ChkPersonel" type="radio" name="GroupChk" />
                                                    </td>
                                                    <td style="height: 22px" valign="bottom">
                                                        پرسنل
                                                    </td>
                                                </tr>
                                            </table>
                                            <input style="width: 125px; height: 32px; cursor: pointer" id="BtnSelectPerson" class="btnSelectPerson"
                                                title="انتخاب اعضاي گروه" onclick="onClickBtnSelectPerson()" type="button" name="BtnSelectPerson" />
                                        </td>
                                        <td style="height: 219px" valign="top" align="center">
                                            <table id="Table27" style="width: 280px; height: 14px" height="14" cellspacing="1"
                                                cellpadding="1" align="center" border="0">
                                                <tr>
                                                    <td align="right">
                                                        <input class="CssLastPage" id="LastBtn_X" style="width: 35px; height: 35px" onclick="LastBtn_XClick(1)"
                                                            type="button" name="LastBtn_X" />
                                                    </td>
                                                    <td align="right">
                                                        <input class="CssNextPage" id="NextBtn_X" style="width: 35px; height: 35px" onclick="NextBtn_XClick(1)"
                                                            type="button" name="NextBtn_X" />
                                                    </td>
                                                    <td valign="middle" align="right">
                                                        <input id="CurPage_X" style="border-bottom-style: groove; border-right-style: groove;
                                                            width: 50px; border-top-style: groove; height: 25px; border-left-style: groove"
                                                            onchange="CurPage_XTextChanged(1)" name="CurPage_X" />
                                                    </td>
                                                    <td dir="rtl" valign="middle" align="right">
                                                        &nbsp;از
                                                    </td>
                                                    <td valign="middle">
                                                        <input id="ToatalPage_X" style="border-bottom-style: groove; border-right-style: groove;
                                                            width: 50px; border-top-style: groove; height: 25px; border-left-style: groove"
                                                            size="6" name="ToatalPage_X" />
                                                    </td>
                                                    <td>
                                                        <input class="CssPrevPage" id="PrevBtn_X" style="width: 35px; height: 35px" onclick="PrevBtn_XClick(1)"
                                                            type="button" name="PrevBtn_X" />
                                                    </td>
                                                    <td>
                                                        <input class="CssFirstPage" id="FirstBtn_X" style="width: 35px; height: 35px" onclick="FirstBtn_XClick(1)"
                                                            type="button" name="FirstBtn_X">
                                                    </td>
                                                    <td style="display: none">
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 255px; height: 35px" id="XTabTable_Header">
                                                <thead style="display: inline">
                                                    <tr class="ShoperHeaderStyle">
                                                        <td style="width: 3px" class="Headerstyle" align="center">
                                                            <input id="chkAll" onclick="SelectAllChk_Onclick(GrdValidUser,this)" type="checkbox"
                                                                name="chkAll" />
                                                        </td>
                                                        <td class="Headerstyle" align="center">
                                                            نام
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <div style="scrollbar-arrow-color: black; width: 255px; scrollbar-base-color: #b0c4de;
                                                height: 78.9%; scrollbar-highlight-color: white; overflow: auto" class="DivStyle">
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
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div style="display: none">
                                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                                <input type="text" id="txtXMLSave" runat="server" />
                                <input type="text" runat="server" id="txtGroupPersonID" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" runat="server" id="txtStructureID" />
                                <input type="text" id="txtXmlPage" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                                <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                                <input id="txtValidUserXml" name="txtValidUserXml" runat="server" />
                                <input id="txtSelectedMamber" name="txtSelectedMamber" runat="server" />
                                <input id="txtUserFlag" name="txtUserFlag" runat="server" />
                                <input id="tSelectedMamber" name="tSelectedMamber" runat="server" />
                                <input id="txtXmlShowMember" name="txtXmlShowMember" runat="server" />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">

        if ($get(MasterObj + "txtStructureID").value != 0 && $get(MasterObj + "txtStructureID").value != "")
            BindPage();
        //_____________________________
        var strXPathConditions = ""
        var PageSize = 10
        var PageSize_X = 6
        var currentPage_X = 0
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
            if ($get(MasterObj + "txtXmlPage").value != "") {
                var strXml = $get(MasterObj + "txtXmlPage").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/ScheduleEntity/Person");

                strShowXml = "<UserEntity>";
                if (oXmlNodes.length > 0) {
                    for (var x = 0; x < oXmlNodes.length; x++) {
                        strShowXml += '<Person>'
                        strShowXml += '<PersonID>' + oXmlNodes.item(x).selectSingleNode('PersonID').text + '</PersonID>'
                        strShowXml += '<Family>' + oXmlNodes.item(x).selectSingleNode('Family').text + '</Family>'
                        strShowXml += '<UserFlag>' + oXmlNodes.item(x).selectSingleNode('UserFlag').text + '</UserFlag>'
                        strShowXml += '<Selected>1</Selected>'
                        strShowXml += '</Person>'
                    }


                }
                strShowXml += "</UserEntity>";
                $get(MasterObj + "txtXmlShowMember").value = strShowXml;
                $get(MasterObj + "tSelectedMamber").value = $get(MasterObj + "txtXmlShowMember").value
                $get(MasterObj + "txtSelectedMamber").value = $get(MasterObj + "txtXmlShowMember").value
                XTableInitialize(GrdValidUser);
                //alert(strShowXml);

            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtName").value = ""
            $get(MasterObj + "txtAcronym").value = ""
            $get(MasterObj + "txtDesc").value = ""
            $get(MasterObj + "txtStructureID").value =0
            
            document.getElementById("CurPage_X").value = 0
            document.getElementById("ToatalPage_X").value = 0
            document.getElementById("chkAll").checked = false
            document.getElementById(MasterObj + "tSelectedMamber").value = ""
            clearGrid(GrdValidUser)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty() == true) {
                MakeXML()
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var strXml = ''
            strXml = '<Detail><DetailCollection>'
            strXml += '<Name>' + document.getElementById(MasterObj + "txtName").value + '</Name>'
            strXml += '<Acronym>' + document.getElementById(MasterObj + "txtAcronym").value + '</Acronym>'

            if (document.getElementById(MasterObj + "txtDesc").value != "")
                strXml += '<Desc>' + document.getElementById(MasterObj + "txtDesc").value + '</Desc>'

            strXml += '</DetailCollection>'

            //-----------------------------Members------------------------------------------------------------------
            if (document.getElementById(MasterObj + "tSelectedMamber").value != "") {
                var tempUserFlag = ""
                var type

                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var root = "/UserEntity/Person"
                var xmlNodes = xmlDoc.documentElement.selectNodes(root)
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1]");

                if (xmlNodes.length > 0)
                    for (var x = 0; x < xmlNodes.length; x++) {
                    strXml += "<Member>"
                    strXml += "<MemberID>" + xmlNodes.item(x).selectSingleNode('PersonID').text + "</MemberID>"
                    strXml += "<Type>" + xmlNodes.item(x).selectSingleNode('UserFlag').text + "</Type>"
                    strXml += "</Member>"
                }
            }
            strXml += '</Detail>'
            document.getElementById(MasterObj + "txtXMLSave").value = strXml

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "txtName").value == "") {
                alert("لطفا نام ساختار  را وارد نمائید")
                document.getElementById(MasterObj + "txtName").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "txtAcronym").value == "") {
                alert("لطفا نام مخفف را وارد نمائید")
                document.getElementById(MasterObj + "txtAcronym").focus()
                return false;
            }
//            else if (document.getElementById(MasterObj + "txtName").value == document.getElementById(MasterObj + "txtAcronym").value && $get(MasterObj + "txtStructureID").value == 0) {
//                alert("ایجاد ساختار با نام و نام مخفف یکسان خطا دارد")
//                document.getElementById(MasterObj + "txtAcronym").value = "";
//                document.getElementById(MasterObj + "txtAcronym").focus()
//                return false;
//            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //============================================================================================
        function onClickBtnSelectPerson() {
            //try
            //{
            var strOptions = ""
            var url

            if (document.getElementById("ChkTabl").checked == true) {
                document.getElementById(MasterObj + "txtUserFlag").value = "T";
                url = "/Ta/TAPeresentation/Pages/Shift/GetTableOffice.aspx"
                strOptions = "dialogHeight: 435px;dialogWidth: 430px;center: Yes;help: no;status: no"

            }
            else if (document.getElementById("ChkPersonelGroup").checked == true) {
                document.getElementById(MasterObj + "txtUserFlag").value = "G";
                url = "/Ta/TAPeresentation/Pages/BaseInfo/ValidGroupWithFilter.aspx?CategoryId=1";
                strOptions = "dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no";
            }
            else if (document.getElementById("ChkPersonel").checked == true) {
                document.getElementById(MasterObj + "txtUserFlag").value = "P";
                url = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx" + "?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
                strOptions = "dialogHeight: 750px;dialogWidth: 700px;center: Yes;help: no;status: no";
            }
            else if (document.getElementById("ChkRole").checked == true) {
                url = "/Ta/TAPeresentation/Pages/BaseInfo/Role.aspx" + "?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Page=TableOffice";
                strOptions = "dialogHeight: 650px;dialogWidth: 650px;center: Yes;help: no;status: no"
                document.getElementById(MasterObj + "txtUserFlag").value = "R"
            }
            else {
                return
            }
            //------------------------------------------------------------
            if (url != "") {
                document.getElementById(MasterObj + "txtSelectedMamber").value = window.showModalDialog(url, "", strOptions)
                url = ""
            }

            if (document.getElementById(MasterObj + "txtSelectedMamber").value != '') {

//                if (document.getElementById("GrdValidUser").rows.length > 0) {
//                    if (confirm('پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟')) {
//                        Cleargrd(GrdValidUser)
//                        document.getElementById(MasterObj + "tSelectedMamber").value = ''
//                    }
//                }

                //===============
                switch (document.getElementById(MasterObj + "txtUserFlag").value) {
                    case "P":
                        document.getElementById(MasterObj + "txtSelectedMamber").value = GetDataPerson()
                        break;
                    case "T":
                        document.getElementById(MasterObj + "txtSelectedMamber").value = GetTableOffice()
                        break
                    case 'R':
                        document.getElementById(MasterObj + "txtSelectedMamber").value = GetDataRole()
                        break
                    case 'G':
                        document.getElementById(MasterObj + "txtSelectedMamber").value = GetDataGroup()
                }
                //===============
                if (document.getElementById(MasterObj + "txtSelectedMamber").value != "") {
                    document.getElementById(MasterObj + "txtValidUserXml").value = document.getElementById(MasterObj + "txtSelectedMamber").value
                    // alert(document.getElementById(MasterObj+"txtSelectedMamber").value)
                    XTableInitialize(GrdValidUser)
                }

            }
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
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
        function GetDataPerson() {
            ////try
            //{

            var strSelectedMamber = document.getElementById(MasterObj + "txtSelectedMamber").value
            strSelectedMamber = strSelectedMamber.replace("<UserEntity>", "")
            strSelectedMamber = strSelectedMamber.replace("</UserEntity>", "")

            if (document.getElementById(MasterObj + "tSelectedMamber").value == "")
                document.getElementById(MasterObj + "tSelectedMamber").value = "<UserEntity></UserEntity>"

            document.getElementById(MasterObj + "tSelectedMamber").value = document.getElementById(MasterObj + "tSelectedMamber").value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'

            return (strSelectedMamber)
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}
        }
        //====================================================================================
        function GetDataGroup() {
            //try
            //{

            var Username = '', SUsername = ''

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtSelectedMamber").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetGroup[Selected=1]");

            if (document.getElementById(MasterObj + "tSelectedMamber").value == "")
                document.getElementById(MasterObj + "tSelectedMamber").value = "<UserEntity></UserEntity>";

            var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2, strSelectedMamber = ''

            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('GroupID').text
						+ " and UserFlag='" + document.getElementById(MasterObj + "txtUserFlag").value + "']");
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('GroupID').text + '</PersonID>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('Groupname').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + document.getElementById(MasterObj + "txtUserFlag").value + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }
            }

            document.getElementById(MasterObj + "tSelectedMamber").value = document.getElementById(MasterObj + "tSelectedMamber").value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //	}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}
        }
        //============================================================================================
        function GetDataRole() {
            var MemberName = '';
            var SMemberName = '';


            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtSelectedMamber").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/Role[Selected=1]");


            if (document.getElementById(MasterObj + "tSelectedMamber").value == "")
                document.getElementById(MasterObj + "tSelectedMamber").value = "<UserEntity></UserEntity>"

            var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;

            var strSelectedMamber = ''
            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('DepartmentID').text + " and UserFlag='R']");

                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonID>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('DepartmentTitle').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + document.getElementById(MasterObj + "txtUserFlag").value + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }
            }

            document.getElementById(MasterObj + "tSelectedMamber").value = document.getElementById(MasterObj + "tSelectedMamber").value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)

        }
        //================================================================================================================
        function GetTableOffice() {
            //try
            //{
            var Username = '';
            var SUsername = '';
            if (document.getElementById(MasterObj + "tSelectedMamber").value == "")
                document.getElementById(MasterObj + "tSelectedMamber").value = "<UserEntity></UserEntity>"

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtSelectedMamber").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes = xmlDoc.documentElement.selectNodes("/OfficeEntity/GetOfficeTable[selected=1]");

            var xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2, strSelectedMamber = ""

            if (xmlNodes.length > 0) {
                for (var x = 0; x < xmlNodes.length; x++) {
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('TableOfficeId').text + " and UserFlag='T']");
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('TableOfficeId').text + '</PersonID>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('BTableOfficeName').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + document.getElementById(MasterObj + "txtUserFlag").value + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }

            }
            document.getElementById(MasterObj + "tSelectedMamber").value = document.getElementById(MasterObj + "tSelectedMamber").value.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)
            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}	
        }
        //============================================================================================
        function XTableInitialize(oGrd) {

            document.getElementById("CurPage_X").value = 0
            //document.getElementById("CurPage_XS").value = 0

            document.getElementById("chkAll").checked = true
            // document.getElementById("chkAllSimple").checked = true

            FillTabTable('First', oGrd)
        }
        //================================================================================================================
        function FillTabTable(direction, oGrd) {
            clearGrid(oGrd)
            if (document.getElementById(MasterObj + "tSelectedMamber").value == "") {
                document.getElementById(MasterObj + "tSelectedMamber").value = "<UserEntity></UserEntity>"
            }
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            //            var x;

            //            var xPath = ''
            //            xPath = ''
            //            var root = "/UserEntity/Person"
            //            if (xPath != '' || strXPathConditions != '') {
            //                if (xPath != '' && strXPathConditions != '')
            //                    xPath = strXPathConditions + ' and ' + xPath
            //                if (xPath == '' && strXPathConditions != '')
            //                    xPath = strXPathConditions
            //                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[" + xPath + "]");
            //            }
            //            else
            xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
            if (xmlNodes.length == 0)
                return;


            var totalRecords
            totalRecords = xmlNodes.length

            document.getElementById("ToatalPage_X").value = Math.ceil(totalRecords / 6)

            if (totalRecords > 0) {
                if (oGrd == document.getElementById("GrdValidUser"))
                    currentPage_X = parseInt(document.getElementById("CurPage_X").value)
                //                else if (oGrd == document.getElementById("GrdUserSimple"))
                //                    currentPage_X = parseInt(document.getElementById("CurPage_XS").value)


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
                        currentPage_X = parseInt(document.getElementById("ToatalPage_X").value)
                        break
                }
                document.getElementById("CurPage_X").value = currentPage_X
                // document.getElementById("CurPage_XS").value = currentPage_X

                var endFor
                if ((currentPage_X * 6) - 1 < 0)
                    return
                if (totalRecords <= (currentPage_X * 6) - 1)
                    endFor = totalRecords - 1
                else
                    endFor = parseInt((document.getElementById("CurPage_X").value) * 6) - 1

                x = (currentPage_X - 1) * 6

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
                //                else
                //                    document.getElementById("chkAllSimple").checked = FlagCheck

            }
        }
        //=================================================================================================================		
        function CurPage_XTextChanged(flagGrid) {
            var cnt = 0
            var oGrd
            if (flagGrid == 1) {
                oGrd = document.getElementById("GrdValidUser")
                if (parseInt(document.getElementById("CurPage_X").value) <= parseInt(document.getElementById("ToatalPage_X").value) && parseInt(document.getElementById("CurPage_X").value) > 0) {
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

            if (parseInt(document.getElementById("CurPage_X").value) < parseInt(document.getElementById("ToatalPage_X").value)) {
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

            if (parseInt(document.getElementById("CurPage_X").value) > 1) {
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
        function clearGrid(oGird) {
            try {
                var j = oGird.rows.length - 1
                for (; j >= 0; --j) {
                    oGird.deleteRow(j)
                }
                newrowindex = 0
            }
            catch (e) {
                alert('اطلاعات نادرست است')
            }
        }

        //================================================================================================================
        function AddRow(oGrid, UserFlag, UserID, Username, SUsername, Selected) {
            //try
            //{
            //oGrid="GrdValidUser"
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "CssItemHeader2";

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
                    tempSrc = "../../../Ta/Includes/Images/Icons/Personel.gif"
                    picTitle = 'پرسنل'
                    break
                case "G":
                    tempSrc = "../../../Ta/Includes/Images/Icons/PGroup.gif"
                    picTitle = "'گروه پرسنلي'"
                    break
                case "T":
                    tempSrc = "../../../Ta/Includes/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "'دفتر تابل'"
                    break
                case "R":
                    tempSrc = "'../../../Ta/Includes/Images/Icons/u7.gif'"
                    picTitle = "'واحد سازماني'"
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
        //============================================================================================
        function SelectAllChk_Onclick(oGrid, obj) {
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
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
            document.getElementById(MasterObj + "tSelectedMamber").value = xmlDoc.xml
        }
        //================================================================================================================		
        function OnClickChk(obj) {
            var UserID = 0
            var UserFlag = ""

            UserID = obj.parentElement.parentElement.UserID
            UserFlag = obj.parentElement.parentElement.UserFlag


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

            if (obj.checked)
                xmlNodes.item(0).selectSingleNode('Selected').text = 1
            else
                xmlNodes.item(0).selectSingleNode('Selected').text = 0

            document.getElementById(MasterObj + "tSelectedMamber").value = xmlDoc.xml
        }
        //================================================================================================================		
	
    </script>

</asp:Content>
