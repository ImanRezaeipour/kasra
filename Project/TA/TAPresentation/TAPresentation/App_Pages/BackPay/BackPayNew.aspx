<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="BackPayNew.aspx.cs" AsyncTimeout="1800" Inherits="TAPresentation.App_Pages.BackPay.BackPayNew" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <table align="center" width="600px">
        <tr>
            <td align="center" colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="600px" class="TableStyle">
        <tr>
            <td>
                 نام ويرايش :
            </td>
            <td>
                 <input type="text" id="txtBPName" runat="server" class="TxtControls" />
            </td>
            <td>
                نام دوره :
            </td>
            <td>
                <asp:DropDownList runat="server" ID="CmbPeriod" Width="120px" CssClass="TxtControls">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                کد ها :
            </td>
            <td colspan="2">
                <input class="TxtControls" id="txtCodeSelector" runat="server" dir="rtl" type="text"
                    style="width: 375px;" disabled="disabled" />
            </td>
            <td>
                <input class='HeaderStyle' onclick='onclickbtnCodeSelector()' style='width: 25px;
                    cursor: pointer; height: 22px' id="BtnSelectCode" type='button' runat="server" value='...' title='انتخاب کد' />
            </td>
        </tr>
        <tr>
            <td>
                شرح :
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="TxtControls"
                    Height="50px" Width="96%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtBackID" name="txtBackID" runat="server" />
        <input type="text" id="txtReportCode" name="txtReportCode" runat="server" />
        <input type="text" id="txtCodeValue" name="txtCodeValue" runat="server" />
    </div>
 <script>
     var SaveNewFlag = 0;
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
                 SaveFlag = 1;
                 window.returnValue = SaveFlag;
                 if (SaveNewFlag == 1)
                     OnClickBtnNew();
                 else
                     window.close();
             }
         }
         $get(MasterObj + "txtSubmit").value = "";
         $get(MasterObj + "txtAlert").value = "";
         SaveNewFlag = 0;
     }
     //*******************************************************************
     function OnClickBtnSave() {
         if (chkIsEmpty()) {
             $get(MasterObj + "txtSubmit").value = "Modify";
             $get(MasterObj + "BtnSubmit").click();
         }
     }
     //*******************************************************************
     function chkIsEmpty() {
         if (document.getElementById(MasterObj + "txtBPName").value == "") {
             alert("لطفا نام ويرايش را وارد نماييد");
             $get(MasterObj + "txtBPName").focus();
         }
         else if (document.getElementById(MasterObj + "CmbPeriod").value == "0") {
             alert("لطفا دوره را انتخاب نماييد");
             $get(MasterObj + "CmbPeriod").focus();
         }
         else
             return true;
     }
     //*******************************************************************************
     function OnClickBtnNew() { 
         document.getElementById(MasterObj + "CmbPeriod").value = "0"
         document.getElementById(MasterObj + "txtBPName").value = ""
         document.getElementById(MasterObj + "txtDesc").value = ""
     }
     //*******************************************************************************
     function OnClickBtnSaveNew() {
         SaveNewFlag = 1;
         OnClickBtnSave();
     }
     //*******************************************************************************
     function onclickbtnCodeSelector() {
         var strUrl = "../BaseInfo/CodeSelector.aspx?"
            + "SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=MultiCode"
            + "&CodeVlue="; //;+ $get(MasterObj + "txtCodeValue").value

         var rValue = window.showModalDialog(encodeURI(strUrl), window, 'dialogHeight: 500px;dialogWidth:  750px;center: Yes;help: no;status: no;scroll: no;')

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
                 $get(MasterObj + "txtCodeValue").value = XmlNodes.item(0).selectSingleNode('ID').text;
             }
         }
     }
     //*******************************************************************************
 </script>
</asp:Content>

