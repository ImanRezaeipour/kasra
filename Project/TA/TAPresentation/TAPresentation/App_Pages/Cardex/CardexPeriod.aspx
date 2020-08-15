
<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardexPeriod.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexPeriod" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
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
            }
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
    <table>
        <tr>
            <td >
                
                <uc1:ToolBar ID="OToolBar" runat="server" />
                
            </td>
        </tr>
        <tr>
            <td style="width: 2000px" align="center" >
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
                                    <div class="cssDiv" style="width: 100%; height: 431px;">
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
         <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtTmpFilter" name="tmp" runat="server" />
        
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="tmp" name="tmp" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        
        
       <input type="text" id="txtCardexPeriodID" name="txtCardexPeriodID" runat="server" />
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
            var url = "CardexPeriodNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CardexPeriodID=0"                
            var StrFeatur = 'dialogHeight: 800px;dialogWidth: 850px;center: Yes;help: no;status: no'
            var Returnval = window.showModalDialog(url, window, StrFeatur)
            if (Returnval != '' & Returnval != undefined) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
        function OnClickBtnNewCardex() {
            var url = "Cardex.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            var StrFeatur = 'dialogHeight: 350px;dialogWidth: 600px;center: Yes;help: no;status: no'
            var Returnval = window.showModalDialog(url, window, StrFeatur)
            
        }
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {                    
                    document.getElementById(MasterObj + "txtCardexPeriodID").value = LastSelectedRow.CardexPeriodID
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

                var url = "CardexPeriodNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CardexPeriodID=" + LastSelectedRow.CardexPeriodID + "&PeriodKind=" + LastSelectedRow.CardexId + "&PeriodName=" + LastSelectedRow.cells[1].firstChild.innerText + "&StartPeriod=" + LastSelectedRow.SWPID + "&EndPeriod=" + LastSelectedRow.EWPID + "&StartCode=" + LastSelectedRow.startCodeID + "&RemainCode=" + LastSelectedRow.RemainCodeID + "&FireCode=" + LastSelectedRow.WasteCodeID + "&MolzamCode=" + LastSelectedRow.MolzamCodeID + "&RemainType=" + LastSelectedRow.ShowTypeCode + "&Show=" + LastSelectedRow.ShowInRelating + "&DayHour=" + LastSelectedRow.DayHour
                var StrFeatur = 'dialogHeight: 800px;dialogWidth: 850px;center: Yes;help: no;status: no'
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
        function OnClickBtnTransferRemind() {
            if (LastSelectedRow != null) {
              var url = "RemindCardexTransfer.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CardexPeriodID=" + LastSelectedRow.CardexPeriodID + "&PeriodKind=" + LastSelectedRow.CardexId + "&PeriodName=" + LastSelectedRow.cells[1].firstChild.innerText + "&StartPeriod=" + LastSelectedRow.SWPID + "&EndPeriod=" + LastSelectedRow.EWPID
                    + "&IncCodeName=" + $(LastSelectedRow).find("td:eq(" + 7 + ")").text()
                    + "&DecCodeName=" + $(LastSelectedRow).find("td:eq(" + 8 + ")").text()
                    + "&IncCodeID=" + LastSelectedRow.IDAfzaiandeCode
                    + "&DecCodeID=" + LastSelectedRow.IDKahandeCode
                    + "&startCodeID=" + LastSelectedRow.startCodeID
                    + "&WasteCodeID=" + LastSelectedRow.WasteCodeID; 
                var StrFeatur = 'dialogHeight: 800px;dialogWidth: 1000px;center: Yes;help: no;status: no'
                var Returnval = window.showModalDialog(encodeURI(url), window, StrFeatur)
            } else {
                alert('لطفا یک سطر از گرید انتخاب کنید');
            }
        } 
    </script>
</asp:Content>
