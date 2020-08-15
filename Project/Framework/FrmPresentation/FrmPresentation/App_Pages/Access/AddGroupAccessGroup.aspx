<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGroupAccessGroup.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.AddGroupAccessGroup" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

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
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="AddGroupAccessGroup.aspx" PageID="1120" />
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
                                    LastSelectedRow = null;
                                    
                                    SetChkSubGroup()
                                    SetChkMainGroup()
                                    
                                    if ($get(MasterObj + "txtAlert").value != "") {
                                        returnValue = 1
                                        if ($get(MasterObj + "txtGroupID").value != "0") {
                                            var OGrid = document.getElementById("GrdMainGroup");
                                            if (OGrid != null)
                                                RowFind = OGrid.rows(1)

                                            if (RowFind != null) {
                                                RowFind.cells(0).firstChild.checked = true
                                                OnClickMainChk(RowFind.cells(0).firstChild)
                                                OnClickGrd(RowFind)
                                            }
                                            var oGrid1 = document.getElementById("GrdSubGroup");

                                            if (oGrid1 != null)
                                                for (var j = 0; j < oGrid1.rows.length; ++j) {
                                                if (oGrid1.rows(j).getAttribute('GroupAccessID') == $get(MasterObj + "txtGroupID").value) {
                                                    oGrid1.rows(j).style.display = "none"
                                                }
                                            }

                                        }
                                        ModifyFlag = 0
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                        $get(MasterObj + "txtAlert").value=""
                                    }
                                    $get(MasterObj + "txtSubmit").value = "";
                                   
                                }
                            </script>

                        </td>
                    </tr>
                    <tr valign="top">
                        <td align="center">
                            <table>
                                <tr valign="top">
                                    <td align="center">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <fieldset style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                    border-left: lightblue thin outset; width: 300px; border-bottom: lightblue thin solid;
                                                    height: 350px">
                                                    <legend style="color: #FF0066; width: 122px;">گروههای اصلی </legend>
                                                    <input type="checkbox" id="chkAllMainGroupSelected" runat="server" onclick="onclickchkAllMainGroupSelected(this)" />نمایش انتخاب شده ها
                                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                </fieldset>
                                                <fieldset style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                    border-left: lightblue thin outset; width: 300px; border-bottom: lightblue thin solid;
                                                    height: 350px">
                                                    <legend style="color: #FF0066; width: 122px;">گروههای فرعی </legend>
                                                    <input type="checkbox" id="chkAllSubGroupSelected" runat="server" onclick="onclickchkAllSubGroupSelected(this)" />نمایش انتخاب شده ها
                                                    <asp:PlaceHolder ID="SubSysGridViewPlaceHolder" runat="Server" />
                                                </fieldset>
                                                <asp:HiddenField ID="txtAlert" runat="server" />
                                                <asp:HiddenField ID="txtPersonCode" runat="server" />
                                                <asp:HiddenField ID="txtMainGroupXML" runat="server" />
                                                <asp:HiddenField ID="txtSubGroupXML" runat="server" />
                                                <asp:HiddenField ID="txtPageSize" runat="server" />
                                                <asp:HiddenField ID="lblTo" runat="server" />
                                                <asp:HiddenField ID="lblFrom" runat="server" />
                                                <asp:HiddenField ID="lblTotal" runat="server" />
                                                <asp:HiddenField ID="txtGroupID" runat="server" />
                                                <asp:HiddenField ID="CurPage" runat="server" />
                                                <asp:HiddenField ID="Totalpage" runat="server" />
                                                <asp:HiddenField ID="txtChkAllMainGroupXML" runat="server" />
                                                <asp:HiddenField ID="txtChkAllSubGroupXML" runat="server" />
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
                    <tr id="ttt">
                        <td align="center" valign="top">
                        </td>
                    </tr>
                </table>
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
                    <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
                    <input type="text" id="txtXMLModify" name="txtGroupView" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtPageId" runat="server" />
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
        var ModifyFlag = 0
        $get(MasterObj + "txtSubGroupXML").value = "<Root></Root>"
        $get(MasterObj + "txtMainGroupXML").value = "<Root></Root>"
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //          document.getElementById('OToolBar_BtnPrv').disabled = true;
        //          document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        //          document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        //          document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        //          document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "CurPage").value;
        //          document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

        window.name = "AddGroupAccessGroup.aspx"
        aspnetForm.target = "AddGroupAccessGroup.aspx"
        var RowFind = null

        if ($get(MasterObj + "txtGroupID").value != "0") {
            var OGrid = document.getElementById("GrdMainGroup");
            if (OGrid != null)
                RowFind = OGrid.rows(1)

            if (RowFind != null) {
                RowFind.cells(0).firstChild.checked = true
                OnClickMainChk(RowFind.cells(0).firstChild)
                OnClickGrd(RowFind)
            }
            var oGrid1 = document.getElementById("GrdSubGroup");

            if (oGrid1 != null)
                for (var j = 0; j < oGrid1.rows.length; ++j) {
                if (oGrid1.rows(j).getAttribute('GroupAccessID') == $get(MasterObj + "txtGroupID").value) {
                    oGrid1.rows(j).style.display = "none"
                }
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            var TotalPage = parseInt($get(MasterObj + "lblTotal").value) / parseInt($get(MasterObj + "txtPageSize").value)
            if (parseInt($get(MasterObj + "lblTotal").value) % parseInt($get(MasterObj + "txtPageSize").value) != 0)
                TotalPage++;
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0")
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                document.getElementById(MasterObj + "CurPage").value = document.getElementById("OToolBar_txtCurPage").value
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtSubmit").value = "New";
            $get(MasterObj + "txtGroupID").value = "0"
            $get(MasterObj + "txtMainGroupXML").value = "<Root></Root>"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (ModifyFlag == 1) {
                $get(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else {
                alert("هیچ تغییری برای ذخیره داده نشده است")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickMainChk(obj) {

            var TbObj = obj.parentElement
            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            //========================================================

            var counter = 0
            for (var r = 1; r < TbObj.rows.length; r++)
                if (TbObj.rows(r).cells(0).firstChild.checked == true)
                counter++

            if (counter == TbObj.rows.length - 1)
                TbObj.rows(0).cells(0).firstChild.checked = true
            else
                TbObj.rows(0).cells(0).firstChild.checked = false

            //========================================================
            var selected = 0
            if (obj.checked == true)
                selected = 1
            else
                selected = 0

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtMainGroupXML").value);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/MainGroup [MainGroupID='" + TbObj.rows(RowIndex).GroupAccessID + "']");

            if (oXmlNodes.length != 0) {
                oXmlNodes.item(0).selectSingleNode('selected').text = selected;
                $get(MasterObj + "txtMainGroupXML").value = oXmlDoc.xml;

            }
            else {
                $get(MasterObj + "txtMainGroupXML").value = $get(MasterObj + "txtMainGroupXML").value.replace("</Root>", "")
                $get(MasterObj + "txtMainGroupXML").value += "<MainGroup>";
                $get(MasterObj + "txtMainGroupXML").value += "<MainGroupID>" + TbObj.rows(RowIndex).GroupAccessID + "</MainGroupID>"
                $get(MasterObj + "txtMainGroupXML").value += "<selected>" + selected + "</selected>"
                $get(MasterObj + "txtMainGroupXML").value += "</MainGroup></Root>"
            }

            ModifyFlag = 1
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
                    OGrid.rows(j).cells(0).firstChild.firstChild.checked = true
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            var TbObj = obj.parentElement
            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement

            var RowIndex = obj.parentElement.parentElement.rowIndex;

            if (LastSelectedRow != null) {
                if (LastSelectedRow.GroupAccessID == TbObj.rows(RowIndex).getAttribute('GroupAccessID')) {
                    alert("یک گروه نمی تواند زیر مجموعه خودش باشد")
                    obj.checked = false
                    return;
                }
            }
            else {
                alert("ابتدا باید یک گروه اصلی انتخاب کنید")
                obj.checked = false
                return;
            }
            
            //========================================================
           
            var counter=0
            for (var r = 1; r < TbObj.rows.length; r++) 
                if (TbObj.rows(r).cells(0).firstChild.checked == true)
                    counter++
                
           if (counter == TbObj.rows.length - 1)
               TbObj.rows(0).cells(0).firstChild.checked = true
           else
               TbObj.rows(0).cells(0).firstChild.checked = false               

            //========================================================
            var selected = 0
            if (obj.checked == true)
                selected = 1
            else
                selected = 0

            var StrXml = $get(MasterObj + "txtSubGroupXML").value;
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(StrXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/SubGroup [MainGroupID='" + LastSelectedRow.GroupAccessID + "' and SubGroupID='" + TbObj.rows(RowIndex).getAttribute('GroupAccessID') + "']");
            if (oXmlNodes.length != 0) {
                oXmlNodes.item(0).selectSingleNode('selected').text = selected;
                $get(MasterObj + "txtSubGroupXML").value = oXmlDoc.xml;
                ModifyFlag = 1
            }
            else {
                StrXml = StrXml.replace("</Root>", "")
                StrXml += "<SubGroup>";
                StrXml += "<MainGroupID>" + LastSelectedRow.GroupAccessID + "</MainGroupID>"
                StrXml += "<SubGroupID>" + TbObj.rows(RowIndex).getAttribute('GroupAccessID') + "</SubGroupID>"
                StrXml += "<selected>" + selected + "</selected>"
                StrXml += "</SubGroup></Root>"
                $get(MasterObj + "txtSubGroupXML").value = StrXml;
                ModifyFlag = 1
            }
            //alert($get(MasterObj + "txtPageAccessXML").value)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {

            var OGrid = obj.parentElement
            while (OGrid.tagName != "TABLE")
                OGrid = OGrid.parentElement

            var oLen = OGrid.rows.length
            var chk=obj.checked
            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = chk
                if (OGrid.id == "GrdMainGroup")
                    OnClickMainChk(OGrid.rows(i).cells(0).firstChild);
                else if (OGrid.id == "GrdSubGroup")
                    OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            ////              clearAllChkOGrid()
            ////              setPageAccess();

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
            var PageSelected = LastSelectedRow.PageId
            oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/PageAccess [PageId='" + PageSelected + "' and SubsysID!='0' and TypeID!=903]");


            for (var i = 0; i < oXmlNodes.length; i++) {
                AccessId = oXmlNodes.item(i).selectSingleNode('AccessId').text
                TypeID = oXmlNodes.item(i).selectSingleNode('TypeID').text

                for (var j = 1; j < OGrid.rows.length; j++) {
                    if ((OGrid.rows(j).intType == TypeID) && (OGrid.rows(j).AccessId == AccessId)) {

                        OGrid.rows(j).cells(0).firstChild.firstChild.checked = true
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function clearAllChkOGrid() {
            var OGrid = document.getElementById("GrdSubGroup");
            for (var k = 1; k < OGrid.rows.length; k++)
                OGrid.rows(k).cells(0).firstChild.checked = false
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllMainGroupSelected(obj) {
            //            alert($get(MasterObj + "txtMainGroupXML").value)
            var strXml = $get(MasterObj + "txtMainGroupXML").value
            document.getElementById(MasterObj + "txtChkAllMainGroupXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "changeSubSystem"
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllSubGroupSelected(obj) {
            //            alert($get(MasterObj + "txtSubGroupXML").value)
            
            var strXml = $get(MasterObj + "txtSubGroupXML").value
            document.getElementById(MasterObj + "txtChkAllSubGroupXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "changeSubSystem"
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChkSubGroup() {

            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdSubGroup");
            if (OGrid == null)
                return
            //alert($get(MasterObj + "txtChkAllSubGroupXML").value)
            var PageSize = OGrid.rows.length
            var strXml = $get(MasterObj + "txtSubGroupXML").value
            if (strXml == "")
                strXml = "<Root></Root>"
            //            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/SubGroup [selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).GroupAccessID == oXmlNodes.item(j).selectSingleNode("SubGroupID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;

                    }
                }
            }

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/SubGroup [selected=0]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).GroupAccessID == oXmlNodes.item(j).selectSingleNode("SubGroupID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;

                    }
                }
            }
            //========================================================

            var counter = 0
            for (var r = 1; r < OGrid.rows.length; r++)
                if (OGrid.rows(r).cells(0).firstChild.checked == true)
                counter++

            if (counter == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false

            //========================================================

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChkMainGroup() {

            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdMainGroup");
            if (OGrid == null)
                return
            //alert($get(MasterObj + "txtChkAllSubGroupXML").value)
            var PageSize = OGrid.rows.length
           
            var strXml = $get(MasterObj + "txtMainGroupXML").value
            if (strXml == "")
                strXml = "<Root></Root>"
            //            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/MainGroup [selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).GroupAccessID == oXmlNodes.item(j).selectSingleNode("MainGroupID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;

                    }
                }
            }

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/MainGroup [selected=0]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).GroupAccessID == oXmlNodes.item(j).selectSingleNode("MainGroupID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;

                    }
                }
            }

            //========================================================

            var counter = 0
            for (var r = 1; r < OGrid.rows.length; r++)
                if (OGrid.rows(r).cells(0).firstChild.checked == true)
                counter++

            if (counter == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false

            //========================================================

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
