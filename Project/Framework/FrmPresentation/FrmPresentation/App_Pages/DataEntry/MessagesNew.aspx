<%@ Page Title="========================================================ایجادپیام========================================================="
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="MessagesNew.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.MessagesNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>


<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        #txtDesc
        {
            width: 472px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
            $get(MasterObj + "txtAlert").value = "";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {

            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";


            var StrVal = $get(MasterObj + "txtSubmit").value;

            if (StrVal != "") {
                if (StrVal == "Save") {

                    $get(MasterObj + "txtSaveXml").value = "<Root></Root>";
                    SetMsg($get(MasterObj + "txtAlert").value);
                   // CreateGrid("First")

                    $get(MasterObj + "txtDesc").value = ""
                    $get(MasterObj + "txtMessageSubject").value = "";
                    $get(MasterObj + "ddlKInd").value = "12501"
                    $get(MasterObj + "KCalSDate_txtYear").value = ""
                    $get(MasterObj + "KCalSDate_txtMonth").value = ""

                    $get(MasterObj + "KCalSDate_txtDay").value = ""
                    $get(MasterObj + "KCalEDate_txtYear").value = ""
                    $get(MasterObj + "KCalEDate_txtMonth").value = ""
                    $get(MasterObj + "KCalEDate_txtDay").value = ""
                    $get(MasterObj + "KCalSDate_txtCalendar").value = ""
                    $get(MasterObj + "KCalEDate_txtCalendar").value = ""
                    $get(MasterObj + "txtCnt").value = ""
                    window.returnValue = true


                }
            }
        }
    </script>

    <table style="width: 500px" align="center">
        <tr>
            <td colspan="6" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" >
                ازتاريخ
            </td>
            <td>
                <uc4:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td align="right">
                تاتاريخ
            </td>
            <td>
                <uc4:KCalendar ID="KCalEDate" runat="server" />
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" >
                نوع
            </td>
            <td>
                <asp:DropDownList align="right" ID="ddlKInd" runat="server" Width="150px" class="TxtControls">
                </asp:DropDownList>
                &nbsp;
            </td>
            <td>
                تعداددفعات
            </td>
            <td>
                <input id="txtCnt" type="text" runat="server" style="width: 150px" onkeydown="OnKeyDownInt(this.value)"
                    class="TxtControls" />
            </td>
            <td>
                فعال/غيرفعال
            </td>
            <td>
                <asp:DropDownList ID="ddlAction" runat="server" Width="75px" class="TxtControls">
                </asp:DropDownList>
                
            </td>
        </tr>
        <tr>
            <td>
                موضوع
            </td>
            <td  align="right" colspan="5" >
                <asp:TextBox ID="txtMessageSubject" align="right"  runat="server"  Width="98%" Height="20px"
                    class="TxtControls"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                شرح
            </td>
            <td colspan="5" >
                <asp:TextBox ID="txtDesc" align="right"  runat="server" TextMode="MultiLine" Width="98%" Height="150px"
                    class="TxtControls"></asp:TextBox>
            </td>
        </tr>
        <tr bgcolor="#bfd5ea" style="display:none">
            <td colspan="6">
                <table width="100%">
                    <tr>
                        <td style="height: 22px" align="center">
                            <input id="RadRole" type="radio" checked name="GroupChk" runat="server" />
                            واحد سازماني
                        </td>
                        <td style="height: 22px" align="center">
                            <input id="RadGroup" type="radio" name="GroupChk" runat="server" />
                            گروه پرسنلي
                        </td>
                        <td style="height: 22px" align="center">
                            <input id="RadPerson" type="radio" name="GroupChk" runat="server" />
                            پرسنل
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" colspan="6">
                <div align="center" style="display:none">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <fieldset dir="rtl" style="width: 70%; height: 292px; border-right: lightblue thin inset;
                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                align="center">
                                <legend style="color: lightblue">اعضا</legend>
                                <table id="XTabTable_Header" style="width: 299px; height: 11px;" cellpadding="0"
                                    align="center" cellspacing="0">
                                    <thead style="display: inline">
                                        <tr class="ShoperHeaderStyle">
                                            <%--<td class="CssHeaderStyle" style="width: 3px" align="center">
                                                <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" name="chkAll">
                                            </td>--%>
                                            <td class="CssHeaderStyle" align="center">
                                                نام
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 304px;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 292px" align="center">
                                    <table id="XTabTable" align="center">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                            </fieldset>
                            <div style="display: none">
                                <asp:HiddenField ID="txtSDate" runat="server" />
                                <asp:HiddenField ID="txtEDate" runat="server" />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="lblFrom" runat="server" />
                                <asp:HiddenField ID="lblTo" runat="server" />
                                <asp:HiddenField ID="Totalpage" runat="server" />
                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                <asp:HiddenField ID="lblTotal" runat="server" />
                                <asp:HiddenField ID="txtPageSize" runat="server" />
                                <asp:HiddenField ID="txtPageNumber" runat="server" />
                                <asp:HiddenField ID="txtOrderString" runat="server" />
                                <asp:HiddenField ID="txtCodePermision" runat="server" />
                                <asp:HiddenField ID="CurPage" runat="server" />
                                <asp:HiddenField ID="SDate" runat="server" />
                                <asp:HiddenField ID="EDate" runat="server" />
                                <asp:HiddenField ID="txtAlert" runat="server" />
                                <asp:HiddenField ID="txtID" runat="server" />
                                <input type="text" id="CalcStatusID" name="CalcStatusID" runat="server" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="6">
                <div style="display: none">
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
                    <input type="text" id="txtXmlMember" name="txtXmlMember" runat="server" />
                    <input id="txtMenuItemID" name="txtMenuItemID" runat="server" />
                    <input id="txtFlagAccess" name="txtFlagAccess" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/DataEntry/MessagesNew.js?v=1.1">
       
    </script>

</asp:Content>
