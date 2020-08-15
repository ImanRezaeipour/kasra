<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RelationDataAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.RelationDataAccess"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/KeySorting.js"></script>

    <table>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td>
                            دسترسي اول:
                        </td>
                        <td>
                            <input id="txtFirstAccName" type="text" runat="server" />
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; نوع دسترسي اول:
                        </td>
                        <td>
                            <select id="CmbFirstType" onkeypress="return KeySort(this,false)" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;جزء دسترسی اول:
                        </td>
                        <td>
                            <input type="text" id="txtFirstTitle" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            دسترسي دوم:
                        </td>
                        <td>
                            <input id="txtSecondAccName" type="text" runat="server" />
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; نوع دسترسي دوم:
                        </td>
                        <td>
                            <select id="CmbSecondType" onkeypress="return KeySort(this,false)" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;جزء دسترسی دوم:
                        </td>
                        <td>
                            <input type="text" id="txtSecondTitle" runat="server" />
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" GridID="29" PageName="RelationDataAccess.aspx" runat="server"
                    PageID="1121" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }
                    function EndRequestHandler(sender, args) {
                       document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        //alert(StrVal)
                        if (StrVal != "") {
                            {
                                LastSelectedRow = "";
                                CountChkSelected = 0
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
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                //alert(StrVal)
                                if (StrVal == "Save" || StrVal == "Delete" || StrVal == "Search") {
                                    EditMode = 0
                                    LastSelectedRow = ""

                                    if ($get(MasterObj + "txtAlert").value != "") {
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                        $get(MasterObj + "txtAlert").value = ""
                                    }
                                }

                                SetChk()
                            }
                        }
                        if ($get(MasterObj + "txtEditSubmit").value == "Edit") {
                            $get(MasterObj + "txtSearch").value = ""
                            $get(MasterObj + "txtEditSubmit").value = ""
                            LoadPopUp();
                        }

                        $get(MasterObj + "txtSubmit").value = "";
                        //document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtPageNumber").value;
                        //$get(MasterObj + "txtCurPage").value = $get(MasterObj + "txtPageNumber").value;
                    }
                </script>
<input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمایش انتخاب شده ها
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtXmlSave" runat="server" />
                            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                            <input type="text" id="txtSearch" name="txtSearch" runat="server" />
                            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                            <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                                runat="server" />
                            <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                runat="server" />
                            <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                            <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                            <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                            <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtPageSize" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtOrderString" runat="server" />
                            <asp:HiddenField ID="txtXmlRelation" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtChkAllXML" runat="server" />
                            <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                            <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                            <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                            <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                            
                        </div>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:Button ID="BtnEditSubmit" runat="server" Text="BtnEditSubmit" OnClick="BtnEditSubmit_Click" />
                            <asp:HiddenField ID="txtXmlEdit" runat="server" />
                            <asp:HiddenField ID="txtEditSubmit" runat="server" />
                        </div>
                        <asp:PlaceHolder ID="PlaceHolder1" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnEditSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div id="PopupNew" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
        border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
        top: 43px; left: 99px; display: none; background-color: #e7eeff; right: 150px;
        width: 705px;" align="center">
        <table>
            <tr>
                <td align="right">
                    <div style="display: inline; scrollbar-highlight-color: white; overflow: scroll;
                        scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 392px; position: relative;
                        whidth: 150px">
                        <asp:PlaceHolder ID="PlaceHolderGrdRelation1" runat="Server" />
                    </div>
                </td>
                <td align="right" >
                <div  
                        style="display: inline; scrollbar-highlight-color: white; overflow: scroll;
                        scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;;whidth:150px; height: 392px; position: relative;">
                    <asp:PlaceHolder ID="PlaceHolderGrdRelation2" runat="Server" />
                   </div>
                </td>
            </tr>
            <tr>
                <td colspan='2' align="center">
                    <table>
                        <tr>
                            <td>
                                <input id="BtnPNew" name="BtnClear" type="button" value="ايجاد" onclick="OnClickBtnPNew()" />
                            </td>
                            <td>
                                <input id="BtnPSave" name="BtnClear" type="button" value="ذخيره" onclick="OnClickBtnPSave()" />
                            </td>
                            <td>
                                <input id="BtnPCancel" name="BtnCancel" type="button" value="انصراف" onclick="OnClickBtnPCancel()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <table id="popup" cellspacing="0" cellpadding="0" border="0" bgcolor="white" style="margin-bottom: 0px;
        display: none; border-right: #346fa4 2px solid; border-top: lightsteelblue 2px solid;
        border-left: lightsteelblue 2px solid; border-bottom: #346fa4 2px solid;" width="100"
        height="100">
        <tr>
            <td valign="top" class="VertGradientBlue2">
                <font color="white" size="3" face="arial"><span onclick="closeWin()" style="cursor: hand"
                    title="بستن">
                    <img alt="" src="/FrmPresentation/App_Utility/Images/Icons/close1.png" /></span></font>
            </td>
            <td align="center" id="TDTitle" valign="middle" class="VertGradientBlue2" width="100%"
                height="10px">
            </td>
        </tr>
    </table>
 

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = ""
        var newrowindex = 0;
        var SelectedChkIndex = null;
        var strMainGrd = "";
        var EditMode = 0
        var IsBinding = 0
        var CountChkSelected = 0
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!AtachEvent!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //document.body.attachEvent('onkeydown', SetEnter)
        // document.body.attachEvent('onkeypress', SetEnter)
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
        //$get(MasterObj + "txtCurPage").value = $get(MasterObj + "txtPageNumber").value;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            var TotalPage = parseInt($get(MasterObj + "txtCurPage").value);
            //            alert(parseInt(document.getElementById("OToolBar_txtCurPage").value))
            //            alert(parseInt(TotalPage))
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(TotalPage) ||
           parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage)) {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
                document.getElementById(MasterObj + "BtnSubmit").click();

                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
                    document.getElementById("OToolBar_BtnNext").disabled = true
                else
                    document.getElementById("OToolBar_BtnNext").disabled = false
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
                document.getElementById(MasterObj + "BtnSubmit").click();

                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
                    document.getElementById("OToolBar_BtnPrv").disabled = true
                else
                    document.getElementById("OToolBar_BtnPrv").disabled = false
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS PAGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            EditMode = 0
            SelectedChkIndex = null
            BindRelationGrd()
            PopupNew.style.display = "inline";
        }
        BindRelationGrd();

        ////_________________________________________________________________________________
        function BindRelationGrd() {
            var oGrid1 = document.getElementById("GrdRelation1")
            var oGrid2 = document.getElementById("GrdRelation2")
            for (var j = 0; j < oGrid1.rows.length; ++j) {
                oGrid1.rows(j).cells(1).firstChild.checked = false;
                oGrid2.rows(j).cells(1).firstChild.checked = false;
                if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                    oGrid1.rows(j).style.display = "none"
                    oGrid2.rows(j).style.display = "none"
                }
                else if (oGrid1.rows(j).getAttribute('MainRowID') == 1) {
                    //alert(oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID'))
                    if (oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID') == 0)
                        oGrid2.rows(j).cells(0).firstChild.CssClass = "AddPointer"
                    if (oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID') != 0) {
                        oGrid2.rows(j).cells(0).firstChild.src = "/FrmPresentation/App_Utility/Images/Icons/Blank.gif";
                        oGrid1.rows(j).cells(0).firstChild.src = "/FrmPresentation/App_Utility/Images/Icons/Blank.gif";

                    }
                    else {
                        oGrid2.rows(j).cells(0).firstChild.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png";
                        oGrid1.rows(j).cells(0).firstChild.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png";
                    }
                }
                oGrid2.rows(j).cells(1).firstChild.disabled = false;
            }
            RestoreStyle(oGrid1)
            RestoreStyle(oGrid2)
        }
        ////_________________________________________________________________________________
        function OnClickChkMainGrid(obj) {
            
            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            //-------------------------------  
            var oIndex = oRow.rowIndex

            var AccID = oGrid.rows(oIndex).getAttribute('DataAccessRelationID');
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            //========================================================
            if (obj.checked == true && CountChkSelected != oGrid.rows.length - 1)
                CountChkSelected++;
            else if (obj.checked == false)
                CountChkSelected--;

            if (CountChkSelected == oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != true)
                oGrid.rows(0).cells(0).firstChild.checked = true
            else if (CountChkSelected != oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != false)
                oGrid.rows(0).cells(0).firstChild.checked = false
            //========================================================
            var strXml = "<Root>" + strMainGrd + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and DataAccessRelationID=" + AccID + "]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DataAccessRelationID=" + AccID + "]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strMainGrd = strXml.replace("<Root>", "");
                strMainGrd = strMainGrd.replace("</Root>", "");
            }
            else {
                strMainGrd += "<Tb>"
                strMainGrd += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                strMainGrd += "<DataAccessRelationID>" + AccID + "</DataAccessRelationID>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strMainGrd += "<Selected>0</Selected>"
                else
                    strMainGrd += "<Selected>1</Selected>"

                strMainGrd += "</Tb>"
            }

        }
        ////_________________________________________________________________________________
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            var strXml = "<Root>" + strMainGrd + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

            if (oXmlNodes.length == 0) {
                alert('لطفا يک سطر از گريد انتخاب کنيد')
                return
            }
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtXmlSave").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "Delete";
            document.getElementById(MasterObj + "BtnSubmit").click();
            //alert(document.getElementById(MasterObj + "txtXmlSave").value)
        }
        ////_________________________________________________________________________________
        function OnClickBtnFilter() {
            MakeXmlFilter()
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //----------------------------------------------------------------------
        function MakeXmlFilter() {
            var oGrid = document.getElementById("GrdAccess")

            var strXml = "<Root><Tb>"

            if (document.getElementById(MasterObj + 'txtFirstAccName').value != "")
                strXml += '<FirstAccName>' + document.getElementById(MasterObj + 'txtFirstAccName').value + '</FirstAccName>'

            if (document.getElementById(MasterObj + 'CmbFirstType').value != 0 && document.getElementById(MasterObj + 'CmbFirstType').value != "")
                strXml += '<FirstType>' + document.getElementById(MasterObj + 'CmbFirstType').value + '</FirstType>'

            if (document.getElementById(MasterObj + 'txtSecondAccName').value != "")
                strXml += '<SecondAccName>' + document.getElementById(MasterObj + 'txtSecondAccName').value + '</SecondAccName>'

            if (document.getElementById(MasterObj + 'CmbSecondType').value != 0 && document.getElementById(MasterObj + 'CmbSecondType').value != "")
                strXml += '<SecondType>' + document.getElementById(MasterObj + 'CmbSecondType').value + '</SecondType>'

            if (document.getElementById(MasterObj + 'txtFirstTitle').value != "")
                strXml += '<FirstTitle>' + document.getElementById(MasterObj + 'txtFirstTitle').value + '</FirstTitle>'

            if (document.getElementById(MasterObj + 'txtSecondTitle').value != "")
                strXml += '<SecondTitle>' + document.getElementById(MasterObj + 'txtSecondTitle').value + '</SecondTitle>'

            strXml += '</Tb></Root>'
            document.getElementById(MasterObj + "txtSearch").value = strXml

        }
        ////_________________________________________________________________________________
        function LoadPopUp() {

            BindRelationGrd();
            SetCheckForEdit();
            SelectedChkIndex = null
            EditMode = 1
            PopupNew.style.display = "inline";
        }
        ////_________________________________________________________________________________
        function SetCheckForEdit() {
            IsBinding = 1
            var oGrid1 = document.getElementById("GrdRelation1")
            var oGrid2 = document.getElementById("GrdRelation2")
            //alert(document.getElementById(MasterObj + "txtXmlEdit").value)
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlEdit").value);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/DataAccessRelation");
            var len = oXmlNodes.length
            var GLen = oGrid1.rows.length
            var Objimg1, Objimg2
            //alert(GLen)
            //alert(len)
            if (len > 0) {
                for (var i = 0; i < GLen; i++) {
                    //==G1===================================================
                    if (oGrid1.rows(i).getAttribute('MainRowID') == 1)
                        Objimg1 = oGrid1.rows(i).cells(0).firstChild

                    if (oGrid1.rows(i).getAttribute('Val') == oXmlNodes.item(0).selectSingleNode("FirstDataAccessID").text) {
                        if (oXmlNodes.item(0).selectSingleNode("FirstBaseAccessID").text != 0 && oGrid1.rows(i).getAttribute('DataAccessID') == oXmlNodes.item(0).selectSingleNode("FirstBaseAccessID").text) {
                            oGrid1.rows(i).cells(1).firstChild.checked = true;
                            OnClickChk(oGrid1.rows(i).cells(1).firstChild)
                            OnClickSubNode(Objimg1)
                        }
                        else if (oXmlNodes.item(0).selectSingleNode("FirstBaseAccessID").text == 0) {
                            oGrid1.rows(i).cells(1).firstChild.checked = true;
                            OnClickChk(oGrid1.rows(i).cells(1).firstChild)
                            OnClickSubNode(Objimg1)
                        }
                    }
                }
            }


            //==G2===================================================
            GLen = oGrid2.rows.length

            if (len > 0) {
                for (var j = 0; j < len; j++)
                    for (var i = 0; i < GLen; i++) {
                    if (oGrid2.rows(i).getAttribute('MainRowID') == 1) {
                        Objimg2 = oGrid2.rows(i).cells(0).firstChild
                    }

                    if (oGrid2.rows(i).getAttribute('Val') == oXmlNodes.item(j).selectSingleNode("SecondDataAccessID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("SecondBaseAccessID").text != 0 && oGrid2.rows(i).getAttribute('DataAccessID') == oXmlNodes.item(j).selectSingleNode("SecondBaseAccessID").text) {
                            oGrid2.rows(i).cells(1).firstChild.checked = true;
                            OnClickChk(oGrid2.rows(i).cells(1).firstChild)
                            OnClickSubNode(Objimg2)
                        }
                        else if (oXmlNodes.item(j).selectSingleNode("SecondBaseAccessID").text == 0) {
                            oGrid2.rows(i).cells(1).firstChild.checked = true;
                            OnClickChk(oGrid2.rows(i).cells(1).firstChild)
                            OnClickSubNode(Objimg2)
                        }
                    }
                }
            }
            //==G2===================================================
            IsBinding = 0
        }
        ////_________________________________________________________________________________
        function OnClickBtnEdit() {
            if (LastSelectedRow == "") {
                alert('لطفا يک سطر از گريد انتخاب کنيد')
                return
            }
            alert(document.getElementById(MasterObj + "txtAcCode").value)
            alert(GetAccessCode(window.event.srcElement))
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            var oGrid = document.getElementById("GrdAccess")
            var strXml = "<Root><Tb>"
            strXml += '<FirstDataAccessID>' + oGrid.rows(LastSelectedRow).getAttribute('FirstDataAccessID') + '</FirstDataAccessID>'
            if (oGrid.rows(LastSelectedRow).getAttribute('FirstBaseAccessID') != 0)
                strXml += '<FirstBaseAccessID>' + oGrid.rows(LastSelectedRow).getAttribute('FirstBaseAccessID') + '</FirstBaseAccessID>'
            strXml += '</Tb></Root>'

            document.getElementById(MasterObj + "txtSearch").value = strXml
            document.getElementById(MasterObj + "txtEditSubmit").value = "Edit"
            document.getElementById(MasterObj + "BtnEditSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnPNew() {
            EditMode = 0
            SelectedChkIndex = null
            BindRelationGrd()
        }
        ////_________________________________________________________________________________
        function OnClickBtnPSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            var oGrid
            var doSave1 = 0, doSave2 = 0
            var strXml = ''
            var len = 0
            strXml = '<Root><First>'
            //====================================
            oGrid = document.getElementById("GrdRelation1")
            len = oGrid.rows.length
            for (var i = 0; i < len; ++i) {
                if (oGrid.rows(i).cells(1).firstChild.checked == true) {
                    doSave1 = 1
                    strXml += '<Mode>' + EditMode + '</Mode>'
                    strXml += '<FirstDataAccessID>' + oGrid.rows(i).getAttribute('Val') + '</FirstDataAccessID>'
                    if (oGrid.rows(i).getAttribute('MainRowID') != 1) {
                        strXml += '<FirstBaseAccessID>' + oGrid.rows(i).getAttribute('DataAccessID') + '</FirstBaseAccessID>'
                    }
                    break;
                }
            }
            strXml += '</First>'
            //====================================

            oGrid = document.getElementById("GrdRelation2")
            len = oGrid.rows.length
            for (var i = 0; i < len; ++i) {
                if (oGrid.rows(i).cells(1).firstChild.checked == true) {
                    doSave2 = 1
                    strXml += '<Second>'
                    strXml += '<SecondDataAccessID>' + oGrid.rows(i).getAttribute('Val') + '</SecondDataAccessID>'

                    if (oGrid.rows(i).getAttribute('MainRowID') != 1) {
                        strXml += '<SecondBaseAccessID>' + oGrid.rows(i).getAttribute('DataAccessID') + '</SecondBaseAccessID>'
                    }
                    strXml += '</Second>'
                }
            }
            //====================================
            if (doSave1 == 0 || doSave2 == 0) {
                alert('لطفا اطلاعات را کامل کنيد')
                return
            }
            strXml += '</Root>'
            $get(MasterObj + "txtXmlSave").value = strXml
            $get(MasterObj + "txtSubmit").value = "Save";

            MakeXmlFilter()

            PopupNew.style.display = "none";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________________
        function OnClickBtnPCancel() {
            EditMode = 0
            PopupNew.style.display = "none";
        }
        ////_________________________________________________________________________________
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement
            
            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            //-------------------------------  
            var oIndex = oRow.rowIndex
            var i = oIndex, j = oIndex
            //-------------------------------
            if (EditMode == 1 && oGrid == document.getElementById("GrdRelation1")) {
                oGrid.rows(oIndex).cells(1).firstChild.checked = !oGrid.rows(oIndex).cells(1).firstChild.checked
                alert('تغيير ممکن نيست')
                return
            }
            //------------------------------
            //alert(oGrid.rows(oIndex).cells(1).firstChild.checked == false && oGrid == document.getElementById("GrdRelation1"))
            if (oGrid.rows(oIndex).cells(1).firstChild.checked == false && oGrid == document.getElementById("GrdRelation1")) {
                SelectedChkIndex = null
                //return 
            }


            if (IsBinding != 1 && oGrid.rows(oIndex).cells(1).firstChild.checked == true && oGrid == document.getElementById("GrdRelation1")) {
                if (SelectedChkIndex == null && oGrid.rows(oIndex).cells(1).firstChild.checked != false)
                    SelectedChkIndex = oRow
                else if ((SelectedChkIndex != null && oGrid.rows(oIndex).getAttribute('MainRowID') != 1)
                        || (SelectedChkIndex != null && SelectedChkIndex.getAttribute('MainRowID') == 1
                            && oRow.getAttribute('TypeID') == SelectedChkIndex.getAttribute('TypeID')
                            )
                         || (SelectedChkIndex != null && oRow.getAttribute('TypeID') != SelectedChkIndex.getAttribute('TypeID'))
                        ) {
                    oGrid.rows(oIndex).cells(1).firstChild.checked = false
                    alert('امکان انتخاب بيش از يک مورد نمي باشد')
                    return
                }
            }
            if (oGrid.rows(oIndex).cells(1).firstChild.checked == false && oGrid == document.getElementById("GrdRelation1"))
                SelectedChkIndex = null

            //---------------------------------------------           
            if (oGrid.rows(oIndex).getAttribute('MainRowID') == 1) {
                i++;
                while (oGrid.rows(i) && oGrid.rows(i).getAttribute('MainRowID') == 0) {
                    oGrid.rows(i).cells(1).firstChild.checked = oGrid.rows(oIndex).cells(1).firstChild.checked;
                    i++;
                }
            }
            //====================================================================
            if (oGrid == document.getElementById("GrdRelation2")) {
                if (obj.checked == false && oGrid.rows(oIndex).getAttribute('MainRowID') == 0) {
                    i--;
                    while (oGrid.rows(i) && oGrid.rows(i).getAttribute('MainRowID') != 1) {
                        i--;
                    }
                    if (oGrid.rows(i))
                        oGrid.rows(i).cells(1).firstChild.checked = false;
                }
            }
            else if (oGrid == document.getElementById("GrdRelation1"))
                if (obj.checked == false && oGrid.rows(oIndex).getAttribute('MainRowID') == 0) {
                i--;
                while (oGrid.rows(i) && oGrid.rows(i).getAttribute('MainRowID') != 1) {
                    oGrid.rows(i).cells(1).firstChild.checked = false;
                    i--;
                }
                if (oGrid.rows(i) && oGrid.rows(i).getAttribute('MainRowID') == 1 && oGrid.rows(i).cells(1).firstChild.checked != false)
                    SelectedChkIndex = oGrid.rows(i)
                j++;
                while (oGrid.rows(j) && oGrid.rows(j).getAttribute('MainRowID') == 0) {
                    oGrid.rows(j).cells(1).firstChild.checked = false;
                    j++;
                }
            }
            //====================================================================
            //88/03/10  R.Shahrokh
            if (oGrid.id == "GrdRelation1") {
                SetActiveGrdRelationRows(obj.checked, oRow.TypeID)
            }
        }
        ////_________________________________________________________________________________
        function SetActiveGrdRelationRows(Flag, TypeID)
        {
            var OGrid = document.getElementById("GrdRelation2");
            var tempFlag = true;
            var tempFlag2 = false;
            var i=1;

            while (tempFlag && i < OGrid.rows.length) {
                if (OGrid.rows(i).TypeID != TypeID & tempFlag2)
                    tempFlag = false;

                if (OGrid.rows(i).TypeID == TypeID) {
                    tempFlag2 = true;
                    
                    OGrid.rows(i).cells(1).firstChild.disabled = Flag;
                }    
                i++;    
            }
        }
        ////_________________________________________________________________________________
        function OnClickSubNode(SelectedImage) {


            var oGrid = SelectedImage.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var j;
            var i;
            var oRow = SelectedImage.parentElement.parentElement

            for (j = oRow.rowIndex; j < oGrid.rows.length; ++j)
                if (oGrid.rows(j).cells(0).firstChild == SelectedImage) {
                if (oGrid.rows(j + 1) && oGrid.rows(j + 1).style.display == "none") {
                    SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/add_sub_task.png"
                    i = j + 1
                    while (oGrid.rows(i) && oGrid.rows(i).MainRowID == 0) {
                        oGrid.rows(i).style.display = "inline"
                        i++;
                    }
                }
                else if (oGrid.rows(j + 1) && oGrid.rows(j + 1).style.display == "inline") {
                    SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png"
                    i = j + 1
                    while (oGrid.rows(i) && oGrid.rows(i).MainRowID == 0) {
                        oGrid.rows(i).style.display = "none"
                        i++;
                    }
                }
            }
            RestoreStyle(oGrid)

        }
        ////_________________________________________________________________________________
        function SetChk() {
            var i = 0;
            var j = 0;
            //alert(document.getElementById("GrdAccess"))
            var OGrid = document.getElementById("GrdAccess");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length // document.getElementById(MasterObj + "txtPageSize").value
            //alert(OGrid.rows.length)
            var strXml = "<Root>" + strMainGrd + "</Root>"
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute('DataAccessRelationID') == oXmlNodes.item(j).selectSingleNode("DataAccessRelationID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                        CountChkSelected++;
                    }
                }
            }
            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false
        }
        ////_________________________________________________________________________________
        function RestoreStyle(objGrid) {
            var j;
            var FlagClass;
            var oRowGrid;
            FlagClass = "CssAlternatingItemStyle"
            for (j = 1; j < objGrid.rows.length; ++j) {
                oRowGrid = objGrid.rows(j)
                if (oRowGrid.style.display == 'inline' || oRowGrid.style.display == '') {
                    if (FlagClass == "cssMenu") {
                        oRowGrid.className = "CssAlternatingItemStyle"
                        FlagClass = "CssAlternatingItemStyle"
                    }
                    else {
                        oRowGrid.className = "cssMenu"
                        FlagClass = "cssMenu"
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ////_________________________________________________________________________________
        function OnClickGrd(SelectedRow) {
            //            try {

            if (LastSelectedRow != "")
                SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.style.backgroundColor = "#FFFFCC";
            //            }
            //            catch (e)
            //            { }
        }
        ////_________________________________________________________________________________
        function OndbClickGrd(SelectedRow) {
            OnClickBtnEdit()
        }
        ////_________________________________________________________________________________
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdAccess");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChkMainGrid(OGrid.rows(i).cells(0).firstChild);
            }

        }
        ////_________________________________________________________________________________
        function onclickchkAllSelected(obj) {

            var strXml = "<Root>" + strMainGrd + "</Root>"
            document.getElementById(MasterObj + "txtChkAllXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();
            //alert(strXml)
        }
        //**********************************EndThisPage***************************************
        function OnClickBtnShowAll() {
            LastSelectedRow = null;
            document.getElementById(MasterObj + "txtFirstAccName").value = ""
            document.getElementById(MasterObj + "CmbFirstType").value =0
            document.getElementById(MasterObj + "txtFirstTitle").value = ""

            document.getElementById(MasterObj + "txtSecondAccName").value = ""
            document.getElementById(MasterObj + "CmbSecondType").value = ""
            document.getElementById(MasterObj + "txtSecondTitle").value = ""

            document.getElementById(MasterObj + "chkAllSelected").checked = false

            OnClickBtnFilter()
        }
    </script>

</asp:Content>
