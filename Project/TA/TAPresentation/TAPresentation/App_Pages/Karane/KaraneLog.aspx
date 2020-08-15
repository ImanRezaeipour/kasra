<%@ Page Title="------------------------------------------------------------------نمايش لاگ-------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneLog.aspx.cs" Inherits="TAPresentation.App_Pages.Karane.KaraneLog" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .DivStyle1
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:350px; 
            width:750px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
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
                        <div id="DivGrid" class="DivStyle1">
                            <cc2:KasraGrid ID="GrdKaraneLog" runat="server" OnRowDataBound="Grid_RowDataBound">
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
        <input type="text" id="txtReportID" name="txtReportID" runat="server" />
    </div>
   <script>
       var MasterObj = "ctl00_ContentPlaceHolder1_"
       //*************************************Declaration*************************************
       var LastSelectedRow = null;
       var LastSelectedRowClass = "";
       document.dir = "rtl";
       document.getElementsByTagName("body")[0].scroll = "no";

       var Ogrid = document.getElementById(MasterObj + "GrdKaraneLog");
       if (Ogrid) {
           for (var i = 1; i < Ogrid.rows.length; ++i) {
               if (Ogrid.rows[i].RowID == 1)
                   Ogrid.rows[i].style.display = "none";
               else
                   Ogrid.rows[i].style.display = "inline";
           }
       }
       //**************************************EndDeclaration*****************************************       
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

       function BeginRequestHandler(sender, args) {

       }
       //====================================================================================
       function EndRequestHandler(sender, args) {
           //---------------------------------------------------------------------------------
           var StrVal = $get(MasterObj + "txtSubmit").value
           if ($get(MasterObj + "txtAlert").value != "") {
               if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "")
                   alert($get(MasterObj + "txtAlert").value)
               else
                   SetMsg($get(MasterObj + "txtAlert").value);
           }

           $get(MasterObj + "txtSubmit").value = "";
           $get(MasterObj + "txtAlert").value = "";
           LastSelectedRow = null;
       }
       //===============================================Paging================================================
       function OnBlurtxtCurPage(obj) {
           if (obj.value != 0 && obj.value.replace(" ", "") != "") {
               document.getElementById(MasterObj + "txtCurPage").value = obj.value
               document.getElementById(MasterObj + "txtSubmit").value = "Const"
               document.getElementById(MasterObj + "BtnSubmit").click()
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnNext() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnLast() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnPrv() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnFirst() {
           document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
           document.getElementById(MasterObj + "BtnSubmit").click()
       }
       //--------------------------------------------------------------------------------------------
       function OnClickGrd(SelectedRow) {
           if (LastSelectedRow != null)
               LastSelectedRow.className = LastSelectedRowClass
           LastSelectedRowClass = SelectedRow.className
           LastSelectedRow = SelectedRow
           SelectedRow.className = "CssSelectedItemStyle"
       }
       //====================================================
       function OnClickCell0(obj) {
           var Ogrid = document.getElementById(MasterObj + "GrdKaraneLog");
           var SelectedRow = obj.parentElement.parentElement;

           if (SelectedRow.RowID == 0) {
               var i = SelectedRow.rowIndex + 1;
               var Flag = true; //                }
               while (i < Ogrid.rows.length && Flag) {
                   if (Ogrid.rows[i].RowID != 0) {
                       Ogrid.rows[i].style.display = Ogrid.rows[i].style.display == "inline" ? "none" : "inline";
                   }
                   else
                       Flag = false;
                   ++i;
               }
           }
       }
       //====================================================
   </script>
</asp:Content>




