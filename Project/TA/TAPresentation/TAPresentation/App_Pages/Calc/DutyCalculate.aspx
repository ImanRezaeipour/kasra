<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DutyCalculate.aspx.cs" Inherits="TAPresentation.App_Pages.Calc.DutyCalculate" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <table>
        <%--<ToolBar>--%>
        <tr>
            <td width="100%" align="center">
                
                <uc1:ToolBar ID="OToolBar" runat="server" />
                
            </td>
        </tr>
        <tr>
            <td>
                <%--   <fieldsetdir="rtl"class="fieldsetStyle">

<legendclass="legendStyle"پارامترهای جستجو<</legend>--%>
                <table>
                    <tr>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            
                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                            
                        </td>
                        <td class="style1">
                            تا تاريخ :
                        </td>
                        <td>
                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--   </feildsetdir>--%>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
    <cc1:mysecurity ID="OnLineUser" runat="server"></cc1:mysecurity>
        <%--<cc1:mysecurity ID="OnLineUser" runat="server">
        </cc1:mysecurity>--%>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtCalSDate" runat="server" />
        <input type="text" id="txtCalEDate" runat="server" />
        <input type="text" id="txtSearchXML" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
       <%-- <asp:Button ID="Button1" runat="server" Text="BtnSubmit" />--%>
    </div>
    <script language="javascript" type="text/javascript">

        //====================================================کدهای javaScript==============================================
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        // alert($get(MasterObj + "txtXmlDesc").value)
        //=====================================================تعریف متغیرها================================================
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.dir = "rtl";
        document.body.scroll = "no";
        //==================================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        
        //===================================================================================
        function BeginRequestHandler(sender, args) {
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
        
            if (document.getElementById(MasterObj + "txtSubmit").value == "Calculate")
            
            if ($get(MasterObj + "txtValidate").value != "1") {
                

                    alert($get(MasterObj + "txtAlert").value);
                }
                else SetMsg($get(MasterObj + "txtAlert").value)

                $get(MasterObj + "txtAlert").value=""
        }
        //=======================================================محاسبه============================
        function OnClickBtnCalc() {
            document.getElementById(MasterObj + "txtCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            document.getElementById(MasterObj + "txtCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;

            if (document.getElementById(MasterObj + "txtCalSDate").value == "//" || document.getElementById(MasterObj + "txtCalSDate").value == "") {
                alert("لطفا تاریخ شروع را وارد کنید.")
                return;
            }
            else if (document.getElementById(MasterObj + "txtCalEDate").value == "//" || document.getElementById(MasterObj + "txtCalEDate").value == "") {
                alert("لطفا تاریخ پایان را وارد کنید.")
                return;
            }
            else if (document.getElementById(MasterObj + "txtCalSDate").value > document.getElementById(MasterObj + "txtCalEDate").value) {
                alert("تاریخ پایان کوچکتر از تاریخ شروع است.");
                return;
            }
            else {
                document.getElementById(MasterObj + "txtSubmit").value = "Calculate";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
       }
        
    </script>
</asp:Content>
