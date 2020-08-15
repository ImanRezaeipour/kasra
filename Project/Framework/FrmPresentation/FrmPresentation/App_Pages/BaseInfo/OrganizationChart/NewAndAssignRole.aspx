<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAndAssignRole.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.NewAndAssignRole" ValidateRequest="false" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" %>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <link href="../../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet" />
 <script language="javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
 </script>
 <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
 <table scroll="no">
 
 <tr><td>
 
     <uc1:ToolBar ID="OToolBar" runat="server"/>
 
 </td></tr>
        <tr>
            <td  valign="top">
                <table>
                    
                    <tr>
                        <td>نوع سمت :</td>
                        <td>
                        
                            <asp:DropDownList ID="CmbRoleType" 
                                runat="server" Width="100px" CssClass="DropDownList">
                            </asp:DropDownList>
                                    </td>
                        <td>نام سمت :</td>
                        <td>
                        
                        
                        <input id="txtRoleTitle" name="txtRoleTitle" type="text" runat="server" 
                            dir="rtl" style="width: 60px" /></td>
                        <td>انتخاب نفرات :</td>
                        <td>
                           
                           
                            <img alt="انتخاب نفرات" id="BtnSelectPerson"   OnClick="OnClickBtnSelectPerson()" src="/FrmPresentation/App_Utility/Images/Icons/select.png"/></td>
                                                     
                    </tr>
                </table>
                <table align="center">
                    <tr>
                        <td align="center">
                         
                         <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></asp:ScriptManager>
                             <script type="text/javascript" language="javascript">
                                 var elem 
                                 Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                                 Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                                 function BeginRequestHandler(sender, args) 
                                 {
                                     elem = args.get_postBackElement();
                                     
                                 }

                                 function EndRequestHandler(sender, args) {
                                     
                                    
                                         if ($get(MasterObj + "txtAlert").value != "") {
                                             SetMsg($get(MasterObj + "txtAlert").value);
                                         }

                                         if (document.getElementById(MasterObj + "txtSubmit").value == "Modify") {


                                             $get(MasterObj + "txtSaveXml").value = ""
                                             $get(MasterObj + "txtReturnValue").value=""
                                         }

                                         document.getElementById(MasterObj + "txtSubmit").value=""
                                     
                                 }
                              </script>
                               
                            </td>
                    </tr>   
                    
                </table>
                
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <div style="DISPLAY: none">
                              <asp:HiddenField ID="txtDepartmentID" runat="server" />
                              <asp:HiddenField ID="txtAlert" runat="server" />
                              <asp:HiddenField ID="txtSubmit" runat="server" />
                              <input type="text" id="txtOnlineUserCode" name="txtOnlineUserCode" runat="server" />
                              <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                              <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
                              <input type="text" id="txtReturnValue" name="txtReturnValue" runat="server" />
                              <asp:HiddenField ID="txtSaveXml" runat="server" />
                         </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                
                
                <div style="DISPLAY:none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
 </table>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/BaseInfo/OrganizationChart/NewAndAssignRole.js">
        
        
        
    </script>
</asp:Content>