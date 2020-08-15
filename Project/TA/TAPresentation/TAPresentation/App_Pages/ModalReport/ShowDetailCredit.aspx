<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="ShowDetailCredit.aspx.cs"
    Inherits="TAPresentation.App_Pages.ModalReport.ShowDetailCredit" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
    </table>
    <table width="550px" border="1" class="BlackBorder">
        <tr id="trToolBar" runat="server">
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr id="TRBase" class="YellowTR">
            <td align="center">
                <table id="tblFixed" runat="server" style="height: 20px">
                    <tr>
                        <td align="right">
                            ‘„«—Â Å—”‰·Ì:
                        </td>
                        <td align="right">
                            <div style="width: 100px;" id="DivPCode" name="DivPCode" class="CssShowItems" runat="server">
                            </div>
                        </td>
                        <td align="right">
                            ‰«„ Å—”‰·:
                        </td>
                        <td align="right">
                            <div style="width: 120px" id="DivPName" name="DivPName" runat="server" class="CssShowItems">
                            </div>
                        </td>
                    </tr>
                    <tr id="TRInfo">
                        <td align="right">
                            ‰«„ òœ:
                        </td>
                        <td align="right">
                            <div style="width: 200px;" id="DivName" name="DivName" runat="server" class="CssShowItems">
                            </div>
                        </td>
                        <td align="right">
                            “„«‰:
                        </td>
                        <td>
                            <div style="width: 120px;" id="DivDate" runat="server" class="CssShowItems">
                            </div>
                        </td>
                    </tr>
                </table>
                <table id="tblFilter" runat="server" style="height: 20px">
                    <tr>
                        <td align="right">
                            Å—”‰·Ì:
                        </td>
                        <td align="right">
                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td align="right">
                            œÊ—Â:
                        </td>
                        <td>
                            <select id="CmbWP" runat="server" style="width: 150px" class="TxtControls">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            òœ:
                        </td>
                        <td align="right">
                            <uc2:ComboBox ID="CmbCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#b1cbe4">
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="Div1" runat="server" style="width: 550px; height: 400px;" align="center"
                            class="BlueScroll">
                            <br />
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            <asp:HiddenField ID="txtOnLineUser" runat="server" />
                            <asp:HiddenField ID="txtPersonCode" runat="server" />
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
        <input id="txtMenuItemID" name="txtMenuItemID" runat="server" />
        <input id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCodeGroupAcronym" name="txtCodeGroupAcronym" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="txtParent" runat="server" />
        <input type="text" id="txtWPID" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtGridID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSortExpression" name="txtSortExpression" runat="server" />
        <input type="text" id="txtCodeID" name="txtCodeID" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
    </div>

    <script src="../../App_Utility/Scripts/ModalReport/ShowDetailCredit.js" type="text/javascript"></script>

</asp:Content>
