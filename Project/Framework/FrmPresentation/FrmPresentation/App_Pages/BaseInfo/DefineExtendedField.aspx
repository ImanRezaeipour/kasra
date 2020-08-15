<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineExtendedField.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.DefineExtendedField" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        #Button1
        {
            width: 103px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<script type="text/javascript" language="javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    var LastSelectedRow = "";
    var LastSelectedRowClass = "";
    //-------------------------------------------------------------------------------
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {        
    }
    function EndRequestHandler(sender, args) {        
        if ($get(MasterObj + "txtAlert").value != "") {
            SetMsg($get(MasterObj + "txtAlert").value);
            $get(MasterObj + "txtAlert").value = "";
        }
        $get(MasterObj + "txtSubmit").value = "";  
    }
                </script>
    <table width="80%">
        <tr>
            <td>
                نام Object:
            </td>
            <td>
                <input id="txtObjectName" type="text" class="TxtControls" style="width: 150px" />
            </td>
            <td>
                نام Table:
            </td>
            <td>
                <input id="ChkTable" type="checkbox" />
            </td>            
            <td>
                نام View:
            </td>
            <td>
                <input id="ChkView" type="checkbox" />
            </td>            
        </tr>
        <tr>
            <td>
                شي انتخابي:
            </td>
            <td colspan="5" align="right">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <select id="CmbSelectEntity" name="CmbSelectEntity" class="TxtControls" style="width: 150px" runat="server">
                            <option></option>
                        </select>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td colspan="2">
                <input id="BtnSearch" type="button" value="لود داده ها"  onclick="onclickBtnSearch()"/></td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSearchflag" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server"  />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />        
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
       <input type="text" id="FlagTable" name="FlagTable" runat="server"  />  
        <input type="text" id="txtObjectNameTmp" name="txtObjectNameTmp" runat="server"  />       
         <input type="text" id="FlagView" name="FlagView" runat="server"  />        
    </div>
    <script language="javascript" type="text/javascript">
        //===============================================================    
        function onclickBtnSearch() {
            document.getElementById(MasterObj + "txtObjectNameTmp").value = document.getElementById("txtObjectName").value;
            document.getElementById(MasterObj + "FlagTable").value = document.getElementById("ChkTable").checked ? "1" : "0";
            document.getElementById(MasterObj + "FlagView").value = document.getElementById("ChkView").checked ? "1" : "0"; 
            document.getElementById(MasterObj + "txtSubmit").value = "FilterEntity";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //================================================================        
    </script>
</asp:Content>
