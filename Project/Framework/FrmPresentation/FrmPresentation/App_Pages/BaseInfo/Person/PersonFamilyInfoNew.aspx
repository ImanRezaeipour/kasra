<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="PersonFamilyInfoNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.PersonFamilyInfoNew" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <table>
        <tr>
            <td valign="top">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="PersonFamilyInfoNew.aspx" PageID="111260" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                نام :
                            </td>
                            <td>
                                <input type="text" id="txtName" name="txtName" style="width: 150px" class="TxtControls"
                                    runat="server" />
                            </td>
                            <td>
                                نام خانوادگی :
                            </td>
                            <td>
                                <input type="text" id="txtFamil" name="txtFamil" style="width: 150px" class="TxtControls"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                نسبت :
                            </td>
                            <td>
                                <asp:DropDownList Width="150px" ID="CmbRelation" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                تاریخ تولد :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalBirthDate" runat="server" />
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                جنسیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbSex" TabIndex="9" CssClass="TxtControls" runat="server"
                                    Width="150px">
                                </asp:DropDownList>
                            </td>
                            <td></td><td></td>
                        </tr>--%>
                        <tr>
                            <td>
                                تاریخ پایان اعتبار :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalValiDate" runat="server" />
                            </td>
                            <td>
                                وضعیت :
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            فعال
                                            <input id="RadioActiv" runat="server" type="radio" checked="true" />
                                        </td>
                                        <td>
                                            غیرفعال
                                            <input id="RadioDisActiv" runat="server" type="radio" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtXmlsave" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="txtAlert" runat="server" />
            <asp:HiddenField ID="txtValidate" runat="server" />
            <asp:HiddenField ID="txtID" runat="server" />
            <asp:HiddenField ID="txtRelation" runat="server" />
            <asp:HiddenField ID="txtBirthDate" runat="server" />
            <asp:HiddenField ID="txtValidDate" runat="server" />
            <asp:HiddenField ID="txtActiv" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
    <script src="../../../App_Utility/Scripts/BaseInfo/Person/PersonFamilyInfoNew.js"
        type="text/javascript"></script>
</asp:Content>
