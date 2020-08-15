<%@ Page Title="انواع کاردکس" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="Cardex.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.Cardex" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            var elem = args.get_postBackElement();


        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0) {
                    alert($get(MasterObj + "txtAlert").value)
                }
                else
                    SetMsg($get(MasterObj + "txtAlert").value)
                //alert("خطادرعملیات")
            }
            //if (StrVal != "") {
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
            LastSelectedRow = null
            $get(MasterObj + "txtSubmit").value = "";
            

        }
                                                               
    </script>
    <table style="width:550px">
        <tr>
            <td align="center"  >
                
                <uc1:ToolBar ID="OToolBar" runat="server" />
                
            </td>
        </tr>
        <tr>
            <td align="center" >
                <table>
                    <tr>
                        
                        <td id="ttt" valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />                                        
                                         <asp:HiddenField ID="txtValidate" runat="server" />
                                        
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                        
                                    </div>
                                    <div class="cssDiv" style="width: 100%; height: 431px;" align="center">
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
            </td>
        </tr>
    </table>
   
    <div style="display: none">
       
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="tmp" name="tmp" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtCardexID" name="txtCardexID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        
    </div>

    <script type="text/javascript" language="javascript">
    var LastSelectedRow = null;
    var LastSelectedRowClass = "";
        
       
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
            OnClickBtnEdit()
        }
        function OnClickBtnNew() {
            var url = "CardexNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CardexName=" +""
            var StrFeatur = 'dialogHeight: 150px;dialogWidth: 300px;center: Yes;help: no;status: no'
            var Returnval = window.showModalDialog(url, window, StrFeatur)
            if (Returnval != '' & Returnval != undefined) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
        function OnClickBtnCancel() {
            window.close()
        }
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {

                    document.getElementById(MasterObj + "txtCardexID").value = LastSelectedRow.CardexId
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
        function OnClickBtnEdit() {
        if (LastSelectedRow != null) {
        var url = "CardexNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CardexID=" + LastSelectedRow.CardexId + "&CardexName=" + LastSelectedRow.cells[0].firstChild.innerText
            var StrFeatur = 'dialogHeight: 150px;dialogWidth: 300px;center: Yes;help: no;status: no'
            var Returnval = window.showModalDialog(encodeURI(url), window, StrFeatur)
            if (Returnval != '' & Returnval != undefined) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
        else {
            alert("لطفایک سطر را انتخاب کنید")
        }
        }
        function OnClickBtnFilter() {
           
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "btnSubmit").click();
        }
    </script>
</asp:Content>
