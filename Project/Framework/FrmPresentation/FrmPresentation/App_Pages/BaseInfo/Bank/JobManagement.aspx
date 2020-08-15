<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="JobManagement.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.JobManagement" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width:800px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1" align="center" >
    <tr>
        <td>
            <table>
                <tr>
                    <td>نامJob:
                    </td>
                    <td>
                        <input class="txtControls" id="txtJobName" type="text" />  
                    </td>
                    <td>تاريخ ايجاد:
                    </td>
                    <td>                        
                        <uc2:KCalendar class="txtControls" ID="KCalCreate" runat="server" />&nbsp;                        
                    </td>                    
                    <td>توضيحات:
                    </td>
                    <td>
                        <textarea class="txtControls" id="txtDesc" cols="20" rows="1" ></textarea>
                    </td>
                </tr>
            </table>
    </td>
    </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height:300px" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <div align="center">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                         </div>
                        <input type="text" ID="SDate" runat="server" style="display:none" />
                        <input type="text" ID="EDate" runat="server" style="display:none" />                        
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />                       
                       
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="height:10px">
            </td>
        </tr>       
    </table>
    <!--<table class="style1">
        <tr>
            <td style="width: 100%;">
                <table style="width: 100%;">
                <tr><td>دستورات Job:</td></tr>
                    <tr style="width: 100%;">
                        <td style="width: 100%;">
                            <textarea id="txtAreaDesc" style="background-color: #DDEFF4; width: 100%; height: 57px"
                                runat="server"></textarea>
                        </td>
                    </tr>
                     <tr><td>زمانبندي هاي Job:</td></tr>
                    <tr style="width: 100%;">
                        <td style="width: 100%;">
                            <textarea id="Textarea1" style="background-color: #DDEFF4; width: 100%; height: 57px"
                                runat="server"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>-->
    <div style="display: none">
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
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
        <input type="text" id="txtSearch" name="txtSearch" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <!-------------------------------------------------------------------------->
        <input type="text" id="txtTempJobName" name="txtTempJobName" runat="server" />
        <input type="text" id="txtTempDesc" name="txtTempDesc" runat="server" />
        <input type="text" id="txtJobID" name="txtJobID" runat="server" />
        <input type="text" id="txtCreateDate" name="txtCreateDate" runat="server" />
    </div>

    <script type="text/javascript" language="javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
        
    }

    function EndRequestHandler(sender, args) {    
        
        if (LastSelectedRow != "") {
            LastSelectedRow.className = LastSelectedRowClass;
            LastSelectedRow = "";
            document.getElementById(MasterObj + "txtJobID").value = "";
        }
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
            else
                if ($get(MasterObj + "lblTo").value != "") {
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
//        var OGrid = document.getElementById("GrdJob");             
//        if (OGrid != null) {
//            for (var i = 1; i < OGrid.rows.length; i++) {
//                OGrid.rows(i).cells(0).style.direction = "ltr";
//                OGrid.rows(i).cells(1).style.direction = "ltr";
//                OGrid.rows(i).cells(0).align = "left";
//                OGrid.rows(i).cells(1).align = "left";
//            }
//        }
        if ($get(MasterObj + "txtAlert").value != "") {
            SetMsg($get(MasterObj + "txtAlert").value)
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtSubmit").value = "";
        }
                 
            }

    //==============================================================================

    //*************************************Declaration*************************************
    var str = "<Root></Root>";
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    var PersonCode = "0";
    var LastSelectedRow = ""
    var LastSelectedRowClass = "";

    //*************************************EndDeclaration*************************************
    //=======================================

    //*************************************OnLoad*************************************
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
    //**********************************EndOnLoad*************************************

    //*************************************Toolbar*************************************
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnBlurtxtCurPage() {
        document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");
        var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);

        if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                document.getElementById("OToolBar_txtCurPage").value != "0")
//                document.getElementById("OToolBar_txtCurPage").value != document.getElementById(MasterObj + "txtCurPage").value) {
            {

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > parseInt(TotalPage)) {
                document.getElementById("OToolBar_txtCurPage").value = TotalPage;
            }
            document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
            document.getElementById(MasterObj + "txtSubmit").value = "Const";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        else document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
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
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickGrd(SelectedRow) {
        if (LastSelectedRow != "") {
            LastSelectedRow.className = LastSelectedRowClass;
        }
        LastSelectedRowClass = SelectedRow.className;
        LastSelectedRow = SelectedRow;
        SelectedRow.className = "CssSelectedItemStyle";
        document.getElementById(MasterObj + "txtJobID").value = LastSelectedRow.JobID;    
    }
    //=====================================
//    function OndbClickGrd(Obj) {
//        OnClickBtnEdit();
//    }
    //==================================
    function OnClickBtnNew() {
        var url = "DefineJob.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Mode=Edit";
        returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:500px;dialogWidth: 900px;center: Yes;help: no;status: no")
        if (returnValue == 1)
            OnBlurtxtCurPage();
    }
    //==================================
    function OnClickBtnFilter() {
        document.getElementById(MasterObj+ "txtTempJobName").value = document.getElementById("txtJobName").value;
        document.getElementById(MasterObj + "txtTempDesc").value = document.getElementById("txtDesc").value;

        document.getElementById(MasterObj + "txtCreateDate").value = document.getElementById(MasterObj + "KCalCreate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalCreate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalCreate_txtDay").value;
        //alert(document.getElementById(MasterObj + "txtCreateDate").value)
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //=================================
    function OnClickBtnDelete() {
        if (LastSelectedRow == "")
            alert("يک رديف انتخاب کنيد");
        else {
            if (confirm("براي حذف مطمئن هستيد؟")) {
                document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
    }
    //===============================
    function OnClickBtnEdit() {
        var url = "DefineJob.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&JobID=" + document.getElementById(MasterObj + "txtJobID").value+"&Mode=Edit";
        returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:500px;dialogWidth: 900px;center: Yes;help: no;status: no")          
    }
    //===========================
    function OnClickBtnShowAll() {
        document.getElementById("txtJobName").value = "";
        document.getElementById("txtDesc").value = "";
        document.getElementById(MasterObj + "KCalCreate_txtYear").value = "";
        document.getElementById(MasterObj + "KCalCreate_txtMonth").value = "";
        document.getElementById(MasterObj + "KCalCreate_txtDay").value = "";
        OnClickBtnFilter();
    }
    //=============================
    function OnClickBtnBackup() {
        var url = "BankBackup.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
        returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:430px;dialogWidth: 560px;center: Yes;help: no;status: no")
        if (returnValue == "1") {
            OnBlurtxtCurPage();  
        }
    }
    //================================
    function OnClickBtnExec() {
        document.getElementById(MasterObj + "txtSubmit").value = "Exec";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    </script>
</asp:Content>
