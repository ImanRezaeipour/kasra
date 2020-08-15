<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="EditConfermentAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.EditConfermentAccess"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                SetMsg($get(MasterObj + "txtAlert").value);
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            SetChk();
        }
    </script>
    <table align="center">
        <tr valign="top">
            <td>
                <fieldset style="width: 700px; border-right: #FFCCFF thin inset; border-top: #FFCCFF thin solid;
                    border-left: #FFCCFF thin outset; border-bottom: #FFCCFF thin solid">
                    <legend style="color: #3333CC">فيلترهاي جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                از تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                تفويض از:
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbfromPerson" runat="server" />
                            </td>
                            <td>
                                <div align="right">
                                    به :
                                </div>
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbtoPerson" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server"></uc1:ToolBar>
            </td>
        </tr>
        <tr>
            <td>
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
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                    
                    <div id="GridViewPerson">
                        <cc2:KasraGrid ID="GrdConferment" runat="server" OnRowDataBound="Grid_RowDataBound">
                        </cc2:KasraGrid>
                    </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr id="yyy">
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
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtAllPersViewOption" name="txtAllPersViewOption" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"; 
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
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
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById(MasterObj + "GrdConferment");
            if (OGrid == null)
                return
          
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;
            var strXml = $get(MasterObj + "txtSaveXml").value
            if (strXml == "")
                strXml = "<Root></Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute("ConfermentID") == oXmlNodes.item(j).selectSingleNode("ConfermentID").text)) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
//                        CountChkSelected++;
                    }
                }
            }

            var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=0]");

            for (j = 0; j < oXmlNodes1.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute("ConfermentID") == oXmlNodes1.item(j).selectSingleNode("ConfermentID").text)) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;
//                        CountChkSelected--;
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = $get(MasterObj + "GrdConferment");
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;

            if (obj.checked == true)
                CountChkSelected = PageSize - 1
            else
                CountChkSelected = 0

            for (var i = 1; i < PageSize; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            var TbObj = obj.parentElement;
            while (TbObj.tagName != "TR")
                TbObj = TbObj.parentElement

            var RowIndex = TbObj.rowIndex;

            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement
            var StrXml = $get(MasterObj + "txtSaveXml").value;

            var ConfermentID = TbObj.rows(RowIndex).getAttribute("ConfermentID")

            if (StrXml == "") {
                StrXml += "<Root><Tb>"
                StrXml += "<ConfermentID>" + ConfermentID + "</ConfermentID>"
                StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                StrXml += "</Tb></Root>"
                $get(MasterObj + "txtSaveXml").value = StrXml;
            }
            else if (StrXml != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(StrXml);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ConfermentID='" + ConfermentID + "']");
                if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
                    $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
                }
                else {
                    var tstr = ""
                    tstr += "<Tb>";
                    tstr += "<ConfermentID>" + ConfermentID + "</ConfermentID>"
                    tstr += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                    tstr += "</Tb>"
                    $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("</Root>", tstr + "</Root>");
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            var strUrl = 'ConfermentAccess.aspx?ConfermentID=' + LastSelectedRow.ConfermentID
             + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
             + "&SessionID=" + $get(MasterObj + "txtSessionID").value

            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth:700px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue == "1")
                OnClickBtnFilter();
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
        function onclickchkAllSelected(obj) {
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/"
            + $get(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/"
            + $get(MasterObj + "KCalEDate_txtDay").value

            if ($get(MasterObj + "txtSDate").value == "//") $get(MasterObj + "txtSDate").value = ""
            if ($get(MasterObj + "txtEDate").value == "//") $get(MasterObj + "txtEDate").value = ""

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if ($get(MasterObj + "txtSaveXml").value != "") {
                var Msg = "آيا براي حذف مطمئنيد؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("هيچ موردي براي حذف انتخاب نشده")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            var strUrl = 'ConfermentAccess.aspx?ConfermentID=0'
             + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
             + "&SessionID=" + $get(MasterObj + "txtSessionID").value

            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth:700px;center: Yes;help: no;status: no;scroll: no;')
            if (rValue == "1")
                OnClickBtnFilter();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            OnClickBtnClear()
            OnClickBtnFilter()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnClear() {
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            document.getElementById(MasterObj + "CmbfromPerson_txtCode").value = "";
            document.getElementById(MasterObj + "CmbtoPerson_txtCode").value = ""
            document.getElementById(MasterObj + "CmbfromPerson_txtPCode").value = "";
            document.getElementById(MasterObj + "CmbtoPerson_txtPCode").value = ""
            document.getElementById(MasterObj + "CmbfromPerson_txtName").value = "";
            document.getElementById(MasterObj + "CmbtoPerson_txtName").value = ""

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null)
                OndbClickGrd()
            else
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
