var HeaderCssClass, AlternatingCssClass, ItemCssClass, FooterCssClass;
var TableName = "";
var TempGrid;
var GridPageSize = 0;

function SetPaging(oGrid, PageNumber, GridData) {

    var PageSize = GridPageSize;
    var AllowSend = false;
    var Send = document.getElementById('TdGridSend');

    if (Send.style.display == "inline")
        AllowSend = true;

    var Pager = document.getElementById('TdGridPager');

    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(GridData)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/" + TableName);
    var RecordCount = parseInt(xmlNodes.length, 10) - 1;

    if (PageSize == 0 || PageSize == '' || PageSize == null || PageSize == undefined) {
        PageSize = 0;
        document.getElementById('TxtGridCurPage').value = "";
        document.getElementById('TxtGridTotalPage').value = "";
        document.getElementById('TxtGridFromData').value = "";
        document.getElementById('TxtGridToData').value = "";
        document.getElementById('TxtGridTotalData').value = "";

        Pager.style.display = "none";

        if (xmlNodes.length == 0) {
            document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


            Send.style.display = "none";
        }
    }
    else {
        var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
        xmlDoc.loadXML(GridData)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/" + TableName);

        var RecordCount = parseInt(xmlNodes.length, 10) - 1;

        var TotalPage, MaxNumber;
        if (xmlNodes.length > 0) {
            TotalPage = xmlNodes.item(0).selectSingleNode('TotalPage').text;
            MaxNumber = xmlNodes.item(0).selectSingleNode('MaxNumber').text;
            PageNumber = xmlNodes.item(0).selectSingleNode('PageNumber').text;

            var FromData, ToData;
            FromData = (PageSize * (PageNumber - 1)) + 1;
            ToData = (PageSize * (PageNumber - 1)) + RecordCount;

            document.getElementById('TxtGridCurPage').value = PageNumber;
            document.getElementById('TxtGridTotalPage').value = TotalPage;
            document.getElementById('TxtGridFromData').value = FromData;
            document.getElementById('TxtGridToData').value = ToData;
            document.getElementById('TxtGridTotalData').value = MaxNumber;
            document.getElementById('TdGridMessage').innerText = "";

            if (TotalPage <= 1) {

                Pager.style.display = "none";

                if (AllowSend) {
                    document.getElementById('ImgSendExcelAll').style.display = "none";
                    document.getElementById('ImgSendPDFAll').style.display = "none";
                }
            }
        }
        else {
            document.getElementById('TxtGridCurPage').value = "";
            document.getElementById('TxtGridTotalPage').value = "";
            document.getElementById('TxtGridFromData').value = "";
            document.getElementById('TxtGridToData').value = "";
            document.getElementById('TxtGridTotalData').value = "";
            document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


            Pager.style.display = "none";

            if (xmlNodes.length == 0) {
                document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


                Send.style.display = "none";
            }
        }



    }
}
function BindGrid(oGrid, GridData, GridProperty, GridSetting, SDate, RSDate, EDate, REDate, CompanyID, SessionID, OnLineUserId, DataReplace, FooterRow, GridRow_ClientOnClick, ArrEvent, ArrEventCount, AllowSend) {
    var PageNumber;



    TempGrid = oGrid;
    var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
    var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
    var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];


    if (Header.rows.length > 0) {
        for (var h = Header.rows.length - 1; h >= 0; --h) {
            Header.deleteRow(h);
        }
    }

    if (Body.rows.length > 0) {
        for (var b = Body.rows.length - 1; b >= 0; --b) {
            Body.deleteRow(b);
        }
    }

    if (Footer.rows.length > 0) {
        for (var f = Footer.rows.length - 1; f >= 0; --f) {
            Footer.deleteRow(f);
        }
    }


    if (GridProperty != "") {
        SetGridProperty(oGrid, GridProperty, AllowSend);
    }

    if (GridSetting != "") {
        SetGridSetting(oGrid, GridSetting);
    }


    if (GridPageSize == "0" || GridPageSize == "") {
        GridPageSize = 0;
    }
    else {
        GridPageSize = parseInt(GridPageSize, 10);
    }




    if (GridData != "") {

        var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
        var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
        var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];

        var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
        xmlDoc.loadXML(GridData)
        xmlDoc.setProperty("SelectionLanguage", "XPath")
        var xmlNodes = xmlDoc.documentElement.selectNodes("/ReportsEntity/" + TableName);



        var CellValue = "";
        var IsFooter = false;
        var oRow;
        if (xmlNodes.length > 0) {
            if (xmlNodes.item(i).selectSingleNode('PageNumber') != null) {
                if (xmlNodes.item(i).selectSingleNode('PageNumber').text != "0" && xmlNodes.item(i).selectSingleNode('PageNumber').text != "0") {
                    PageNumber = parseInt(xmlNodes.item(i).selectSingleNode('PageNumber').text, 10);
                }
                else {
                    PageNumber = 1;
                }
            }
            for (var i = 0; i < xmlNodes.length; ++i) {
                IsFooter = false;
                if (FooterRow != "") {
                    var FooterRowArr = FooterRow.split('@');


                    if (FooterRowArr.length > 0) {
                        for (var f = 0; f < FooterRowArr.length; ++f) {

                            if (xmlNodes.item(i).selectSingleNode(FooterRowArr[f].split(';')[0]) != null) {
                                if (xmlNodes.item(i).selectSingleNode(FooterRowArr[f].split(';')[0]).text == FooterRowArr[f].split(';')[1]) {
                                    IsFooter = true;
                                }
                            }
                        }
                    }
                }

                if (IsFooter) {
                    oRow = Footer.insertRow();
                    oRow.style.height = "20px";
                    var FRadifCell = oRow.insertCell();
                    FRadifCell.style.width = "30px";
                    FRadifCell.innerText = '';
                    FRadifCell.style.backgroundColor = "#006699";
                    FRadifCell.style.color = "#FFFF00";
                }
                else {
                    oRow = Body.insertRow();
                    oRow.style.height = "20px";
                    oRow.attachEvent("onclick", GridRow_OnClick);



                    if (GridRow_ClientOnClick != null) {
                        oRow.attachEvent("onclick", GridRow_ClientOnClick);


                    }

                    if (ArrEventCount > 0) {
                        for (var ae = 0; ae < ArrEventCount; ++ae) {
                            if (ArrEvent[ae].length == 5) {
                                if (ArrEvent[ae][0] == "row") {
                                    oRow.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                }
                            }
                        }
                    }


                    var RadifCell = oRow.insertCell();
                    RadifCell.style.width = "30px";
                    RadifCell.align = "center";
                    if (GridPageSize == 0)
                        RadifCell.innerText = i + 1;
                    else
                        RadifCell.innerText = (PageNumber - 1) * GridPageSize + i + 1;

                    if (i % 2 == 0)
                        RadifCell.style.backgroundColor = "#E7EEFE";
                    else
                        RadifCell.style.backgroundColor = "#FEF8ED";
                }



                var Attrs = Header.rows[0].Attrs;
                var AttrArr = Attrs.split(',');

                if (AttrArr.length > 0) {
                    for (var k = 0; k < AttrArr.length; ++k) {

                        if (xmlNodes.item(i).selectSingleNode(AttrArr[k]) != null) {

                            oRow.setAttribute(AttrArr[k], xmlNodes.item(i).selectSingleNode(AttrArr[k]).text);


                        }
                    }
                }



                for (var j = 1; j < Header.rows[0].cells.length; ++j) {
                    try {
                        if (xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName) != null) {

                            if (xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text != "") {

                                if (DataReplace != "") {

                                    var DataReplaceArr = DataReplace.split('@');
                                    var RepColName = "";
                                    for (var d = 0; d < DataReplaceArr.length; ++d) {
                                        if (DataReplaceArr[d].split(';')[0] == Header.rows[0].cells[j].ColName) {
                                            RepColName = DataReplaceArr[d].split(';')[1];
                                        }
                                    }


                                    if (RepColName != "") {
                                        CellValue = xmlNodes.item(i).selectSingleNode(RepColName).text;
                                    }
                                    else {
                                        CellValue = xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text;
                                    }

                                }
                                else
                                    CellValue = xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text;
                            }
                            else {
                                CellValue = "";
                            }
                        }
                        else {

                            CellValue = "";
                        }

                    }
                    catch (err) {
                        CellValue = ""
                    }



                    var oCell = oRow.insertCell();

                    if (IsFooter) {
                        oCell.style.backgroundColor = "#006699";
                        oCell.style.color = "#FFFF00";
                    }
                    else {
                        if (i % 2 == 0)
                            oCell.style.backgroundColor = "#E7EEFE";
                        else
                            oCell.style.backgroundColor = "#FEF8ED";
                    }

                    if (Header.rows[0].cells[j].IsLink == 1 && !IsFooter) {



                        var LinkUrl = Header.rows[0].cells[j].LinkUrl;
                        var UrlParam = Header.rows[0].cells[j].UrlParam;
                        var UrlParamVal = Header.rows[0].cells[j].UrlParamVal;
                        var UrlFeatur = Header.rows[0].cells[j].UrlFeatur;
                        var LinkParam = "";
                        var AccessName = Header.rows[0].cells[j].AccessName;
                        if (AccessName == null || AccessName == undefined)
                            AccessName = 0;

                        var UrlParamArr;
                        UrlParamArr = UrlParam.split('@');

                        var UrlParamValArr;
                        UrlParamValArr = UrlParamVal.split('@');


                        if (UrlParamArr.length > 0) {

                            for (var l = 0; l < UrlParamArr.length; ++l) {
                                if (LinkParam == "") {
                                    LinkParam = UrlParamArr[l];
                                }
                                else {
                                    LinkParam += '&' + UrlParamArr[l];
                                }

                                switch (UrlParamValArr[l].split(';')[0]) {
                                    case '1':
                                        var Val;
                                        if (xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]) != null) {
                                            Val = xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]).text;
                                            if (AccessName == 1)
                                                Val = encode64(Val);
                                            LinkParam += "=" + Val;
                                        }
                                        else {
                                            LinkParam += "=";
                                        }
                                        break;
                                    case '2':
                                        var Val = UrlParamValArr[l].split(';')[1];
                                        if (AccessName == 1)
                                            Val = encode64(Val);
                                        LinkParam += "=" + Val;
                                        break;
                                    case '3':

                                        switch (UrlParamValArr[l].split(';')[1]) {
                                            case '1':
                                                LinkParam += "=" + SDate;
                                                break;
                                            case '2':
                                                LinkParam += "=" + EDate;
                                                break;
                                            case '3':
                                                LinkParam += "=" + CompanyID;
                                                break;
                                            case '4':
                                                LinkParam += "=" + SessionID;
                                                break;
                                            case '5':
                                                LinkParam += "=" + OnLineUserId;
                                                break;
                                        }
                                        break;
                                    case '4':
                                        var Val;
                                        if (xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]) != null) {
                                            Val = xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]).text;
                                            if (AccessName == 1)
                                                Val = encode64(Val);
                                            LinkParam += "=" + Val;
                                        }
                                        else {
                                            LinkParam += "=";
                                        }
                                        break;

                                }

                                var UrlFeaturArr = UrlFeatur.split('#');
                                var ModalFeatur = "";
                                var ModelessFlag = "";
                                if (UrlFeaturArr.length == 2) {
                                    ModalFeatur = UrlFeaturArr[0];
                                    ModelessFlag = UrlFeaturArr[1];
                                }
                                else {
                                    ModalFeatur = UrlFeaturArr[0];
                                    ModelessFlag = "0";
                                }



                            }

                        }



                        if (ModelessFlag == "1") {
                            Func = 'if(typeof window.showModelessDialog=="object") window.showModelessDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + ';minimize: yes");';
                            Func += ' else window.showModalDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + ';minimize: yes");';
                        }
                        else {
                            Func = 'window.showModalDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + '")';
                        }



                        oCell.innerHTML = "<div style='color:blue;text-decoration:underline;cursor:pointer' onclick='" + Func + "'>" + CellValue + "</div>";


                    }
                    else {

                        oCell.innerHTML = CellValue;
                    }

                    if (ArrEventCount > 0) {
                        for (var ae = 0; ae < ArrEventCount; ++ae) {
                            if (ArrEvent[ae].length == 5) {
                                if (ArrEvent[ae][0] == "cell") {

                                    if (ArrEvent[ae][1] != "") {
                                        if (oCell.cellIndex == ArrEvent[ae][1]) {
                                            oCell.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                        }
                                    }
                                    else if (ArrEvent[ae][2] != "") {

                                        if (Header.rows[0].cells[oCell.cellIndex].ColName == ArrEvent[ae][2]) {
                                            oCell.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                        }
                                    }


                                }
                            }
                        }
                    }



                }
            }
        }





    }



    Grid_RowDataBound(oGrid);

}




function SetGridProperty(oGrid, GridProperty, AllowSend) {

    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(GridProperty)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/GridProperty")

    if (xmlNodes.length == 1) {
        oGrid.setAttribute("GridID", xmlNodes.item(0).selectSingleNode('GridID').text)

        HeaderCssClass = xmlNodes.item(0).selectSingleNode('HeaderCssClass').text;
        AlternatingCssClass = xmlNodes.item(0).selectSingleNode('AlternatingCssClass').text;
        ItemCssClass = xmlNodes.item(0).selectSingleNode('ItemCssClass').text;
        FooterCssClass = xmlNodes.item(0).selectSingleNode('FooterCssClass').text;

        TableName = xmlNodes.item(0).selectSingleNode('TableName').text;

        if (xmlNodes.item(0).selectSingleNode('ShowHeader').text == 0) {
            var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
            Header.style.display = "none";
        }
        else {
            var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
            Header.style.display = "inline";
        }


        if (xmlNodes.item(0).selectSingleNode('AllowPaging').text == 0) {

            GridPageSize = 0;

            var Pager = document.getElementById('TdGridPager');
            Pager.style.display = "none";


            document.getElementById('BtnGridFirst').detachEvent('onclick', BtnGridFirst_OnClick);
            document.getElementById('BtnGridPrev').detachEvent('onclick', BtnGridPrev_OnClick);
            document.getElementById('BtnGridNext').detachEvent('onclick', BtnGridNext_OnClick);
            document.getElementById('BtnGridLast').detachEvent('onclick', BtnGridLast_OnClick);

            document.getElementById('TxtGridCurPage').detachEvent('onblur', TxtGridCurPage_OnBlur);
        }
        else {

            GridPageSize = xmlNodes.item(0).selectSingleNode('PageSize').text;
            var Pager = document.getElementById('TdGridPager');
            Pager.style.display = "inline";

            document.getElementById('BtnGridFirst').detachEvent('onclick', BtnGridFirst_OnClick);
            document.getElementById('BtnGridPrev').detachEvent('onclick', BtnGridPrev_OnClick);
            document.getElementById('BtnGridNext').detachEvent('onclick', BtnGridNext_OnClick);
            document.getElementById('BtnGridLast').detachEvent('onclick', BtnGridLast_OnClick);

            document.getElementById('TxtGridCurPage').detachEvent('onblur', TxtGridCurPage_OnBlur);


            document.getElementById('BtnGridFirst').attachEvent('onclick', BtnGridFirst_OnClick);
            document.getElementById('BtnGridPrev').attachEvent('onclick', BtnGridPrev_OnClick);
            document.getElementById('BtnGridNext').attachEvent('onclick', BtnGridNext_OnClick);
            document.getElementById('BtnGridLast').attachEvent('onclick', BtnGridLast_OnClick);

            document.getElementById('TxtGridCurPage').attachEvent('onblur', TxtGridCurPage_OnBlur);

        }

        if (AllowSend) {
            var Send = document.getElementById('TdGridSend');
            Send.style.display = "inline";

            Send.innerHTML = "";

            if (xmlNodes.item(0).selectSingleNode('AllowPaging').text != 0) {

                var SendExcelAll = document.createElement('img');
                SendExcelAll.setAttribute('id', 'ImgSendExcelAll');
                SendExcelAll.setAttribute('title', 'ارسال همه ي صفحات به اکسل');
                SendExcelAll.attachEvent('onclick', BtnSendAllToExcel_OnClick);
                SendExcelAll.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/Excel.png');

                SendExcelAll.style.cursor = "pointer";

                Send.appendChild(SendExcelAll);
            }

            var SendExcel = document.createElement('img');
            SendExcel.setAttribute('id', 'ImgSendExcel');
            SendExcel.setAttribute('title', 'ارسال صفحه جاري به اکسل');
            SendExcel.attachEvent('onclick', BtnSendToExcel_OnClick);
            SendExcel.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/ms-excel.png');
            SendExcel.style.cursor = "pointer";

            Send.appendChild(SendExcel);


            if (xmlNodes.item(0).selectSingleNode('AllowPaging').text != 0) {
                var SendPDFAll = document.createElement('img');
                SendPDFAll.setAttribute('id', 'ImgSendPDFAll');
                SendPDFAll.setAttribute('title', 'ارسال همه ي صفحات به پی دی اف');
                SendPDFAll.attachEvent('onclick', BtnSendAllToPDF_OnClick);

                SendPDFAll.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/PDF.png');

                SendPDFAll.style.cursor = "pointer";

                Send.appendChild(SendPDFAll);
            }

            var SendPDF = document.createElement('img');
            SendPDF.setAttribute('id', 'ImgSendPDF');
            SendPDF.setAttribute('title', 'ارسال صفحه جاري به پی دی اف');
            SendPDF.attachEvent('onclick', BtnSendToPDF_OnClick);

            SendPDF.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/application-pdf.png');

            SendPDF.style.cursor = "pointer";

            Send.appendChild(SendPDF);




        }

    }
}

function BtnGridFirst_OnClick(sender, eventargs) {
    if (document.getElementById('TxtGridCurPage').value != 1) {
        document.getElementById('TxtGridCurPage').value = 1;

        GridSearch(document.getElementById('TxtGridCurPage').value);
    }
}

function BtnGridPrev_OnClick(sender, eventargs) {
    if (parseInt(document.getElementById('TxtGridCurPage').value, 10) > 1) {
        document.getElementById('TxtGridCurPage').value = parseInt(document.getElementById('TxtGridCurPage').value, 10) - 1;

        GridSearch(document.getElementById('TxtGridCurPage').value);

    }
}

function BtnGridNext_OnClick(sender, eventargs) {

    if (parseInt(document.getElementById('TxtGridCurPage').value, 10) < parseInt(document.getElementById('TxtGridTotalPage').value, 10)) {
        document.getElementById('TxtGridCurPage').value = parseInt(document.getElementById('TxtGridCurPage').value, 10) + 1;

        GridSearch(document.getElementById('TxtGridCurPage').value);

    }
}

function BtnGridLast_OnClick(sender, eventargs) {
    if (document.getElementById('TxtGridCurPage').value != document.getElementById('TxtGridTotalPage').value) {
        document.getElementById('TxtGridCurPage').value = document.getElementById('TxtGridTotalPage').value;

        GridSearch(document.getElementById('TxtGridCurPage').value);
    }
}

function TxtGridCurPage_OnBlur(sender, eventargs) {
    if (parseInt(document.getElementById('TxtGridCurPage').value, 10) > parseInt(document.getElementById('TxtGridTotalPage').value, 10))
        document.getElementById('TxtGridCurPage').value = document.getElementById('TxtGridTotalPage').value;

    GridSearch(document.getElementById('TxtGridCurPage').value);
}

function SetGridSetting(oGrid, GridSetting) {
    var GridWidth = 0;
    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
    xmlDoc.loadXML(GridSetting)
    xmlDoc.setProperty("SelectionLanguage", "XPath")
    var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/GridSetting[Viewable=1]")

    var xmlDocA = new ActiveXObject("MsXml2.DomDocument")
    xmlDocA.loadXML(GridSetting)
    xmlDocA.setProperty("SelectionLanguage", "XPath")
    var xmlNodesA = xmlDocA.documentElement.selectNodes("/GeneralEntity/GridSetting[Attributable=1]")


    if (xmlNodes.length > 0) {
        var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
        var oRow = Header.insertRow();

        oRow.className = HeaderCssClass;

        var RadifCell = oRow.insertCell();
        RadifCell.style.width = "30px";
        RadifCell.align = "center";
        RadifCell.innerText = "*";
        GridWidth += 30;

        for (var i = 0; i < xmlNodes.length; ++i) {

            var oCell = oRow.insertCell();
            oCell.setAttribute("ColName", (xmlNodes.item(i).selectSingleNode('ColName').text).replace(/ /g, "_"));



            if (xmlNodes.item(i).selectSingleNode('LinkUrl') != null) {
                oCell.setAttribute("IsLink", 1);
                oCell.setAttribute("LinkUrl", xmlNodes.item(i).selectSingleNode('LinkUrl').text);
                oCell.setAttribute("UrlParam", xmlNodes.item(i).selectSingleNode('UrlParam').text);
                oCell.setAttribute("UrlParamVal", xmlNodes.item(i).selectSingleNode('UrlParamVal').text);
                oCell.setAttribute("UrlFeatur", xmlNodes.item(i).selectSingleNode('UrlFeatur').text);
                oCell.setAttribute("AccessName", xmlNodes.item(i).selectSingleNode('AccessName').text);

            }
            else {
                oCell.setAttribute("IsLink", 0);
            }

            oCell.style.width = xmlNodes.item(i).selectSingleNode('Width').text + 'px';
            oCell.align = "center";
            oCell.valign = "middle";
            oCell.innerText = xmlNodes.item(i).selectSingleNode('ColTitle').text;
            GridWidth += parseInt(xmlNodes.item(i).selectSingleNode('Width').text, 10);
        }

        var StrAttr = "";
        for (var j = 0; j < xmlNodesA.length; ++j) {
            if (StrAttr == "" && xmlNodesA.item(j).selectSingleNode('ColName').text != "") {
                StrAttr = (xmlNodesA.item(j).selectSingleNode('ColName').text).replace(/ /g, "_");
            }
            else {
                StrAttr += "," + (xmlNodesA.item(j).selectSingleNode('ColName').text).replace(/ /g, "_");
            }

        }


        oRow.setAttribute("Attrs", StrAttr);
    }

    oGrid.style.width = GridWidth + 'px';
    var Pager = document.getElementById('dPager');
    Pager.style.width = GridWidth;
}

var LastSelectedGridRow = null;
var LastSelectedGridRowStyle = "";
var GridSelectedRowStyle = "#FFD599";
var GridItemRowStyle = "#E7EEFE";
var GridAlternatingRowStyle = "#FEF8ED";
var GridFooterRowStyle = "";
function GridRow_OnClick() {
    var oRow = event.srcElement;
    while (oRow.tagName != "TR") {
        oRow = oRow.parentElement;
    }

    if (LastSelectedGridRow != null) {


        for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
            LastSelectedGridRow.cells[i].style.backgroundColor = LastSelectedGridRowStyle;
        }

    }


    if (oRow.cells.length > 0) {
        LastSelectedGridRowStyle = oRow.cells[0].style.backgroundColor;
    }
    for (var i = 0; i < oRow.cells.length; ++i) {
        oRow.cells[i].style.backgroundColor = GridSelectedRowStyle;
    }
    LastSelectedGridRow = oRow;


}