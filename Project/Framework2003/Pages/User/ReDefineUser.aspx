<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReDefineUser.aspx.vb"
    Inherits="FrameWork.ReDefineUser" %>

<%@ Register TagPrefix="cc2" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html dir="rtl">
<head>
    <title>ReDefineUser</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="<%=commonLib.StyleLibURL%>" type="text/css" rel="stylesheet">
    <link href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        //--------------------------------------------------------
        function LoadForm() {
            //document.getElementById('UserName').value = '123';
            switch (Form1.item("Active").value) {
                case "ChangePass":
                    document.all.item("RowConfirm").style.display = "inline"
                    document.all.item("TdSave").style.display = "inline"
                    document.all.item("TdOK").style.display = "none"
                    //Form1.ConfirmPassword.value=""
                    Form1.Password.focus()
                    break;

                case "OK":
                    document.all.item("RowConfirm").style.display = "none"
                    document.all.item("TdSave").style.display = "none"
                    document.all.item("TdOK").style.display = "inline"
                    Form1.btnOk.focus()
                    break;
                case "":
                    document.all.item("RowConfirm").style.display = "none"
                    document.all.item("TdSave").style.display = "none"
                    document.all.item("TdOK").style.display = "inline"
                    Form1.btnOk.focus()
                    break;
                case "Save":
                    document.all.item("RowConfirm").style.display = "inline"
                    document.all.item("TdSave").style.display = "inline"
                    document.all.item("TdOK").style.display = "none"
                    //Form1.ConfirmPassword.value=""
                    Form1.Password.focus()
                    break;
                case "Success":
                    alert("ذخيره شد.")
                    break;
                case "Fail":
                    alert("داده تکراري وجود دارد.")
                    break;
            }


        }
        //			false not in pach
        //--------------------------------------------------------
        function onclickbtnSave() {
            if (document.getElementById("Password").value == "") {
                alert("کلمه عبور را وارد نماييد")
                return;
            }
            if (document.getElementById("Password").value != document.getElementById("ConfirmPassword").value) {
                alert("کلمه عبور و تاييد کلمه عبور يکسان نيست")
                return;
            }
            if (document.getElementById("Password").value.length < 6) {
                alert("کلمه عبور بايستي حداقل 6 کاراکتر باشد")
                return;
            }
            if (ChkKeyOfDate(document.getElementById("Password").value)) {
                alert(" از کاراکتر '  نباید در کلمه پسورد استفاده شود ")
                return
            }
            else {
                document.getElementById("txtSubmit").value = "Save"
                Form1.submit()
            }
        }
        //-------------------------------------
        function ChkKeyOfDate(obj) {
            var ObjPass = obj;
            var lenObj = ObjPass.length
            var key
            var eventObj
            var flag = false
            for (var i = 0; i < lenObj; i++) {
                eventObj = ObjPass.substring(i, i + 1)

                key = eventObj.charCodeAt(0)
               // alert(eventObj +"   "+key)
                if ( key==39) {
                    flag = true
                    i = lenObj;
                }
            }
            return flag;
        }
        //--------------------------------------------------------
    </script>
</head>
<body bottommargin="0" bgcolor="#e5edfe" leftmargin="0" topmargin="0" scroll="no"
    rightmargin="0" onload="LoadForm()">
    <form id="Form1" method="post" runat="server">
    <table id="Table1" height="100%" cellspacing="0" cellpadding="0" width="100%" align="center"
        border="0">
        <tr>
            <td valign="middle" align="center" class="CssLayer1">
                <p>
                    &nbsp;</p>
                <table class="CssLayer2" id="Table2" height="90%" cellspacing="1" cellpadding="1"
                    width="90%" border="0">
                    <tr>
                        <td align="center">
                            <table class="CssPage" id="Table3" style="width: 375px; height: 256px" cellspacing="1"
                                cellpadding="1" width="375" border="0">
                                <tr>
                                    <td align="right">
                                        <table id="Table6" cellspacing="1" cellpadding="1" width="368" border="0" height="240"
                                            style="width: 368px; height: 240px" align="right">
                                            <tr>
                                                <td style="font-family: tahoma; height: 38px; font-size: 10pt; font-weight: bold"
                                                    class="VertGradientBlue1" align="center">
                                                    جهت تغيير مشخصات عبور، کلمه عبور را وارد نماييد.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="middle">
                                                    <table id="Table4" style="width: 269px; height: 128px" cellspacing="1" cellpadding="1"
                                                        width="269" border="0">
                                                        <tr>
                                                            <td style="height: 67px" align="right">
                                                                <table align="right" border="0" style="width: 264px; height: 8px" width="264">
                                                                    <tr>
                                                                        <td>
                                                                            نام كاربر
                                                                        </td>
                                                                        <td width="145">
                                                                            <asp:TextBox ID="UserName" TabIndex="1" runat="server" CssClass="TxtControls" Width="100%"
                                                                                Height="20px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 23px">
                                                                            كلمه عبور
                                                                        </td>
                                                                        <td width="145" style="height: 23px">
                                                                            &nbsp;
                                                                            <asp:TextBox ID="Password" TabIndex="2" runat="server" CssClass="TxtControls" Width="100%"
                                                                                Height="20px" TextMode="Password" EnableViewState="False"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="RowConfirm" style="display: none">
                                                                        <td>
                                                                            تاييد کلمه عبور
                                                                        </td>
                                                                        <td width="145">
                                                                            <asp:TextBox ID="ConfirmPassword" TabIndex="3" runat="server" CssClass="TxtControls"
                                                                                Width="100%" Height="20px" TextMode="Password" EnableViewState="False"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 12px" align="right">
                                                                <hr class="CssHorizontalLine" style="width: 100%; height: 2px" size="1">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table id="Table5" style="width: 64px; height: 36px" cellspacing="1" cellpadding="1"
                                                                    width="64" border="0">
                                                                    <tr>
                                                                        <td id="TdSave" style="display: none">
                                                                            <input class="CssBtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"
                                                                                runat="server">
                                                                        </td>
                                                                        <td id="TdOK" style="display: inline">
                                                                            <input class="CssBtnOk" id="btnOk" type="button" name="btnOk" runat="server">
                                                                        </td>
                                                                        <td style="display: none">
                                                                            <cc2:MySecurity id="OnLineUser" runat="server">
                                                                            </cc2:MySecurity><asp:TextBox ID="Active" Style="display: none" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:Label ID="ErrMsg" runat="server" Width="100%" Height="14px" ForeColor="Red"
                                                                    Font-Bold="True" Font-Size="Larger"></asp:Label>
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
                <input id="txtLogin" runat="server">
                <input id="txtSubmit" runat="server">
                <input id="txtSessionID" runat="server"><input id="txtToPersonId" runat="server">
                <input id="txtFromPersonId" runat="server">
                <input id="txtFromLogin" runat="server">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
