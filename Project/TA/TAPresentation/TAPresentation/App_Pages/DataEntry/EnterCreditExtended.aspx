<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" 
 ValidateRequest="false" EnableEventValidation="true"
AutoEventWireup="true" CodeBehind="EnterCreditExtended.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.EnterCreditExtended" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <table   class="DivStyle">
        <tr>
            <td id="TdToolbar">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" RenderMode="Block">
                    <ContentTemplate>
                        <div id="DivExtended" class="DivStyle1">
                            <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                            <asp:HiddenField ID="txtFirstTagName" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:mysecurity id="OnLineUser" runat="server">
        </cc1:mysecurity>
        <input type="text" id="txtExSaveXml" name="txtExSaveXml" runat="server" />
        <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Extended.js" type="text/javascript"></script>
    <script>
        document.getElementsByTagName("body")[0].scroll = "no";
        window.name = "EnterCreditExtended.aspx"
        aspnetForm.target = window.name
        if ($("#" + MasterObj + "txtCreditID").val() != "0")
            $('#TdToolbar').css("display", "none");
        //-----------------------------------------------------------------------
        function OnClickBtnOk() {
            if (SaveExtendedCode("txtExSaveXml")) {
                window.returnValue = $("#" + MasterObj + "txtExSaveXml").val();
                window.close();
            }
        }
        //-----------------------------------------------------------------------
        function window.onbeforeunload() {
            if (!SaveExtendedCode("txtExSaveXml")) {
                window.returnValue = false;
            }
        }
    </script>
</asp:Content>
