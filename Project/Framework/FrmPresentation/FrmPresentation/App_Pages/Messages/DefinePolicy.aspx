<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefinePolicy.aspx.cs" Inherits="FrmPresentation.App_Pages.Messages.DefinePolicy" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
        }

        function EndRequestHandler(sender, args) {

            var StrVal = $get(MasterObj + "txtSubmit").value
            $get(MasterObj + "txtAlert").value = StrVal
            LastSelectedRow = "";
            CountChkSelected = 0

            if (StrVal != "") {
                if ($get(MasterObj + "lblTo").value == "") {
                    document.getElementById(MasterObj + 'txtFromData').value = "";
                    document.getElementById(MasterObj + 'txtToData').value = "";
                    document.getElementById(MasterObj + 'txtTotalData').value = "";

                    document.getElementById(MasterObj + 'BtnNext').disabled = true;
                    document.getElementById(MasterObj + 'BtnPrv').disabled = true;
                    document.getElementById(MasterObj + 'BtnFirst').disabled = true;
                    document.getElementById(MasterObj + 'BtnLast').disabled = true;
                }
                else if ($get(MasterObj + "lblTo").value != "") {
                    document.getElementById(MasterObj + 'txtFromData').value = $get(MasterObj + "lblFrom").value;
                    document.getElementById(MasterObj + 'txtToData').value = $get(MasterObj + "lblTo").value;
                    document.getElementById(MasterObj + 'txtTotalData').value = $get(MasterObj + "lblTotal").value;
                    document.getElementById(MasterObj + 'txtCurPage').value = $get(MasterObj + "lblCurPage").value;
                    document.getElementById(MasterObj + 'txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;

                    if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) == parseInt(document.getElementById(MasterObj + "txtTotalPage").value))
                        document.getElementById(MasterObj + 'BtnNext').disabled = true
                    else
                        document.getElementById(MasterObj + 'BtnNext').disabled = false;

                    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                        document.getElementById(MasterObj + 'BtnPrv').disabled = true
                    else
                        document.getElementById(MasterObj + 'BtnPrv').disabled = false;

                    document.getElementById(MasterObj + 'BtnFirst').disabled = false;
                    document.getElementById(MasterObj + 'BtnLast').disabled = false;
                }
            }
            if (StrVal == "Delete") {
                document.getElementById(MasterObj + "txtAlarmID").value = ""
                if ($get(MasterObj + "txtAlert").value != "")
                    SetMsg($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtSubmit").value = "";

        }
    </script>

    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtAlarmID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                       
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
   
     
    <div style="display: none">
        <input type="text" id="txtSessionID" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
       <asp:Button ID="BtnSubmit" OnClick ="BtnSubmit_Click" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var MasterObjSearch = "ctl00_Snap3_ContentPlaceHolderSearch_";
        window.name = "Alarm.aspx"
        window.target = window.name;
        /////-------------------------------------------
    </script>

    <script language="javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var GroupID = '0';
        var CountChkSelected = 0
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById(MasterObj + 'BtnPrv').disabled = true;
        document.getElementById(MasterObj + 'txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById(MasterObj + 'txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById(MasterObj + 'txtTotalData').value = $get(MasterObj + "lblTotal").value;
        document.getElementById(MasterObj + 'txtCurPage').value = $get(MasterObj + "lblCurPage").value;
        document.getElementById(MasterObj + 'txtTotalPage').value = $get(MasterObj + "lblTotalpage").value;
        if (parseInt(document.getElementById(MasterObj + "txtCurPage").value) == parseInt(document.getElementById(MasterObj + "txtTotalPage").value))
            document.getElementById(MasterObj + 'BtnNext').disabled = true
        else
            document.getElementById(MasterObj + 'BtnNext').disabled = false;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("txtCurPage").value = document.getElementById("txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("txtTotalPage").value);
            if (document.getElementById("txtCurPage").value != "" &&
                    document.getElementById("txtCurPage").value != "0") {
                if (parseInt(document.getElementById("txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "ShowCurPage";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {

            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickImgParameter(obj) {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            var RequsterAction = "";
            var RequsterPageID = 0

            if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                RequsterAction = event.srcElement.id.replace('OToolBar_', '')
            }

            url = "../BaseInfo/Person/SelectPerson.aspx?ShowFlag=0 &Page=GroupMember &GroupID=" + document.getElementById(MasterObj + "txtGroupAccessID").value
                + " &RequsterPageID=1129"
                + " &RequsterAction=" + RequsterAction
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value


            var returnValue
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no")

            if (returnValue != undefined) {
                ModifyXML(returnValue);

                $get(MasterObj + "txtSubmit").value = "Search";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)


            if (document.getElementById(MasterObj + "txtAlarmID").value != "") {
                var StrConf = "آيا از حذف مطمئنيد؟"
                if (confirm(StrConf)) {
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("لطفا ابتدا يک سطر انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            if (document.getElementById(MasterObj + "txtAlarmID").value != "") {
                url = "AlarmNew.aspx?ScriptID=" + LastSelectedRow.ScriptID
                + " &Alarm=" + LastSelectedRow.AlarmID
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value

                var returnValue
                returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

                if (returnValue == "1") {
                    $get(MasterObj + "txtSubmit").value = "Search";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("لطفا ابتدا يک سطر انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd(SelectedRow) {
            OnClickBtnEdit()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }

            document.getElementById(MasterObj + "txtAlarmID").value = SelectedRow.AlarmID
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            url = "AlarmNew.aspx?ScriptID=0"
            + " &Alarm=0"
                + " &ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                + " &SessionID=" + $get(MasterObj + "txtSessionID").value

            var returnValue
            returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

            if (returnValue == "1") {
                $get(MasterObj + "txtSubmit").value = "Search";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>

