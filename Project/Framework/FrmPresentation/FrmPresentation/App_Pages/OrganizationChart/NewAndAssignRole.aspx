<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="NewAndAssignRole.aspx.cs" Inherits="FrmPresentation.App_Pages.OrganizationChart.NewAndAssignRole" %>
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
                <table align="center" class="DivStyle">
                    <tr>
                        <td style="height: 10px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع سمت :
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbRoleType" runat="server" class="TxtControls" Style="width: 150px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10px">
                        </td>
                        <td>
                            نام سمت :
                        </td>
                        <td>
                            <input type="text" id="txtRoleTitle" class="TxtControls" runat="server" style="width: 150px" />
                        </td>
                        <td style="width: 10px">
                        </td>
                        <td>
                            انتخاب نفرات :
                        </td>
                        <td>
                            <input id="BtnSelectPerson" class="HeaderStyle" onclick="OnclickBtnSelectPerson()"
                                style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 10px">
                        </td>
                    </tr>
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
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />  
        <input type="text" id="txtReturnValue" name="txtReturnValue" runat="server" />   
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
    </div>
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = '';
        var PersonStr = "";
        //=====================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //-------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //-------------------------------------------------------------------------------------
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
            $get(MasterObj + "txtSaveXml").value = ""
            $get(MasterObj + "txtReturnValue").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = ""
        }
        //=======================================باز شدن صفحه انتخاب پرسنل====================
        function OnclickBtnSelectPerson() {
            var url = "../BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&OnLineUser=" + $get(MasterObj + "txtOnlineUser").value
            var returnValue
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            $get(MasterObj + "txtReturnValue").value = returnValue
            }
        //===========================================ذخیره====================================
            function OnClickBtnSave() {
                //alert($get(MasterObj + "txtReturnValue").value)
                if (CHECKISEMPTY()) {
                    MakeXMLSave()
                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
        function CHECKISEMPTY() {
            PersonStr = $get(MasterObj + "txtReturnValue").value;

            if ($get(MasterObj + "CmbRoleType").value == "0") {
                alert("نوع سمت را انتخاب نمایید")
                $get(MasterObj + "CmbRoleType").focus;
                return false;
            }
            if ($get(MasterObj + "txtRoleTitle").value == "") {
                alert("نام سمت را انتخاب نمایید")
                $get(MasterObj + "txtRoleTitle").focus;
                return false;
            }

            if (PersonStr == "<UserEntity></UserEntity>" || PersonStr == undefined || PersonStr == "") {
                alert("پرسنلی انتخاب نشده است")
                return false;
            }
            else return true;
        }
        //=====================================================================================
        function OnClickBtnSaveContinue() {
            if (CHECKISEMPTY()) {
                MakeXMLSave()
                document.getElementById(MasterObj + "txtSubmit").value = "ModifyContinue"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //===================================================================================
        function NewTextBox() {
            $get(MasterObj + "CmbRoleType").value="0";
            $get(MasterObj + "txtRoleTitle").value = ""
            PersonStr = "";
        }
        //==================================================================================
        function MakeXMLSave() {
            if (PersonStr != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(PersonStr);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (oXmlNodes.length > 0) {

                    var x = 0;

                    for (; x < oXmlNodes.length; ++x) {
                        str += "<Tb>"
                        str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                        str += "<RoleType>" + $get(MasterObj + "CmbRoleType").value + "</RoleType>"
                        str += "<RoleTitle>" + $get(MasterObj + "txtRoleTitle").value + "</RoleTitle>"
                        str += "<PersonCode>" + oXmlNodes.item(x).selectSingleNode("PCode").text + "</PersonCode>"
                        str += "<RoleID>0</RoleID>"
                        str += "<Selected>1</Selected>"

                        str += "</Tb>"
                    }
                }
            }
            $get(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
        }
    </script>
</asp:Content>
