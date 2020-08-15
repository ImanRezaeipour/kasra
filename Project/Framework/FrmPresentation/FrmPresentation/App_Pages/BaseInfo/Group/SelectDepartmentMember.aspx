<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectDepartmentMember.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.Group.SelectDepartmentMember" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>GridViewCommandEventArgs </title>

    <script language="javascript" src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language ="javascript" type ="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>
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
//                                                if (rr == 1) {
//                                                    document.getElementById(MasterObj + "txtSubmit").value = "SaveDate";
//                                                    document.getElementById(MasterObj + "BtnSubmit").click();
//                                                }
                                            }
                                            else {
                                                SetMsg($get(MasterObj + "txtAlert").value);
                                                returnValue = 1
                                            }
                                            $get(MasterObj + "txtAlert").value = "";
                                        }
                                        SetChk()
                                    }

                                }
                                $get(MasterObj + "txtSubmit").value = "";
                                $get(MasterObj + "txtCurPage").value = $get(MasterObj + "txtPageNumber").value;
                            }
                            </script>

    <table scroll="no">
        <tr>
            <td align="right" valign="top">
                <table >
                    <tr>
                        <td valign="top" >
                            <table style="width: 100%">
                                <tr>
                                    <td >
                                        ازتاريخ:
                                    </td>
                                    <td >
                                        <uc1:KCalendar ID="SDate" runat="server" />
                                    </td>
                                    <td font-family: KasraTraffic;">
                                        تا تاریخ:
                                    </td>
                                    <td >
                                        <uc1:KCalendar ID="EDate" runat="server" />
                                        <input id="ChkAll" type="checkbox" onclick="OnClickChkAll(this)" /> انتخاب همه
                                    </td>
                                     
                                </tr>
                            
                                <tr>
                                    <td >
                                        پرسنلی:
                                    </td>
                                    <td >
                                        <input id="txtPersonCode" name="txtPersonCode" type="text" runat="server" dir="rtl"
                                             onblur="OnBlurTxtPersonCode()" style="width: 100px" />
                                    </td>
                                    <td >
                                        نام و نام خانوادگی:
                                    </td>
                                    <td >
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                        <input id="txtPersonName" name="txtPersonName" onblur="OnBlurTxtPersonName()" type="text"
                                            runat="server" dir="rtl" style="width: 100px" />
                                        <asp:DropDownList ID="SelName" runat="server" Width="169px" Height="16px" onchange="OnChangeSelName()">
                                        </asp:DropDownList>
                                        <img id="ImgRefreshPerson" alt="به روزرساني نام" 
                                                                                        onclick="onClickImgRefreshPerson()" 
                                                                                        src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        واحد سازمانی :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CmbGroup" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        
                                        <img  alt="انتخاب واحد سازمانی"
                                         id="BtnSearchDepartment"  onclick="onClickBtnSearchDepartment()"                                              
                                            src="/FrmPresentation/App_Utility/Images/Icons/select.png"
                                            />
                                    </td>
                                    <td>
                                        <input id="chkMainPersonel" type="checkbox" runat="server" />
                                        پرسنل مستقیم
                                    </td>
                                    <td>
                                        <input id="chksubPersonel" type="checkbox" runat="server" />
                                        پرسنل زیر مجموعه
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 4px">
                            <uc2:ToolBar ID="OToolBar" GridID="2" PageName="SelectGroupMember.aspx" 
                                runat="server" PageID="1103" />
                            </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                    <asp:HiddenField ID="txtPersonFlag" runat="server" />
                                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtGroupID" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtOrderString" runat="server" />
                                        <asp:HiddenField ID="txtSearchFlag" runat="server" />
                                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                                        <asp:HiddenField ID="txtRequestGroupID" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtOverlapXML" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
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
                <div style="display: none">
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSDate" name="SDate" runat="server" />
                    <input type="text" id="txtEDate" name="EDate" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtrefrenceCategory" runat="server" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server"  onclick="ImgRefreshPersonSubmit_Click" />
                </div>
            </td>
        </tr>
        <tr><td>
        <table id="popup" cellSpacing="0" cellPadding="0" border="0" bgcolor="white" style="display:none; BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid;BORDER-LEFT: lightsteelblue 2px solid; BORDER-BOTTOM: #346fa4 2px solid;  " width="100" height="100">
                                   <tr>
                                     <td valign="top" class="VertGradientBlue2"><font color="white" size="3" face="arial">
                                        <span onclick="closeWin()" style="cursor:hand" title="بستن"><img alt="" src="../../../App_Utility/Images/Icons/close1.png" /></span></font>
                                     </td>
                                    <td align="center" id="TDTitle" valign="middle" class="VertGradientBlue2" width="100%" height="10px">
                                    </td>
                                   
                                   </tr>
                                 </table>
        </td></tr>
    </table>

    <script language="javascript" type="text/javascript">

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = "";
        var CountChkSelected=""
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!AtachEvent!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        document.body.attachEvent('onkeydown', SetEnter)
//        document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
        ////_________________________________________________________________________________
      
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtPersonCode").value = "";
            document.getElementById(MasterObj + "SelName").value = "";
            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtPersonCode").value = "";
            document.getElementById(MasterObj + "SelName").value = "";
            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnBlurtxtCurPage() {
            document.getElementById(MasterObj + "txtPersonCode").value = "";
            document.getElementById(MasterObj + "SelName").value = "";
            document.getElementById(MasterObj + "txtPersonName").value = "";
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
            document.getElementById(MasterObj + "txtPersonCode").value = "";
            document.getElementById(MasterObj + "SelName").value = "";
            document.getElementById(MasterObj + "txtPersonName").value = "";
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtPersonCode").value = "";
            document.getElementById(MasterObj + "SelName").value = "";
            document.getElementById(MasterObj + "txtPersonName").value = "";
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

            if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "txtPersonName" || event.srcElement.id == MasterObj + "SelName") {

                if (window.event.keyCode == 13)
                    OnClickBtnSearch()
            }
            else
                window.event.keyCode = 9

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
        ////_________________________________________________________________________________
        function OnClickBtnCancel() {
            window.close();
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
                
            if (document.getElementById(MasterObj + "txtSDate").value == "" || document.getElementById(MasterObj + "txtEDate").value == "") {
                alert('لطفا تاريخ را وارد کنيد')
                return
            }
            //----
            document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"

            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
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
        ////__________________________________________________________________________________
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdGroup");
            if (OGrid == null)
                return 
                
            var PageSize = OGrid.rows.length
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
        ////__________________________________________________________________________________
        function OnClickBtnSearch() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var str
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "CmbGroup").value = 0
            
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "SDate_txtYear").value + "/" + $get(MasterObj + "SDate_txtMonth").value + "/" + $get(MasterObj + "SDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "EDate_txtYear").value + "/" + $get(MasterObj + "EDate_txtMonth").value + "/" + $get(MasterObj + "EDate_txtDay").value
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""

            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""
            
            if (document.getElementById(MasterObj + "txtPersonCode").value != "")
                document.getElementById(MasterObj + "txtSearchFlag").value = "1"

            str = "<Root><Tb><GroupID>" + document.getElementById(MasterObj + "txtGroupID").value
            + "</GroupID><PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"
           
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

            document.getElementById(MasterObj + "txtGroupID").value = "0";
            document.getElementById(MasterObj + "txtSearch").value = str
            $get(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        ////__________________________________________________________________________________
        function OnBlurTxtPersonName() {
            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                document.getElementById(MasterObj + "txtPersonCode").value = ""
                document.getElementById(MasterObj + "SelName").value = 0
            }
        }
        ////__________________________________________________________________________________
        function OnClickBtnAdd() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (document.getElementById(MasterObj + "CmbGroup").value == 0) {
                alert("هیچ واحد سازمانی انتخاب نشده است")
                return
            }
            var str
//            document.getElementById(MasterObj + "txtPersonName").value = ""
//            document.getElementById(MasterObj + "txtPersonCode").value = ""
//            document.getElementById(MasterObj + "SelName").value = 0
            
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "SDate_txtYear").value + "/" + $get(MasterObj + "SDate_txtMonth").value + "/" + $get(MasterObj + "SDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "EDate_txtYear").value + "/" + $get(MasterObj + "EDate_txtMonth").value + "/" + $get(MasterObj + "EDate_txtDay").value
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""

            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""


            str = "<Root><Tb><GroupID>" + document.getElementById(MasterObj + "CmbGroup").value
            + "</GroupID><PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode><PersonName></PersonName>"
            str += "<SDate>" + $get(MasterObj + "txtSDate").value + "</SDate>"
            str += "<EDate>" + $get(MasterObj + "txtEDate").value + "</EDate>"
            str += "<CategoryID>" + $get(MasterObj + "txtrefrenceCategory").value + "</CategoryID>"
            str += "</Tb></Root>"

            if (document.getElementById(MasterObj + "CmbGroup").value != 0 && document.getElementById(MasterObj + "CmbGroup").value != "")
                document.getElementById(MasterObj + "txtGroupID").value = document.getElementById(MasterObj + "CmbGroup").value;
            else
                document.getElementById(MasterObj + "txtGroupID").value = 0;
            
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "txtSearch").value = str
            $get(MasterObj + "txtSubmit").value = "Add";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        ////_________________________________________________________________________________
        function OnChangeSelName() {
            if ($get(MasterObj + "SelName").value != "0")
                $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "SelName").value;
            else
                $get(MasterObj + "txtPersonCode").value = "";
        }
        ////_________________________________________________________________________________
        function OnBlurTxtPersonCode() {
            if ($get(MasterObj + "txtPersonCode").value != "" || $get(MasterObj + "txtPersonCode").value != "0")
                $get(MasterObj + "SelName").value = $get(MasterObj + "txtPersonCode").value
            else
                $get(MasterObj + "SelName").value = "0";
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnSearchDepartment() {
            //url = "SelectDepartment.aspx?DepartmentID=" + document.getElementById(MasterObj + "CmbDepartment").value;
            url = "../OrganizationChart/SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0"
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")

            if (returnValue != "" & returnValue != undefined) {
                
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
                if (oXmlNodes.length > 0) {
                    document.getElementById(MasterObj + "CmbGroup").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                    
                }
            }
        }
        //**********************************EndThisPage***************************************
    </script>

</asp:Content>
