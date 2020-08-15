﻿<%@ Page Title="------------------------------------------------------------------------------ثبت عملکرد ماموريت--------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="RegisterDutyCredit.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.RegisterDutyCredit" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <Style>
        .DivStyle1
        {
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            float: center; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            height :280px;
            width:700px;
        }
    </Style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <table align="center" class="DivStyle" cellpadding="0" cellspacing="0"   style="width:100%; height:100%"  >
        <tr>
            <!------------------------------------ToolBar----------------------------------------->
            <td align="center" colspan="2">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" style="width: 75%; height: 100%">
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">
                        کليات عملکرد</legend>
                    <table id="tdGeneralDuty">
                        <tr>
                            <!------------------------------------نمایش شماره حکم ماموريت----------------------------------------->
                            <td style="color: Green; font-size: 12; font-weight: bold; text-align: right">
                                شماره حکم :
                            </td>
                            <td>
                                <input type="text" runat="server" disabled="true" id="txtSerialNo" class="TxtControls"
                                    width="80px" />
                            </td>
                            <!-----------------------------------آيتم های ثابت فرم----------------------------------------->
                        </tr>
                        <tr>
                            <td>
                                پرسنلی :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
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
                                تاريخ شروع :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                ساعت شروع:
                            </td>
                            <td>
                                <input id="txtSTime" type="text" onfocus="onfocusItem(this)" class="TxtControls"
                                    style="width: 100px" runat="server" onblur="Timechk(this)" value="00:00" onkeydown="OnKeyDownTime(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تاريخ خاتمه :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td>
                                ساعت خاتمه :
                            </td>
                            <td>
                                <input id="txtETime" type="text" onfocus="onfocusItem(this)" class="TxtControls"
                                    style="width: 100px" runat="server" onblur="Timechk(this)" value="00:00" onkeydown="OnKeyDownTime(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                وسيله ي رفت :
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="CmbWentingBy" Style="width: 120px" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                شهر مبدا :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbEraCity" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                وسيله ی برگشت :
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="CmbBackBy" Style="width: 120px" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                شهر مقصد :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbDistinationCity" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                نوع اقامت :
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="CmbPlacementType" Style="width: 120px" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                گزارش انجام ماموريت :
                            </td>
                            <td colspan="3">
                                <div align="right">
                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                                        Height="70px" Width="510px"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <!--------------------------------------------قسمت تکمیلی ------------------------------------->
                        <tr id="Tr1" runat="server">
                            <td id="ExtendedTR" colspan="4" align="center">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <fieldset class="fieldsetStyle">
                                            <legend class="legendStyle">اطلاعات تکميلي</legend>
                                            <table>
                                                <tr>
                                                    <td id="DivExtended">
                                                        <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                                        <asp:HiddenField ID="txtFirstTagName" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="width: 100%; text-align: right; height: 100%">
                                            </div>
                                        </fieldset>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <!----------------------------------گريد نتايج محاسبه----------------------------------------------------------->
            <td rowspan="2" valign="top" align="center" style="width: 25%; height: 100%"  >
                <fieldset dir="rtl" class="fieldsetStyle" style="height:470px" >
                    <legend class="legendStyle">نتايج محاسبه </legend>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtCurPage2" runat="server" />
                            <asp:HiddenField ID="Totalpage2" runat="server" />
                            <asp:HiddenField ID="txtSortExpression2" runat="server" />
                            <asp:HiddenField ID="txtSortDirection2" runat="server" />
                            <div id="DivResult" style="height: 320px">
                                <cc2:KasraGrid ID="GrdDutyResult" runat="server" OnRowDataBound="GridDutyResult_RowDataBound">
                                </cc2:KasraGrid>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
        <!----------------------------------گرید جزییات عملکرد----------------------------------------------------------->
        <tr id="TrDutyDetail">
            <td  style="width:100%; height:100%" >
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">جزييات
                        عملکرد </legend>
                  
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtSortExpression" runat="server" />
                            <asp:HiddenField ID="txtSortDirection" runat="server" />
                            <asp:HiddenField ID="txtRegDuty" runat="server" />
                            <div id="GridViewCountainer" class="DivStyle1">
                                <cc2:KasraGrid ID="GrdDutyDetail" runat="server" OnRowDataBound="Grid_RowDataBound">
                                </cc2:KasraGrid>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
    
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUserID" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtXml" name="txtXml" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtExSaveXml" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtExtended" name="txtExtended" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
        <input type="text" id="txtXmlDetail" name="txtXmlDetail" runat="server" />
        <input type="text" id="txtGridFirstTagName" name="txtGridFirstTagName" runat="server" />
        <input type="text" id="txtDutyGeneralID" name="txtDutyGeneralID" runat="server" />
        <input type="text" id="txtDutyDetailOption" name="txtDutyDetailOption" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtStatusID" name="txtStatusID" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" /> 
        <input type="text" id="txtCreditTimeValidation" name="txtCreditTimeValidation" runat="server" /> 
        <input type="text" id="txtTimeActive" runat="server" />
        <a id="LinkDown" href="..\..\App_Utility\Images\Icons\Down3.gif"></a><a id="LinkUp"
            href="..\..\App_Utility\Images\Icons\Up3.gif"></a>
    </div>
     <script src="../../App_Utility/Scripts/Extended.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        //  document.getElementsByTagName("body")[0].scroll = "no";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var IsChanged = false;
        var heightGeneral;
        var SaveFlag = 0;
        window.name = "RegisterDutyCredit.aspx"
        aspnetForm.target = window.name
        //****************************************On Load**********************************************
        if ($get(MasterObj + "txtDutyDetailOption").value == "0")
            $get("TrDutyDetail").style.display = "none";
        document.getElementById(MasterObj + "KCalSDate_btnCalender").attachEvent('onclick', OnChangeDate)
        document.getElementById(MasterObj + "KCalEDate_btnCalender").attachEvent('onclick', OnChangeDate)
        document.getElementById(MasterObj + "KCalSDate_txtCalendar").attachEvent('onchange', OnChangeDate)
        document.getElementById(MasterObj + "KCalEDate_txtCalendar").attachEvent('onchange', OnChangeDate)
        onload();
        //**************************************EndDeclaration*****************************************       
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value != "1")
                    alert($get(MasterObj + "txtAlert").value)
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    SaveFlag = 1;
                    window.returnValue = SaveFlag;
                }
            }
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
        }
        //**************************************EndDeclaration*****************************************
        function onload() {
            if ($get(MasterObj + "txtTimeActive").value == "0") {
                $get(MasterObj + "txtSTime").disabled = true;
                $get(MasterObj + "txtETime").disabled = true;
            }
            else {
                $get(MasterObj + "txtSTime").disabled = false;
                $get(MasterObj + "txtETime").disabled = false;
            }

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXmlRegisterDetail").value);
            var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/RegisterDutyDetail");

            $get(MasterObj + "txtDutyGeneralID").value = xmlNodes.item(0).selectSingleNode('DutyGeneralID').text
            $get(MasterObj + "txtPersonID").value = xmlNodes.item(0).selectSingleNode('PersonID').text
            $get(MasterObj + "CmbPerson_txtCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
            $get(MasterObj + "CmbPerson_txtPCode").value = xmlNodes.item(0).selectSingleNode('PersonCode').text
            $get(MasterObj + "CmbPerson_txtName").value = xmlNodes.item(0).selectSingleNode('DisplayName').text
            $get(MasterObj + "KCalSDate_txtDay").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(0, 2);
            $get(MasterObj + "KCalSDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(3, 2);
            $get(MasterObj + "KCalSDate_txtYear").value = xmlNodes.item(0).selectSingleNode('StartDate').text.substr(6, 4);
            $get(MasterObj + "KCalSDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('StartDate').text
            $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
            $get(MasterObj + "KCalEDate_txtDay").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(0, 2);
            $get(MasterObj + "KCalEDate_txtMonth").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(3, 2);
            $get(MasterObj + "KCalEDate_txtYear").value = xmlNodes.item(0).selectSingleNode('EndDate').text.substr(6, 4);
            $get(MasterObj + "KCalEDate_txtCalendar").value = xmlNodes.item(0).selectSingleNode('EndDate').text
            $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
            $get(MasterObj + "txtDesc").value = xmlNodes.item(0).selectSingleNode('Des').text
            $get(MasterObj + "txtCreditID").value = xmlNodes.item(0).selectSingleNode('CreditID').text
            if (xmlNodes.item(0).selectSingleNode('FIRSTCITY_ID')) {
                $get(MasterObj + "CmbEraCity_txtCode").value = xmlNodes.item(0).selectSingleNode('FIRSTCITY_ID').text;
                $get(MasterObj + "CmbEraCity_txtPCode").value = xmlNodes.item(0).selectSingleNode('FIRSTCITY_ID').text;
            }
            if (xmlNodes.item(0).selectSingleNode('FIRSTCITY_Caption'))
                $get(MasterObj + "CmbEraCity_txtName").value = xmlNodes.item(0).selectSingleNode('FIRSTCITY_Caption').text;
            if (xmlNodes.item(0).selectSingleNode('LASTCITY_ID')) {
                $get(MasterObj + "CmbDistinationCity_txtCode").value = xmlNodes.item(0).selectSingleNode('LASTCITY_ID').text;
                $get(MasterObj + "CmbDistinationCity_txtPCode").value = xmlNodes.item(0).selectSingleNode('LASTCITY_ID').text;
            }
            if (xmlNodes.item(0).selectSingleNode('LASTCITY_Caption'))
                $get(MasterObj + "CmbDistinationCity_txtName").value = xmlNodes.item(0).selectSingleNode('LASTCITY_Caption').text;
            if (xmlNodes.item(0).selectSingleNode('WENTINGBY_ID'))
                $get(MasterObj + "CmbWentingBy").value = xmlNodes.item(0).selectSingleNode('WENTINGBY_ID').text;
            if (xmlNodes.item(0).selectSingleNode('BACKBY_ID'))
                $get(MasterObj + "CmbBackBy").value = xmlNodes.item(0).selectSingleNode('BACKBY_ID').text;
            if (xmlNodes.item(0).selectSingleNode('PLACETYPE_ID'))
                $get(MasterObj + "CmbPlacementType").value = xmlNodes.item(0).selectSingleNode('PLACETYPE_ID').text;
            if (xmlNodes.item(0).selectSingleNode('FirstTagName'))
                $get(MasterObj + "txtGridFirstTagName").value = xmlNodes.item(0).selectSingleNode('FirstTagName').text

            if (xmlNodes.item(0).selectSingleNode('StartTime').text != "00:00") {
                $get(MasterObj + "txtSTime").value = xmlNodes.item(0).selectSingleNode('StartTime').text
                $get(MasterObj + "txtETime").value = xmlNodes.item(0).selectSingleNode('EndTime').text
                Timechk(document.getElementById(MasterObj + "txtSTime"));
                Timechk(document.getElementById(MasterObj + "txtETime"));
            }
            if ($get(MasterObj + "txtDutyGeneralID").value != "0") {
                //-------------------Disable For Modify-----------------------------
                $get(MasterObj + "CmbPerson_txtPCode").disabled = true;
                $get(MasterObj + "CmbPerson_BtnDown").disabled = true;
                $get("OToolBar_BtnNew").style.display = "none";
                $get("OToolBar_BtnCalc").style.display = "none";
                //------------------------------------------------------------------
                if ($get(MasterObj + "txtModifyFlag").value == "0")
                    $get("OToolBar_BtnSave").style.display = "none";
            }
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null)
                LastSelectedRow.className = LastSelectedRowClass
            LastSelectedRowClass = SelectedRow.className
            LastSelectedRow = SelectedRow
            SelectedRow.className = "CssSelectedItemStyle"
        }
        //========================================================================================================
        //******************************************************************************
        function OnClickBtnNew() {
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            $get(MasterObj + "txtExtended").value = "";
            $get(MasterObj + "txtDesc").value = ""
            $get(MasterObj + "CmbEraCity_txtCode").value = ""
            $get(MasterObj + "CmbEraCity_txtName").value = ""
            $get(MasterObj + "CmbDistinationCity_txtCode").value = ""
            $get(MasterObj + "CmbDistinationCity_txtName").value = ""
            $get(MasterObj + "txtSTime").value = "00:00"
            $get(MasterObj + "txtETime").value = "00:00"
            $get(MasterObj + "CmbBackBy").value = "0";
            $get(MasterObj + "CmbPlacementType").value = "0";
            $get(MasterObj + "CmbWentingBy").value = "0";
            NewExendeCode();
            ClearGrd();
        }
        //*******************************************************************************
        function SetClearData(Obj) {
            if (Obj.tagName == "SCRIPT")
                eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtYear').value=''; document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtMonth').value='';document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtDay').value='';document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtCalendar').value='';");
            else if (Obj.tagName == "INPUT") {
                if (Obj.getAttribute("type") == "checkbox")
                    Obj.checked = false;
                else Obj.value = "";
            }
            else if (Obj.tagName == "LINK")
                eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtCode').value='';document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtName').value='';");
            else Obj.value = "";
        }
        //*******************************************************************************
        function chkIsEmpty() {
            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            var STime = $get(MasterObj + "txtSTime").value;
            STime = STime.split(':')[0] * 60 + STime.split(':')[1];
            var ETime = $get(MasterObj + "txtETime").value;
            ETime = ETime.split(':')[0] * 60 + ETime.split(':')[1];

            if (document.getElementById(MasterObj + "CmbPerson_txtCode").value == "")
                alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalSDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalSDate_txtDay").value == "")
                alert("لطفا تاريخ شروع را وارد نماييد");
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "" || document.getElementById(MasterObj + "KCalEDate_txtMonth").value == "" || document.getElementById(MasterObj + "KCalEDate_txtDay").value == "")
                alert("لطفا تاريخ خاتمه را وارد نماييد");
            else if (sDate > eDate)
                alert("تاريخ شروع بزرگتر از تاریخ پايان است");
            else if ((document.getElementById(MasterObj + "txtSTime").value == "" ||
                       document.getElementById(MasterObj + "txtSTime").value == "00:00")
                       && document.getElementById(MasterObj + "txtCreditTimeValidation").value == "1"
                       && document.getElementById(MasterObj + "txtTimeActive").value == "1")
                alert("لطفا ساعت شروع را وارد نماييد");
            else if ((document.getElementById(MasterObj + "txtETime").value == "" ||
                        document.getElementById(MasterObj + "txtETime").value == "00:00")
                        && document.getElementById(MasterObj + "txtCreditTimeValidation").value == "1"
                        && document.getElementById(MasterObj + "txtTimeActive").value == "1")
                alert("لطفا ساعت خاتمه را وارد نماييد");
            else if (parseInt(STime) > parseInt(ETime) && sDate == eDate)
                alert("ساعت شروع بزرگتر از ساعت خاتمه است");
            else if (document.getElementById(MasterObj + "CmbEraCity_txtCode").value == "")
                alert("لطفا شهر مبدا را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "CmbDistinationCity_txtCode").value == "")
                alert("لطفا شهر مقصد را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "CmbWentingBy").value == "0")
                alert("لطفا وسيله ي رفت را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "CmbBackBy").value == "0")
                alert("لطفا وسيله ي برگشت را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "CmbPlacementType").value == "0")
                alert("لطفا نوع اقامت را انتخاب نماييد");
            else if (document.getElementById(MasterObj + "txtDesc").value == "")
                alert("لطفا گزارش انجام ماموريت را وارد نماييد");
           
            else
                return true;
        }
        //*******************************************************************************
        function Save() {
            var sDate = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            var eDate = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "CmbPerson_txtCode").value
            var xmlStr = "<Root><Tb>";
            xmlStr = xmlStr + "<DutyGeneralID>" + $get(MasterObj + "txtDutyGeneralID").value + "</DutyGeneralID>";
            xmlStr = xmlStr + "<SerialNo>" + $get(MasterObj + "txtSerialNo").value + "</SerialNo>";
            xmlStr = xmlStr + "<CreditID>" + $get(MasterObj + "txtCreditID").value + "</CreditID>";
            xmlStr = xmlStr + "<PersonID>" + $get(MasterObj + "txtPersonID").value + "</PersonID>";
            xmlStr = xmlStr + "<PersonCode>" + $get(MasterObj + "CmbPerson_txtCode").value + "</PersonCode>";
            xmlStr = xmlStr + "<StartDate>" + sDate + "</StartDate>";
            xmlStr = xmlStr + "<EndDate>" + eDate + "</EndDate>";
            xmlStr = xmlStr + "<StartTime>" + $get(MasterObj + "txtSTime").value + "</StartTime>";
            xmlStr = xmlStr + "<EndTime>" + $get(MasterObj + "txtETime").value + "</EndTime>";
            xmlStr = xmlStr + "<Des>" + $get(MasterObj + "txtDesc").value + "</Des>";
            xmlStr = xmlStr + "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";
            xmlStr = xmlStr + "<EraCity>" + $get(MasterObj + "CmbEraCity_txtCode").value + "</EraCity>";
            xmlStr = xmlStr + "<DistinationCity>" + $get(MasterObj + "CmbDistinationCity_txtCode").value + "</DistinationCity>";
            xmlStr = xmlStr + "<WentingBy>" + $get(MasterObj + "CmbWentingBy").value + "</WentingBy>";
            xmlStr = xmlStr + "<BackBy>" + $get(MasterObj + "CmbBackBy").value + "</BackBy>";
            xmlStr = xmlStr + "<AccomodationType>" + $get(MasterObj + "CmbPlacementType").value + "</AccomodationType>";
            xmlStr = xmlStr + "</Tb></Root>";
            $get(MasterObj + "txtXml").value = xmlStr;
        }
        //===============================================================================
        function OnClickBtnSave() {
            if (chkIsEmpty()) {
                if (SaveExtendedCode("txtExSaveXml")) {
                    Save();
                    MakeXmlGrid();
                    if ($get(MasterObj + "txtXmlDetail").value == "")
                        $get(MasterObj + "txtXmlDetail").value = "<Root></Root>";
                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //*******************************************************************************       
        function OnFocuseTxtSTime() {
            document.getElementById(MasterObj + "txtSTime").select()
        }
        //*******************************************************************************
        function OnFocuseTxtETime() {
            document.getElementById(MasterObj + "txtETime").select();
        }
        //*******************************************************************************
        function onfocusItem(Obj) {
            Obj.select();
        }
        //*******************************************************************************
        function OnChangeDate() {
            if ($get(MasterObj + "txtDutyDetailOption").value == "1") {
                $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
                $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
                if ($get(MasterObj + "SDate").value == "" || $get(MasterObj + "SDate").value == "//")
                    return;
                else if ($get(MasterObj + "EDate").value == "" || $get(MasterObj + "EDate").value == "//")
                    return;
                else if ($get(MasterObj + "EDate").value < $get(MasterObj + "SDate").value)
                    alert("تاريخ شروع بزرگتر از تاريخ پايان است");
                else {
                    $get(MasterObj + "txtSubmit").value = "Filter";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //*******************************************************************************
        function MakeXmlGrid() {
            var OGrid = $get(MasterObj + "GrdDutyDetail");
            if (OGrid == null)
                return;
            var Len = OGrid.rows.length;
            var ColCount = OGrid.rows(0).cells.length;
            var Str = "", StrXml = "<Root>", StrFixed = "", StrExtended = "", Date = "";
            for (var i = 1; i < Len; i++) {
                Date = OGrid.rows(i).cells(0).innerText
                Date = "13" + Date.substr(6, 2) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2);
                StrFixed = "<Tb>";
                StrFixed += "<DutyDetailID>" + OGrid.rows(i).DutyDetailID + "</DutyDetailID>";
                StrFixed += "<DutyGeneralID>" + OGrid.rows(i).DutyGeneralID + "</DutyGeneralID>";
                StrFixed += "<Date>" + Date + "</Date>";
                if (OGrid.rows(i).cells(1).firstChild.value != "0" && OGrid.rows(i).cells(1).firstChild.value != "")
                    Str += "<TransportationCost>" + OGrid.rows(i).cells(1).firstChild.value + "</TransportationCost>";
                if (OGrid.rows(i).cells(2).firstChild.value != "0" && OGrid.rows(i).cells(2).firstChild.value != "")
                    Str += "<BreakFastCost>" + OGrid.rows(i).cells(2).firstChild.value + "</BreakFastCost>";
                if (OGrid.rows(i).cells(3).firstChild.value != "0" && OGrid.rows(i).cells(3).firstChild.value != "")
                    Str += "<LunchCost>" + OGrid.rows(i).cells(3).firstChild.value + "</LunchCost>";
                if (OGrid.rows(i).cells(4).firstChild.value != "0" && OGrid.rows(i).cells(4).firstChild.value != "")
                    Str += "<DinnerCost>" + OGrid.rows(i).cells(4).firstChild.value + "</DinnerCost>";
                if (OGrid.rows(i).cells(5).firstChild.value != "0" && OGrid.rows(i).cells(5).firstChild.value != "")
                    Str += "<OtherCost>" + OGrid.rows(i).cells(5).firstChild.value + "</OtherCost>";
                //--------------------------------------------Extended Columns--------------------------------------------------
                for (var j = 6; j < ColCount; j++) {
                    if (OGrid.rows(i).cells(j).firstChild.value != "" && OGrid.rows(i).cells(j).firstChild.value != "0") {
                        StrExtended += "<" + OGrid.rows(i).cells(j).getAttribute("TagName").replace("_ID", "") + ">";
                        StrExtended += OGrid.rows(i).cells(j).firstChild.value;
                        StrExtended += "</" + OGrid.rows(i).cells(j).getAttribute("TagName").replace("_ID", "") + ">";
                    }
                }
                if (StrExtended != "") {
                    Str += "<Extended>";
                    Str += "<" + document.getElementById(MasterObj + "txtGridFirstTagName").value + ">";
                    Str += StrExtended;
                    Str += "</" + document.getElementById(MasterObj + "txtGridFirstTagName").value + ">";
                    Str += "</Extended>";
                    StrExtended = "";
                }
                if (Str != "") {
                    StrXml += StrFixed + Str + "</Tb>"
                    Str = "";
                }
            }
            StrXml += "</Root>";
            $get(MasterObj + "txtXmlDetail").value = StrXml
        }
        //*******************************************************************************
        function OnFocusTxt(obj) {
            obj.select();
        }
        //*******************************************************************************
        function OnClickBtnDutyResult() {
            var url = "DutyResult.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&CreditID=" + $get(MasterObj + "txtCreditID").value
                    + "&StatusID=" + $get(MasterObj + "txtStatusID").value
                    + "&ModifyFlag=1";
            var DialogProperty = "dialogHeight:400px;dialogWidth:400px;center: Yes;help: no;status: no;resizable=1"
            returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
        }
        //*******************************************************************************
        function ClearGrd() {
            var oGrid = $get(MasterObj + "GrdDutyDetail");
            if (oGrid) {
                var j = oGrid.rows.length - 1
                for (; j >= 0; --j) {
                    oGrid.deleteRow(j)
                }
                newrowindex = 0
            }
        }
        //*******************************************************************************
        function onclickDownUp(obj) {
            switch (obj.id) {
                case "tdGeneralDuty":
                    tdGeneralDuty.style.display = tdGeneralDuty.style.display == "none" ? "inline" : "none";
                    document.getElementById("ImgDuty").src = document.getElementById("ImgDuty").src == document.getElementById("LinkDown").href ? document.getElementById("LinkUp").href : document.getElementById("LinkDown").href;
                    break;
                case "GridViewCountainer":
                    GridViewCountainer.style.display = GridViewCountainer.style.display == "none" ? "inline" : "none";
                    document.getElementById("ImgGrd").src = document.getElementById("ImgGrd").src == document.getElementById("LinkDown").href ? document.getElementById("LinkUp").href : document.getElementById("LinkDown").href;
                    break;
                case "DivResult":
                    DivResult.style.display = DivResult.style.display == "none" ? "inline" : "none";
                    document.getElementById("ImgResult").src = document.getElementById("ImgResult").src == document.getElementById("LinkDown").href ? document.getElementById("LinkUp").href : document.getElementById("LinkDown").href;
                    break;
            }
        } 
        //*******************************************************************************
        function OnClickBtnCalc() {
            if ($get(MasterObj + "txtRegDuty").value == "0")
                alert("امکان محاسبه ي عملکرد ثبت نشده وجود ندارد")
            else {
                $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
                $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
                document.getElementById(MasterObj + "txtSubmit").value = "Calculate"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //*******************************************************************************                
    </script>
</asp:Content>
