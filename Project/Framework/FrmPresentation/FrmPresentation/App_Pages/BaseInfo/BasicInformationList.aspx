<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="BasicInformationList.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.BasicInformationList" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table>
        <%--<ToolBar>--%>
        <tr>
            <td width="100%" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            کد آيتم :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <input type="text" id="txtItemCode" runat="server" class="TxtControls" disabled="true" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td class="style1">
                            نام آيتم :
                        </td>
                        <td>
                            <input type="text" id="txtItemName" runat="server" class="TxtControls" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام مخفف :
                        </td>
                        <td>
                            <input type="text" id="txtAcronymName" runat="server" class="TxtControls" onkeypress="return keyEnter(this,event)" />
                        </td>
                        <td class="style1">
                            <asp:CheckBox ID="ShowChk" runat="server" />
                            نمايشی
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtSystemID" runat="server" />
                        <asp:HiddenField ID="txtCategoryID" runat="server" />
                        
                        
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
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtCalSDate" runat="server" />
        <input type="text" id="txtCalEDate" runat="server" />
        <input type="text" id="txtSearchXML" runat="server" />
        <input type="text" id="txtCmbCreditType" runat="server" />
        <input type="text" id="txtXmlDesc" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" />
    </div>
    <script language="javascript" type="text/javascript">
        //====================================================کدهای javaScript==============================================
        var MasterObj = "ctl00_ContentPlaceHolder1_";
       // alert($get(MasterObj + "txtXmlDesc").value)
        //=====================================================تعریف متغیرها================================================
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.dir = "rtl";
        document.body.scroll = "no";
        //==================================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //==========================================Description===========================================================
        var str = $get(MasterObj + "txtXmlDesc").value

        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.loadXML(str);
        var XmlNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ItemCode");
        if ($get(MasterObj + "txtID").value != "0") {

            if (XmlNode.length != 0) {
                $get(MasterObj + "txtID").value = XmlNode.item(0).selectSingleNode("ID").text.toString();
                $get(MasterObj + "txtItemCode").value = XmlNode.item(0).selectSingleNode("CategoryGroupID").text.toString();
                $get(MasterObj + "txtItemName").value = XmlNode.item(0).selectSingleNode("Caption").text.toString();
                $get(MasterObj + "txtAcronymName").value = XmlNode.item(0).selectSingleNode("Acronym").text.toString();

                if (XmlNode.item(0).selectSingleNode("Viewable").text.toString() == "1")
                    $get(MasterObj + "ShowChk").checked = true;
                else
                    $get(MasterObj + "ShowChk").checked = false;
            }
        }
        else if ($get(MasterObj + "txtID").value == "0")
            $get(MasterObj + "txtItemCode").value = XmlNode.item(0).selectSingleNode("CategoryGroupID").text.toString();
        
       //===================================================================================
        function BeginRequestHandler(sender, args) {
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {

            if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                if ($get(MasterObj + "txtValidate").value != "1") {
                    
                    alert($get(MasterObj + "txtAlert").value);
                }
                else {
                    window.returnValue = "1";
                    window.close();
                }
            if (document.getElementById(MasterObj + "txtSubmit").value == "ModifyContinue") {
                if ($get(MasterObj + "txtValidate").value != "1")
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    OnClickBtnNewTextBox()
                    window.returnValue = "1";
                }
            }
            document.getElementById(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = ""
        }
        //=======================================================ذخیره============================
        function OnClickBtnSave() {

            if (document.getElementById(MasterObj + "txtItemName").value == "") {
                alert("نام آیتم مورد نظر را وارد کنيد")
                $get(MasterObj + "txtItemName").focus();
            }
            else if (document.getElementById(MasterObj + "txtAcronymName").value == "") {
                alert("نام مخفف را وارد کنيد ")
                $get(MasterObj + "txtAcronymName").focus();
            }
            
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //====================================================خالی کردن تکست باکسها============================

        function OnClickBtnNewTextBox() {
            $get(MasterObj + "txtID").value = 0;
            //            $get(MasterObj + "txtItemCode").value = parseInt($get(MasterObj + "txtItemCode").value) + 1;
            $get(MasterObj + "txtItemCode").value = parseInt($get(MasterObj + "txtCategoryID").value);
            $get(MasterObj + "txtItemName").value = ""
            $get(MasterObj + "txtAcronymName").value = ""
            $get(MasterObj + "ShowChk").checked = false
        }
        //=======================================================ذخیره و ادامه=====================
        function OnClickBtnSaveContinue() {

            if (document.getElementById(MasterObj + "txtItemName").value == "") {
                alert("نام آیتم مورد نظر را وارد کنيد")
                $get(MasterObj + "txtItemName").focus();
            }
            else if (document.getElementById(MasterObj + "txtAcronymName").value == "") {
                alert("نام مخفف را وارد کنيد ")
                $get(MasterObj + "txtAcronymName").focus();
            }

            else {
                document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
           
        
        //===========================================================================================

    </script>
</asp:Content>
