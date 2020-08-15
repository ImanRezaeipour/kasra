<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="LogRegInOut.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.LogRegInOut" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <script language="javascript" type="text/javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     document.body.scroll = "no";
     function BeginRequestHandler(sender, args) {
         document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
         $get(MasterObj + "txtAlert").value = "";
     }
     //====================================================================================
     function EndRequestHandler(sender, args) {

         document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";


         var StrVal = $get(MasterObj + "txtSubmit").value
         if ($get(MasterObj + "txtAlert").value != "") {
             if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "") {
                 alert($get(MasterObj + "txtAlert").value)
             }
             else
                 SetMsg($get(MasterObj + "txtAlert").value)

         }



         $get(MasterObj + "txtSubmit").value = "";
         $get(MasterObj + "txtAlert").value = "";


     }
    </script>
  
 <table>
    <tr>
         <td>
               از تاريخ :
         </td>
         <td>
             <uc3:KCalendar ID="KCalSDate" runat="server" />
         </td>
         <td align="right">
               تا تاريخ :
         </td>
         <td>
             <uc3:KCalendar ID="KCalEDate" runat="server" />
         </td>
     </tr>
    </table>
 
 <table  align="center" style="width: 424px">
        <tr>
            <td  width="760px" align="center">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="LogRegInOut.aspx" Paging="1" />

                <script language="javascript" type="text/javascript">
                </script>

            </td>
        </tr>
        <tr>
            <td align="center">
                <div style="width:600px" >
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                             <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtSDate" runat="server" />
                            <asp:HiddenField ID="txtEDate" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <div align="center" style="width: 100%; scrollbar-hightlight-color: white; overflow: auto;
                                scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF; height: 550px;">
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtID" name="txtID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
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
                    <input type="text" id="txtCodeID" runat="server" />
                    <input type="text" id="txtMainCategoryID" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtCodeSearch" name="txtCodeSearch" runat="server" />
                    <input type="text" id="txtCodeNameSearch" name="txtCodeNameSearch" runat="server" />
                    <input type="text" id="txtCodeStatusSearch" name="txtCodeStatusSearch" runat="server" />
                    <input type="text" id="txtCodeGroupType" name="txtCodeGroupType" runat="server" />
                    <input type="text" id="txtMenuPage" name="txtMenuPage" runat="server" />
                </div>
            </td>
        </tr>
    </table>
  
  
 <script type="text/javascript" language="javascript">

     var LastSelectedRow = null;
     var LastSelectedRowClass = "";
     var MasterObj = "ctl00_ContentPlaceHolder1_";
      
    //*************************************EndDeclaration*************************************

            
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
     function OnClickBtnIn() {
         var strUrl = "InOutReson.aspx?Flag=In"
         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:350px;center: Yes;help: no;status: no;scroll:no')

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnExit() {
         var strUrl = "InOutReson.aspx?Flag=Out"
         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:350px;center: Yes;help: no;status: no;scroll:no')

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnFilter() {

         document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
         document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

     document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        
         document.getElementById(MasterObj + "BtnSubmit").click();
     
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      </script>


</asp:Content>
