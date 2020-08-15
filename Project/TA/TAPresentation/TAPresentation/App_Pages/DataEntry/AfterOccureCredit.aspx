<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="AfterOccureCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.AfterOccureCredit"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/KeySorting.js"></script>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>

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
            
            if (StrVal == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';
                document.getElementById('ImgRefreshtoPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';
                document.getElementById('ImgRefreshSearchPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';
            }



            if (StrVal != "") {
                if ($get(MasterObj + "lblTo").value == "") {
                    document.getElementById('OToolBar_txtFromData').value = "";
                    document.getElementById('OToolBar_txtToData').value = "";
                    document.getElementById('OToolBar_txtTotalData').value = "";

                    document.getElementById('OToolBar_BtnNext').disabled = true;
                    document.getElementById('OToolBar_BtnPrv').disabled = true;
                    document.getElementById('OToolBar_BtnFirst').disabled = true;
                    document.getElementById('OToolBar_BtnLast').disabled = true;
                }
                else if ($get(MasterObj + "lblTo").value != "") {
                    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                        document.getElementById('OToolBar_BtnNext').disabled = true
                    else
                        document.getElementById('OToolBar_BtnNext').disabled = false;

                    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                        document.getElementById('OToolBar_BtnPrv').disabled = true
                    else
                        document.getElementById('OToolBar_BtnPrv').disabled = false;

                    document.getElementById('OToolBar_BtnFirst').disabled = false;
                    document.getElementById('OToolBar_BtnLast').disabled = false;
                    setTimes()
                }
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                switch (StrVal) {
                    case "Save":
                        alert($get(MasterObj + "txtAlert").value)
                       // SetMsg($get(MasterObj + "txtAlert").value);
                        break;
                    case "PersonCodeSearch":
                        document.getElementById(MasterObj + "txtFromPersonName").value = $get(MasterObj + "txtName").value
                        break;
                    case "ToPersonCodeSearch":
                        document.getElementById(MasterObj + "txtToPersonName").value = $get(MasterObj + "txtName").value
                        break;
                    case "PersonSearch":
                        document.getElementById(MasterObj + "txtSeatchPersonName").value = $get(MasterObj + "txtName").value
                        break;

                }
            }
            $get(MasterObj + "txtSubmit").value = "";
            
        }
    </script>

    <table id="Table1" style="width: 800px; height: 89px" cellspacing="0" cellpadding="0"
        width="789" border="0">
        <tr>
            <td style="width: 800px; height: 82px" valign="middle">
                <table id="Table5" style="width: 800px; height: 26px" cellspacing="0" cellpadding="0"
                    width="789" border="0">
                    <tr>
                        <td class="style1">
                            از تاريخ
                        </td>
                        <td class="style2">
                            <uc1:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td width="50">
                            تا تاريخ
                        </td>
                        <td class="style1">
                            <uc1:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td width="40">
                            مجوز
                        </td>
                        <td>
                            <asp:DropDownList onkeypress="return KeySort(this,false)" ID="cmbFirstCode" runat="server"
                                Height="16px" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table id="Table2" style="width: 800px; height: 42px" cellspacing="0" cellpadding="0"
                    width="773" border="0">
                    <tr>
                        <td>
                            شماره پرسنلي از
                        </td>
                        <td>
                            <input type="text" id="txtPersonID" onkeydown="OnKeyDownNum('integer',this.value)"
                                onblur="OnBlurtxtPersonID()" runat="server" style="width: 60px" />
                            <input id="txtFromPersonName" runat="server" name="txtFromPersonName" style="width: 115px"
                                type="text" />
                            <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                src="../../App_Utility/Images/Icons/Refresh1.png" style="cursor:pointer" />
                        </td>
                        <td align="center">
                            تا
                        </td>
                        <td>
                            <input type="text" id="txtToPersonID" onkeydown="OnKeyDownNum('integer',this.value)"
                                onblur="OnBlurtxtToPersonID()" runat="server" style="width: 60px" />
                            <input id="txtToPersonName" runat="server" name="txtToPersonName" style="width: 115px"
                                type="text" />
                            <img id="ImgRefreshtoPerson" alt="به روزرساني نام" onclick="onClickImgRefreshToPerson()"
                                src="../../App_Utility/Images/Icons/Refresh1.png" />
                        </td>
                        <td>
                            <input id="chkDaily" type="checkbox" name="chkDaily" runat="server" />روزانه&nbsp;&nbsp;&nbsp;
                            <input id="chkTime" type="checkbox" name="chkTime" runat="server" />ساعتي
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <uc2:ToolBar ID="OToolBar" PageID="1323" PageName="AfterOccureCredit.aspx" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                شماره پرسنلی :
                <input type="text" id="txtSearchPersonID" onkeydown="OnKeyDownNum('integer',this.value)"
                    onblur="OnBlurtxtSearchPersonID()" runat="server" style="width: 60px" />
                <input id="txtSeatchPersonName" runat="server" name="txtSeatchPersonName" style="width: 115px"
                    type="text" />
                <img id="ImgRefreshsearchPerson" alt="به روزرساني نام" onclick="onClickImgRefreshSearchPerson()"
                    src="../../App_Utility/Images/Icons/Refresh1.png"   style="cursor:pointer"/>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtSDate" runat="server" />
                            <asp:HiddenField ID="txtEDate" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtPageSize" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtOrderString" runat="server" />
                            <asp:HiddenField ID="txtCodePermision" runat="server" />
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
        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" id="txtCode" runat="server" />
                <input id="txtName" runat="server" name="txtName" type="text" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSearchPerson" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Button ID="BtnSearchPerson" runat="server" OnClick="BtnSearchPerson_Click" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtModal" runat="server" />
        <input type="hidden" id="txtMenuItemID" runat="server" />
        <input type="hidden" id="txtFlagAccess" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">

        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var SearchPersonCode = "", SearchPersonName = ""

        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById('OToolBar_BtnPrv').disabled = true;
        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
            document.getElementById('OToolBar_BtnNext').disabled = true
        else
            document.getElementById('OToolBar_BtnNext').disabled = false;

        if ($get(MasterObj + "txtModal").value == "1")
            document.getElementById('OToolBar_BtnCancel').style.display = "inline"
        else
            document.getElementById('OToolBar_BtnCancel').style.display = "none"

        //*******************************************************************************


        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSearchPersonID").value = ""
            document.getElementById(MasterObj + "txtSeatchPersonName").value =""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSearchPersonID").value = ""
            document.getElementById(MasterObj + "txtSeatchPersonName").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnBlurtxtCurPage() {
            document.getElementById(MasterObj + "txtSearchPersonID").value = ""
            document.getElementById(MasterObj + "txtSeatchPersonName").value = ""
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //*******************************************************************************
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSearchPersonID").value = ""
            document.getElementById(MasterObj + "txtSeatchPersonName").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSearchPersonID").value = ""
            document.getElementById(MasterObj + "txtSeatchPersonName").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //*******************************************************************************
        function ModifyXMLSave(obj) {

            while (obj.tagName != "TR")
                obj = obj.parentNode
                
            var str = "", SDate = "", EDate = "";

            SDate = obj.SDate.substring(6, 10) + obj.SDate.substring(2, 6) + obj.SDate.substring(0, 2)
            EDate = obj.childNodes(2).innerText.substring(6, 10) + obj.childNodes(2).innerText.substring(2, 6) + obj.childNodes(2).innerText.substring(0, 2)

            if (document.getElementById(MasterObj + "txtSaveXml").value == "") {

                var SecondCode = obj.childNodes(6).firstChild.value
                if ((obj.childNodes(4).firstChild.value == "") | (obj.childNodes(3).firstChild.value == ""))
                    SecondCode = "9" + obj.childNodes(6).firstChild.value.substring(1, 3)

                str += "<Root>"
                str += "<Tb>"
                str += "<Selected>1</Selected>"
                str += "<StatusType>Admin</StatusType>"
                str += "<PersonCode>" + obj.childNodes(0).innerText + "</PersonCode>"
                str += "<StartDate>" + "13"+SDate + "</StartDate>"
                str += "<EndDate>" + "13" + EDate + "</EndDate>"
                str += "<StartTime>" + obj.childNodes(3).firstChild.value + "</StartTime>"
                str += "<EndTime>" + obj.childNodes(4).firstChild.value + "</EndTime>"
                str += "<Type>" + obj.BaseCodeID + "</Type>"
                str += "<CreditType>" + SecondCode + "</CreditType>"
                str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                str += "</Tb>"
                str += "</Root>"
                document.getElementById(MasterObj + "txtSaveXml").value = str
            }
            else {

                var SecondCode = obj.childNodes(6).firstChild.value
                if ((obj.childNodes(4).firstChild.value == "") | (obj.childNodes(3).firstChild.value == ""))
                    SecondCode = "9" + obj.childNodes(6).firstChild.value.substring(1, 3)

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtSaveXml").value);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [KID='" + obj.KID + "']");
                if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode('StartTime').text = obj.childNodes(3).firstChild.value;
                    oXmlNodes.item(0).selectSingleNode('EndTime').text = obj.childNodes(4).firstChild.value;
                    oXmlNodes.item(0).selectSingleNode('SecondCode').text = SecondCode;
                    document.getElementById(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
                }
                else {
                    var SecondCode = obj.childNodes(6).firstChild.value
                    if ((obj.childNodes(4).firstChild.value == "") | (obj.childNodes(3).firstChild.value == ""))
                        SecondCode = "9" + obj.childNodes(6).firstChild.value.substring(1, 3)

                    str += "<Tb>"
                    str += "<Selected>1</Selected>"
                    str += "<StatusType>Admin</StatusType>"
                    str += "<PersonCode>" + obj.childNodes(0).innerText + "</PersonCode>"
                    str += "<StartDate>" + "13" + SDate + "</StartDate>"
                    str += "<EndDate>" + "13" + EDate + "</EndDate>"
                    str += "<StartTime>" + obj.childNodes(3).firstChild.value + "</StartTime>"
                    str += "<EndTime>" + obj.childNodes(4).firstChild.value + "</EndTime>"
                    str += "<Type>" + obj.BaseCodeID + "</Type>"
                    str += "<CreditType>" + SecondCode + "</CreditType>"
                    str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                    str += "</Tb>"
                    str += "</Root>"
                    document.getElementById(MasterObj + "txtSaveXml").value = document.getElementById(MasterObj + "txtSaveXml").value.replace("</Root>", str)
                }
            }
        }
        //*******************************************************************************
        function OnClickBtnFilter() {

            if (!compareDate())
                return
                
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            document.getElementById(MasterObj + "txtSearchPersonID").value = "";
            document.getElementById(MasterObj + "txtSeatchPersonName").value = "";
            document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            document.getElementById(MasterObj + "txtEDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnSearch() {
                
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            document.getElementById(MasterObj + "txtEDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

        
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnCancel() {
            window.close();
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            if (!compareDate())
                return
            if (document.getElementById(MasterObj + "txtSaveXml").value != "") {
                document.getElementById(MasterObj + "txtSaveXml").value = document.getElementById(MasterObj + "txtSaveXml").value.replace("</Root>", "<Setting><CalcParam>3</CalcParam><Flag>1</Flag><OnlineUserID>" + $get(MasterObj + "txtOnLineUser").value + "</OnlineUserID><SubSysID>13</SubSysID><PageID>1323</PageID></Setting></Root>")
                $get(MasterObj + "txtSubmit").value = "Save";
                $get(MasterObj + "BtnSubmit").click();
            }
            else {
                alert("تغییری جهت ذخیره داده نشده است")
            }
        }
        //*******************************************************************************
        function setTimes() {
            
            if (document.getElementById(MasterObj + "txtSaveXml").value != "") {
                var i = 0;
                var j = 0;
                var OGrid = document.getElementById("GrdCredit");
                if (OGrid == null)
                    return
                var PageSize = OGrid.rows.length // document.getElementById(MasterObj + "txtPageSize").value
                var strXml = document.getElementById(MasterObj + "txtSaveXml").value

                var CurPage = document.getElementById(MasterObj + "txtCurPage").value

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "'  ]");
                var oXmlNodes1;

                for (j = 0; j < oXmlNodes.length; j++) {
                    for (i = 1; i < PageSize; i++) {
                        if (OGrid.rows(i).KID == oXmlNodes.item(j).selectSingleNode("KID").text) {



                            oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and KID=" + OGrid.rows(i).KID + " ]");
                            var SecondCode = oXmlNodes1.item(0).selectSingleNode('SecondCode').text
                            if (SecondCode.substring(0, 1) == "9")
                                SecondCode = "0" + SecondCode.substring(1, 3)

                            OGrid.rows(i).childNodes(3).firstChild.value = oXmlNodes1.item(0).selectSingleNode('StartTime').text//StartTime
                            OGrid.rows(i).childNodes(4).firstChild.value = oXmlNodes1.item(0).selectSingleNode('EndTime').text//EndTime
                            OGrid.rows(i).childNodes(6).firstChild.value = SecondCode//SecondCode
                        }
                    }
                }
            }
        }
        //*******************************************************************************
        function onClickImgRefreshPerson() {
            ShowModalPerson()
            document.getElementById(MasterObj + "txtPersonID").value = SearchPersonCode
            document.getElementById(MasterObj + "txtFromPersonName").value = SearchPersonName
        }
        //*******************************************************************************
        function onClickImgRefreshToPerson() {
            ShowModalPerson()
            document.getElementById(MasterObj + "txtToPersonID").value = SearchPersonCode
            document.getElementById(MasterObj + "txtToPersonName").value = SearchPersonName
         }
         //*******************************************************************************
         function onClickImgRefreshSearchPerson() {
             ShowModalPerson()
             document.getElementById(MasterObj + "txtSearchPersonID").value = SearchPersonCode
             document.getElementById(MasterObj + "txtSeatchPersonName").value = SearchPersonName
         }
        //*******************************************************************************
        function ShowModalPerson() {
            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=" + $get(MasterObj + "txtMenuItemID").value + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
            var Result = "";
            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");
            SearchPersonCode = SearchPersonName = ""
            if (Result != "") {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    var PCode;
                    SearchPersonCode = xmlNodes.item(0).selectSingleNode('PersonID').text
                    SearchPersonName = xmlNodes.item(0).selectSingleNode('Family').text
                }
            }
        }
        //*******************************************************************************
        function OnBlurtxtPersonID() {

            if ($get(MasterObj + "txtPersonID").value == "") {
                $get(MasterObj + "txtFromPersonName").value = "";
            }
            else {
                document.getElementById(MasterObj + "txtCode").value = $get(MasterObj + "txtPersonID").value
                $get(MasterObj + "txtSubmit").value = "PersonCodeSearch";
                $get(MasterObj + "BtnSearchPerson").click();
            }
        }
        //*******************************************************************************
        function OnBlurtxtToPersonID() {
            if ($get(MasterObj + "txtToPersonID").value == "") {
                $get(MasterObj + "txtToPersonName").value = "";
            }
            else {
                document.getElementById(MasterObj + "txtCode").value = $get(MasterObj + "txtToPersonID").value
                $get(MasterObj + "txtSubmit").value = "ToPersonCodeSearch";
                $get(MasterObj + "BtnSearchPerson").click();
            }
        }
        //*******************************************************************************
        function OnBlurtxtSearchPersonID() {
            if ($get(MasterObj + "txtSearchPersonID").value == "") {
                $get(MasterObj + "txtSeatchPersonName").value = "";
            }
            else {
                document.getElementById(MasterObj + "txtCode").value = $get(MasterObj + "txtSearchPersonID").value
                $get(MasterObj + "txtSubmit").value = "PersonSearch";
                $get(MasterObj + "BtnSearchPerson").click();
            }
        }
        //*******************************************************************************
        function compareDate() {
            var ED = document.getElementById(MasterObj + "KCalEDate_txtYear").value +document.getElementById(MasterObj + "KCalEDate_txtMonth").value + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            var SD = document.getElementById(MasterObj + "KCalSDate_txtYear").value + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            if (ED < SD) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else {
                return true
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 114px;
        }
        .style2
        {
            width: 210px;
        }
    </style>

</asp:Content>

