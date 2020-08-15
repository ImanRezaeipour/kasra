<%@ Page Title="ايجاد واحد" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="NewOrganChart.aspx.cs" Inherits="FrmPresentation.App_Pages.OrganizationChart.NewOrganChart" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table  align="center" class="DivStyle">
                <tr><td style="height:10px"></td></tr>
                    <tr>
                        <td>
                            نام واحد :
                        </td>
                        <td>
                            <input type="text" id="txtDepartmentName" class="TxtControls" runat="server" dir="rtl" style="width: 150px" />
                        </td>
                        <td style="width:10px"></td>
                        <td>
                            نام واحد مافوق :
                        </td>
                        <td>
                        <asp:DropDownList ID="CmbDepartmentParent" runat="server" class="TxtControls" Style="width: 150px">
                            </asp:DropDownList>
                            <input id="BtnSelectDepartment" class="HeaderStyle" onclick="OnclickBtnSelectDepartment()"
                                style="width: 25px; cursor: pointer; height: 22px" type="button" value="..."  /> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع واحد :
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbDepartmentType" runat="server" class="TxtControls" Style="width: 150px">
                            </asp:DropDownList>
                        </td>
                        <td style="width:10px"></td>
                        <td>
                            کد واحد :
                        </td>
                        <td style="text-align:right">
                            <input type="text" id="txtDepartmentCode" class="TxtControls" runat="server" style="width: 150px" 
                            onkeydown="OnKeyDownInt(this)"/>
                        </td>
                    </tr>
                     <tr><td style="height:10px"></td></tr>
                     <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                     <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="txtDepartmentID" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                     </tr>
                </table>
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
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtXMLDescription" name="txtXMLDescription" runat="server" />       
    </div>
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //-------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                if (document.getElementById(MasterObj + "txtSubmit").value == "Modify")
                    if ($get(MasterObj + "txtValidate").value != "1") {
                        alert($get(MasterObj + "txtAlert").value);
                    }
                    else
                        window.close();
                if (document.getElementById(MasterObj + "txtSubmit").value == "ModifyContinue") {
                    if ($get(MasterObj + "txtValidate").value != "1")
                        alert($get(MasterObj + "txtAlert").value);
                    else {
                        window.returnValue = "1";
                        SetMsg($get(MasterObj + "txtAlert").value);
                        NewTextBox()
                    }
                }
            }

            $get(MasterObj + "txtAlert").value = ""
        }
        //===========================Load Description====================
        if (document.getElementById(MasterObj + "txtDepartmentID").value != 0) {
            var str = $get(MasterObj + "txtXMLDescription").value

            if (str != "<OrganChartEntity></DepartmentDescription>" || str != "<OrganChartEntity/>") {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
                var XmlNode = oXmlDoc.documentElement.selectNodes("/OrganChartEntity/DepartmentDescription");
                if (XmlNode.length != 0) {
                    $get(MasterObj + "txtDepartmentName").value = XmlNode.item(0).selectSingleNode("Name").text.toString();
                    $get(MasterObj + "CmbDepartmentParent").value = XmlNode.item(0).selectSingleNode("ParentID").text.toString();
                    $get(MasterObj + "CmbDepartmentType").value = XmlNode.item(0).selectSingleNode("DepartmentType").text.toString();
                    $get(MasterObj + "txtDepartmentCode").value = XmlNode.item(0).selectSingleNode("DepartmentCode").text.toString();
                }
            }
        }
        //===============================================================================
        function OnclickBtnSelectDepartment() {
            var url = "SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
            returnValue = window.showModalDialog(encodeURI(url), "", "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no");
        }
        //========================================ذخیره==============================================
        function OnClickBtnSave() {
            if (CHECKISEMPTY()) {
                document.getElementById(MasterObj + "txtSubmit").value = "Modify"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //============================================================================================
        function CHECKISEMPTY() {
            if (document.getElementById(MasterObj + "txtDepartmentName").value == "") {
                alert("لطقا نام واحد را وارد کنيد")
                document.getElementById(MasterObj + "txtDepartmentName").focus();
                return false;
            }
            else
                if (document.getElementById(MasterObj + "CmbDepartmentParent").value == "0") {
                    alert("لطقا نام واحد مافوق را وارد کنيد")
                    document.getElementById(MasterObj + "CmbDepartmentParent").focus();
                    return false;
                }
                else
                    if (document.getElementById(MasterObj + "CmbDepartmentType").value == "0") {
                        alert("لطقا نوع واحد را وارد کنيد")
                        document.getElementById(MasterObj + "CmbDepartmentType").focus();
                        return false;
                    }
                    else
                        if (document.getElementById(MasterObj + "txtDepartmentCode").value == "") {
                            alert("لطقا کد واحد را وارد کنيد")
                            document.getElementById(MasterObj + "txtDepartmentCode").focus();
                            return false;
                        }
            return true;
        }
        //-----------------------------------------------------------------------
        function OnClickBtnSaveContinue() {
            if (CHECKISEMPTY()) {
                document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //=======================================================================
        function NewTextBox() {
            $get(MasterObj + "txtDepartmentName").value = "";
            $get(MasterObj + "CmbDepartmentParent").value = "0";
            $get(MasterObj + "CmbDepartmentType").value = "0";
            $get(MasterObj + "txtDepartmentCode").value = ""
        }
    </script>
</asp:Content>
