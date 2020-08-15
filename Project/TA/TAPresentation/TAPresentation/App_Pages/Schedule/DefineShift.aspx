<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineShift.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefineShift"
    Title="Untitled Page" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>
    <script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <table>
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
                        LastSelectedRow = null;
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = $get(MasterObj + "txtSubmit").value

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
                            }
                        }

                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            $get(MasterObj + "txtAlert").value = "";
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>
                <table>
                    <tr>
                        <td>
                            «“  «—ÌŒ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                             «  «—ÌŒ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td>
                            Å—”‰·Ì :
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            œ” Â »‰œÌ:
                        </td>
                        <td>
                            <asp:DropDownList runat="server" CssClass="TxtControls" onchange="cmbCategoryOnChange(this)"
                                ID="cmbCategory" Width="148px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            ‘Ì›  :
                        </td>
                        <td>
                            <asp:DropDownList runat="server" onchange="cmbScheduleOnChange(this)" ID="cmbSchedule"
                                Width="148px" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            ê—ÊÂ ‘Ì› Ì :
                        </td>
                        <td>
                            <asp:DropDownList runat="server" onchange="cmbGroupOnChange(this)" ID="cmbGroup"
                                Width="210px" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="900px" align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtXmlShiftNobatKariRel" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtXmlCategoryGroupRel" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSDateLoad" name="txtAcCode" runat="server" />
                    <input type="text" id="txtEDateLaod" name="txtAcCode" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
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
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtFlagAccess" runat="server" />
                    <input type="text" runat="server" id="txtGrdSDate" />
                    <input type="text" runat="server" id="txtGrdEDate" />
                    <input type="text" runat="server" id="txtScheduleID" />
                    <input type="text" runat="server" id="txtCategoryID" />
                    <input type="text" runat="server" id="txtGroupID" />
                    <input type="text" runat="server" id="txtPersonID" />
                    <input type="text" runat="server" id="txtGroupPersonID" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtcmbGroup" name="txtcmbGroup" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtPersonName" name="txtPersonName" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">

        var LastSelectedRow = null;
        var LastSelectedRowClass = "";





        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);

        document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value

        document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
        $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);

        document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

        //*************************************Toolbar*************************************
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

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
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
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            url = "DefineShiftNew.aspx?GroupPersonID=0" + " &RequsterPageID=1349" + " &SessionID=" + $get(MasterObj + "txtSessionID").value
            + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&PCode=" + document.getElementById(MasterObj + "CmbPerson_txtPCode").value
            + "&PName=" + document.getElementById(MasterObj + "CmbPerson_txtName").value
            
            var rr = window.showModalDialog(encodeURI(url), window, "dialogHeight:380px;dialogWidth: 600px;center: Yes;help: no;status: no")
            if (rr == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            if (LastSelectedRow != null) {
                var Msg = "¬Ì« »—«Ì Õ–› „ÿ„∆‰Ìœø"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("»Â „‰ŸÊ— Õ–› Ìò ”ÿ— —« «‰ Œ«» ò‰Ìœ")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            OndbClickGrd()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";

            document.getElementById(MasterObj + "txtScheduleID").value = SelectedRow.ShiftID
            document.getElementById(MasterObj + "txtCategoryID").value = SelectedRow.CategoryId
            document.getElementById(MasterObj + "txtGroupID").value = SelectedRow.GroupID;

            document.getElementById(MasterObj + "txtPersonID").value = SelectedRow.cells(2).innerText;

            document.getElementById(MasterObj + "txtGrdSDate").value = SelectedRow.cells(4).innerText;

            document.getElementById(MasterObj + "txtGrdEDate").value = SelectedRow.cells(5).innerText;

            //document.getElementById(MasterObj + "txtGroupPersonID").value = SelectedRow.GPID

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            if (LastSelectedRow != null) {
                url = "DefineShiftNew.aspx?"
                        + "GroupPersonID=1"
                        + "&CategoryId=" + document.getElementById(MasterObj + "txtCategoryID").value
                        + "&ScheduleID=" + document.getElementById(MasterObj + "txtScheduleID").value
                        + "&GroupID=" + document.getElementById(MasterObj + "txtGroupID").value
                        + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonID").value
                        + "&SDate=" + document.getElementById(MasterObj + "txtGrdSDate").value
                        + "&EDate=" + document.getElementById(MasterObj + "txtGrdEDate").value
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                        + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                        + "&PCode=" + LastSelectedRow.cells(2).innerText + "&PName=" + LastSelectedRow.cells(3).innerText;

                var rr = window.showModalDialog(encodeURI(url), window, "dialogHeight: 380px;dialogWidth: 600px;center: Yes;help: no;status: no")
                if (rr == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("»Â „‰ŸÊ— ÊÌ—«Ì‘ Ìò ”ÿ— —« «‰ Œ«» ò‰Ìœ")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {

            if (document.getElementById(MasterObj + "cmbGroup").value != 0)
                document.getElementById(MasterObj + "txtcmbGroup").value = document.getElementById(MasterObj + "cmbGroup").value;
            document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "cmbCategory").value = "0";
            document.getElementById(MasterObj + "cmbSchedule").value = "0";
            document.getElementById(MasterObj + "cmbGroup").value = "0";
            document.getElementById(MasterObj + "CmbPerson_txtCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtPCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtName").value = "";
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = "ShowAll";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbGroupOnChange(obj) {
            if (obj.value != 0) {
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlShiftNobatKariRel").value);
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation[GroupID=" + obj.value + "]");
                if (xmlNodes.length != 0) {
                    document.getElementById(MasterObj + "cmbSchedule").value = xmlNodes.item(0).selectSingleNode('ScheduleId').text
                    cmbScheduleOnChange(document.getElementById(MasterObj + "cmbSchedule"))
                }
                else {
                    var xmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
                    xmlDoc1.async = "false";
                    xmlDoc1.loadXML(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value);
                    // alert(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value)
                    //alert("/ScheduleEntity/CategoryGroupRelation[GroupID=" + obj.value + "]")
                    var xmlNodes1;
                    xmlNodes1 = xmlDoc1.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation[GroupID=" + obj.value + "]");
                    if (xmlNodes1.length != 0) {
                        document.getElementById(MasterObj + "cmbCategory").value = xmlNodes1.item(0).selectSingleNode('CategoryId').text
                        if (document.getElementById(MasterObj + "cmbCategory").value != "0")
                            cmbCategoryOnChange(document.getElementById(MasterObj + "cmbCategory"))
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbScheduleOnChange(obj) {
            if (obj.value == 0) {
                LoadAllGroup()
            }
            else {
                document.getElementById(MasterObj + "cmbCategory").value = 0
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlShiftNobatKariRel").value);
                var xmlNodes;


                var oldNobatKari = document.getElementById(MasterObj + "cmbGroup").value
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation[ScheduleId=" + obj.value + "]");

                document.getElementById(MasterObj + 'cmbGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbGroup').all(0).innerText = '«‰ Œ«» ‰‘œÂ'
                document.getElementById(MasterObj + 'cmbGroup').all(0).value = 0

                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbGroup').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                        document.getElementById(MasterObj + 'cmbGroup').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                        j++
                    }
                }
                document.getElementById(MasterObj + "cmbGroup").value = oldNobatKari
                if (document.getElementById(MasterObj + "cmbGroup").value == "")
                    document.getElementById(MasterObj + "cmbGroup").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbCategoryOnChange(obj) {
            if (obj.value == 0) {
                LoadAllGroup()
            }
            else {
                document.getElementById(MasterObj + "cmbSchedule").value = 0
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value);
                var xmlNodes;
                var oldNobatKari = document.getElementById(MasterObj + "cmbGroup").value
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation[CategoryId=" + obj.value + "]");

                document.getElementById(MasterObj + 'cmbGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbGroup').all(0).innerText = '«‰ Œ«» ‰‘œÂ'
                document.getElementById(MasterObj + 'cmbGroup').all(0).value = 0

                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbGroup').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                        document.getElementById(MasterObj + 'cmbGroup').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                        j++
                    }
                }
                document.getElementById(MasterObj + "cmbGroup").value = oldNobatKari
                if (document.getElementById(MasterObj + "cmbGroup").value == "")
                    document.getElementById(MasterObj + "cmbGroup").value = 0
            }
        }
        function LoadAllGroup() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlShiftNobatKariRel").value);
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation");

            document.getElementById(MasterObj + 'cmbGroup').innerHTML = ""
            optionEl = document.createElement("OPTION")
            document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
            document.getElementById(MasterObj + 'cmbGroup').all(0).innerText = '«‰ Œ«» ‰‘œÂ'
            document.getElementById(MasterObj + 'cmbGroup').all(0).value = 0

            if (xmlNodes.length != 0) {
                var j = 1
                for (var i = 0; i < xmlNodes.length; ++i) {
                    optionEl = document.createElement("OPTION")
                    document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                    document.getElementById(MasterObj + 'cmbGroup').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                    document.getElementById(MasterObj + 'cmbGroup').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                    j++
                }
            }
            var xmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc1.async = "false";
            xmlDoc1.loadXML(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value);
            //alert(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value)
            var xmlNodes1;
            xmlNodes1 = xmlDoc1.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation");
            if (xmlNodes1.length != 0) {
                //var j = 1
                for (var d = 0; d < xmlNodes1.length; ++d) {
                    optionEl = document.createElement("OPTION")
                    document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                    document.getElementById(MasterObj + 'cmbGroup').all(j).innerText = xmlNodes1.item(d).selectSingleNode('GroupName').text
                    document.getElementById(MasterObj + 'cmbGroup').all(j).value = xmlNodes1.item(d).selectSingleNode('GroupID').text
                    j++
                }
            }
            document.getElementById(MasterObj + "cmbGroup").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
