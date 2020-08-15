<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Action.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/NewToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ToolBar/Shortkey.ascx" TagName="Shortkey" TagPrefix="uc2" %>
<asp:Content ID="ContentShortKey" ContentPlaceHolderID="ContentPlaceHolderShortKey" runat="Server">
 <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Access/Action.js">
   
  
         
         
     </script>
    <uc2:Shortkey ID="OShortkey" runat="server"  />
</asp:Content>
<asp:Content ID="ContentToolbar" ContentPlaceHolderID="ContentPlaceHolderToolbar" runat="Server">
<uc1:ToolBar ID="OToolBar" runat="server"  />
</asp:Content>
<asp:Content ID="Contenthead" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

</asp:Content>
<asp:Content ID="ContentSearch" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="Server">
&nbsp;
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <table>
        <tr>
            <td valign="top" align="right">
                <asp:ScriptManager ID="ScriptManager1" runat="server" >
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
//                        
                    }

                    function EndRequestHandler(sender, args) {
//                        

                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if (StrVal != "") {
                            LastSelectedRow = "";
                        }
                        if ($get(MasterObj + "txtAlert").value != "")
                            SetMsg($get(MasterObj + "txtAlert").value);
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtSubmit").value = "";


                        
                    }
                </script>

            </td>
        </tr>
        <tr><td id="tdName" runat="server"  style="color: #FF6699"> </td></tr>
       
        <tr>
            <td>
                <table>
                    <tr>
                        <td id="GrdTD" style="width: 750;height: 350" align="center" valign="top">
                        
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                            <fieldset  style="width: 360px; height: 300px; border-right: lightblue thin inset;
                                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                            >
                                            <legend style="color: #75A3D0">فعاليت ها</legend>
                                            <div style="width: 350px; height: 300px; overflow: auto;
                                                        scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                                        scrollbar-base-color: #b0c4de;" align="right">
                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" /> </div>
                                            </fieldset>
                                            </td>
                                            <td>
                                            <fieldset  style="width: 360px; height: 300px; border-right: lightblue thin inset;
                                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                            >
                                            <legend style="color: #75A3D0">کليدهاي ميانبر</legend>
                                            <div style="width: 350px; height: 300px; overflow: auto;
                                                        scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                                        scrollbar-base-color: #b0c4de;" align="right">
                                            <asp:PlaceHolder ID="GridViewPlaceHolder1" runat="Server" /> </div>
                                            </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtGroupAccessID" runat="server" />
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
                    <input type="text" id="txtSaveXml" runat="server" />
                    <input type="text" id="txtSaveXmlShortkey" runat="server" />
                    <input type="text" id="txtMenuID" runat="server" />
                    <input type="text" id="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>
    
</asp:Content>
