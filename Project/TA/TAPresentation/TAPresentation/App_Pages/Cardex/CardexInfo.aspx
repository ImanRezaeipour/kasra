<%@ Page Title="------------------------نمايش کاردکس-------------------------------------"
 Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexInfo.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexInfo" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        //document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {


                    }
                </script>
            </td>
        </tr>
        <tr>
            <td align="center" id="TDPersonInfo" style="display: none">
                <table id="Table1" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; width: 376px; border-bottom: lightblue thin solid;
                    height: 29px" cellspacing="1" cellpadding="1" align="center" border="0">
                    <tr>
                        <td class="style2">
                            شماره پرسنلي:
                        </td>
                        <td id="PersonIDTD" style="color: #ff0000" runat="server" class="style3">
                        </td>
                        <td class="style1">
                            نام پرسنل:
                        </td>
                        <td id="NameTD" style="color: #ff0000" runat="server">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" id="TDTopRow">
                <table style="width: 80%; height: 25px;">
                    <tr>
                        <td>
                            شماره پرسنلي:
                        </td>
                        <td>
                            <input id="txtPersonCode" style="width: 80px" runat="server" onblur="OnBlurtxtPersonCode()"
                                type="text" />
                        </td>
                        <td>
                            نام و نام خانوادگي:
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <input id="PersonNameSearch" runat="server" name="PersonNameSearch" style="width: 115px"
                                        class="TxtControls" type="text" /><input id="ImgRefreshPersonSearch" name="ImgRefreshPersonSearch"
                                            onclick="onClickImgRefreshPersonSearch()" style="width: 25px; cursor: pointer; height: 22px;"
                                            class="HeaderStyle" type="button" value="..." />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            گروه پرسنلي :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbPerson" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            دوره کاردکس:
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" ID="CmbPeriod" runat="server" Width="120px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" id="TDToolbar" style="width: 100%;">
                <table style="width: 80%;">
                    <tr>
                        <td style="width: 80%;">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                scrollbar-base-color: #b0c4de; height: 100px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="DivGrd" runat="server" align="center" style="scrollbar-highlight-color: white;
                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                            height: 400">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtGrdHeight" name="txtFlagAccess" runat="server" />
        <input id="txtPageMode" name="txtPageMode" type="text" runat="server" />
        <input id="txtCreditID" name="txtPageMode" type="text" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtDelAccess" name="txtDelAccess" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtED" name="txtED" runat="server" />
        
    </div>

    <script language="javascript" type="text/javascript">
       
        var lastPersonCode = $get(MasterObj + "txtPersonCode").value, LastSelectedRow = null, LastSelectedRowClass = "", ShowToolbar = 0
        PageLoad();
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function PageLoad() {
            document.getElementById("OToolBar_BtnCancel").style.display = "none"

            if ($get(MasterObj + "txtPageMode").value == "1") {
                document.getElementById("TDTopRow").style.display = "none"
                document.getElementById("TDPersonInfo").style.display = "inline"

                if (ShowToolbar == 1) {
                    document.getElementById("TDToolbar").style.display = "inline"
                    document.getElementById("OToolBar_BtnFilter").style.display = "none"
                    document.getElementById("OToolBar_BtnCancel").style.display = "inline"
                }
                else
                    document.getElementById("TDToolbar").style.display = "none"
            }
         }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {

            if (document.getElementById(MasterObj + "txtPersonCode").value == ""
            && (document.getElementById(MasterObj + "CmbPerson").value == "0" || document.getElementById(MasterObj + "CmbPerson").value == "")) {
                alert('لطفا شماره پرسنلي را وارد کنيد')
                return
            }
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPersonSearch() {
            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=13129&SessionID=" + $get(MasterObj + "txtSessionID").value;

            var Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");
            if (Result != "" || Result != undefined) {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    var PCode;
                    PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
                    $get(MasterObj + "txtPersonCode").value = PCode;
                    $get(MasterObj + "PersonNameSearch").value = xmlNodes.item(0).selectSingleNode('Family').text
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtPersonCode() {
            if ($get(MasterObj + "txtPersonCode").value == "") {
                $get(MasterObj + "PersonNameSearch").value = "";
                lastPersonCode = "";
            }
            else if ($get(MasterObj + "txtPersonCode").value != lastPersonCode) {
                lastPersonCode = $get(MasterObj + "txtPersonCode").value
                $get(MasterObj + "BtnSubmit2").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        function OnClickResult() {
            var oRow=window.event.srcElement
            while (oRow.tagName!="TR")
                oRow=oRow.parentElement 
            var PersonID = $get(MasterObj + "txtPersonCode").value
            var url2 = "CardexInfoDetail.aspx?PersonCode=" + PersonID
               + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
               + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
               + "&PageMode=1&GrdHeight=250px"
               + "&PersonName=" + document.getElementById(MasterObj + "NameTD").innerHTML
               + "&eDate=" + document.getElementById(MasterObj + "txtED").value
//               + "&eDate=" + document.getElementById(MasterObj + "EDate").value
            var winPro = "dialogHeight: 250px;dialogWidth: 400px;Bottom:0pX;center: No;help: no;status: no;"
            var CardexInfoDialogObj = window.showModalDialog(encodeURI(url2), window, winPro)
        }
    </script>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 71px;
        }
        .style2
        {
            width: 94px;
        }
        .style3
        {
            width: 57px;
        }
    </style>
</asp:Content>