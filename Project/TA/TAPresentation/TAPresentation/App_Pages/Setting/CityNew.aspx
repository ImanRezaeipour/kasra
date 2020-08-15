<%@ Page Title="---------------------------------------تعريف شهر------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="CityNew.aspx.cs" Inherits="TAPresentation.App_Pages.Setting.CityNew" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0;
            height: 100px;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <table align="center">
        <tr>
            <td align="center" colspan="4" width="400px">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" class="TableStyle">
        <tr>
            <td>
                کد شهر :
            </td>
            <td>
                <input type="text" runat="server" id="txtCityCode" class="TxtControls" onkeydown="OnKeyDownIntCityCode()" />
            </td>
           
        </tr>
        <tr>
            <td>
                نام شهر :
            </td>
            <td>
                <input type="text" runat="server" id="txtCityName" class="TxtControls" />
            </td>
            <td>
                نام تابعه :
            </td>
            <td>
                <input type="text" runat="server" id="txtState" class="TxtControls" />
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
        <input type="text" id="txtCityID" name="txtDistanceID" runat="server" />
    </div>
    <script>
        var SaveNewFlag = 0;
        document.getElementsByTagName("body")[0].scroll = "no";
        //*******************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
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
            if ($get(MasterObj + "txtCityName").value == "") {
                alert("لطفا نام شهر  را وارد نماييد");
                $get(MasterObj + "txtCityName").focus();
            }
            else
                return true;
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            $get(MasterObj + "txtCityName").value = ""
            $get(MasterObj + "txtState").value = ""
            $get(MasterObj + "txtCityID").value = "0"
            $get(MasterObj + "txtCityCode").value = ""
        } 
        //*******************************************************************************
        function OnClickBtnSaveNew() {
            SaveNewFlag = 1;
            OnClickBtnSave();
        }
        //********************************************************************************
        function OnKeyDownIntCityCode() {
            var key = window.event.keyCode
            var key2 = window.event.shiftKey;

            window.event.returnValue =
		(
        (key <= 31 && (key >= 48 || key <= 57))
         || (key == 8) || (key == 9) || (key == 46) || (key == 16)
         || ((key >= 96) && (key <= 105))
         || ((key2 == false) && ((key <= 65) || (key >= 90)))

		)
        }
    </script>
</asp:Content>
