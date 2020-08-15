<%@ Page Title="درباره&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="FrmPresentation.App_Pages.PageMain.About" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <img alt="شرکت مهندسی کسرا" src="../../app_Utility/Images/PageMain/Arm02.gif" dir="rtl" />
            </td>
            <td align="left">
                <div align="left">
                    <a href="http://www.kasrasoft.com">www.kasrasoft.com</a>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table align="center" id="tdKeySetting" runat="server">
                    <tr>
                        <td colspan="2">
                            <table align="center" id="tdKeyAlert" runat="server" style="display: none">
                                <tr>
                                    <td>
                                        <input type="text" runat="server" class="TxtControls" id="txtAlert" style="width: 400px;background-color:#f9f2a4"
                                            disabled="disabled" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset dir="rtl" class="fieldsetStyle">
                                <legend class="legendStyle">تنظیمات ماژول امنيتی </legend>
                                <table>
                                    <tr>
                                        <td align="right">
                                            تعدادپرسنل فعال :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtCountPrsKey" style="width: 100px"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            تعداد کاربر فعال :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtCountUsrKey" style="width: 100px"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            تعداد قوانين :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtCountScrKey" style="width: 100px"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            تعداد گزارش ها :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtCountRptKey" style="width: 100px"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <fieldset dir="rtl" class="fieldsetStyle">
                                <legend class="legendStyle">تعداد مجاز قابل تعريف</legend>
                                <table>
                                    <tr>
                                        <td>
                                            تعدادپرسنل مجاز :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtRemainPrs" style="width: 100px;"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تعداد کاربر مجاز :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtRemainUsr" style="width: 100px"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تعدادقوانين مجاز :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtRemainScr" style="width: 100px;"
                                                disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تعداد گزارش های مجاز :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" class="TxtControls" id="txtRemainRpt" style="width: 100px"
                                                disabled="disabled" />
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
            <td colspan="2" style="width: 415px">
                <cc2:KasraGrid ID="GrdAbout" runat="server">
                </cc2:KasraGrid>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <img alt="شرکت مهندسی کسرا" src="../../app_Utility/Images/PageMain/KasraEtime.png" />
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtPatchID" runat="server" />
        <input type="text" id="txtPatchCode" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
    </div>
</asp:Content>
