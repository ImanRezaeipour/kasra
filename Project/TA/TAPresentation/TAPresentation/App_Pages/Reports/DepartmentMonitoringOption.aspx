<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="DepartmentMonitoringOption.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DepartmentMonitoringOption" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
        </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td align="center">
                            واحد سازمانی :
                        </td>
                        <td>
                            <div align="center">
                                <uc1:ComboBox ID="cmbDepartment" runat="server" />
                            </div>
                        </td>
                        <td>
                            عنوان جلسه :
                        </td>
                        <td>
                            <input type="text" id="txtMeeting" style="width: 200px" class="TxtControls" runat="server" />
                        </td>
                        <td>
                            ساعت شروع جلسه :
                        </td>
                        <td>
                            <input id="txtTime" type="text" class="TxtControls" style="width: 50px;" runat="server"
                                onblur="Timechk(this)" value="00:00" onkeydown="OnKeyDownTime(this)" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <legend style="color: #3333CC">اطلاعات نمايشی</legend>
                                <table>
                                    <tr>
                                        <td style="width: 100px;display:none">
                                            <input type="checkbox" id="ChkImage" runat="server"  />
                                            عکس پرسنلی
                                        </td>
                                        <td style="width: 150px">
                                            <input type="checkbox" id="ChkPersonInfo" runat="server"  />
                                            مشخصات پرسنلی
                                        </td>
                                        <td style="width: 150px">
                                            <input type="checkbox" id="ChkAttendance" runat="server" />
                                            ترددهای ورود و خروج
                                        </td>
                                        <td>
                                            <input type="checkbox" id="ChkRole" runat="server" />
                                            سمت
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <fieldset dir="rtl" class="fieldsetStyle" align="top">
                                <legend style="color: #3333CC">تعيين حد نصاب افراد برای شروع جلسه</legend>
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <input type="checkbox" id="ChkShowNumber" runat="server" onclick="OnClickChkShowNumber(this)" />
                                            آيا می خواهيد تعداد افراد مورد نظر برای جلسه را تعيين کنيد؟
                                        </td>
                                        <td>
                                            ضريب :
                                        </td>
                                        <td>
                                            <input id="txtFactorOne" type="text" class="TxtControls" disabled="disabled" style="width: 50px;"
                                                runat="server" onkeydown="OnKeyDownInt(this)" />
                                            به
                                            <input id="txtFactortwo" type="text" class="TxtControls" disabled="disabled" style="width: 50px;"
                                                runat="server" onkeydown="OnKeyDownInt(this)" />
                                        </td>
                                    </tr>
                                    
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                    <input type="text" id="txtSave" name="txtSave" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/Reports/DepartmentMonitoringOption.js?v=1.1" type="text/javascript"></script>
</asp:Content>
