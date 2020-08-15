<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="EnterPersonel.aspx.cs" Inherits="FrmPresentation.EnterPersonel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 54px;
            height: 54px;
        }
        .CssRed
        {
            background-color: Lime;
        }
        .CssUp
        {
            background-color: #FFFFCC;
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
            DivResult.innerText = "";
            // 
        }

        function EndRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "CheckEmployee") {
                document.getElementById(MasterObj + "txtSubmit").value = "";
                DivResult.innerText = $get(MasterObj + "txtAlert").value
                setTimeout(setnoneToDiv, 1500);
                if ($get(MasterObj + "txtResult").value != "1") {
                    

                }

            }
            else if (document.getElementById(MasterObj + "txtSubmit").value == "ShowName") {
                document.getElementById(MasterObj + "txtSubmit").value = "";
                DivResult.innerText = $get(MasterObj + "txtAlert").value
                setTimeout(setnoneToDiv, 1500);
            }
        }
             
        function setnoneToDiv()
        {
        DivResult.innerText = ""
        }
     
    </script>

    <table style="width: 100%; height: 100%; background-color: #F1DFF2;">
        <tr>
            <td style="width: 200px; height: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    </table>
            </td>
            <td style="width: 450px;">
                <table style="width: 450px; height: 600px; background-image: url('../../App_Utility/Images/Icons/BG03.gif')">
                    <tr>
                        <td style="height: 50px">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <table class="CssPage" style="width: 100%;height:100%">
                                <tr>
                                    <td id="tdMessage" runat="server" align="center" style="height: 30px; font-size: 18" >&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <div style="width: 150px; height: 150px">
                                            <table style="width: 100%; height: 100%" cellpadding="4" cellspacing="7">
                                                <tr>
                                                    <td class="style2">
                                                        <input id="Btn9" type="button" style="background-position: center center; font-size: medium;
                                                             background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat; background-color: #D19FD9;" value="9" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn8" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="8" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn7" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium;  background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="7" 
                                                            onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        <input id="Btn6" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="6" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn5" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium;background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="5" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn4" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium;  background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="4" 
                                                            onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        <input id="Btn3" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="3" 
                                                            onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn2" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="2" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn1" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium;background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="1" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        <input id="BtnDel" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; color: #FFFFFF; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="Del" onclick="onClickBtnDel(this)" />
                                                    </td>
                                                    <td class="style2">
                                                    </td>
                                                    <td class="style2">
                                                        <input id="Btn0" type="button" style="background-color: #D19FD9; background-position: center center;
                                                            font-size: medium; background-image: url('../../App_Utility/Images/Icons/Btn38.png');
                                                            height: 63px; width: 63px; background-repeat: no-repeat;" value="0" onclick="onClickBtnNumber(this)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr align="center" valign="middle">
                                    <td align="center">
                                        <div id="txtNum" style="background-color: White; width: 138px; height: 30px; vertical-align: middle;
                                            font-size:large; border: 1px solid Black;" runat="server" align="center">
                                        </div>
                                        <input type="password"  runat="server"  id="txtPass" style="display:none;background-color: White; width: 138px; height: 30px; vertical-align: middle;
                                            font-size:large; border: 1px solid Black;"  />
                                        <div align="right">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <input type="hidden" id="txtResult" runat="server" />
                                                     <input type="hidden" id="txtStatus" runat="server" />
                                                    <input id="txtAlert" type="hidden" runat="server" />
                                                     <input id="txtMessageFlag" type="hidden" runat="server" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </td>                                    
                                </tr>
                                
                                <tr>
                                    <td align="center"  >                                       
                                        <img id="BtnOK" style="width: 102px; height: 70px;" src="../../App_Utility/Images/Icons/BtnOK03.gif"onclick="OnClickBtnOk()" />                                       
                                        <img id="showName" style="width: 100px; height: 70px;" src="../../App_Utility/Images/Icons/BtnShowName.gif" onclick="onclickShowName()" />
                                        <img id="BtnCancel" style="width: 100px; height: 70px;" src="../../App_Utility/Images/Icons/Cancel03.gif" onclick="OnClickBtnCancel()" />
                                            
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px" valign="middle" align="center">
                                        <div id="DivResult" style="color: Red; height: 50px; font-size: 20">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:200PX;">
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input id="txtSubmit" type="text" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input id="txtPersonCode" type="text" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />                
        
    </div>

    <script language="javascript" type="text/javascript">

        //*****************************************************
        if (document.getElementById(MasterObj + "txtStatus").value == "1") {
            document.getElementById(MasterObj + "txtNum").style.display = "inline";
            document.getElementById(MasterObj + "txtPass").style.display = "none";
        }
        else if (document.getElementById(MasterObj + "txtStatus").value == "2") {
	    document.getElementById("showName").style.display = "none";
            document.getElementById(MasterObj + "txtPass").style.display = "inline";
            document.getElementById(MasterObj + "txtNum").style.display = "none";
        }
        //*****************************************************

        function onClickBtnNumber(Obj) {
            if ($get(MasterObj + "txtStatus").value == "1") {
                switch (Obj.id) {
                    case "Btn9":
                        $get(MasterObj + "txtNum").innerText += "9";
                        break;
                    case "Btn8":
                        $get(MasterObj + "txtNum").innerText += "8";
                        break;
                    case "Btn7":
                        $get(MasterObj + "txtNum").innerText += "7";
                        break;
                    case "Btn6":
                        $get(MasterObj + "txtNum").innerText += "6";
                        break;
                    case "Btn5":
                        $get(MasterObj + "txtNum").innerText += "5";

                        break;
                    case "Btn4":
                        $get(MasterObj + "txtNum").innerText += "4";
                        break;
                    case "Btn3":
                        $get(MasterObj + "txtNum").innerText += "3";
                        break;
                    case "Btn2":
                        $get(MasterObj + "txtNum").innerText += "2";
                        break;
                    case "Btn1":
                        $get(MasterObj + "txtNum").innerText += "1";
                        break;
                    case "Btn0":
                        $get(MasterObj + "txtNum").innerText += "0";
                        break;
                }
            }
            if ($get(MasterObj + "txtStatus").value == "2") {
                switch (Obj.id) {
                    case "Btn9":
                        $get(MasterObj + "txtPass").value += "9";
                        break;
                    case "Btn8":
                        $get(MasterObj + "txtPass").value += "8";
                        break;
                    case "Btn7":
                        $get(MasterObj + "txtPass").value += "7";
                        break;
                    case "Btn6":
                        $get(MasterObj + "txtPass").value += "6";
                        break;
                    case "Btn5":
                        $get(MasterObj + "txtPass").value += "5";

                        break;
                    case "Btn4":
                        $get(MasterObj + "txtPass").value += "4";
                        break;
                    case "Btn3":
                        $get(MasterObj + "txtPass").value += "3";
                        break;
                    case "Btn2":
                        $get(MasterObj + "txtPass").value += "2";
                        break;
                    case "Btn1":
                        $get(MasterObj + "txtPass").value += "1";
                        break;
                    case "Btn0":
                        $get(MasterObj + "txtPass").value += "0";
                        break;
                }
            }

        }
        //**************************************************************
        function onClickBtnDel(Obj) {
            if ($get(MasterObj + "txtStatus").value == "1")
                $get(MasterObj + "txtNum").innerText = "";
            if ($get(MasterObj + "txtStatus").value == "2")
                $get(MasterObj + "txtPass").value = "";    
        }
        //**************************************************************
        function OnClickBtnOk() {
//            if ($get(MasterObj + "txtStatus").value != "Login")
//                CheckNumber();
            if ($get(MasterObj + "txtStatus").value == "1") {
                window.returnValue = $get(MasterObj + "txtNum").innerText;
                window.close();
            }
           else if ($get(MasterObj + "txtStatus").value == "2") {
                window.returnValue = $get(MasterObj + "txtPass").value
                window.close();
            }

        }
        //**************************************************************
        function CheckNumber() {
            document.getElementById(MasterObj + "txtPersonCode").value = $get(MasterObj + "txtNum").innerText;
            document.getElementById(MasterObj + "txtSubmit").value = "CheckEmployee";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //**************************************************************
        function OnClickBtnCancel() {
                window.close();
        }

        //**************************************************************
        function onmousedownBtnNumber(Obj) {
            Obj.className = "CssRed";
        }

        function onmouseupBtnNumber(Obj) {
            Obj.className = "CssUp";
        }
        function onclickShowName() {
            if ($get(MasterObj + "txtStatus").value == "1") {
                if ($get(MasterObj + "txtNum").innerText != "") {
                    document.getElementById(MasterObj + "txtPersonCode").value = $get(MasterObj + "txtNum").innerText;
                    document.getElementById(MasterObj + "txtSubmit").value = "ShowName";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
           
            
        }    
       
    </script>
</asp:Content>
