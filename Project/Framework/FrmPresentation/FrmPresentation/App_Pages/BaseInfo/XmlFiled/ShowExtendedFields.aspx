<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ShowExtendedFields.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.ShowExtendedFields" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <table class="style1">
        <tr>
            <td>
                ‰«„ Object:</td>
            <td>
                <input id="txtEntityName" type="text"  runat="server" class="TxtControls"/></td>
            <td>
                <input id="ChkTable" type="checkbox"  runat="server"/>Table</td>
            <td>
                <input id="ChkView" type="checkbox" runat="server"/>View</td>
                <td><img src="../../../App_Utility/Images/Icons/active_back.gif" onclick="onclickSearch()"/></td>
            <td>
                «‘Ì«¡ «‰ Œ«»Ì:
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <select id="CmbSelectedObject" style="width: 150px" class="TxtControls" runat="server" onchange="onchangeCmbSelectedObj()">
                            <option></option>
                        </select>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitNew" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>                                                
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />                           
                       
                        <div style="width: 330px; height: 391px;">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
    <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" /> 
        
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
             <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
         <cc1:mysecurity ID="OnLineUser" runat="server">
        </cc1:mysecurity> 
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />     
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /> 
         <asp:Button ID="BtnSubmitNew" runat="server" Text="BtnSubmitNew" OnClick="BtnSubmitNew_Click" />        
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server"  />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" /> 
         <input type="text" id="txtPageID" name="txtPageID" runat="server" />   
         <input type="text" id="txtLastName" name="txtLastName" runat="server" />   
                 
    </div>
     <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";        
             
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
                   
        }

        function EndRequestHandler(sender, args) {
                                            
             var StrVal = $get(MasterObj + "txtSubmit").value
             if (StrVal != "") {
                LastSelectedRow.className = LastSelectedRowClass;
                LastSelectedRow = "";   
                   
            }
            if ($get(MasterObj + "txtAlert").value != "") {
                SetMsg($get(MasterObj + "txtAlert").value)
                $get(MasterObj + "txtAlert").value = ""
            }
            $get(MasterObj + "txtSubmit").value = "";
        }
        //======================================================================
        function OndbClickGrd(SelectRow) {
            OnClickBtnEdit();
        }
        //######################################################
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtLastName").value = LastSelectedRow.cells(0).innerText;
            alert( document.getElementById(MasterObj + "txtLastName").value)
           }
           //========================================================================
           function onclickSearch() {
               document.getElementById(MasterObj + "txtSubmit").value = "FilterCms";
               document.getElementById(MasterObj + "BtnSubmitNew").click();
           }
           //##############################################################
           function OnClickBtnNew() {
               var url = "DefineExtendedFields.aspx?SessionID="+document.getElementById(MasterObj+"txtSessionID").value;
               window.showModalDialog(url, "", "dialogHeight: 400px;dialogWidth: 700px;center: Yes;help: no;status: no");
           }
           //##############################################################
           function OnClickBtnDelete() {
               if (LastSelectedRow != "" && LastSelectedRow != null) {
                   if (confirm("¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø")) {
                       document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                       document.getElementById(MasterObj + "BtnSubmit").click();
                   }
               }
               else alert("Ìò ›Ì·œ »—«Ì Õ–› «‰ Œ«» ò‰Ìœ");
           }
           //##############################################################
           function OnClickBtnEdit() {
               var url = "DefineExtendedFields.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
               window.showModalDialog(url, "", "dialogHeight: 400px;dialogWidth: 700px;center: Yes;help: no;status: no");           
           }
           //##############################################################
           function onchangeCmbSelectedObj() {
               document.getElementById(MasterObj + "txtSubmit").value = "Filter";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           //==============================================================
          </script>
           
</asp:Content>
