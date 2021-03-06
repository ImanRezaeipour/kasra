<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardReaderDefinition.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderDefinition"
    Title="Untitled Page" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            
        }
        ////==================================================================================
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtAlert").value == " کد کارتخوان تکراری است ") {
                    alert($get(MasterObj + "txtAlert").value);
                    $get(MasterObj + "txtAlert").value = "";
                }
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    $get(MasterObj + "txtAlert").value = "";
                }
            }
            var StrVal = $get(MasterObj + "txtSubmit").value;
            
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
                else
                    if ($get(MasterObj + "lblTo").value != "") {
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
            LastSelectedRow = null;
            LastSelectedRowClass = "";
            flagEditOrIns = false;
            $get(MasterObj + "txtSubmit").value = "";
            var OGrid = document.getElementById("GrdCardReaderDefinition")
            if (OGrid != null) {
                for (var i = 1; i < OGrid.rows.length; i++) {
                    if (OGrid.rows(i).getAttribute("ID") == $get(MasterObj + "txtID").value) {
                        OnClickGrd(OGrid.rows(i))
                        return
                    }
                }
            }
        }  
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="style1" align="center">
                <tr>
                    <td>
                        <table align="center">
                            <tr>
                                <td class="style20">
                                    کد کارتخوان :&nbsp;&nbsp;
                                    <input id="txtCardReaderCode" value="" type="text" runat="server" style="width: 90px" />
                                </td>
                                <td class="style13">
                                    نام کارتخوان :&nbsp;
                                    <input id="txtsCardReaderName" type="text" runat="server" style="width: 90px" />
                                </td>
                                <td class="style9">
                                </td>
                            </tr>
                            <tr>
                                <td class="style19">
                                    مدل :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                    <select id="cmbModel" name="D2" runat="server" style="width: 110px">
                                        <option></option>
                                    </select>
                                </td>
                                <td class="style13">
                                    نوع :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                    <select id="cmbType" name="D2" runat="server" style="width: 110px">
                                        <option></option>
                                    </select>
                                </td>
                                <td class="style21">
                                    <input id="ChkActive" type="checkbox" runat="server" checked="checked" />
                                    فعال
                                    <input id="ChkNotActive" type="checkbox" runat="server" checked="checked" />غير
                                    فعال
                                </td>
                                <td class="style2">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style23">
                        <table align="center" style="vertical-align: top">
                            <tr>
                                <td>
                                    <center>
                                        <uc1:ToolBar ID="OToolBar" runat="server" />
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="height: 340px">
                                        <asp:HiddenField ID="txtID" runat="server" />
                                        <asp:HiddenField ID="txtCorrectDoing" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtValueSearch" runat="server" />
                                        <asp:HiddenField ID="txtSearchFlag" runat="server" />
                                        <asp:HiddenField ID="ToPersonID" runat="server" />
                                        <center>
                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                        </center>
                                        &nbsp;
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div style="display: none">
                <input type="text" id="txtCardTypeID" name="txtCardTypeID" runat="server" value="0" />
                <input type="text" id="txtCardActionID" name="txtCardActionID" runat="server" value="0" />
                <input type="text" id="txtsCardReaderNameSearch" name="txtsCardReaderNameSearch"
                    runat="server" value="" />
                <input type="text" id="txtCradReaderCodeSearch" name="txtCradReaderCodeSearch" runat="server"
                    value="" />
                <input type="text" id="txtcmbModelSearchSearch" name="txtcmbModelSearchSearch" runat="server"
                    value="" />
                <input type="text" id="txtcmbTypeSearch" name="txtcmbTypeSearch" runat="server" value="" />
                <input type="text" id="txtCardReaderID" name="txtCardReaderID" runat="server" value="0" />
                <input type="text" id="txtSaveOrUpdate" name="txtSaveOrUpdate" runat="server" />
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                <input type="text" id="SDate" name="SDate" runat="server" />
                <input type="text" id="EDate" name="EDate" runat="server" />
                <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                    runat="server" />
                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                    runat="server" />
                <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                    runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var flagEditOrIns = false;

        //*************************************Toolbar*************************************
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");
            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);

            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                document.getElementById("OToolBar_txtCurPage").value != "0" &&
                document.getElementById("OToolBar_txtCurPage").value != document.getElementById(MasterObj + "txtCurPage").value) {

                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > parseInt(TotalPage)) {
                    document.getElementById("OToolBar_txtCurPage").value = TotalPage;
                }
                document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
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
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        function OndbClickGrd() {
            if (LastSelectedRow != null) {
                OnClickBtnEdit();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            url = "NewCardReaderDefinition.aspx?ToPersonID=" + $get(MasterObj + "ToPersonID").value
            + "&modalPageStatus=0"
            + "CardReaderID=0"
            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            + "&CompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value
            
            window.showModalDialog(url, window, "dialogHeight:500px; dialogWidth:510px;center: Yes;help: no;status: no")
            OnClickBtnShowAll();

            //            $get(MasterObj + "txtCardReaderCodeModify").value = "";
            //            $get(MasterObj + "txteCardReaderName").value = "";
            //            $get(MasterObj + "cmbTypeModify").value = "0";
            //            $get(MasterObj + "cmbModelModify").value = "0";
            //            $get(MasterObj + "txtCardReaderLocation").value = "";
            //            $get(MasterObj + "chkActiveModify").checked = true;
            //            $get(MasterObj + "chkInActiveModify").checked = false;
            //            $get(MasterObj + "txtCardReaderCodeModify").focus();
            //            flagEditOrIns = false;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow == null)
                alert("  یک سطر راجهت ویرایش انتخاب کنید");
            else {
                url = "NewCardReaderDefinition.aspx?ToPersonID=" + $get(MasterObj + "ToPersonID").value + "&modalPageStatus=1"
                + "&CardReaderID=" + LastSelectedRow.getAttribute("ID") //LastSelectedRow.cells[1].innerText
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                + "&CompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value

                window.showModalDialog(url, window, "dialogHeight:500px; dialogWidth:510px;center: Yes;help: no;status: no")
                OnClickBtnShowAll();

                //                $get(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("ID");
                //                $get(MasterObj + "txtCardReaderCodeModify").value = LastSelectedRow.cells(1).innerText;
                //                $get(MasterObj + "txteCardReaderName").value = LastSelectedRow.cells(2).firstChild.title;
                //                $get(MasterObj + "cmbModelModify").value = LastSelectedRow.CardReaderModelID;
                //                $get(MasterObj + "cmbTypeModify").value = LastSelectedRow.ConnectionTypeID;
                //                $get(MasterObj + "txtCardReaderLocation").value = LastSelectedRow.cells(3).firstChild.title;
                //                $get(MasterObj + "chkActiveModify").checked = true;
                //                $get(MasterObj + "chkInActiveModify").checked = false;
                //                flagEditOrIns = true;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if ($get(MasterObj + "txtCardReaderCodeModify").value == "")
                alert("وارد کردن کد کارتخوان الزامی است");
            else {
                if (!flagEditOrIns)
                    $get(MasterObj + "txtCardReaderID").value = 0;

                $get(MasterObj + "txtSubmit").value = "Modify";
                $get(MasterObj + "btnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if (LastSelectedRow == null)
                alert("یک سطر راجهت حذف انتخاب کنید");
            else {
                if (confirm("آیا برای حذف کارتخوان مطمئنید؟")) {
                    $get(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("ID");
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    $get(MasterObj + "btnSubmit").click();
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ClearFilter() {
            document.getElementById(MasterObj + "txtCardReaderID").value = "";
            document.getElementById(MasterObj + "txtCardReaderCode").value = "";
            document.getElementById(MasterObj + "cmbType").value = 0;
            document.getElementById(MasterObj + "txtsCardReaderName").value = "";
            document.getElementById(MasterObj + "ChkActive").checked = true;
            document.getElementById(MasterObj + "ChkNotActive").checked = true;
            document.getElementById(MasterObj + "cmbModel").value = 0;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            document.getElementById(MasterObj + "txtSearchFlag").value = "0";
            $get(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement);
            ClearFilter();
            //document.getElementById(MasterObj + "txtSearchFlag").value = "1";
            $get(MasterObj + "txtSubmit").value = "ShowAll";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOfflineDataPolling() {
        
            var url = "OfflineDataPolling.aspx?ToPersonID=" + $get(MasterObj + "ToPersonID").value
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
           
            if (LastSelectedRow == null) 
                url += "&CardReaderID=0" 
            else
                url += "&CardReaderID=" + LastSelectedRow.getAttribute("ID"); 
                
            window.showModalDialog(url, window, 'dialogHeight: 200px;dialogWidth:500px;center: Yes;help: no;status: no;')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }

    </script>

</asp:Content>
