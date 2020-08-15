<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FrmPresentation.Login"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>سيستم جامع كنترل تردد</title>
    <link href="App_Utility/Styles/StyleForPages.css" rel="stylesheet" type="text/css" />
    <link href="App_Utility/Images/Icons/favicon.ico" rel="Shortcut Icon" />
    <link href="App_Utility/Styles/LoginStyle.css" rel="stylesheet" type="text/css" />
    <script src="App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        /*Test*/
        /*Test881115TFS*/
        .ToolBarStyle1
        {
            background-repeat: repeat-x;
            background-position: center;
            color: #003366;
            font-weight: 500;
            font-size: small;
            font-family: "B Tabassom";
        }
    </style>
    <style type="text/css">
        .test
        {
            visibility: hidden;
        }
        
        a.loginBtn, a:visited.loginBtn
        {
            background-image: url('App_Utility/Images/LoginImg/backbotton.gif');
            background-repeat: no-repeat;
            width: 80px;
            height: 5px;
            display: block;
            padding-top: 14px;
            padding-bottom: 2px;
            text-align: right;
            text-decoration: none;
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            border-left: lightsteelblue 2px solid;
            border-bottom: #346fa4 2px solid;
        }
        a:hover.loginBtn
        {
            background-image: url('App_Utility/Images/LoginImg/backbotton.gif');
            background-repeat: no-repeat;
            width: 80px;
            height: 5px;
            display: block;
            padding-top: 14px;
            padding-bottom: 2px;
            text-align: right;
            text-decoration: none;
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            border-left: lightsteelblue 2px solid;
            border-bottom: #346fa4 2px solid;
        }
        .TDMainBack
        {
            filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#E5EDFD, EndColorStr=#CFDEFC);
        }
        
        
        .DivLogin
        {
            filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#C2C9E4, EndColorStr=#8396A5);
        }
        .TDTop
        {
            filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#6477C4, EndColorStr=#B7BFE3);
        }
        #divMessage
        {
            width: 740px;
        }
        #divMessage
        {
            width: 693px;
        }
        #BtnLogin
        {
            background-image: url('App_Utility/Images/LoginImg/BtnLogin_0.gif');
            background-repeat: no-repeat;
            background-position: center center;
            width: 121px;
            height: 27px;
            border-style: none;
            background-color: transparent;
        }
        #BtnLogin:hover
        {
            background-image: url('App_Utility/Images/LoginImg/BtnLogin_1.gif');
            background-repeat: no-repeat;
            background-position: center center;
            width: 121px;
            height: 27px;
            border-style: none;
        }
        
        #BtnLogin:active
        {
            background-image: url('App_Utility/Images/LoginImg/BtnLogin_1.gif');
            background-repeat: no-repeat;
            background-position: center center;
            width: 121px;
            height: 27px;
            border-style: none;
        }
        .style11
        {
            width: 63px;
        }
        .style12
        {
            width: 99px;
        }
        
        
        
        
        
        
        
        .style13
        {
            width: 100%;
        }
        
        
        
        
        
        
        
        .style14
        {
            width: 393px;
        }
        
        
        
        
        
        
        
        .style15
        {
            height: 370px;
        }
        
        
        
        
        
        
        
        .style16
        {
            height: 79px;
        }
        
        
        
        
        
        
        
        .style17
        {
            height: 100px;
        }
        
        
        
        
        
        
        .style18
        {
            width: 72px;
        }
        
        
        
        
        
        
        #BtnLogin0
        {
            background-image: url('App_Utility/Images/LoginImg/BtnLogin_0.gif');
            background-repeat: no-repeat;
            background-position: center center;
            width: 121px;
            height: 27px;
            border-style: none;
            background-color: transparent;
        }
        #BtnNewLogin
        {
            width: 14px;
        }
    </style>
    <script language="javascript">
      
        
       
        // Show a pop up if it works
       
       
       


//       function ShowIP(resp) {
//           alert(resp.ip);
//       };

        var aWFMnBspm = "  ساعت: ";
        var AWFMnBspm = "24 HOURS";
        var awfmnbSpm = window.status;
        var AwfmnbSpm = "This script was made by USINGIT.COM (C)2002 All rights reserved. Visit www.usingit.com for more free scripts!";
        function OnClickBtnNewUser() {
            window.showModalDialog("App_Pages/Login/NewUser.aspx");
        }
        function aWfmnbSpm() {
            var awFmnbSpm = new Date();
            awfMnbSpm = awFmnbSpm.getSeconds();
            AWfmnbSpm = awFmnbSpm.getHours();
            aWFmnbSpm = awFmnbSpm.getMinutes();
            var awFMnbSpm;
            if (AWFMnBspm == "24 HOURS") {
                if ((AWfmnbSpm >= 12) && (AWfmnbSpm < 24)) {
                    awFMnbSpm = "عصر"; AWfmnbSpm -= 12;
                }
                else {
                    awFMnbSpm = "صبح";
                }
            }
            else {
                awFMnbSpm = "";
            }
            if (aWFmnbSpm <= 9) {
                aWFmnbSpm = "0" + aWFmnbSpm;
            }
            if (awfMnbSpm <= 9) { awfMnbSpm = "0" + awfMnbSpm; } if (AWfmnbSpm <= 9) { AWfmnbSpm = "0" + AWfmnbSpm; } if (AwfmnbSpm.charAt(60) != String.fromCharCode(118)) return; if (window.status != AwfmnbSpm) window.status = awfmnbSpm + aWFMnBspm + AWfmnbSpm + ":" + aWFmnbSpm + ":" + awfMnbSpm + " " + awFMnbSpm;
        };
        setInterval("aWfmnbSpm()", 500);
    </script>
    <script type="text/javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function testFunction() {
            var myLoginButton = document.getElementById("Login1_LoginButton");
            myLoginButton.click();
        }
        function EnterLogin() {
            if (event.keyCode == 13) {
                testFunction()
            }
        }

        function onClickFontInstall() {
            var url = 'App_Pages/Setting/InstallKasraFont.aspx?'
            var returnValue = window.showModalDialog(encodeURI(url), "", "dialogWidth=400px;dialogHeight=200px;status: no;");
            //ShowProgressBar(document.all.item('Progressbar1_TbWaite'))
            //fnStartInterval(document.all.item('Progressbar1_TbWaite'))
            //            parent.location = 'App_Utility/Font/InstallKasraFont.exe'
            //fnStopInterval(document.all.item('Progressbar1_TbWaite'))
            //HideProgressBar(document.all.item('Progressbar1_TbWaite'))
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onload() {

            if ($.browser.msie) {
                document.getElementById("txtBrowserName").value = "1";
            }
            else
                document.getElementById("txtBrowserName").value = "0";
            //if (top.location != self.location)
            //    top.location = self.location//"/FrmPresentation/App_Pages/Login/Login.aspx"

            BindPage()

            //           document.aspLoginForm['Login1_UserName'].focus();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function prepareMessage() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";

            oXmlDoc.loadXML(document.getElementById("txtXMLMessage").value);
            if (oXmlDoc.xml != "") {
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Main/GetMessage[SDate <='" + document.getElementById("txtCurDate").value + "' and EDate>='" + document.getElementById("txtCurDate").value + "']");
                var str = ""

                if (oXmlNodes.length > 0) {
                    for (i = oXmlNodes.length - 1; i >= 0; i--) {
                        str = str + oXmlNodes.item(i).selectSingleNode("Desc").text + "      "
                    }
                }
            }
            document.getElementById("marqueeMessage").innerText = str;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
            document.getElementById("imgArm").src = document.getElementById("txtArmPic").value
            document.getElementById("TopDiv").src = document.getElementById("txtTopPic").value
            document.getElementById("BottomDiv").src = document.getElementById("txtBottomPic").value

            if (document.getElementById("txtArmPic").value == "")
                document.getElementById("imgArm").src = "App_Utility/Images/s.gif"

            if (document.getElementById("txtTopPic").value == "")
                document.getElementById("TopDiv").src = "App_Utility/Images/s.gif"

            if (document.getElementById("txtBottomPic").value == "")
                document.getElementById("BottomDiv").src = "App_Utility/Images/s.gif"


            CompanyName.innerHTML = document.getElementById("txtCompanyName").value

            //            Version.innerHTML = "ويرايش : " + document.getElementById("txtVersion").value
            Version.innerHTML = "اين نرم افزار متعلق است به  "; //+ document.getElementById("txtCompanyName").value;
            prepareMessage()

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
    </script>
</head>
<body onload="onload()" scroll="no" dir="rtl" style="margin: 0px; font-family: Tahoma;"
    onkeydown="EnterLogin()" bgcolor="#e5edfe">
    <form id="form1" runat="server" scroll="no">
    <div style="width: 100%; height: 100%;">
        <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" scroll="no">
            <!--HEADER-->
            <tr valign="middle">
                <td align="right" valign="middle" class="style17">
                </td>
            </tr>
            <!--TOOLBAR-->
            <tr valign="top" style="color: #A0D1F5;">
                <td style="padding: 10px;" align="center" class="style15">
                    <div>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="TDMainBack">
                                    <table border="0" frame="border" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <img alt="" src="App_Utility/Images/LoginImg/LoginHeader.jpg" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style='width: 100%; height: 20px;' align='right' class='ToolBarStyle1' border='0'
                                                    id='TbToolBar'>
                                                    <tr>
                                                        <td style="width: 50%">
                                                            <marquee id="marqueeMessage" dir="ltr" scrollamount="3" direction="right" behavior="scroll"></marquee>                                                           
                                                        </td>
                                                        <td style="width: 50%">
                                                            <div style="display: none">
                                                                <input type="text" id="txtHoliday" runat="server" /></div>
                                                            <%--<div id="TdDate" style="margin-right: 0px; font-family: 'Tahoma'; color: #233881;" runat="server">--%>
                                                            <div id="TdDate" runat="server" class="TdDate">
                                                                <!--  تاریخ شمسی   -->
                                                                <script language="javascript" type="text/javascript">

                                                                    //                                                                    function showdate() {

                                                                    //                                                                        week = new Array("يكشنبه", "دوشنبه", "سه شنبه", "چهارشنبه", "پنج شنبه", "جمعه", "شنبه")

                                                                    //                                                                        months = new Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دي", "بهمن", "اسفند");

                                                                    //                                                                        a = new Date();

                                                                    //                                                                        d = a.getDay();
                                                                    //                                                                       

                                                                    //                                                                        day = a.getDate();

                                                                    //                                                                        month = a.getMonth() + 1;

                                                                    //                                                                        year = a.getYear();



                                                                    //                                                                        year = (year == 0) ? 2000 : year;

                                                                    //                                                                        (year < 1000) ? (year += 2000) : true;


                                                                    //                                                                        year -= ((month < 3) || ((month == 3) && (day < 21))) ? 622 : 621;
                                                                    //                                                                        switch (month) {

                                                                    //                                                                            case 1: (day < 21) ? (month = 10, day += 10) : (month = 11, day -= 20); break;

                                                                    //                                                                            case 2: (day < 20) ? (month = 11, day += 11) : (month = 12, day -= 19); break;

                                                                    //                                                                            case 3: (day < 21) ? (month = 12, day += 9) : (month = 1, day -= 20); break;

                                                                    //                                                                            case 4: (day < 21) ? (month = 1, day += 11) : (month = 2, day -= 20); break;

                                                                    //                                                                            case 5:

                                                                    //                                                                            case 6: (day < 22) ? (month -= 3, day += 10) : (month -= 2, day -= 21); break;

                                                                    //                                                                            case 7:

                                                                    //                                                                            case 8:

                                                                    //                                                                            case 9: (day < 23) ? (month -= 3, day += 9) : (month -= 2, day -= 22); break;

                                                                    //                                                                            case 10: (day < 23) ? (month = 7, day += 8) : (month = 8, day -= 22); break;

                                                                    //                                                                            case 11:

                                                                    //                                                                            case 12: (day < 22) ? (month -= 3, day += 9) : (month -= 2, day -= 21); break;

                                                                    //                                                                            default: break;

                                                                    //                                                                        }

                                                                    //                                                                        //document.write("<font color='#000066' style='font-family: KasraNazanin-s Bold; font-size: 14px; font-weight: bolder'><center>");
                                                                    //                                                                        document.write("<font color='#000066' style=' font-size: 13px; font-weight: bolder'><center>");
                                                                    //                                                                        document.write("<font >" + week[d] + "</font>" + "  " + day + " " + months[month - 1] + " " + year);

                                                                    //                                                                    }
                                                                    // showdate()
                                                                </script>
                                                                <!--  تاریخ میلادی   -->
                                                                <script language="JavaScript" type="text/javascript">


                                                                    /*  monthnames = new Array(
                                                                    "January",
                                                                    "Februrary",
                                                                    "March",
                                                                    "April",
                                                                    "May",
                                                                    "June",
                                                                    "July",
                                                                    "August",
                                                                    "September",
                                                                    "October",
                                                                    "November",
                                                                    "Decemeber");
                                                                    var linkcount = 0;
                                                                    function addlink(month, day, href) {
                                                                    var entry = new Array(3);
                                                                    entry[0] = month;
                                                                    entry[1] = day;
                                                                    entry[2] = href;
                                                                    this[linkcount++] = entry;
                                                                    }
                                                                    Array.prototype.addlink = addlink;
                                                                    linkdays = new Array();
                                                                    monthdays = new Array(12);
                                                                    monthdays[0] = 31;
                                                                    monthdays[1] = 28;
                                                                    monthdays[2] = 31;
                                                                    monthdays[3] = 30;
                                                                    monthdays[4] = 31;
                                                                    monthdays[5] = 30;
                                                                    monthdays[6] = 31;
                                                                    monthdays[7] = 31;
                                                                    monthdays[8] = 30;
                                                                    monthdays[9] = 31;
                                                                    monthdays[10] = 30;
                                                                    monthdays[11] = 31;
                                                                    todayDate = new Date();
                                                                    thisday = todayDate.getDay();
                                                                    thismonth = todayDate.getMonth();
                                                                    thisdate = todayDate.getDate();
                                                                    thisyear = todayDate.getYear();
                                                                    thisyear = thisyear % 100;
                                                                    thisyear = ((thisyear < 50) ? (2000 + thisyear) : (1900 + thisyear));
                                                                    if (((thisyear % 4 == 0)
                                                                    && !(thisyear % 100 == 0))
                                                                    || (thisyear % 400 == 0)) monthdays[1]++;
                                                                    startspaces = thisdate;
                                                                    while (startspaces > 7) startspaces -= 7;
                                                                    startspaces = thisday - startspaces + 1;
                                                                    if (startspaces < 0) startspaces += 7;
                                                                    document.write("<font >  مصادف با   </font>" + "  " + thisyear + monthnames[thismonth] + " " + thisdate);*/


                                                                </script>
                                                                <!--   مناسبت روز   -->
                                                                <script type="text/javascript" language="javascript">
                                                                    if (document.getElementById("txtHoliday").value != "")
                                                                        document.write("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color='#FF6699'>  مناسبت روز:   </font>" + document.getElementById("txtHoliday").value + "</center></font>");
                                                                </script>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="style13">
                                                    <tr>
                                                        <td class="style14">
                                                            <table style="width: 60%; height: 20%">
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <img alt="" src="App_Utility/Images/LoginImg/LoginAttention.jpg" style="width: 300px;
                                                                            height: 40px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style12" align="center" valign="top">
                                                                        <img alt="" src="App_Utility/Images/LoginImg/KeyLogin.jpg" style="width: 50px; height: 50px" />
                                                                    </td>
                                                                    <td class="style6">

                                                                        
                                                                        <asp:Login ID="Login1" runat="server" dir="rtl" FailureText="نام کاربري يا رمز عبور اشتباه مي باشد،لطفا مجددا تلاش نماييد"
                                                                            LoginButtonText="ورود" PasswordLabelText="كلمه عبور" PasswordRequiredErrorMessage="رمز عبور خود را وارد نماييد"
                                                                            RememberMeText="" UserNameLabelText="نام کاربري" UserNameRequiredErrorMessage="نام کاربري خود را وارد نماييد"
                                                                            Font-Size="Small" TitleText="" Height="67px" Width="220px" LoginButtonStyle-Width="80"
                                                                            LoginButtonStyle-Height="20" LoginButtonType="Button" DisplayRememberMe="False"
                                                                            LoginButtonStyle-CssClass="BtnLogin" OnAuthenticate="Login1_Authenticate">
                                                                            <TextBoxStyle CssClass="TxtControlsForLogin" Font-Size="0.8em" BackColor="#E5EDFE"
                                                                                Width="120px" />
                                                                            <%--<LoginButtonStyle CssClass="BtnLogin" Font-Names="Verdana" Font-Size="0.8em" />
                                                                            --%>
                                                                            <LoginButtonStyle CssClass="test" />
                                                                            <InstructionTextStyle Font-Italic="True" />
                                                                            <LabelStyle ForeColor="#003366" />
                                                                            <TitleTextStyle Font-Bold="True" Font-Size="0.9em" />
                                                                        </asp:Login>
                                                                        <asp:Label ID="lblSSOMessage" runat="server" style="color: red"></asp:Label>
                                                                    </td>
                                                                    <%--<td class="style11">
                                                                    </td>--%>
                                                                </tr>
                                                                <%--<tr>
                                                                <td >
                                                                <div align="right"></div> 
                                                                </td>
                                                                    <td> <div align="right">
                                                                    <asp:Label ID="LblAuthenticate" runat="server" Text="Label"  Visible="false" ForeColor="#003366">احراز هويت &nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                                                       <select id="cmbAuthenticate" name="cmbAuthenticate" runat="server" class="TxtControls"
                                                                            style="width: 125px; visibility:hidden">
                                                                            <option></option>
                                                                        </select>  
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                 <td> <div align="right"></div>
                                                                </td>
                                                                    <td><div align="right">
                                                                    <asp:Label ID="LblDomain" runat="server" Text="Label" Visible="false" ForeColor="#003366">نام دامين &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                                                        <asp:DropDownList ID="cmbDomainName" name="cmbDomainName" runat="server" Width="125" CssClass="TxtControls" Visible="false">
                                                                        </asp:DropDownList>
                                                                        </div>
                                                                    </td>
                                                                </tr>--%>
                                                                <tr>
                                                                    <td class="style12">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="style7">
                                                                        <input id="BtnLogin" type="button" runat="server" onclick="testFunction()" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style12">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="style7">
                                                                        <div align="right" style="width: 250px">
                                                                            <input type="button" style="display: none" id="btnNewUser" name="btnNewUser" value="کاربر جدید"
                                                                                onclick="OnClickBtnNewUser()" style="height: 20px; width: 80px;" />
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <%--  <div style="color: #FF0066; font-size: small; font-weight: lighter; font-family: Tahoma;
                                                                            width: 320px;" align="center">
                                                                            <a id="FontInstall" onmouseover="window.status='نصب فونتهاي جديد'" style="cursor: hand;
                                                                                color: blue; background-color: transparent; text-decoration: underline" onclick="onClickFontInstall()"
                                                                                onmouseout="window.status='به سيستم جامع کنترل تردد صنايع اپتيک اصفهان خوش آمديد'"
                                                                                runat="server"></a>
                                                                        </div>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <asp:Label ID="lblKeyMessage" runat="server" Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table style="width: 100%; height: 100%">
                                                                <tr>
                                                                    <td class="style16">
                                                                        <table style="width: 100%; height: 100%">
                                                                            <tr>
                                                                                <td class="style18">
                                                                                    <img id="imgArm" src="" style="width: 50px; height: 50px;" />
                                                                                </td>
                                                                                <td>
                                                                                    <table style="width: 100%; height: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <%-- <span id="Version" style="color: #233881; font-weight: Bold; font-size: 11px; font-family: Broadway;">
                                                                                                </span>--%>
                                                                                                <span id="Version" class="Version">
                                                                                                </span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <%-- <span id="CompanyName" style="color: #233881; font-weight: bold; font-size: small;
                                                                                                    font-family: Broadway;"></span>--%>
                                                                                                <span id="CompanyName" class="CompanyName"></span>
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
                                                                        <div style="padding: 5px; background-color: #e5edfe; filter: progid:DXImageTransform.Microsoft.Glow(color=#ADC7FC,strength=15);
                                                                            height: 180px; width: 280px;" align="right">
                                                                            <img id="TopDiv" src="" alt="" style="width: 280px; height: 180px" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style14">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <div style="padding: 10px; height: 180px; width: 330px; background-color: #9CABB8;
                                                                filter: progid:DXImageTransform.Microsoft.Glow(color=#7594B3,strength=15); display: none;"
                                                                align="right">
                                                                <img id="BottomDiv" src="" alt="" style="width: 330px; height: 180px" />
                                                            </div>
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
                    </div>
                   
                </td>
            </tr>
            <tr>
                <td style="display: none">
                </td>
            </tr>
        </table>
        <div style="display: none">
            <input type="text" runat="server" id="txtXMLMessage" />
            <input type='text' id="txtTopPic" runat="server" />
            <input type="text" id="txtBottomPic" runat="server" />
             <input type="text" id="txtMachineName" runat="server" />
            <input type="text" id="txtArmPic" runat="server" />
            <input type="text" id="txtFirstTime" runat="server" />
            <input type="text" id="txtCompanyName" runat="server" />
            <input type="text" id="txtCurDate" runat="server" />
            <input type="text" id="txtVersion" runat="server" />
            <input type="text" id="txtAuthMode" runat="server" />
            <input type="text" id="txtClientName" runat="server" />
            <input type="text" id="txtChangePassNeedWithIncorrectPass" value="0" runat="server" />
            <input type="text" id="txtCountIncorrectPass" runat="server" value="0" />
            <input type="text" id="txtBrowserName" runat="server" />
        </div>
        <span id="SpanFontInstall" style="display: none; font-family: tahoma,Arial">تست</span>
        <span id="SpanFontNotInstall" style="display: none; font-family: Arial">تست</span>
    </div>
    <script src="App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        try {
            var network = new ActiveXObject('WScript.Network');
            document.getElementById("txtMachineName").value = network.computerName;
            //        alert(document.getElementById("txtMachineName").value)
            //for merge
            //for merge 2 by task
        }
        catch (ex) {
        }
    </script>
    </form>
</body>
</html>
