<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Scripts.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.Scripts"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table width="950px">
                    <tr>
                        <td>
                            نام الگو
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbTemplateName" runat="server" Height="16px" Width="320px"
                                value="0" CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            مرحله اجرا
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="250px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            دسته بندي
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbCategory" runat="server" Height="16px" Width="200px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام قانون
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbScriptName" runat="server" Height="16px" Width="320px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td align="left">
                            ماهيت
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbType" runat="server" Height="16px" Width="250px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="checkbox" id="chkSystem" runat="server" />سيستمي
                        </td>
                        <td>
                            <input type="checkbox" id="chkUser" runat="server" />کاربري
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td style="width: 22px">
                                    </td>
                                    <td>
                                        کد :
                                    </td>
                                    <td>
                                        <uc1:ComboBox ID="cmbCode" runat="server" />
                                    </td>
                                    <td style="width: 95px">
                                    </td>
                                    <td>
                                        از تاریخ :
                                    </td>
                                    <td>
                                        <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                    <td>
                                        <input type="checkbox" id="ChkActive" runat="server" />فعال
                                    </td>
                                    <td>
                                        <input type="checkbox" id="ChkMActive" runat="server" />نيمه فعال
                                        <input type="checkbox" id="ChkUnActive" runat="server" />غير فعال
                                    </td>
                                    <td style="width: 10px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table>
                                <tr>
                                    <td>
                                        پرسنلي :
                                    </td>
                                    <td>
                                        <uc1:ComboBox ID="CmbPerson" runat="server" />
                                    </td>
                                    <td style="width: 95px">
                                    </td>
                                    <td>
                                        تا تاریخ :
                                    </td>
                                    <td>
                                        <uc2:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="Scripts.aspx" />
                <script type="text/javascript" language="javascript">

                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        LastSelectedRow = null;
                        var StrVal = $get(MasterObj + "txtSubmit").value

                        if ($get(MasterObj + "txtAlert").value != "")
                            if ($get(MasterObj + "txtStatus").value == "1")
                                alert($get(MasterObj + "txtAlert").value);
                            else
                                SetMsg($get(MasterObj + "txtAlert").value);

                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtStatus").value = "";

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
            </td>
        </tr>
        <tr align="center">
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtSaveXml" runat="server" />
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
                        <asp:HiddenField ID="txtStatus" runat="server" />
                        <asp:HiddenField ID="txtCategoryId" runat="server" />
                        <asp:HiddenField ID="txtNewCalc" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
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
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtScriptID" name="txtScriptID" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">

        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById('OToolBar_BtnPrv').disabled = true;
        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
            document.getElementById('OToolBar_BtnNext').disabled = true
        else
            document.getElementById('OToolBar_BtnNext').disabled = false;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            //                if (LastSelectedRow.System == 0) {
            if (LastSelectedRow.type == 1) {
                // alert("قانون هاي فرمولي از اين صفحه قابل ويرايش نمي باشد")
                var strUrl = "DifinitionCodeNew.aspx?CodeID=" + $(LastSelectedRow).attr("CodeID")
                                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                            + "&New=0&System=1&ScriptID=" + LastSelectedRow.ScriptID;
                 
                strUrl = encodeURI(strUrl);
                var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 570px;dialogWidth: 650px;center: Yes;help: no;status: no')
                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else if (LastSelectedRow.type == 2) {//قانون هاي الگويي

                var strUrl = 'ScriptTemplateNew.aspx?ScriptID=' + LastSelectedRow.ScriptID
                        + '&CategoryID=' + document.getElementById(MasterObj + "txtCategoryId").value
                                 + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                                 + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                 + "&System=" + LastSelectedRow.System
                strUrl = encodeURI(strUrl)
                var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')

                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else if (LastSelectedRow.type == 3) {//قانون هاي عادي
                var strUrl = 'ScriptsNew.aspx?ScriptID=' + LastSelectedRow.ScriptID
                        + '&CategoryID=' + document.getElementById(MasterObj + "txtCategoryId").value
                                     + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                                     + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                     + "&System=" + LastSelectedRow.System
                strUrl = encodeURI(strUrl)
                var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')

                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            //                }
            //                else
            //                    alert("قانون هاي سيستمي قابل ويرايش نمي باشد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            $("#" + MasterObj + "txtSDate").val($("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val());
            $("#" + MasterObj + "txtEDate").val($("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val());
            if ($("#" + MasterObj + "txtSDate").val() == '//')
                $("#" + MasterObj + "txtSDate").val('');
            if ($("#" + MasterObj + "txtEDate").val() == '//')
                $("#" + MasterObj + "txtEDate").val('');

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                if (LastSelectedRow.System == 0) {
                    var Msg = "آيا براي حذف مطمئنيد؟"
                    if (confirm(Msg) == true) {
                        document.getElementById(MasterObj + "txtScriptID").value = LastSelectedRow.ScriptID
                        document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                else
                    alert("قانون هاي سيستمي را نمي توانيد حذف کنيد")
            }
            else {
                alert("به منظور حذف يک سطر را انتخاب کنيد")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            var strUrl = 'ScriptsNew.aspx?ScriptID=0&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + '&CategoryID=' + document.getElementById(MasterObj + "txtCategoryId").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')

            if (rValue == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNewTemplate() {
            var strUrl = 'ScriptTemplateNew.aspx?ScriptID=0&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + '&CategoryID=' + document.getElementById(MasterObj + "txtCategoryId").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value

            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:800px;dialogWidth:  880px;center: Yes;help: no;status: no;scroll: no;')

            if (rValue == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            OnClickBtnClear()
            OnClickBtnFilter()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnClear() {
            document.getElementById(MasterObj + "ChkUnActive").checked = false;
            document.getElementById(MasterObj + "ChkActive").checked = false;
            document.getElementById(MasterObj + "ChkMActive").checked = false;
            document.getElementById(MasterObj + "cmbType").value = 0
            document.getElementById(MasterObj + "cmbTemplateName").value = 0
            document.getElementById(MasterObj + "cmbStep").value = 0
            document.getElementById(MasterObj + "cmbCategory").value = 0
            document.getElementById(MasterObj + "chkUser").checked = false
            document.getElementById(MasterObj + "chkSystem").checked = false
            document.getElementById(MasterObj + "cmbCode_txtCode").value = "";
            document.getElementById(MasterObj + "cmbCode_txtPCode").value = "";
            document.getElementById(MasterObj + "cmbCode_txtName").value = "";
            $("#" + MasterObj + "KCalSDate_txtCalendar").val("")
            $("#" + MasterObj + "KCalSDate_txtYear").val("")
            $("#" + MasterObj + "KCalSDate_txtMonth").val("")
            $("#" + MasterObj + "KCalSDate_txtDay").val("")
            $("#" + MasterObj + "KCalEDate_txtCalendar").val("")
            $("#" + MasterObj + "KCalEDate_txtYear").val("")
            $("#" + MasterObj + "KCalEDate_txtMonth").val("")
            $("#" + MasterObj + "KCalEDate_txtDay").val("")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null)
                OndbClickGrd()
            else
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGroups(obj) {
            while (obj.tagName != "TR")
                obj = obj.parentElement
            var strUrl = 'ScriptGroups.aspx?ScriptID=' + obj.ScriptID
                + "&Type=view"
                + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no;scroll: no;')

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
