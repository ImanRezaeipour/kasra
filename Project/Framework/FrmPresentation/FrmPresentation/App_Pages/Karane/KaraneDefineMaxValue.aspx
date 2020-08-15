<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="KaraneDefineMaxValue.aspx.cs" Inherits="FrmPresentation.App_Pages.Karane.KaraneDefineMaxValue" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %> 
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width:700px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <table class="style1">
        <tr>
            <td colspan="2">
                مقدار پایه :
                <input id="Text1" type="text" style="width: 100px; background-color: #B7FFB7; text-align: center;
                    font-weight: bold" class="TxtControls" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>       
        <tr>
            <td style="text-align: center">
                <fieldset dir="rtl" style="width: 400px;height:400px; border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;" align="right">
                    <legend style="color: #78BED6">واحدهای سازماني</legend>
                    <div id="GridViewCountainer" class="DivStyle1" align="center" style="height:350px">
                            <cc2:KasraGrid ID="GrdKaraneValue" runat="server" 
                                OnRowDataBound="Grid_RowDataBound" AllowPaging="false">
                            </cc2:KasraGrid>
                        </div>
                        <hr />
                        باقیمانده
                         :
                </fieldset>
                
            </td>            
            <td align="center" style="vertical-align:top">
             <fieldset dir="rtl" style="width: 300px;height:400px; border-right: lightblue thin inset; border-top: #78BED6 thin solid;
                    border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;" align="right">
                    <legend style="color: #78BED6">اطلاعات </legend>
                    <table id="TblInformation" width="200px">
                        

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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />        
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var SumValue=0;
        function onfocusTxtVal(SelectedTxt) {
            $(SelectedTxt).select();
        }
        function onclickGridRow(SelectedRow) {
            $(".CssSelectedItemStyle").removeClass("CssSelectedItemStyle");
            LastSelectedRow = SelectedRow;
            $(LastSelectedRow).addClass("CssSelectedItemStyle");
            ShowInformationDept(SelectedRow);
        }
        function ShowInformationDept(Row) {
            $("#TblInformation").html("");
            $("#TblInformation").append("<tr><td colspan='2'>" + $(Row).find("td:eq(0)").text() + "</td></tr>");
            $("#TblInformation").append("<tr><td>تعداد پرسنل در واحد </td><td style='color:red;'>" + $(Row).attr("Count") + "</td></tr>");
            $("#TblInformation").append("<tr><td colspan='2'><hr/></td></tr>");
            $("#TblInformation").append("<tr><td>باقيمانده : </td><td style='color:red;'>"+SumValue+"</td></tr>");
        }
    </script>
</asp:Content>
