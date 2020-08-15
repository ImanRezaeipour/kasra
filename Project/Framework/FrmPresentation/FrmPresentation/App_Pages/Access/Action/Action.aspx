<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Action.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action.Action" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width:600px">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            نام فعاليت
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div>
                                        <select id="CmbActionName" runat="server" class="TxtControls" style="height: 300px;
                                            width: 150px" align="right" onchange="OnchangeCmbActionName()">
                                        </select>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 40px">
                        </td>
                        <td>
                            کد فعاليت
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div>
                                        <select id="CmbActionCode" runat="server" class="TxtControls" style="height: 300px;
                                            width: 150px" align="right" onchange="OnchangeCmbActionCode()">
                                        </select>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            زير سيستم
                        </td>
                        <td>
                            <select id="CmbSubSystem" runat="server" class="TxtControls" style="height: 300px;
                                width: 150px" align="right" onchange="OnchangeCmbSubSystem()">
                            </select>
                        </td>
                        <td style="width: 40px">
                        </td>
                        <td>
                            نام صفحه
                        </td>
                        <td>
                            <select id="CmbPageName" runat="server" class="TxtControls" style="height: 300px;
                                width: 150px" align="right">
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div style="height: 400px; width:600px; overflow: auto" align="center">
                                <cc2:KasraGrid ID="GrdAction" runat="server" OnRowDataBound="Grid_RowDataBound">
                                </cc2:KasraGrid>
                            </div>
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtMaxNumber" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtPageSize" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtActionID" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtXmlPageName" name="txtSessionID" runat="server" />
        <input type="text" id="txtSerchXml" name="txtSerchXml" runat="server" />
        <input type="text" id="txtSearchflag" name="txtSearchflag" runat="server" />
        <input type="text" id="txtSelectChk" runat="server" />
        <input type="text" id="txtSelectXml" runat="server" />
    </div>
    <script type="text/javascript" language="javascript">
        document.body.scroll = "no";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //---------------------------------------------------------------------------------
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //---------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //-------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    window.returnValue = "1"
                    SetMsg($get(MasterObj + "txtAlert").value);
                }
                else
                    alert($get(MasterObj + "txtAlert").value)
            }

            $get(MasterObj + "txtAlert").value = ""
            LastSelectedRow = null;
            LastSelectedRowClass = "";
        }
        //===============================================Paging=======================================
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
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //===============================================================================================
        function OnClickBtnFilter() {
            LoadInformation()
            $get(MasterObj + "txtSearchflag").value = "0"
            $get(MasterObj + "BtnSubmit").click();
        }
        //=============================================جستجو کردن ==================================================
        function OnClickBtnSearch() {
            LoadInformation()
            $get(MasterObj + "txtSearchflag").value = "1"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //=============================================نمايش همه======================
        function OnClickBtnShowAll() {
            ClearAll();
            OnClickBtnFilter();
        }
        //=======================================================================
        function ClearAll() {
            $get(MasterObj + "CmbActionCode").value = "0"
            $get(MasterObj + "CmbSubSystem").value = "0"
            $get(MasterObj + "CmbActionName").value = "0"
            $get(MasterObj + "CmbPageName").value = "0"
        }
        //===================================ايجاد=============================================
        function OnClickBtnNew() {
            var strUrl = 'ActionNew.aspx?ActionID=0'
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 250px;dialogWidth: 500px;center: Yes;help: no;status: no;")
            if (returnValue == "1")
                OnClickBtnFilter()
        }
        //------------------------------------------------آوردن کمبو صفحه ها بر اساس زیر ساخت------------------------------------------
        function OnchangeCmbSubSystem() {
            var OxmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            OxmlDoc.async = "false";
            OxmlDoc.loadXML($get(MasterObj + "txtXmlPageName").value);
            var xmlNodes;
            xmlNodes = OxmlDoc.documentElement.selectNodes("/AccessEntity/PageName[flag=" + $get(MasterObj + "CmbSubSystem").value + "]");
            $get(MasterObj + "CmbPageName").innerHTML = "";

            optionEl = document.createElement("OPTION")
            $get(MasterObj + "CmbPageName").options.add(optionEl);
            $get(MasterObj + "CmbPageName").all(0).innerText = "انتخاب نشده"
            $get(MasterObj + "CmbPageName").all(0).value = "0"

            for (var i = 0; i < xmlNodes.length; ++i) {
                optionEl = document.createElement("OPTION")
                $get(MasterObj + "CmbPageName").options.add(optionEl)
                $get(MasterObj + "CmbPageName").all(i + 1).innerText = xmlNodes.item(i).selectSingleNode('Title').text
                $get(MasterObj + "CmbPageName").all(i + 1).value = xmlNodes.item(i).selectSingleNode('val').text
            }
        }
        //------------------------------------------------------------------------------------
        function OnchangeCmbActionName() {
            $get(MasterObj + "CmbActionCode").value = $get(MasterObj + "CmbActionName").value
        }
        //--------------------------------------------------------------------------------
        function OnchangeCmbActionCode() {
            $get(MasterObj + "CmbActionName").value = $get(MasterObj + "CmbActionCode").value
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئن هستید ؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtActionID").value = LastSelectedRow.getAttribute("ID")
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
        //-----------------------------------------------------------------------
        function OnClickBtnEdit() {
            if (LastSelectedRow == null)
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
            else {
                var strUrl = 'ActionNew.aspx?ActionID=' + LastSelectedRow.getAttribute("ID")
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 250px;dialogWidth: 500px;center: Yes;help: no;status: no;")

                if (returnValue == "1")
                    OnClickBtnFilter()
            }
        }
        //=======================================================================
        function OndbClickGrd() {
            OnClickBtnEdit();
        }
        //-----------------------------------------------------------------------
        function LoadInformation() {
            var Str = "<Root>"
            Str = Str + "<tb>"
            Str = Str + "<CodeID>" + document.getElementById(MasterObj + "CmbActionCode").value + "</CodeID>"
            Str = Str + "<SubSysId>" + document.getElementById(MasterObj + "CmbSubSystem").value + "</SubSysId>"
            Str = Str + "<pageID>" + document.getElementById(MasterObj + "CmbPageName").value + "</pageID>"
            Str = Str + "</tb>"
            Str = Str + "</Root>"
            document.getElementById(MasterObj + "txtSerchXml").value = Str;
            $get(MasterObj + "txtSubmit").value = "Filter";
        }
    </script>
</asp:Content>
