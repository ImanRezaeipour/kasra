<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowGroupPerson.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.Group.ShowGroupPerson" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>GridViewCommandEventArgs </title>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        /////-------------------------------------------
    </script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

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
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {

            if (StrVal == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';

            }

            if (StrVal != "") {
                {
                    CountChkSelected = 0
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
                    }

                    if ($get(MasterObj + "txtAlert").value != "") {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        $get(MasterObj + "txtAlert").value=""
                    }
                   
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    SetChk()
                }

            }
            $get(MasterObj + "txtSubmit").value = "";
        }
    </script>

    <table scroll="no">
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 690px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                            <table style="border-left: solid 1px #8db2e3; border-bottom: solid 1px #8db2e3; border-top: solid 1px #8db2e3;
                                border-right: solid 1px #8db2e3; width: 100%">
                                <tr>
                                    <td style="width: 130px" align="left">
                                        <font color="#FF66B3">نمايش اعضاي گروه :</font>
                                    </td>
                                    <td id="TDGroupName" runat="server" align="right" width="200px">
                                    </td>
                                     <td style="width: 130px" align="left">
                                        <font color="#FF66B3">دسته بندی :</font>
                                    </td>
                                    <td id="tdCategory" runat="server" align="right">
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td >
                                        برسنلی :
                                    </td>
                                    <td >
                                        <input id="txtPersonCode" name="txtPersonCode" onblur="OnBlurTxtPersonCode()" type="text"
                                            runat="server" dir="rtl" style="width: 60px" />
                                    </td>
                                    <td >
                                        نام و نام خانوادگی:
                                    </td>
                                    <td >
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <input id="txtPersonName" name="txtPersonName" onblur="OnBlurTxtPersonName()" type="text"
                                                    runat="server" dir="rtl" style="width: 100px" /><asp:DropDownList onchange="onChangeCmbPersonName()"
                                                        ID="CmbPersonName" runat="server" Width="150px">
                                                    </asp:DropDownList>
                                                <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                                    src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                    <input type="checkbox" id="chkselectCategory" />
                                    عدم توجه به دسته بندی
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" GridID="3" PageName="ShowGroupPerson.aspx"
                                PageID="1102" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 406px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="txtGroupID" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
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
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtWithoutDate" runat="server" />
                    <input type="text" runat="server" id="txtCategoryID" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">

        //*************************************Declaration*************************************
        var str = "";
        var CountChkSelected = 0
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
//        document.body.attachEvent('onkeydown', SetEnter)
//        document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        document.getElementById("OToolBar_txtCurPage").value = "";
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

        //**********************************EndOnLoad*************************************

        //*************************************Toolbar*************************************
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById(MasterObj + "txtSearch").value = ""
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSearch").value = ""
            //alert(document.getElementById(MasterObj + "txtSearch").value)
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowGroupPerson() {
            url = "ShowGroupPerson.aspx?GroupID=" + document.getElementById(MasterObj + "txtGroupID").value
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 700px;center: Yes;help: no;status: no")

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
           // alert(document.getElementById(MasterObj + "txtSaveXml").value)
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectPersonMember() {

            var RequsterAction = "";
            var RequsterPageID = 0

            if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                RequsterAction = event.srcElement.id.replace('OToolBar_', '')
            }
            var Category = 0
           // alert(document.getElementById("chkselectCategory").checked)
            if (document.getElementById("chkselectCategory").checked == false)
                Category = document.getElementById(MasterObj + "txtCategoryID").value

           // alert(document.getElementById(MasterObj + "txtCategoryID").value)                
            url = "SelectPersonMember.aspx?Category=" + Category + "&WithoutDate=" + document.getElementById(MasterObj + "txtWithoutDate").value + "&GroupID=" + document.getElementById(MasterObj + "txtGroupID").value + " &RequsterPageID=1102" + " &RequsterAction=" + RequsterAction;
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            OnClickBtnSearch();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectGroupMember() {

            var RequsterAction = "";
            var RequsterPageID = 0

            if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                RequsterAction = event.srcElement.id.replace('OToolBar_', '')
            }
            var Category = 0
            if (document.getElementById("chkselectCategory").checked == false)
                Category = document.getElementById(MasterObj + "txtCategoryID").value
            url = "SelectGroupMember.aspx?Category=" + Category + "&WithoutDate=" + document.getElementById(MasterObj + "txtWithoutDate").value + "&GroupID=" + document.getElementById(MasterObj + "txtGroupID").value + " &RequsterPageID=1102" + " &RequsterAction=" + RequsterAction;
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            OnClickBtnSearch();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectDepartmentMember() {
            var RequsterAction = "";
            var RequsterPageID = 0

            if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                RequsterAction = event.srcElement.id.replace('OToolBar_', '')
            }
            var Category = 0
            if (document.getElementById("chkselectCategory").checked == false)
                Category = document.getElementById(MasterObj + "txtCategoryID").value
            url = "SelectDepartmentMember.aspx?Category=" + Category + "&WithoutDate=" + document.getElementById(MasterObj + "txtWithoutDate").value + "&GroupID=" + document.getElementById(MasterObj + "txtGroupID").value + " &RequsterPageID=1102" + " &RequsterAction=" + RequsterAction;
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 850px;center: Yes;help: no;status: no")
            OnClickBtnSearch();
        }
        //*************************************EndToolbar*************************************

        //*************************************ThisPage***************************************
        function SetEnter() {
            if (event.srcElement.id == "OToolBar_txtCurPage")
                return;

            if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "txtPersonName" || event.srcElement.id == MasterObj + "CmbPersonName") {
                if (window.event.keyCode == 13)
                    OnClickBtnSearch()
            }
            else
                window.event.keyCode = 9

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickChk(obj) {
            var OGrid = document.getElementById("GrdPerson");
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value
            var strXml = "<Root>" + str + "</Root>"


            //========================================================Chk ALL
            var oLen = OGrid.rows.length
            if (obj.checked == true && CountChkSelected != oLen - 1)
                CountChkSelected++;
            else if (obj.checked == false)
                CountChkSelected--;

            if (CountChkSelected == oLen - 1 && OGrid.rows(0).cells(0).firstChild.checked != true)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else if (CountChkSelected != oLen - 1 && OGrid.rows(0).cells(0).firstChild.checked != false)
                OGrid.rows(0).cells(0).firstChild.checked = false
            //========================================================


            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and PersonCode=" + OGrid.rows(RowIndex).cells(1).innerText + "]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and GroupPersonID=" + OGrid.rows(RowIndex).GroupPersonID + "]");
            //alert(OGrid.rows(RowIndex).GroupPersonID)
            if (oXmlNodes.length > 0) {
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                //str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).innerText + "</PersonCode>"
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == false)
                    str += "<Selected>0</Selected>"
                else
                    str += "<Selected>1</Selected>"
                // str += "<GroupID>" + document.getElementById(MasterObj + "txtGroupID").value + "</GroupID>"
                str += "<GroupPersonID>" + OGrid.rows(RowIndex).GroupPersonID + "</GroupPersonID>"
                str += "</Tb>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdPerson");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length

            var strXml = "<Root>" + str + "</Root>"
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";

            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=0]");

            CountChkSelected = OGrid.rows.length - 1 //Defult is SelectedAll

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    //if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("PersonCode").text) {
                    if (OGrid.rows(i).GroupPersonID == oXmlNodes.item(j).selectSingleNode("GroupPersonID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;
                        CountChkSelected--;
                    }
                }
            }
            //=========================================================Chk ALL
            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSearch() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var str
            str = "<Root><Tb><GroupID>" + document.getElementById(MasterObj + "txtGroupID").value + "</GroupID>"
            str += "<PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"

            if (document.getElementById(MasterObj + "txtPersonName").value != "")
                str += "<PersonName>" + document.getElementById(MasterObj + "txtPersonName").value + "</PersonName>"

            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            document.getElementById(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPersonName() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPersonName").value
            if (document.getElementById(MasterObj + "CmbPersonName").value == 0)
                document.getElementById(MasterObj + "txtPersonCode").value = ""
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonCode() {
            document.getElementById(MasterObj + "CmbPersonName").value = document.getElementById(MasterObj + "txtPersonCode").value
            if (document.getElementById(MasterObj + "txtPersonCode").value == "" || document.getElementById(MasterObj + "txtPersonCode").value == "0")
                document.getElementById(MasterObj + "CmbPersonName").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonName() {
            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                document.getElementById(MasterObj + "txtPersonCode").value = ""
                document.getElementById(MasterObj + "CmbPersonName").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //**********************************EndThisPage*************************************
        //==============Chk ALL
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdPerson");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                onclickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
    </script>

</asp:Content>
