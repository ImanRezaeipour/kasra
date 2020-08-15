<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ViewLog.aspx.cs" Inherits="FrmPresentation.App_Pages.Log.ViewLog" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <asp:ScriptManager ID="ScriptManager1" runat="server"> 
    </asp:ScriptManager>
    <table style="width:1000px;">
        <tr>
            <td>
                <fieldset style="border: 1px solid #33CCCC; width: 98%; background-color: #E3EFFF;">
                    <legend style="color: #75A3D0">آيتم هاي جستجو</legend>
                    <table>
                        <tr>
                            <td >
                               شماره پرسنلي: 
                            </td>
                            <td >
                                <uc4:combobox ID="CmbPerson" runat="server" />
                            </td>
                            <td>                               
                                از تاريخ:
                            </td>
                            <td>
                                <uc1:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td style="width:10px"></td>
                            <td>
                                تا تاريخ:
                                
                            </td>
                            <td>
                                <uc1:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                           
                        </tr>
                        <tr>
                         <td>
                                نام زير سيستم:
                            </td>
                            <td style="text-align:right">
                            
                                <select id="CmbSubSys" class="TxtControls" style="width: 150px" runat="server" >
                                    <option></option>
                                </select>
                            </td>                            
                           
                            
                            <td>
                                از ساعت:
                            </td>
                            <td style="text-align:right">
                                <input id="txtSTime" type="text" class="TxtControls" style="width: 150px" runat="server"
                                       onblur="Timechk(this)"   onkeydown="OnKeyDownTime(this)" onfocus="onfocusTime(this)" />
                            </td>
                            <td style="width:10px"></td>
                            <td>
                                تا ساعت:
                            </td>
                            <td style="text-align:right">
                                <input id="txtETime" type="text" class="TxtControls" style="width: 150px" runat="server"
                                   onblur="Timechk(this)"  onkeydown="OnKeyDownTime(this)" onfocus="onfocusTime(this)"  />
                            </td>
                            <td style="width:10px"></td>
                             <td>
                                نام کامپيوتر:
                            </td>
                            <td style="text-align:right">
                              <input id="txtComputerName" type="text" class="TxtControls" style="width: 150px" runat="server" onfocus="onfocusTime(this)"/>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                
                <uc2:ToolBar ID="OToolBar" runat="server" />
                
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                    <asp:HiddenField ID="txtCodePermision" runat="server" />
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    <asp:HiddenField ID="CurPage" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
                                <cc1:mysecurity ID="OnLineUser" runat="server">
                                </cc1:mysecurity>
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtSDateFilter" name="SDate" runat="server" />
                                <input type="text" id="txtEDateFilter" name="EDate" runat="server" />
                                <input type="text" id="txtDate" name="txtDate" runat="server" />
                                <input type="text" id="txtID" name="txtID" runat="server" />
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
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                                <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                                <!------------------------------------------------------------------------->
                                <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
                                 <input type="text" id="txtSysName" name="txtSysName" runat="server" />
                                 <input type="text" id="ComputerName" name="ComputerName" runat="server" />                                 
                                 <input type="text" id="STime" name="STime" runat="server" />
                                 <input type="text" id="ETime" name="ETime" runat="server" />
                                 <input type="text" id="txtcurrentDate" name="txtcurrentDate" runat="server" />
                            </div>
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
   document.dir="rtl"
   //document.body.style.overflowY = "hidden" 
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {           
            $get(MasterObj + "txtAlert").value = "";
        }

        function EndRequestHandler(sender, args) {

            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value != "1") {
                    alert($get(MasterObj + "txtAlert").value)
                }
                else alert($get(MasterObj + "txtAlert").value);
            }
            var StrVal = $get(MasterObj + "txtSubmit").value;
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
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //=======================================================
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }       
        //=======================================================
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;
        document.getElementById(MasterObj + "txtSysName").value = document.getElementById(MasterObj + "CmbSubSys").value;
        document.getElementById(MasterObj + "ComputerName").value = document.getElementById(MasterObj + "txtComputerName").value;
        document.getElementById(MasterObj + "STime").value = document.getElementById(MasterObj + "txtSTime").value;
        document.getElementById(MasterObj + "ETime").value = document.getElementById(MasterObj + "txtETime").value;
        document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
        document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
        document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "EDate").value == "//" ? "" : document.getElementById(MasterObj + "EDate").value;
        document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "SDate").value == "//" ? "" : document.getElementById(MasterObj + "SDate").value;

        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //================================================================
    function OnClickBtnShowAll() {
        ClearAll()
        $get(MasterObj + "KCalSDate_txtYear").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(0, 4);
        $get(MasterObj + "KCalSDate_txtMonth").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtDay").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtCalendar").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(8, 2) + '/' + document.getElementById(MasterObj + "txtcurrentDate").value.substr(5, 2) + '/' + document.getElementById(MasterObj + "txtcurrentDate").value.substr(0, 4)
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

        $get(MasterObj + "KCalEDate_txtYear").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtMonth").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtDay").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtCalendar").value = document.getElementById(MasterObj + "txtcurrentDate").value.substr(8, 2) + '/' + document.getElementById(MasterObj + "txtcurrentDate").value.substr(5, 2) + '/' + document.getElementById(MasterObj + "txtcurrentDate").value.substr(0, 4)
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

        document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
        document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
        document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "EDate").value == "//" ? "" : document.getElementById(MasterObj + "EDate").value;
        document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "SDate").value == "//" ? "" : document.getElementById(MasterObj + "SDate").value;
        document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;
        document.getElementById(MasterObj + "txtSysName").value = document.getElementById(MasterObj + "CmbSubSys").value;
        document.getElementById(MasterObj + "ComputerName").value = document.getElementById(MasterObj + "txtComputerName").value;
        document.getElementById(MasterObj + "STime").value = document.getElementById(MasterObj + "txtSTime").value;
        document.getElementById(MasterObj + "ETime").value = document.getElementById(MasterObj + "txtETime").value;

        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //================================================================
    function ClearAll(){
    document.getElementById(MasterObj + "CmbPerson_txtCode").value="";
    document.getElementById(MasterObj + "CmbPerson_txtName").value="";
    document.getElementById(MasterObj + "CmbSubSys").value=0;
    document.getElementById(MasterObj + "txtComputerName").value="";
    document.getElementById(MasterObj + "txtSTime").value="";
    document.getElementById(MasterObj + "txtETime").value="";
}
//=======================================================
function onfocusTime(obj) {
    obj.select()
}
</script>
</asp:Content>
