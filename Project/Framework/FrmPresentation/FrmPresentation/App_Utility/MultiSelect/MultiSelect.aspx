<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="MultiSelect.aspx.cs" Inherits="FrmPresentation.App_Utility.MultiSelect.MultiSelect" %>

<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table align="right" style="width: 700px">
                    <tr>
                        <td style="width: 59px">
                            <input id="rmashmolin" name="NameType" type="radio" runat="server" />مشمولين
                        </td>
                        <td style="width: 80px">
                            <input id="rgheyremashmolin" name="NameType" type="radio" runat="server"/>غیر
                            مشمولين
                        </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table align="right">
                    <tr>
                        <td style="width: 22px" align="right">
                            <input id="rdPerson" runat="server" type="radio" name="GroupChk" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <div align="right">
                                پرسنلی
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 22px" align="right">
                            <input id="rdGroup" runat="server" type="radio" name="GroupChk" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <div align="right">
                                گروه
                            </div>
                        </td>
                    </tr>
                    <tr id="TDD">
                        <td style="width: 22px" align="right">
                            <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                        </td>
                        <td>
                        </td>
                        <td style="width: 160px">
                            <div align="right">
                                واحد سازماني
                            </div>
                        </td>
                    </tr>
                    <tr id="TDG">
                        <td style="width: 22px" align="right">
                            <input id="rdtable" runat="server" name="GroupChk" type="radio" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <div align="right">
                                دفاتر تابل
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                align="right">
                <div align="right" style="width: 310px">
                    <table id="ScriptGroups_Header1" style="width: 310px;" align="right">
                        <tr>
                            <td align="center" class="CssHeaderStyle" style="width: 25px">
                            </td>
                            <td class="CssHeaderStyle" style="width: 25px" align="center">
                                <input id="chkAll1" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                    type="checkbox" />
                            </td>
                            <td align="center" class="CssHeaderStyle" style="width: 60px">
                                شناسه عضو
                            </td>
                            <td align="center" class="CssHeaderStyle" style="width: 80px">
                                نام عضو
                            </td>
                            <td align="center" class="CssHeaderStyle" style="width: 60px">
                                نوع عضویت
                            </td>
                        </tr>
                    </table>
                    <div style="overflow: auto; width: 327px; height: 200px" align="right">
                        <table id="GrdMultiSelect" style="width: 310px;" onclick="onClickGrdGrouptNew()">
                        </table>
                    </div>
                </div>
                <%--td style="width: 500" align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>--%>
            </td>
        </tr>
        </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <%--  <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />--%>
        <%--  <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />--%>
    </div>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
     <script language="javascript" type="text/javascript">
        var SaveFlag = 0; SaveNewFlag = 0;
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.scroll = "no";
        var strChk = "";
        var Str = ""
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        $(document).ready(function () {
            $("#GrdMultiSelect").click(function () {
                
            });
        });
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            LastSelectedRow = null
            LastSelectedRowClass = ""
        }
        //====================================================================================================
        function OnClickBtnSelect() {
            var returnValue = ""
            var url = ""
            var OUserFlag
            var kind = 0
            if ($("#" + MasterObj + "rdPerson").attr("checked")) {
                    OUserFlag = "U"
                    kind = 0
                    url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + ($("#" + MasterObj + "txtSessionID").val()) + "&CompanyPeriodID=" + ($("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()) + "&OnLineUser=" + ($("#" + MasterObj + "txtOnLineUser").val())
                    returnValue = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
                }
                else if ($("#" + MasterObj + "rdGroup").attr("checked")) {
                    OUserFlag = "G"
                    kind = 0
                    url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + ($("#" + MasterObj + "txtSessionID").val()) + "&CompanyPeriodID=" + ($("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()) + "&OnLineUser=" + ($("#" + MasterObj + "txtOnLineUser").val())
                    returnValue = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
                }
                else if ($("#" + MasterObj + "rdbDepartment").attr("checked")) {
                  
                    OUserFlag = "D"
                    kind = 0
                    url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + ($("#" + MasterObj + "txtSessionID").val()) + "&CompanyPeriodID=" + ($("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()) + "&OnLineUser=" + ($("#" + MasterObj + "txtOnLineUser").val())
                    returnValue = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
                }
                else if ($("#" + MasterObj +"rdtable").attr("checked")) {
                   
                    OUserFlag = "T"
                    kind = 0
                    url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?Type=Check&SessionID=" + ($("#" + MasterObj + "txtSessionID").val()) + "&CompanyPeriodID=" + ($("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()) + "&OnLineUser=" + ($("#" + MasterObj + "txtOnLineUser").val())
                    returnValue = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
                }

                //-------------------------------------------------------
                var OSelectedMamber = "";
                if (url != "") {
                    OSelectedMamber = window.showModalDialog(url, "", returnValue)
                    url = ""
                }
                if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")

                    CreateGrid(OSelectedMamber, OUserFlag, kind);
//            }
        }

        </script>

</asp:Content>
