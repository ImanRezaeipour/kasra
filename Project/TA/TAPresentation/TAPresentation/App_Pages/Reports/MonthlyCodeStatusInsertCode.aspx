<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="MonthlyCodeStatusInsertCode.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.MonthlyCodeStatusInsertCode" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssHeader
        {
            background-image: url('../../App_Utility/Images/Icons/BGNewM.png');
            background-repeat: repeat-x;
            color: Black;
            font-weight: 550;
        }
        .CssCellsStyle
        {
            border: 1px groove #000000;
            background-color: #BBD1E8; /*-- background-image: url('../../App_Utility/Images/Icons/BGNew.png');

            background-repeat: repeat-x;--*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="500px">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 420px; height: 150px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">کدهای نمایشی </legend>
                    <div style="height: 150px">
                        <table id="TblHeader">
                        </table>
                        <table id="TblSymbol" style="width: 400px">
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 420px; height: 150px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                     <legend style="color: #78BED6">آيتم های سرجمع </legend>
                    <div style="height: 150px">
                        <table id="TblHeaderSum">
                        </table>
                        <table id="TblSum" style="width: 400px">
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="hidden" id="txtSessionID" runat="server" />
        <input type="hidden" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
         <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
         <input type="text" id="txtLoadPage" name="txtLoadPage" runat="server"  />
        <select class="TxtControls" style="width: 100px" id="CmbMainCode" runat="server">
        </select>
        <%--<asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />--%>
    </div>
    <script src="../../App_Utility/Scripts/Reports/MonthlyCodeStatusInsertCode.js" type="text/javascript"></script>
</asp:Content>
