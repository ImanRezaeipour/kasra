<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineWorkPeriod.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.DefineWorkPeriod" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        #Text1
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table  style="width:600px">
        <tr>
            <td>
               <!-- <table class="style1">
                    <tr>
                        <td>
                            نام دوره:
                        </td>
                        <td>
                            <input id="txtPeriodName" type="text" />
                        </td>
                        <td>
                            از تاريخ:
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ:
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td>
                            تاريخ قطعي کردن:
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalExpire" runat="server" />
                        </td>
                    </tr>
                </table>-->
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtCategoryID" runat="server" />
                            <asp:HiddenField ID="txtType" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="CurPage" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />                            
                        </div>
                        <div style="width: 330px; height: 391px;">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
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
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSearchflag" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server"  />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
        <input type="text" id="txtName" name="txtName" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
       
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";
        if (document.getElementById('OToolBar_BtnEdit') != null)
            document.getElementById('OToolBar_BtnEdit').style.visibility = "hidden"; 
             
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
                   
        }

        function EndRequestHandler(sender, args) {
            
            if (document.getElementById('OToolBar_BtnEdit') != null)
                document.getElementById('OToolBar_BtnEdit').style.visibility = "hidden";            
                
             var StrVal = $get(MasterObj + "txtSubmit").value
             if (StrVal != "") {
                LastSelectedRow.className = LastSelectedRowClass;
                LastSelectedRow = ""; 
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
                SetMsg($get(MasterObj + "txtAlert").value)
                $get(MasterObj + "txtAlert").value = ""
            }
            $get(MasterObj + "txtSubmit").value = "";
        }  


    </script>
    
    <script language="javascript" type="text/javascript">
          
        //*************************************OnLoad*************************************        
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

            if (document.getElementById("OToolBar_txtCurPage").value != "" && document.getElementById("OToolBar_txtCurPage").value != "0"
                && document.getElementById("OToolBar_txtCurPage").value != document.getElementById(MasterObj + "txtCurPage").value) {

                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                    document.getElementById(MasterObj + "txtSubmit").value = "Const";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
                else document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
            }
            else 
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            var TotalPage = parseInt($get(MasterObj + "txtCurPage").value);
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
                document.getElementById(MasterObj + "BtnSubmit").click();
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
                    document.getElementById("OToolBar_BtnNext").disabled = true
                else
                    document.getElementById("OToolBar_BtnNext").disabled = false
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
                document.getElementById(MasterObj + "BtnSubmit").click();

                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
                    document.getElementById("OToolBar_BtnPrv").disabled = true
                else
                    document.getElementById("OToolBar_BtnPrv").disabled = false
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
        function OnClickBtnNew() {
            var url = "NewDefineWorkPeriod.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnlineUserID=" + $get(MasterObj + "txtOnLineUser").value + "&Mode=New";           
            var Result=0
            Result = window.showModalDialog(encodeURI(url), "", "dialogHeight: 250px;dialogWidth: 520px;center: Yes;help: no;status: no");
            if (Result != 0) {
                document.getElementById(MasterObj + "txtSubmit").value = "Show";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //=======================================================================
        function OnClickBtnExpire() {
            if (LastSelectedRow != null && LastSelectedRow != "") {
                var url = "NewDefineWorkPeriod.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnlineUserID="
            + $get(MasterObj + "txtOnLineUser").value + "&WorkPeriodID=" + LastSelectedRow.getAttribute("ID") + "&SDate=" + LastSelectedRow.cells(1).innerText + "&EDate=" + LastSelectedRow.cells(2).innerText + "&EXDate=" + LastSelectedRow.cells(3).innerText + "&Name=" + (LastSelectedRow.cells(0).firstChild.title == "" ? LastSelectedRow.cells(0).innerText : LastSelectedRow.cells(0).firstChild.title) + "&Mode=SetExpire";
                var Result = 0

                Result = window.showModalDialog(encodeURI(url), "", "dialogHeight: 250px;dialogWidth: 520px;center: Yes;help: no;status: no");
                if (Result != 0) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Show";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("يک سطر را انتخاب کنيد");
            }
        }
        //=======================================================================
        function OnClickBtnNoExpire() {            
            if (LastSelectedRow != null && LastSelectedRow != "") {
                if (confirm("آيا برای عدم قطعي کردن مطمئن هستيد؟")) {
                    document.getElementById(MasterObj + "txtWorkPeriodID").value = LastSelectedRow.getAttribute("ID");
                    var Date = LastSelectedRow.cells(1).innerText;
                    document.getElementById(MasterObj + "SDate").value = Date.substr(6, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2);
                    Date = LastSelectedRow.cells(2).innerText;
                    document.getElementById(MasterObj + "EDate").value = Date.substr(6, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2);

                    document.getElementById(MasterObj + "txtName").value = (LastSelectedRow.cells(0).firstChild.title == "" ? LastSelectedRow.cells(0).innerText : LastSelectedRow.cells(0).firstChild.title) 
                    
                    document.getElementById(MasterObj + "txtSubmit").value = "Save";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            } else alert("يک سطر را انتخاب کنيد");
            
             }
        //======================================================================
             function OnClickGrd(SelectedRow) { 
                   
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }            
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";  
            if(document.getElementById('OToolBar_BtnEdit')!=null)
                document.getElementById('OToolBar_BtnEdit').style.visibility = LastSelectedRow.cells(3).firstChild.innerText != "" ? "hidden" : "visible";          
        }
        //========================================================================
        function OnClickBtnEdit() {
            var Ogrid = document.getElementById("GrdWorkPeriod");           
        if (Ogrid != null) {
            if (LastSelectedRow != "") {                   
                    if (LastSelectedRow.cells(3).firstChild.innerText == "")
                    {
                        var url = "NewDefineWorkPeriod.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnlineUserID="
                        + $get(MasterObj + "txtOnLineUser").value + "&WorkPeriodID=" + LastSelectedRow.getAttribute("ID") + "&SDate=" + LastSelectedRow.cells(1).innerText + "&EDate=" + LastSelectedRow.cells(2).innerText + "&EXDate=" + LastSelectedRow.cells(3).innerText + "&Name=" + (LastSelectedRow.cells(0).firstChild.title == "" ? LastSelectedRow.cells(0).innerText : LastSelectedRow.cells(0).firstChild.title) + "&Mode=Edit";
                        var Result = 0
                        Result = window.showModalDialog(encodeURI(url), "", "dialogHeight: 250px;dialogWidth: 520px;center: Yes;help: no;status: no");
                        if (Result != 0) {
                            document.getElementById(MasterObj + "txtSubmit").value = "Show";
                            document.getElementById(MasterObj + "BtnSubmit").click();
                        }
                    }
                else alert("دوره قطعي شده قابل ويرايش نيست")
            }
            else alert("براي وِيرايش يک دوره را انتخاب کنيد")
         }
        }
        //===============================================================================
        function OndbClickGrd(Obj) {
            OnClickBtnEdit(); 
        }
    </script>

</asp:Content>
