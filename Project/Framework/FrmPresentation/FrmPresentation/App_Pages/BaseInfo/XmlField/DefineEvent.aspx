<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineEvent.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.DefineEvent" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssRedBG
        {
            background-color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 700px">
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            نام شِما:
                            <select id="CmbSelectedObject" dir="ltr" style="width: 150px" class="TxtControls"
                                runat="server" onchange="onchangeCmbSelectedObj()">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            آيتم شِما:
                        </td>
                        <td id="TdItems">
                            <select id="CmbItem" dir="ltr" style="width: 150px" class="TxtControls" >
                                <option></option>
                            </select>
                        </td>
                        <td>
                            رويداد:
                        </td>
                        <td>
                            <select id="CmbEvent" dir="ltr" style="width: 150px" class="TxtControls" runat="server">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr style="width: 500px" class="CssHR" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <fieldset dir="rtl" style="width: 650px; height: 150px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">شرايط</legend>
                    <table>
                        <tr>
                            <td>
                            
                                <table id="TblConditions">
                                    <tr>
                                        <td class="CssHeaderStyle" style="width: 40">
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 100">
                                            مقدار
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 40">
                                            عملگر
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 150">
                                            پارامتر
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 40">
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 40">
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 50">
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 30">
                                            <img src="../../../App_Utility/Images/Icons/NewIcon.gif" title="ايجاد" onclick="onclickNewCondition(this)" />
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 30">
                                            حذف
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </fieldset>
                
            </td>
        </tr>
        <tr>
        <td style="width:450px" dir="ltr">
            <asp:Label ID="LblCondition" runat="server" Width="100%" Text=""></asp:Label></td>
        <td style="width: 150px;">
        <input type="button" style="width:80px" id="BtnShowCoditions"  value="نمايش شرايط" onclick="onclickShowConditions()" 
                align="right" />
        </td>
        </tr>
        <tr>
            <td colspan="2">
                <fieldset dir="rtl" style="width: 650px; height: 150px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">رويدادها</legend>
                    <table>
                        <tr>
                            <td>
                                <table id="TblEvents">
                                    <tr>
                                        <td class="CssHeaderStyle" style="width: 200">
                                            پارامتر
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 200">
                                            رويداد
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 50">
                                            <img src="../../../App_Utility/Images/Icons/NewIcon.gif" title="ايجاد" onclick="onclickNewEvents(this)" />
                                        </td>
                                        <td class="CssHeaderStyle" style="width: 50">
                                            حذف
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <select id="CmbSchemaItems" dir="ltr" style="width: 100px" class="TxtControls" runat="server">
                    <option></option>
                </select>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <!------------------------------------------------------------->
        <select id="CmbEvents" dir="ltr" style="width: 100px" class="TxtControls" runat="server">
            <option></option>
        </select>
        <input type="text" id="txtConditions" name="txtConditions" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        CreateGrid(1);
        CreateGridEvents(1);
        //-----------------------------------------------------     
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //######################################################
        function BeginRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "Filter")
                document.getElementById("ctl00_ProgressState").value = 1;
        }
        //######################################################
        function EndRequestHandler(sender, args) {
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal == "Filter")
                SetCombos();
            $get(MasterObj + "txtSubmit").value = "";
        }
        //######################################################
        function onchangeCmbSelectedObj() {
            if (document.getElementById(MasterObj + "CmbSelectedObject").value != "0") {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else {
                document.getElementById(MasterObj + "CmbSchemaItems").innerHTML = "";
                SetCombos();               
            }
        }
        //######################################################
        function CreateGrid(intval) {
            var i = 1
            while (i < TblConditions.rows.length) {
                TblEvents.deleteRow(i);
            }
            AddRow(intval);
        }
        //######################################################
        function AddRow(intval) {
            var Orow = TblConditions.insertRow(intval);
            if ((Orow.rowIndex) % 2 == 0)
                Orow.className = "CssItemStyle"
            else
                Orow.className = "CssAlternatingItemStyle";
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.cells(0).innerHTML = "<select  dir='ltr' class='TxtControls' style='width:40px' class='TxtControls'><option value=0></option><option value=1>)</option></select>";
            Orow.cells(1).innerHTML = "<input type='text' style='width:80px' class='TxtControls'/>";
            Orow.cells(2).innerHTML = "<select  dir='ltr' class='TxtControls' style='width:40px' class='TxtControls'><option value=0>=</option><option value=1>></option><option value=0><</option></select>";
            Orow.cells(3).innerHTML = "<select  dir='ltr'  style='width: 150px' class='TxtControls'>" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";
            Orow.cells(4).innerHTML = "<select  dir='ltr' class='TxtControls' style='width:40px' class='TxtControls'><option value=0></option><option value=1>(</option></select>";
            Orow.cells(5).innerHTML = Orow.rowIndex == 1 ? "" : "<select  dir='ltr' class='TxtControls' style='width:40px' class='TxtControls'><option value=0>و</option><option value=1>يا</option></select>";
            Orow.cells(6).style.width = "50px";
            Orow.cells(7).innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' title='ايجاد' onclick='onclickNewCondition(this)'>";
            Orow.cells(8).innerHTML = "<img src='../../../App_Utility/Images/Icons/DelIcon.gif' title='حذف' onclick='onclickDeleteCondition(this)'>";
            if (Orow.rowIndex == 1) {
                TblConditions.rows(0).cells(7).innerHTML = "";
                TblConditions.rows(0).cells(7).innerText = "ايجاد";
            }
        }
        //######################################################
        function SetCombos() {
            TdItems.innerHTML="<select dir='ltr' id='CmbItem'  style='width: 150px' class='TxtControls' >" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";            
            for (var i = 1; i < TblConditions.rows.length; i++) {
                TblConditions.rows(i).cells(3).innerHTML = "<select dir='ltr'  style='width: 150px' class='TxtControls' >" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";
            }
            for (var i = 1; i < TblEvents.rows.length; i++) {
                TblEvents.rows(i).cells(0).innerHTML = "<select dir='ltr'  style='width: 150px' class='TxtControls' >" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";
            }            
        }
        //######################################################
        function onclickDeleteCondition(Obj) {
            if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                TblConditions.deleteRow(Obj.parentElement.parentElement.rowIndex);
                if (TblConditions.rows.length == 1) {
                    TblConditions.rows(0).cells(7).innerText = "";
                    TblConditions.rows(0).cells(7).innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' title='ايجاد' onclick='onclickNewCondition(this)' />";
                }
            }
        }
        //#######################################################
        function onclickNewCondition(obj) {
            AddRow(obj.parentElement.parentElement.rowIndex + 1);
        }
        //######################################################
        function onclickCondition(obj) {
            var Result = "";
            if (document.getElementById(MasterObj + "CmbSelectedObject").value != "0") {
                var url = "DefineConditions.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&XmlSchemaName=" + document.getElementById(MasterObj + "CmbSelectedObject").value + "&Condition=" + (obj.parentElement.parentElement.getAttribute("Condition") != null ? obj.parentElement.parentElement.getAttribute("Condition") : "");
                Result = window.showModalDialog(encodeURI(url), "", "");
                if (Result != "" && Result != undefined && Result != null) {
                    obj.parentElement.className = "CssRedBG";
                }
                else {
                    obj.parentElement.className = "";
                    Result = "";
                }
                obj.parentElement.parentElement.setAttribute("Condition", Result);
            }
        }
        //===================================================
        function CreateGridEvents(intval) {
            while (TblEvents.rows.length > 1)
                TblEvents.deleteRow(1);
            AddRowEvent(intval);
        }
        //==============================================
        function AddRowEvent(intval) {
            var Orow = TblEvents.insertRow(intval);
            if ((Orow.rowIndex) % 2 == 0)
                Orow.className = "CssItemStyle"
            else
                Orow.className = "CssAlternatingItemStyle";
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.cells(0).innerHTML = "<select dir='ltr'  style='width: 150px' class='TxtControls'>" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";
            Orow.cells(1).innerHTML = "<select dir='ltr'  style='width: 150px' class='TxtControls'>" + document.getElementById(MasterObj + "CmbEvents").innerHTML + "</select>";
            Orow.cells(2).innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' title='ايجاد' onclick='onclickNewEvents(this)' />";
            Orow.cells(3).innerHTML = "<img src='../../../App_Utility/Images/Icons/DelIcon.gif' title='حذف' onclick='onclickDeleteEvents(this)' />"
            if (Orow.rowIndex == 1) {
                TblEvents.rows(0).cells(2).innerHTML = "";
                TblEvents.rows(0).cells(2).innerText = "ايجاد";
            }
        }
        //##################################################
        function onclickNewEvents(Obj) {
            AddRowEvent(Obj.parentElement.parentElement.rowIndex + 1);
        }
        //################################################
        function onclickDeleteEvents(Obj) {
            if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                TblEvents.deleteRow(Obj.parentElement.parentElement.rowIndex);
                if (TblEvents.rows.length == 1) {
                    TblEvents.rows(0).cells(2).innerText = "";
                    TblEvents.rows(0).cells(2).innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' title='ايجاد' onclick='onclickNewEvents(this)' />";
                }
            }
        }
        //=====================================================
        function onclickShowConditions() {
            var Str = "";
            for (var i = 1; i < TblConditions.rows.length; i++) {
                var obj;
                if (TblConditions.rows(i).cells(5).firstChild != null)
                    Str = Str + TblConditions.rows(i).cells(5).firstChild[TblConditions.rows(i).cells(5).firstChild.selectedIndex].text;
                if (TblConditions.rows(i).cells(4).firstChild != null)
                    Str = Str + (TblConditions.rows(i).cells(4).firstChild.value == 0 ? "" : "(");
                if (TblConditions.rows(i).cells(3).firstChild != null)
                    Str = Str + TblConditions.rows(i).cells(3).firstChild[TblConditions.rows(i).cells(3).firstChild.selectedIndex].text;
                if (TblConditions.rows(i).cells(2).firstChild != null)
                    Str = Str + TblConditions.rows(i).cells(2).firstChild[TblConditions.rows(i).cells(2).firstChild.selectedIndex].text;
                if (TblConditions.rows(i).cells(1).firstChild != null)
                    Str = Str + TblConditions.rows(i).cells(1).firstChild.value;
                if (TblConditions.rows(i).cells(0).firstChild != null)
                    Str = Str + (TblConditions.rows(i).cells(0).firstChild.value == 0 ? "" : ")");
            }
            document.getElementById(MasterObj + "LblCondition").innerText = Str;
        }
        //=====================================================
        function OnClickBtnSave() {
        
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    </script>

</asp:Content>
