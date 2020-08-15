<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="SendToText.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.SendToText" %>
<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
           .Btn
        {
            BACKGROUND-REPEAT: no-repeat;	
	        BACKGROUND-COLOR: transparent;
	         BORDER-RIGHT: #346fa4 2px solid; 
	        BORDER-TOP: lightsteelblue 2px solid; 
	        BORDER-LEFT: lightsteelblue 2px solid; 
	        BORDER-BOTTOM: #346fa4 2px solid;  
	        WIDTH: 70px;
	        HEIGHT: 32px
        }
       </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>   
     <script language="javascript" type="text/javascript">
     
         
         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
         function EndRequestHandler(sender, args) {
             alert(document.getElementById(MasterObj + "txtXmlFoodName").value);
//             window.open("../Rpt/RptContractCosts.pdf")
             if ($get(MasterObj + "txtAlert").value != "") {
                    
                     alert($get(MasterObj + "txtAlert").value);
            
             }

         }
     </script>

    <table style="width: 1024px; height:650px;">
        <tr>
            <td>
                <table style="border: 3px ridge #007CA6; width: 800px; height: 400px; background-color: #99CCFF;" align="center">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="60%"  style="border: 2px ridge #336699; background-color: #C1E0FF; height:80%" align="center">
                                <tr>
                                    <td>
                                        از تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td>
                                        تا تاريخ :
                                    </td>
                                    <td>
                                        <uc1:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                   
                                    <td>
                                        دوره :
                                        <asp:DropDownList ID="CmbPeriod" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" align="center">
                                        <table>
                                            <tr>
                                                <td align="center" style="display:none">
                                                    <img alt="ارسال به text" class="Btn" src="../../App_Utility/Images/Buttons/btnsend.gif"
                                                        onclick="OnClickBtnSendToText()" id="BtnSendToText" style="cursor: pointer" />
                                                    &nbsp;
                                                </td>
                                                <td align="center">
                                                    <img alt="ارسال به اکسل" class="Btn" src="../../App_Utility/Images/Buttons/btnsend.gif"
                                                        onclick="OnClickBtnSendToExcel()" id="BtnSendToExcel" style="cursor: pointer" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:Button runat="server" ID="btnSubmit" name="btnSubmit" OnClick="btnSubmit_Click" />
        <input type="text" id="txtKCalFromDate" name="txtKCalFromDate" runat="server" />
        <input type="text" id="txtKCalToDate" name="txtKCalToDate" runat="server" />
        <input type="text" id="txtTmpFoodSenter" name="txtTmpFoodSenter" runat="server" />
        <input type="text" id="FC" name="FC" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtAlert" name="txtAlert" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" runat="server" id="txtFlagAvgContract" />
    </div>
    <script type="text/javascript" language="javascript">
       
       
        function OnClickBtnSendToText() {
            if (document.getElementById(MasterObj + "CmbPeriod").value == "0")
                alert("لطفا دوره را وارد نماييد");
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "SendToText";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
        function OnClickBtnSendToExcel() {
            if (document.getElementById(MasterObj + "CmbPeriod").value == "0")
                alert("لطفا دوره را وارد نماييد");
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "SendToExcel";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
    </script>

    
</asp:Content>
