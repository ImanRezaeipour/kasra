<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectPersonMember.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.Group.SelectPersonMember" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>انتخاب پرسنل </title>

    <script language="javascript" src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>

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
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    if ($get(MasterObj + "txtAlert").value != "") {
                        if ($get(MasterObj + "txtAlert").value == "Display") {
                            url = "ShiftOverlap.aspx?"
                            var rr = window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no")
//                            if (rr == 1) {
//                                document.getElementById(MasterObj + "txtSubmit").value = "SaveDate";
//                                document.getElementById(MasterObj + "BtnSubmit").click();
//                            }
                        }
                        else {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            returnValue = 1
                        }
                        $get(MasterObj + "txtAlert").value = "";
                    }
                    if (StrVal == "Search") {
                        PopupFilter.style.display = "none";
                    }
                    SetChk()
                }
            }
            $get(MasterObj + "txtSubmit").value = "";
        }
    </script>

    <table scroll="no">
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 737px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                            <table width="100%" >
                                <tr>
                                    <td >
                                        ازتاریخ:
                                    </td>
                                    <td align="right" >
                                        <uc1:KCalendar ID="SDate" runat="server" />
                                    </td>
                                    <td >
                                        تاتاریخ:
                                    </td>
                                    <td align="right">
                                        <uc1:KCalendar ID="EDate" runat="server" />
                                    </td>
                                    <td style=" display: none">
                                        <input id="ChkAll" type="checkbox" onclick="OnClickChkAll(this)" />
                                   
                                        انتخاب همه
                                    </td>
                                </tr>
                            
                                <tr>
                                    <td width="50">
                                        پرسنلی:
                                    </td>
                                    <td align="right" >
                                        <input id="txtPersonCode" name="txtPersonCode" type="text" runat="server" dir="rtl"
                                            onblur="OnBlurTxtPersonCode()" style="width: 100px" />
                                    </td>
                                    <td width="120" >
                                        نام و نام خانوادگی:
                                    </td>
                                    <td align="right">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <input id="txtPersonName" name="txtPersonName" type="text" runat="server" dir="rtl"
                                                    style="width: 100px" onblur="OnBlurTxtPersonName()" /><asp:DropDownList onchange="OnChangeSelName()"
                                                        ID="SelName" runat="server" Width="169px" Height="16px">
                                                    </asp:DropDownList>
                                                <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                                    src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td >
                                        
                                    </td>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 7px">
                            <uc2:ToolBar ID="OToolBar" runat="server" GridID="4" PageName="SelectPersonMember.aspx"
                                PageID="1104" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="PersonFlag" runat="server" />
                                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                                        <asp:HiddenField ID="txtGroupID" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="TxtXml" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtPageSize" runat="server" />
                                        <asp:HiddenField ID="txtSearchFlag" runat="server" />
                                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                                        <asp:HiddenField ID="txtOrderString" runat="server" />
                                        <asp:HiddenField ID="txtOverlapXML" runat="server" />
                                        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
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
                <div id="PopupFilter" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                    border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                    top: 200px; left: 20px; display: none; background-color: #e7eeff; right: 200px;
                    width: 400px;" align="center">
                    <table style="width: 100%">
                        <tr>
                            <td align="right" style="width: 122px">
                                <input id="ChMember" checked="checked" name="G1" runat="server" type="checkbox" />عضو
                                گروه فعلي
                            </td>
                            <td align="right" style="width: 148px">
                                <input id="ChMemberOther" checked="checked" name="G1" runat="server" type="checkbox" />
                                عضو گروه هاي ديگر
                            </td>
                            <td align="right">
                                <input id="ChNoMember" checked="checked" name="G1" runat="server" type="checkbox" />
                                بدون عضويت
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 122px">
                            </td>
                            <td valign="middle" align="center" style="width: 148px">
                                <input id="BtnShowFilter" name="BtnShowFilter" type="button" value="فیلتر" onclick="OnClickBtnShowFilter()" />
                                <input id="BtnFilterCancel" name="BtnFilterCancel" type="button" value="انصراف" onclick="OnClickBtnCancelPopup()" />
                            </td>
                            <td valign="middle" align="right">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="display: none">
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtWithoutDate" runat="server" />
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
                    <input type="text" id="txtrefrenceCategory" runat="server" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table id="popup" cellspacing="0" cellpadding="0" border="0" bgcolor="white" style="display: none;
                    border-right: #346fa4 2px solid; border-top: lightsteelblue 2px solid; border-left: lightsteelblue 2px solid;
                    border-bottom: #346fa4 2px solid;" width="100" height="100">
                    <tr>
                        <td valign="top" class="VertGradientBlue2">
                            <font color="white" size="3" face="arial"><span onclick="closeWin()" style="cursor: hand"
                                title="بستن">
                                <img alt="" src="../../../App_Utility/Images/Icons/close1.png" /></span></font>
                        </td>
                        <td align="center" id="TDTitle" valign="middle" class="VertGradientBlue2" width="100%"
                            height="10px">
                            
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = "";
        var CountChkSelected = 0

        if ($get(MasterObj + "txtWithoutDate").value == 1) {
            document.getElementById(MasterObj + "SDate_txtDay").value = '01'
            document.getElementById(MasterObj + "SDate_txtMonth").value = '01'
            document.getElementById(MasterObj + "SDate_txtYear").value = '1301'

            document.getElementById(MasterObj + "EDate_txtDay").value = '29'
            document.getElementById(MasterObj + "EDate_txtMonth").value = '12'
            document.getElementById(MasterObj + "EDate_txtYear").value = '1399'

            document.getElementById(MasterObj + "EDate_txtDay").disabled = true
            document.getElementById(MasterObj + "EDate_txtMonth").disabled = true
            document.getElementById(MasterObj + "EDate_txtYear").disabled = true
            document.getElementById(MasterObj + "EDate_btnImg").disabled = true

            document.getElementById(MasterObj + "SDate_txtDay").disabled = true
            document.getElementById(MasterObj + "SDate_txtMonth").disabled = true
            document.getElementById(MasterObj + "SDate_txtYear").disabled = true
            document.getElementById(MasterObj + "SDate_btnImg").disabled = true
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!AtachEvent!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        document.body.attachEvent('onkeydown', SetEnter)
//        document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {

//            document.getElementById(MasterObj + "txtPersonCode").value = "";
//            document.getElementById(MasterObj + "SelName").value = "";
//            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnPrv() {
//            document.getElementById(MasterObj + "txtPersonCode").value = "";
//            document.getElementById(MasterObj + "SelName").value = "";
//            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnBlurtxtCurPage() {
//            document.getElementById(MasterObj + "txtPersonCode").value = "";
//            document.getElementById(MasterObj + "SelName").value = "";
            //            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"

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
        ////_________________________________________________________________________________
        function OnClickBtnLast() {
//            document.getElementById(MasterObj + "txtPersonCode").value = "";
//            document.getElementById(MasterObj + "SelName").value = "";
            //            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"

            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnFirst() {
//            document.getElementById(MasterObj + "txtPersonCode").value = "";
//            document.getElementById(MasterObj + "SelName").value = "";
            //            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearch").value = ""
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"

            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


        //*************************************ThisPage***************************************
        function SetEnter() {
            if (event.srcElement.id == "OToolBar_txtCurPage")
                return;

            //-----------------------------Calendar

            if (event.srcElement.id == MasterObj + "SDate_txtDay")
                return;
            if (event.srcElement.id == MasterObj + "SDate_txtMonth")
                return;
            if (event.srcElement.id == MasterObj + "SDate_txtYear")
                return;
            if (event.srcElement.id == MasterObj + "SDate_btnImg")
                return;


            if (event.srcElement.id == MasterObj + "EDate_txtDay")
                return;
            if (event.srcElement.id == MasterObj + "EDate_txtMonth")
                return;
            if (event.srcElement.id == MasterObj + "EDate_txtYear")
                return;
            if (event.srcElement.id == MasterObj + "SDate_btnImg")
                return;
            //-----------------------------
            if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "txtPersonName" || event.srcElement.id == MasterObj + "CmbPersonName") {

                if (window.event.keyCode == 13)
                    OnClickBtnSearch()
            }
            else
                window.event.keyCode = 9

        }
        ////_________________________________________________________________________________
        function OnClickChk(obj) {
            var OGrid = document.getElementById("GrdGroup");

            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var strXml = "<Root>" + str + "</Root>"
            var PID = TbObj.rows(RowIndex).getAttribute('PersonID');

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
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and PersonID=" + PID + "]");

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
                str += "<PersonID>" + PID + "</PersonID>"
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == false)
                    str += "<Selected>0</Selected>"
                else
                    str += "<Selected>1</Selected>"

                str += "</Tb>"
            }

        }
        ////_________________________________________________________________________________
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //-----Date
            document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "SDate_txtDay").value + "/" + document.getElementById(MasterObj + "SDate_txtMonth").value + "/" + document.getElementById(MasterObj + "SDate_txtYear").value
            document.getElementById(MasterObj + "txtEDate").value = document.getElementById(MasterObj + "EDate_txtDay").value + "/" + document.getElementById(MasterObj + "EDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EDate_txtYear").value

            if (document.getElementById(MasterObj + "txtSDate").value == "//")
                document.getElementById(MasterObj + "txtSDate").value = ""

            if (document.getElementById(MasterObj + "txtEDate").value == "//")
                document.getElementById(MasterObj + "txtEDate").value = ""

            //            if (document.getElementById(MasterObj + "SDate").value == "" ||document.getElementById(MasterObj + "EDate").value == "" ){
            //                alert('لطفا تاريخ را وارد کنيد')
            //                return 
            //            }
            //            //----
            //            alert(str)
            //            return 
            document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"

            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////__________________________________________________________________________________
        function OnClickChkAll(obj) {
            var OGrid = document.getElementById("GrdGroup");
            if (OGrid == null)
                return

            var PageSize = OGrid.rows.length

            for (var i = 1; i < PageSize; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked;
                OnClickChk(OGrid.rows(i).cells(0).firstChild)
            }
        }
        ////__________________________________________________________________________________
        function OnClickBtnCancel() {
            window.close();
        }
        ////__________________________________________________________________________________
        //         function OnChangeChkSelectable() {
        //             OnClickBtnSearch()
        //         }
        ////__________________________________________________________________________________
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdGroup");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length // document.getElementById(MasterObj + "txtPageSize").value
            var strXml = "<Root>" + str + "</Root>"
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute('PersonID') == oXmlNodes.item(j).selectSingleNode("PersonID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                        CountChkSelected++;
                    }
                }
            }
            //=========================================================Chk ALL
            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false
        }
        ////_________________________________________________________________________________
        function OnClickBtnSearch() {

            //PopupSearch.style.display = "inline";
            OnClickBtnShowSearch()
        }
        ////_________________________________________________________________________________
        function OnChangeSelName() {

            if (document.getElementById(MasterObj + "SelName").value != "0")
                document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "SelName").value;
            else
                document.getElementById(MasterObj + "txtPersonCode").value = "";
        }
        ////_________________________________________________________________________________
        function OnBlurTxtPersonCode() {
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" || document.getElementById(MasterObj + "txtPersonCode").value != "0")
                document.getElementById(MasterObj + "SelName").value = document.getElementById(MasterObj + "txtPersonCode").value
            else
                document.getElementById(MasterObj + "SelName").value = "0";
        }
        ////_________________________________________________________________________________

        function OnBlurTxtPersonName() {
            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                document.getElementById(MasterObj + "txtPersonCode").value = ""
                document.getElementById(MasterObj + "SelName").value = 0
            }
        }
        function OnClickBtnFilter() {

            PopupFilter.style.display = "inline";

        }
        //
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!PopupSearch!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowSearch() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var str
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"

            $get(MasterObj + "txtSDate").value = $get(MasterObj + "SDate_txtYear").value + "/" + $get(MasterObj + "SDate_txtMonth").value + "/" + $get(MasterObj + "SDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "EDate_txtYear").value + "/" + $get(MasterObj + "EDate_txtMonth").value + "/" + $get(MasterObj + "EDate_txtDay").value
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""

            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""

            if (document.getElementById(MasterObj + "txtPersonCode").value != "")
                document.getElementById(MasterObj + "txtSearchFlag").value = "1"

            str = "<Root><Tb><PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"

            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                str += "<PersonName>" + document.getElementById(MasterObj + "txtPersonName").value + "</PersonName>"
                document.getElementById(MasterObj + "txtOrderString").value = "LastName_A"
                document.getElementById(MasterObj + "txtSearchFlag").value = "1"
            }
            else {
                document.getElementById(MasterObj + "txtOrderString").value = ""
            }

            str += "<SDate>" + $get(MasterObj + "txtSDate").value + "</SDate>"
            str += "<EDate>" + $get(MasterObj + "txtEDate").value + "</EDate>"
            str += "<OnLineUser>" + $get(MasterObj + "txtOnLineUser").value + "</OnLineUser>"
            str += "<CategoryID>" + $get(MasterObj + "txtrefrenceCategory").value + "</CategoryID>"
            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            $get(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!PopupFilter!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "txtPersonName").value = ""
            document.getElementById(MasterObj + "txtPersonCode").value = ""
            document.getElementById(MasterObj + "SelName").value = ""

            var str = "<Root><Tb>"


            if (document.getElementById(MasterObj + "ChMember").checked == true && document.getElementById(MasterObj + "ChMemberOther").checked == false && document.getElementById(MasterObj + "ChNOMember").checked == false)
                str += "<Status>100</Status>"

            if (document.getElementById(MasterObj + "ChMember").checked == false && document.getElementById(MasterObj + "ChMemberOther").checked == true && document.getElementById(MasterObj + "ChNOMember").checked == false)
                str += "<Status>010</Status>"

            if (document.getElementById(MasterObj + "ChMember").checked == false && document.getElementById(MasterObj + "ChMemberOther").checked == false && document.getElementById(MasterObj + "ChNOMember").checked == true)
                str += "<Status>001</Status>"


            if (document.getElementById(MasterObj + "ChMember").checked == true && document.getElementById(MasterObj + "ChMemberOther").checked == true && document.getElementById(MasterObj + "ChNOMember").checked == false)///?????
                str += "<Status>110</Status>"

            if (document.getElementById(MasterObj + "ChMember").checked == false && document.getElementById(MasterObj + "ChMemberOther").checked == true && document.getElementById(MasterObj + "ChNOMember").checked == true)///?????
                str += "<Status>011</Status>"

            if (document.getElementById(MasterObj + "ChMember").checked == true && document.getElementById(MasterObj + "ChMemberOther").checked == false && document.getElementById(MasterObj + "ChNOMember").checked == true)///?????
                str += "<Status>101</Status>"


            if (document.getElementById(MasterObj + "ChMember").checked == false && document.getElementById(MasterObj + "ChMemberOther").checked == false && document.getElementById(MasterObj + "ChNOMember").checked == false)///?????
            {
                str += "<Status>000</Status>";
                return;
            }
            if (document.getElementById(MasterObj + "ChMember").checked == true && document.getElementById(MasterObj + "ChMemberOther").checked == true && document.getElementById(MasterObj + "ChNOMember").checked == true)///?????
                str += "<Status>111</Status>"


            str += "</Tb></Root>"


            document.getElementById(MasterObj + "txtSearch").value = str
            $get(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
            //PopupFilter.style.display = "none";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancelPopup() {
            PopupFilter.style.display = "none"
        }
        ////_________________________________________________________________________________
        //==============Chk ALL
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdGroup");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //**********************************EndThisPage***************************************
    </script>

</asp:Content>
