<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="PageAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.PageAccess" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/NewToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ToolBar/Shortkey.ascx" TagName="Shortkey" TagPrefix="uc2" %>
<%@ Register assembly="ComponentArt.Web.UI" namespace="ComponentArt.Web.UI" tagprefix="ComponentArt" %>
<asp:Content ID="Contenthead" ContentPlaceHolderID="head" runat="server">
<script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Access/PageAccess.js">
    
 
    
    </script>
</asp:Content>
<asp:Content ID="ContentShortKey" ContentPlaceHolderID="ContentPlaceHolderShortKey" runat="Server">
<uc2:Shortkey ID="OShortkey" runat="server"  />
</asp:Content>
<asp:Content ID="ContentToolbar" ContentPlaceHolderID="ContentPlaceHolderToolbar" runat="Server">
<uc1:ToolBar ID="OToolBar" runat="server"  />
</asp:Content>
<asp:Content ID="ContentSearch" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="Server">
&nbsp;
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" >
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
//            

        }

        function EndRequestHandler(sender, args) {
//            

            var StrVal = $get(MasterObj + "txtSubmit").value
            $get(MasterObj + "txtAlert").value = StrVal
            
        }
    </script>

    <table>
    <tr><td id="tdName" runat="server"  style="color: #FF6699"> </td></tr>
        
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                     <div style="width: 240px; height: 80%; overflow: auto;
                                                        scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                                        scrollbar-base-color: #b0c4de;" align="right">
                        <ComponentArt:TreeView ID="TVMenu" runat="server" AutoPostBackOnNodeCheckChanged="True"
                            BackColor="Transparent" ExpandSinglePath="True" Height="450px" LineImagesFolderUrl="../../App_Utility/Images/TreeViewLine/"
                            ShowLines="True" Width="350px" DefaultImageHeight="10" DefaultImageWidth="13"
                            HoverNodeCssClass="TreeNodeMouseOver" LineImageHeight="20" LineImageWidth="20"
                            NodeCssClass="TreeNode" SelectedNodeCssClass="TreeNodeSelected" OnNodeCheckChanged="TVMenu_NodeCheckChanged">
                            <ClientEvents>
      <NodeSelect EventHandler="TreeView1_OnNodeSelect" />
    </ClientEvents>
                        </ComponentArt:TreeView>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                        <asp:HiddenField ID="txtGroupAccessID" runat="server" />
                        <asp:HiddenField ID="txtTreeXml" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" runat="server" />
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>
    
</asp:Content>
