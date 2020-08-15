<%@ Page Title="----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ShowDocDetail.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.ShowDocDetail" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .linkClass
        {
            text-decoration:underline;
            text-align:center;
            color:Blue;
            cursor:pointer;
        }
        .TableStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:370px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
            width:950px;
            height:120px;
        }
        
    </style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
     <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
    <table align="center">
        <tr>
            <td valign="top"  align="center">
                <table class="TableStyle" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="center" id="DivHeaderGrd" style="vertical-align: top; height: 30px">
                                <table id="TblHeaderGrd" height="100%" cellspacing="0" cellspacing="0">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div align="center" id="DicDocGrd" style="vertical-align: top; height: 30px">
                                <table id="TblDocGrd" height="100%" cellspacing="0" cellspacing="0">
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="txtDocAction" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
       
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtDocID" name="txtDocID" runat="server" />
        <input type="text" id="txtDocTypeID" name="txtDocTypeID" runat="server" />
        <input type="text" id="txtXmlGrd" name="txtXmlGrd" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
    </div>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script>
        document.body.style.overflowY = "hidden";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var newrowindex = 0, StrChk = "", ActorDescrCellIndex = 0;
        CreateGridHeader();
        CreateGrid();
     //===============================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //--------------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
        }
        //--------------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            //----------------------------------------------------------------------------------------       
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = 1;
                    window.close();
                }
                else
                    alert($get(MasterObj + "txtAlert").value);
            }
        }
        //===============================================================================================
        function CreateGridHeader(DynamicGrid) {
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"

            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGrd").value)
            var XmlNodes;
            XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GrdHeader")

            ClearGrd(TblHeaderGrd)
            AddRowGrdHeader(TblHeaderGrd, XmlNodes, DynamicGrid)
        }
        //===============================================================================================
        function AddRowGrdHeader(oGrid, XmlNodes, DynamicGrid) {
            var len = XmlNodes.length, cellIndex = 0;
            oGrid.insertRow()

            oGrid.rows(0).className = "CssHeaderStyle"
            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "روند";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'DocID');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '8');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "30px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "نوع سند";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'doctypename');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "  درخواست کننده";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'requester');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 25);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "واحد سازماني";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'deptName');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "100px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            for (var i = 0; i < len; i++) {
                oGrid.rows(0).insertCell()
                oGrid.rows(0).cells(cellIndex).innerText = XmlNodes.item(i).selectSingleNode('ColTitle').text
                oGrid.rows(0).cells(cellIndex).setAttribute('ColName', XmlNodes.item(i).selectSingleNode('ColName').text);
                oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
                oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', XmlNodes.item(i).selectSingleNode('IsTitle').text);
                oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
                oGrid.rows(0).cells(cellIndex).style.width = XmlNodes.item(i).selectSingleNode('Width').text;
                oGrid.rows(0).cells(cellIndex).style.color = "black";
                cellIndex++;
            }
            ActorDescrCellIndex = cellIndex;
            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "توضيحات";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'actordesc');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '2');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "110px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            oGrid.rows(0).insertCell()
            oGrid.rows(0).cells(cellIndex).innerText = "تاريخ درخواست";
            oGrid.rows(0).cells(cellIndex).setAttribute('ColName', 'RequestDate');
            oGrid.rows(0).cells(cellIndex).setAttribute('ColType', '4');
            oGrid.rows(0).cells(cellIndex).setAttribute('IsTitle', 0);
            oGrid.rows(0).cells(cellIndex).style.border = "1px solid #E9E9E9";
            oGrid.rows(0).cells(cellIndex).style.width = "80px";
            oGrid.rows(0).cells(cellIndex++).style.color = "black";

            colCounts = cellIndex;
        }
        //===============================================================================================
        function CreateGrid() {
            //-----------------------------Xml Grid------------------------------
            var xmlDocGrd = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDocGrd.async = "false"
            xmlDocGrd.loadXML(document.getElementById(MasterObj + "txtXmlGrd").value)
            //---------------------------------------------------------------------------
            if (($("#" + MasterObj + "txtXmlGrd").val()) != "<BaseInfoEntity />") {
                var XmlNodes = xmlDocGrd.documentElement.selectNodes("/BaseInfoEntity/GrdDocs")
                if (XmlNodes.length > 0) {
                    var len = XmlNodes.length
                    ClearGrd(TblDocGrd)
                    for (var i = 0; i < len; i++)
                        AddRowGrd(TblDocGrd, XmlNodes.item(i), i, xmlDocGrd);
                }
            }

        }
        //===============================================================================================
        function AddRowGrd(oGrid, item, row, xmlDocGrd) {
            var ColType, ColName, ColTitle, isTitle, Name, Title, Width;
            var oRow = oGrid.insertRow();
            for (var i = 0; i < colCounts; i++) {
                oGrid.rows(newrowindex).insertCell()

                ColType = TblHeaderGrd.rows(0).cells(i).getAttribute("ColType");
                ColName = TblHeaderGrd.rows(0).cells(i).getAttribute("ColName");
                ColTitle = TblHeaderGrd.rows(0).cells(i).innerText;
                isTitle = TblHeaderGrd.rows(0).cells(i).getAttribute("isTitle");
                Width = TblHeaderGrd.rows(0).cells(i).style.width;

                if (item.selectSingleNode(ColName)) {
                    if (isTitle > 0 && item.selectSingleNode(ColName).text.length > isTitle) {
                        Name = item.selectSingleNode(ColName).text.substr(0, isTitle) + "..."
                        Title = item.selectSingleNode(ColName).text
                    }
                    else {
                        Name = item.selectSingleNode(ColName).text
                        Title = ''
                    }
                }
                switch (ColType) {
                    case "2":
                        oGrid.rows(newrowindex).cells(i).innerHTML = "<input type='text' class='TxtControls' style='width=110px'  onfocus='OnFocusTxtDescr(this)'  value='" + Name + "'   title='" + Title + "' />";
                        break;
                    case "3":
                        oGrid.rows(newrowindex).cells(i).innerHTML = "<input type='checkbox'  onclick='OnClickChk(this)' />";
                        break;
                    case "4":
                        if (ColName == "RequestDate")
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div class='linkClass' onclick='OnClickRequestDate(this)' title='" + Title + "' >" + Name + "</div>";
                        else if (ColName == "RequesterDescr" || ColName == "description")
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:right' title='" + Title + "' >" + Name + "</div>";
                        else
                            oGrid.rows(newrowindex).cells(i).innerHTML = "<div style='text-align:center' title='" + Title + "' >" + Name + "</div>";
                        break;
                    case "7":
                        oGrid.rows(newrowindex).cells(i).innerHTML = "<div class='linkClass' onclick='OnClickBtn" + ColName + "(this)' title='اطلاعات " + ColTitle + "' >...</div>";
                        break;
                    case "8":
                        oGrid.rows(newrowindex).cells(i).innerHTML = " <img src='/FrmPresentation/App_Utility/Images/Icons/btnSubNodes.gif' style='width:30px; cursor: pointer'  title='روند' onclick='OnClickImgFlow()' />";
                        break;
                }
                oGrid.rows(newrowindex).cells(i).style.border = "1px solid #E9E9E9";
                oGrid.rows(newrowindex).cells(i).style.width = Width
            }
            oGrid.rows(newrowindex).setAttribute("DocID", item.selectSingleNode("DocID").text);
            oGrid.rows(newrowindex).setAttribute("DocTypeID", item.selectSingleNode("DocTypeID").text);
            oGrid.rows(newrowindex).setAttribute("DocTable", item.selectSingleNode("DocTable").text);
            oGrid.rows(newrowindex).setAttribute("Action", item.selectSingleNode("Action").text);

            oGrid.rows(newrowindex).className = "CssSelectedItemStyle"
            oGrid.rows(newrowindex).align = "center"
            newrowindex = newrowindex + 1
        }
        //===============================================================================================
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //===============================================================================================
        function OnClickImgFlow(obj) {
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var DocID = oRow.getAttribute('DocID')
            var DocTypeID = oRow.getAttribute('DocTypeID')
            window.showModalDialog("DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
        }
        //===============================================================================================
        function OnClickRequestDate(obj) {
            var url = "";
            var DialogProperty = "";
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement

            switch (oRow.DocTable) {
                case "att.attendance":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "att.Attendance":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterGooing.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "att.credit":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterCredit.aspx";
                    DialogProperty = "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no"
                    break;
                case "att.StaticCodeValue":
                    switch (LastSelectedRow.DocTypeID) {
                        case "4":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestMonthlyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                            break;
                        case "5":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestDailyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                            break;
                        case "6":
                            url = "/TAPresentation/App_Pages/DataEntry/RequestRepeatMonthlyItem.aspx";
                            DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                            break;
                    }
                    break;
                case "att.DayContinuation":
                    url = "/TAPresentation/App_Pages/DataEntry/RequestDayContinuation.aspx";
                    DialogProperty = "dialogHeight:250px;dialogWidth:650px;center: Yes;help: no;status: no";
                    break;
                case "Att.ReplaceDetail":
                    url = "/TAPresentation/App_Pages/DataEntry/RegisterChangeStructure.aspx";
                    DialogProperty = "dialogHeight:280px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "Att.ScheduleChanges":
                    url = "/TAPresentation/App_Pages/DataEntry/ShiftRequest.aspx";
                    DialogProperty = "dialogHeight:250px;dialogWidth:630px;center: Yes;help: no;status: no";
                    break;
                case "TSH.TimeSheetCell":
                    break;
                case "att.DutyGeneral":
                    var url = "/TAPresentation/App_Pages/Reports/RegisterDutyCredit.aspx"
                    var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                    break;
                case "Att.KaranePack":
                    url = "/FrmPresentation/App_Pages/Karane/KaraneGenerator.aspx";
                    DialogProperty = "dialogHeight:600px;dialogWidth:1300px;center: Yes;help: no;status: no;resizable=1";
                    break;
            }
            url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
            + "&TableName=" + oRow.DocTable
            + "&FieldName=ID"
            + "&FieldValue=" + oRow.DocID
            + "&ModifyFlag=0";
            window.showModalDialog(encodeURI(url), "", DialogProperty);
        }
        //===============================================================================================
        function OnFocusTxtDescr(obj) {
            obj.select();
        }
        //===============================================================================================
        function OnClickBtnAccept() {
            $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(1, "", "") + "</Root>";
            $get(MasterObj + "txtSubmit").value = "Action";
            $get(MasterObj + "BtnSubmit").click();
        }
        //===============================================================================================
        function OnClickBtnNotAccept() {
            var Msg = "آیا برای عدم تاييد مطمئنید؟"
            if (confirm(Msg)) {
                $get(MasterObj + "txtActionXml").value = "<Root>" + MakeXmlAction(2, "", "") + "</Root>";
                $get(MasterObj + "txtSubmit").value = "Action";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        //===============================================================================================
        function OnClickBtnErja() {
            var DialogProperty = "dialogHeight:180px;dialogWidth:600px;center: Yes;help: no;status: no;resizable=1";
            var oRow = window.event.srcElement.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement

            StrChk += "<Tb>"
            StrChk += "<RowNo>1</RowNo>";
            StrChk += "<DocID>" + $("#" + MasterObj + "txtDocID").val() + "</DocID>"
            StrChk += "<DocTypeID>" + $("#" + MasterObj + "txtDocTypeID").val() + "</DocTypeID>"
            StrChk += "<ActorDesc>" + TblDocGrd.rows(0).cells(ActorDescrCellIndex).firstChild.value + "</ActorDesc>"
            StrChk += "</Tb>"

            var url = "ErjaCartable.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&ErjaXml=" + StrChk
            returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
            if (returnValue == 1) {
                window.returnValue = 1;
                window.close();
            }
        }
        //===============================================================================================
        function MakeXmlAction(Action, RPID, RPType) {
            StrChk += "<Tb>"
            StrChk += "<RowNo>1</RowNo>";
            StrChk += "<DocID>" + $("#" + MasterObj + "txtDocID").val() + "</DocID>"
            StrChk += "<DocTypeID>" + $("#" + MasterObj + "txtDocTypeID").val() + "</DocTypeID>"
            StrChk += "<ActorDesc>" + TblDocGrd.rows(0).cells(ActorDescrCellIndex).firstChild.value + "</ActorDesc>"
            StrChk += "</Tb>"
            StrChk += "<ActionTb>"
            StrChk += "<Action>" + Action + "</Action>"
            if (RPID != "")
                StrChk += "<R_P_ID>" + RPID + "</R_P_ID>"
            if (RPType != "")
                StrChk += "<R_P_Type>" + RPType + "</R_P_Type>"
            StrChk += "</ActionTb>"
            return StrChk;
        }
        //===============================================================================================
    </script>
</asp:Content>
