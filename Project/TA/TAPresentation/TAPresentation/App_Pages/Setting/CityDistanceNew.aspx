<%@ Page Title="---------------------------------------------------------------تعریف فاصله شهرها-----------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CityDistanceNew.aspx.cs" Inherits="TAPresentation.App_Pages.Setting.CityDistanceNew" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .TableStyle
        {
            border: medium groove #C0C0C0;
            background-color: #DBE3F0; 
            height:250px
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <table align="center" width="800px">
        <tr>
            <td align="center" colspan="6">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="800px"    class="TableStyle">
        <tr>
                <td>
                    شهر مبدا :
                </td>
                <td>
                    <uc4:ComboBox ID="CmbEraCity" runat="server" />
                </td>
                <td>
                    شهر مقصد :
                </td>
                <td>
                    <uc4:ComboBox ID="CmbDestinationCity" runat="server" />
                </td>
                <td>
                    فاصله :
                </td>
                <td>
                    <input type="text" runat="server" id="txtDistance" class="TxtControls" />
                </td>
        </tr>
        <tr>
        <td colspan="6" style="height:150px" ></td>
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
        <input type="text" id="txtDistanceID" name="txtDistanceID" runat="server" />
        <input type="text" id="txtEraCity" name="txtDestinactionCity" runat="server" />
        <input type="text" id="txtDestinationCity" name="txtDestinationCity" runat="server" />
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
            $get(MasterObj + "txtEraCity").value = $get(MasterObj + "CmbEraCity_txtCode").value;
            $get(MasterObj + "txtDestinationCity").value = $get(MasterObj + "CmbDestinationCity_txtCode").value;
            $get(MasterObj + "txtSubmit").value = "Modify";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    //*******************************************************************
    function chkIsEmpty() {
        if ($get(MasterObj + "CmbEraCity_txtCode").value == "") {
            alert("لطفا شهر مبدا را انتخاب نماييد");
            $get(MasterObj + "CmbEraCity_txtPCode").focus();
        }
        else if ($get(MasterObj + "CmbDestinationCity_txtCode").value == "") {
            alert("لطفا شهر مقصد را انتخاب نماييد");
            $get(MasterObj + "CmbDestinationCity_txtPCode").focus();
        }
        else if ($get(MasterObj + "txtDistance").value == "") {
            alert("لطفا فاصله را وارد نماييد");
            $get(MasterObj + "txtDistance").focus();
        }
        else
            return true;
    }
    //*******************************************************************************
    function OnClickBtnNew() {
        $get(MasterObj + "CmbEraCity_txtCode").value = ""
        $get(MasterObj + "CmbEraCity_txtPCode").value = ""
        $get(MasterObj + "CmbEraCity_txtName").value = ""
        $get(MasterObj + "CmbDestinationCity_txtCode").value = ""
        $get(MasterObj + "CmbDestinationCity_txtPCode").value = ""
        $get(MasterObj + "CmbDestinationCity_txtName").value = ""
        $get(MasterObj + "txtDistance").value = ""
        $get(MasterObj + "txtDistanceID").value = "0"
    }
    //*******************************************************************************
    function OnClickBtnSaveNew() {
        SaveNewFlag = 1;
        OnClickBtnSave();
    }

</script>
</asp:Content>
