<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DetailStructure.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DetailStructure" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager> 

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        LastSelectedRow = null;
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            $get(MasterObj + "txtAlert").value = "";
                        }
                        if (StrVal == "Delete") {
                            $get(MasterObj + "txtCodeName").value=""
                            $get(MasterObj + "txtGrdCodeID").value = ""
                            $get(MasterObj + "txtCodeID").value = ""
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>
                </td>
        </tr>
        <tr>
            <td>
               
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td >
            <table><tr><td width="900px"  align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <div class="cssDiv" style="width: 100%; height: 370px;" align="center">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                        <asp:HiddenField  ID="txtMaxCodeID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click"  />
                    </Triggers>
                </asp:UpdatePanel></td>
                </tr>
                <tr><td>
                <HR class="CssHorizontalLine" style="WIDTH: 76.99%; HEIGHT: 2px" SIZE="2">
                </td></tr>
                <tr><td align="center" >
                <table><tr>
                <td>کد زير ساختار :</td>
                <td>
                <input type="text" id="txtCodeID" runat="server" class="TxtControlsReadOnly" 
                        disabled="disabled" />
                </td>
                <td align="left" style="width:150">نام زير ساختار:</td>
                <td> <input type="text" id="txtCodeName" runat="server" class="TxtControls" />
                </td>
                </tr></table>
                </td></tr>
                </table>
                <div style="display: none">
                        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtWithoutDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server"/>
        <input type="text" id="txtFlagAccess" runat="server"/>
                    <input type="text" runat="server" id="txtGrdSDate" />
                    <input type="text" runat="server" id="txtGrdEDate" /> 
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtGrdCodeID" runat="server" />
                    
                </div>
            </td>
        </tr>
</table>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Schedule/DetailStructure.js">
        
    </script>
</asp:Content>
