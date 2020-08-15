<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DifinitionActiveRptNew.aspx.cs" Inherits="FrmPresentation.App_Pages.PrintScreen.DifinitionActiveRptNew" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>
    
    <table >
    <tr><td>
        
        <uc1:ToolBar ID="OToolBar" runat="server" PageName="DifinitionActiveRptNew.aspx" />
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        
                    }

                    function EndRequestHandler(sender, args) {
                        
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>
    </td></tr>
   <tr><td>
   <table>
   <tr>
   <td align="right">نام روال</td>
   <td>
    <asp:DropDownList  ID="cmbStoredProc" runat="server"
                                Height="16px" Width="150px" value="0" CssClass="TxtControls">
                            </asp:DropDownList>
   </td>
   <td>نام گزارش
   </td>
    <td>
    <input type="text" id="txtReportName" runat="server" class="TxtControls" style="width:120px" />
    </td>
   <td>
   <input type="checkbox" id="chkIsTree" runat="server" />
   نمايش درخت واره</td>
   
   </tr>
   
   <tr >
   <td>شرح</td>
   <td colspan="4" >
   <input type="text" id="txtDesc" runat="server" class="TxtControls" style="width:450px" />
   </td>
   
   </tr>
   </table>
   
   </td></tr> 
   <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
   <tr>
            <td>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                   <input type="text" id="txtReportID" runat="server" />
                </div>
            </td>
        </tr>
   </table> 
   <script language="javascript" type="text/javascript">
       var MasterObj = "ctl00_ContentPlaceHolder1_";
      
       
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnCancel() {
           window.close()
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnNew() { 
           $get(MasterObj + "cmbStoredProc").value = "0"
           $get(MasterObj + "txtReportName").value = ""
           $get(MasterObj + "chkIsTree").checked = false
           $get(MasterObj + "txtDesc").value = ""
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnOk() {
           if (checkNotEmpty() == true) {
               var tree = 0
               if ($get(MasterObj + "chkIsTree").checked)
                   tree=1
               var strUrl = 'Columns_Grid.aspx?ReportID=0'
               + '&tree=' + tree
               + '&ReportName=' + $get(MasterObj + "txtReportName").value
               + '&SPName=' + $get(MasterObj + "cmbStoredProc").value
               + '&Desc=' + $get(MasterObj + "txtDesc").value
               + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
               + "&SessionID=" + $get(MasterObj + "txtSessionID").value

               strUrl = encodeURI(strUrl)
               var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 550px;dialogWidth: 650px;center: Yes;help: no;status: no')

               //MakeXML()
               //alert(document.getElementById(MasterObj + "txtXml").value)
               //alert(document.getElementById(MasterObj + "txtUpdateXml").value)
              document.getElementById(MasterObj + "txtSubmit").value = "Save";
              document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function MakeXML(){//cmbStoredProc  txtReportName chkIsTree txtDesc
           var XMLStr = "<Tb>"
           XMLStr = XMLStr + "<GroupCode1>" + document.getElementById(MasterObj + "cmbStoredProc").value + "</GroupCode1>"
           XMLStr = XMLStr + "<GroupCode2>" + document.getElementById(MasterObj + "txtReportName").value + "</GroupCode2>"
           XMLStr = XMLStr + "<ResultCode>" + document.getElementById(MasterObj + "cmbResultCode").value + "</ResultCode>"
           XMLStr = XMLStr + "<DayState>" + document.getElementById(MasterObj + "cmbDayState").value + "</DayState>"
           XMLStr = XMLStr + "<Desc>" + document.getElementById(MasterObj + "txtDesc").value + "</Desc>"
           XMLStr = XMLStr + "</Tb>"
           document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function checkNotEmpty() {
           if (document.getElementById(MasterObj + "cmbStoredProc").value == "0") {
               alert("لطفا نام روال را انتخاب نمائيد")
               document.getElementById(MasterObj + "cmbStoredProc").focus()
               return false;
           }
           else if (document.getElementById(MasterObj + "txtReportName").value == "") {
               alert("لطفا نام گزارش را وارد نمائيد")
               document.getElementById(MasterObj + "txtReportName").focus()
               return false;
           }
           return true;
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   </script>        
</asp:Content>
