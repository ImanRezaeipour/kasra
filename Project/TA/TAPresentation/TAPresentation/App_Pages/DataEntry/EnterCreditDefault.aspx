<%@ Page Title="تنظيمات پيش فرض مجوزهاي قبل از وقوع " Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="EnterCreditDefault.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.EnterCreditDefault" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"  TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800"  runat="server">
    </asp:ScriptManager>
    <table>
       <tr>
            <td  align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle" align="center">
                            <cc2:KasraGrid ID="GrdEnterCreditDefault" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script>
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        //===============================================================
        win = window.dialogArguments
        window.name = "EnterCreditNew"
        aspnetForm.target = window.name

        document.body.style.overflowX = "hidden";
        document.body.style.overflowY = "hidden";
        //===============================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //===============================================================
        function OnClickBtnOk() {
            if (LastSelectedRow != null) {
                window.returnValue = LastSelectedRow.cells(0).innerText;
                window.close();
            }
            else
                alert("لطفا يک سطر از گريد را انتخاب نماييد");
        }
        //===============================================================
    </script>
</asp:Content>
