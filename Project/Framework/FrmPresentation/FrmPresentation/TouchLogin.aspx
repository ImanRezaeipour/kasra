<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouchLogin.aspx.cs" ValidateRequest="false" Inherits="FrmPresentation.TuchLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="App_Utility/Styles/StyleForPages.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ToolBarStyle1
        {
            background-image: url('App_Utility/Images/LoginImg/black.bmp');
            background-repeat: repeat-x;
            background-position: center;
            color: #FFFFFF;
            font-weight: 600;
            font-size: small;
        }
    </style>
        <style type="text/css">        
    .test
    {
          visibility:hidden;
    }

    a.loginBtn, a:visited.loginBtn
    {
          background-image:url('App_Utility/Images/LoginImg/backbotton.gif');
          background-repeat:no-repeat;
          width:80px;
          height:5px;
          display:block;
          padding-top:14px;
          padding-bottom:2px;
          text-align:right ;
          text-decoration:none;
          BORDER-RIGHT: #346fa4 2px solid; 
          BORDER-TOP: lightsteelblue 2px solid; 
          BORDER-LEFT: lightsteelblue 2px solid; 
          BORDER-BOTTOM: #346fa4 2px solid;
          
    }
    a:hover.loginBtn
    {
          background-image:url('App_Utility/Images/LoginImg/backbotton.gif');
          background-repeat:no-repeat;
          width:80px;
          height:5px;
          display:block;
          padding-top:14px;
          padding-bottom:2px;
          text-align:right ;
          text-decoration:none;
          BORDER-RIGHT: #346fa4 2px solid; 
          BORDER-TOP: lightsteelblue 2px solid; 
          BORDER-LEFT: lightsteelblue 2px solid; 
          BORDER-BOTTOM: #346fa4 2px solid;
    }  
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
        <script language="javascript">
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
       
        var MessageFlag;
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

            parent.location = 'App_Utility/Font/InstallKasraFont.exe'

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onload() {
            if (top.location != self.location)
                top.location = self.location

            BindPage()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function prepareMessage() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
           
            oXmlDoc.loadXML(document.getElementById("txtXMLMessage").value);
         
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Main/GetMessage[SDate <='" + document.getElementById("txtCurDate").value + "' and EDate>='" + document.getElementById("txtCurDate").value + "']");
            var str = ""

            if (oXmlNodes.length > 0) {
                for (i = oXmlNodes.length - 1; i >= 0; i--) {
                    str = str + oXmlNodes.item(i).selectSingleNode("Desc").text + "      "
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

            prepareMessage()

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnUserName() {
            MessageFlag = "1";
            var url = "App_Pages/Login/EnterPersonel.aspx?MessageFlag=" + MessageFlag + "&Status=Login";
            url = encodeURI(url)
            Returnval = window.showModalDialog(url, "window", 'dialogHeight: 800px;dialogWidth: 800px;center: Yes;help: no;status: no');
            
            if (Returnval != null)
                document.getElementById("txtUserName").value = Returnval;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPassword() {
            MessageFlag = "2";
            var url = "App_Pages/Login/EnterPersonel.aspx?MessageFlag=" + MessageFlag + "&Status=Login";
            url = encodeURI(url)
            Returnval = window.showModalDialog(url, "window", 'dialogHeight: 800px;dialogWidth:800px;center: Yes;help: no;status: no');
           
            if (Returnval != null)
                form1.txtPassword.value = Returnval;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnChangePass() {
            form1.txtStatus.value = "ChangePass";
            form1.btnLogin_Authenticate.click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickMonthly() {
            form1.txtStatus.value = "Monthly";
            form1.btnLogin_Authenticate.click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickMande() {
            form1.txtStatus.value = "Cardex";
            form1.btnLogin_Authenticate.click();

        }
        //!!!!!!!!!!!!!!!!!!1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLogin() {
            form1.txtStatus.value = "Login";
            form1.btnLogin_Authenticate.click();
        }
   
    </script>
</head>
<body onload="onload()" scroll="no" dir="rtl" style="margin: 0px; font-family: Tahoma;"
    onkeydown="EnterLogin()">
    <form id="form1" runat="server" scroll="no">
    <div style="background-color: #E3EFFF; width: 100%; height: 100%;">
        <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" scroll="no">
            <!--HEADER-->
            <tr style="height: 20%" valign="middle">
                <td style="background-image: url('App_Utility/Images/LoginImg/LoginHeader.bmp');
                    height: 72px;" align="right" valign="middle">
                    &nbsp&nbsp&nbsp&nbsp
                    <img id="imgArm" src="" style="width: 50px; height: 50px" />
                    <span id="CompanyName" style="color: #FFFFFF; font-weight: bold; font-size: small;
                        font-family: Tahoma;"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                    &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp
                </td>
            </tr>
            <!--TOOLBAR-->
            <tr style="height: 20%">
                <td>
                    <table style='width: 100%; height: 20px;' align='right' class='ToolBarStyle1' border='1'
                        id='TbToolBar'>
                        <tr>
                            <td style='width: 80%;'>
                                <marquee id="marqueeMessage" dir="ltr" id="divMessage" direction="right" behavior="scroll"></marquee>
                            </td>
                            <td style='width: 20%;'>
                                &nbsp
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--LOGIN-->
            <tr>
                <td height="8px">
                    <div style="display:none" >
                        <input type="text" id="txtHoliday" runat="server" />
                        <input type="text" id="txtStatus" runat="server" />
                        <input type="text" id="txtSDate" runat="server" />
                        <input type="text" id="txtEDate" runat="server" />
                        <asp:Button runat="server" ID="btnLogin_Authenticate" 
                            onclick="btnLogin_Authenticate_Click"  />
                        </div>
                    <div>
                        <!--  تاریخ شمسی   -->

                        <script>

                            function showdate() {

                                week = new Array("يكشنبه", "دوشنبه", "سه شنبه", "چهارشنبه", "پنج شنبه", "جمعه", "شنبه")

                                months = new Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دي", "بهمن", "اسفند");

                                a = new Date();

                                d = a.getDay();

                                day = a.getDate();

                                month = a.getMonth() + 1;

                                year = a.getYear();



                                year = (year == 0) ? 2000 : year;

                                (year < 1000) ? (year += 2000) : true;



                                year -= ((month < 3) || ((month == 3) && (day < 21))) ? 622 : 621;



                                switch (month) {

                                    case 1: (day < 21) ? (month = 10, day += 10) : (month = 11, day -= 20); break;

                                    case 2: (day < 20) ? (month = 11, day += 11) : (month = 12, day -= 19); break;

                                    case 3: (day < 21) ? (month = 12, day += 9) : (month = 1, day -= 20); break;

                                    case 4: (day < 21) ? (month = 1, day += 11) : (month = 2, day -= 20); break;

                                    case 5:

                                    case 6: (day < 22) ? (month -= 3, day += 10) : (month -= 2, day -= 21); break;

                                    case 7:

                                    case 8:

                                    case 9: (day < 23) ? (month -= 3, day += 9) : (month -= 2, day -= 22); break;

                                    case 10: (day < 23) ? (month = 7, day += 8) : (month = 8, day -= 22); break;

                                    case 11:

                                    case 12: (day < 22) ? (month -= 3, day += 9) : (month -= 2, day -= 21); break;

                                    default: break;

                                }

                                //document.write("<font color='#000066' style='font-family: KasraNazanin-s Bold; font-size: 14px; font-weight: bolder'><center>");
                                document.write("<font color='#000066' style=' font-size: 13px; font-weight: bolder'><center>");
                                document.write("<font >" + week[d] + "</font>" + "  " + day + " " + months[month - 1] + " " + year);

                            }
                            showdate()
                        </script>

                        <!--  تاریخ میلادی   -->

                        <script language="JavaScript">


                            monthnames = new Array(
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
                            document.write("<font >  مصادف با   </font>" + "  " + thisyear + monthnames[thismonth] + " " + thisdate);


                        </script>

                        <!--   مناسبت روز   -->

                        <script type="text/javascript" language="javascript">
                            if (document.getElementById("txtHoliday").value != "")
                                document.write("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color='#FF6699'>  مناسبت روز:   </font>" + document.getElementById("txtHoliday").value + "</center></font>");
                        </script>

                    </div>
                    <!--  ساعت   -->

                    <script type="text/javascript" src="App_Utility/Scripts/Clock/excanvas.js"></script>

                    <script type="text/javascript" src="App_Utility/Scripts/Clock/coolclock.js"></script>

                    <script type="text/javascript" src="App_Utility/Scripts/Clock/moreskins.js"></script>

                    <div style="position: absolute; left: 220px; top: 150px;">
                        <canvas id="clk4" class="CoolClock:Tes2"></canvas>
                    </div>
                </td>
            </tr>
            <tr valign="top" style="height: 300px; color: #A0D1F5;">
                <td style="padding: 10px;" align="center">
                    <table style="width: 960px; background-color: #E3EFFF; height: 100%;">
                        <tr>
                            <td style="background-image: url('App_Utility/Images/LoginImg/LoginMain.png'); width: 100%;
                                height: 450px; background-repeat: no-repeat; background-color: #FFFFFF;" valign="top">
                                <table style="width: 100%; height: 100%" cellspacing="10">
                                    <tr valign="middle">
                                        <td align="right">
                                            <div style="padding: 10px; background-color: #CBE6FA; filter: progid:DXImageTransform.Microsoft.Glow(color=#A0D1F5,strength=15);
                                                height: 180px; width: 330px;" align="right">
                                                <img id="TopDiv" src="" alt="" style="width: 330px; height: 180px" />
                                            </div>
                                        </td>
                                        <td align="right" rowspan="2" style="padding-right: 10px;">
                                            <div style="padding-right: 10px; padding-left: 13px; color: darkred; height: 170px;
                                                background-color: #CBE6FA; height: 197px; width: 351px;" align="center">
                                                <table>
                                                    <tr>
                                                        <td style="font-weight:bold; font-size:13px">
                                                            نام کاربر : &nbsp;
                                                        </td>
                                                        <td>
                                                            <input type="text" style="height:25px; width:120px; font-size:medium; font-weight:bold" runat="server" id="txtUserName" />
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                                <input id="btnUserName" type="button" style="background-color: #348fff; background-position: center center;
                                                                    font-size: medium; background-image: url('App_Utility/Images/Icons/EnterUserName.gif');
                                                                    height: 40px; width: 40px;cursor:hand; background-repeat: no-repeat;" value="..." class="CssBtn"
                                                                    onclick="OnClickBtnUserName(this)" />
                                                            
                                                           <%-- <img id="btnUserName" style="width: 70px; height: 60px;" src="App_Utility/Images/Icons/EnterUserName.gif"
                                                                onclick="OnClickBtnUserName()" />--%>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr><td></td></tr>
                                                    <tr>
                                                        <td style=" font-weight:bold; font-size:13px">
                                                            رمز عبور : &nbsp;
                                                        </td>
                                                        <td>
                                                        
                                                            <%--<input type="password" runat="server" id="txtPassword" />--%>
                                                            <input type="password" style="height:25px; width:120px; font-size:medium; font-weight:bold" runat="server" id="txtPassword" />
                                                         
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                        <input id="Button1" type="button" style="background-color: #348fff; background-position: center center;
                                                                    font-size: medium; background-image: url('App_Utility/Images/Icons/EnterUserName.gif');
                                                                    height: 40px; width: 40px; cursor:hand ; background-repeat: no-repeat;" value="..." onclick="OnClickBtnPassword()" class="CssBtn" />
                                                           
                                                            <%--<img id="btnPassword" style="width: 70px; height: 60px;" src="App_Utility/Images/Icons/EnterUserName.gif"
                                                                onclick="OnClickBtnPassword()" />--%>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div style="height:20px; color:red" id="divResult"  runat="server">
                                                
                                                </div>
                                                <table>
                                                    <tr>
                                                        <td>
                                         

              

                                                            <%-- <img id="btnChangePass" style="width: 102px; height: 50px;" src="App_Utility/Images/Icons/ChangePass.gif"
                                                                onclick="OnClickBtnChangePass()" />
                                                            <img id="btnMonthly" style="width: 100px; height: 50px;" src="App_Utility/Images/Icons/ViewMonthly.gif"
                                                                onclick="OnClickMonthly()" />
                                                            <img id="btnMande" style="width: 100px; height: 50px;" src="App_Utility/Images/Icons/ViewMandeh.gif"
                                                                onclick="OnClickMande()" />--%>
                                                            
                                                        </td>
                                                        <td>
                                                           <%-- <link rel="stylesheet" href="App_Utility/Images/Icons/cbcscbinsmenu.css" type="text/css" />--%>
                                                            <table id="cbinsmenuebul_table" width="0" cellpadding="0" cellspacing="0" border="0">
                                                                <tr>
                                                                    <td style="padding-right: 1px" title="">
                                                                        
                                                                            <img id="cbi_cbinsmenu_1" src="App_Utility/Images/Icons/TouchLogin/login.gif" name="ebbcbinsmenu_1" width="105"
                                                                                height="36" border="0" style="cursor:hand" alt="" title=""  onclick="OnClickBtnLogin()"/>
                                                                    </td>
                                                                  
                                                                </tr>
                                                            </table>

                                                           <%-- <script type="text/javascript" src="App_Utility/Images/Icons/cbjscbinsmenu.js"></script>--%>

                                                        </td>
                                                        <td>
                         

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                           
                                           
    </div>
    <div style="color: #FF0066; font-size: small; font-weight: lighter; font-family: Tahoma;
        width: 320px;" align="center">
       با <a id="FontInstall" onmouseover="window.status='نصب فونتهاي جديد'" style="cursor: hand;
            color: blue; background-color: transparent; text-decoration: underline" onclick="onClickFontInstall()"
            onmouseout="window.status='به سيستم جامع کنترل تردد صنايع اپتيک اصفهان خوش آمديد'"
            runat="server">نصب فونتهاي جديد</a> به زيبايي صفحات خود بيافزاييد
    </div>
    </td> </tr>
    <tr>
        <td align="left" style="width: 50%">
            <div style="padding: 10px; height: 180px; width: 330px; background-color: #CBE6FA;
                filter: progid:DXImageTransform.Microsoft.Glow(color=#A0D1F5,strength=15);" align="right">
                <img id="BottomDiv" src="" alt="" style="width: 330px; height: 180px" />
            </div>
        </td>
    </tr>
    </table> </td> </tr> </table> </td> </tr>
    <tr>
        <td style="display: none">
            <input type="text" runat="server" id="txtXMLMessage" />
            <input type='text' id="txtTopPic" runat="server" />
            <input type="text" id="txtBottomPic" runat="server" />
            <input type="text" id="txtArmPic" runat="server" />
            <input type="text" id="txtFirstTime" runat="server" />
            <input type="text" id="txtCompanyName" runat="server" />
            <input type="text" id="txtCurDate" runat="server" />
        </td>
    </tr>
    </table> </div>
    </form>
</body>
</html>
