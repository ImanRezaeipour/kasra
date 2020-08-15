<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="ShowExtendedFields.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.ShowExtendedFields" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .SubRow
        {
            background-color: #d5e1fd;
        }
        .OtherRow
        {
            background-color: OldLace;
        }
        .MasterRow
        {
            background-color: #ABBCDC;
        }
        .HideCell
        {
            background-color: #E3EFFF;
            border-right-color: #E3EFFF;
            border-right-width: 1px;
            border-right-style: solid ;
        }}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 750px">
    
        <tr>
            <td>
                <div align="left">
                    ‰«„ ‘ˆ„«:</div>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div align="right">
                            <select id="CmbSelectedObject" dir="ltr" style="width: 150px" class="TxtControls"
                                runat="server" onchange="onchangeCmbSelectedObj()">
                                <option></option>
                            </select></div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitNew" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <div style="width: 750px; height: 350px;" class="BlueScroll" >
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
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitNew" runat="server" Text="BtnSubmitNew" OnClick="BtnSubmitNew_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtLastName" name="txtLastName" runat="server" />
        <input type="text" id="txtLastParent" name="txtLastParent" runat="server" />
        <input type="text" id="txtSchamaName" name="txtSchamaName" runat="server" />
        <a href="../../../App_Utility/Images/Icons/Add.gif" id="Url"></a>
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";        
        //-----------------------------------------------------     
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //-----------------------------------------------------   
        function BeginRequestHandler(sender, args) {

        }
        //-----------------------------------------------------   
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
            OnClickBtnEditField();
        }
        //######################################################
        function OnClickGrd(SelectedRow) {
            if (SelectedRow.getAttribute("Parent") != 0 && SelectedRow.getAttribute("PParent") == 0) {
                if (LastSelectedRow != null) {
                    LastSelectedRow.className = LastSelectedRowClass;
                }
                LastSelectedRowClass = SelectedRow.className;
                LastSelectedRow = SelectedRow;
                SelectedRow.className = "CssSelectedItemStyle";
                document.getElementById(MasterObj + "txtSchamaName").value = LastSelectedRow.getAttribute("SchemaName");               
                document.getElementById(MasterObj + "txtLastParent").value = LastSelectedRow.ParentName;               
                document.getElementById(MasterObj + "txtLastName").value = LastSelectedRow.cells(3).innerText;
            }
        }
        //##############################################################
        function OnClickImgP(Obj) {
            var Ogrid = document.getElementById("GrdXmlFields");
            var Row = Obj.parentElement.parentElement;
            var OpenMode;
            Obj.src = Obj.src == document.getElementById("Url").href ? "../../../App_Utility/Images/Icons/Sub.gif" : document.getElementById("Url").href;
            OpenMode = Obj.src == document.getElementById("Url").href ? 0 : 1;
            
            var i = Row.rowIndex + 1;
            var Flag = true;
            while (i < Ogrid.rows.length && Flag) {
                if (Ogrid.rows(i).getAttribute("PParent") == 0 && Ogrid.rows(i).getAttribute("Parent") != 0) {
                    Ogrid.rows(i).style.display = Ogrid.rows(i).style.display == "inline" ? "none" : "inline";
                    if (Ogrid.rows(i).cells(1).firstChild != null)
                        OnClickImg(Ogrid.rows(i).cells(1).firstChild, 0);
                }
                else if (Ogrid.rows(i).getAttribute("PParent") == 0 && Ogrid.rows(i).getAttribute("Parent") == 0)
                     Flag = false; 
                                                        
               i++;       
           }
        }        
        //=================================================================
           function OnClickBtnNew() {
               var url = "DefineExtendedFields.aspx?SessionID="+document.getElementById(MasterObj+"txtSessionID").value+"&Mode=NewField";
              window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;center: Yes;help: no;status: no");
               
           }
           //##############################################################
           function OnClickBtnDelete() {
               if (LastSelectedRow != "" && LastSelectedRow != null) {
                   if (LastSelectedRow.Parent == 0 && LastSelectedRow.PParent == 0) {
                       if (confirm("¬Ì« »—«Ì Õ–› ò«„· ‘ˆ„« „ÿ„∆‰ Â” Ìœø")) {
                           document.getElementById(MasterObj + "txtSubmit").value = "DeleteSchema";
                           document.getElementById(MasterObj + "BtnSubmit").click();
                       } 
                   }
                   else 
                   if (confirm("¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø")) {
                       document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                       document.getElementById(MasterObj + "BtnSubmit").click();
                   }
               }
               else alert("Ìò ›Ì·œ »—«Ì Õ–› «‰ Œ«» ò‰Ìœ");
           }
           //##############################################################
           function OnClickBtnEditField() {
               if (LastSelectedRow != null && LastSelectedRow != "") {
                   var url = "DefineExtendedFields.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Name=" + document.getElementById(MasterObj + "txtLastName").value + "&SchemaName=" + document.getElementById(MasterObj + "txtSchamaName").value + "&Mode=Edit";

                   window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;center: Yes;help: no;status: no");
               }
               else alert("·ÿ›« Ìò ”ÿ— ê—Ìœ —« «‰ Œ«» ò‰Ìœ");
           }
           //##############################################################
           function onchangeCmbSelectedObj() {
               document.getElementById(MasterObj + "txtSubmit").value = "Filter";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           //==============================================================
           function OnClickBtnFilter() {     
                   document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                   document.getElementById(MasterObj + "BtnSubmit").click();      
           }
           //====================================================================
           function OnClickImg(obj, Sign) {
               var Ogrid = document.getElementById("GrdXmlFields");               
               var Row = obj.parentElement.parentElement;
               if (Sign != null)
                   obj.src = document.getElementById("Url").href;
               else
                   obj.src = obj.src == document.getElementById("Url").href ? "../../../App_Utility/Images/Icons/Sub.gif" : document.getElementById("Url").href;
               
               var i = Row.rowIndex + 1;
               var flag = true;
               while (i < Ogrid.rows.length && flag) {
                   if (Ogrid.rows(i).ID == Row.ID && Ogrid.rows(i).Parent != "0" && Ogrid.rows(i).PParent != "0") {
                       if (Sign != null)
                           Ogrid.rows(i).style.display = "none";
                           else
                               Ogrid.rows(i).style.display = Ogrid.rows(i).style.display == "none" ? "inline" : "none";                       
                   }
                   else flag = false;
                   i++;
               }

           }
           //======================================================================          
        function OnClickBtnNewSchema() {
            var url = "DefineExtendedFields.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value+"&Mode=NewSchema";
            var Result = window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;center: Yes;help: no;status: no");           
            if (Result == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "FilterCms";
                document.getElementById(MasterObj + "BtnSubmitNew").click();
            }
          
        }
        //=================================================================
        function OnClickBtnEvents() {
            var url = "DefineEvent.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value ;
            window.showModalDialog(url, "", "dialogHeight: 600px;dialogWidth: 850px;center: Yes;help: no;status: no");                      
        }
        //===============================================================        
    </script>

</asp:Content>
