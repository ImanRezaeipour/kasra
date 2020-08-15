<%@ Page Title="**-----------------------اولويت هاي فعال و غیرفعال----------------------**" 
Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ShowActiveScript.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ShowActiveScript" %>
<%@ Register src="~/App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
    <table style="width:350px">        
        <tr>
            <td >
                
                <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" />
                
            </td>
        </tr>
        <tr>
            <td align="center">
             <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                    scrollbar-base-color: #b0c4de; height: 320px" align="center">
                    <fieldset dir="rtl" style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 100%; HEIGHT: 300px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"><legend style="COLOR: #ff6699">اولويت های فعال وغیرفعال مربوط به اين مرحله</legend>
                   <%-- <div id="DivGrd">--%>
                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    <%--</div>--%>
                    </fieldset>
                </div>
                  <asp:HiddenField ID="txtGetPriority" runat="server" />
                    <asp:HiddenField ID="txtGetStepName" runat="server" />
                    <asp:HiddenField ID="txtScriptName" runat="server" />
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
         <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />       
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />        
        <input type="text" id="txtStepID" name="txtStepID" runat="server" />
     </div>
    <script language="javascript" type="text/javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        AddRow()
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        function OnClickBtnOk() {
            if (LastSelectedRow != null) {
                OndbClickGrd()
            }
            else {
                alert("یک اولویت را انتخاب کنید .")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            returnValue = LastSelectedRow.cells(2).innerText
            window.close();
        }
        //==============================================
        function AddRow() {
            if (document.getElementById("GrdActivePriority") != undefined) {
                if ($("#" + MasterObj + "txtGetPriority").val() != "") {
                    if (CheckISValidPriority()) {
                        $(GrdActivePriority).append(
                        "<tr class='CssItemStyle' >"
                        + "<td  align='right' style='width:190px'>" + $("#" + MasterObj + "txtGetStepName").val() + "</td> "
                        + "<td  align='right' style='width:190px'>" + $("#" + MasterObj + "txtGetPriority").val() + "</td> "
                        + "<td  align='right' style='width:200px'>" + $("#" + MasterObj + "txtScriptName").val() + "</td> "
                        + "</tr>"
                        )
                        $(GrdActivePriority).find("tr:eq(" + ($(GrdActivePriority).find("tr").length - 1) + ")").click(function () {
                            OnClickGrd(this)
                        });

                        $(GrdActivePriority).find("tr:eq(" + ($(GrdActivePriority).find("tr").length - 1) + ")").dblclick(function () {
                            OndbClickGrd(this)
                        });
                    }
                }
            }

        }
        //==============================
        function CheckISValidPriority() {
            var flag = true, i = 0;
            var OGrd = document.getElementById("GrdActivePriority")
            var Len = $(OGrd).find("tr").length;
            while (i < Len && flag) {
            if ($(OGrd).find("tr:eq(" + i + ")").find("td:eq(1)").text() == $("#" + MasterObj + "txtGetPriority").val())
                flag = false
            i++;
        }
        return flag;
        }
    </script>
</asp:Content>
