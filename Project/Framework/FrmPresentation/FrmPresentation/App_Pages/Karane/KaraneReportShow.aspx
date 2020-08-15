<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="KaraneReportShow.aspx.cs" Inherits="FrmPresentation.App_Pages.Karane.KaraneReportShow" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table cellpadding="0" cellspacing="0" width="90%">
                        <tr>
                             <td>
                                آيتم کارانه 
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbKaraneRptName" runat="server" class="TxtControls" Style="width: 140px">
                                </asp:DropDownList>
                            </td>
                              <td align="right">
                                واحد سازمانيِ
                            </td>
                            <td>
                                <uc3:MultiPerson ID="MultiDep" runat="server" />
                            </td>
                            <td>
                                <input type="checkbox" id="chkPersChildren" runat="server" />
                            </td>
                            <td align="right" style ="width: 100px">
                             پرسنل زير مجموعه
                            </td>
                         
                        </tr>
                        <tr>
                             <td>
                                دوره 
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbWorkPeriod" runat="server" class="TxtControls" Style="width: 140px">
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                پرسنلي
                            </td>
                            <td>
                                <uc3:MultiPerson ID="MultiPerson" runat="server" />
                            </td>
                           
                            <td>
                                وضعيت 
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbKaraneStatus" runat="server" class="TxtControls" Style="width: 160px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <input type="text" id="TxtXmlHeaderEquipment" name="TxtXmlHeaderEquipment" runat="server" />
                        </div>
                        <div align="center" style="width: 100%; height: 300px; overflow: auto">
                            <asp:GridView ID="GrdKaraneReport" Width="100%" Height="300px" runat="server" AutoGenerateColumns="true"
                                AlternatingRowStyle-BackColor="OldLace" HeaderStyle-Font-Size="8" HeaderStyle-BackColor="#83AFE5"
                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Black" HeaderStyle-Height="30px"
                                AlternatingRowStyle-Font-Size="Small" >
                            </asp:GridView>
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtMultiPerson" name="txtMultiPerson" runat="server" />
        <input type="text" id="txtMultiDepartment" name="txtMultiDepartment" runat="server" />
        <input type="text" id="txtChkChildren" name="txtChkChildren" runat="server" />
        <input type="text" id="txtMenuitem" name="txtMenuitem" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Karane/KaraneReportShow.js" type="text/javascript"></script>
</asp:Content>
