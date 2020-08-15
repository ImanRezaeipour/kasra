<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TechnicalNote_New.aspx.cs" Inherits="FrmPresentation.App_Pages.Notes.TechnicalNote_New" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle"></legend>
                    <table align="right">
                        <tr>
                            <td  style ="direction:rtl" align="right">
                               عنوان :    
                            </td>
                            <td >
                                <input id="txtTitle" type="text" class="TxtControls" style="width: 120px" runat="server" />
                            </td>
                            <td style ="direction:rtl" align="right">
                                مجری :
                            </td>
                            <td>
                                <input id="txtDoer" type="text" class="TxtControls" style="width: 120px" runat="server" />
                            </td>

                        </tr>
                        <tr>
                            <td >
                                نام زیر سیستم :
                            </td>
                            <td>
                                <asp:DropDownList Width="115px" ID="CmbSubSystem" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td >
                                نام دسته بندی :
                            </td>
                            <td>
                                <asp:DropDownList Width="115px" ID="CmbGroup" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                درخواست کننده :
                            </td>
                            <td>
                                <input id="TxtRequester" type="text" class="TxtControls" style="width: 120px" runat="server" />
                            </td>
                            <td style ="direction:rtl">
                                تاریخ :
                            </td>
                            <td >
                             <input id="TxtDate" type="text" class="TxtControls" style="width: 120px;direction:ltr" runat="server" disabled="disabled" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                شرح درخواست :
                            </td>
                            <td colspan="3" style="text-align: right">
                                <textarea id="TxtRequest" cols="20" style="width: 400px; height: 60;" class="TxtControls"
                                    runat="server" rows="2"></textarea>
                            </td>
                            
                        </tr>
                        <tr>
                            <td >
                                شرح راه حل :
                            </td>
                            <td colspan="3" style="text-align: right;">
                                <textarea id="TxtSolution" cols="20" style="width: 400px; height:60;" class="TxtControls"
                                    runat="server" rows="2"></textarea>
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
       </div>
      <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="txtAlert" runat="server" />
            <asp:HiddenField ID="txtValidate" runat="server" />
            <asp:HiddenField ID="txtID" runat="server" />
         </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Note/TechnicalNote_New.js" type="text/javascript"></script>
</asp:Content>
