<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ReDefineUser.aspx.cs" Inherits="FrmPresentation.ReDefineUser" %>
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
	WIDTH: 70px;
	HEIGHT: 40px	
}

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            
           
        }

        function EndRequestHandler(sender, args) {
            switch (document.getElementById(MasterObj + "Active").value) {
            
                case "OK":
                    document.all.item("RowConfirm").style.display = "none"
                    document.all.item("TdSave").style.display = "none"
                    document.all.item("TdOK").style.display = "inline"  
                    break;
                case "":
                    document.all.item("RowConfirm").style.display = "none"
                    document.all.item("TdSave").style.display = "none"
                    document.all.item("TdOK").style.display = "inline"
                    break;
                case "Save":
                    document.all.item("RowConfirm").style.display = "inline"
                    document.all.item("TdSave").style.display = "inline"
                    document.all.item("TdOK").style.display = "none"
                   
                    break;
                case "Success":
                   /// alert("–ŒÌ—Â ‘œ.")
                 
                    break;
                case "Fail":
                    //alert("œ«œÂ  ò—«—Ì ÊÃÊœ œ«—œ.")
                  
                    break;
            }
        }
    //--------------------------------------------------------
    
</script>
   <table id="table1" style="height:100%" cellspacing="0" cellpadding="0" width="100%" align="center"
        border="0">
        <tr>
            <td valign="middle" align="center" 
                <p>
                    &nbsp;</p>
                <table  id="table2" style="height:90%" cellspacing="1" cellpadding="1"
                    width="90%" border="0">
                    <tr>
                        <td align="center">
                            <table  id="table3"  cellspacing="1"
                                cellpadding="1"  border="0"  style="height:256px;width: 375px;border: 2px inset #0086B3; background-color: #C6E2FF;">
                                <tr>
                                    <td align="right">
                                        <table id="table6" cellspacing="1" cellpadding="1" width="368" border="0" 
                                            style="width: 368px; height: 240px" align="right"  >
                                            <tr>
                                                <td style="font-family: Tahoma; height: 45px; font-size: 10pt; font-weight: bold"
                                                    class="VertGradientBlue1" align="center">
                                                    ÃÂ   €ÌÌ— „‘Œ’«  ⁄»Ê—° ò·„Â ⁄»Ê— —« Ê«—œ ‰„«ÌÌœ.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <table id="table4" style="width: 269px; height: 128px" cellspacing="1" cellpadding="1"
                                                        width="269" border="0">
                                                        <tr>
                                                            <td  align="right">
                                                                <table align="right" border="0" style="width: 320px; height: 6px" >
                                                                    <tr>
                                                                        <td style="font-size:13px; color:Maroon">
                                                                            ‰«„ ﬂ«—»—
                                                                        </td>
                                                                        <td width="145">
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                                                                    <asp:TextBox ID="UserName" TabIndex="1" runat="server" Style="height: 25px; width: 120px;
                                                                                        font-size: medium; font-weight: bold" Height="20px"></asp:TextBox>
                                                                                    <asp:TextBox ID="Active" Style="display: none" runat="server"></asp:TextBox>
                                                                                    <input type="hidden" id="txtResult" runat="server" />
                                                                                    <input type="hidden" id="txtStatus" runat="server" />
                                                                                    <input id="txtAlert" type="hidden" runat="server" />
                                                                                    <input type="hidden" id="txtLogin" runat="server" />
                                                                                    <input type="hidden" id="txtSessionID" runat="server" />
                                                                                    
                                                                                    <input type="hidden" id="txtToPersonID" runat="server" />
                                                                                    <input type="hidden" id="txtPersonID" runat="server" />
                                                                                    <input type="hidden" id="txtSDate" runat="server" />
                                                                                    <input type="hidden" id="txtEDate" runat="server" />
                                                                                    <input type="hidden" id="txtFromPersonID" runat="server" />
                                                                                    <input type="hidden" id="txtTouchLogin" runat="server" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                                                           
                                                                        </td>
                                                                        <td>
                                                                           
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="font-size:13px; color:Maroon">
                                                                            ﬂ·„Â ⁄»Ê—
                                                                        </td>
                                                                        <td >
                                                                            &nbsp;
                                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                                                                    <%--  <asp:TextBox ID="" TabIndex="2" runat="server" CssClass="TxtControls" Width="100%"
                                                                                Height="20px" TextMode="Password" ></asp:TextBox>--%>
                                                                                    <input type="password" runat="server"  style="height:25px; width:120px; font-size:medium; font-weight:bold" id="Password" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                        <td>
                                                                            <input id="btnUserName" type="button" style="background-color: #348fff; background-position: center center; cursor:hande;
                                                                                font-size: medium; background-image: url('../../App_Utility/Images/Icons/EnterUserName.gif');
                                                                                height: 40px; width: 40px; background-repeat: no-repeat;" class="CssBtn" value="..." onclick="OnClickBtnPassword()" />
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="RowConfirm" style="display: none">
                                                                        <td style="font-size:13px; color:Maroon">
                                                                             «ÌÌœ ò·„Â ⁄»Ê—
                                                                        </td>
                                                                        <td width="145">
                                                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                                                                    <%--      <asp:TextBox ID="ConfirmPassword" TabIndex="3" runat="server" CssClass="TxtControls"
                                                                                Width="100%" Height="20px" TextMode="Password" ></asp:TextBox>--%>
                                                                                    <input type="password" runat="server" style="height:25px; width:120px; font-size:medium; font-weight:bold" id="ConfirmPassword" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                                                            </td>
                                                                        <td>
                                                                            <input id="Button1" type="button" style="background-color: #348fff; background-position: center center;cursor:hande;
                                                                                font-size: medium; background-image: url('../../App_Utility/Images/Icons/EnterUserName.gif');
                                                                                height: 40px; width: 40px; background-repeat: no-repeat;" value="..." class="CssBtn" onclick="OnClickBtnConfirmPass()" />
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 12px" align="right">
                                                              <%--  <hr  style="width: 100%; height: 2px" size="1" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table id="table5" style="width: 64px; height: 36px" cellspacing="1" cellpadding="1"
                                                                    width="64" border="0">
                                                                    <tr>
                                                                        <td id="tdSave" style="display: none">
                                                                            <img alt="–ŒÌ—Â" style="height: 40px; cursor: hand" src="../../App_Utility/Images/Icons/btnsave.gif"
                                                                                onclick="onclickbtnSave()" class="CssBtn" id="btnSave" />
                                                                        </td>
                                                                        <td id="tdOK" style="display: inline">
                                                                            <img alt=" «ÌÌœ" style="height: 40px; cursor: hand" src="../../App_Utility/Images/Icons/btnok.gif"
                                                                                onclick="OnClickBtnOk()" class="CssBtn" id="btnOk" />
                                                                        </td>
                                                                        <td id="td1" style="display: inline">
                                                                            <img alt="«‰’—«›" style="height: 40px; cursor: hand" src="../../App_Utility/Images/Icons/Cancel.gif"
                                                                                onclick="OnClickBtnCancel()" class="CssBtn" id="Img1" />
                                                                        </td>
                                                                        <td style="display: none">
                                                                            <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <div id="ErrMsg" runat="server" style="height:14px; color:red; font-size:15px ; font-weight:bold" width="100%"  
                                                                            >
                                                                        </div>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                               
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="display: none">
               
                <input id="txtSubmit" runat="server" />
            </td>
        </tr>
    </table>

<%--///////////////////////////////////////////////////////////////////////--%>
    
 <script language="javascript" type="text/javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     var MessageFlag;
     function OnClickBtnUserName() {
         MessageFlag = "1";
         var url = "EnterPersonel.aspx?MessageFlag=" + MessageFlag + "&Status=Login";
         url = encodeURI(url)

         Returnval = window.showModalDialog(url, "window", 'dialogHeight: 800px;dialogWidth: 800px;center: Yes;help: no;status: no');
         if (Returnval != null)
             document.getElementById(MasterObj + "UserName").value = Returnval;


     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
     function OnClickBtnPassword() {
         MessageFlag = "2";
         var url = "EnterPersonel.aspx?MessageFlag=" + MessageFlag + "&Status=Login";
        
         url = encodeURI(url)

         Returnval = window.showModalDialog(url, "window", 'dialogHeight: 800px;dialogWidth:800px;center: Yes;help: no;status: no');
         if (Returnval != null)
             document.getElementById(MasterObj + "Password").value = Returnval;
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnConfirmPass() {
         MessageFlag = "2";
         var url = "EnterPersonel.aspx?MessageFlag=" + MessageFlag + "&Status=Login";
         url = encodeURI(url)
         Returnval = window.showModalDialog(url, "window", 'dialogHeight: 800px;dialogWidth:800px;center: Yes;help: no;status: no');
         if (Returnval != null)
             document.getElementById(MasterObj + "ConfirmPassword").value = Returnval;
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function onclickbtnSave() {
         if (document.getElementById(MasterObj + "Password").value == "") {
             document.getElementById(MasterObj + "ErrMsg").innerText = "ò·„Â ⁄»Ê— —« Ê«—œ ‰„«ÌÌœ";
             return;
         }
         if (document.getElementById(MasterObj + "Password").value != document.getElementById(MasterObj + "ConfirmPassword").value) {
             document.getElementById(MasterObj + "ErrMsg").innerText = "ò·„Â ⁄»Ê— Ê  «ÌÌœ ò·„Â ⁄»Ê— Ìò”«‰ ‰Ì” ";
             return;
         }
         else {
             document.getElementById(MasterObj + "txtSubmit").value = "Save";
             document.getElementById(MasterObj + "BtnSubmit").click();
            
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnOk() {
         if (document.getElementById(MasterObj + "Password").value == "") {
             document.getElementById(MasterObj + "ErrMsg").innerText = "ò·„Â ⁄»Ê— —« Ê«—œ ‰„«ÌÌœ";
             return;
         }
         else {
             document.getElementById(MasterObj + "txtSubmit").value = "SurveyLogin"
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnCancel() {
         //alert(document.getElementById(MasterObj + "txtToPersonID").value);
         window.open("TouchMenue.aspx?UserName=" + document.getElementById(MasterObj + "UserName").value
             + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ToPersonID=" + document.getElementById(MasterObj + "txtToPersonID").value
             + "&PersonID=" + document.getElementById(MasterObj + "txtPersonID").value + "&SDate=" + document.getElementById(MasterObj + "txtSDate").value
             + "&EDate=" + document.getElementById(MasterObj + "txtEDate").value + "&TouchLogin=" + document.getElementById(MasterObj + "txtTouchLogin").value
             + "&FromPersonID=" + document.getElementById(MasterObj + "txtFromPersonID").value, "_self");
     }
     
 </script>   
</asp:Content>
