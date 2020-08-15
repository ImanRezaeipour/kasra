<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="CreditComissionReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.CreditComissionReport" %>

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
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                           ازتاريخ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                        </td>
                                        <td>
                                            <uc2:KCalendar ID="KCalendarHokmSDate" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            پرسنلي
                                         </td>
                                        <td>
                                             <uc3:MultiPerson ID="MultiPerson" runat="server" />
                                        </td>
                                          <td>
                                              <asp:Label runat="server" ID="Label1" Text="واحدسازمانيِ">
                                            </asp:Label>
                                            
                                        </td>
                                        <td>
                                            <uc3:MultiPerson ID="MultiDep" runat="server" />
                                        </td>
                                        <td>
                                            <input type="checkbox" id="chkPersChildren" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="LblPersChildren" Text="پرسنل زير مجموعه">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                              تا تاريخ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                        </td>
                                        <td>
                                            <uc2:KCalendar ID="KCalendarHokmEDate" runat="server" />
                                          
                                        </td>
                                        <td>
                                            گروه&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <uc3:MultiPerson ID="MultiGroup" runat="server" />
                                        </td>
                                       
                                        <td>
                                            از ساعت&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input class='TxtControls' onblur="Timechk(this)" style="width: 70px" name="txtSTime"
                                                id="txtSTime" runat="server" />
                                        </td>
                                        
                                        <td>
                                            تعداد روز ماموريت
                                        </td>
                                        <td>
                                            <input class='TxtControls' style="width: 70px" name="txtBetweenCredit" id="txtBetweenCredit"
                                                runat="server" onkeydown="OnKeyDownInt(this)"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            تاريِخ درخواست از
                                        </td>
                                        <td>
                                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                                        </td>
                                         <td>
                                            نوع مجوز<%--ComissionCode--%>
                                        </td>
                                        <td>
                                            <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 180px"
                                                class="TxtControls">
                                                <option></option>
                                            </select>
                                        </td>
                                        <td>
                                          &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp  تا ساعت&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input class='TxtControls' onblur="Timechk(this)" style="width: 70px" name="txtETime"
                                                id="txtETime" runat="server" />
                                        </td>
                                          <td>
                                             ش. حکم
                                        
                                        </td>
                                        <td>
                                            <input type="text" runat="server" id="txtSerialNo" class="TxtControls" onkeydown="OnKeyDownInt(this)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                               تاريِخ درخواست تا
                                        </td>
                                        <td>
                                           <uc2:KCalendar ID="KCalEDate" runat="server" /> 
                                        </td>
                                        <td>
                                            وضعيت سند<%--FlowStatus--%>
                                        </td>
                                        <td>
                                            <%--<asp:DropDownList runat="server" ID="CmbStatus" Style="width: 150px" class="TxtControls" />--%>
                                            <select id="CmbStatus" runat="server" name="CmbStatus" style="width: 180px" class="TxtControls">
                                                <option></option>
                                            </select>
                                        </td>
                                     
                                        
                                    </tr>
                                </table>
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
                        <div align="center" style="width: 100%; height: 300px;overflow: auto">
                            <asp:GridView ID="GrdComissionReport" Width="100%" Height="300px" runat="server"
                                AutoGenerateColumns="true" AlternatingRowStyle-BackColor="OldLace" HeaderStyle-Font-Size="8"
                                HeaderStyle-BackColor="#83AFE5" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Black"
                                HeaderStyle-Height="30px" AlternatingRowStyle-Font-Size="Small" >
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
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtPageNumber" name="txtPageNumber" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtHokmSDate" name="txtHokmSDate" runat="server" />
        <input type="text" id="txtHokmEDate" name="txtHokmEDate" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtMultiGroup" name="txtMultiGroup" runat="server" />
        <input type="text" id="txtMultiPerson" name="txtMultiPerson" runat="server" />
        <input type="text" id="txtMultiDepartment" name="txtMultiDepartment" runat="server" />
        <input type="text" id="txtChkChildren" name="txtChkChildren" runat="server" />
        
        <input type="text" id="txtMenuitem" name="txtMenuitem" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Reports/CreditComissionReport.js" type="text/javascript"></script>
</asp:Content>
