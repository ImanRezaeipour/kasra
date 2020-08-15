<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="Tolerance.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.Tolerance" ValidateRequest="false"  %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset dir="rtl" class="fieldsetStyle" style="width: 695px;" align="middle">
        <legend class="legendStyle">پارامترهای جستجو</legend>
        <table>
            <tr>
                <td>
                    از تاريخ:
                </td>
                <td>
                    <uc3:KCalendar ID="KCalSDate" runat="server" />&nbsp;
                </td>
                <td>
                    تا تاريخ:
                </td>
                <td>
                    <uc3:KCalendar ID="KCalEDate" runat="server" />&nbsp;
                </td>
                <td>
                    ساختار:
                </td>
                <td>
                    <select id="cmbStructure" name="D1" runat="server" class="TxtControls" style="width: 110px">
                        <option></option>
                    </select>&nbsp;
                </td>
                <td>
                    نوع:
                </td>
                <td>
                    <select id="cmbType" name="D1" runat="server"  class="TxtControls" style="width: 100px">
                        <option></option>
                    </select>
                </td>
            </tr>
        </table>
    </fieldset>

     <table style="width: 700">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="Tolerance.aspx" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:kasragrid id="GrdTolerance" runat="server" OnRowDataBound="Grid_RowDataBound" >
                            </cc2:kasragrid>
                        </div>
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
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                      <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtDetailCollectionID" name="txtDetailCollectionID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
    document.body.scroll="no"
    </script>
    <script src="../../App_Utility/Scripts/Schedule/Tolerance.js" type="text/javascript"></script>
</asp:Content>
