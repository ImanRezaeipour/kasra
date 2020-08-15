<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    ValidateRequest="false" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="EnterCreditNew.aspx.cs"
    Inherits="TAPresentation.App_Pages.DataEntry.EnterCreditNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .CssLables
        {
            text-align: right;
        }
        .CssItemNewStyle
        {
            background-color: #DFE6EE;
        }
        .CssNewRow
        {
            background-color: #C7D0DF;
        }
        .CssFilterItems
        {
            width: 100%;
        }
        .CssTitleExtended
        {
            background-image: url('../../../App_Utility/Images/Icons/BGNew.png');
            font-weight: bold;
        }
        .CssItemExtended
        {
            background-color: #FFFFFF;
        }
        .CssSelectedRow
        {
            background-color: #FCDA94;
        }
    </style>
    <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr id="TRMenue" runat="server" style="display: none">
            <td>
                <table style="width: 60%">
                    <tr>
                        <td>
                            نوع مجوز :
                        </td>
                        <td>
                            <select id="CmbCodeType" style="width: 170px" class="TxtControls CodeType" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td class="KasraKar">
                            ترددهای ورود قبل از ساعت :
                        </td>
                        <td class="KasraKarTime">
                            <input id='txtKasrKarTime' type='text' class='TxtControls' style='width: 70px' onkeydown='OnKeyDownTime(this.value)'  onblur='Timechk(this)' value='00:00'  onfocus='OnFocuseTxtTime(this)' runat="server" />
                        </td>
                        <td class="MazadKar" style="display:none">
                            ترددهای خروج بعد از ساعت :
                        </td>
                        <td class="MazadKarTime" style="display:none">
                            <input id='txtMazadKarTime' type='text' class='TxtControls' style='width: 70px' onkeydown='OnKeyDownTime(this.value)'  onblur='Timechk(this)' value='00:00'  onfocus='OnFocuseTxtTime(this)' runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي فيلتر</legend>
                    <table id="FilterTable" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                از :
                            </td>
                            <td>
                                <%--<uc1:KCalendar ID="KCalSDate" runat="server" />--%>
                                <input type="text" id="TxtStartDate" class="TxtControls" style="width:100px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                            </td>
                            <td>
                                از پرسنلي :
                            </td>
                            <td>
                                <uc3:ComboBox ID="CmbFromPCode" runat="server" />
                            </td>
                            <td class="CssLables">
                                گروه پرسنلي:
                            </td>
                            <td>
                                <select id="CmbGroup" class="TxtControls" style="width: 205px" runat="server">
                                </select>
                            </td>
                            <td>
                                وضعيت :
                                <asp:DropDownList ID="cmbState" runat="server" class='txtControls'>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تا :
                            </td>
                            <td>
                                <%--<uc1:KCalendar ID="KCalEDate" runat="server" />--%>
                                <input type="text" id="TxtEndDate" class="TxtControls" style="width:100px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                            </td>
                            <td>
                                تا پرسنلي :
                            </td>
                            <td>
                                <uc3:ComboBox ID="CmbToPCode" runat="server" />
                            </td>
                            <td class="CssLables">
                                واحد سازماني:
                            </td>
                            <td>
                                <select id="CmbDepartment" class="TxtControls" style="width: 205px" runat="server">
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي پيش فرض</legend>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                مجوز :
                            </td>
                            <td>
                                <select id="cmbDfaultCredit" runat="server" style="width: 200px" class="TxtControls">
                                </select>
                            </td>
                            <td>
                                <input id="BtnShow" class="" style="background-position: right; background-repeat: no-repeat;
                                    background-color: #97D0EC; border-right: #346fa4 2px solid; border-top: lightsteelblue 2px solid;
                                    border-left: lightsteelblue 2px solid; border-bottom: #346fa4 2px solid; width: 60px;
                                    height: 30px; cursor: pointer; background-image: url('../../App_Utility/Images/Icons/copy01.gif');"
                                    type="button" name="btnCopy" value="  کپی" onclick="OnClickbtnCopy()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شرح :
                            </td>
                            <td>
                                <input type="text" id="txtDefaultDesc" runat="server" class="TxtControls" style="width: 200px" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr id="TdToolBar">
            <td colspan="2">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="display: none">
                    <asp:HiddenField ID="txtAlert" runat="server" />
                    <asp:HiddenField ID="txtClosePage" runat="server" />
                    <asp:HiddenField ID="txtWPID" runat="server" />
                </div>
                <div valign="top" align="right" id="GridViewCountainer" style="width: 96%; height: 400px;
                    overflow: auto">
                    <table id="TblMainCredit">
                        <tr style="height: 20px;" valign="top">
                            <td class="CssHeaderStyle" style="width: 30px" align="center">
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                از تاریخ
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                تا تاریخ
                            </td>
                            <td class="CssHeaderStyle" style="width: 80px" align="center">
                                پرسنلی
                            </td>
                            <td class="CssHeaderStyle" style="width: 130px" align="center" valign="middle">
                                نام
                            </td>
                            <td class="CssHeaderStyle" style="width: 60px" align="center">
                                ز.شروع
                            </td>
                            <td class="CssHeaderStyle" style="width: 60px" align="center">
                                ز.خاتمه
                            </td>
                            <td class="CssHeaderStyle" style="width: 60px" align="center" valign="middle">
                                مقدار
                            </td>
                            <td class="CssHeaderStyle" style="width: 170px" align="center">
                                نوع مجوز
                            </td>
                            <td class="CssHeaderStyle" style="width: 210px" align="center">
                                پرسنل جانشين
                            </td>
                            <td class="CssHeaderStyle" style="width: 150px" align="center" valign="middle">
                                تردد
                            </td>
                            <td class="CssHeaderStyle" style="width: 150px" align="center">
                                شرح
                            </td>
                            <td class="CssHeaderStyle" style="width: 50px" align="center" valign="middle">
                                تکميلي
                            </td>
                            <td class="CssHeaderStyle" style="width: 20px" align="center">
                            </td>
                            <td class="CssHeaderStyle" style="width: 20px" align="center">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input id="txtOnLineUser" type="text" name="txtOnLineUser" runat="server" />
        <input id="txtFlag" type="text" name="txtFlag" runat="server" />
        <input id="txtSaveXml" type="text" name="txtSaveXml" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtMainCode" runat="server" />
        <input type="text" id="txtState" runat="server" />
        <input type="text" id="txtCalcOption" runat="server" />
        <input type="text" id="txtSDate" runat="server" />
        <input type="text" id="txtEDate" runat="server" />
        <input type="text" id="txtXmlGrd" runat="server" />
        <input type="text" id="txtXMLCmbCredite" runat="server" />
        <input type="text" id="txtToday" name="txtToday" runat="server" />
        <select id="CmbCreditType" class="TxtControls CssInsertNewItem" style="width: 170px"
            runat="server">
        </select>
        <select id="CmbCreditType2" class="TxtControls CssInsertNewItem" style="width: 170px">
        </select>
        <select id="CmbCreditDailyType2" class="TxtControls CssInsertNewItem CreditType"
            style="width: 170px">
        </select>
        <select id="CmbCreditTimelyType2" class="TxtControls CssInsertNewItem CreditType"
            style="width: 170px">
        </select>
        <!------------------------------آیتم های جایگزین در سلولها به منظور ویرایش------->
        <div id="DivSTime">
            <input id="txtSTimeSelected" type="text" class="TxtControls CssInsertNewItem CssTimeStyle CssSTimeStyle"
                style="width: 50px; font-weight: bold;" />
        </div>
        <div id="DivETime">
            <input id="txtETimeSelected" type="text" class="TxtControls CssInsertNewItem CssTimeStyle"
                style="width: 50px; font-weight: bold;" />
        </div>
        <div id="DivCreditTimelyType">
            <select id="CmbCreditTimelyType" class="TxtControls CssInsertNewItem CreditType"
                style="width: 170px" runat="server">
            </select>
        </div>
        <div id="DivCreditDailyType">
            <select id="CmbCreditDailyType" class="TxtControls CssInsertNewItem CreditType" style="width: 170px"
                runat="server">
            </select>
        </div>
        <div id="DivJPersonCode">
            <input id="txtJPersonCode" type="text" class="TxtControls CssInsertNewItem CssPersonCode"
                style="width: 60px; font-weight: bold; float: right" />
            <input id="BtnSelectJPerson" class="CssHeaderStyle CssButtonPersonCode" type="button"
                value="..." style="height: 20px; cursor: hand; width: 15px" />
            <asp:Label ID="JPersonName" Style="text-align: right;" runat="server" align="right"></asp:Label>
        </div>
        <div id="DivDescript">
            <input id="txtDescriptSelected" type="text" class="TxtControls CssInsertNewItem"
                style="width: 150px; font-weight: bold;" />
        </div>
        <div id="DivExtended">
            <asp:Label runat="server" Text="..." class="Extended" Style="text-align: center;
                text-decoration: underline; color: Blue; cursor: hand"></asp:Label>
        </div>
        <!------------------------------------------------------------------------------------>
    </div>
    <script language="javascript" type="text/javascript">
        //document.getElementsByTagName("body")[0].scroll = "no";
        //$.noConflict();
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";
        var Mode = 0;
        /////-------------------------------------------
        win = window.dialogArguments
        window.name = "EnterCreditNew"
        aspnetForm.target = window.name

        document.body.style.overflowX = "hidden";
        document.body.style.overflowY = "hidden";

        $(document).ready(function () {
            $('#TxtStartDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });

            $('#TxtEndDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });


            var startDate = document.getElementById(MasterObj + "txtSDate").value;
            var endDate = document.getElementById(MasterObj + "txtEDate").value;

            document.getElementById("TxtStartDate").value = ReverceDate(document.getElementById(MasterObj + "txtSDate").value);
            document.getElementById("TxtEndDate").value = ReverceDate(document.getElementById(MasterObj + "txtEDate").value);

            PageLoad();
            
        });
        //----------------------------------------------------------------
        function RefreshParentRow() {
            try {
                if ($("#" + MasterObj + "txtCalcOption").val() != "0") {
                    win = window.dialogArguments
                    if (win.RefreshThisRow)
                        win.RefreshThisRow()
                    //            else {
                    //                Pageunload()
                    //            }
                }
            }
            catch (e) {
                //Pageunload()
            }
        }
        
        //----------------------------------------------------------------
        function PageLoad() {
            ClearGrid();
            var Data = $("#" + MasterObj + "txtXmlGrd").val();
            var Type, CreditRelatedType, JPerson;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            XmlNodes = $(xml).find("DataEntryEntity").find("GetPersonelDetailCode");
            $(XmlNodes).each(function () {
                if (($(this).find("StartTime").text() == "00:00" && $(this).find("EndTime").text() == "00:00")
         || ($(this).find("StartTime").text() == "" && $(this).find("EndTime").text() == "")
         || $(this).find("WfDocID").text() == "2") {
                    CreditRelatedType = "DivCreditDailyType";
                    Type = "Daily";
                    JPerson = "DivJPersonCode";
                }
                else {
                    CreditRelatedType = "DivCreditTimelyType";
                    Type = "Timely";
                    JPerson = "";
                }
                
                AddRow($(this).find("PersonelID").text(), $(this).find("PersonCode").text(), $(this).find("PersonName").text(), $(this).find("RSDate").text(), $(this).find("REDate").text(), $(this).find("StartTime").text(), $(this).find("EndTime").text(), $(this).find("value").text(), $(this).find("InOut").text(), $(this).find("Desc").text(), $(this).find("CreditID").text(), $(this).find("StatusID").text(), $(this).find("Code").text(), $(this).find("WfDocID").text(), $(this).find("WfNew").text(), $(this).find("CodeGroupID").text(), CreditRelatedType, Type, JPerson, $(this).find("JPCode").text(), $(this).find("JPName").text(), $(this).find("Extended").text());
            });
            //--------------------Bind CmbDefaultCredit---------------------------------
            BindCmbDefalutCredit();
            //--------------------------------------------------------------------------
            if ($(XmlNodes).length != 0) {
                OnClickGrd($("#TblMainCredit").find("tr:eq(1)"), 0);
                $("#TblMainCredit").find("tr").each(function () {
                    if ($(this).attr("CreditID") != "0" && $(this).attr("CreditID") != undefined) {
                        OnClickGrd($(this));
                        OnChangeCmbCreditType($(this).find("td:eq(8)").children());
                    }
                });
            }
        }
        //===========================================================================================================
        function BindCmbDefalutCredit() {
            var Daily = 0, Timely = 0;
            $("#TblMainCredit").find("tr").each(function () {
                if ($(this).index() > 0) {
                    if ($(this).attr("CreditID") == "0") {
                        if ($(this).attr("Type") == "Daily")
                            Daily = 1;
                        else
                            Timely = 1;
                    }
                }
            });
            if (Mode == 0) {
                if (Daily == 1 && Timely == 1)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#" + MasterObj + "CmbCreditType").html());
                else if (Daily == 1 && Timely == 0)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#" + MasterObj + "CmbCreditDailyType").html());
                else if (Daily == 0 && Timely == 1)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#" + MasterObj + "CmbCreditTimelyType").html());
            }
            else {
                if (Daily == 1 && Timely == 1)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#CmbCreditType2").html());
                else if (Daily == 1 && Timely == 0)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#CmbCreditDailyType2").html());
                else if (Daily == 0 && Timely == 1)
                    $("#" + MasterObj + "cmbDfaultCredit").html($("#CmbCreditTimelyType2").html());
            }
            Mode = 0;
        }
        //===========================================================================================================
        function OnClickBtnFilter() {
            var kasrKarTime, MazadKarTime

            //------------تعیین فیلتر مربوط به ساعت های کسرو مازاد
            if ($("#" + MasterObj + "CmbCodeType option:selected").index() == "0") {
                kasrKarTime = $("#" + MasterObj + "txtKasrKarTime").val() == "00:00" ? "0" : $("#" + MasterObj + "txtKasrKarTime").val();
                MazadKarTime = "0";
            }
            else {
                MazadKarTime = $("#" + MasterObj + "txtMazadKarTime").val() == "00:00" ? "0" : $("#" + MasterObj + "txtMazadKarTime").val();
                kasrKarTime = "0";
            }
            //---------------------------------------------------------

            //$("#" + MasterObj + "txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
            $("#" + MasterObj + "txtSDate").val(ReverceDate($("#TxtStartDate").val()));
            //=$("#" + MasterObj + "txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
            $("#" + MasterObj + "txtEDate").val(ReverceDate($("#TxtEndDate").val()));
            if ($("#" + MasterObj + "txtSDate").val() == "//") {
                alert("  لطفا تاريخ شروع را وارد نماييد ")
                $("#TxtStartDate").focus();
            }
            else if ($("#" + MasterObj + "txtEDate").val() == "//") {
                alert("لطفا تاريخ خاتمه را وارد نماييد")
                $("#TxtEndDate").focus();
            }
            else if ($("#" + MasterObj + "txtSDate").val() > $("#" + MasterObj + "txtEDate").val()) {
                alert(" تاريخ شروع بزرگتر از تاريخ خاتمه است")
                $("#TxtStartDate").focus();
            }
            else if ($("#" + MasterObj + "CmbFromPCode_txtPCode").val() == ""
          && $("#" + MasterObj + "CmbToPCode_txtPCode").val() == ""
          && $("#" + MasterObj + "CmbGroup").val() == "0"
          && $("#" + MasterObj + "CmbDepartment").val() == "0") {
                alert("لطفا پرسنلي را انتخاب نماييد")
            }
            else {
                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "EnterCreditNew.aspx/BindGrid?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SDate:'" + $("#" + MasterObj + "txtSDate").val() + "' ,EDate:'" + $("#" + MasterObj + "txtEDate").val() + "',MainCode:'" + $("#" + MasterObj + "txtMainCode").val() + "' ,FromPersonCode:'" + $("#" + MasterObj + "CmbFromPCode_txtCode").val() + "' ,ToPersonCode:'" + $("#" + MasterObj + "CmbToPCode_txtCode").val() + "' ,GroupID:" + $("#" + MasterObj + "CmbGroup").val() + " ,DepartmentID:" + $("#" + MasterObj + "CmbDepartment").val() + " ,KasraKarTime:'" + kasrKarTime + "' ,MazadKarTime:'" + MazadKarTime + "'  ,CompanyFinatialPeriodID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ", SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ", status:" + $("#" + MasterObj + "cmbState").val() + "}",
                    success: function (Data) {
                        CreateGrid(Data.d);
                        CloseModelPopup();

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                        CloseModelPopup();
                    }
                });
            }
        }
        //===========================================================================================================
        function CreateGrid(Data) {
            ClearGrid();
            if (Data != "{\"GetPersonelDetailCode\" : ]}") {
                var myObjectjson = eval('(' + Data + ')');
                var CreditRelatedType, Type, JPerson;
                $(myObjectjson.GetPersonelDetailCode).each(function () {
                    if ((this.StartTime == "00:00" && this.EndTime == "00:00")
            || (this.StartTime == "" && this.EndTime == "")
            || (this.WfDocID == "2")) {
                        CreditRelatedType = "DivCreditDailyType";
                        Type = "Daily";
                        JPerson = "DivJPersonCode";
                    }
                    else {
                        CreditRelatedType = "DivCreditTimelyType";
                        Type = "Timely";
                        JPerson = "";
                    }
                    
                    AddRow(this.PersonelID, this.PersonCode, this.PersonName, this.RSDate, this.REDate, this.StartTime, this.EndTime, this.value, this.Inout, this.Desc, this.CreditID, this.StatusID, this.Code, this.WfDocID, this.WfNew, this.CodeGroupID, CreditRelatedType, Type, JPerson, this.JPCode, this.JPName, this.Extended);
                });
                //------------------------Show Row Items For Registered Credit--------------------------------------
                OnClickGrd($("#TblMainCredit").find("tr:eq(1)"), 0);
                $("#TblMainCredit").find("tr").each(function () {
                    if ($(this).attr("CreditID") != "0" && $(this).attr("CreditID") != undefined) {
                        OnClickGrd($(this));
                        OnChangeCmbCreditType($(this).find("td:eq(8)").children());
                    }
                });
                //---------------------------------------------------
                BindCmbDefalutCredit();
            }
        }
        //===========================================================================================================
        //انتخاب متن داخل هر آیتم و سطر معادل با فوکوس آن آیتم
        function SetFocusItem(SelecteItem) {
            $(SelecteItem).select();
            if (LastSelectedRow != "")
                $(LastSelectedRow).removeClass("CssSelectedRow");
            LastSelectedRow = $(SelecteItem).parent().parent();
            $(LastSelectedRow).addClass("CssSelectedRow");
        }
        //===========================================================================================================
        function AddRow(PersonelID, PersonCode, PersonName, RSDate, REDate, StartTime, EndTime, value, Inout, Desc, CreditID, StatusID, Code, WfDocID, WfNew, CodeGroupID, CreditRelatedType, Type, JPerson, JPCode, JPName, Extended) {
            $("#TblMainCredit").append("<tr class='CssNewRow'  valign='middle'  AutoRow=1   Type=" + Type + " PersonelID=" + PersonelID + " PersonCode='" + PersonCode + "' CreditID=" + CreditID + " Code=" + Code + " StatusID=" + StatusID + " WfDocID=" + WfDocID + " WfNew=" + WfNew + " CodeGroupID=" + CodeGroupID + " JPCode='" + JPCode + "' JPName='" + JPName + "' Extended='" + Extended + "'  >" +
                "<td class='CssItemSavedStyle' style='width: 30px' align='right'> <img style='cursor:pointer'/></td>" +
                "<td class='CssItemSavedStyle' style='width: 100px;text-align:center' align='right' RealVal=" + RSDate + "  > " + RSDate + " </td>" +
                "<td class='CssItemSavedStyle' style='width: 100px;text-align:center' align='right' > " + REDate + " </td>" +
                "<td class='CssItemSavedStyle' style='width: 80px;text-align:center' align='right'  >" + PersonCode + "</td>" +
                "<td class='CssItemSavedStyle' style='width: 130px' align='right'>" + PersonName + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivSTime' RelatedType='input' style='width: 60px;text-align:center' align='right'> " + StartTime + " </td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivETime' RelatedType='input' style='width: 60px;text-align:center' align='right'> " + EndTime + " </td>" +
                "<td class='CssItemSavedStyle' style='width: 60px;text-align:center' align='right' > " + value + "</td>" +
                "<td class='CssItemSavedStyle' RelatedObj='" + CreditRelatedType + "' RelatedType='select' style='width: 170px' align='right' ></td>" +
                "<td class='CssItemSavedStyle' RelatedObj='" + JPerson + "' RelatedType='input' style='width: 230px' align='right' ></td>" +
                "<td class='CssItemSavedStyle' style='width: 150px;' align='right'  >" + Inout + "</td>" +
                "<td class='CssItemSavedStyle' RelatedObj='DivDescript' RelatedType='input' style='width: 150px;' align='right' title='" + Desc + "' >" + Desc.substr(0, 10) + (Desc.length > 10 ? "..." : "") + "</td>" +
                "<td class='CssItemSavedStyle' style='width: 50px;' align='center'  ></td>" +
                "<td class='CssItemSavedStyle' style='width: 20px' align='right'> <img style='cursor:pointer' src='../../App_Utility/Images/Icons/Blank.gif'/></td>" +
                 "<td class='CssItemSavedStyle' style='width: 20px' align='right'> <img style='cursor:pointer' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");

            SetCreditImgStatus($("#TblMainCredit").find("tr").last(), StatusID);

            $("#TblMainCredit").find("tr").last().click(function () {
                OnClickGrd(this);
            });
            $("#TblMainCredit").find("tr").last().find("td:eq(0)").children(0).click(function () {
                OnClickBtnStatus(this);
            });
            $("#TblMainCredit").find("tr").last().find("td:eq(14)").children(0).click(function () {
                OnClickBtnNewRow(this);
            });
            $("#TblMainCredit tr:last").find("td:eq(13)").children().click(function () {
                var Descript = prompt("آیا برای حذف مجوز مطمئن هستید؟", "");
                if (Descript != null) {
                    DelCredit(this);
                }
            });
        }
        //===========================================================================================================
        function SetCreditImgStatus(Row, StatusID) {
            var ImgStatusURL, ImgStatusTitle;
            switch (StatusID) {
                case "0":
                    ImgStatusURL = "../../App_Utility/Images/Icons/Blank.gif";
                    break;
                case "1":
                    ImgStatusURL = "../../App_Utility/Images/Icons/default_phase_icon.gif";
                    ImgStatusTitle = "در گردش";
                    break;
                case "3":
                    ImgStatusURL = "../../App_Utility/Images/Icons/BlueTick.gif"
                    ImgStatusTitle = "تاييد";
                    break;
                case "4":
                    ImgStatusURL = "../../App_Utility/Images/Icons/Cross.gif"
                    ImgStatusTitle = "عدم تاييد";
                    break;
                case "5":
                    ImgStatusURL = "../../App_Utility/Images/Icons/Cross.gif"
                    ImgStatusTitle = "عدم تاييد";
                    break;
            }
            Row.find("td:eq(0)").children(0).attr("src", ImgStatusURL);
            Row.find("td:eq(0)").children(0).attr("title", ImgStatusTitle);
        }
        //===========================================================================================================
        function OnClickGrd(SelectedRow, SelectItemindex) {
            if ($(SelectedRow).find("td:eq(5)").children().length == 0) {
                var RelatedObj = $(SelectedRow).find("[RelatedObj]");
                RelatedObj.each(function () {
                    if ($(this).find($(this).attr("RelatedType")).length == 0) {

                        $("#" + $(this).attr("RelatedObj")).children("input:text").val($(this).text());

                        if ($(this).attr("RelatedType") == "select") {
                            $("#" + $(this).attr("RelatedObj")).children().val($(SelectedRow).attr("Code"));
                        }
                        $(this).text("");
                        $(this).append($("#" + $(this).attr("RelatedObj")).html());
                        $(this).children().focus(function () {
                            SetFocusItem(this);
                        });
                        $("#" + $(this).attr("RelatedObj")).focus();
                    }
                });
                DateCell = $(SelectedRow).find("td:eq(1)").text().toString().trim()
                Year = DateCell.substring(6, 8);
                Month = DateCell.substring(3, 5);
                Day = DateCell.substring(0, 2);
                GridSDate = Year + "/" + Month + "/" + Day;

                if ((($(SelectedRow).find("td:eq(5)").children(0).val().toString().trim() == "00:00" && $(SelectedRow).find("td:eq(6)").children(0).val().toString().trim() == "00:00")
         || ($(SelectedRow).find("td:eq(5)").children(0).val().toString().trim() == "" && $(SelectedRow).find("td:eq(6)").children(0).val().toString().trim() == ""))
         && GridSDate < $("#" + MasterObj + "txtToday").val()) {
                    $(SelectedRow).find("td:eq(5)").children(0).attr("disabled", true);
                    $(SelectedRow).find("td:eq(6)").children(0).attr("disabled", true);
                    if ($(SelectedRow).attr("JPCode") != "") {
                        $(SelectedRow).find("td:eq(9)").children("input:text").val($(SelectedRow).attr("JPCode"));
                        $(SelectedRow).find("td:eq(9)").children().next().next().text($(SelectedRow).attr("JPName"));
                    }
                    $(SelectedRow).find("td:eq(7)").text("روزانه");
                }
                if ($(SelectedRow).attr("Code") != "0") {
                    $(SelectedRow).find("td:eq(5)").children(0).attr("disabled", true);
                    $(SelectedRow).find("td:eq(6)").children(0).attr("disabled", true);
                    $(SelectedRow).find("td:eq(8)").children(0).attr("disabled", true);
                    $(SelectedRow).find("td:eq(9)").children().attr("disabled", true);
                    $(SelectedRow).find("td:eq(11)").children(0).attr("disabled", true);
                    $(SelectedRow).find("td:eq(13)").children(0).attr("src", "../../App_Utility/Images/Icons/DelIcon.gif");
                }
                if (SelectItemindex == 0)
                    $(SelectedRow).find("td:eq(0)").children("input:text").focus();
            }
        }
        //------------------------حذف مجوز------------------------------------------------------------------------
        function DelCredit(ImgItem) {
            if ($(ImgItem).parent().parent().attr("AutoRow") != "0" == "0"
    && $(ImgItem).parent().parent().attr("CreditID") == "0") {
                $(ImgItem).parent().parent().remove();
            }
            if ($(ImgItem).parent().parent().attr("CreditID") != "0") {
                OpenModelPopup();
                $.ajax({
                    type: "POST",
                    url: "EnterCreditNew.aspx/DeleteCredit?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{CreditID:'" + $(ImgItem).parent().parent().attr("CreditID") + "' , CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + " , SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                    success: function (Data) {
                        if (Data.d != "{\"ShowMessage\" : ]}") {
                            var myObjectjson = eval('(' + Data.d + ')');
                            if (myObjectjson.ShowMessage[0].Validate == 1) {
                                SetMsg(myObjectjson.ShowMessage[0].Message);

                                var CurrRow = $(ImgItem).parent().parent()
                                CurrRow.find("td:eq(1)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(2)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(3)").children().attr("disabled", false);
                                CurrRow.find("td:eq(5)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(6)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(8)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(8)").children(0).val("0");
                                CurrRow.find("td:eq(9)").children().attr("disabled", false);
                                CurrRow.find("td:eq(11)").children(0).attr("disabled", false);
                                CurrRow.find("td:eq(11)").children(0).val("");
                                CurrRow.find("td:eq(13)").children(0).attr("src", '../../App_Utility/Images/Icons/Blank.gif');
                                CurrRow.find("td:eq(0)").children(0).attr("src", '../../App_Utility/Images/Icons/Blank.gif');

                                CurrRow.attr("CreditID", 0);
                                CurrRow.attr("StatusID", 0);
                                CurrRow.attr("WfDocID", "");
                            }
                            else
                                alert(myObjectjson.ShowMessage[0].Message);
                        }
                        BindCmbDefalutCredit();
                        CloseModelPopup();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("حذف با خطا مواجه شد");
                        CloseModelPopup();
                    }
                });
            }
        }
        //===========================================================================================================
        function ClearGrid() {
            $(".CssNewRow").remove();
        }
        //===========================================================================================================
        function OnClickBtnSave() {
            if (CreateXmlSave() && $("#" + MasterObj + "txtSaveXml").val() != "<ReportsEntity></ReportsEntity>") {
                if (checkNotEmpty()) {
                    OpenModelPopup();
                    $.ajax({
                        type: "POST",
                        url: "EnterCreditNew.aspx/ModifyCredit?SubmitMode=Ajax",
                        contentType: "application/json; charset=utf-8",
                        data: "{SaveXML:'" + $("#" + MasterObj + "txtSaveXml").val() + "',CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + " ,SessionID:" + $("#" + MasterObj + "txtSessionID").val() + "}",
                        success: function (Data) {
                            var Validate = 1, Message;
                            if (Data.d != "{\"ModifyCredit\" : ]}") {
                                var myObjectjson = eval('(' + Data.d + ')');
                                $(myObjectjson.ModifyCredit).each(function () {
                                    if (this.ResultID <= 0) {
                                        Validate = 0;
                                        Message = "بعضی از مجوز ها ذخیره نشد";
                                        $("#" + MasterObj + "txtClosePage").val("0");
                                        return;
                                    }
                                    else
                                        $("#" + MasterObj + "txtClosePage").val("1");
                                });
                            }
                            else
                                Validate = 0;

                            if (Validate == 1) {
                                if ($("#" + MasterObj + "txtClosePage").val() == "1") {
                                    $("#" + MasterObj + "txtClosePage").val("0");
                                    window.close();
                                }
                            }
                            else
                                alert(Message);

                            UpdateGrid(myObjectjson);
                            BindCmbDefalutCredit();
                            RefreshParentRow();
                            CloseModelPopup();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
                            CloseModelPopup();
                        }
                    });
                }
            }
        }
        //===========================================================================================================
        function CreateXmlSave() {
            var OGrid = $("#TblMainCredit");
            var SaveXml = "<ReportsEntity>";
            var GridSDate = '', GridEDate = '';
            var Year = '';
            var Month = '';
            var Day = '';
            var flagDo = 0
            var DateCell;
            $("#" + MasterObj + "txtSaveXml").val("");

            if (OGrid)
                var len = OGrid.find("tr").length;
            else
                return false

            for (var RowIndex = 1; RowIndex < len; RowIndex++) {
                if (OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(8)").children(0).length != 0 && OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(8)").children(0).val() != 0
         && OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(8)").children(0).val() != ""
         && OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(8)").children(0).attr("disabled") != true) {
                    flagDo = 1
                    GridSDate = "";
                    GridEDate = "";
                    if (OGrid.find("tr:eq(" + RowIndex + ")").attr("AutoRow") == "1")
                        DateCell = OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(1)").text();
                    else
                        DateCell = OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(1)").children().val();

                    Year = DateCell.substring(6, 10);
                    Month = DateCell.substring(3, 5);
                    Day = DateCell.substring(0, 2);
                    if (DateCell != "")
                        GridSDate = Year + "/" + Month + "/" + Day;


                    if (OGrid.find("tr:eq(" + RowIndex + ")").attr("AutoRow") == "1")
                        DateCell = OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(2)").text();
                    else
                        DateCell = OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(2)").children().val();
                    Year = DateCell.substring(6, 10);
                    Month = DateCell.substring(3, 5);
                    Day = DateCell.substring(0, 2);
                    if (DateCell != "")
                        GridEDate = Year + "/" + Month + "/" + Day;

                    SaveXml += "<ModifyCreditInput>"


                    SaveXml += "<Type>" + OGrid.find("tr:eq(" + RowIndex + ")").attr("CodeGroupID") + "</Type>"
                    SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
                    SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
                    SaveXml += "<CreditType>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(8)").children(0).val() + "</CreditType>"
                    if (OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(5)").children(0).val().toString().trim() == "00:00"
             && OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(6)").children(0).val().toString().trim() == "00:00") {

                        SaveXml += "<StartTime>00:00</StartTime>"
                        SaveXml += "<EndTime>00:00</EndTime>"
                        SaveXml += "<Daily>1</Daily>"
                        SaveXml += "<Des>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(11)").children(0).val() + "</Des>"
                        if (OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(9)").children().val() != "")
                            SaveXml += "<JPersonelID>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(9)").children().val() + "</JPersonelID>";
                        else
                            SaveXml += "<JPersonelID>0</JPersonelID>";
                    }
                    else {

                        SaveXml += "<StartTime>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(5)").children(0).val() + "</StartTime>"
                        SaveXml += "<EndTime>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(6)").children(0).val() + "</EndTime>"
                        SaveXml += "<Daily>2</Daily>"
                        SaveXml += "<Des>" + OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(11)").children(0).val() + "</Des>"
                        SaveXml += "<JPersonelID>0</JPersonelID>";
                    }

                    SaveXml += "<CreditID>0</CreditID>";
                    SaveXml += "<RowIndex>" + (parseInt(RowIndex, 10) - 1) + "</RowIndex>"
                    SaveXml += "<MID>" + OGrid.find("tr:eq(" + RowIndex + ")").attr("PersonelID") + "</MID>"
                    SaveXml += "<MType>U</MType>"
                    //SaveXml += "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
//                    if (((GridSDate != GridEDate && OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(6)").children(0).val() < OGrid.find("tr:eq(" + RowIndex + ")").find("td:eq(5)").children(0).val())))
//                        SaveXml += "<_Flags>1</_Flags>";
                    //SaveXml += "<Extended>" + OGrid.find("tr:eq(" + RowIndex + ")").attr("Extended") + "</Extended>";
                    SaveXml += "<Extended></Extended>";
                    SaveXml += "<SerialNo></SerialNo>";
                    SaveXml += "</ModifyCreditInput>"
                }

            }
            SaveXml += "</ReportsEntity>"
            $("#" + MasterObj + "txtSaveXml").val(SaveXml);
            if (flagDo == 0)//هیچ سطری عوض نشده است
                return false

            if (len > 0)
                return true
            else
                return false
        }
        //===========================================================================================================
        function checkNotEmpty() {
            var Data = $("#" + MasterObj + "txtSaveXml").val(), XmlNodes;
            var TbObj = $("#TblMainCredit");
            if (Data != "") {
                if (window.ActiveXObject) {
                    xml = new ActiveXObject('Microsoft.XMLDOM');
                    xml.async = 'false';
                    xml.loadXML(Data);
                } else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString(Data, 'text/xml');
                }
                var XmlNodes = $(xml).find("ReportsEntity").find("ModifyCreditInput");
                for (var i = 0; i < $(XmlNodes).length; i++) {
                    var RowIndex = parseInt($(XmlNodes[i]).find("RowIndex").text());

                    if ($(XmlNodes[i]).find("StartDate").text() == "" || $(XmlNodes[i]).find("StartDate").text() == "//") {
                        alert("تاريخ شروع را وارد نماييد")
                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                        return false
                    }
                    if ($(XmlNodes[i]).find("EndDate").text() == "" || $(XmlNodes[i]).find("EndDate").text() == "//") {
                        alert("تاريخ خاتمه را وارد نماييد")
                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(2)").children().focus();
                        return false
                    }
                    if ($(XmlNodes[i]).find("StartDate").text() > $(XmlNodes[i]).find("EndDate").text()) {
                        alert("تاريخ شروع بايد کوچکتر از تاريخ خاتمه باشد")
                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                        return false
                    }
                    if ($(XmlNodes[i]).find("StartTime").text() > $(XmlNodes[i]).find("EndTime").text()
             && $(XmlNodes[i]).find("StartDate").text() == $(XmlNodes[i]).find("EndDate").text()) {
                        alert("زمان شروع بايد کوچکتر از زمان خاتمه باشد")
                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(5)").children().focus();
                        return false
                    }
                    else if ($(XmlNodes[i]).find("Extended").text() == ""
            && TbObj.find("tr:eq(" + (RowIndex + 1) + ")").attr("IsRequired") == "1") {
                        alert("فيلدهاي تکميلي را وارد نماييد")
                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(11)").children().focus();
                        return false
                    }
                }
            }
            else {
                alert("هيچ آيتمی جهت ذخيره انتخاب نشده")
                return false
            }
            return true;
        }
        //===========================================================================================================
        $(document).delegate(".CssTimeStyle", "blur", function () {
            //------------------------------------------------------------------------------------------------------------------------------------------------
            var ReverseRealVal = $(this).parent().parent().find("td:eq(1)").attr("RealVal");
            if (ReverseRealVal != undefined) {
                var RealVal = ReverseRealVal.split("/")[2] + "/" + ReverseRealVal.split("/")[1] + "/" + ReverseRealVal.split("/")[0];
                if ($(this).parent().parent().find("td:eq(6)").children(0).val() < $(this).parent().parent().find("td:eq(5)").children(0).val()) {
                    $(this).parent().parent().find("td:eq(1)").text(ReverseRealVal)
                    var NextDate = shdAdd("13" + RealVal, 1);
                    $(this).parent().parent().find("td:eq(2)").text(NextDate.split("/")[2] + "/" + NextDate.split("/")[1] + "/" + NextDate.split("/")[0].substr(2, 2));
                }
                else {
                    $(this).parent().parent().find("td:eq(1)").text(ReverseRealVal)
                    $(this).parent().parent().find("td:eq(2)").text(ReverseRealVal)
                }
            }
        });
        ////------------------------------------------------------------------------------------------------------------------------------------------------
        $(document).delegate(".CssTimeStyle", "keydown", function () {
            OnKeyDownTime(this);
        });
        ////------------------------------------------------------------------------------------------------------------------------------------------------
        $(document).delegate(".CssTimeStyle", "change", function () {
            var CreditType = $(this).parent().parent().find("td:eq(8)").children().val()
            if ($(this).val() == "")
                $(this).val("00:00");
            Timechk(this);
            $(this).parent().parent().find("td:eq(7)").text(GetValue($(this).parent().parent().find("td:eq(5)").find(".CssTimeStyle").val(), $(this).parent().parent().find("td:eq(6)").find(".CssTimeStyle").val()));
            //------------------------------------------------------------------------------------------------------------------------------------------------
            if ($(this).parent().parent().find("td:eq(5)").children().val() == "00:00" &&
        $(this).parent().parent().find("td:eq(6)").children().val() == "00:00") {
                $(this).parent().parent().attr("Type", "Daily");
                $(this).parent().parent().find("td:eq(8)").html($("#" + "DivCreditDailyType").html());
                $(this).parent().parent().find("td:eq(9)").html($("#" + "DivJPersonCode").html());
                $(this).parent().parent().attr("WfDocID", "2");
                $(this).parent().parent().find("td:eq(8)").children().val(CreditType)
            }
            else {
                $(this).parent().parent().attr("Type", "Timely");
                $(this).parent().parent().find("td:eq(8)").html($("#" + "DivCreditTimelyType").html());
                $(this).parent().parent().find("td:eq(9)").html("");
                $(this).parent().parent().attr("JPCode", "");
                $(this).parent().parent().attr("JPName", "");
                $(this).parent().parent().attr("WfDocID", "1");
                $(this).parent().parent().find("td:eq(8)").children().val(CreditType)
            }
            BindCmbDefalutCredit();
        });
        //===========================================================================================================
        $(document).delegate(".CreditType", "change", function () {
            OnChangeCmbCreditType(this);
        });
        function OnChangeCmbCreditType(obj) {
            var Row = $(obj).parent().parent(), CodeID = $(obj).val();
            var Data = $("#" + MasterObj + "txtXMLCmbCredite").val(), XmlNodes;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            XmlNodes = $(xml).find("DataEntryEntity").find("CodePermission").find("CodeID").filter(function () {
                return $(this).text().toString().trim() == CodeID.toString().trim()
            });
            if ($(XmlNodes).length > 0) {
                if ($(XmlNodes).siblings("HaveExtended").text() == "1") {
                    Row.find("td:eq(12)").html($("#DivExtended").html());
                    //-----------------------------------------------------------
                    $.ajax({
                        type: "POST",
                        url: "EnterCreditNew.aspx/GetIsRequierdExtended?SubmitMode=Ajax",
                        contentType: "application/json; charset=utf-8",
                        data: "{CodeID:'" + CodeID.toString().trim() + "'}",
                        success: function (Data) {
                            var Result = Data.d;
                            Row.attr("IsRequired", "0");
//                            if (Result == "1")
//                                Row.attr("IsRequired", "1");
//                            else
//                                Row.attr("IsRequired", "0");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                        }
                    });
                    //-----------------------------------------------------------
                }
                else
                    Row.find("td:eq(12)").html("");
            }
            if (!Row.find("td:eq(8)").children().attr("disabled"))
                Row.attr("Extended", "");
        }
        //===========================================================================================================
        $(document).delegate(".Extended", "click", function () {
            var CreditType = $(this).parent().parent().find("td:eq(8)").children().val();
            var Extended = $(this).parent().parent().attr("Extended");
            var CreditID = $(this).parent().parent().attr("CreditID");
            var url = "EnterCreditExtended.aspx?Extended=" + Extended + "&PageID=" + $("#" + MasterObj + "txtPageID").val()
    + "&CreditType=" + CreditType + "&CreditID=" + CreditID + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val();
            strOptions = "dialogHeight: 240px;dialogWidth: 600px;center: Yes;help: no;status: no;resizable:1";
            returnValue = window.showModalDialog(url, "", strOptions)
            if (returnValue != undefined && returnValue == false)
                alert("لطفا فيلدهاي تکميلي را وارد نماييد");
            else if (returnValue != undefined)
                $(this).parent().parent().attr("Extended", returnValue);
        });
        //===========================================================================================================
        function GetValue(STime, ETime) {
            if (STime != "" && ETime != "") { //مقدار عددي از ساعت

                var ValueStime = Math.abs(STime.substring(0, 2)) * 60
                ValueStime = Math.abs(ValueStime) + Math.abs(STime.substring(3, 5))//مقدار عددي تا ساعت

                var ValueEtime = Math.abs(ETime.substring(0, 2)) * 60
                ValueEtime = Math.abs(ValueEtime) + Math.abs(ETime.substring(3, 5))
                if (ValueStime > ValueEtime)
                    ValueEtime = ValueEtime + 1440;
                var Ret = ValueEtime - ValueStime
                if (Ret >= 60) {
                    var s = Ret - Math.floor(Ret / 60) * 60;
                    if (s.toString().length == 1)
                        s = "0" + s
                    Ret = s + " : " + Math.floor(Ret / 60)
                }
                else {
                    if (Ret.toString().length == 1)
                        Ret = "0" + Ret
                    Ret = "00:" + Ret
                }
                if (STime.trim() == "00:00" && ETime.trim() == "00:00")
                    Ret = "روزانه"
                return Ret;
            }
            else
                return "";
        }
        //========================================================
        $(document).delegate(".CodeType", "change", function () {
            $("#" + MasterObj + "txtMainCode").val($("#" + MasterObj + "CmbCodeType").val());
            //$("#" + MasterObj + "txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
            $("#" + MasterObj + "txtSDate").val(ReverceDate($("#TxtStartDate").val()));
            //$("#" + MasterObj + "txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
            $("#" + MasterObj + "txtEDate").val(ReverceDate($("#TxtEndDate").val()));
            $("#CmbCreditTimelyType2").html("");
            $("#CmbCreditDailyType2").html("");
            $("#CmbCreditType2").html("");

            //-----------تعیین نمایش ساعت ورود و خروج
            if ($("#" + MasterObj + "CmbCodeType option:selected").index() == "0") {
                $(".MazadKar").css("display", "none")
                $(".MazadKarTime").css("display", "none")
                $(".KasraKar").css("display", "inline")
                $(".KasraKarTime").css("display", "inline")
                $("#" + MasterObj + "txtKasrKarTime").val("00:00");
            }
            else {
                $(".MazadKar").css("display", "inline")
                $(".MazadKarTime").css("display", "inline")
                $(".KasraKar").css("display", "none")
                $(".KasraKarTime").css("display", "none")
                $("#" + MasterObj + "txtMazadKarTime").val("00:00");
            }
            //------------------------------------------
            Mode = 1;
            OpenModelPopup();
            $.ajax({
                type: "POST",
                url: "EnterCreditNew.aspx/GetCreditType?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{PersonCode:'" + $("#" + MasterObj + "txtOnLineUser").val() + "' , SDate:'" + $("#" + MasterObj + "txtSDate").val() + "' , EDate:'" + $("#" + MasterObj + "txtEDate").val() + "' , MainCode:'" + $("#" + MasterObj + "CmbCodeType").val() + "' , OnlineUser:'" + $("#" + MasterObj + "txtOnLineUser").val() + "' }",
                success: function (Data) {
                    if (Data.d != "{\"CodePermission\" : ]}") {
                        var Result = Data.d;
                        var CodePermission = Result.split("#")[0]
                        $("#" + MasterObj + "txtXMLCmbCredite").val(Result.split("#")[1]);
                        $("#" + MasterObj + "txtXMLCmbCredite").val(ReplaceAll($("#" + MasterObj + "txtXMLCmbCredite").val(), 'NewDataSet', 'DataEntryEntity'))
                        var myObjectjson = eval('(' + CodePermission + ')');

                        $("#CmbCreditTimelyType2").append("<option value='0' >" + "انتخاب نشده" + "</option>");
                        $("#CmbCreditDailyType2").append("<option value='0' >" + "انتخاب نشده" + "</option>");
                        $("#CmbCreditType2").append("<option value='0' >" + "انتخاب نشده" + "</option>");

                        $(myObjectjson.CodePermission).each(function () {
                            if (this.Timely == 1) {
                                $("#CmbCreditTimelyType2").append("<option value='" + this.CodeID + "'>" + this.CodeName + "</option>");
                                $("#CmbCreditType2").append("<option value='" + this.CodeID + "'>" + this.CodeName + "</option>");
                            }
                            if (this.Daily == 1) {
                                $("#CmbCreditDailyType2").append("<option value='" + this.CodeID + "'>" + this.CodeName + "</option>");
                                $("#CmbCreditType2").append("<option value='" + this.CodeID + "'>" + this.CodeName + "</option>");
                            }
                        });
                    }
                    $("#DivCreditTimelyType").html("<select class='TxtControls CssInsertNewItem CreditType' style='width: 170px'>" + $("#CmbCreditTimelyType2").html() + "</select>");
                    $("#DivCreditDailyType").html("<select class='TxtControls CssInsertNewItem CreditType' style='width: 170px'>" + $("#CmbCreditDailyType2").html() + "</select>");

                    CloseModelPopup();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("جستجو با خطا مواجه شد");
                    CloseModelPopup();
                }
            });
        })
        //==========================================================
        function OnClickBtnCardexInfo() {
            var url = "../Cardex/CardexReport.aspx?ToPersonId=" + $("#" + MasterObj + "txtOnLineUser").val()
               + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
              + "&PersonCode=" + $("#" + MasterObj + "CmbFromPCode_txtCode").val()
               + "&WPID=" + $("#" + MasterObj + "txtWPID").val()
            var winPro = "dialogHeight: 760px;dialogWidth: 950px;center: Yes;help: no;status: no";
            var CardexInfoDialogObj = window.showModalDialog(encodeURI(url), window, winPro)
        }
        //==========================================================
        function OnClickbtnCopy() {
            var OGrid = $("#TblMainCredit"), OldVal;
            if (OGrid != null)
                for (var i = 1; i < OGrid.find("tr").length; i++) {
                    if (!OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0).attr("disabled")
            && OGrid.find("tr:eq(" + i + ")").find("td:eq(5)").children(0).val() != ""
            && OGrid.find("tr:eq(" + i + ")").find("td:eq(6)").children(0).val() != "") {
                        OnClickGrd(OGrid.find("tr:eq(" + i + ")"));
                        OldVal = OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0).val();
                        OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0).val($("#" + MasterObj + "cmbDfaultCredit").val());
                        if (OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0).val() != $("#" + MasterObj + "cmbDfaultCredit").val())
                            OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0).val(OldVal);
                        else
                            OGrid.find("tr:eq(" + i + ")").find("td:eq(11)").children(0).val($("#" + MasterObj + "txtDefaultDesc").val());
                        OnChangeCmbCreditType(OGrid.find("tr:eq(" + i + ")").find("td:eq(8)").children(0));
                    }
                }
        }
        //==========================================================
        function OnClickBtnStatus(obj) {
            if ($(obj).parent().parent().attr("StatusID") != "0") {
                var WfNew = $(obj).parent().parent().attr("WfNew");
                var WfDocID = $(obj).parent().parent().attr("WfDocID");
                var DocID = $(obj).parent().parent().attr("CreditID");
                if (WfNew == 1) {
                    window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WfDocID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
                }
                else
                    window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WfDocID + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
            }
        }
        //=========================================================
        function window.onbeforeunload() {
            if ($("#TblMainCredit").find("tr").length > 0)
                if ($("#TblMainCredit").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != true }).length > 0)
                    return "آيا مايل به بستن فرم هستيد؟";
        }
        /******************************************************/
        function UpdateGrid(myObjectjson) {
            var OGrd = $("#TblMainCredit");
            OGrd.find("tr").each(function () {
                if ($(this).index() != 0) {

                    if ($(this).attr("AutoRow") == "1")
                        $(this).find("td:eq(1)").html("<div valign=top>" + $(this).find("td:eq(1)").text() + "</div>");
                    else {
                        if (!$(this).find("td:eq(1)").children(0).attr("disabled"))
                            $(this).find("td:eq(1)").html("<div valign=top><input id='txtSDateNew'  type='text' class='TxtControls CssInsertNewItem CssDateStyle' style='width: 80px; font-weight: bold;' value='" + $(this).find("td:eq(1)").children(0).val() + "'/></div>");
                    }
                }
            });
            //--------------------------------------------------------------------------------------------------------------------
            $(myObjectjson.ModifyCredit).each(function () {
                var SDateCell = $("#TblMainCredit").find("tr:eq(" + parseInt(parseInt(this.RowIndex) + 1) + ")").find("td:eq(1)");
                if (this.ResultID <= 0) {
                    SDateCell.html("<div valign=top align=right ><img style='width:15px' title='" + this.StrResult + "' src='/TAPresentation/App_Utility/Images/Icons/Error.ico'/>" + SDateCell.html() + "</div>");
                }
                else {
                    SDateCell.html(SDateCell.html());
                    CurrRow = $("#TblMainCredit").find("tr:eq(" + parseInt(parseInt(this.RowIndex) + 1) + ")");
                    if ($("#" + MasterObj + "cmbState").val() == 16302)
                        CurrRow.remove();
                    else {
                        CurrRow.find("td:eq(1)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(2)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(3)").children().attr("disabled", true);
                        CurrRow.find("td:eq(5)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(6)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(8)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(9)").children().attr("disabled", true);
                        CurrRow.find("td:eq(11)").children(0).attr("disabled", true);
                        CurrRow.find("td:eq(13)").children(0).attr("src", '../../App_Utility/Images/Icons/DelIcon.gif');

                        CurrRow.attr("CreditID", this.CreditID);
                        CurrRow.attr("StatusID", this.Statusid.substr(2, 1));
                        if (CurrRow.find("td:eq(5)").children().val().trim() == "00:00" && CurrRow.find("td:eq(5)").children().val().trim() == "00:00")
                            CurrRow.attr("WfDocID", "2");
                        SetCreditImgStatus(CurrRow, CurrRow.attr("StatusID"));
                    }
                }
            });
        }
        /******************************************************/
        //دکمه های انتخاب پرسنل در ستون پرسنلی
        $(document).delegate(".CssButtonPersonCode", "click", function () {
            if (!$(this).parent().children().attr("disabled")) {
                var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=1&SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&OnLineUser=" + $("#" + MasterObj + "txtOnlineUser").val() + "&MenuItemID=999999" + "&OutputFormat=Json";
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
                var SelectedMember = window.showModalDialog(url, "", strOptions)
                if (SelectedMember != undefined) {
                    if (SelectedMember != "{\"Tb\" : ]}") {
                        var myObjectjson = eval('(' + SelectedMember + ')');
                        $(this).parent().children("input:text").val(myObjectjson.Tb[0].PCode);
                        $(this).parent().children("input:text").keydown();

                        if ($(this).context.id == "BtnSelectJPerson") {
                            $(this).parent().children().next().next().text(myObjectjson.Tb[0].PName);
                            $(this).parent().parent().attr("JPName", myObjectjson.Tb[0].PName);
                            $(this).parent().parent().attr("JPCode", myObjectjson.Tb[0].PCode);
                        }
                        else {
                            $(this).parent().next().text(myObjectjson.Tb[0].PName);
                            $(this).parent().parent().attr("PersonCode", myObjectjson.Tb[0].PCode);
                            $(this).parent().parent().attr("PersonelID", myObjectjson.Tb[0].PID);
                        }

                    }
                }
            }
        });
        /******************************************************/
        //تغییر کنترلهای پرسنلی
        $(document).delegate(".CssPersonCode", "change", function () {
            if ($(this).parent().index() == 3) {
                if ($(this).val() != "") {
                    FindPerson(this);
                }
                else {
                    $(this).parent().parent().find("td:eq(3)").children().val("");
                    $(this).parent().parent().attr("PersonCode", "");
                }
            }
            else {
                if ($(this).val() != "") {
                    FindJPerson(this);
                }
                else {
                    $(this).parent().parent().find("td:eq(9)").children().val("");
                    $(this).parent().parent().attr("JPName", "");
                    $(this).parent().parent().attr("JPCode", "");
                }
            }

        });
        /******************************************************/
        //لود نام پرسنلی وقتی کد را تغییر می دهیم
        function FindPerson(PersonCodeObj) {
            $.ajax({
                type: "POST",
                url: "EnterCreditNew.aspx/GetPesonName?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{PersonCode:'" + $(PersonCodeObj).val() + "' ,OnlineUserID:" + $("#" + MasterObj + "txtOnLineUser").val() + " ,MenuItemID:1306 ,CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " }",
                success: function (Data) {
                    var Result = Data.d;
                    var PersonCodePart = Result.split("$$")[0];
                    $(PersonCodeObj).parent().parent().find("td:eq(4)").text(PersonCodePart);

                    if (PersonCodePart != "") {
                        var OtherPart = Result.split("$$")[1];
                        $(PersonCodeObj).parent().parent().attr("PersonCode", $(PersonCodeObj).val());
                    }
                    else {
                        $(PersonCodeObj).parent().parent().attr("PersonCode", "")
                        $(PersonCodeObj).val("");
                        $(this).parent().next().val("");
                        alert("کد پرسنلی نا معتبر است");
                        $(PersonCodeObj).focus();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                }
            });
        }
        /******************************************************/
        //لود نام پرسنلی وقتی کد را تغییر می دهیم
        function FindJPerson(PersonCodeObj) {
            $.ajax({
                type: "POST",
                url: "EnterCreditNew.aspx/GetPesonName?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{PersonCode:'" + $(PersonCodeObj).val() + "' ,OnlineUserID:" + $("#" + MasterObj + "txtOnLineUser").val() + ",MenuItemID:999999 ,CompanyID:" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " }",
                success: function (Data) {

                    var Result = Data.d;
                    var PersonCodePart = Result.split("$$")[0];
                    $(PersonCodeObj).parent().parent().find("td:eq(9)").children().next().next().text(PersonCodePart);

                    if (PersonCodePart != "") {
                        var OtherPart = Result.split("$$")[1];
                        $(PersonCodeObj).parent().parent().attr("JPCode", $(PersonCodeObj).val());
                    }
                    else {
                        $(PersonCodeObj).parent().parent().attr("JPCode", "")
                        $(PersonCodeObj).val("");
                        alert("کد پرسنلی نا معتبر است");
                        $(PersonCodeObj).focus();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                }
            });
        }
        /******************************************************/
        //کنترلهای تاریخ
        $(document).delegate(".CssDateStyle", "change", function () {
            $(this).val(CorrectDate(this, $("#TxtStartDate").val().split('/')[2],$("#TxtStartDate").val().split('/')[1], $("#TxtStartDate").val().split('/')[0]));

            if ($(this).parent().parent().find("td:eq(2)").children().val() == "")
                $(this).parent().parent().find("td:eq(2)").children().val($(this).val());

        });
        /******************************************************/
        function OnClickBtnNewRow(obj) {
            var PrevRow = $(obj).parent().parent();
            var RowIndex = $(obj).parent().parent().index();
            $("#TblMainCredit").find("tr:eq(" + RowIndex + ")").after("<tr class='CssNewRow'  valign='middle' Extended='' AutoRow=0  Type=" + PrevRow.attr("Type") + " PersonelID=" + PrevRow.attr("PersonelID") + " PersonCode=" + PrevRow.attr("PersonCode") + " CreditID=0" + " Code='0'" + +" StatusID=0" + " WfDocID=" + PrevRow.attr("WfDocID") + " WfNew=" + PrevRow.attr("WfNew") + " CodeGroupID=" + PrevRow.attr("CodeGroupID") + " JPCode='' " + "' JPName='' >" +
                "<td  style='width: 30px' align='right'> <img style='cursor:pointer'  src='../../App_Utility/Images/Icons/Blank.gif'/></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input id='txtSDateNew' type='text' class='TxtControls CssInsertNewItem CssDateStyle' style='width:70px; font-weight: bold;' /></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input id='txtEDateNew' type='text' class='TxtControls CssInsertNewItem CssDateStyle' style='width:70px; font-weight: bold;' /></td>" +
                "<td  style='width: 80px;text-align:center' align='right'><input id='txtPersonCodeNew' type='text' class='TxtControls CssInsertNewItem CssPersonCode' style='width: 65px; font-weight: bold;' value='" + PrevRow.attr("PersonCode") + "' /><input class='CssHeaderStyle CssButtonPersonCode' id='BtnSelectPerson' type='button' value='...' style='height: 20px; width: 15px' /></td>" +
                "<td  style='width: 130px' align='right'>" + PrevRow.find("td:eq(4)").text() + "</td>" +
                "<td  style='width: 60px;text-align:center' align='right'><input id='txtSTimeNew' type='text' class='TxtControls CssInsertNewItem CssTimeStyle' style='width: 50px; font-weight: bold;'/></td>" +
                "<td  style='width: 60px;text-align:center' align='right'><input id='txtETimeNew' type='text' class='TxtControls CssInsertNewItem CssTimeStyle CssETime' style='width: 50px; font-weight: bold;' /></td>" +
                "<td  style='width: 60px;text-align:center' align='right' ></td>" +
                "<td  style='width: 170px' align='right' ></td>" +
                "<td  style='width: 230px' align='right' ></td>" +
                "<td  style='width: 100px;' align='right'  ></td>" +
                "<td  style='width: 100px;' align='right' title='' ><input id='txtDescriptNew' type='text' class='TxtControls CssInsertNewItem' style='width: 150px;font-weight: bold;' /></td>" +
                "<td  style='width: 50px;' align='center'  ></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' src='../../App_Utility/Images/Icons/DelIcon.gif' title='حذف'/></td>" +
                 "<td style='width: 20px' align='right'> <img style='cursor:pointer' src='../../App_Utility/Images/Icons/NewIcon.gif' title='ايجاد'/></td></tr>");
            var TbInserted = $("#TblMainCredit").find("tr:eq(" + (RowIndex + 1) + ")")
            TbInserted.find("td").each(function () {
                $(this).children().focus(function () {
                    SetFocusItem(this);
                });
            });
            TbInserted.find("td:eq(0)").children(0).click(function () {
                OnClickBtnStatus(this);
            });
            TbInserted.find("td:eq(14)").children(0).click(function () {
                OnClickBtnNewRow(this);
            });
            TbInserted.find("td:eq(13)").children().click(function () {
                var Descript = prompt("آیا برای حذف مجوز مطمئن هستید؟", "");
                if (Descript != null) {
                    DelCredit(this);
                }
            });
        }
        /******************************************************/
        $(document).delegate(".CssSTimeStyle", "keydown", function () {
            WindowEvent = window.event.keyCode
            DateCell = $(this).parent().parent().find("td:eq(1)").text()
            Year = DateCell.substring(6, 8);
            Month = DateCell.substring(3, 5);
            Day = DateCell.substring(0, 2);
            GridSDate = Year + "/" + Month + "/" + Day;

            if (WindowEvent == 13 && GridSDate >= $("#" + MasterObj + "txtToday").val()) {
                var url = "EnterCreditDefault.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val();
                strOptions = "dialogHeight: 240px;dialogWidth:300px;center: Yes;help: no;status: no;resizable:1";
                returnValue = window.showModalDialog(url, "", strOptions)
                if (returnValue != "" && returnValue != undefined) {
                    $(this).parent().parent().find("td:eq(5)").children().val(returnValue.split('-')[0])
                    $(this).parent().parent().find("td:eq(6)").children().val(returnValue.split('-')[1])
                    $(this).parent().parent().find("td:eq(6)").children().focus();
                }
            }
        });
        /******************************************************/
        function shdAdd(Sdate, days) {
            if (!Isvaliddate(Sdate))
                return false
            days = parseInt(days)
            if (days != 0)
                return (InttoSHD1(this.SHDtoInt1(Sdate) + days))
            else
                return Sdate
        }
        /******************************************************/
        function Isvaliddate(txt) {
            var le, t1, t2, sal, mah, roz
            var arr1, arr2, arr3
            var x = 0
            while (x < getCntChar('/', txt + "/")) {
                arr1 = getArray(txt + "/", x, '/')
                ++x
                arr2 = getArray(txt + "/", x, '/')
                ++x
                arr3 = getArray(txt + "/", x, '/')
                ++x
            }
            if (getCntChar('/', txt) == 2) {
                roz = arr3
                mah = arr2
                sal = arr1

                le = 0
                if (sal < 100)
                    sal = sal + 1300


                if (isshleap(sal))
                    le = 1
                t1 = ((mah >= 1) && (mah <= 12))
                t2 = ((roz >= 1) && (roz <= 29 + le))
                t2 = (t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11))))
                t2 = (t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6))))

                return (t1 && t2)
            }
            else {
                return false
            }
        }
        /******************************************************/
        function InttoSHD1(roz) {
            var leap, Esal, sal, mahbase, tag

            sal = 0
            mah = 0
            leap = 0
            tag = 0
            Esal = 0

            do {
                roz = roz + 36159
                sal = sal - 99
            } while (roz < 00000)

            do {
                roz = roz - 36159
                sal = sal + 99
            } while (roz > 36158)
            if ((roz != 10591) && (roz != 22644) && (roz != 36158)) {
                if ((roz >= 00000) && (roz <= 10225)) {
                    tag = 1
                    Esal = 0
                    mahbase = 00000
                }
                if ((roz >= 10226) && (roz <= 10590)) {
                    tag = 2
                    Esal = 1
                    mahbase = 10226
                }
                if ((roz >= 10592) && (roz <= 22278)) {
                    tag = 3
                    Esal = 1
                    mahbase = 10592
                }
                if ((roz >= 22279) && (roz <= 22643)) {
                    tag = 4
                    Esal = 2
                    mahbase = 22279
                }
                if ((roz >= 22645) && (roz <= 35792)) {
                    tag = 5
                    Esal = 2
                    mahbase = 22645
                }
                if ((roz >= 35793) && (roz <= 36157)) {
                    tag = 6
                    Esal = 3
                    mahbase = 35793
                }
            }
            else if (roz == 10591) //1342/12/30
            {
                roz = 365
                sal = sal + 1342
            }
            else if (roz == 22644) //1375/12/30
            {
                roz = 365
                sal = sal + 1375
            }
            else if (roz == 36158) //1412/12/30
            {
                roz = 365
                sal = sal + 1412
            }
            if (((tag % 2) == 1) && (((roz - mahbase + 1) % 1461) == 0)) {
                roz = roz - 1
                leap = 1
            }

            if (tag > 0) {
                roz = roz - Esal * 365
                roz = roz - parseInt(roz / 1461)
                sal = Esal + sal + parseInt(roz / 365) + 1314
                roz = roz % 365 + leap
            }

            if (roz >= 186) {
                roz = roz - 186
                mah = 6 + parseInt(roz / 30)
                roz = roz % 30
            }
            else {
                mah = parseInt(roz / 31)
                roz = roz % 31
            }
            return datechk(sal + "/" + (mah + 1) + "/" + (roz + 1))
        }
        /******************************************************/
        function datechk(val) {
            if ((val != "") && !Isvaliddate(val)) {
                alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
                return false
            }
            else
                if (val != "") {
                    var arr1, arr2, arr3
                    var x = 0
                    while (x < getCntChar('/', val + "/")) {
                        arr1 = getArray(val + "/", x, '/')
                        ++x
                        arr2 = getArray(val + "/", x, '/')
                        ++x
                        arr3 = getArray(val + "/", x, '/')
                        ++x
                    }
                    arr1 = arr1
                    arr2 = arr2
                    arr3 = arr3

                    if (arr1 < 100)
                        century = "13"
                    else
                        century = ""

                    if (arr2 < 10)
                        val = century + "" + arr1 + "/0" + arr2
                    else
                        val = century + "" + arr1 + "/" + arr2

                    if (arr3 < 10)
                        val += "/0" + arr3
                    else
                        val += "/" + arr3
                    return val
                }
        }
        /******************************************************/
        function SHDtoInt1(shd) {

            var sal, mah, roz, Tr
            var arr1, arr2, arr3


            var x = 0
            while (x < getCntChar('/', shd + "/")) {

                arr1 = getArray(shd + "/", x, '/')
                ++x
                arr2 = getArray(shd + "/", x, '/')
                ++x
                arr3 = getArray(shd + "/", x, '/')
                ++x
            }

            if (getCntChar('/', shd) == 2) {
                roz = arr3 - 1
                mah = arr2 - 1
                sal = arr1
                Tr = 0

                if (sal < 100)
                    sal = 1300 + sal

                sal = sal - 1314

                while (sal < 0) {
                    Tr = Tr - 36159 - 366
                    sal = sal + 100
                }

                while (sal > 98) {
                    Tr = Tr + 36159
                    sal = sal - 99
                }

                if ((sal >= 0) && (sal <= 27))
                    Tr = Tr + sal * 365 + parseInt(sal / 4)

                if ((sal >= 28) && (sal <= 60))
                    Tr = Tr + sal * 365 + parseInt((sal - 1) / 4)

                if ((sal >= 61) && (sal <= 97))
                    Tr = Tr + sal * 365 + parseInt((sal - 2) / 4)

                if (sal == 98)
                    Tr = Tr + sal * 365 + parseInt((sal - 3) / 4)


                if (mah > 6)
                    Tr = Tr + (mah - 6) * 30 + 186
                else
                    Tr = Tr + mah * 31

                return (Tr + roz)

            }
            else {
                alert("اشكال در تاريخ شمسي")
                return 0
            }

        }
        /******************************************************/
        function isshleap(sal) {
            var ybase_sh, L1

            if (sal < 100)
                sal = sal + 1300


            ybase_sh = parseInt((sal - 125) / 99) * 99 + 125


            L1 = ((sal - ybase_sh) % 99)
            if (L1 >= 98)
                return (((L1 - 89) % 4) == 0)
            else {
                if (L1 >= 61)
                    return (((L1 - 62) % 4) == 0)
                else
                    if (L1 >= 28)
                        return (((L1 - 29) % 4) == 0)
                    else
                        return ((L1 % 4) == 0)
                }
            }
            /******************************************************/
            function CorrectDate(obj, Year, Month, Day) {
                var sal;
                var Date = "";
                var s = $(obj).val().split('/');
                if ($(obj).val() != "") {
                    if (s.length > 3) {
                        $(obj).val() = "";
                        return Date;
                    }
                    if (s[2] != null) {
                        sal = s[2].split('  ');
                    }
                    if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
                        obj.value = ""
                        return Date;
                    }
                    if (s.length == 3) {
                        if (s[1].length == 1 && s[1] != "0")
                            Date = Date + "0" + s[1] + "/"
                        if (s[1].length == 1 && s[1] == "0")
                            Date = Date + "01" + "/"
                        if (s[1].length == 2 && s[1] != "00")
                            Date = Date + s[1] + "/"
                        if (s[1].length == 2 && s[1] == "00")
                            Date = Date + "01" + "/"
                        if (s[1].length == 0)
                            Date = Date + Month + "/"
                        if (s[0].length == 1 && s[0] != "0")
                            Date = Date + "0" + s[0]
                        if (s[0].length == 1 && s[0] == "0")
                            Date = Date + "01"
                        if (s[0].length == 2 && s[0] != "00")
                            Date = Date + s[0]
                        if (s[0].length == 2 && s[0] == "00")
                            Date = Date + "01";
                        if (s[0].length == 0)
                            Date = Date + Day
                        if (s[2] == null)
                            Date = Year + "/" + Date
                        if (s[2] != null) {
                            var sal;
                            sal = s[2].split('  ');
                            if (sal[0].length == 0)
                                Date = Year + "/" + Date
                            if (sal[0].length == 1)
                                Date = Year.substr(0, 3) + sal[0] + "/" + Date
                            if (sal[0].length == 2)
                                Date = Year.substr(0, 2) + sal[0] + "/" + Date
                            if (sal[0].length == 3)
                                Date = Year.substr(0, 1) + sal[0] + "/" + Date
                            if (sal[0].length == 4 && sal[0] != "0000")
                                Date = sal[0] + "/" + Date
                            if (sal[0].length == 4 && sal[0] == "0000")
                                Date = Year + "/" + Date
                        }
                    }

                    if (s.length == 2) {
                        if (s[1].length == 1 && s[1] != "0")
                            Date = Date + "0" + s[1] + "/"
                        if (s[1].length == 1 && s[1] == "0")
                            Date = Date + "01" + "/"
                        if (s[1].length == 2 && s[1] != "00")
                            Date = Date + s[1] + "/"
                        if (s[1].length == 2 && s[1] == "00")
                            Date = Date + "01" + "/"
                        if (s[1].length == 0)
                            Date = Date + Month + "/"
                        if (s[0].length == 1 && s[0] != "0")
                            Date = Date + "0" + s[0]
                        if (s[0].length == 1 && s[0] == "0")
                            Date = Date + "01"
                        if (s[0].length == 2 && s[0] != "00")
                            Date = Date + s[0]
                        if (s[0].length == 2 && s[0] == "00")
                            Date = Date + "01";
                        if (s[0].length == 0)
                            Date = Date + Day
                        Date = Year + "/" + Date
                    }

                    if (s.length == 1) {
                        if (s[0].length == 1 && s[0] != "0")
                            Date = Year + "/" + Month + "/" + Date + "0" + s[0]
                        if (s[0].length == 1 && s[0] == "0")
                            Date = Year + "/" + Month + "/" + Date + "01"
                        if (s[0].length == 2 && s[0] != "00")
                            Date = Year + "/" + Month + "/" + Date + s[0]
                        if (s[0].length == 2 && s[0] == "00")
                            Date = Year + "/" + Month + "/" + Date + "01"
                    }

                    Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(2, 2)
                    return Date;
                }
            }
            //----------------
            function OnFocuseTxtTime(obj) {
                obj.select();
            }
    </script>
    <link type="text/css" href="../../App_Utility/PersianCalendar/styles/DatePicker.css" rel="stylesheet" /> 
    <script language="javascript" type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/PDate.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/calendar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-ar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-fa.js"></script>
    <%--<script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/DataEntry/EnterCreditNew.js?v=1.1"></script>--%>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
