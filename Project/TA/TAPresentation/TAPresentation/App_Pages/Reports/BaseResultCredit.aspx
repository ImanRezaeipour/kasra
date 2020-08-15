<%@ Page Title="-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="BaseResultCredit.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.BaseResultCredit" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" >
    </asp:ScriptManager>


    <table>
        <tr>
            <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                scrollbar-base-color: #b0c4de; height: 100px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="DivGrd" runat="server" align="center" style="scrollbar-highlight-color: white;
                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de">
                            <div style="display: none">
                                <input id="txtAlert" runat="server" type="text" />
                                <input id="txtValidate" runat="server" type="text" />
                            </div>
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
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
        <input id="txtFinalCode" runat="server" type="text" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPersonID" name="txtXMLCredite" runat="server" />
        <input type="text" id="txtDate" name="txtXMLCredite" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtDelAccess" name="txtDelAccess" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
          <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
    </div>
<script language="javascript" type="text/javascript">
  
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
    }
    function EndRequestHandler(sender, args) {

    }
    function OnClickBtnFilter() {
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
 </script>       
</asp:Content>


