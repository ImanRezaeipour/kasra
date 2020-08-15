<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionRelation.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.ActionRelation" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>ارتباط فعاليت و داده</title>

    <script language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        /////-------------------------------------------
    </script>

    <table style="width: 80%; height: 562px" align="center">
        <tr>
            <td style="height: 30px; width: 750px;">
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

                        if (StrVal != "") {
                            LastSelectedRow = "";
                            CountChkSelected = 0
                            document.getElementById(MasterObj + "txtSearch").value = "<Root><Tb></Tb></Root>"
                            document.getElementById(MasterObj + "txtTempSearch").value = "";

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
                            LastSelectedRow = '';
                            SetChk()
                        }

                        if (StrVal == "Delete") {
                            $get(MasterObj + "txtStrXML").value = "";
                            //alert("حذف شد")
                            if ($get(MasterObj + "txtAlert").value != "")
                                SetMsg($get(MasterObj + "txtAlert").value);
                        }
                        else if (StrVal == "Modify") {
                            //alert("ذخيره شد")
                            if ($get(MasterObj + "txtAlert").value != "")
                                SetMsg($get(MasterObj + "txtAlert").value);
                        }
                        else if (StrVal == "Search" & $get(MasterObj + "txtAlert").value != "") {
                            //alert(موردي يافت نشد)
                            if ($get(MasterObj + "txtAlert").value != "")
                                SetMsg($get(MasterObj + "txtAlert").value);
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 92px; height: 23px;">
                                    نام زیرسیستم :
                                </td>
                                <td style="width: 153px; height: 23px;">
                                    <asp:DropDownList onchange="onChangeCmbSubSys()" ID="CmbSubSys" runat="server" Width="135px"
                                        Style="height: 22px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 67px; height: 23px;">
                                    نام صفحه :
                                </td>
                                <td style="width: 136px; height: 23px;">
                                    <asp:DropDownList ID="CmbPageName" onchange="onChangeCmbPage()" runat="server" Width="135px">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 106px; height: 23px;">
                                    دسترسي فعاليتي :
                                </td>
                                <td style="height: 23px">
                                    <asp:DropDownList ID="CmbActionName" runat="server" Width="135px">
                                    </asp:DropDownList>
                                    
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 720px;">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ActionRelation.aspx" PageID="1126" />
            </td>
        </tr>
        <tr ><td style="height: 30px;" align="right">
        <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمایش انتخاب شده ها
        
        </td></tr>
        <tr>
            <td align="center" valign="top" style=" width: 720px;">
            
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="txtTempSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtActionRelationID" runat="server" />
                            <asp:HiddenField ID="txtStrXML" runat="server" />
                            <asp:HiddenField ID="txtChkAllXML" runat="server" />
                        </div>
                        <asp:PlaceHolder EnableViewState="false" ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <div style="display: none">
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
                <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                <asp:Button ID="BtnSubmitPageName" runat="server" Text="BtnSubmitPageName" OnClick="BtnSubmitPageName_Click" />
            </div>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">

        //*************************************Declaration*************************************
        var strChk = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var PersonCode = "0";
        var LastSelectedRow = "";
        var CountChkSelected = 0
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
        //document.body.attachEvent('onkeydown', SetEnter)
        //document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        //**********************************EndOnLoad*************************************

        //*************************************Toolbar*************************************
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (document.getElementById(MasterObj + "txtActionRelationID").value != ""
                    & document.getElementById(MasterObj + "txtActionRelationID").value != "0") {
                url = "ActionRelationDetail.aspx?ActionRelationID=" + document.getElementById(MasterObj + "txtActionRelationID").value;
                returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

                $get(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else
                alert("ابتدا يک سطر انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            url = "ActionRelationDetail.aspx?ActionRelationID=0"
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")

            $get(MasterObj + "txtSubmit").value = "Const";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtStrXML").value = "<Root>" + strChk + "</Root>"
            if (strChk != "") {
                if (confirm("آيا از حذف مطمئنيد؟")) {
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("ابتدا سطرهاي مورد نظر را انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            var str = "<Root><Tb>"
            if (document.getElementById(MasterObj + "CmbSubSys").value != "0")
                str += "<SubSysID>" + document.getElementById(MasterObj + "CmbSubSys").value + "</SubSysID>"
            if (document.getElementById(MasterObj + "CmbPageName").value != "0")
                str += "<PageID>" + document.getElementById(MasterObj + "CmbPageName").value + "</PageID>"
            if (document.getElementById(MasterObj + "CmbActionName").value != "0")
                str += "<ActionID>" + document.getElementById(MasterObj + "CmbActionName").value + "</ActionID>"
            str += "</Tb></Root>"
            document.getElementById(MasterObj + "txtSearch").value = str

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //*************************************EndToolbar*************************************

        //*************************************ThisPage***************************************
        function SetEnter() {
            if (event.srcElement.id == "OToolBar_txtCurPage")
                return;

            if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "txtPersonName" || event.srcElement.id == MasterObj + "CmbPersonName") {
                if (window.event.keyCode == 13)
                    OnClickBtnSearch()
            }
            else
                window.event.keyCode = 9

        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //          function OnClickChk(obj) {
        //              var SelectedRow = obj.parentElement.parentElement;

        //              if ($get(MasterObj + "txtStrXML").value != "") {
        //                  var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        //                  oXmlDoc.async = "false";
        //                  oXmlDoc.loadXML($get(MasterObj + "txtStrXML").value);
        //                  var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ActionRelationID='" + SelectedRow.getAttribute('ActionRelationID') + "']");

        //                  if (oXmlNodes.length != 0) {
        //                      oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
        //                      $get(MasterObj + "txtStrXML").value = oXmlDoc.xml;
        //                  }
        //                  else {
        //                    var Str="<Tb><ActionRelationID>" + SelectedRow.getAttribute('ActionRelationID')
        //                        + "</ActionRelationID><Selected>1</Selected></Tb>"
        //                    $get(MasterObj + "txtStrXML").value = $get(MasterObj + "txtStrXML").value.replace('</Root>', Str + '</Root>')    
        //                  }
        //              }
        //              else {
        //                  var Str = "<Root><Tb><ActionRelationID>" + SelectedRow.getAttribute('ActionRelationID')
        //                        + "</ActionRelationID><Selected>1</Selected></Tb></Root>"
        //                  $get(MasterObj + "txtStrXML").value = Str;
        //              }
        //          }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdActionRelation(SelectedRow) {
            if (LastSelectedRow != "")
                SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.style.backgroundColor = "#FFFFCC";
            $get(MasterObj + "txtActionRelationID").value = SelectedRow.getAttribute('ActionRelationID');
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrdActionRelation() {
            OnClickBtnEdit();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbSubSys() {
            document.getElementById(MasterObj + "txtSubmit").value = "FilterCmbPageName";
            document.getElementById(MasterObj + "BtnSubmitPageName").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPage() {
            document.getElementById(MasterObj + "txtSubmit").value = "FilterCmbActionName";
            document.getElementById(MasterObj + "BtnSubmitPageName").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            //-------------------------------  
            var oIndex = oRow.rowIndex

            var AccID = oGrid.rows(oIndex).getAttribute('ActionRelationID');
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
            var strXml = "<Root>" + strChk + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and ActionRelationID=" + AccID + "]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<Tb>"
                strChk += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                strChk += "<ActionRelationID>" + AccID + "</ActionRelationID>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</Tb>"
            }

        }
        ////_________________________________________________________________________________
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdActionRelation");

            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = "<Root>" + strChk + "</Root>"
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute('ActionRelationID') == oXmlNodes.item(j).selectSingleNode("ActionRelationID").text) {
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
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdActionRelation");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }

        }
        ////_________________________________________________________________________________
        function onclickchkAllSelected(obj) {

            var strXml = "<Root>" + strChk + "</Root>"
            document.getElementById(MasterObj + "txtChkAllXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click();
            //alert(strXml)
        }
        //**********************************EndThisPage*************************************
    </script>

</asp:Content>
