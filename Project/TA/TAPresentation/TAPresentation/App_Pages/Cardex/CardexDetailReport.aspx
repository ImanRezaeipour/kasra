<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexDetailReport.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexDetailReport" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .DivStyle1
        {
            border: thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 400px;
            width: 100%;
            clear: right;
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table id="TBLBase" align="center" width="100%" >
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table align="right" width="850px"  >
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                دوره :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbWorkPeriod" name="CmbWorkPeriod" Width="143px" class="TxtControls"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                کاردکس :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbCardexPeriod" name="CmbCardexPeriod" Width="147px" class="TxtControls"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr> 
                            <td>
                                شيفت :
                            </td>
                            <td id="Td1">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList class="TxtControls" ID="cmbShift" runat="server" Width="212px"
                                            onchange="onchangeCmbShift()">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <select id="CmbGroup" name="CmbGroup" style="width: 143px" runat="server" onchange="onchangecmbGroup()"
                                            class="TxtControls">
                                            <option></option>
                                        </select>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                 واحد سازماني :
                            </td>
                            <td>
                                <uc3:multidepartment id="UCDepartment" runat="server" />
                            </td>
                            <td id="TDChildren">
                                <input type="checkbox" id="chkChildren" runat="server" />زير مجموعه
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer"  align="center" class="DivStyle1">
                            <cc2:KasraGrid ID="GrdCardexDetailReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="Grd_Sorting"   AllowSendToPDF="false" AllowSendToExcel="true">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:PostBackTrigger ControlID="BtnSubmitSend" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="BtnSubmit3" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
    </div>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script >
        var LastSelectedRow = null, LastSelectedRowClass = "";
        document.getElementsByTagName("body")[0].scroll = "no";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            var elem = args.get_postBackElement();
            if ($get(MasterObj + "txtSubmit").value == "onchangecmbShift" || $get(MasterObj + "txtSubmit").value == "onchangecmbGroup")
                document.getElementById("ctl00_ProgressState").value = 1
        }
        function EndRequestHandler(sender, args) {
        }
        //=====================================================================================================
        function onchangeCmbShift() {
            document.getElementById(MasterObj + "txtSubmit").value = "onchangecmbShift"
            document.getElementById(MasterObj + "BtnSubmit3").click()
        }
        //=====================================================================================================
        function onchangecmbGroup() {
            document.getElementById(MasterObj + "txtSubmit").value = "onchangecmbGroup"
            document.getElementById(MasterObj + "BtnSubmit3").click()
        }
        //=====================================================================================================
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtDepartment").value = "<Root>" + document.getElementById(MasterObj + "UCDepartment_txtHidden").value + "</Root>";
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //=====================================================================================================
        function OnClickBtnShowAll() {
            $get(MasterObj + "CmbPerson_txtCode").value = "";
            $get(MasterObj + "CmbPerson_txtPCode").value = "";
            $get(MasterObj + "CmbPerson_txtName").value = "";
            $get(MasterObj + "CmbWorkPeriod").selectedIndex = "0";
            $get(MasterObj + "CmbCardexPeriod").selectedIndex = "0";
            $get(MasterObj + "cmbShift").value = "0";
            $get(MasterObj + "CmbGroup").value = "0";
            $get(MasterObj + "UCDepartment_cmbDepartment").value = "0";
            $get(MasterObj + "UCDepartment_txtHidden").value = "";
            $get(MasterObj + "chkChildren").checked = false;
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //=====================================================================================================
        function OnClickBtnOneExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=====================================================================================================
        function OnClickBtnOnePDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=====================================================================================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //=====================================================================================================
    </script>
</asp:Content>

