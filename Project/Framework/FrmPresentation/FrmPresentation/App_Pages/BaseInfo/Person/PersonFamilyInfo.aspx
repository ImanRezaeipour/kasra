<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="PersonFamilyInfo.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.PersonFamilyInfo" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table style="width: 900px" align="right">
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="PersonFamilyInfo.aspx" PageID="111259" />
            </td>
        </tr>
        <tr style="height: 420px">
            <td id="tdGrid" align="center" valign="top" class="DivStyle">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdPersonFamily" runat="server" OnRowDataBound="GrdPersonFamily_RowDataBound">
                            </cc2:KasraGrid>
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtActive" name="txtActive" runat="server" />
       <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtpersonCode" name="txtpersonCode" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/BaseInfo/Person/PersonFamilyInfo.js" type="text/javascript"></script>
</asp:Content>
