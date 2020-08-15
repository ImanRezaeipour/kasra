<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="GroupLog.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.GroupLog" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <table width="90%;" >
        <!------------------------------آیتم های جستجو---------------------------->
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table class="TblFilter">
                        <tr>
                            <td>
                                کاربر :
                            </td>
                            <td>
                                <uc1:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                از تاريخ :
                            </td>
                            <td>
                                <uc2:kcalendar id="KCalSDate" runat="server" />
                            </td>
                            <td>
                                گروه :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbGroup" name="CmbGroup" Width="142px" class="TxtControls"
                                 onkeypress="return KeySort(this,false)" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="button" onclick="OnClickBtnFilter()" value="فيلتر" style="border: thin groove #000080;
                                    width: 80px; background-color: #6AB5FF;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                نام سيستم :
                            </td>
                            <td>
                                <input type="text" id="txtSystemName" runat="server" class="TxtControls" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc2:kcalendar id="KCalEDate" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <!----------------------------------گرید------------------------->
        <tr>
            <td align="center" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridView" >
                            <cc2:KasraGrid ID="GrdGroupLog" runat="server" OnRowDataBound="Grid_RowDataBound">
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
    <!------------------------------------------------------------->
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <!---------------Temp------------------------>
         <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
          <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Schedule/GroupLog.js?v=1" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>
</asp:Content>
