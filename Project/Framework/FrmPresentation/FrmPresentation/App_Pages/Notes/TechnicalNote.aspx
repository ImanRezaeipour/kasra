<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TechnicalNote.aspx.cs" Inherits="FrmPresentation.App_Pages.Notes.TechnicalNote" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="100%">
        <tr>
            <td width="760px" align="center">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td  >
                <table width="85%" >
                    <tr>
                        <td style ="direction:rtl;width:10%" >
                            نام زیرسیستم :
                        </td>
                        <td style ="direction:rtl;width:20%">
                            <asp:DropDownList Width="135px" ID="CmbSubSystem" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td style ="direction:rtl;width:10%">
                            نام دسته بندی :
                        </td>
                        <td style ="direction:rtl;width:20%"">
                            <asp:DropDownList Width="135px" ID="CmbGroup" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td style ="direction:rtl;width:5%">
                            عنوان :
                        </td>
                        <td style ="direction:rtl;width:10%"">
                            <input id="txtTitle" type="text" class="TxtControls" style="width: 120px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style ="direction:rtl;width:10%">
                            از تاریخ :
                        </td>
                        <td style ="direction:rtl;width:20%">
                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td style ="direction:rtl;width:10%">
                            تا تاریخ :
                        </td>
                        <td style ="direction:rtl;width:20%">
                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td style ="direction:rtl;width:5%">
                            مجری :
                        </td>
                        <td style ="direction:rtl;width:10%"">
                            <input id="txtDoer" type="text" class="TxtControls" style="width: 120px" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtSortCondition" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewTechnicalNote">
                            <cc2:KasraGrid ID="GrdTechnicalNote" runat="server" OnRowDataBound="GrdTechnicalNote_RowDataBound"
                               OnSorting="GrdTechnicalNote_Sorting" AllowPaging="true" AllowSorting="true">
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
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTransferDeptID" name="txtTransferDeptID" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Note/TechnicalNote.js" type="text/javascript"></script>
</asp:Content>
