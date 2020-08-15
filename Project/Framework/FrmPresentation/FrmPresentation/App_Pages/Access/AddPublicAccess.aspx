<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPublicAccess.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.AddPublicAccess" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master"
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
                <table style="height: 499px; width: 709px;">
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="AddPublicAccess.aspx" PageID="1124" />
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
                                    LastSelectedRow = "";
                                    CountChkSelected = 0
                                    var StrVal = $get(MasterObj + "txtSubmit").value
                                    $get(MasterObj + "txtAlert").value = StrVal
                                    window.returnValue = 1
                                    var oGrid1 = document.getElementById("GrdPublicAccess")
                                    if (oGrid1 != null) {
                                        for (var j = 0; j < oGrid1.rows.length; ++j) {

                                            if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                                                oGrid1.rows(j).style.display = "none"

                                            }
                                            else if (oGrid1.rows(j).getAttribute('MainRowID') == 1) {

                                                if (oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID') == 0) {
                                                    oGrid1.rows(j).cells(1).firstChild.disabled = true
                                                    oGrid1.rows(j).cells(0).firstChild.CssClass = "AddPointer"
                                                }

                                            }
                                        }
                                    }
                                    if (StrVal == "Save") {
                                        if ($get(MasterObj + "txtAlert").value != "")
                                            SetMsg($get(MasterObj + "txtAlert").value);
                                    }
                                    else if (StrVal == "Delete") {
                                        if ($get(MasterObj + "txtAlert").value != "")
                                            SetMsg($get(MasterObj + "txtAlert").value);
                                    }
                                    else if (StrVal == "Modify") {
                                        if ($get(MasterObj + "txtAlert").value != "")
                                            SetMsg($get(MasterObj + "txtAlert").value);
                                    }

                                    $get(MasterObj + "txtSubmit").value = "";
                                    SetChk()
                                }
                            </script>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمایش
                            انتخاب شده ها
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                scrollbar-base-color: #b0c4de; height: 370px; position: relative; width: 450px;">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtPersonCode" runat="server" />
                                        <asp:HiddenField ID="txtintType" runat="server" />
                                        <asp:HiddenField ID="txtPageSize" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtAccessId" runat="server" />
                                        <asp:HiddenField ID="txtSaveXML" runat="server" />
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtChkAllXML" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
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
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var GroupID = '0';
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var CountChkSelected = 0
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //          var oGrid1 = document.getElementById("GrdPublicAccess")
        //          alert(oGrid1.rows(1).getAttribute('MainRowID'))
        //          for (var j = 0; j < oGrid1.rows.length; ++j) {
        //             
        //              if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
        //                  oGrid1.rows(j).style.display = "none"
        //                  
        //              }
        //          }

        //          document.getElementById('OToolBar_BtnPrv').disabled = true;
        //          document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        //          document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        //          document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        //          document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "CurPage").value;
        //          document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;


        if ($get(MasterObj + "txtAccessId").value != 0) {
            var OGrid = document.getElementById("GrdPublicAccess");

            if (OGrid != null)
                for (var j = 1; j < OGrid.rows.length; j++) {
                if ((OGrid.rows(j).intType == $get(MasterObj + "txtintType").value) && (OGrid.rows(j).AccessId == $get(MasterObj + "txtAccessId").value))
                    RowFind = OGrid.rows(j)
            }
            if (RowFind != null) {

                OnClickGrdPublicAccess(RowFind)
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

        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            //alert(obj)
            var oGrid = document.getElementById("GrdPublicAccess")

            var TbObj = obj.parentElement;
            while (TbObj.tagName != "TR")
                TbObj = TbObj.parentElement

            var RowIndex = TbObj.rowIndex;

            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement

            //========================================================
            var Find = 0
            for (var i = 1; i < oGrid.rows.length - 1; i++) {
                if ((oGrid.rows(i).cells(1).firstChild.firstChild.checked == false) && !((oGrid.rows(i).getAttribute('MainRowID') == 1) && oGrid.rows(i + 1) && oGrid.rows(i + 1).getAttribute('MainRowID') == 0)) {
                    Find = 1
                }
            }
            if (Find == 0)
                oGrid.rows(0).cells(1).firstChild.checked = true
            else
                oGrid.rows(0).cells(1).firstChild.checked = false
            //========================================================

            var AccessID = oGrid.rows(RowIndex).getAttribute('AccessId')
            var intType = oGrid.rows(RowIndex).getAttribute('intType')
            var Val = oGrid.rows(RowIndex).getAttribute('Val')
            var MainRowID = oGrid.rows(RowIndex).getAttribute('MainRowID')

            var StrXml = $get(MasterObj + "txtXMLModify").value
            if (StrXml == "")
                StrXml = "<Root></Root>"


            if (StrXml == "<Root></Root>") {

                StrXml = "<tb>";

                if (MainRowID == 0) {
                    StrXml += "<AccessID>" + Val + "</AccessID>"
                    StrXml += "<TypeId>" + intType + "</TypeId>"
                    StrXml += "<SubAccessID>" + AccessID + "</SubAccessID>"
                }
                else if (MainRowID == 1) {
                    StrXml += "<AccessID>" + AccessID + "</AccessID>"
                    StrXml += "<TypeId>" + intType + "</TypeId>"
                    StrXml += "<SubAccessID>0</SubAccessID>"
                }
                StrXml += "<RowIndex>" + RowIndex + "</RowIndex>"
                StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                StrXml += "</tb>"
                //$get(MasterObj + "txtXMLModify").value = StrXml;
                //alert(StrXml)
                StrXml = StrXml.replace("<Root>", "");
                StrXml = StrXml.replace("</Root>", "");
                $get(MasterObj + "txtXMLModify").value = StrXml;
                //alert($get(MasterObj + "txtXMLModify").value)
            }
            else if (StrXml != "<Root></Root>") {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML("<Root>" + StrXml + "</Root>");
                if (MainRowID == 0) {
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/tb [AccessID='" + Val + "' and TypeId='" + intType + "']");
                }
                else {
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/tb [AccessID='" + AccessID + "' and TypeId='" + intType + "']");
                }

                if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
                    var S = oXmlDoc.xml;

                    S = S.replace("<Root>", "");
                    S = S.replace("</Root>", "");
                    $get(MasterObj + "txtXMLModify").value = S;
                }
                else {
                    StrXml += "<tb>";
                    if (MainRowID == 0) {
                        StrXml += "<AccessID>" + Val + "</AccessID>"
                        StrXml += "<TypeId>" + intType + "</TypeId>"
                        StrXml += "<SubAccessID>" + AccessID + "</SubAccessID>"
                    }
                    else if (MainRowID == 1) {
                        StrXml += "<AccessID>" + AccessID + "</AccessID>"
                        StrXml += "<TypeId>" + intType + "</TypeId>"
                        StrXml += "<SubAccessID>0</SubAccessID>"
                    }
                    StrXml += "<RowIndex>" + RowIndex + "</RowIndex>"
                    StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                    StrXml += "</tb>"
                    //$get(MasterObj + "txtXMLModify").value = $get(MasterObj + "txtXMLModify").value.replace("</Root>", StrXml + "</Root>");
                    $get(MasterObj + "txtXMLModify").value = StrXml;

                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            //var str = "<Root>"
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var oGrid = document.getElementById("GrdPublicAccess")

            /*for (var j = 0; j < oGrid.rows.length; ++j) {
              
            if (oGrid.rows(j).cells(1).firstChild.checked == true) {
            str += "<tb>"
            if (oGrid.rows(j).getAttribute('MainRowID') == 0) {
            str += "<AccessID>" + oGrid.rows(j).getAttribute('Val') + "</AccessID>"
            str += "<TypeId>" + oGrid.rows(j).getAttribute('intType') + "</TypeId>"
            str += "<SubAccessID>" + oGrid.rows(j).getAttribute('AccessId') + "</SubAccessID>"
            }
            else if (oGrid.rows(j).getAttribute('MainRowID') == 1) {
            str += "<AccessID>" + oGrid.rows(j).getAttribute('AccessId') + "</AccessID>"
            str += "<TypeId>" + oGrid.rows(j).getAttribute('intType') + "</TypeId>"
            str += "<SubAccessID>0</SubAccessID>"
            }
            str += "</tb>"
            }
            }*/

            //str += "</Root>"

            $get(MasterObj + "txtSaveXML").value = "<Root>" + $get(MasterObj + "txtXMLModify").value + "</Root>"//str
            //alert($get(MasterObj + "txtSaveXML").value)
            $get(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            OnClickBtnEdit()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdPublicAccess(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*function OnClickBtnNew() {
            url = "AddPublicAccess.aspx?AccessId=0";
            rr = window.showModalDialog(url, window, "dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no")
            if (rr == 1) {
                $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }*/
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                if (confirm("آیا برای حذف مطمئنید؟")) {
                    $get(MasterObj + "txtPageAccessId").value = LastSelectedRow.PageAccessId
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickSubNode(SelectedImage) {
            var oGrid
            oGrid = document.getElementById("GrdPublicAccess")

            var j;
            var i;
            var oRow = SelectedImage.parentElement.parentElement;

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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var oGrid1 = document.getElementById("GrdPublicAccess")
        if (oGrid1 != null) {
            for (var j = 0; j < oGrid1.rows.length; ++j) {

                if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                    oGrid1.rows(j).style.display = "none"

                }
                else if (oGrid1.rows(j).getAttribute('MainRowID') == 1) {

                    if (oGrid1.rows(j + 1) && oGrid1.rows(j + 1).getAttribute('MainRowID') == 0) {
                        oGrid1.rows(j).cells(1).firstChild.disabled = true
                        oGrid1.rows(j).cells(0).firstChild.CssClass = "AddPointer"
                    }

                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllSelected(obj) {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var strXml = "<Root>" + $get(MasterObj + "txtXMLModify").value + "</Root>"
            
            document.getElementById(MasterObj + "txtChkAllXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdPublicAccess");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length

            var strXml = "<Root>" + $get(MasterObj + "txtXMLModify").value + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/tb [ Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute('Val') == oXmlNodes.item(j).selectSingleNode("AccessID").text) && (OGrid.rows(i).getAttribute('intType') == oXmlNodes.item(j).selectSingleNode("TypeId").text)) {

                        OGrid.rows(i).cells(1).firstChild.firstChild.checked = true;

                    }
                }
            }

            var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/tb [ Selected=0]");
            for (j = 0; j < oXmlNodes1.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute('Val') == oXmlNodes1.item(j).selectSingleNode("AccessID").text) && (OGrid.rows(i).getAttribute('intType') == oXmlNodes1.item(j).selectSingleNode("TypeId").text)) {

                        OGrid.rows(i).cells(1).firstChild.firstChild.checked = false;

                    }
                }
            }
            //========================================================
            var Find = 0
            for (var i = 1; i < OGrid.rows.length - 1; i++) {
                if ((OGrid.rows(i).cells(1).firstChild.firstChild.checked == false) && !((OGrid.rows(i).getAttribute('MainRowID') == 1) && OGrid.rows(i + 1) && OGrid.rows(i + 1).getAttribute('MainRowID') == 0)) {
                    Find = 1
                }
            }
            if (Find == 0)
                OGrid.rows(0).cells(1).firstChild.checked = true
            else
                OGrid.rows(0).cells(1).firstChild.checked = false
            //========================================================
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdPublicAccess");
            var oLen = OGrid.rows.length
            var chk = obj.checked

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0

            for (var i = 1; i < oLen; i++) {
                if (OGrid.rows(i).cells(1).firstChild.disabled != true) {
                    OGrid.rows(i).cells(1).firstChild.firstChild.checked = chk
                    OnClickChk(OGrid.rows(i).cells(1).firstChild.firstChild);
                }
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
