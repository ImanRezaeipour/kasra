<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditPersonShow.aspx.cs" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" Inherits="TAPresentation.App_Pages.ModalReport.CreditPersonShow" ValidateRequest ="false" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<title></title>

    <table style="width: 95%; height: 100%;" align="center" >
        <tr>
            <td style="height: 36px; width: 937px;">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 33px; width: 937px" align="center">
                <table style="width: 82%">
                    <tr>
                        <td style="width: 101px">
                            <font color="#cc0000">شماره پرسنلي :</font></td>
                        <td style="width: 105px" id="TDPersonCode"  runat="server">
                            &nbsp;</td>
                        <td style="width: 122px">
                           <font color="#cc0000">نام و نام خانوادگي :</font></td>
                        <td id="TDPersonName" runat="server" align="center">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 937px; height: 261px;" align="center" valign="top" >
            <fieldset style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 100%; BORDER-BOTTOM: lightblue thin solid; height: 100%"><legend><FONT style="FONT-SIZE: 14px; COLOR: #FF66B3">مجـوزهـا</FONT></legend>
                            <asp:placeholder EnableViewState="false" id="ConfilictGridViewPlaceHolder" 
                                runat="Server"/>
                                </fieldset>
                        </td>
        </tr>
        <tr>
            <td style="width: 937px" align="center" valign="top">
            <fieldset style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 100%; BORDER-BOTTOM: lightblue thin solid; height: 100%"><legend><FONT style="FONT-SIZE: 14px; COLOR: #FF66B3">تــرددهـا</FONT></legend>
                            <asp:placeholder EnableViewState="false" id="InOutGridViewPlaceHolder" 
                                runat="Server"/>
                            </fieldset>    
                        </td>
        </tr>
    </table>
    
   <div style="display:none">
   <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />           
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
        <input type="text" id="txtGetCompanyFinatialPeriodID" runat="server" name="txtGetCompanyFinatialPeriodID />
        <input type="text" id="txtSessionID" runat="server" name="txtSessionID" />
        
   </div>
   
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
    <script language="javascript" type="text/javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        window.name = "CreditPersonShow"
        aspnetForm.target = "CreditPersonShow"

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
    </script>
</asp:Content>