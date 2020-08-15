<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="DefineDepartmentShift.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefineDepartmentShift" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <style type="text/css">
        .CssItemNewStyle
        {
            background-color: #DFE6EE;
        }
        .CssNewRow
        {
            background-color: #C7D0DF;
        }
        .CssSelectedRow
        {
            background-color: #FCDA94;
        }
    </style>
    <table width="100%" >
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي فيلتر</legend>
                    <table id="FilterTable" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                دوره :
                            </td>
                            <td>
                                <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                             <td>
                                محل جلسه :
                            </td>
                            <td>
                                <asp:DropDownList Width="150px" ID="CmbCardReaderNo" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td id="tdPerson">
                                <input id="RDPerson"  type="radio" name="RDFilter" checked value="0" />
                                پرسنلي :
                            </td>
                            <td>
                                <uc4:MultiPerson ID="MultiPerson" runat="server" />
                            </td>
                            <td >
                                <input id="RDGroup" type="radio" name="RDFilter" value="1" /> گروه :
                            </td>
                            <td>
                                <asp:DropDownList Width="120px" ID="CmbGroups" runat="server" class="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input id="RDDepartment"  type="radio" name="RDFilter" value="2" />
                                واحد سازماني :
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbDepartment" runat="server" />
                            </td>
                            
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar"  runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="display: none">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="txtClosePage" runat="server" />
                    <asp:HiddenField ID="txtWPID" runat="server" />
                </div>
                <div valign="top" align="right" id="GridViewCountainer" style=" width: 96%; height: 380px;
                    overflow: auto">
                    <table id="TblShift" cellpadding="0" cellspacing="0" style="border: thin inset #3399FF;" >
                        <tr style="height: 20px;" valign="top">
                            <td class="CssHeaderStyle" style="width: 70px" align="center">
                                 تاریخ
                            </td>
                            <td class="CssHeaderStyle" style="width: 70px" align="center">
                                 روز
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #2960d1;" align="center">
                                موظفي 1
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #a161cc;" align="center">
                                موظفي 2
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #2960d1;" align="center" valign="middle">
                                موظفي 3
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #a161cc;" align="center">
                                موظفي 4
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #2960d1;" align="center">
                                موظفي 5
                            </td>
                            <td class="CssHeaderStyle" style="width: 120px; background-color: #a161cc;" align="center" valign="middle">
                                موظفي 6
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID"
            runat="server" />
        <input type="text" runat="server" id="txtStructureID" />
        <input type="text" id="txtXmlPage" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtXmlGrid" name="txtXmlGrid" runat="server" />
           <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <div id="DivMovazafi">
            <label>
                از</label>
            <input id="txtSTime" type="text" value="00:00" class="TxtControls CssInsertNewItem CssTimeStyle"
                style="width: 38px; font-weight: bold;" />
            <label>
                تا</label>
            <input id="txtETime" type="text"  value="00:00" class="TxtControls CssInsertNewItem CssTimeStyle"
                style="width: 38px; font-weight: bold;" />
        </div>
    </div> 
    <script src="../../App_Utility/Scripts/Schedule/DefineDepartmentShift.js?1.1" type="text/javascript"></script>
</asp:Content>
