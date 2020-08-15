<%@ Page Title="ایجاد کاردکس" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexNew.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexNew" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/PersonComboBox/PersonComboBox.ascx" tagname="PersonComboBox" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>
<script src="../../App_Utility/Scripts/farsitype.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            var elem = args.get_postBackElement();


        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0 ) {
                    alert($get(MasterObj + "txtAlert").value)
                }
                else
                    SetMsg($get(MasterObj + "txtAlert").value)
                //alert("خطادرعملیات")
            }
            $get(MasterObj + "txtSubmit").value = "";
            window.returnValue = 1;      
            

        }
                                                               
    </script>
    <table>
        <tr>
            <td colspan="4" >
                
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1"/>
                
            </td>
        </tr>
        <tr>
            
            <td >نام کاردکس
            </td>
            <td >
                <input id="txtCardex" type="text" runat="server" class="TxtControls" lang="fa-IR"/></td>
        </tr>
        <tr>
            <td >
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="txtCardexID" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
        </table>
 <div style="display: none">
       
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
         <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
       
    </div>
    
    
    <script type="text/javascript" language="javascript">
        window.returnValue = '';
        function OnClickBtnCancel() {
            
            window.close()
        }
        function OnClickBtnSave() {
            if ($get(MasterObj + "txtCardex").value == "") {
                alert("لطفا اطلاعات را تکمیل نمایید")
                return
            }
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        
         </script>
</asp:Content>
