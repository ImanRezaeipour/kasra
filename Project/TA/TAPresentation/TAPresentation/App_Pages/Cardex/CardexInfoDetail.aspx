<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexInfoDetail.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexInfoDetail"
Title="----------------------------—Ì“ò«—œò”--------------------------------------"
    ValidateRequest="false" 
 %>
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
            <td align="center" id="TDPersonInfo" style="display: inline">
                <table id="Table1" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; width: 350px; border-bottom: lightblue thin solid;
                    height: 29px" cellspacing="1" cellpadding="1" align="center" border="0">
                    <tr>
                        <td class="style2">
                            ‘„«—Â Å—”‰·Ì&nbsp; &nbsp;:
                        </td>
                        <td id="PersonIDTD" style="width: 60px; color: #ff0000" runat="server">
                        </td>
                        <td class="style1">
                            ‰«„ Å—”‰·:
                        </td>
                        <td id="NameTD" style="color: #ff0000" runat="server">
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
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtED" name="txtED" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">
       
        var LastSelectedRow = null, LastSelectedRowClass = ""
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById("TDToolbar").style.display = "none"
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
    </script>

</asp:Content>