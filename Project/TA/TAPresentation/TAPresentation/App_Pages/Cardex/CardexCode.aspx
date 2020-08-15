<%@ Page Title="جزییات کدها" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexCode.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            var elem = args.get_postBackElement();


        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            
        }
                                                               
    </script>
    <table >
        <tr>
            <td align="center"  >
                
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" >
                <table>
                    <tr>
                        
                        <td id="ttt" valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                       
                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                        <input type="text" id="txtCardexPeriodID" name="txtCardexPeriodID" runat="server" />
                                        <input type="text" id="txtKind" name="txtKind" runat="server" />
                                        
                                    </div>
                                    <div class="cssDiv" style="width: 100%; height: 370px;" align="center">
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
            </td>
        </tr>
    </table>
   
    <div style="display: none">
       
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
            <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        
    </div>

</asp:Content>
