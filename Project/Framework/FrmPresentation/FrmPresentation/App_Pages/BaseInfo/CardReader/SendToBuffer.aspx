<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SendToBuffer.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.SendToBuffer" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        window.document.title = "تخلیه فوری"
        var MasterObj = "ctl00_ContentPlaceHolder1_";        
        
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
        }


        function EndRequestHandler(sender, args) {
            

            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "")
                SetMsg($get(MasterObj + "txtAlert").value);

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";


        }
    </script>

    <table>
    <tr><br /></tr>
        <tr>
            <td colspan="3">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr><td colspan="3"></td></tr>
       <tr><td colspan="3"></td></tr>
       <tr><td colspan="3"></td></tr>
       <tr><td colspan="3"></td></tr>
        <tr align="center" >
        
            <td align="left" >
                <input id="rdoOneCardReader" type="radio" name="CardReader" runat="server"/>
            </td>
            <td align="right" >
                شماره کارتخوان
                
            </td>
            <td>
                <select id="cmbCardReader" runat="server" style="width:100px">
                    <option></option>
                </select>
            </td>
        </tr>
        <tr align="center">
            <td align="left" >
                <input id="rdoTotalCardReader" type="radio" name="CardReader" runat="server"  />
            </td>
            <td colspan="2" align="right" >
                همه کارتخوان ها
            </td>
        </tr>
        
         <tr align="center">
        <td colspan="3">
            <table>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>                              
                                <asp:HiddenField ID="txtAlert" runat="server" />
                                <asp:HiddenField ID="txtSessionID" runat="server" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                            </Triggers>
                        </asp:UpdatePanel>                        
                        <div style="display: none">                            
                            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                            
                            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                            
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                            <%--<input type="text" id="txtFoodCenter" runat="server" value="" /> 
                                    <input type="text" id="txtKServeDate" runat="server" value="" />--%>
                            <%--<input type="text" id="txtAcCode" name="txtAcCode" runat="server" />--%>
                        </div>
                        &nbsp;
                    </td>
                </tr>
            </table>
            &nbsp;
        </td>
        
        
    </tr>
    
    
    </table>
   
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.getElementById(MasterObj + "rdoTotalCardReader").checked = true;
        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOk() {
            if (document.getElementById(MasterObj + "rdoOneCardReader").checked == true && document.getElementById(MasterObj + "cmbCardReader").value == 0)
                alert("لطفا نام کارتخوان را وارد نمایید");
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
     </script>
</asp:Content>
