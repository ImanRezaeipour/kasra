<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DailyResult.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DailyResult"
    Title="-------------------------------------------------------------------------------------------------------------‰ «ÌÃ „Õ«”»«  —Ê“«‰Â--------------------------------------------------------------------------------------------------" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width:950px;
        }
        .style2
        {
            width: 1350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                  
                </script>

    <table>
        <tr>
            <td>
                <table align="right" class="style1">
                    <tr>
                        <td>
                            «“  «—ÌŒ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                             «  «—ÌŒ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td>
                            Å—”‰·Ì :
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                            ﬂœ :
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdDailyResult" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="Grd_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtWithoutDate" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtFlagAccess" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" runat="server" id="txtPersonCode" />
                    <input type="text" runat="server" id="txtCode" />
                </div>
            </td>
        </tr>
    </table>
 <script src="../../App_Utility/Scripts/Reports/DailyResult.js" type="text/javascript"></script>
</asp:Content>
