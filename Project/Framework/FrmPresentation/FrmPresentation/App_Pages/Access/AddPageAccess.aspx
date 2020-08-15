<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPageAccess.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.AddPageAccess" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script language="javascript" src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>

    <table>
        <tr>
            <td valign="top" align="right">
                <table style="height: 499px; width: 700px;">
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="AddPageAccess.aspx" PageID="1117" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"
                                ScriptMode="Release">
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
                                    setPageChk()
                                    var StrVal = $get(MasterObj + "txtSubmit").value
                                    // $get(MasterObj + "txtAlert").value = StrVal
                                    //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                                    if (StrVal != "") {

                                        LastSelectedRow = null;
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
                                    
                                    
                                    if ($get(MasterObj + "txtAlert").value != "") {
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                        $get(MasterObj + "txtAlert").value=""
                                        returnValue = 1
                                        ModifyFlag = 0
                                    }

                                    $get(MasterObj + "txtSubmit").value = "";
                                    
                                    setPageAccess()

                                    var RowFind = null
                                    
                                    if ($get(MasterObj + "txtPageId").value != "0") {
                                        var OGrid = document.getElementById("GrdPage");
                                        if (OGrid != null) {
                                            var oGLen = OGrid.rows.length
                                            for (var j = 1; j < oGLen; j++) {
                                                if (OGrid.rows(j).PageId == $get(MasterObj + "txtPageId").value) {
                                                    RowFind = OGrid.rows(j)
                                                }
                                            }
                                        }
                                        
                                        if (RowFind != null) {
                                            RowFind.cells(0).firstChild.checked = true
                                            OnClickPageChk(RowFind.cells(0).firstChild)
                                            OnClickGrdPage(RowFind)
                                        }
                                        else {
                                            BindRelationGrd()
                                        }
                                    }
                                    else {
                                        BindRelationGrd()
                                    }
                                    
                                    if ($get(MasterObj + "txtSelectStatus").value == "selected") {
                                        if ($get(MasterObj + "chkAllَAccessSelected").checked == false) {
                                            $get(MasterObj + "chkAllَAccessSelected").checked = true
                                            $get(MasterObj + "txtSelectStatus").value = ""
                                            onclickchkAllAccessSelected()
                                        }
                                    }

                                }
                            </script>

                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <table >
                                <tr >
                                    <td align="right" colspan="2" >
                                    <table><tr>
                                    <td>
                                    نام زیرسیستم:
                                    </td>
                                    <td>
                                    <asp:DropDownList  onchange="onchangeCmbSubSystem()"
                                            ID="CmbSubSystem" runat="server" Width="120px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    نام صفحه:
                                    </td>
                                    <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                        <asp:DropDownList  onchange="onchangecmbPage()"
                                            ID="cmbPage" runat="server" Width="170px">
                                        </asp:DropDownList>
                                        </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    </tr></table>
                                        
                                        
                                       
                                        
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td width="300px">
                                        <input type="checkbox" id="chkAllPageSelected" runat="server" onclick="onclickchkAllPageSelected(this)" />نمایش
                                        انتخاب شده ها
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                <asp:HiddenField ID="txtAlert" runat="server" />
                                                <asp:HiddenField ID="txtPersonCode" runat="server" />
                                                <asp:HiddenField ID="txtPageAccessXML" runat="server" />
                                                <asp:HiddenField ID="txtTempPageAccessXML" runat="server" />
                                                <asp:HiddenField ID="txtPageXML" runat="server" />
                                                <asp:HiddenField ID="txtPageSize" runat="server" />
                                                <asp:HiddenField ID="lblTo" runat="server" />
                                                <asp:HiddenField ID="lblFrom" runat="server" />
                                                <asp:HiddenField ID="lblTotal" runat="server" />
                                                <asp:HiddenField ID="txtSubsysID" runat="server" />
                                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                                <asp:HiddenField ID="Totalpage" runat="server" />
                                                <asp:HiddenField ID="txtChkAllPageXML" runat="server" />
                                                <asp:HiddenField ID="txtSelectStatus" runat="server" />
                                                <asp:HiddenField ID="txtPageId" runat="server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td width="450px">
                                        <input type="checkbox" id="chkAllَAccessSelected" runat="server" onclick="onclickchkAllAccessSelected(this)" />نمایش
                                        انتخاب شده ها
                                        <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 340px; position: relative;">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:PlaceHolder ID="SubSysGridViewPlaceHolder" runat="Server" />
                                                    <asp:HiddenField ID="txtChkAllAccessXML" runat="server" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                        </td>
                    </tr>
                </table>
                &nbsp;<div style="display: none">
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
                    <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
                    <input type="text" id="txtXMLModify" name="txtGroupView" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var strPage = "<Root></Root>"
        var ModifyFlag = 0
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        BindRelationGrd();
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangeCmbSubSystem() {
            document.getElementById(MasterObj + "txtSubsysID").value = document.getElementById(MasterObj + "CmbSubSystem").value
            $get(MasterObj + "txtPageId").value = 0
            $get(MasterObj + "txtSubmit").value = "changeSubSystem";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbPage() {
            document.getElementById(MasterObj + "txtSubsysID").value = document.getElementById(MasterObj + "CmbSubSystem").value
            $get(MasterObj + "txtSubmit").value = "changePage";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strPage);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Page [selected=1]");

            if (oXmlNodes.length == 0) {
                alert('لطفا اطلاعات را کامل کنيد')
                return
            }
            else if (ModifyFlag == 0) {
                alert('هیچ تغییری جهت ذخیره داده نشده')
                return
            }

            $get(MasterObj + "txtPageXML").value = strPage
            // alert($get(MasterObj + "txtPageAccessXML").value)
            $get(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindRelationGrd() {
            var oGrid1 = document.getElementById("GrdAccess")
            if (oGrid1 != null) {
                for (var j = 0; j < oGrid1.rows.length; ++j) {
                    oGrid1.rows(j).cells(1).firstChild.checked = false;
                    if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                        oGrid1.rows(j).style.display = "none"
                    }
                    else if (oGrid1.rows(j).getAttribute('MainRowID') == 1) {

                        if (oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID') == 0) {
                            oGrid1.rows(j).cells(1).firstChild.disabled = true
                        }
                        //                      oGrid1.rows(j).cells(0).firstChild.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png";
                    }
                }

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
        }
        ////_________________________________________________________________________________
        function OnClickPageChk(obj) {

            var TbObj = obj.parentElement
            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement
            var RowIndex = obj.parentElement.parentElement.rowIndex;

            var selected = 0
            if (obj.checked == true)
                selected = 1
            else
                selected = 0

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strPage);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Page [PageId='" + TbObj.rows(RowIndex).PageId + "']");
            if (oXmlNodes.length != 0) {
                oXmlNodes.item(0).selectSingleNode('selected').text = selected;
                strPage = oXmlDoc.xml;
            }
            else {
                strPage = strPage.replace("</Root>", "")
                strPage += "<Page>";
                strPage += "<PageId>" + TbObj.rows(RowIndex).PageId + "</PageId>"
                strPage += "<selected>" + selected + "</selected>"
                strPage += "</Page></Root>"

            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function setPageChk() {
            var OGrid = document.getElementById("GrdPage");
            if (OGrid == null)
                return
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strPage);
            var oXmlNodes;
            for (var j = 1; j < OGrid.rows.length; j++) {
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Page [PageId='" + OGrid.rows(j).PageId + "' and selected='1']");

                if (oXmlNodes.length > 0)
                    OGrid.rows(j).cells(0).firstChild.checked = true
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            if (LastSelectedRow == null) {
                alert('لطفا يک صفحه انتخاب کنيد');
                obj.checked = false;
                return
            }

            var TbObj = obj.parentElement

            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement

            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var SubsysID = 0
            if (obj.checked == true)
                SubsysID = 1
            else
                SubsysID = 0

            
            var StrXml = $get(MasterObj + "txtPageAccessXML").value;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(StrXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageAccess [PageId='" + LastSelectedRow.PageId + "' and TypeID='" + TbObj.rows(RowIndex).getAttribute('intType') + "' and AccessId='" + TbObj.rows(RowIndex).getAttribute('Val') + "']");
            //alert(oXmlNodes.length)
            if (oXmlNodes.length != 0) {
                oXmlNodes.item(0).selectSingleNode('SubsysID').text = SubsysID;
                $get(MasterObj + "txtPageAccessXML").value = oXmlDoc.xml;

                ModifyFlag = 1
            }
            else {
                StrXml = StrXml.replace("<AccessEntity />", "")
                if (StrXml=="")
                    StrXml="<AccessEntity></AccessEntity>"
                    
                StrXml = StrXml.replace("</AccessEntity>", "")
                StrXml += "<PageAccess>";

                StrXml += "<PageAccessId></PageAccessId>"
                StrXml += "<AccessId>" + TbObj.rows(RowIndex).getAttribute('Val') + "</AccessId>"
                StrXml += "<PageId>" + LastSelectedRow.getAttribute('PageId') + "</PageId>"
                StrXml += "<TypeID>" + TbObj.rows(RowIndex).getAttribute('intType') + "</TypeID>"
                StrXml += "<SubsysID>" + SubsysID + "</SubsysID>"

                if (TbObj.rows(RowIndex).getAttribute('MainRowID') == 0)
                    StrXml += "<SubAccessId>" + TbObj.rows(RowIndex).getAttribute('AccessId') + "</SubAccessId>"

                StrXml += "</PageAccess></AccessEntity>"

                $get(MasterObj + "txtPageAccessXML").value = StrXml;
                ModifyFlag = 1
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function LoadGrid() {

            if ($get(MasterObj + "chkAllَAccessSelected").checked == true) {
                $get(MasterObj + "chkAllَAccessSelected").checked = false
                $get(MasterObj + "txtSelectStatus").value = "selected"
                onclickchkAllAccessSelected()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdPage(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            $get(MasterObj + "txtPageId").value = SelectedRow.PageId
            BindRelationGrd();
            setPageAccess();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function setPageAccess() {
            var OGrid = document.getElementById("GrdAccess");
            if (OGrid == null)
                return
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtPageAccessXML").value);
            var oXmlNodes;
            //            var PageSelected = LastSelectedRow.PageId
            var PageSelected = $get(MasterObj + "txtPageId").value

            oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageAccess [PageId='" + PageSelected + "' and SubsysID!='0' and TypeID!=903]");

            var Len = oXmlNodes.length
            var Glen = OGrid.rows.length
            var Objimg
            for (var i = 0; i < Len; i++) {
                Val = oXmlNodes.item(i).selectSingleNode('AccessId').text
                TypeID = oXmlNodes.item(i).selectSingleNode('TypeID').text

                for (var j = 1; j < Glen; j++) {

                    if (OGrid.rows(j).getAttribute('MainRowID') == 1)
                        Objimg = OGrid.rows(j).cells(0).firstChild


                    if ((OGrid.rows(j).intType == TypeID) && (OGrid.rows(j).Val == Val)) {
                        OGrid.rows(j).cells(1).firstChild.checked = true
                        OnClickSubNode(Objimg)
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function clearAllChkOGrid() {
            var OGrid = document.getElementById("GrdPage");
            for (var k = 1; k < OGrid.rows.length; k++)
                OGrid.rows(k).cells(0).firstChild.checked = false
        }
        ////_________________________________________________________________________________
        function OnClickBtnNew() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strPage);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Page [selected=1]");

            if (oXmlNodes.length >= 0) {
                for (var i = 0; i < oXmlNodes.length; i++)
                    oXmlNodes.item(0).selectSingleNode('selected').text = 0;
                strPage = oXmlDoc.xml;
            }

            BindRelationGrd();
            clearAllChkOGrid();
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRow = null
            $get(MasterObj + "txtPageId").value = 0
            $get(MasterObj + "cmbPage").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var RowFind = null

        if ($get(MasterObj + "txtPageId").value != "0") {
            var OGrid = document.getElementById("GrdPage");
            var oGLen = OGrid.rows.length
            if (OGrid != null)
                for (var j = 1; j < oGLen; j++) {
                if (OGrid.rows(j).PageId == $get(MasterObj + "txtPageId").value) {
                    RowFind = OGrid.rows(j)
                }
            }

            if (RowFind != null) {
                //alert(RowFind.rowIndex)
                RowFind.cells(0).firstChild.checked = true
                OnClickPageChk(RowFind.cells(0).firstChild)
                OnClickGrdPage(RowFind)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllPageSelected() {
            //            alert($get(MasterObj + "txtSubGroupXML").value)
            var strXml = strPage
            document.getElementById(MasterObj + "txtChkAllPageXML").value = strXml
            //            alert(strPage)
            document.getElementById(MasterObj + "txtSubmit").value = "chkAll"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllAccessSelected() {
            var strXml = document.getElementById(MasterObj + "txtPageAccessXML").value
            //            alert($get(MasterObj + "txtPageId").value)
            //            if ($get(MasterObj + "txtPageId").value != "") {
            //                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            //                oXmlDoc.async = "false";
            //                oXmlDoc.loadXML(strXml);
            //                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageAccess [PageId!='" + $get(MasterObj + "txtPageId").value + "' ]");
            //                for (var i = 0; i < oXmlNodes.length; i++)
            //                    oXmlNodes.item(i).selectSingleNode('SubsysID').text = 0;
            //                strXml = oXmlDoc.xml;
            //            }
            document.getElementById(MasterObj + "txtChkAllAccessXML").value = strXml
            //alert(document.getElementById(MasterObj + "txtChkAllAccessXML").value)
            document.getElementById(MasterObj + "txtSubmit").value = "chkAll"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {

            var OGrid = obj.parentElement
            while (OGrid.tagName != "TABLE")
                OGrid = OGrid.parentElement

            var oLen = OGrid.rows.length
            var chk = obj.checked

            for (var i = 1; i < oLen; i++) {
                if (OGrid.id == "GrdPage") {
                    OGrid.rows(i).cells(0).firstChild.checked = chk
                    OnClickPageChk(OGrid.rows(i).cells(0).firstChild);
                }
                else if (OGrid.id == "GrdAccess") {
                    if (OGrid.rows(i).cells(1).firstChild.disabled != true) {
                        OGrid.rows(i).cells(1).firstChild.checked = chk
                        OnClickChk(OGrid.rows(i).cells(1).firstChild);
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
