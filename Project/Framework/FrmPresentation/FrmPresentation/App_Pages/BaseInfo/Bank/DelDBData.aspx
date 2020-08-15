<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DelDBData.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.DelDBData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.CssBtn
{
    background-position:center;
	BACKGROUND-REPEAT: no-repeat;	
	BACKGROUND-COLOR: transparent;
	BORDER-RIGHT: #346fa4 2px solid; 
	BORDER-TOP: lightsteelblue 2px solid; 
	BORDER-LEFT: lightsteelblue 2px solid; 
	BORDER-BOTTOM: #346fa4 2px solid;  
	WIDTH: 65px;
	HEIGHT: 30px	
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

        }
        function EndRequestHandler(sender, args) {

            if ($get(MasterObj + "txtAlert").value != "") {
                alert(document.getElementById(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtSubmit").value = "";
        }
    </script>
    <div style="text-align:center;vertical-align:middle">
        <table align="center"  dir="rtl">
            <tr>
                <td>
                    <fieldset dir="rtl" style="height:100px; width:899px; border-right: lightblue thin solid; border-top: lightblue thin solid;
                        border-left: lightblue thin solid; border-bottom: lightblue thin solid;" align="middle">
                        <legend style="color: lightblue">انتخاب اسکريپت حذف ديتا</legend>
                        <table id="Table1" style="width:899px; height:100px;" cellpadding="0" align="center"
                            cellspacing="0">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="CmbScriptDelName" CssClass="TxtControls" runat="server" Width="350px" onchange="OnChangeCmbScript()" >
                                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                  به منظور حذف بانک يا ديتاي شماي مورد نظر يک مورد را انتخاب نماييد.
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
           
            <tr>
                <td colspan="2" align="center">
                    <table style="width: 94px" align="center">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <input id="BtnOK" name="BtnOK" type="button" onclick="onClickBtnOK()" style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/btnok.gif');
                                            cursor: pointer;" class="CssBtn" />
                                       <asp:HiddenField ID="txtAlert" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <input id="BtnCancel" onclick="onClickBtnCancel()" name="BtnCancel" type="button"
                                    style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/Cancel.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <div style="display:none">
    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    <asp:HiddenField ID="txtSubmit" runat="server" />
    <asp:HiddenField ID="txtFlag" runat="server" />
    
    </div>
    
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        window.name = "DelDBData.aspx"
        aspnetForm.target = "DelDBData.aspx"

        function onClickBtnOK() {
            if ($get(MasterObj + "CmbScriptDelName").value == "0")
                alert("برای حذف ديتاي بانک يک مورد را انتخاب نماييد");
            else {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
        }
        function onClickBtnCancel() {
           
        }
        function OnChangeCmbScript() {
            if (document.getElementById(MasterObj + "CmbScriptDelName").value == "1")
                document.getElementById(MasterObj + "txtSubmit").value = "Framework";
                
            if (document.getElementById(MasterObj + "CmbScriptDelName").value == "2")
                document.getElementById(MasterObj + "txtSubmit").value = "Att";
                
            if (document.getElementById(MasterObj + "CmbScriptDelName").value == "3")
                document.getElementById(MasterObj + "txtSubmit").value = "Rst";
        
        }
    </script>
</asp:Content>
