<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="BankBackup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.BankBackup"
    ValidateRequest="false" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
        #TextArea1
        {
            width: 315px;
        }
        .style2
        {
            width: 109px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <table style="width: 450px" align="center">
        
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center">
                                        <fieldset dir="rtl" style="width: 460px; height: 230px; border-right: lightblue thin solid;
                                            border-top: lightblue thin solid; border-left: lightblue thin solid; border-bottom: lightblue thin solid;"
                                            align="middle">
                                            <legend style="color: #75A3D0">آيتم هاي Backup</legend>
                                            <div>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td align="right" style="width: 123px">
                                                            <input id="txtAlert" type="hidden" runat="server" />
                                                            <input id="txtValidate" type="hidden" runat="server" />
                                                            <div align="right" style="width: 123px">
                                                                نام بانک:</div>
                                                        </td>
                                                        <td style="width: 150px">
                                                            <input id="txtBankName" class="TxtControls" type="text" style="width: 150px" runat="server" />
                                                        </td>
                                                        <td style="width: 200PX">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 123px">
                                                            <div align="right" style="width: 123px">
                                                                نوع Backup:</div>
                                                        </td>
                                                        <td style="width: 150px">
                                                            <select class="TxtControls" id="CmbTypeBK" name="D2" style="width: 150px" runat="server">
                                                                <option></option>
                                                            </select>
                                                        </td>
                                                        <td style="width: 200PX">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 123px">
                                                            <div align="right" style="width: 123px">
                                                                نوع فشرده سازي:</div>
                                                        </td>
                                                        <td style="width: 150px">
                                                            <select class="TxtControls" id="CmbTypeComp" name="D3" style="width: 150px" runat="server">
                                                                <option></option>
                                                            </select>
                                                        </td>
                                                        <td style="width: 200PX">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 123px">
                                                            <div align="right" style="width: 123px">
                                                                مسير:</div>
                                                        </td>
                                                        <td colspan="2" align="right">
                                                            <input id="txtPath" class="TxtControls" type="text" style="width: 100%" align="right" dir="ltr" runat="server" />
                                                            <input id="BtnGetPath" class="HeaderStyle" onclick="onClickBtnGetPath()" style="width: 25px;
                                                                cursor: pointer; height: 22px; display: none" type="button" value="..." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2" align="right">
                                                            <div style="width: 100%; color: #75A3D0" align="left">
                                                                براي مثال : D:\BackUp</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="right">
                                                        <td><div align="right">توضيحات:</div></td>
                                                        <td colspan="2"><textarea id="txtDesc" class="TxtControls" cols="20" rows="2" runat="server" style="width:100%"></textarea> </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <fieldset dir="rtl" style="width: 99%px; height: 65px; border-right: lightblue thin solid;
                                                                border-top: lightblue thin solid; border-left: lightblue thin solid; border-bottom: lightblue thin solid;"
                                                                align="middle">
                                                                <legend style="color: #75A3D0">شرح زمانبندي</legend>
                                                                <textarea id="txtAreaDesc" class="TxtControls" style="background-color: #DDEFF4; width: 100%; height: 57px"
                                                                    runat="server"></textarea>
                                                            </fieldset>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
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
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtScheduleID" name="txtScheduleID" runat="server" />
        <input type="text" id="txtXmlScheduleIDs" name="txtScheduleID" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.document.title = "تنظيمات Backup";
        
        window.returnValue = "0";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //============================================================
        function BeginRequestHandler(sender, args) {
            
        }
        //============================================================
        function EndRequestHandler(sender, args) {
            
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal != "") {
                if (StrVal == "Save" && $get(MasterObj + "txtValidate").value == "1") {
                    window.returnValue = "1";
                    OnClickBtnNew();                    
                }
                if ($get(MasterObj + "txtAlert").value != "")
                    SetMsg($get(MasterObj + "txtAlert").value);

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
            }
        }
        //============================================================
        function OnClickBtnSchedul() {
            var url;
            url = "../Scheduling/Scheduling.aspx?SchedulingID=0&Mode=BankBackup" + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value+"&XmlSchedule="+document.getElementById(MasterObj + "txtXmlScheduleIDs").value;
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:600px;dialogWidth: 900px;center: Yes;help: no;status: no")

            if (returnValue.split("#")[0]=="1") {
                document.getElementById(MasterObj + "txtXmlScheduleIDs").value = returnValue.split("#")[1];
                 }
                if (document.getElementById(MasterObj + "txtXmlScheduleIDs").value != "") {
                    document.getElementById(MasterObj + "txtSubmit").value = "Schedule";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
                else document.getElementById(MasterObj + "txtAreaDesc").value = "";
            }
        //====================================================================================
        function OnClickBtnSave() {             
            if (document.getElementById(MasterObj + "txtXmlScheduleIDs").value == "")
               alert("زمانبندی تعیین نشده است")
           else if (document.getElementById(MasterObj + "txtBankName").value == "")
                alert("نام بانک مورد نظر را وارد کنيد") 
            else  if( document.getElementById(MasterObj + "txtPath").value == "")
                alert("مسير مورد نظر را تایپ کنید ")
            else {
            //alert(document.getElementById(MasterObj + "CmbTypeBK").value )
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //=======================================================
        function onClickBtnGetPath() {
            document.getElementById(MasterObj + "txtPath").value = "F:\\New Folder (2)";
        }
        //========================================================
        function OnClickBtnCancel() {
            window.close();
        }
        //================================================
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtXmlScheduleIDs").value = "";
            document.getElementById(MasterObj + "txtAreaDesc").value = "";
            document.getElementById(MasterObj + "txtBankName").value = "";
            document.getElementById(MasterObj + "txtPath").value = "";
            document.getElementById(MasterObj + "txtDesc").value = "";
            document.getElementById(MasterObj + "CmbTypeBK").value = "1";
            document.getElementById(MasterObj + "CmbTypeComp").value = "1";
        }
    </script>

</asp:Content>
