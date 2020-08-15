<%@ Page Title="---------------------------------------------------------------------مشخصات ترکيب کد------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CombineCodeNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CombineCodeNew" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            کد اول :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbGroupCode1" runat="server" />
                        </td>
                        <td>
                            کد دوم :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbGroupCode2" runat="server" />
                        </td>
                        <td>
                            نتيجه :
                        </td>
                        <td>
                            <uc2:ComboBox ID="cmbResultCode" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع روز :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbDayState" runat="server" Height="16px" Width="200px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شرح
                        </td>
                        <td colspan="3">
                            <asp:TextBox TextMode="MultiLine" ID="txtDesc" runat="server" class="TxtControls"
                                Style="width: 450px; height: 70px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
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
        <tr>
            <td>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id="txtCode1" runat="server" />
                    <input type="text" id="txtCode2" runat="server" />
                    <input type="text" id="txtResultCode" runat="server" />
                    <input type="text" id="txtCombineCodeID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
 <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/CombineCodeNew.js" type="text/javascript"></script>    
</asp:Content>
