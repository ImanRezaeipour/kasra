<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="FrmPresentation.App_Pages.Login.NewUser" Title="Untitled Page" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 523px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
  <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
                <script type="text/javascript" language="javascript">
                var MasterObj = "ctl00_ContentPlaceHolder1_";
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        
                    }

                    function EndRequestHandler(sender, args) {
                     
                        
                        if ($get(MasterObj + "txtAlert").value != "") {
                            if ($get(MasterObj + "txtAlertStatus").value == "0") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                $get(MasterObj + "txtAlert").value = "";
                                $get(MasterObj + "txtAlertStatus").value = "";
                            }
                            if ($get(MasterObj + "txtAlertStatus").value == "1") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                $get(MasterObj + "txtAlert").value = "";
                                $get(MasterObj + "txtAlertStatus").value = "";
                            }
                            else {
                                //SetMsg($get(MasterObj + "txtAlert").value);
                                alert($get(MasterObj + "txtAlert").value);
                                $get(MasterObj + "txtAlert").value = "";
                                $get(MasterObj + "txtAlertStatus").value = "";
                            }
                        }
                    }
                 </script>


    <table class="style1" align="center">
         <tr>
                <td>
                    <table align="center">
                              <tr>
                                   <td>
                                         <uc1:ToolBar ID="OToolBar" runat="server"  PageName="NewUser.aspx" PageID="1148"  />
                                    </td>
                              </tr>
                    </table>
                </td>
         </tr>
         <tr>
                <td align="center">
                     <table align="center" width="350px">
                      
                        <tr>
                              
                        <td style="width:300px;">
                        
                         
                          
                            &nbsp;</td>
                              
                        <td width="1000">
                        
                         
                          
                            شماره پرسنلی :</td>
                              
                        <td>
                        
                         
                          
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                              <ContentTemplate>
                                  <input type="text" id="txtPersonCode" runat="server" style="width:110px" onkeydown="OnKeyDownInt(this)" onblur="OnBlurTxtPersonCode()" />
                        
                                
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>    
                         </asp:UpdatePanel>
                            </td>
                      </tr>
                      <tr>
                        <td>
                              </td>
                        <td>
                               نام :</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                              <ContentTemplate>
                                  <input type="text" id="txtPersonName" runat="server" style="width:110px" 
                                readonly="readonly" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>    
                         </asp:UpdatePanel>
                        </td>
                      </tr>
                          <tr>
                              
                        <td style="width: 300px;">
                            </td>
                              
                        <td>
                         نام کاربری :</td>
                              
                        <td>
                         <input type="text" id="txtUserName" runat="server" style="width:110px" />
                       
                            </td>
                    </tr>
                    <tr>
                        
                        <td dir="rtl" style="width: 300px;">
                            </td>
                        
                        <td dir="rtl">
                            کلمه عبور :</td>
                        
                        <td>
                        <input type="password" id="txtPassword" runat="server" style="width:110px" 
                                 />
                            
                        </td>
                        
                    </tr>
                    <tr>
                        
                        <td style="width: 300px;">
                            </td>
                        
                        <td>
                            تکرار کلمه عبور :</td>
                        
                        <td>
                            <input type="password" id="txtReapetPass" runat="server" style="width:110px" onblur="OnBlurTxtRepPass()" />
                            </td>
                    </tr>
                      <tr>
                        
                        <td valign="top" style="width: 300px;">
                            </td>
                        
                        <td valign="top">
                         توضيحات :</td>
                        
                        <td>
                         <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                           
                            </td>
                    </tr>
                 
                </table>
         </td>
         </tr>   
       
    </table>
<div style="display:none">
  <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click"/>
  <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
</div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField  ID="txtAlertStatus"  runat="server" />
            <asp:HiddenField  ID="txtAlert"  runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>    
    </asp:UpdatePanel>
    
<script language="javascript" type="text/javascript">

        var MasterObj = "ctl00_ContentPlaceHolder1_";

        function OnBlurTxtPersonCode() {
            $get(MasterObj + "txtSubmit").value = "Code";
            $get(MasterObj + "BtnSubmit").click();
        }
        function OnBlurTxtRepPass() {
            if ($get(MasterObj + "txtReapetPass").value != $get(MasterObj + "txtPassword").value) {
                alert("کلمه عبور مطابقت ندارد");
                $get(MasterObj + "txtReapetPass").value = "";
                $get(MasterObj + "txtReapetPass").focus();
            }
        }
        function OnClickBtnSave() {
            if ($get(MasterObj + "txtPersonCode").value == "")
                alert("وارد کردن شماره پرسنلی الزامی است");
            else if ($get(MasterObj + "txtDesc").value == "")
                alert("وارد کردن توضیحات الزامی است");
            else {
                $get(MasterObj + "txtSubmit").value = "Save";
                $get(MasterObj + "BtnSubmit").click();
               
            }
        }
        function OnClickBtnNew() {
            $get(MasterObj + "txtPersonCode").value = "";
            $get(MasterObj + "txtPersonName").value = "";
            $get(MasterObj + "txtUserName").value = "";
            $get(MasterObj + "txtPassword").value = "";
            $get(MasterObj + "txtReapetPass").value = "";
            $get(MasterObj + "txtDesc").value = "";
        }
        function OnClickBtnCancel(){
        window.close();
        }
   

</script>

</asp:Content>
