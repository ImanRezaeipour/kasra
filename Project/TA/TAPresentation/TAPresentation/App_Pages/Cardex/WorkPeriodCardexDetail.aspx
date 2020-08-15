<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkPeriodCardexDetail.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.WorkPeriodCardexDetail" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    Title="-------------------------------------------------جزئيات كاردكس-----------------------------------------------------------------------------" 
    ValidateRequest ="false"%>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
     
    <div scroll="yes" style="width: 95%">
      <table class="style1">
            <tr>
            <td>
                &nbsp;</td>
            </tr>
                <tr>
                    <td>
                        <uc1:toolbar ID="OToolBar" runat="server" />
                        </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        <div style="display:none">
            
            <input type="text" id="SDate" name="SDate" runat="server" />
            <input type="text" id="EDate" name="EDate" runat="server" />
            <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
            <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
            <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtCardexPeriodID" name="txtCardexPeriodID" runat="server" />
            <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
            <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
            <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
            </div>
        <script language="javascript" type="text/javascript">
            /***********************************OnLoad************************************/
            window.name = "WorkPeriodCardexDetail"
            aspnetForm.target = "WorkPeriodCardexDetail"

            

            /***********************************OnLoad************************************/
            function OnClickBtnCancel() {
                window.close();
            }
        
        </script>
    </div>
</asp:Content>










