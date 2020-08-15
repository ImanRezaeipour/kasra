<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="TouchMenue.aspx.cs" Inherits="FrmPresentation.App_Pages.Login.TouchMenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="height: 40">
            </td>
        </tr>
    </table>
    <table border="3" width="500" style="height:550;background-color: #558DC6">
        <tr>
            <td>
                <table border="2" width="430" style="background-color: #8FB5DA">
                    <tr>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td style="font-size: large;">
                                        <br style="font-size: small" />
                                        <span dir="ltr" style="filter: progid:DXImageTransform.Microsoft.Glow(color=#B69EDE,strength=15);">
                                            لطفا يکي از موارد زير را انتخاب کنيد</span><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <input onmouseover="onmouseoverBtn(this)" onmouseout="onmouseoutBtn(this)" id="Button1"
                                            type="button" value="کارکرد دوره جاری        " style="width: 216; height: 56;
                                            background-image: url('../../App_Utility/Images/Icons/TouchLogin/ebbtcbinsmenu1_1.gif');
                                            color: White; cursor: pointer; font-size: large; font-family: KasraB Traffic" onclick="OnClickBtnCuurentDaily()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <input onmouseover="onmouseoverBtn(this)" onmouseout="onmouseoutBtn(this)" id="BtnKarKard"
                                            type="button" value="کارکرد دوره قبل        " style="width: 216; height: 56; background-image: url('../../App_Utility/Images/Icons/TouchLogin/ebbtcbinsmenu1_1.gif');
                                            color: White; cursor:pointer; font-size: large; font-family: KasraB Traffic" onclick="OnClickBtnPrvDaily()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <input onmouseover="onmouseoverBtn(this)" onmouseout="onmouseoutBtn(this)" id="BtnCardex"
                                            type="button" value="مشاهده کاردکس         " style="width: 216; height: 56; background-image: url('../../App_Utility/Images/Icons/TouchLogin/ebbtcbinsmenu1_1.gif');
                                            color: White; cursor:pointer; font-size: large; font-family: KasraB Traffic" onclick="OnClickBtnCardex()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <input onmouseover="onmouseoverBtn(this)" onmouseout="onmouseoutBtn(this)" id="BtnBack"
                                            type="button" value="خروج" style="width: 216; height: 56; background-image: url('../../App_Utility/Images/Icons/TouchLogin/ebbtcbinsmenu1_1.gif');
                                            color: White; cursor:pointer; font-size: large; font-family: KasraB Traffic" onclick="OnClickBtnCancel()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 40">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="height: 40">
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtUserName" runat="server" />
        <input type="text" id="txtSessionID" runat="server" />
        <input type="text" id="txtValidUser" runat="server" />
        <input type="text" id="txtPersonID" runat="server" />
        <input type="text" id="txtWPID" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtPrvWPID" runat="server" />
        <input type="text" id="PrvSDate" runat="server" />
        <input type="text" id="PrvEDate" runat="server" />
        <input type="text" id="txtPersonCode" runat="server" />
        <input type="text" id="txtPersonName" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Button" />
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        function onmouseoverBtn(Obj) {
            Obj.style.color = "Yellow";
            //Obj.style..url="../../App_Utility/Images/Icons/TouchLogin/ebbtcbinsmenu1_1.gif";
        }
       
        //====================================
        function onmouseoutBtn(Obj) {
            Obj.style.color = "White";
        }
        //====================================
        function OnClickBtnCuurentDaily() {
            if (document.getElementById(MasterObj + "txtValidUser").value == "1") {
                var PersonCode = document.getElementById(MasterObj + "txtPersonCode").value
                var url = "/TAPresentation/App_Pages/Reports/MainDailyReport.aspx?PersonCode=" + PersonCode
                + "&SDate=" + document.getElementById(MasterObj + "SDate").value
                + "&EDate=" + document.getElementById(MasterObj + "EDate").value
                + "&RequsterPageID=1306&RequsterAction=PersonCode"
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtPersonID").value
                + "&OnLineUser=" + document.getElementById(MasterObj + "txtPersonID").value
                + "&WPID=" + document.getElementById(MasterObj + "txtWPID").value
                + "&PersonName=" + document.getElementById(MasterObj + "txtPersonName").value
                var winPro = "dialogWidth:1450px;dialogHeight:1000px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes"
                window.showModelessDialog(encodeURI(url), window, winPro)
            }
        }
        //====================================
        function OnClickBtnPrvDaily() {
            if (document.getElementById(MasterObj + "txtValidUser").value == "1") {
                var PersonCode = document.getElementById(MasterObj + "txtPersonCode").value
                var url = "/TAPresentation/App_Pages/Reports/MainDailyReport.aspx?PersonCode=" + PersonCode
                + "&SDate=" + document.getElementById(MasterObj + "PrvSDate").value
                + "&EDate=" + document.getElementById(MasterObj + "PrvEDate").value
                + "&RequsterPageID=1306&RequsterAction=PersonCode"
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + document.getElementById(MasterObj + "txtPersonID").value
                + "&OnLineUser=" + document.getElementById(MasterObj + "txtPersonID").value
                + "&WPID=" + document.getElementById(MasterObj + "txtPrvWPID").value
                + "&PersonName=" + document.getElementById(MasterObj + "txtPersonName").value
                var winPro = "dialogWidth:1450px;dialogHeight:1000px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes"
                window.showModelessDialog(encodeURI(url), window, winPro)
            }
        }
        //====================================
        function OnClickBtnMonthly() {
            if (document.getElementById(MasterObj + "txtValidUser").value == "1") {
                var url2 = "/TAPresentation/App_Pages/Reports/MainMonthlyReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtPersonID").value
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&pid=" + document.getElementById(MasterObj + "txtPersonID").value
               + "&wpid=" + document.getElementById(MasterObj + "txtWPID").value
                var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
                window.showModalDialog(encodeURI(url2), window, winPro)
            }
        }
        //====================================
        function OnClickBtnCardex() {
            if (document.getElementById(MasterObj + "txtValidUser").value == "1") {
                var url2 = "/FrmPresentation/App_Pages/FormGenerator/ReportShow.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtPersonID").value
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&PageMode=1&GrdHeight=250px"
               + "&MenuItemID=34205"
               + "&pid=" + document.getElementById(MasterObj + "txtPersonID").value
               + "&wpid=" + document.getElementById(MasterObj + "txtWPID").value
                var winPro = "dialogHeight: 760px;dialogWidth: 950px;center: Yes;help: no;status: no"
                window.showModalDialog(encodeURI(url2), window, winPro)
            }
        }
        //====================================
        function OnClickBtnCancel() {
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //====================================
    </script>

</asp:Content>
