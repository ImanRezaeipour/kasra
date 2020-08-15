<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="BackPayReport.aspx.cs" AsyncTimeout="7200" Inherits="TAPresentation.App_Pages.BackPay.BackPayReport" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="500px">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="7200">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="500px" class="TableStyle">
        <tr>
            <td>
                ويرايش 1 :
            </td>
            <td>
                <asp:DropDownList runat="server" ID="CmbBP1" Width="150px" CssClass="TxtControls">
                </asp:DropDownList>
            </td>
            <td>
                ويرايش 2 :
            </td>
            <td>
                <asp:DropDownList runat="server" ID="CmbBP2" Width="150px" CssClass="TxtControls">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                کد ها :
            </td>
            <td colspan="3">
                <input class="TxtControls" id="txtCodeSelector" runat="server" dir="rtl" type="text"
                    style="width:375px;" disabled="disabled" />
            </td>
            <td>
                <input class='HeaderStyle' onclick='onclickbtnCodeSelector()' style='width: 25px;
                    cursor: pointer; height: 22px' type='button' value='...' title='انتخاب کد' />
            </td>
            <td>
                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <contenttemplate>--%>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <%--     </contenttemplate>
                    <triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtBackID" name="txtBackID" runat="server" />
        <input type="text" id="txtReportCode" name="txtReportCode" runat="server" />
    </div>
    <script>
//        window.name = "BackPayReport.aspx";
        aspnetForm.target = "BackPayReport"
 
        var CodeValue, CodeNames, CodeNamesTitle;
        //*******************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
                    alert($get(MasterObj + "txtAlert").value)
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                }
            }
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
        }
        //*******************************************************************
        function OnClickBtnSendToExcel() {
            if ($get(MasterObj + "CmbBP1").value == "0") {
                alert("لطفا ويرايش اوليه را انتخاب نماييد");
                $get(MasterObj + "CmbBP1").focus();
            }
            else if ($get(MasterObj + "CmbBP2").value == "0") {
                alert("لطفا ويرايش ثانويه را انتخاب نماييد");
                $get(MasterObj + "CmbBP2").focus();
            }
            else if ($get(MasterObj + "CmbBP1").value == $get(MasterObj + "CmbBP2").value) {
                alert("ویرایش اولیه و ثانويه يکسان است");
            }
            else {
                $get(MasterObj + "txtSubmit").value = "SendToExcel";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        //*******************************************************************************
        function onclickbtnCodeSelector() {
            var strUrl = "../BaseInfo/CodeSelector.aspx?"
                + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode" + "&CodeVlue=" + CodeValue

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')

            if (rValue != null) {
                $get(MasterObj + "txtReportCode").value = rValue;
                LoadXMLCodeSelector(rValue)
                if (CodeNames.length > 50)
                    CodeNamesTitle = CodeNames.substr(0, 50) + '...';
                else
                    CodeNamesTitle = CodeNames;
                $get(MasterObj + "txtCodeSelector").value = CodeNamesTitle;
                $get(MasterObj + "txtCodeSelector").title = CodeNames;
            }
        }
        //*******************************************************************************
        function LoadXMLCodeSelector(rValue) {
            var strXml = rValue;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            if (oXmlDoc.documentElement != null) {
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (XmlNodes.length != 0) {
                    CodeNames = XmlNodes.item(0).selectSingleNode('Name').text;
                    CodeValue = XmlNodes.item(0).selectSingleNode('ID').text;
                 
                }
            }
        }
        //*******************************************************************************
    </script>
</asp:Content>


