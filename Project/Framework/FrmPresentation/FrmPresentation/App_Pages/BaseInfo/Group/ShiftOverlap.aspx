<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ShiftOverlap.aspx.cs" Inherits="FrmPresentation.App_Pages.Schedule.ShiftOverlap"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td align="center" style="color: #FF0066">
                            مشخصات مشابه در اين بازه زماني به صورت زير موجود است:
                        </td>
                    </tr>
                    <tr>
                        <td id="GridTD" valign="top" align="center">
                            <table id="xTabTable_headerVorody" dir="rtl" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 22px" align="center">
                                    </td>
                                    <td id="ttt" class="CssHeaderStyle" style="width: 20px" align="center">
                                        <input type="checkbox" id="chkAll" onclick="onclickGrdAllcheckbox()" />
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px" align="center">
                                        ش.پرسنلي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 170px" align="center">
                                        نام و نام خانوادگي
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 120px" align="center">
                                        نام گروه
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px" align="center">
                                        تاريخ شروع
                                    </td>
                                    <td class="CssHeaderStyle" style="width: 80px" align="center">
                                        تاريخ خاتمه
                                    </td>
                                </tr>
                            </table>
                            <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                scrollbar-base-color: #b0c4de; height: 350px">
                                <table id="XTabTable" align="center" border="1" cellspacing="0" cellpadding="0">
                                </table>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            
                            <script type="text/javascript" language="javascript">
                                Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                function BeginRequestHandler(sender, args){
                                    
                                }
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                function EndRequestHandler(sender, args){
                                    
                                    if ($get(MasterObj + "txtAlert").value!="")
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                    returnValue=1
                                    window.close()
                                }
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                            </script>
                            
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                    <input type="text" id="txtOverlapXML" runat="server" />
                    <asp:HiddenField ID="Totalpage" runat="server" />
                    <asp:HiddenField ID="txtCurPage" runat="server" />
                    <asp:HiddenField ID="lblFrom" runat="server" />
                    <asp:HiddenField ID="lblTo" runat="server" />
                    <asp:HiddenField ID="lblTotal" runat="server" />
                    <input type="text" id="txtKind" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        window.name = "ShiftOverlap.aspx"
        aspnetForm.target = "ShiftOverlap.aspx"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var oMyObject = window.dialogArguments
        var PageSize = 10;
        var currentPage_X = 0
        var CountChkSelected = 0
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        document.getElementById(MasterObj + "txtOverlapXML").value = oMyObject.document.getElementById(MasterObj + "txtOverlapXML").value
       // alert(document.getElementById(MasterObj + "txtOverlapXML").value)
        document.getElementById(MasterObj + 'txtCurPage').value = "0";

        CreateGrid("Next")
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetBorderWidthGrid(objGrid) {
            var i;
            var j;
            for (j = 0; j < objGrid.rows.length; ++j) {
                for (i = 0; i < objGrid.rows(j).cells.length; ++i) {
                    objGrid.rows(j).cells(i).style.borderBottomWidth = "0"
                    objGrid.rows(j).cells(i).style.borderTopWidth = "0"
                    objGrid.rows(j).cells(i).style.borderLeftWidth = "0"
                    objGrid.rows(j).cells(i).style.borderRightWidth = "1"
                    objGrid.rows(j).cells(i).style.borderRightColor = "Gray"
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSetDate() {
            var stralert = "آيا براي تنظيم تاريخ ها و ذخيره مطمئن هستيد!!!"
            if (confirm(stralert)) {
                var select = 0
                if (document.getElementById(MasterObj + "txtOverlapXML").value != "") {
                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtOverlapXML").value)
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Result [selected=1]");
                    if(oXmlNodes.length>0)
                        select =1
                }
                if (select == 0) {
                    alert("سطری برای ذخیره انتخاب نشده است")
                    return;
                }
                                
                document.getElementById(MasterObj + "txtSubmit").value = "SaveDate";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                CountChkSelected = 0
                CreateGrid('Const')
                SetChk()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value)) {
                CountChkSelected=0
                CreateGrid('Next')
                SetChk()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            CountChkSelected = 0
            CreateGrid('Last')
            SetChk()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1) {
                CountChkSelected = 0
                CreateGrid('Previous')
                SetChk()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            CountChkSelected = 0
            CreateGrid('First')
            SetChk()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ClearRowGrid() {
            var oGrid = XTabTable
            for (var i = oGrid.rows.length - 1; i >= 0; i--) {
                oGrid.deleteRow(i);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetPagingInfo() {
            document.getElementById('OToolBar_txtFromData').value = document.getElementById(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = document.getElementById(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = document.getElementById(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = document.getElementById(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = document.getElementById(MasterObj + "Totalpage").value;

            if (document.getElementById("OToolBar_txtCurPage").value == "" | document.getElementById("OToolBar_txtCurPage").value == "0")
                document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                document.getElementById('OToolBar_BtnPrv').disabled = false;

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateGrid(direction) {
            ClearRowGrid()
            if (document.getElementById(MasterObj + 'txtOverlapXML').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtOverlapXML").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/Result[type=1]')
                document.getElementById(MasterObj + 'lblTotal').value = xmlNodes.length;
                //================================Paging
                var totalRecords
                totalRecords = xmlNodes.length
                document.getElementById(MasterObj + 'Totalpage').value = Math.ceil(totalRecords / PageSize)

                if (totalRecords > 0) {
                    currentPage_X = parseInt(((document.getElementById(MasterObj + 'txtCurPage').value == "") ? "1" : document.getElementById(MasterObj + 'txtCurPage').value))
                    switch (direction) {
                        case "Const":
                            currentPage_X = currentPage_X
                            break
                        case "Next":
                            currentPage_X = parseInt(currentPage_X) + 1
                            break
                        case "Previous":
                            currentPage_X = parseInt(currentPage_X) - 1
                            break
                        case "First":
                            currentPage_X = 1
                            break
                        case "Last":
                            currentPage_X = parseInt(document.getElementById(MasterObj + 'Totalpage').value)
                            break
                    }
                    var endFor
                    if (currentPage_X * PageSize - 1 < 0)
                        return
                    if (totalRecords <= currentPage_X * PageSize - 1)
                        endFor = totalRecords - 1
                    else
                        endFor = parseInt(currentPage_X) * PageSize - 1
                    //====================================================
                    document.getElementById(MasterObj + 'txtCurPage').value = currentPage_X
                    document.getElementById(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
                    document.getElementById(MasterObj + "lblTo").value = endFor + 1;
                    //====================================================

                    var i = (currentPage_X - 1) * PageSize
                    var l = 0
                    var xmlNodes1;
                    for (; i <= endFor; i++) {

                        xmlNodes1 = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/Result[PersonCode=' + xmlNodes.item(i).selectSingleNode('PersonCode').text + ']')
                        l = xmlNodes1.length
                        for (var j = 0; j < l; j++) {
                            Param = xmlNodes1.item(j).selectSingleNode('PersonCode').text + ',' + xmlNodes1.item(j).selectSingleNode('PName').text + ',' + xmlNodes1.item(j).selectSingleNode('GroupName').text + ',' + xmlNodes1.item(j).selectSingleNode('SDate').text + ',' + xmlNodes1.item(j).selectSingleNode('EDate').text + ','
                            AddToGrid(xmlNodes1.item(j).selectSingleNode('vorodyId').text, xmlNodes1.item(j).selectSingleNode('type').text, Param)
                        }

                    }
                }
                else {
                    //====================================================
                    document.getElementById(MasterObj + 'txtCurPage').value = "0";
                    document.getElementById(MasterObj + "lblFrom").value = "0";
                    document.getElementById(MasterObj + "lblTo").value = "0";
                    document.getElementById(MasterObj + 'Totalpage').value = "0";
                    document.getElementById(MasterObj + 'lblTotal').value = "0";
                    //====================================================
                }
            }
            SetPagingInfo();
            SetBorderWidthGrid(XTabTable);
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickGrdAllcheckbox() {
            var oGrid = XTabTable;
            var len = oGrid.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrid.rows(i).cells(1).firstChild != null) {
                    oGrid.rows(i).cells(1).firstChild.checked = document.getElementById("chkAll").checked
                    onclickGrdcheckbox(oGrid.rows(i).cells(1).firstChild)
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickGrdcheckbox(SelectedChk) {
            var oRow = SelectedChk.parentElement.parentElement
            var vorodyId = oRow.vorodyId
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtOverlapXML").value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/Result[vorodyId=' + vorodyId + ']')
            if (SelectedChk.checked == true)
                xmlNodes.item(0).selectSingleNode('selected').text = 1
            else
                xmlNodes.item(0).selectSingleNode('selected').text = 0

            while ((oRow.nextSibling) && (oRow.nextSibling.type == 2)) {
                xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/Result[vorodyId=' + oRow.nextSibling.vorodyId + ']')
               
                for (var i = 0; i < xmlNodes.length; i++)
                    if (SelectedChk.checked == true)
                        xmlNodes.item(i).selectSingleNode('selected').text = 1
                    else
                        xmlNodes.item(i).selectSingleNode('selected').text = 0
                oRow = oRow.nextSibling
            }
            document.getElementById(MasterObj + "txtOverlapXML").value = oXmlDoc.xml;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickbtnSubNode(SelectedImage) {
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
                    while (oGrid.rows(i) && oGrid.rows(i).type == 2) {
                        oGrid.rows(i).style.display = "inline"
                        i++;
                    }
                }
                else if (oGrid.rows(j + 1) && oGrid.rows(j + 1).style.display == "inline") {
                    SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png"
                    i = j + 1
                    while (oGrid.rows(i) && oGrid.rows(i).type == 2) {
                        oGrid.rows(i).style.display = "none"
                        i++;
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddToGrid(vorodyId, type, Param) {
            var oGrid = XTabTable;
            var oRow = oGrid.insertRow();
            oRow.setAttribute("type", type) //type
            oRow.setAttribute("vorodyId", vorodyId) //vorodyId
            if (type == 1)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";

            var x = 0;
            var p = new String;
            var val = "";

            var oCell = oRow.insertCell(); //img
            if (type == 1)
                oCell.innerHTML = '<img onclick="onclickbtnSubNode(this)" src="../../../App_Utility/Images/Icons/14_selectnodes.png" />';
            else
                oCell.innerHTML = ''
            oCell.className = "XTabTable";
            oCell.style.width = "22px"
            oCell.align = "center"
            //----
            var oCellchk = oRow.insertCell(); //chk
            if (type == 1)
                oCellchk.innerHTML = '<input type="checkbox" onclick="onclickGrdcheckbox(this)" />';
            else
                oCellchk.innerHTML = ''
            oCellchk.className = "XTabTable";
            oCellchk.style.width = "20px"
            oCellchk.align = "center"

            while (x < getCntChar(',', Param)) {
                val = getArray(Param, x, ',')
                switch (x) {
                    case 0:
                        var oCell0 = oRow.insertCell(); //PersonCode	
                        oCell0.innerText = val;
                        oCell0.className = "XTabTable";
                        oCell0.style.width = "80px"
                        oCell0.align = "center"
                        break

                    case 1:
                        var oCell1 = oRow.insertCell(); //Name
                        oCell1.innerText = ((val.length > 20) ? val.substring(0, 20) + "..." : val);
                        oCell1.title = val;
                        oCell1.className = "XTabTable";
                        oCell1.style.width = "170px"
                        oCell1.align = "right"
                        break

                    case 2:
                        var oCell2 = oRow.insertCell(); //GroupName
                        oCell2.innerText = ((val.length > 15) ? val.substring(0, 15) + "..." : val);
                        oCell2.title = val;
                        oCell2.style.width = "120px"
                        oCell2.align = "center";
                        break

                    case 3:
                        var oCell3 = oRow.insertCell();  //SDate
                        oCell3.innerText = val.substring(8, 10) + val.substring(4, 8) + val.substring(0, 4);
                        oCell3.align = "center"
                        oCell3.style.width = "80px";
                        break

                    case 4:
                        var oCell4 = oRow.insertCell() //EDate
                        oCell4.innerText = val.substring(8, 10) + val.substring(4, 8) + val.substring(0, 4)
                        oCell4.style.width = "80px";
                        oCell4.align = "center"
                        break
                }
                x = x + 1;
            }
            if (type == 1)
                oRow.style.display = "inline"
            else
                oRow.style.display = "none"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("XTabTable");
            if (OGrid == null)
                return

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtOverlapXML").value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/Result[type=1]')

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Result [selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute('vorodyId') == oXmlNodes.item(j).selectSingleNode("vorodyId").text) {
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
    </script>

</asp:Content>
