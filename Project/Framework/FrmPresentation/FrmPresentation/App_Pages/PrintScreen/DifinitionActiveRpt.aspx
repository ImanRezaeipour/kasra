<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DifinitionActiveRpt.aspx.cs" Inherits="FrmPresentation.App_Pages.PrintScreen.DifinitionActiveRpt" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>
    <table >
   <tr>
   <td>
       <uc1:ToolBar ID="OToolBar" runat="server" />
       <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">

                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        
                    }

                    function EndRequestHandler(sender, args) {
                        
                        LastSelectedRow = null;
                        var StrVal = $get(MasterObj + "txtSubmit").value

                        if ($get(MasterObj + "txtAlert").value != "") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                        //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
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

                    }
                </script>
   </td>
   </tr>
   <tr><td  align="center" width="700"> 
   <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            
            <asp:HiddenField ID="txtSDate" runat="server" />
            <asp:HiddenField ID="txtEDate" runat="server" />
            <asp:HiddenField ID="txtAlert" runat="server" />
            <asp:HiddenField ID="lblFrom" runat="server" />
            <asp:HiddenField ID="lblTo" runat="server" />
            <asp:HiddenField ID="Totalpage" runat="server" />
            <asp:HiddenField ID="txtCurPage" runat="server" />
            <asp:HiddenField ID="lblTotal" runat="server" />
            <asp:HiddenField ID="txtPageSize" runat="server" />
            <asp:HiddenField ID="txtPageNumber" runat="server" />
            <asp:HiddenField ID="txtOrderString" runat="server" />
            
            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
            <asp:HiddenField ID="CurPage" runat="server" />
            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
   </td></tr>
   
   <tr><td>
  <div style="display: none">
  <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection" runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtReportID" runat="server" />
                    
  </div> 
   </td></tr>
    </table>
    <script language="javascript" type="text/javascript">
            
            var LastSelectedRow = null;
            var LastSelectedRowClass = "";
            ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
                document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnPrv() {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnLast() {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnFirst() {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnFilter() {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickGrd(SelectedRow) {
                if (LastSelectedRow != null) {
                    LastSelectedRow.className = LastSelectedRowClass;
                }
                LastSelectedRowClass = SelectedRow.className;
                LastSelectedRow = SelectedRow;
                SelectedRow.className = "CssSelectedItemStyle";
                
                
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OndbClickGrd() {
                var strUrl = "DifinitionActiveRptNew.aspx?ReportID=" + LastSelectedRow.ReportID
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

                //strUrl = encodeURI(strUrl)
                var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 150px;dialogWidth: 650px;center: Yes;help: no;status: no')

                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnDel() {
                if (LastSelectedRow != null) {
                    var Msg = "آيا براي حذف مطمئنيد؟"
                    if (confirm(Msg) == true) {
                        document.getElementById(MasterObj + "txtReportID").value = LastSelectedRow.ReportID
                        document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                else {
                    alert("به منظور حذف يک سطر را انتخاب کنيد")
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnNew() {
                var strUrl = 'DifinitionActiveRptNew.aspx?ReportID=0' 
                            +'&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value 
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 150px;dialogWidth: 650px;center: Yes;help: no;status: no')

                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnShowAll() {
                OnClickBtnClear()
                OnClickBtnFilter()
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnClear() {
                document.getElementById(MasterObj + "chkUser").checked = false
                document.getElementById(MasterObj + "chkSystem").checked = false
                document.getElementById(MasterObj + "cmbDayState").value = 0
                document.getElementById(MasterObj + "cmbGroupCode1").value = "000"
                document.getElementById(MasterObj + "cmbGroupCode2").value = "000"
                document.getElementById(MasterObj + "cmbResultCode").value = "000"

            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnEdit() {
                if (LastSelectedRow != null)
                    OndbClickGrd()
                else
                    alert("به منظور ويرايش یک سطر را انتخاب کنید")
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
