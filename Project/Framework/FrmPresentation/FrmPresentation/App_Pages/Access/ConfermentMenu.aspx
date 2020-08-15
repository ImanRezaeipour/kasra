<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ConfermentMenu.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.ConfermentMenu" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

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
                alert($get(MasterObj + "txtAlert").value);
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";

        }
    </script>

    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server"></uc1:ToolBar>
            </td>
        </tr>
        <tr>
            <td>
                    
                    <table >
                        <tr valign="top">
                            <td>
                           
                                <table>
                                    <tr>
                                        <td>
                                            از تاريخ :
                                        </td>
                                        <td colspan="3">
                                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                                        </td></tr>
                                    <tr>
                                        <td>
                                            تا تاريخ :
                                        </td>
                                        <td colspan="3">
                                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تفويض از:
                                        </td>
                                        <td colspan="3">
                                            <uc2:ComboBox ID="CmbfromPerson" runat="server" />
                                        </td></tr>
                                    <tr>
                                        <td><div align="right" >
                                            به :
                                       </div></td>
                                        <td colspan="3">
                                            <uc2:ComboBox ID="CmbtoPerson" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            از ساعت:
                                        </td>
                                        <td ><div align="right" >
                                            <input id="txtSTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this);"
                                                style="width: 60px" runat="server" type="text" class="TxtControls"
                                                  value="00:00" />
                                        </div></td>
                                        <td >
                                            تا ساعت:
                                        </td>
                                        <td ><div align="right" >
                                            <input id="txtETime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this);"
                                                style="width: 60px" runat="server" type="text" class="TxtControls"  value="23:59" />
                                        </div></td>
                                    </tr>
                                     <tr>
                                        <td>
                                        <div align="right" >
                                           منو:
                                        </div></td>
                                        <td align="right" id="tdMenuTitle" runat="server" colspan="3" style="color: #FF0066"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                        <div align="right" >
                                            <input type="checkbox" id="chkPresentCondition" runat="server" />
                                            در صورت عدم حضور
                                        </div></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                       
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                       
                                        <asp:HiddenField ID="txtConfermentID" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" runat="server" />
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtToday" runat="server" />
                    <input type="text" id="txtXmlProperties" runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtAllPersViewOption" runat="server" />
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript">

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
        window.name = "ConfermentMenu.aspx"
        window.target = window.name;
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "txtToday").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "txtToday").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "txtToday").value.substr(0, 4);
        $get(MasterObj + "KCalEDate_txtDay").value = "29";
        $get(MasterObj + "KCalEDate_txtMonth").value = "12";
        $get(MasterObj + "KCalEDate_txtYear").value = "1399";
        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;

            var Present = 0
            if (document.getElementById(MasterObj + "chkPresentCondition").checked)
                Present = 1
                
            var XMLStr = "<Tb>"
            XMLStr = XMLStr + "<fromPerson>" + document.getElementById(MasterObj + "CmbfromPerson_txtCode").value + "</fromPerson>"
            XMLStr = XMLStr + "<toPerson>" + document.getElementById(MasterObj + "CmbtoPerson_txtCode").value + "</toPerson>"
            XMLStr = XMLStr + "<SDate>" + SDate + "</SDate>"
            XMLStr = XMLStr + "<EDate>" + EDate + "</EDate>"
            XMLStr = XMLStr + "<STime>" + $get(MasterObj + "txtSTime").value + "</STime>"
            XMLStr = XMLStr + "<ETime>" + $get(MasterObj + "txtETime").value + "</ETime>"
            XMLStr = XMLStr + "<ETime>" + $get(MasterObj + "txtETime").value + "</ETime>"
            XMLStr = XMLStr + "<Present>" + Present + "</Present>"
            XMLStr = XMLStr + "</Tb>"
            document.getElementById(MasterObj + "txtXmlProperties").value = "<Root>" + XMLStr + "</Root>"
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
                alert("لطفا تاريخ شروع را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "") {
                alert("لطفا تاريخ خاتمه را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbfromPerson_txtCode").value == "") {
                alert("لطفا تفويض كننده را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbtoPerson_txtCode").value == "") {
                alert("لطفا تفويض شونده را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtSTime").value == "") {
                alert("لطفا ساعت شروع را وارد نمائيد")
                document.getElementById(MasterObj + "txtSTime").focus()
                return false;
            }
             else if (document.getElementById(MasterObj + "txtETime").value == "") {
                alert("لطفا ساعت خاتمه را وارد نمائيد")
                document.getElementById(MasterObj + "txtETime").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbfromPerson_txtCode").value == document.getElementById(MasterObj + "CmbtoPerson_txtCode").value) {
                alert("نام تفويض دهنده و تفویض شونده یکسان نباشد")
                return false;
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (document.getElementById(MasterObj + "CmbtoPerson_txtCode").value == "0")
                document.getElementById(MasterObj + "CmbtoPerson_txtCode").value = ""
            if (document.getElementById(MasterObj + "CmbfromPerson_txtCode").value == "0")
                document.getElementById(MasterObj + "CmbfromPerson_txtCode").value = ""
            if (checkNotEmpty() == true) {
                MakeXML()
                window.returnValue = "1";
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>

