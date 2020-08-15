<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.Messages" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script src="../../App_Utility/Scripts/farsitype.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {

            
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "")
                SetMsg($get(MasterObj + "txtAlert").value);

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {

            if (StrVal != "") {

                if ($get(MasterObj + "lblTo").value == "") {

                    document.getElementById('OToolBar_txtFromData').value = "";
                    document.getElementById('OToolBar_txtToData').value = "";
                    document.getElementById('OToolBar_txtTotalData').value = "";

                    document.getElementById('OToolBar_BtnNext').disabled = true;
                    document.getElementById('OToolBar_BtnPrv').disabled = true;
                    document.getElementById('OToolBar_BtnFirst').disabled = true;
                    document.getElementById('OToolBar_BtnLast').disabled = true;
                }
                else if ($get(MasterObj + "lblTo").value != "") {
                    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;

                    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                        document.getElementById('OToolBar_BtnNext').disabled = true
                    else
                        document.getElementById('OToolBar_BtnNext').disabled = false;

                    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                        document.getElementById('OToolBar_BtnPrv').disabled = true
                    else
                        document.getElementById('OToolBar_BtnPrv').disabled = false;

                    document.getElementById('OToolBar_BtnFirst').disabled = false;
                    document.getElementById('OToolBar_BtnLast').disabled = false;

                }
            }

        }
    </script>

    <table width="90%">
        <tr>
            <td>
            <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                <table width="100%">
                    <tr>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc4:KCalendar ID="KCalSDate" runat="server" />
                            
                        </td>
                        <td>
                            تا تاريخ :
                            
                        </td>
                        <td>
                            <uc4:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td align="left" style="width:100px">
                            شرح :
                        </td>
                        <td style="width:180px">
                            <input id="txtDesc" type="text" runat="server" lang="fa-IR" class="TxtControls" onchange="aa()"/>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center" style="width:100%">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtSDate" runat="server" />
                                    <asp:HiddenField ID="txtEDate" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                    <asp:HiddenField ID="lblTo" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    <asp:HiddenField ID="txtOrderString" runat="server" />
                                    <asp:HiddenField ID="txtCodePermision" runat="server" />
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    <asp:HiddenField ID="CurPage" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div style="display: none">
                                <cc1:MySecurity ID="OnLineUser" runat="server">
                                </cc1:MySecurity>
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtSDateFilter" name="SDate" runat="server" />
                                <input type="text" id="txtEDateFilter" name="EDate" runat="server" />
                                <input type="text" id="txtDate" name="txtDate" runat="server" />
                                <input type="text" id="txtID" name="txtID" runat="server" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                                <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                                <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                                <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                                <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                                <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                                    runat="server" />
                                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                    runat="server" />
                                <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                                <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                                <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                                <input type="text" id="txtFilterDesc" name="txtFilterDesc" runat="server" />
                            </div>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>

    <script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/DataEntry/Messages.js?v=1.1">
        
    </script>

</asp:Content>
