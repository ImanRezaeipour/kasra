<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="CategoryNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.CategoryNew" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>                         
    <table width="90%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <fieldset style="width:800px; height: 70px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                </font></legend>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                &nbsp; دسته بندي :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtCategoryName" style="width: 180px" class="TxtControls" />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                مخفف :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtAcronym" style="width: 180px" class="TxtControls" />
                                            </div>
                                        </td>
                                        <td>
                                            زیر سيستم :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbSubsystem" runat="server" Height="16px" Width="190px" value="0"
                                                CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: none">
                    <asp:HiddenField ID="txtValidate" runat="server" />
                    <asp:HiddenField ID="txtAlert" runat="server" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtCategoryID" name="txtCategoryID" runat="server" />
    </div>
 <script >
     var SaveFlag = 0;
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     document.body.scroll = "no";
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     function BeginRequestHandler(sender, args) {
     }
     function EndRequestHandler(sender, args) {
         try {

             var StrVal = $get(MasterObj + "txtSubmit").value
             if ($get(MasterObj + "txtAlert").value != "") {
                 if (($get(MasterObj + "txtValidate").value == "0"))
                     alert($get(MasterObj + "txtAlert").value);
                 else {
                     SetMsg($get(MasterObj + "txtAlert").value);
                     SaveFlag = 1;
                     window.returnValue = SaveFlag;
                     if ($get(MasterObj + "txtMode").value == "Script")
                         dialogArguments.OnClickBtnFilter();
                 }

             }
             $get(MasterObj + "txtSubmit").value = "";
             $get(MasterObj + "txtAlert").value = "";
             $get(MasterObj + "txtValidate").value = "";
         }
         catch (Exception) {
             alert("خطا در انجام عمليات");
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {
         document.getElementById(MasterObj + "txtCategoryID").value = "0";
         document.getElementById(MasterObj + "txtAcronym").value = "";
         document.getElementById(MasterObj + "txtCategoryName").value = "";
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {
         $get(MasterObj + "txtCategoryName").value = "";
         $get(MasterObj + "txtAcronym").value = "";
         $get(MasterObj + "CmbSubsystem").value = "0";
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSave() {
             if ($get(MasterObj + "txtCategoryName").value == "") {
                 alert("لطفا نام دسته بندي را وارد کنيد");
                 $get(MasterObj + "txtCategoryName").focus();
             }

             else if ($get(MasterObj + "txtAcronym").value == "") {
                 alert("لطفا مخفف را وارد کنيد");
                 $get(MasterObj + "txtAcronym").focus();
             }
             else if ($get(MasterObj + "CmbSubsystem").value == "0") {
                 alert("لطفا دسته بندي را وارد کنيد");
                 $get(MasterObj + "CmbSubsystem").focus();
             }
             else {
                 document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                 document.getElementById(MasterObj + "BtnSubmit").click();
             }
     }
     //================================================================

 </script>
</asp:Content>


