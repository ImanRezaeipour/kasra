<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RequestTransferInDept_New.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.RequestTransferInDept_New" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            کد پرسنلي:
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td style="text-align: right">
                            واحد سازماني :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <asp:Label ID="lblDeptName" runat="server" Style="color: black; border: 1px solid #6699FF;
                                        width: 210px; height: 20px"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            واحد سازماني:
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbDepartment" runat="server" />
                        </td>
                        <td>
                            تاريخ جابجايي:
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            عنوان سمت :
                        </td>
                        <td style="text-align: right">
                            <input id="txtRoleTitle" type="text" class="TxtControls" style="width: 120px" runat="server" />
                            <input id="BtnOption" type="button" value="...." runat="server" onclick="return OnClickBtnOption()" />
                        </td>
                        <td>
                            نوع سمت :
                        </td>
                        <td style="text-align: right">
                            <select id="CmbRoleType" runat="server" class="TxtControls" style="width: 205px">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="text-align: right">
                            <div>
                                <legend>
                                  <input type="checkbox" id="ChkHead" runat="server" />ارشد واحد</legend></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شرج:
                        </td>
                        <td colspan="3" style="text-align: right">
                            <textarea id="TxtDescript" cols="20" style="width: 467px; height: 30;" class="TxtControls"
                                runat="server" rows="2"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" style="text-align: right">
            <div id="Div1" runat="server">
                <div id="DivCardReaderFirst">
                    <input type="checkbox" id="chkCardReaderFirst" />انتقال اثر انگشت</legend></div></div>
                <fieldset id="FldCardReader" dir="rtl" style="width: 100%; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6;" id="LegCardReader">
                        <input type="checkbox" id="chkCardReader" />انتقال اثر انگشت</legend>
                    <div id="DivCardReader" style="height: 250px; overflow: auto" align="center">
                        <table id="GrdCardReader">
                            <tr class="header">
                                <td class="CssHeaderStyle" style="width: 30px" align="center">
                                    <input type="checkbox" id="ChkHeader" onclick='onclickChkHeader(this)' />
                                </td>
                                <td class="CssHeaderStyle" style="width: 200px" align="center">
                                    نام گروه کارتخوان
                                </td>
                                <td class="CssHeaderStyle" style="width: 120px" align="center">
                                    کارتخوانها
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTransferDeptID" name="txtTransferDeptID" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtCardReader" name="txtCardReader" />
        <input type="text" id="txtShowTitleSemat" name="txtShowTitleSemat" runat="server" />
         <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        //*************************************Declaration*************************************
     
        var PageSize = 10;
        $(document).ready(function () {
            $("#DivCardReaderFirst").show();
            $("#FldCardReader").hide();
            $("#chkCardReader").click(function () {
                onclickchk(this);
            });
            $("#chkCardReaderFirst").click(function () {
                onclickchk(this);
            });
            CreateGrid("First");
            var Xml;
            if (window.ActiveXObject) {
                Xml = new ActiveXObject('Microsoft.XMLDOM');
                Xml.async = 'false';
                Xml.loadXML($("#" + MasterObj + "txtXml").val());
            } else {
                var parser = new DOMParser();
                Xml = parser.parseFromString($("#" + MasterObj + "txtXml").val(), 'text/xml');
            }
            var XmlNode = $(Xml).find("NewDataSet").find("CardReader").find("Checked").filter(function () { return $(this).text() == "1" });
            if (XmlNode.length > 0) {
                $("#chkCardReader").attr("checked", true);
                $("#chkCardReader").click();
            }

        });
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        function onclickchk(obj) {
            $("#LegCardReader").css("color", $(obj).attr("checked") ? "black" : "#78BED6");
            if ($(obj).attr("checked")) {

                $("#DivCardReaderFirst").hide("slow");
                $("#FldCardReader").show();
                $("#chkCardReader").attr("checked", true);
                $("#chkCardReaderFirst").attr("checked", true);
            }
            else {
                $("#FldCardReader").hide("slow");
                $("#DivCardReaderFirst").show();
                $("#chkCardReader").attr("checked", false);
                $("#chkCardReaderFirst").attr("checked", false);
            }
        }
        function SetCardReaders() {
            $("#GrdCardReader").find("tr").each(function () {
                if (!$(this).hasClass("header"))
                    if (this.cells(0).firstChild.checked) {
                        $("#txtCardReader").val($("#txtCardReader").val() + ($("#txtCardReader").val() == "" ? "" : ",") + this.getAttribute("GroupID"));
                    }
            });
            }
            $("#" + MasterObj + "CmbPerson_txtOnChangeFunc").val("OnChangeCmbPerson()");
        //----------------------------------------------
        function OnClickBtnSave() {
            if (CheckNotEmpty()) {
                SetCardReaders();
                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "RequestTransferInDept_New.aspx/ModifyTransferInDept?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{ID:'" + $("#" + MasterObj + "txtTransferDeptID").val() + "' ,PersonCode:'" + $("#" + MasterObj + "CmbPerson_txtCode").val() + "',SDate:'" + $("#" + MasterObj + "txtDate").val() + "' ,EDate:'' ,DepartmentCode:'" + $("#" + MasterObj + "CmbDepartment_txtID").val()/*$("#" + MasterObj + "CmbDepartment_txtCode").val()*/ + "' ,RoleType:'" + $("#" + MasterObj + "CmbRoleType").val() + "' ,RoleTitle:'" + $("#" + MasterObj + "txtRoleTitle").val() + "',CardReaderGroup:'" + $("#txtCardReader").val() + "',Head:" + $("#" + MasterObj + "ChkHead").attr("checked") + ",Description:'" + $("#" + MasterObj + "TxtDescript").text() + "' , CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                    success: function (Data) {
                        CloseModelPopup();
                        var xmlSave;
                        xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                        xmlSave.async = 'false';
                        xmlSave.loadXML(Data.d);
                        var XmlNode = xmlSave.documentElement.selectNodes("/NewDataSet/ShowMessage");
                        if (XmlNode[0].selectSingleNode("Validate").text == "1")
                            SetMsg(XmlNode[0].selectSingleNode("Message").text)
                        else
                            alert(XmlNode[0].selectSingleNode("Message").text)
                        $("#" + MasterObj + "txtTransferDeptID").val(XmlNode[0].selectSingleNode("ID").text);
                        window.returnValue = 1;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        CloseModelPopup();
                        alert("با خطا مواجه شد ");
                    }
                });

            }
        }
        //----------------------------------------------
        function OnClickBtnSaveClear() {
            if (CheckNotEmpty()) {
                SetCardReaders();
                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "RequestTransferInDept_New.aspx/ModifyTransferInDept?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{ID:'" + $("#" + MasterObj + "txtTransferDeptID").val() + "' ,PersonCode:'" + $("#" + MasterObj + "CmbPerson_txtCode").val() + "',SDate:'" + $("#" + MasterObj + "txtDate").val() + "' ,EDate:'' ,DepartmentCode:'" + $("#" + MasterObj + "CmbDepartment_txtCode").val() + "' ,RoleType:'" + $("#" + MasterObj + "CmbRoleType").val() + "' ,RoleTitle:'" + $("#" + MasterObj + "txtRoleTitle").val() + "',CardReaderGroup:'" + $("#txtCardReader").val() + "',Head:" + $("#" + MasterObj + "ChkHead").attr("checked") + ",Description:'" + $("#" + MasterObj + "TxtDescript").text() + "' , CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                    success: function (Data) {
                        CloseModelPopup();
                        var xmlSave;
                        if (window.ActiveXObject) {
                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                            xmlSave.async = 'false';
                            xmlSave.loadXML(Data.d);
                        } else {
                            var parser = new DOMParser();
                            xmlSave = parser.parseFromString(Data, 'text/xml');
                        }
                        if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "1")
                            SetMsg($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())
                        else
                            alert($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())
                        $("#" + MasterObj + "txtTransferDeptID").val($(xmlSave).find("NewDataSet").find("ShowMessage").find("ID").text());
                        Clear();
                        window.returnValue = 1;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        CloseModelPopup();
                        alert("با خطا مواجه شد ");
                    }
                });

            }
        }
        //----------------------------------------------
        function Clear() {
            $("#" + MasterObj + "CmbPerson_txtCode").val("");
            $("#" + MasterObj + "CmbPerson_txtPCode").val("");
            $("#" + MasterObj + "CmbPerson_txtName").val("");
            $("#" + MasterObj + "CmbDepartmentn_txtCode").val("");
            $("#" + MasterObj + "CmbDepartment_txtPCode").val("");
            $("#" + MasterObj + "CmbDepartment_txtName").val("");
            $("#" + MasterObj + "txtDate").val("");
            $("#" + MasterObj + "KCalDate_txtYear").val("");
            $("#" + MasterObj + "KCalDate_txtMonth").val("");
            $("#" + MasterObj + "KCalDate_txtDay").val("");
            $("#" + MasterObj + "KCalDate_txtCalendar").val("");
            $("#" + MasterObj + "txtRoleTitle").val("");
            $("#" + MasterObj + "CmbRoleType").val("0");
            $("#" + MasterObj + "ChkHead").attr("checked", false);
            $("#" + MasterObj + "TxtDescript").text("");
            $("#" + MasterObj + "txtTransferDeptID").val("0")
        }
        //----------------------------------------------
        function CheckNotEmpty() {
            $("#" + MasterObj + "txtDate").val($("#" + MasterObj + "KCalDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalDate_txtDay").val());
            if ($("#" + MasterObj + "CmbPerson_txtCode").val() == "") {
                alert("لطفا شماره پرسنلي را وارد کنيد ");
                $("#" + MasterObj + "CmbPerson_txtPCode").focus();
                return false;
            }
            if ($("#" + MasterObj + "txtDate").val() == "//") {
                alert("لطفا تاريخ را وارد کنيد ");
                $("#" + MasterObj + "KCalDate_txtCalendar").focus();
                return false;
            }
            if ($("#" + MasterObj + "CmbDepartment_txtCode").val() == "") {
                alert("لطفا واحد سازماني را وارد کنيد ");
                $("#" + MasterObj + "CmbDepartment_txtPCode").focus();
                return false;
            }
            if ($("#" + MasterObj + "txtRoleTitle").val() == "") {
                alert("لطفا عنوان سمت  را وارد کنيد ");
                $("#" + MasterObj + "txtRoleTitle").focus();
                return false;
            }
            if ($("#" + MasterObj + "CmbRoleType").val() == "0") {
                alert("لطفا نوع سمت  را وارد کنيد ");
                $("#" + MasterObj + "CmbRoleType").focus();
                return false;
            }
            return true;
        }
        //---------------------------
        function CreateGrid(direction) {
            //            ClearGrid()
            var xml
            var Data = $("#" + MasterObj + "txtXml").val();
            //-------------------------
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            //--------------------------
            $(xml).find("NewDataSet").find("CardReader").each(function () {
                AddRow($(this), false);
            });
        }
        //**************************paging***********************************************
        function AddRow(XmlNode, checked) {
            $("#GrdCardReader").append("<tr class='CssItemStyle'></tr>");
            var oRow = $("#GrdCardReader").find("tr:eq(" + ($("#GrdCardReader").find("tr").length - 1) + ")");
            oRow.append("<td><input type='checkbox' " + (XmlNode.find("Checked").text() == "1" ? "checked" : "") + " /></td>");
            oRow.append("<td>" + XmlNode.find("Name").text() + "</td>");
            oRow.append("<td>" + XmlNode.find("CardReaders").text() + "</td>");
            oRow.attr("GroupID", XmlNode.find("ID").text());
        }

        //-----------------------------------
        function onclickChkHeader(obj) {
        alert(200)
            var TRs = $("#GrdCardReader").find("tr");
            for (var i = 0; i < TRs.length - 1; i++) {
                if (!$("#GrdCardReader").find("tr:eq(" + i + ")").hasClass("header")) {
                    $("#GrdCardReader")[0].rows(i).cells(0).firstChild.checked = obj.checked;
                }
            }
        }
        //----------------------------------------------------------
        function OnClickBtnOption() {
            var url = "RequestTransferInDept_RoleTitle.aspx";
            var winPro = "dialogWidth:700px;dialogHeight:500px;center: Yes;help: no;status:no;minimize: yes;"
            url = encodeURI(url);
            var returnValue = window.showModalDialog(url, window, winPro)
            if (returnValue != "")
                $("#" + MasterObj + "txtRoleTitle").val(returnValue);
            else
                $("#" + MasterObj + "txtRoleTitle").val($("#" + MasterObj + "txtRoleTitle").val());
        }
        //*******************************************************************************
        function OnChangeCmbPerson() {
            if ($get(MasterObj + "CmbPerson_txtName").value != "") {
                $get(MasterObj + "txtSubmit").value = "DepartmentOfPerson";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
    </script>
</asp:Content>
