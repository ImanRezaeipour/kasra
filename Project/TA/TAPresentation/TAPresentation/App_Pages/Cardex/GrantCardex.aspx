<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="GrantCardex.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.GrantCardex" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .fieldsetStyle
        {
            width:1300px; 
            height: 60px; 
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6
        }
        .DropDownListStyle
        {
            font-weight:bold;
	        font-size: 8pt;
	        font-family: tahoma;
	        background-color: white;
	        border-color: lightsteelblue;
	        height :20px ;
	        width: 180px;
            display: none
        }
        .DivStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            height: 390px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table  >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="100%" align="center">
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                دوره کاردکس :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbCardexPeriod" runat="server" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                دوره کارکردي شروع :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbFromPeriod" runat="server" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                دوره کاردکردي خاتمه :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbToPeriod" runat="server" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                            <td>
                                کد اعطاء :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbCardexCode" runat="server" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td width="1300px" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center"  >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewCountainer" class="DivStyle">
                            <cc2:KasraGrid ID="GrdGrantCardex" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdGrantCardex_Sorting">
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
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtCardexPeriod" name="txtCardexPeriod" runat="server" />
        <input type="text" id="txtFromPeriod" name="txtFromPeriod" runat="server" />
        <input type="text" id="txtToPeriod" name="txtToPeriod" runat="server" />
        <input type="text" id="txtCardexCode" name="txtCardexCode" runat="server" />
        <input type="text" id="txtStaticCodeValueID" name="txtStaticCodeValueID" runat="server" />
        <input type="text" id="txtPeriod" name="txtPeriod" runat="server" />
        <input type="text" id="txtPCodeDel" name="txtPeriod" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Cardex/GrantCardex.js" type="text/javascript"></script>
</asp:Content>

