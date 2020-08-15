<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneLimitation.aspx.cs" Inherits="TAPresentation.App_Pages.Karane.KaraneLimitation" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .DivStyle
    {
        border: thin groove #000000;
        background-color: #C5D5E9;
        scrollbar-hightlight-color: white;
        overflow: auto;
        scrollbar-arrow-color: black;
        scrollbar-base-color: #B1D3FF;
        height: 430px;
        width: 1180px;
        float: center;
        clear: right;
        clip: rect(auto, auto, auto, auto);
    }
    .GrdTxtControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Kasratahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#FFCCFF;
    }
     .GrdTxtSaveControls
    {
        font-weight: bold;
        font-size: 8pt;
        font-family: Kasratahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
        background-color:#D1FFC1;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
                AsyncPostBackTimeout="1800" runat="server">
            </asp:ScriptManager>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid; "
                    align="right">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td style="width:100px; ; text-align:left">
                         نام آيتم کارانه :
                        </td>
                            <td>
                                <select id="CmbKaraneRptName" name="CmbKaraneRptName" style="width: 215px" runat="server"
                                    class="TxtControls" onchange="OnChangeCmbKaraneRptName()">
                                    <option></option>
                                </select>
                            </td>
                            <td style="width:65px; ; text-align:left">
                            کد کارانه :
                        </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <select id="CmbKaraneField" name="CmbKaraneField" style="width: 215px" runat="server"
                                            class="TxtControls">
                                            <option></option>
                                        </select>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <input id="RDPerson" type="radio" name="RDFilter" checked value="0" />
                                پرسنلي
                            </td>
                            <td>
                                <uc2:combobox id="CmbPerson" runat="server" />
                            </td>
                            <td>
                                <input id="RDGroup" type="radio" name="RDFilter" value="1" />گروه
                            </td>
                            <td>
                                <select id="CmbGroup" onkeydown="OnKeyEnter(this)" name="CmbGroup" style="width: 160px"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                <input id="RDDepartment" type="radio" name="RDFilter" value="2" />
                                واحد سازماني
                            </td>
                            <td>
                                <uc3:multidepartment id="UCDepartment" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="tdGrid" align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <asp:HiddenField ID="txtStatusID" runat="server" />
                        <asp:HiddenField ID="txtCNameNature" runat="server" />
                        <asp:HiddenField ID="txtDocID" runat="server" />
                        <asp:HiddenField ID="txtWfDocID" runat="server" />
                        <div id="GridViewCountainer" class="DivStyle" align="center">
                            <cc2:KasraGrid ID="GrdKaraneLimitation" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtMemberID" name="txtMemberID" runat="server" />
        <input type="text" id="txtMType" name="txtMType" runat="server" />
        <input type="text" runat="server" id="txtOnLineUser" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtCodeID" name="txtCodeID" runat="server" />
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
        <input type="text" id="txtKaraneLimitationID" name="txtKaraneLimitationID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script>
        document.dir = "RTL";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
//        document.getElementsByTagName("body")[0].scroll = "no"; 
        //==================================PageLoad========
         $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
         $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
         $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
         $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").style.display = "none";
         $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow");
         $("#RDDepartment").click();
        //*******************************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //*******************************************************************************
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            //------------------------------------------ 
            if (document.getElementById(MasterObj + "txtAlert").value != "") {
                if (document.getElementById(MasterObj + "txtValidate").value != "1")
                    alert($get(MasterObj + "txtAlert").value);
                else
                    SetMsg($get(MasterObj + "txtAlert").value);
            }
            document.getElementById(MasterObj + "txtAlert").value = ""
            document.getElementById(MasterObj + "txtValidate").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = ""
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
        //=============================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //=============================================================================   
        $(document).ready(function () {
            $("#RDGroup").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 1) {

                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").show("slow")
                }
            })
            $("#RDPerson").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 0) {
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow")
                }
            })
            $("#RDDepartment").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 2) {
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow")
                }
            })
            $("#RDTableOffice").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 3) {
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").show("slow")
                }
            })

        })
        //=============================================================================
        function OnClickBtnFilter() {
            var CheckVal = $('[name="RDFilter"]:checked').val()
            switch (CheckVal) {
                case "0":
                    document.getElementById(MasterObj + "txtMType").value = "P";
                    $get(MasterObj + "txtMemberID").value = $get(MasterObj + "CmbPerson_txtCode").value
                    break;
                case "1":
                    document.getElementById(MasterObj + "txtMType").value = "G";
                    $get(MasterObj + "txtMemberID").value = $get(MasterObj + "CmbGroup").value;
                    break;
                case "2":
                    document.getElementById(MasterObj + "txtMType").value = "D";
                    $get(MasterObj + "txtMemberID").value = $get(MasterObj + "UCDepartment_cmbDepartment").value;
                    break;
            }
            $get(MasterObj + "txtReportID").value = $get(MasterObj + "CmbKaraneRptName").value;
            $get(MasterObj + "txtCodeID").value = $get(MasterObj + "CmbKaraneField").value;
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();

        }
        //==============================================================================================================
        function OnClickBtnSave() {
            $get(MasterObj + "txtConfirm").value = 0;
            $get(MasterObj + "txtSubmit").value = "Modify";
            $get(MasterObj + "BtnSubmit").click();
        }
        //===============================================================================================================
        function OnChangeCmbKaraneRptName() {
            $get(MasterObj + "txtSubmit").value = "BindKaraneField";
            $get(MasterObj + "BtnSubmit").click();
        }
        //===============================================================================================================
        function OnClickBtnNew() {
            var strUrl = "KaraneLimitationNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&ID=0";
            strUrl = encodeURI(strUrl)
            var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 330px;dialogWidth:750px;center: Yes;help: no;status: no')
            if (retValue == 1)
                OnClickBtnFilter()
        }
        //===============================================================================================================
        function OndbClickGrd() {
            var strUrl = "KaraneLimitationNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value
               +"&ID=" + LastSelectedRow.getAttribute("ID")
               + "&ReportID=" + LastSelectedRow.ReportID
               + "&CodeID=" + LastSelectedRow.CodeID
               + "&MType=" + LastSelectedRow.MType
               + "&MemberID=" + LastSelectedRow.MemberID
               + "&MinPersonVal=" + LastSelectedRow.cells(3).innerText
               + "&MinPersonType=" + LastSelectedRow.MinPersonType
               + "&MaxPersonVal=" + LastSelectedRow.cells(4).innerText
               + "&MaxPersonType=" + LastSelectedRow.MaxPersonType
               + "&MaxMemberVal=" + LastSelectedRow.cells(5).innerText
               + "&MaxMemberType=" + LastSelectedRow.MaxMemberType
               + "&AvgMemberVal=" + LastSelectedRow.cells(6).innerText
            strUrl = encodeURI(strUrl)
            var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 330px;dialogWidth:750px;center: Yes;help: no;status: no')
            if (retValue == 1)
                OnClickBtnFilter()
        }
        //===============================================================================================================
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                if (confirm("آيا براي حذف مطمئنيد؟")) {
                    $get(MasterObj + "txtKaraneLimitationID").value = LastSelectedRow.getAttribute("ID");
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert('لطفا يک سطر از گريد انتخاب کنيد')
        }
        //===============================================================================================================
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) 
                OndbClickGrd();
            else
                alert('لطفا يک سطر از گريد انتخاب کنيد')
        }
        //===============================================================================================================
    </script>
</asp:Content>

