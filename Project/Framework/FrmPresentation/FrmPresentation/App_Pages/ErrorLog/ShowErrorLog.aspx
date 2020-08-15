<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowErrorLog.aspx.cs" Inherits="FrmPresentation.App_Pages.ErrorLog.ShowErrorLog" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    //----------------------------------
    </script>

<table style="width: 892px">
        <tr>
            <td valign="top" align="center" >
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        
                        

                    }

                    function EndRequestHandler(sender, args) {

                        
                        LastSelectedRow = null;
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        
                        

                        $get(MasterObj + "txtSubmit").value = "";
                     

                        if (StrVal != "") {

                            if ($get(MasterObj + "lblTo").value == "") {
                                document.getElementById('OToolBar_txtFromData').value = "";
                                document.getElementById('OToolBar_txtToData').value = "";
                                document.getElementById('OToolBar_txtTotalData').value = "";

                                document.getElementById('OToolBar_BtnNext').disabled = true;
                                document.getElementById('OToolBar_BtnPrv').disabled = true;
                                document.getElementById('OToolBar_BtnFirst').disabled = true;
                                document.getElementById('OToolBar_BtnLast').disabled = true;
                            }
                            else if ($get(MasterObj + "lblTo").value != "") {
                                document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                                    document.getElementById('OToolBar_BtnNext').disabled = true
                                else
                                    document.getElementById('OToolBar_BtnNext').disabled = false;

                                if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                                    document.getElementById('OToolBar_BtnPrv').disabled = true
                                else
                                    document.getElementById('OToolBar_BtnPrv').disabled = false;

                                document.getElementById('OToolBar_BtnFirst').disabled = false;
                                document.getElementById('OToolBar_BtnLast').disabled = false;
                            }
                        }
                    } 
                   
                </script>
                
                
                <table style="width: 100%">
                    <tr>
                        <td style="width: 88px">آدرس کلاينت :</td>
                        <td style="width: 158px">
                        
                        <input id="txtClientIP" name="txtClientIP"  type="text" runat="server"
                            dir="ltr" style="width: 136px" /></td>
                        <td style="width: 95px">آدرس صفحه :</td>
                        <td style="width: 261px">
                        
                        <input id="txtPageUrl" name="txtPageUrl"  type="text" runat="server" 
                            dir="ltr" style="width: 255px" /></td>
                        <td style="width: 56px">تاريخ :</td>
                        <td style="width: 115px">
                                        <uc2:KCalendar ID="LogDate" runat="server" />
                                    </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" >
                <uc1:ToolBar ID="OToolBar" runat="server" 
                    PageName="ShowErrorLog.aspx" PageID="1135" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="height: 321px" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
                            
                    <ContentTemplate> 
                    
                        <div style="DISPLAY: none">
                            <asp:HiddenField ID="txtSDate" runat="server" />
                            <asp:HiddenField ID="txtEDate" runat="server" />
                      
                            <asp:HiddenField ID="txtActionAccessID" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            
                        </div>
                       
                        <asp:placeholder id="GridViewPlaceHolder" runat="Server"/>
                       
                    </ContentTemplate>
                    
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        
                    </Triggers>
        
                </asp:UpdatePanel> 
            </td>
        </tr>
        
</table>
   <div style="DISPLAY: none">
         <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
            <input type="text" id="SDate" name="SDate" runat="server" />
            <input type="text" id="EDate" name="EDate" runat="server" />
            <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
            <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server"  />
            <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
            <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server"/>
            <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server"/>
            <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
            <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
            <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server"  />
            <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server"  />
            <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" /> 
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
    
            
        </div>
  <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
 <script type="text/javascript" language="javascript">
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     var LastSelectedRow = null;
     var LastSelectedRowClass = "";
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     var lastPersonCode = "";
     var lastPersonCodeModify = "";
     ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     document.getElementById('OToolBar_BtnPrv').disabled = true;
     document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
     document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
     document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
     document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
     document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
     if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
         document.getElementById('OToolBar_BtnNext').disabled = true
     else
         document.getElementById('OToolBar_BtnNext').disabled = false;
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNext() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnPrv() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnBlurtxtCurPage() {

         document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

         var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
         if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
             if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                 document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
             }
             document.getElementById(MasterObj + "txtSubmit").value = "Const";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnLast() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnFirst() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
         document.getElementById(MasterObj + "BtnSubmit").click();
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
       
     function OnClickBtnFilter() {
        // document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
         LastSelectedRow = "";
         var LogDate = ""
         var str = ""
         str += "<Root><Tb>"
         str += "<ClientIP>" + document.getElementById(MasterObj + "txtClientIP").value + "</ClientIP>"
         str += "<PageUrl>" + document.getElementById(MasterObj + "txtPageUrl").value + "</PageUrl>"
         LogDate = $get(MasterObj + "LogDate_txtYear").value + "/" + $get(MasterObj + "LogDate_txtMonth").value + "/" + $get(MasterObj + "LogDate_txtDay").value
         if (LogDate == "//")
             LogDate=""
         str += "<LogDate>" + LogDate + "</LogDate>"
         str += "</Tb></Root>"

         document.getElementById(MasterObj + "txtSearch").value = str
         //-------------------
         $get(MasterObj + "txtSubmit").value = "Search";
         $get(MasterObj + "BtnSubmit").click();
     }
     //**********************************EndToolbar*************************************
    
              
 </script>
</asp:Content>

