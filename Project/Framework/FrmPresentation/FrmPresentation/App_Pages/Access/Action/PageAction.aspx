<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="PageAction.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action.PageAction" %>

<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 700px">
        <tr>
            <td>
                <table style="width: 500px" align="right">
                    <tr>
                        <td>
                            زير سيستم :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbSubSystem" runat="server" Height="16px" Width="150px" CssClass="TxtControls"
                                onchange="OnChangeCmbSubSystem(this)" align="right">
                            </asp:DropDownList>
                        </td>
                        <td>
                            نام صفحه :
                        </td>
                        <td>
                            <select id="cmbPageNum" runat="server" class="TxtControls" 
                                style="height: 16px; width: 150px" align="right">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام فعاليت :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbActivityName" runat="server" Height="16px" Width="150px"
                                CssClass="TxtControls" onchange="OnChangeCmbActivityName(this)" align="right">
                            </asp:DropDownList>
                        </td>
                        <td>
                            کد فعاليت :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbActivityCode" runat="server" Height="16px" Width="150px"
                                CssClass="TxtControls" onchange="OnChangeCmbActivityCode(this)" align="right">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Toolbar--%>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <%-- KasraGrid--%>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 400px" align="right">
                            <cc2:KasraGrid ID="GrdPageAction" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtXMLDescription" name="txtXMLDescription" runat="server" />
        <input type="text" id="txtXmlSubSystem" name="txtXmlSubSystem" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtSearchXML" name="txtSearchXML" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.dir = "rtl"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //-------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    SetMsg($get(MasterObj + "txtAlert").value);
                }
                else
                    alert($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtAlert").value = ""
            LastSelectedRow = null;
            LastSelectedRowClass = "";
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
        //====================================================================================================
        function OnClickGrd(SelectedRow) 
        {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //====================================================================================================
        function OnClickBtnNew() {
            var strUrl = 'PageActionNew.aspx?ID=0'
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 500px;dialogWidth: 500px;center: Yes;help: no;status: no;")
              if (returnValue == "1")
                OnClickBtnFilter()
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnEdit() {
            if (LastSelectedRow == null)
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
            else {
                var strUrl = 'PageActionNew.aspx?ID=' + LastSelectedRow.getAttribute("PageID")
                        + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value

                returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 500px;dialogWidth: 500px;center: Yes;help: no;status: no;")
                 if (returnValue == "1")
                 OnClickBtnFilter()
            }
        }
        //----------------------------------------------------------------------------------------
        function OndbClickGrd() {
            OnClickBtnEdit()
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnFilter() {
            LoadInformation();
            $get(MasterObj + "txtSearchFlag").value = "0"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //----------------------------------------------------------------------------------------
        function OnClickBtnSearch() {
            LoadInformation();
            $get(MasterObj + "txtSearchFlag").value = "1"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //-----------------------------------------------------------------------------------------
        function LoadInformation() {
            var Str = " "
            Str = "<tb>"
            Str += "<SysID>" + $get(MasterObj + "cmbSubSystem").value + "</SysID>"
            Str += "<PageID>" + $get(MasterObj + "cmbPageNum").value + "</PageID>"
            Str += "<IDActivity>" + $get(MasterObj + "cmbActivityName").value + "</IDActivity>"
            Str +="</tb>"
            $get(MasterObj + "txtSearchXML").value = "<Root>" + Str + "</Root>";
            //alert($get(MasterObj + "txtSearchXML").value)
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
        }
        //-----------------------------------------------------------------------------------------
        function OnClickBtnShowAll() {
            OnClickBtnClear()
            OnClickBtnFilter()
        }
        //-----------------------------------------------------------------------------------------
        function OnClickBtnClear() {
            $get(MasterObj + "cmbActivityName").value = 0
            $get(MasterObj + "cmbActivityCode").value = 0
            $get(MasterObj + "cmbSubSystem").value = 0
            $get(MasterObj + "cmbPageNum").value = 0
            $get(MasterObj + "txtID").value = "0"
        }
        //-----------------------------------------------------------------------------------------
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئن هستید ؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("PageID")
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
        //=============================================Filter Cmb====================================================
        function OnChangeCmbActivityName(obj) {
            $get(MasterObj + "cmbActivityCode").value = $get(MasterObj + "cmbActivityName").value
        }
        //--------------------------------------------------------------------------------------------
        function OnChangeCmbActivityCode(obj) {
            $get(MasterObj + "cmbActivityName").value = $get(MasterObj + "cmbActivityCode").value
        }
        //--------------------------------------------------------------------------------------------
        function OnChangeCmbSubSystem(obj){
            var strXml = $get(MasterObj + "txtXmlSubSystem").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //alert(oXmlDoc.xml)
            var XmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageName[flag=" + $get(MasterObj + "cmbSubSystem").value + "]");

            if (XmlNodes.length != 0) {
                $get(MasterObj + "cmbPageNum").innerHTML = "";
                optionEl = document.createElement("OPTION");
                $get(MasterObj + "cmbPageNum").options.add(optionEl);
                $get(MasterObj + "cmbPageNum").all(0).innerText = "انتخاب نشده"
                $get(MasterObj + "cmbPageNum").all(0).value = "0"
                for (var i = 0; i < XmlNodes.length; i++) {
                    optionEl = document.createElement("OPTION");
                    $get(MasterObj + "cmbPageNum").options.add(optionEl)
                    $get(MasterObj + "cmbPageNum").all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text
                    $get(MasterObj + "cmbPageNum").all(i + 1).value = XmlNodes.item(i).selectSingleNode('val').text
                }
            }
        }
    </script>
</asp:Content>
