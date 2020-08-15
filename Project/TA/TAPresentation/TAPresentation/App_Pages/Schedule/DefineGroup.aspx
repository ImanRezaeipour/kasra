<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineGroup.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DefineGroup"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .TblFilter
        {
            width:100%;
        }
    </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <table width="950px;" cellpadding="0" cellspacing="0">
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
                                نام گروه :
                            </td>
                            <td>
                                <input type="text" id="txtGroupName" style="width: 100px" class="TxtControls" />
                            </td>
                            <td>
                                نام مخفف :
                            </td>
                            <td>
                                <input type="text" id="txtAcronymName" style="width: 100px" class="TxtControls" />
                            </td>
                            <td>
                                دسته بندي :
                            </td>
                            <td>
                                <select id="CmbCategory" runat="server" style="width: 150px" class="TxtControls">
                                </select>
                            </td>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc1:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td id="TDCurrStatusFilter">
                                <input type="checkbox" runat="server" checked="checked" id="chkCurrStatus" />
                                عضويت در روز جاري
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <!-----------------------ToolBar------------------------------>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <!----------------------------------گرید------------------------->
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdGroup" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="GrdGroup_Sorting">
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
    <!------------------------------------------------------------->
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtBtnNew" name="txtBtnNew" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <!---------------Temp------------------------>
         <input type="text" id="txtTmpPersonCode" name="txtTmpPersonCode" runat="server" />
         <input type="text" id="txtTmpName" name="txtTmpName" runat="server" />
         <input type="text" id="txtTmpAcronym" name="txtTmpAcronym" runat="server" />
         <input type="text" id="txtTmpCategory" name="txtTmpCategory" runat="server" />
          <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Schedule/DefineGroup.js?v=3.6" type="text/javascript"></script>
</asp:Content>
