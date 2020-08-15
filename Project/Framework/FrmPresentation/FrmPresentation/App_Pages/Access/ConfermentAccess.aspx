<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ConfermentAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.ConfermentAccess"
    ValidateRequest="false" AsyncTimeout="1800" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
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
                SetMsg($get(MasterObj + "txtAlert").value);
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
                <table>
                    <tr valign="top">
                        <td>
                            <fieldset style="width: 300px; height: 200px; border-right: #FFCCFF thin inset; border-top: #FFCCFF thin solid;
                                border-left: #FFCCFF thin outset; border-bottom: #FFCCFF thin solid">
                                <legend style="color: #3333CC">مشخصات</legend>
                                <table>
                                    <tr>
                                        <td>
                                            از تاريخ :
                                        </td>
                                        <td colspan="3">
                                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                                        </td>
                                    </tr>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                به :
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <uc2:ComboBox ID="CmbtoPerson" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            از ساعت:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtSTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this);"
                                                    style="width: 60px" runat="server" type="text" class="TxtControls" value="00:00" />
                                            </div>
                                        </td>
                                        <td>
                                            تا ساعت:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtETime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this);"
                                                    style="width: 60px" runat="server" type="text" class="TxtControls" value="23:59" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="right">
                                                <input type="checkbox" id="chkPresentCondition" runat="server" />
                                                در صورت عدم حضور
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="width: 240px; height: 80%; overflow: auto; scrollbar-highlight-color: white;
                                        overflow: auto; width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;"
                                        align="right">
                                        <ComponentArt:TreeView ID="TVMenu" runat="server" AutoPostBackOnNodeCheckChanged="True"
                                            BackColor="Transparent" ExpandSinglePath="True" Height="420px" LineImagesFolderUrl="../../App_Utility/Images/TreeViewLine/"
                                            ShowLines="True" Width="350px" DefaultImageHeight="10" DefaultImageWidth="13"
                                            HoverNodeCssClass="TreeNodeMouseOver" LineImageHeight="20" LineImageWidth="20"
                                            NodeCssClass="TreeNode" SelectedNodeCssClass="TreeNodeSelected" OnNodeCheckChanged="TVMenu_NodeCheckChanged">
                                        </ComponentArt:TreeView>
                                    </div>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtTreeXml" runat="server" />
                                    <asp:HiddenField ID="txtConfermentID" runat="server" />
                                    <asp:HiddenField ID="txtChekTree" runat="server" />
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
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtOnlineUserCode" name="txtOnlineUserCode" runat="server" />
                    <input type="text" id="txtToday" runat="server" />
                    <input type="text" id="txtXmlProperties" runat="server" />
                    <input type="text" id="txtMenuItemID" runat="server" />
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <input type="text" id="txtAllPersViewOption" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/jquery.xmlDom.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $("body").css("overflow", "hidden");
        //document.body.scroll="no"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var TreeXml = "";
        /////-------------------------------------------
        window.name = "ConfermentAccess.aspx"
        window.target = window.name;
        window.returnValue = "0";
        if ($get(MasterObj + "txtConfermentID").value == "" || $get(MasterObj + "txtConfermentID").value == "0") {
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
        }
        $("#" + MasterObj + "CmbfromPerson_txtOnChangeFunc").val("OnClickBtnChangeCmbFromPerson()");
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            OnClickBtnClear()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnClear() {
            document.getElementById(MasterObj + "txtETime").value = "23:59";
            document.getElementById(MasterObj + "txtSTime").value = "00:00";
            document.getElementById(MasterObj + "CmbtoPerson_txtCode").value = ""
            document.getElementById(MasterObj + "CmbtoPerson_txtPCode").value = ""
            document.getElementById(MasterObj + "CmbfromPerson_txtCode").value = ""
            document.getElementById(MasterObj + "chkPresentCondition").checked = false

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
        }
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
            //alert(XMLStr);
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;

            if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
                alert("لطفا تاريخ شروع را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "") {
                alert("لطفا تاريخ خاتمه را انتخاب نمائيد")
                return false;
            }
            else if (SDate > EDate) {
                alert("تاريخ شروع از تاريخ خاتمه بزرگتر است")
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
            else if (document.getElementById(MasterObj + "CmbtoPerson_txtCode").value == document.getElementById(MasterObj + "CmbfromPerson_txtCode").value) {
                alert("نام تفويض دهنده و تفویض شونده یکسان نباشد")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtChekTree").value == "0") {
                alert("هیچ نودی از درخت انتخاب نشده است")
                return false;
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (TreeXml == "") {
                $("#" + MasterObj + "txtChekTree").val('0');
                TreeXml = $.xmlDOM($("#" + MasterObj + "txtTreeXml").val());
                $(TreeXml)
              .find("Node")
              .each(function () {
                  if ($(this).attr("Checked") == 'True') {
                      $("#" + MasterObj + "txtChekTree").val('1');
                  }
              });
            }
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
        function OnClickBtnChangeCmbFromPerson() {
            if (document.getElementById(MasterObj + "CmbfromPerson_txtCode").value != "") {
                document.getElementById(MasterObj + "txtSubmit").value = "Refresh";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
