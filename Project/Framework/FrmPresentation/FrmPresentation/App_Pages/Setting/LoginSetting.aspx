<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="LoginSetting.aspx.cs" Inherits="FrmPresentation.App_Pages.Setting.LoginSetting"
    Title="Untitled Page" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="App_Utility/Styles/StyleForPages.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    
        .ToolBarStyle1
        {
            
        background-repeat: repeat-x;
        background-position: center;
        color: #FFFFFF;
        font-weight: 500;
        font-size: small;
        font-family: "B Tabassom";
        }
    </style>
    <style type="text/css">
                
    .test
    {
	  visibility:hidden;
    }

    a.loginBtn, a:visited.loginBtn
    {
	  background-image:url('../../App_Utility/Images/LoginImg/backbotton.gif');
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
	  background-image:url('../../App_Utility/Images/LoginImg/backbotton.gif');
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
        .BtnLogin
        {
            background-image: url('../../App_Utility/Images/LoginImg/BtnLogin_0.gif');
            background-repeat: no-repeat;
            background-position: center center;
            width: 121px;
            height: 27px;
            border-style: none;
            background-color: transparent;
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
            height: 50px;
        }
        
        
        
        
        
         
        .style18
        {
            width: 72px;
        }
        
        
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>

    

   
  <div style="width: 100%; height: 100%;">
        <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" scroll="no">
            <!--HEADER-->
          
            <!--TOOLBAR-->
            <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
            <tr valign="top" style="color: #A0D1F5;">
                
                <td style="padding: 10px;" align="center" class="style15">
                <div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="TDMainBack">
                            
                    <table border="0" frame="border" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <img alt="" src="../../App_Utility/Images/LoginImg/LoginHeader.jpg" /></td>
                        </tr>
                        <tr>
                            <td>
                                        
                    <table style='width: 100%; height: 20px;' align='right' class='ToolBarStyle1' border='0'
                        id='Table1'>
                        <tr>
                            <td>
                    <table style='width: 100%;'  class='ToolBarStyle1'  id='TbToolBar'>
                        <tr>
                            <td style='width: 80%;'>
                                <marquee id="marqueeMessage" dir="rtl"  direction="right" behavior="scroll"></marquee>
                            </td>
                            <td style='width: 20%;'>
                                <img onclick="onclickBtnُSelectMessage()" alt="انتخاب پيام روز" src="../../App_Utility/Images/Icons/E1.png"
                                    style="cursor: hand" />
                                
                                <input type='text' id="OToolBar_txtMsgAlert" readonly title="پيغامها" style='background-color: transparent;
                                    border-width: 0px; color: #FFFFFF;   
                                    font-family: Tahoma;'  dir='ltr' />
                            </td>
                        </tr>
                    </table>
                </td>
                            <td style="width:50%">
                                <div style="display: none">
                                    <input type="text" id="txtHoliday" runat="server" /></div>
                                <!--  ساعت   -->
                               

                                <script type="text/javascript" src="../../App_Utility/Scripts/Clock/excanvas.js"></script>

                                <script type="text/javascript" src="../../App_Utility/Scripts/Clock/coolclock.js"></script>

                                <script type="text/javascript" src="../../App_Utility/Scripts/Clock/moreskins.js"></script>

                                <div style="display: none;">
                                                            <canvas id="clk4" class="CoolClock:Tes2"></canvas>
                                                        </div>
                                 <div style="margin-right: 0px; font-family: 'Tahoma'; color: #233881;">
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
                                       
                                        if (document.getElementById(MasterObj+"txtHoliday").value != "")
                                            document.write("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color='#FF6699'>  مناسبت روز:   </font>" + document.getElementById(MasterObj+"txtHoliday").value + "</center></font>");
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
                                                                        <img alt="" src="../../App_Utility/Images/LoginImg/LoginAttention.jpg" 
                                                                            style="width: 300px; height: 40px;" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style12" align="center" valign="top">
                                                                        <img alt="" src="../../App_Utility/Images/LoginImg/KeyLogin.jpg" 
                                                                            style="width: 50px; height: 50px" /></td>
                                                                    <td class="style6">
                                                            <asp:Login ID="Login2" runat="server" dir="rtl" FailureText="نام کاربري يا رمز عبور اشتباه مي باشد،لطفا مجددا تلاش نماييد"
                                                                LoginButtonText="ورود" PasswordLabelText="كلمه عبور" PasswordRequiredErrorMessage="رمز عبور خود را وارد نماييد"
                                                                RememberMeText="" UserNameLabelText="نام کاربري" UserNameRequiredErrorMessage="نام کاربري خود را وارد نماييد"
                                                                Font-Size="Small" TitleText="" Height="67px" Width="220px" LoginButtonStyle-Width="80"
                                                                 LoginButtonStyle-Height="20" LoginButtonType="Button" Enabled="False" DisplayRememberMe="False" LoginButtonStyle-CssClass="BtnLogin"
                                                                  >
                                                                <TextBoxStyle CssClass="TxtControlsForLogin" Font-Size="0.8em" 
                                                                    BackColor="#E5EDFE" Width="120px" />
                                                               
                                                                <LoginButtonStyle CssClass="test" />

                                                                <InstructionTextStyle  Font-Italic="True" />
                                                                <LabelStyle ForeColor="#003366" />
                                                                <TitleTextStyle Font-Bold="True" Font-Size="0.9em" />
                                                            </asp:Login>
                                                            
                                                                    </td>
                                                                    <td class="style11">
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style12">
                                                                        &nbsp;</td>
                                                                    <td class="style7">
                                                                        <input id="BtnLogin" class="BtnLogin" type="button" runat="server"  /></td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style12">
                                                                        &nbsp;</td>
                                                                    <td class="style7">
                                                                        <div align="right" style="width:250px">
                                                              <input type="button" style="display:none" id="btnNewUser" name="btnNewUser" value="کاربر جديد" onclick="OnClickBtnNewUser()" style="Height:20px;Width:80px;" />      
                                                            </div></td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                    
                                                     <%--  <div 
                                                            style="color: #FF0066; font-size: small; font-weight: lighter;
                                                                font-family: Tahoma; width: 320px; " 
                                                            align="center">
                                                            با <a id="FontInstall"   style="
                                                                color: blue; background-color: transparent; text-decoration: underline" onclick="onClickFontInstall()"
                                                                onmouseout="window.status='به سيستم جامع کنترل تردد صنايع اپتيک اصفهان خوش آمديد'"
                                                                runat="server">نصب فونتهاي جديد</a> به زيبايي صفحات خود بيافزاييد
                                                                </div>--%>
                                                    
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
                                                                <img id="imgArm" src="" style="width: 40px; height: 40px" />
                                                            </td>
                                                            <td>
                                                                <table style=" height: 100%">
                                                                    <tr>
                                                                        <td align="right">
                                                                            <span id="Version" style="color: #233881; font-weight: bold; font-size: small;
                                                                                font-family: Tahoma;"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                         
                     
                        نام شرکت : 
                    <input type="text" id="txtCompanyName" runat="server" style="width: 170px" />
                    
                                                                           
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><input onclick='onclickchk(this,"armFileUpload")' id="chkArm" type="checkbox" runat="server" />
                    <asp:FileUpload ID="armFileUpload" runat="server"  /></td></tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                               <td align="right">
                                            <div style="padding: 5px; background-color: #CBE6FA; 
                                                height: 160px; width: 300px;" align="right">
                                                <input onclick="onclickchk(this,'topFileUpload')" id="chkTop" type="checkbox" runat="server" />
                                                <asp:FileUpload ID="topFileUpload" runat="server" Width="250px" />
                                                
                                                <img id="TopDiv" src="" alt="" style="width: 300px; height: 140px" />
                                                سايز تصوير: 180*330
                                            </div>
                                        </td>
                                            </tr>
                                        </table>
                                            
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            
                                            <div 
                                                style="padding: 10px; height: 180px; width: 330px; background-color: #9CABB8;
                                                filter: progid:DXImageTransform.Microsoft.Glow(color=#7594B3,strength=15); display: none;" 
                                                align="right">
                                                <img id="Img3" src="" alt="" style="width: 330px; height: 180px" />
                                            </div>
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    
                            </td>
                        </tr>
                    </table>
                    
                </div>
                
                </td>
            </tr>
            
            <tr>
                <td>
                    <table id="TbselectMessage">
                        <tr>
                            <td align="center">
                                <div id="PopupselectMessage" dir="rtl" style="border-left: lightsteelblue 3px solid;
                                    border-right: #346fa4 3px solid; border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid;
                                    position: absolute; top: 100px; display: none; background-color: #e7eeff; right: 300px;"
                                    align="center">
                                    <table id="grdInsert_header" style="border-right: #6666cc thin inset; border-top: #6666cc thin solid;
                                        border-left: #6666cc thin outset; border-bottom: #6666cc thin solid; width: 680px;"
                                        border="0px" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 20px">
                                                <input id="SelectAllChk" style="border-right: 0px; border-top: 0px; border-left: 0px;
                                                    border-bottom: 0px" onclick="OnclickAllChk(this)" type="checkbox" />
                                            </td>
                                            <td style="border-right: #6666cc thin inset; width: 50px; background-color: #83afe5;
                                                height: 19px;" align="center">
                                                رديف
                                            </td>
                                            <td style="border-right: #6666cc thin inset; width: 90px; background-color: #83afe5;
                                                height: 19px;" align="center">
                                                تاريخ شروع
                                            </td>
                                            <td style="border-right: #6666cc thin inset; width: 90px; background-color: #83afe5;
                                                height: 19px;" align="center">
                                                تاريخ خاتمه
                                            </td>
                                            <td style="border-right: #6666cc thin inset; width: 430px; background-color: #83afe5;
                                                height: 19px;" align="center">
                                                شرح پيام
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="scrollbar-highlight-color: white; overflow: auto; width: 700px; scrollbar-arrow-color: black;
                                        scrollbar-base-color: #b0c4de; height: 150px;" align="center">
                                        <table id="grdInsert" style="width: 680px">
                                        </table>
                                    </div>
                                    <table align="center">
                                        <tr>
                                            <td>
                                                <input id="BtnOk" class="CssBtnOK" name="BtnOk" type="button" onclick="OnClickBtnOk()"
                                                     />
                                            </td>
                                            <td>
                                                <input id="BtnCancel" class="CssBtnCancel"   type="button"  onclick="OnClickBtnCancel()" />
                                            </td>
                                        </tr>
                                    </table>
                                     <input type="text" runat="server" id="txtxIsCancel" style="visibility: hidden"/> 
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div style="display:none">
           
                    <input type="text" id="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                     <input type="text" id="txtAlert" runat="server" />
                 <input type="text" runat="server" id="txtXMLMessage" />
                    <input type="text" id="txtCurDate" runat="server" />
                    <input type='text' id="txtTopPic" runat="server" />
                    <input type="text" id="txtBottomPic" runat="server" />
                    <input type="text" id="txtArmPic" runat="server" />
                    <input type="text" id="txtOK" runat="server" />
                   <input type="text" id="txtMSG" runat="server" />
                    <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
               
        </div>
        
                
            
    </div>
   

    <script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>

    <script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">

        BindPage()
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
           
            document.getElementById("imgArm").src = document.getElementById(MasterObj + "txtArmPic").value
            document.getElementById("TopDiv").src = document.getElementById(MasterObj + "txtTopPic").value
           // document.getElementById("BottomDiv").src = document.getElementById(MasterObj + "txtBottomPic").value
           
            if (document.getElementById(MasterObj + "txtArmPic").value == "")
                document.getElementById("imgArm").src = "../../App_Utility/Images/Blank.gif"
            
            if (document.getElementById(MasterObj + "txtTopPic").value == "")
                document.getElementById("TopDiv").src = "../../App_Utility/Images/Blank.gif"
            
//            if (document.getElementById(MasterObj + "txtBottomPic").value == "")
//                document.getElementById("BottomDiv").src = "../../App_Utility/Images/Blank.gif"

            document.getElementById(MasterObj + "chkArm").checked = false
//            document.getElementById(MasterObj + "chkBottom").checked = false
            document.getElementById(MasterObj + "chkTop").checked = false
           
//            document.getElementById(MasterObj + "BottomFileUpload").disabled = true
            document.getElementById(MasterObj + "armFileUpload").disabled = true
            document.getElementById(MasterObj + "topFileUpload").disabled = true

            //CompanyName.innerHTML = document.getElementById(MasterObj + "txtCompanyName").value

            prepareMessage()
            if (document.getElementById(MasterObj + "txtMSG").value != "")
                SetMsg(document.getElementById(MasterObj + "txtMSG").value);
           
            document.getElementById(MasterObj + "txtMSG").value = "";
           
            if (document.getElementById(MasterObj + "txtOK").value != "   ") {
                if (parseInt(document.getElementById(MasterObj + "txtOK").value) != 0) {
                    if (confirm("                                                            فايل/فايلهايي با نام " + String.fromCharCode(13) + "                                           " + document.getElementById(MasterObj + "txtAlert").value + String.fromCharCode(13) + " وجود دارد . آيا مي خواهيد فايل/فايلهاي جديد را جايگزين کنيد ؟")) {
                        document.getElementById(MasterObj + "txtOK").value = "   "
                        document.getElementById(MasterObj + "txtSubmit").value = "Save";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                    document.getElementById(MasterObj + "txtOK").value = "   "
                }
            }

            if (parseInt(document.getElementById(MasterObj + "txtOK").value) == 0)
                document.getElementById(MasterObj + "txtOK").value = "   "
       
             
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function prepareMessage() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
//            alert(document.getElementById(MasterObj + "txtXMLMessage").value)
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLMessage").value);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Main/GetMessage[SDate <='" + document.getElementById(MasterObj + "txtCurDate").value + "' and EDate>='" + document.getElementById(MasterObj + "txtCurDate").value + "']");
            var str = ""
            if (oXmlNodes.length > 0) {
                for (i = oXmlNodes.length - 1; i >= 0; i--) {
                    str = str + oXmlNodes.item(i).selectSingleNode("Desc").text + "      "
                }
            }
            document.getElementById("marqueeMessage").innerText = str;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchk(chk, obj) {
            document.getElementById(MasterObj + obj).disabled = (!chk.checked)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickBtnُSelectMessage() {
            if (PopupselectMessage.style.display == "none") {

                var oGrid = document.all.item("grdInsert")
                Cleargrd(oGrid)
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLMessage").value);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Main/GetMessage");
                PopupselectMessage.style.display = "inline";
                var str = ""
                if (oXmlNodes.length > 0) {
                    for (j = 0; j < oXmlNodes.length; j++) {
                        AddRow(oGrid, 1, j)
                        oGrid.rows(j).cells(1).firstChild.value = oXmlNodes.item(j).selectSingleNode("ID").text
                        oGrid.rows(j).cells(2).firstChild.value = oXmlNodes.item(j).selectSingleNode("SDate").text
                        oGrid.rows(j).cells(3).firstChild.value = oXmlNodes.item(j).selectSingleNode("EDate").text
                        oGrid.rows(j).cells(4).firstChild.value = oXmlNodes.item(j).selectSingleNode("Desc").text
                        // str=str+oXmlNodes.item(i).selectSingleNode("Desc").text+"  *  "
                    }
                }
                else {
                    j = 0
                }
                AddRow(oGrid, 1, j)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            $("#" + MasterObj + "txtxIsCancel").val('1');
            PopupselectMessage.style.display = "none";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRow(oGrid, cntRow, index) {

            for (i = index; i < index + cntRow; i++) {
                oGrid.insertRow()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()
                oGrid.rows(i).insertCell()

                oGrid.rows(i).align = "center"

                oGrid.rows(i).cells(0).style.width = "20px"
                oGrid.rows(i).cells(1).style.width = "50px"
                oGrid.rows(i).cells(2).style.width = "90px"
                oGrid.rows(i).cells(3).style.width = "90px"
                oGrid.rows(i).cells(4).style.width = "430px"


                oGrid.rows(i).cells(0).style.border = 0
                oGrid.rows(i).cells(1).style.border = 0
                oGrid.rows(i).cells(2).style.border = 0
                oGrid.rows(i).cells(3).style.border = 0
                oGrid.rows(i).cells(4).style.border = 0
                oGrid.rows(i).cells(0).innerHTML = "<INPUT   type='checkbox' checked >"
                oGrid.rows(i).cells(1).innerHTML = "<INPUT id='a" + ORow + "' value='" + (ORow + 1) + "' onkeydown='OnKeyDownInt();onKeyDownEnter(this)'  class='TxtControls'  style='width: 45px; '  type='text' >"
               
                oGrid.rows(i).cells(2).innerHTML = "<INPUT type='text'  class='txtControls' dir='ltr' id='b" + ORow + "' onkeydown='OnKeyDownDate(this.value);onKeyDownEnter(this)' onblur='datechk(this.value)' style='width: 80px; '  type='text' >"
                oGrid.rows(i).cells(3).innerHTML = "<INPUT type='text'  class='txtControls' dir='ltr' id='c" + ORow + "' onkeydown='OnKeyDownDate(this.value);onKeyDownEnter(this)' onblur='datechk(this.value)' style='width: 80px; '  type='text' >"
                oGrid.rows(i).cells(4).innerHTML = "<INPUT id='d" + ORow + "' onkeydown='onKeyDownEnter(this)' class='TxtControls'  style='width: 420px; '  type='text' >"

                ORow = ORow + 1;
            }
            oGrid.rows(i - 1).cells(1).firstChild.focus();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            ORow = 0;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onKeyDownEnter(obj) {
            if (event.keyCode == 13) {
                var oGrid = document.getElementById("grdInsert")
                var str = obj.id
                var tempid;
                if (str.substring(0, 1) == "a") {
                    tempid = "b" + str.substring(1, str.length)
                }
                else if (str.substring(0, 1) == "b") {
                    tempid = "c" + str.substring(1, str.length)
                }
                else if (str.substring(0, 1) == "c") {
                    tempid = "d" + str.substring(1, str.length)
                }
                else if (str.substring(0, 1) == "d") {
                    tempid = "a" + (parseInt(str.substring(1, str.length)) + 1)
                }
                if (document.getElementById(tempid) != null) {
                    document.getElementById(tempid).focus();
                    document.getElementById(tempid).select()

                }
                else {
                    AddRow(oGrid, 1, ORow)
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOk() {
            $("#" + MasterObj + "txtxIsCancel").val('0');
            var oGrid = document.all.item("grdInsert")
            var Str = "<Main>"
            var ll = oGrid.rows.length
            if (ll > 0) {
                for (i = 0; i < ll; i++) {
                    if (oGrid.rows(i).cells(0).firstChild.checked) {
                        if (oGrid.rows(i).cells(2).firstChild.value != "") {
                            Str += "<GetMessage>"
                            Str += "<ID>" + oGrid.rows(i).cells(1).firstChild.value + "</ID>"
                            Str += "<SDate>" + oGrid.rows(i).cells(2).firstChild.value + "</SDate>"
                            Str += "<EDate>" + oGrid.rows(i).cells(3).firstChild.value + "</EDate>"
                            Str += "<Desc>" + oGrid.rows(i).cells(4).firstChild.value + "</Desc>"
                            Str += "</GetMessage>"
                        }
                    }
                }
            }
            Str += "</Main>"
            document.getElementById(MasterObj + "txtXMLMessage").value = Str

            PopupselectMessage.style.display = "none";
        }

//        SetMsg(document.getElementById(MasterObj + "txtSubmit").value)


        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
