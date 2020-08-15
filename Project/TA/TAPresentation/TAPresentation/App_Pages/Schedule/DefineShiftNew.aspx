<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineShiftNew.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefineShiftNew"
    Title="============================تغييرعضويت درگروه==============================="
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value != "0") {
                    if ($get(MasterObj + "txtAlert").value == "Display") {                     
                      
                    }
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        returnValue = 1
                    }
                }
                else {
                    alert($get(MasterObj + "txtAlert").value)
                }

                $get(MasterObj + "txtAlert").value = "";
            }
            $get(MasterObj + "txtValidate").valu = "";
            $get(MasterObj + "txtSubmit").value = "";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
    <table width="100%">
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            پرسنلي :
                        </td>
                        <td colspan="3">
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" id="rdbShift" runat="server" class="TxtControls" onclick="onclickrdbShift()"
                                checked />
                            شيفت :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" runat="server" onchange="cmbScheduleOnChange(this)"
                                Font-Size="Smaller" ID="cmbSchedule" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            گروه شيفتي :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" runat="server" Font-Size="Smaller" onchange="cmbGroupOnChange(this)"
                                ID="cmbGroup" Width="230px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" id="rdbNoShift" onclick="onclickrdbNOShift()" runat="server" />
                            دسته بندی :
                        </td>
                        <td>
                            <asp:DropDownList runat="server" class="TxtControls" onchange="cmbCategoryOnChange(this)"
                                ID="cmbCategory" Width="150px" Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            گروه غير شيفتي :
                        </td>
                        <td>
                            <asp:DropDownList runat="server" class="TxtControls" onchange="cmbCategoryGroupOnChange(this)"
                                ID="cmbCategoryGroup" Width="230px" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtOverlapXML" runat="server" />
                        <asp:HiddenField ID="txtXmlShiftNobatKariRel" runat="server" />
                        <asp:HiddenField ID="txtXmlCategoryGroupRel" runat="server" />
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
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXMLSave" runat="server" />
                    <input type="text" runat="server" id="txtGroupPersonID" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtUpdateSDate" runat="server" />
                    <input type="text" id="txtUpdateEDate" runat="server" />
                    <input type="text" id="txtUpdatePersonId" runat="server" />
                    <input type="text" id="txtUpdateGroupID" runat="server" />
                    <input type="text" id="txtFlagAccess" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
                    <input type="text" id="txtPersonName" name="txtPersonName" runat="server" />
                    <input type="text" id="txtChangeShift" name="txtChangeShift" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>
     <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var PermisionForChangeShift = 0;
        //------------------برای مد ویرایش باید اگر در حالت گروه شیفتی قرار دارد تغییر به یک گروه شیفتی چک شود
        if ($("#" + MasterObj + "txtGroupPersonID").val() == "1")
            if ($("#" + MasterObj + "rdbShift").attr("checked") == true)
                $("#" + MasterObj + "txtChangeShift").val("1");
        //-------------------------------------------------------------------------------------------------------------
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value;
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

        $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value;
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

        var GroupID = $get(MasterObj + "cmbCategoryGroup").value;
        if (GroupID == 0) GroupID = $get(MasterObj + "cmbGroup").value;

        if ($get(MasterObj + "rdbShift").checked == true) {
            cmbScheduleOnChange($get(MasterObj + "cmbSchedule"))
            $get(MasterObj + "cmbGroup").value = GroupID;
        }
        if ($get(MasterObj + "rdbNoShift").checked == true) {
            cmbCategoryOnChange($get(MasterObj + "cmbCategory"))
            $get(MasterObj + "cmbCategoryGroup").value = GroupID;
        }
        var OldSDate = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
        var OldEDate = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        var OldPersonID = $get(MasterObj + "CmbPerson_txtCode").value;
        document.body.scroll = "no";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            if (CheckNotEmptyData()) {
                var check = '';
                check = ($get(MasterObj + "rdbShift").checked) ? 'true' : 'false';

                if (check == "false" && $("#" + MasterObj + "txtChangeShift").val() == "1")
                    PermisionForChangeShift = 1;
                else
                    PermisionForChangeShift = 0;
                
                MakeXML()
                var rr = '';
                var AjaxChek = '';
                var AjaxChek1 = '';
                

                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "DefineShiftNew.aspx/ModifyGroupAndMembers?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SaveXml:'" + $get(MasterObj + "txtXMLSave").value + "' ,ToPersonId:'" + $get(MasterObj + "txtOnLineUser").value + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "', GroupID:'" + $("#" + MasterObj + "cmbGroup").val() + "', CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "', check:'" + check + "', cmbCategoryGroup:'" + $("#" + MasterObj + "cmbCategoryGroup").val() + "' }",
                    async: false,
                    success: function(Data) {
                        AjaxChek = Data.d;
                        AjaxChek1 = Data.d;
                        AjaxChek = AjaxChek.substring(0, 7);
                        AjaxChek1 = AjaxChek1.substring(9, AjaxChek.lenght);
                        document.getElementById(MasterObj + "txtOverlapXML").value = AjaxChek1;
                        if (Data.d == "") {
                            // SetMsg("ذخيره شد");
                            window.returnValue = 1
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert("ذخيره با خطا مواجه شد");
                    }
                });
                CloseModelPopup();

                if (AjaxChek == "Display") {
                    url = "ShiftOverlap.aspx?" + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value;
                    var returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no");
                    if (returnValue == 1) {
                        document.getElementById(MasterObj + "txtSubmit").value = "SaveDate";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                if (AjaxChek != "Display") {
                    document.getElementById(MasterObj + "txtSubmit").value = "Save";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var SDate = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
            var EDate = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

            var str = ""
            str += "<GroupEntity>"
            str += "<EmployeeGroup>"
            str += "<Selected>1</Selected>"          
            str += "<PersonID>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonID>"
            str += "<Name>" + $get(MasterObj + "CmbPerson_txtName").value + "</Name>"
            str += "<OldStartDate>" + OldSDate + "</OldStartDate>"
            str += "<OldEndDate>" + OldEDate + "</OldEndDate>"
            str += "<OldGroupID>" + GroupID + "</OldGroupID>"
            str += "<OldPersonID>" + OldPersonID + "</OldPersonID>"
            str += "<StartDate>" + SDate + "</StartDate>"
            str += "<EndDate>" + EDate + "</EndDate>"
            str += "<PermisionForChangeShift>" + PermisionForChangeShift + "</PermisionForChangeShift>"
            str += "</EmployeeGroup>"
            str += "</GroupEntity>"

            $get(MasterObj + "txtXMLSave").value = str
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CheckNotEmptyData() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            if ($get(MasterObj + "CmbPerson_txtCode").value == "") {
                alert('پرسنل مورد نظر را انتخاب نماييد')
                $get(MasterObj + "CmbPerson_txtCode").focus()
                return false
            }
            else if ($get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value == "//") {
                alert('تاريخ شروع را وارد نماييد')
                $get(MasterObj + "KCalSDate_txtCalendar").focus()
                return false
            }
            else if ($get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value == "//") {
                alert('تاريخ پايان را وارد نماييد')
                $get(MasterObj + "KCalEDate_txtCalendar").focus()
                return false
            }
            else if (SDate > EDate) {
                alert('تاريخ شروع بزرگتر از تاريخ پايان است')
                $get(MasterObj + "KCalSDate_txtCalendar").focus()
                return false
            }
            else if ($get(MasterObj + "cmbSchedule").value == 0 && $get(MasterObj + "rdbShift").checked == true) {
                alert('شيفت مورد نظر را انتخاب نماييد')
                $get(MasterObj + "cmbSchedule").focus()
                return false
            }
            else if ($get(MasterObj + "cmbGroup").value == 0 && $get(MasterObj + "rdbShift").checked == true) {
                alert('گروه شيفتي مورد نظر را انتخاب نماييد')
                $get(MasterObj + "cmbGroup").focus()
                return false
            }
           return true
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {

            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbScheduleOnChange(obj) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlShiftNobatKariRel").value);
            var xmlNodes;

            if (obj.value == 0) {
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation");

                document.getElementById(MasterObj + 'cmbGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbGroup').all(0).innerText = 'انتخاب نشده'
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
                document.getElementById(MasterObj + "cmbGroup").value = 0
            }
            else {
                var oldNobatKari = document.getElementById(MasterObj + "cmbGroup").value
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation[ScheduleId=" + obj.value + "]");

                document.getElementById(MasterObj + 'cmbGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbGroup').all(0).innerText = 'انتخاب نشده'
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
        function OnClickBtnNew() {

            ClearAll() 
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ClearAll() {
           
            $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
            $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
            $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);

            $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
            $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
            $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);

            document.getElementById(MasterObj + "CmbPerson_txtCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtPCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtName").value = "";

            $get(MasterObj + "cmbSchedule").value =0
            $get(MasterObj + "cmbGroup").value = 0
            $get(MasterObj + "cmbCategory").value = 0
            $get(MasterObj + "cmbCategoryGroup").value = 0
            $get(MasterObj + "txtPersonName").value = ""
            $get(MasterObj + "txtPersonCode").value = ""
            $get(MasterObj + "rdbShift").checked = false
            $get(MasterObj + "rdbNoShift").checked = false
           // $get(MasterObj + "txtGroupPersonID").value = "0"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtPersonCode() {

            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickbtnRefreshPerson(obj) {

            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=" + $get(MasterObj + "txtMenuItemID").value + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
            var Result = "";
            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

            if (Result != "") {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    $get(MasterObj + "txtPersonCode").value = xmlNodes.item(0).selectSingleNode('PersonID').text
                    $get(MasterObj + "txtPersonName").value = xmlNodes.item(0).selectSingleNode('Family').text
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbGroupOnChange(obj) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlShiftNobatKariRel").value);
            var xmlNodes;

            if (obj.value != 0) {
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/ShiftNobatKariRelation[GroupID=" + obj.value + "]");
                if (xmlNodes.length != 0) {
                    document.getElementById(MasterObj + "cmbSchedule").value = xmlNodes.item(0).selectSingleNode('ScheduleId').text
                    cmbScheduleOnChange(document.getElementById(MasterObj + "cmbSchedule"))
                }
            }
        }
        function onclickrdbNOShift() {
            $get(MasterObj + "cmbSchedule").value = 0
            $get(MasterObj + "cmbGroup").value = 0
            $get(MasterObj + "cmbSchedule").disabled = true
            $get(MasterObj + "cmbGroup").disabled = true
            $get(MasterObj + "cmbCategory").disabled = false
            $get(MasterObj + "cmbCategoryGroup").disabled = false

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function cmbCategoryOnChange(obj) {
        
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value);
            var xmlNodes;


            if (obj.value == 0) {
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation");

                document.getElementById(MasterObj + 'cmbCategoryGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbCategoryGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbCategoryGroup').all(0).innerText = 'انتخاب نشده'
                document.getElementById(MasterObj + 'cmbCategoryGroup').all(0).value = 0

                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbCategoryGroup').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbCategoryGroup').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                        document.getElementById(MasterObj + 'cmbCategoryGroup').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                        j++
                    }
                }
                document.getElementById(MasterObj + "cmbCategoryGroup").value = 0
            }
            else {
                var oldNobatKari = document.getElementById(MasterObj + "cmbCategoryGroup").value
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation[CategoryId=" + obj.value + "]");

                document.getElementById(MasterObj + 'cmbCategoryGroup').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'cmbCategoryGroup').options.add(optionEl)
                document.getElementById(MasterObj + 'cmbCategoryGroup').all(0).innerText = 'انتخاب نشده'
                document.getElementById(MasterObj + 'cmbCategoryGroup').all(0).value = 0

                if (xmlNodes.length != 0) {
                    var j = 1
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        optionEl = document.createElement("OPTION")
                        document.getElementById(MasterObj + 'cmbCategoryGroup').options.add(optionEl)
                        document.getElementById(MasterObj + 'cmbCategoryGroup').all(j).innerText = xmlNodes.item(i).selectSingleNode('GroupName').text
                        document.getElementById(MasterObj + 'cmbCategoryGroup').all(j).value = xmlNodes.item(i).selectSingleNode('GroupID').text
                        j++
                    }
                }
                document.getElementById(MasterObj + "cmbCategoryGroup").value = oldNobatKari
                if (document.getElementById(MasterObj + "cmbCategoryGroup").value == "")
                    document.getElementById(MasterObj + "cmbCategoryGroup").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickrdbShift() {
            $get(MasterObj + "cmbSchedule").disabled = false
            $get(MasterObj + "cmbGroup").disabled = false
            $get(MasterObj + "cmbCategory").value = 0
            $get(MasterObj + "cmbCategoryGroup").value = 0
            $get(MasterObj + "cmbCategory").disabled = true
            $get(MasterObj + "cmbCategoryGroup").disabled = true

        }
        function cmbCategoryGroupOnChange(obj) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlCategoryGroupRel").value);
            var xmlNodes;

            if (obj.value != 0) {
                xmlNodes = xmlDoc.documentElement.selectNodes("/ScheduleEntity/CategoryGroupRelation[GroupID=" + obj.value + "]");
                if (xmlNodes.length != 0) {
                    document.getElementById(MasterObj + "cmbCategory").value = xmlNodes.item(0).selectSingleNode('CategoryId').text
                }
                else {
                    document.getElementById(MasterObj + "cmbCategory").value = 0
                }
                cmbScheduleOnChange(document.getElementById(MasterObj + "cmbCategory"))
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
