<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Category.aspx.vb" Inherits="TA.Category"
    ValidateRequest="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html dir="rtl">
<head>
    <title>--------------------------------------------------------œ” Â »‰œÌ ê—ÊÂ-------------------------------------------------
    </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
    <link href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        ////////////////////////////////////for grid Category
        var LastSelectedRowgrd = null;
        var LastSelectedRowClassgrd = "";
        /////////////////////////////////////////////////////////
        function PageLoad() {
            window.name = "Category"
            Form1.target = window.name

            //==========================
            if (Form1.txtMsg.value != "") {
                alert(Form1.txtMsg.value)
                Form1.txtMsg.value = "";
            }
        }
        /////////////////////////////////////////////////////////
        function onClickbtnNewDown() {
            Form1.txtCategoryId.value = "0"
            Form1.Name.value = ""
            Form1.NameAcronym.value = ""
            Form1.cmbSystem.value = "0"
            Form1.Name.focus();
        }
        /////////////////////////////////////////////////////////
        function onClickbtnEditDown() {
            //            alert()
            if (Form1.Name.value != "") {
                if (Form1.txtCategoryId.value == "0" && !CheckUniqeName())
                    alert("‰«„ œ” Â  ò—«—Ì «” ")
                else {
                    Form1.txtSubmit.value = "Save";
                    Form1.submit()
                }
            }
            else
                alert("·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ")
        }
        /////////////////////////////////////////////////////////
        function onclickgrd(SelectedRow) {
            if (LastSelectedRowgrd != null) {
                LastSelectedRowgrd.className = LastSelectedRowClassgrd;
            }
            LastSelectedRowClassgrd = SelectedRow.className;
            LastSelectedRowgrd = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            LoadData(SelectedRow)
        }
        /////////////////////////////////////////////////////////
        function LoadData(SelectedRow) {
            Form1.txtCategoryId.value = SelectedRow.cells(0).innerText
            Form1.Name.value = SelectedRow.cells(1).innerText
            Form1.NameAcronym.value = SelectedRow.cells(2).innerText
            Form1.cmbSystem.value = SelectedRow.getAttribute("SystemID");
            //            alert(SelectedRow.SystemID)


        }
        /////////////////////////////////////////////////////////
        function onClickbtnDelete() {
            if (Form1.txtCategoryId.value != "0" && Form1.txtCategoryId.value != "") {
                var rsp = window.confirm("¬Ì« «“ Õ–› „ÿ„∆‰Ìœø")
                if (rsp == true) {
                    Form1.txtSubmit.value = "Delete"
                    Form1.submit()
                }
            }
            else
                alert('«» œ« ”ÿ— „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«ÌÌœ')
        }
        /////////////////////////////////////////////////////////
        function CheckUniqeName() {
            if (document.all.item('txtXML').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.all.item('txtXML').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes("/GroupEntity/Category [Name='" + Form1.Name.value + "']")

                if (xmlNodes.length != 0)
                    return false
                else
                    return true
            }
            else
                return true
        }
        /////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////
        //======================================just Enter English========================
        [ ].indexOf || (Array.prototype.indexOf = function (v, n) {
            n = (n == null) ? 0 : n; var m = this.length;
            for (var i = n; i < m; i++)
                if (this[i] == v)
                    return i;
            return -1;
        });
        var Farsi = ['1590', '1589', '1579', '1602', '1601', '1594', '1593', '1607', '1582', '1581', '1580', '1670', '1588', '1587', '1740', '1576', '1604', '1575', '1578', '1606', '1605', '1705', '1711', '1592', '1591', '1586', '1585', '1584', '1583', '1574', '1608', '1662'];
        var English = ['113', '119', '101', '114', '116', '121', '117', '105', '111', '112', '91', '93', '97', '115', '100', '102', '103', '104', '106', '107', '108', '59', '39', '122', '120', '99', '118', '98', '110', '109', '44', '92'];
        function keyEnter(field, e) {
            if (window.event) {
                keynum = e.keyCode;
            }
            else if (e.which) {
                keynum = e.which;
            }
            var FarsiIndex = Farsi.indexOf(keynum.toString());
            if (FarsiIndex != -1) {
                var EnglishCode = English[FarsiIndex];
                field.value += String.fromCharCode(EnglishCode);
                return false;
            }
            else {
                return true;
            }
        }
		
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" scroll="no" rightmargin="0" onload="PageLoad()">
    <form id="Form1" method="post" runat="server">
    <table class="CssLayer1" id="Layer1" height="100%" cellspacing="0" cellpadding="10"
        width="100%" align="center" border="0">
        <tr>
            <td valign="middle" align="center">
                <table class="CssLayer2" id="Layer2" height="100%" cellspacing="0" cellpadding="0"
                    width="100%" border="0">
                    <tr>
                        <td valign="middle" align="center">
                            <table class="CssPage" id="Layer3" height="457" cellspacing="0" cellpadding="10"
                                width="459" border="0" style="width: 459px; height: 457px">
                                <tr>
                                    <td id="TopRow" valign="middle" align="center" runat="server" style="height: 334px">
                                        <table id="Table2" style="width: 398px; height: 300px" cellspacing="5" cellpadding="2"
                                            width="398" border="0">
                                            <tr>
                                                <td align="center">
                                                    <table id="Table11" dir="ltr" style="width: 264px; height: 32px" cellspacing="1"
                                                        cellpadding="1" align="center" border="0">
                                                        <tr>
                                                            <td style="width: 34px">
                                                                <asp:Button ID="FirstBtn" runat="server" Height="26px" BorderStyle="None" BorderColor="Transparent"
                                                                    ToolTip="«Ê·Ì‰" BackColor="Transparent" Width="29px" CssClass="CssFirstPage">
                                                                </asp:Button>
                                                            </td>
                                                            <td align="right">
                                                                <asp:Button ID="PrevBtn" runat="server" Height="24px" BorderStyle="None" BorderColor="Transparent"
                                                                    ToolTip="ﬁ»·Ì" BackColor="Transparent" Width="29px" CssClass="CssPrevPage"></asp:Button>
                                                            </td>
                                                            <td valign="middle" align="right">
                                                                <asp:TextBox ID="Totalpage1" runat="server" Height="24px" BorderStyle="Groove" BackColor="White"
                                                                    Width="40px" CssClass="txtControls" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td dir="rtl" valign="top" align="right">
                                                                &nbsp; «“&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td valign="middle">
                                                                <asp:TextBox ID="CurPage" TabIndex="1" runat="server" Height="24px" BorderStyle="Groove"
                                                                    Width="40px" CssClass="txtControls" AutoPostBack="True"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="NextBtn" runat="server" Height="24px" BorderStyle="None" BorderColor="Transparent"
                                                                    ToolTip="»⁄œÌ" BackColor="Transparent" Width="29px" CssClass="CssNextPage"></asp:Button>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="LastBtn" runat="server" Height="24px" BorderStyle="None" BorderColor="Transparent"
                                                                    ToolTip="¬Œ—Ì‰" BackColor="Transparent" Width="29px" CssClass="CssLastPage">
                                                                </asp:Button>
                                                            </td>
                                                            <td style="display: none">
                                                                <input id="txtReturnMessage1" type="text" name="txtReturnMessage1" runat="server">
                                                                <asp:Button ID="Button1" Style="display: none" runat="server" Width="1px" Text="Button">
                                                                </asp:Button>
                                                                <asp:TextBox ID="OrderField1" Style="display: none" runat="server" Width="1px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <cc1:automationgrid id="grdCategory" runat="server" Height="236px" Width="300px"
                                                        AutoGenerateColumns="False" SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0"
                                                        Scrolling="True" EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False"
                                                        UsingKeyBoard="False" CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" ">
                                                        <itemstyle cssclass="CssItemStyle"></itemstyle>
                                                        <headerstyle horizontalalign="Center" cssclass="CssHeaderStyle" verticalalign="Middle"></headerstyle>
                                                        <alternatingitemstyle cssclass="CssAlternatingItemStyle"></alternatingitemstyle>
                                                        <footerstyle cssclass="CssEditItemStyle "></footerstyle>
                                                        <selecteditemstyle cssclass="CssSelectedItemStyle"></selecteditemstyle>
                                                        <columns>
																	<asp:BoundColumn DataField="CategoryID" HeaderText="òœ œ” Â">
																		<HeaderStyle Width="80px"></HeaderStyle>
																		<ItemStyle Width="100px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="Name" HeaderText="‰«„ œ” Â">
																		<HeaderStyle Width="200px"></HeaderStyle>
																		<ItemStyle Width="200px"></ItemStyle>
																	</asp:BoundColumn>


                                                                 
                                                                    <asp:BoundColumn DataField="AcronymCategory" HeaderText="‰«„ „Œ››">
																		<HeaderStyle Width="150px"></HeaderStyle>
																		<ItemStyle Width="200px"></ItemStyle>
																	</asp:BoundColumn>

                                                                     <asp:BoundColumn DataField="SystemName" HeaderText="“Ì— ”Ì” „">
																		<HeaderStyle Width="150px"></HeaderStyle>
																		<ItemStyle Width="200px"></ItemStyle>
																	</asp:BoundColumn>

                                                                     <asp:BoundColumn DataField="SystemID"   >
																		<HeaderStyle Width="1px"></HeaderStyle>
																		<ItemStyle Width="1px"></ItemStyle>
																	</asp:BoundColumn>


																</columns>
                                                    </cc1:automationgrid>
                                                </td>
                                            </tr>
                                        </table>
                                        <hr class="CssHorizontalLine" style="width: 367px; height: 2px" size="2">
                                        <table id="Table1" style="width: 243px; height: 36px" cellspacing="5" cellpadding="2"
                                            width="243" border="0">
                                            <tr>
                                                <td style="width: 50px">
                                                    ‰«„ œ” Â
                                                </td>
                                                <td>
                                                    <input class="txtControls" id="Name" style="width: 165px; height: 20px" type="text"
                                                        size="22" name="Name" runat="server">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 50px">
                                                    ‰«„ „Œ››
                                                </td>
                                                <td>
                                                    <input class="txtControls" id="NameAcronym" style="width: 165px; height: 20px" type="text"
                                                        size="22" name="NameAcronym" runat="server"  onkeypress="return keyEnter(this,event)" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                    “Ì— ”Ì” „
                                                </td>
                                                <td>
                                                    <cc1:lcombo id="cmbSystem" runat="server" CssClass="txtControls" style="width: 165px;
                                                        height: 20px" LookupName="SubSystem" ConnectionName="GenCnn">
                                                    </cc1:lcombo>
                                                </td>
                                            </tr>
                                        </table>
                                        <hr class="CssHorizontalLine" style="width: 367px; height: 2px" size="2">
                                        <table id="Table3" style="width: 6px; height: 40px" cellspacing="5" cellpadding="2"
                                            width="6" align="center" border="0">
                                            <tr>
                                                <td style="width: 76px">
                                                    <input class="CssBtnNew" style="cursor: hand" id="btnNewDown" onclick="onClickbtnNewDown()"
                                                        type="button" name="btnNewDown">
                                                </td>
                                                <td style="width: 75px">
                                                    <input class="CssbtnSave" style="cursor: hand" id="btnEditDown" onclick="onClickbtnEditDown()"
                                                        type="button" name="btnEditDown">
                                                </td>
                                                <td>
                                                    <input class="CssBtnDelete" id="btnDelete" style="cursor: hand" onclick="onClickbtnDelete()"
                                                        type="button" name="btnDelete">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="center" style="display: none">
                            <input id="txtMsg" type="text" size="1" name="txtMsg" runat="server"><input id="txtXML"
                                type="text" size="1" name="txtXML" runat="server">
                            <input id="txtSubmit" type="text" size="1" name="txtSubmit" runat="server"><input
                                id="txtCategoryId" type="text" size="1" name="txtCategoryId" runat="server">
                            <cc1:mysecurity id="OnLineUser" runat="server">
                            </cc1:mysecurity>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
