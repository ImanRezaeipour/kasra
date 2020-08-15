
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

//---------------------------------------------------------------------------------------
function BeginRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
}
function EndRequestHandler(sender, args) {
    document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
    if (document.getElementById(MasterObj + "txtAlert").value != "") {
        if (document.getElementById(MasterObj + "txtValidate").value == 0) {
            alert($get(MasterObj + "txtAlert").value);
            if (document.getElementById(MasterObj + "txtValidate").value == "5" && $get(MasterObj + "txtValue").value == "1")
                window.close();
        }       
        else {
            if (document.getElementById(MasterObj + "txtValidate").value != "5") {
                SetMsg($get(MasterObj + "txtAlert").value);
                if ($get(MasterObj + "txtValue").value == "1")
                    $get(MasterObj + "txtReportCount").value = (parseInt($get(MasterObj + "txtReportCount").value) + 1).toString();
                returnValue = 1
                if (RunState == 1)
                    OnClickBtnRun();
            }
            else {
                alert($get(MasterObj + "txtAlert").value)
            }
        }
        document.getElementById(MasterObj + "txtAlert").value = ""
        //                            EnabledLink()
        OnChangeCmbReport(document.getElementById(MasterObj + 'cmbReport'))
        document.getElementById(MasterObj + "cmbMenu").value = document.getElementById(MasterObj + "txtReportID").value
    }
    var StrVal = $get(MasterObj + "txtSubmit").value
    if (StrVal == "Filter") {
        LoadData()
    }
    else if (StrVal == "OnChangeCmbPages")
        LoadGrdPageParam()

    $get(MasterObj + "txtSubmit").value = ""
    $get(MasterObj + "txtValidate").value = ""
    $get(MasterObj + "txtKeyaError").value = ""
}


//*******************************************************************************
var MasterObj = "ctl00_ContentPlaceHolder1_", LastSelectedRowGrdParam = null, LastSelectedRowClassGrdParam = ""
        , GrdNewParamLastSelectedRow = null, GrdNewParamLastSelectedRowClass = "", GrdNewParamRowIdx = -1;

var LastSelectedRowGrdField = null, LastSelectedRowClassGrdField = ""
        , GrdNewFieldLastSelectedRow = null, GrdNewFieldLastSelectedRowClass = ""
        , GrdNewFieldRowIdx = -1, GrdNewLinkRowIdx = -1, GrdNewGroupRowIdx = -1, GrdNewSortRowIdx = -1

        , GrdNewLinkLastSelectedRow = null, GrdNewLinkLastSelectedRowClass = ""
        , GrdNewGroupLastSelectedRow = null, GrdNewGroupLastSelectedRowClass = ""
        , GrdNewSortLastSelectedRow = null, GrdNewSortLastSelectedRowClass = ""

        , LastSelectedRowGrdLink = null, LastSelectedRowClassGrdLink = ""
        , LastSelectedRowGrdGroup = null, LastSelectedRowClassGrdGroup = ""
        , LastSelectedRowGrdSort = null, LastSelectedRowClassGrdSort = "";
var nGrdNewParam = "GrdNewParam", nGrdNewField = "GrdNewField";
var nGrdNewLink = "GrdNewLink", nGrdNewGroup = "GrdNewGroup", nGrdNewSort = "GrdNewSort";
var nGrdLink = "GrdLink", oGrdLinkRowIdx = -1
document.dir = "RTL"
var GrdPageParamRowIdx = 0;
var LinkTypeID = 17, HtmCBold = "", HtmCTyp = "", HtmCOp = "", HtmCS = ""
        , HtmCOpT = "", HtmCOpr = "", HtmCN = "";
var selectedReport = 0;
//-------------------------------------------
if (document.getElementById(MasterObj + "txtAlert").value != "" && $get(MasterObj + "txtValue").value == "1") {
    if (document.getElementById(MasterObj + "txtValidate").value == "5") {
        alert($get(MasterObj + "txtAlert").value);
        window.close();
    }
}
//--------------------------------------------
OnLoad();
//        document.body.attachEvent('onclick', OnclickBody)
function OnclickBody() {

    var obj = window.event.srcElement
    while (obj != null && obj.tagName != 'Table') {
        obj = obj.parentElement
    }
    if (obj != null && obj.tagName == 'Table')
        alert(obj.id)
}
//*******************************************************************************
function TabStrip_TabSelect(sender, eventArgs) {

    if (TabStrip1.getSelectedTab().get_id() == "Link") {
        LoadGrdLink()
        if (document.getElementById(MasterObj + "txtTemplateID").value == "" || document.getElementById(MasterObj + "txtTemplateID").value == 0)
            return
        if (document.getElementById(MasterObj + "txtReportID").value == "" || document.getElementById(MasterObj + "txtReportID").value == 0)
            OnClickBtnSave()
    }
    document.getElementById(MasterObj + "txtMenuName").focus()
}
//*******************************************************************************
function LoadGrdLink() {
    var oGrdLink = document.getElementById(nGrdLink)
    var oGrdNewField = document.getElementById(nGrdNewField)
    var Len = oGrdNewField.rows.length
    var len2 = oGrdLink.rows.length
    for (var i = 0; i < len2; i++)
        oGrdLink.deleteRow(0)

    oGrdLinkRowIdx = -1
    LastSelectedRowGrdLink = null
    LastSelectedRowClassGrdLink = ""

    for (var i = 0; i < Len; i++) {
        if (oGrdNewField.rows(i).cells(2).firstChild.value == LinkTypeID)
            AddRow_GrdLink(oGrdNewField.rows(i).getAttribute("TmpID")
                                    , oGrdNewField.rows(i).getAttribute("Name")
                                    , LinkTypeID
                                    , oGrdNewField.rows(i).cells(3).firstChild.value
                                    , oGrdNewField.rows(i).cells(11).firstChild.value
                                    , oGrdNewField.rows(i).cells(12).firstChild.value
                                    , oGrdNewField.rows(i).cells(13).firstChild.value
                                    , oGrdNewField.rows(i).cells(14).firstChild.value
                                    , oGrdNewField.rows(i).getAttribute("Dis")
                                    )
    }
    //حذف لينک هايي که فيلد آنها حذف شده است 
    var oGrdNewLink = document.getElementById(nGrdNewLink)
    var len3 = oGrdNewLink.rows.length, Find = 0, j = 0, i = 0, tmpID;
    len2 = oGrdLink.rows.length
    for (i = 0; i < len3; i++) {
        tmpID = oGrdNewLink.rows(i).getAttribute("TmpID")

        for (j = 0; j < len2; j++) {
            if (tmpID == oGrdLink.rows(j).getAttribute("TmpID"))
                Find = 1
        }
        if (Find == 0) {
            oGrdNewLink.deleteRow(i)
            len3 = oGrdNewLink.rows.length
            i = 0
        }
        Find = 0, j = 0;
    }
}
//*******************************************************************************
function OnLoad() {
    HtmCBold = CreatComboBold()
    HtmCTyp = CreatComboFieldType()
    HtmCOp = CreateOperandCombo()
    HtmCS = CreatComboSortOrder()
    HtmCOpT = CreateOperationFieldTypeCombo()
    HtmCOpr = CreateOperationCombo()
    HtmCN = NatureCmb()

    if (document.getElementById(MasterObj + "txtPicPatch").value != "") {
        document.getElementById(MasterObj + 'chkLogo').checked = true
        document.getElementById(MasterObj + "TdImg").src = document.getElementById(MasterObj + "txtPicPatch").value;
    }
    document.getElementById(MasterObj + "cmbReport").value = document.getElementById(MasterObj + "txtTemplateID").value
    OnChangeCmbReport(document.getElementById(MasterObj + 'cmbReport'))
    //--------------------------------------------
    if ($get(MasterObj + "txtSubmit").value == "Filter") {
        LoadData()
    }
    else {

        OnClickBtnAddAllItem('GrdNewField')
        OnClickBtnAddAllItem('GrdNewParam')
    }
    //--------------------------------------------
    if (document.getElementById(MasterObj + "txtReportID").value != "" && document.getElementById(MasterObj + "txtReportID").value != "0") {
        document.getElementById(MasterObj + "cmbMenu").value = document.getElementById(MasterObj + "txtReportID").value
        document.getElementById(MasterObj + 'txtMenuName').value = document.getElementById(MasterObj + "cmbMenu").options[document.getElementById(MasterObj + "cmbMenu").selectedIndex].text
    }
}
//*******************************************************************************
function OndbClickGrd(GrdName) {
    OnClickBtnAddItem(GrdName);
}
//*******************************************************************************
function OnClickGrd(SelectedRow, GrdName) {
    switch (GrdName) {
        case nGrdNewParam:
            if (LastSelectedRowGrdParam != null) {
                LastSelectedRowGrdParam.className = LastSelectedRowClassGrdParam;
            }
            LastSelectedRowClassGrdParam = SelectedRow.className;
            LastSelectedRowGrdParam = SelectedRow;
            break;
        case nGrdNewField:
            if (LastSelectedRowGrdField != null) {
                LastSelectedRowGrdField.className = LastSelectedRowClassGrdField;
            }
            LastSelectedRowClassGrdField = SelectedRow.className;
            LastSelectedRowGrdField = SelectedRow;
            break;
        case nGrdNewLink:
            if (LastSelectedRowGrdLink != null) {
                LastSelectedRowGrdLink.className = LastSelectedRowClassGrdLink;
            }
            LastSelectedRowClassGrdLink = SelectedRow.className;
            LastSelectedRowGrdLink = SelectedRow;
            break;
        case nGrdLink:
            if (LastSelectedRowGrdLink != null) {
                LastSelectedRowGrdLink.className = LastSelectedRowClassGrdLink;
            }
            LastSelectedRowClassGrdLink = SelectedRow.className;
            LastSelectedRowGrdLink = SelectedRow;
            break;
        case nGrdNewGroup:
            if (LastSelectedRowGrdGroup != null) {
                LastSelectedRowGrdGroup.className = LastSelectedRowClassGrdGroup;
            }
            LastSelectedRowClassGrdGroup = SelectedRow.className;
            LastSelectedRowGrdGroup = SelectedRow;
            break;
        case nGrdNewSort:
            if (LastSelectedRowGrdSort != null) {
                LastSelectedRowGrdSort.className = LastSelectedRowClassGrdSort;
            }
            LastSelectedRowClassGrdSort = SelectedRow.className;
            LastSelectedRowGrdSort = SelectedRow;
            break;
    }
    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OnClickBtnAddItem(GrdName) {

    switch (GrdName) {
        case nGrdNewParam:
            var oGrdParam = document.getElementById("GrdParam")
            var oGrdNewParam = document.getElementById("GrdNewParam")
            if (LastSelectedRowGrdParam != null) {
                if (!oGrdParam || !oGrdNewParam) //If No Row
                    return;

                if (oGrdNewParam.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdParam.getAttribute("ID")))//If Add Befor
                    return;

                AddRow_GrdNewParam(LastSelectedRowGrdParam.getAttribute("ID")
                                            , LastSelectedRowGrdParam.getAttribute("DefaultValue")
                                            , LastSelectedRowGrdParam.getAttribute("Caption")
                                            , LastSelectedRowGrdParam.getAttribute("Size")
                                            , LastSelectedRowGrdParam.getAttribute("TypeID")
                                            , LastSelectedRowGrdParam.getAttribute("DisplayTypeID")
                                            , 0
                                            , 0
                                            , LastSelectedRowGrdParam.getAttribute("Editable")
                                            , 0
                                            );
            }
            break;
        case nGrdNewField:
            if (LastSelectedRowGrdField != null) {
                var oGrdField = document.getElementById("GrdField")
                var oGrdNewField = document.getElementById("GrdNewField")
                if (!oGrdField || !oGrdNewField) //If No Row
                    return

                if (oGrdNewField.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdField.getAttribute("ID")))//If Add Befor
                    return
                //                    ID, DefaultValue, Caption, Size, TypeID, DisplayTypeID
                //                                    , Color, Bgcolor, LinkURL, FontFamily, Bold, underLine, Disabled, Condition, Advanced, PreviousName
                var CaptionStar = ReplaceAll(LastSelectedRowGrdField.getAttribute("Caption"), "*", "");
                AddRow_GrdNewField(LastSelectedRowGrdField.getAttribute("ID")
                                            , LastSelectedRowGrdField.cells(1).innerText
                                            , CaptionStar
                                            , LastSelectedRowGrdField.getAttribute("Size")
                                            , LastSelectedRowGrdField.getAttribute("TypeID")
                                            , LastSelectedRowGrdField.getAttribute("DisplayTypeID")
                                            , ''
                                            , ''
                                            , LastSelectedRowGrdField.getAttribute("LinkUrl")
                                            , LastSelectedRowGrdField.getAttribute("UrlParam")
                                            , LastSelectedRowGrdField.getAttribute("UrlParamVal")
                                            , LastSelectedRowGrdField.getAttribute("UrlFeatur")
                                            , ''
                                            , 0
                                            , 0
                                            , LastSelectedRowGrdField.getAttribute("Editable")
                                            , LastSelectedRowGrdField.getAttribute("Condition")
                                            , 0
                                            , CaptionStar
                                            , LastSelectedRowGrdField.getAttribute("Name")
                                            , 0
                                            , ''
                                            , 0
                                            , 0
                                            , -1
                                            )
                try { oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).firstChild.focus() } catch (e) { }
                //-----------------------------------
                AddRow_GrdLink(LastSelectedRowGrdField.getAttribute("ID")
                                    , LastSelectedRowGrdField.getAttribute("Caption")
                                    , LastSelectedRowGrdField.getAttribute("DisplayTypeID")
                                    , LastSelectedRowGrdField.getAttribute("Size")
                                    , LastSelectedRowGrdField.getAttribute("LinkUrl")
                                    , LastSelectedRowGrdField.getAttribute("UrlParam")
                                    , LastSelectedRowGrdField.getAttribute("UrlParamVal")
                                    , LastSelectedRowGrdField.getAttribute("UrlFeatur")
                                    , LastSelectedRowGrdField.getAttribute("Editable")
                                    )
            }
            break;
        case nGrdLink:

            if (LastSelectedRowGrdLink != null) {
                if (document.getElementById(MasterObj + "txtReportID").value == "" || document.getElementById(MasterObj + "txtReportID").value == 0) {
                    OnClickBtnSave();
                    return
                }
                var oGrdLink = document.getElementById("GrdLink")
                var oGrdNewLink = document.getElementById("GrdNewLink")
                if (!oGrdLink || !oGrdNewLink) //If No Row
                    return


                if (oGrdNewLink.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdLink.getAttribute("TmpID")))//If Add Befor
                    return
                //----------------------

                //اگر سطری انتخاب شده مشابه همان سطر ايجاد شود
                if (GrdNewLinkLastSelectedRow != null) {
                    AddRow_GrdNewLink(LastSelectedRowGrdLink.getAttribute("TmpID")
                                        , LastSelectedRowGrdLink.getAttribute("Caption")
                                        , GrdNewLinkLastSelectedRow.cells(1).firstChild.value
                                        , GrdNewLinkLastSelectedRow.cells(2).firstChild.value
                                        , GrdNewLinkLastSelectedRow.cells(3).firstChild.value
                                        , GrdNewLinkLastSelectedRow.cells(4).firstChild.value
                                        , 0
                                        , LastSelectedRowGrdLink.getAttribute("Editable")
                                        )
                    //اگر گزارش کدی باشد باید کد مربوطه در مقادیر لینک ها هم جایگزین شود
                    UpdateLinkParamVal(GrdNewLinkRowIdx, FindCode(LastSelectedRowGrdLink.getAttribute("Caption")))

                }
                else {
                    AddRow_GrdNewLink(LastSelectedRowGrdLink.getAttribute("TmpID")
                                        , LastSelectedRowGrdLink.getAttribute("Caption")
                                        , LastSelectedRowGrdLink.getAttribute("LinkUrl")
                                        , LastSelectedRowGrdLink.getAttribute("UrlParam")
                                        , LastSelectedRowGrdLink.getAttribute("UrlParamVal")
                                        , LastSelectedRowGrdLink.getAttribute("UrlFeatur")
                                        , 0
                                        , LastSelectedRowGrdLink.getAttribute("Editable")
                                        )
                }
                //----------------------

                try { oGrdNewLink.rows(GrdNewLinkRowIdx).cells(1).firstChild.focus() } catch (e) { }
            }
            break;
        case nGrdNewGroup:
            if (LastSelectedRowGrdGroup != null) {
                var oGrdGroup = document.getElementById("GrdGroup")
                var oGrdNewGroup = document.getElementById("GrdNewGroup")
                if (!oGrdGroup || !oGrdNewGroup) //If No Row
                    return

                if (oGrdNewGroup.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdGroup.getAttribute("ID")))//If Add Befor
                    return
                AddRow_GrdNewGroup(LastSelectedRowGrdGroup.getAttribute("ID")
                                                , LastSelectedRowGrdGroup.getAttribute("Caption")
                                                , "A"
                                                , 0
                                                )
            }
            break;
        case nGrdNewSort:
            if (LastSelectedRowGrdSort != null) {
                var oGrdSort = document.getElementById("GrdSort")
                var oGrdNewSort = document.getElementById("GrdNewSort")
                if (!oGrdSort || !oGrdNewSort) //If No Row
                    return

                if (oGrdNewSort.rows.length > 0 && !CheckExists(GrdName, LastSelectedRowGrdSort.getAttribute("ID")))//If Add Befor
                    return
                AddRow_GrdNewSort(
                                        LastSelectedRowGrdSort.getAttribute("ID")
                                        , LastSelectedRowGrdSort.getAttribute("Caption")
                                        , "A"
                                        , 0
                                      )
            }
            break;
    }

}
//*******************************************************************************
function OnClickBtnDelItem(GrdName) {
    switch (GrdName) {
        case nGrdNewParam:
            if (GrdNewParamLastSelectedRow == null)
                return
            var oGrdNewParam = document.getElementById("GrdNewParam")
            oGrdNewParam.deleteRow(GrdNewParamLastSelectedRow.rowIndex)
            GrdNewParamRowIdx--;
            GrdNewParamLastSelectedRow = null
            SetRowStyle(GrdName)
            break;
        case nGrdNewField:
            if (GrdNewFieldLastSelectedRow == null)
                return
            var oGrdNewField = document.getElementById("GrdNewField")
            var idx = GrdNewFieldLastSelectedRow.rowIndex
            oGrdNewField.deleteRow(idx)
            GrdNewFieldRowIdx--;
            GrdNewFieldLastSelectedRow = null
            SetRowStyle(GrdName)
            //-----------------------------------
            //                    var oGrdNewLink = document.getElementById("GrdLink")
            //                    oGrdNewLink.deleteRow(idx)
            //                    oGrdLinkRowIdx--;
            //                    GrdNewLinkLastSelectedRow = null
            //                    SetRowStyle(nGrdLink)
            break;
        case nGrdLink:
            if (GrdNewLinkLastSelectedRow == null)
                return
            var oGrdNewLink = document.getElementById("GrdNewLink")
            oGrdNewLink.deleteRow(GrdNewLinkLastSelectedRow.rowIndex)
            GrdNewLinkRowIdx--;
            GrdNewLinkLastSelectedRow = null
            //                    SetRowStyle(GrdName)
            SetRowStyle("GrdNewLink")
            break;
        case nGrdNewGroup:
            if (GrdNewGroupLastSelectedRow == null)
                return
            var oGrdNewGroup = document.getElementById("GrdNewGroup")
            oGrdNewGroup.deleteRow(GrdNewGroupLastSelectedRow.rowIndex)
            GrdNewGroupRowIdx--;
            GrdNewGroupLastSelectedRow = null
            SetRowStyle(GrdName)
            break;
        case nGrdNewSort:
            if (GrdNewSortLastSelectedRow == null)
                return
            var oGrdNewSort = document.getElementById("GrdNewSort")
            oGrdNewSort.deleteRow(GrdNewSortLastSelectedRow.rowIndex)
            GrdNewSortRowIdx--;
            GrdNewSortLastSelectedRow = null
            SetRowStyle(GrdName)
            break;
    }
}
//*******************************************************************************
function OnClickBtnDelAllItem(GrdName) {
    ClearGrd(GrdName)
}
//*******************************************************************************
function OnClickBtnAddAllItem(GrdName) {
    ClearGrd(GrdName)
    var oGrd, len;
    switch (GrdName) {
        case nGrdNewParam:
            oGrd = document.getElementById("GrdParam")
            if (!oGrd)
                return
            len = oGrd.rows.length
            for (var i = 1; i < len; i++)
                AddRow_GrdNewParam(oGrd.rows(i).getAttribute("ID")
                                                , oGrd.rows(i).getAttribute("DefaultValue")
                                                , oGrd.rows(i).getAttribute("Caption")
                                                , oGrd.rows(i).getAttribute("Size")
                                                , oGrd.rows(i).getAttribute("TypeID")
                                                , oGrd.rows(i).getAttribute("DisplayTypeID")
                                                , 0
                                                , 0
                                                , oGrd.rows(i).getAttribute("Editable")
                                                , 0
                                                )
            break;
        case nGrdNewField:
            oGrd = document.getElementById("GrdField")
            if (!oGrd)
                return
            len = oGrd.rows.length
            for (var i = 1; i < len; i++) {
                AddRow_GrdNewField(oGrd.rows(i).getAttribute("ID")
                                                , oGrd.rows(i).cells(1).innerText
                                                , oGrd.rows(i).getAttribute("Caption")
                                                , oGrd.rows(i).getAttribute("Size")
                                                , oGrd.rows(i).getAttribute("TypeID")
                                                , oGrd.rows(i).getAttribute("DisplayTypeID")
                                                , ''
                                                , ''
                                                , oGrd.rows(i).getAttribute("LinkUrl")
                                                , oGrd.rows(i).getAttribute("UrlParam")
                                                , oGrd.rows(i).getAttribute("UrlParamVal")
                                                , oGrd.rows(i).getAttribute("UrlFeatur")
                                                , ''
                                                , 0
                                                , 0
                                                , oGrd.rows(i).getAttribute("Editable")
                                                , oGrd.rows(i).getAttribute("Condition")
                                                , 0
                                                , oGrd.rows(i).getAttribute("Caption")
                                                , oGrd.rows(i).getAttribute("Name")
                                                , 0
                                                , ''
                                                , 0
                                                , 0
                                                , -1
                                                )
                //-----------------------------------
                AddRow_GrdLink(oGrd.rows(i).getAttribute("ID")
                                    , oGrd.rows(i).getAttribute("Caption")
                                    , oGrd.rows(i).getAttribute("DisplayTypeID")
                                    , oGrd.rows(i).getAttribute("Size")
                                    , oGrd.rows(i).getAttribute("LinkUrl")
                                    , oGrd.rows(i).getAttribute("UrlParam")
                                    , oGrd.rows(i).getAttribute("UrlParamVal")
                                    , oGrd.rows(i).getAttribute("UrlFeatur")
                                    , oGrd.rows(i).getAttribute("Editable")
                                    )
            }
            break;
        case nGrdNewLink:
            oGrd = document.getElementById("GrdLink")
            if (!oGrd)
                return
            if (document.getElementById(MasterObj + "txtReportID").value == "" || document.getElementById(MasterObj + "txtReportID").value == 0) {
                OnClickBtnSave();
                return
            }
            len = oGrd.rows.length
            for (var i = 0; i < len; i++)
                AddRow_GrdNewLink(
                                    oGrd.rows(i).getAttribute("TmpID")
                                    , oGrd.rows(i).getAttribute("Caption")
                                    , oGrd.rows(i).getAttribute("LinkUrl")
                                    , oGrd.rows(i).getAttribute("UrlParam")
                                    , oGrd.rows(i).getAttribute("UrlParamVal")
                                    , oGrd.rows(i).getAttribute("UrlFeatur")
                                    , 0
                                    , oGrd.rows(i).getAttribute("Editable")
                                    )
            break;
        case nGrdNewGroup:
            oGrd = document.getElementById("GrdGroup")
            if (!oGrd)
                return
            len = oGrd.rows.length
            for (var i = 1; i < len; i++)
                AddRow_GrdNewGroup(
                                    oGrd.rows(i).getAttribute("ID")
                                    , oGrd.rows(i).getAttribute("Caption")
                                    , "A"
                                    , 0
                                    )
            break;
        case nGrdNewSort:
            oGrd = document.getElementById("GrdSort")
            if (!oGrd)
                return
            len = oGrd.rows.length
            for (var i = 1; i < len; i++)
                AddRow_GrdNewSort(
                                    oGrd.rows(i).getAttribute("ID")
                                    , oGrd.rows(i).getAttribute("Caption")
                                    , "A"
                                    , 0
                                    )
            break;
    }
}
//*******************************************************************************
function AddRow_GrdLink(ID, Caption, DisplayTypeID, Size, LinkUrl, UrlParam, UrlParamVal, UrlFeatur, Editable) {

    var oGrdLink = document.getElementById("GrdLink")
    oGrdLink.insertRow();
    oGrdLinkRowIdx++;
    oGrdLink.rows(oGrdLinkRowIdx).insertCell()
    oGrdLink.rows(oGrdLinkRowIdx).insertCell()
    oGrdLink.rows(oGrdLinkRowIdx).insertCell()

    if (oGrdLinkRowIdx % 2 == 0)
        oGrdLink.rows(oGrdLinkRowIdx).className = "CssItemStyle"
    else
        oGrdLink.rows(oGrdLinkRowIdx).className = "CssAlternatingItemStyle"

    var strName = ""
    ///
    if (Caption.length > 30)
        strName = Caption.substr(0, 27) + "..."
    else
        strName = Caption

    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("TmpID", ID)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("Caption", Caption)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("DisplayTypeID", DisplayTypeID)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("LinkUrl", LinkUrl)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("UrlParam", UrlParam)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("UrlParamVal", UrlParamVal)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("UrlFeatur", UrlFeatur)
    oGrdLink.rows(oGrdLinkRowIdx).setAttribute("Editable", Editable)


    oGrdLink.rows(oGrdLinkRowIdx).cells(0).innerText = strName
    oGrdLink.rows(oGrdLinkRowIdx).cells(0).title = Caption

    if (DisplayTypeID == LinkTypeID)
        oGrdLink.rows(oGrdLinkRowIdx).cells(1).innerText = "لينک"
    else
        oGrdLink.rows(oGrdLinkRowIdx).cells(1).innerText = "Lable"

    oGrdLink.rows(oGrdLinkRowIdx).cells(2).innerText = Size

    oGrdLink.rows(oGrdLinkRowIdx).align = "center"
    oGrdLink.rows(oGrdLinkRowIdx).cells(0).style.width = "300px"
    oGrdLink.rows(oGrdLinkRowIdx).cells(1).style.width = "80px"
    oGrdLink.rows(oGrdLinkRowIdx).cells(2).style.width = "80px"
}
//*******************************************************************************
function AddRow_GrdNewParam(ID, DefaultValue, Caption, Size, TypeID, DisplayTypeID, Advanced, Editable, Disabled, rptControl) {

    var oGrdNewParam = document.getElementById("GrdNewParam")
    oGrdNewParam.insertRow();
    GrdNewParamRowIdx++;
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()
    oGrdNewParam.rows(GrdNewParamRowIdx).insertCell()

    if (GrdNewParamRowIdx % 2 == 0)
        oGrdNewParam.rows(GrdNewParamRowIdx).className = "CssItemStyle"
    else
        oGrdNewParam.rows(GrdNewParamRowIdx).className = "CssAlternatingItemStyle"

    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("TmpID", ID)
    oGrdNewParam.rows(GrdNewParamRowIdx).setAttribute("Dis", Disabled)

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(0).innerHTML = "<INPUT type='text' class='txtControls' onkeypress='FKeyPress()' onkeydown='FKeyDown()' value='" + Caption + "' style='WIDTH:150px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).innerHTML = CreatCombo(nGrdNewParam, TypeID)
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).firstChild.value = DisplayTypeID
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(2).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:80px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(2).firstChild.value = Size
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:100px' />"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).firstChild.value = DefaultValue
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(4).innerHTML = HtmCBold
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(5).innerHTML = HtmCBold
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(6).innerHTML = CreateReportCombo()
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(6).firstChild.value = rptControl;

    if (Advanced == "true")
        Advanced = 1

    if (Editable == "true")
        Editable = 1

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(4).firstChild.value = Advanced
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(5).firstChild.value = Editable

    if (Disabled == 1)
        DisabledRowObject(oGrdNewParam.rows(GrdNewParamRowIdx), false)
    else
        DisabledRowObject(oGrdNewParam.rows(GrdNewParamRowIdx), true)

    oGrdNewParam.rows(GrdNewParamRowIdx).align = "center"

    oGrdNewParam.rows(GrdNewParamRowIdx).cells(0).style.width = "200px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(1).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(2).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(3).style.width = "100px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(4).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(5).style.width = "80px"
    oGrdNewParam.rows(GrdNewParamRowIdx).cells(6).style.width = "200px"
}

//*******************************************************************************
function ClearGrd(GrdName) {
    var oGrd = document.getElementById(GrdName)
    var len = oGrd.rows.length
    for (var i = 0; i < len; i++)
        oGrd.deleteRow(0)
    if (GrdName == nGrdNewField) {
        oGrd = document.getElementById(nGrdLink)
        len = oGrd.rows.length
        for (var i = 0; i < len; i++)
            oGrd.deleteRow(0)

        oGrd = document.getElementById(nGrdNewLink)
        len = oGrd.rows.length
        for (var i = 0; i < len; i++)
            oGrd.deleteRow(0)
    }
    if (GrdName == nGrdLink) {
        oGrd = document.getElementById(nGrdNewLink)
        len = oGrd.rows.length
        for (var i = 0; i < len; i++)
            oGrd.deleteRow(0)
    }
    switch (GrdName) {
        case nGrdNewParam:
            GrdNewParamRowIdx = -1
            //                    LastSelectedRowGrdParam = null
            //                    LastSelectedRowClassGrdParam = ""
            GrdNewParamLastSelectedRow = null
            GrdNewParamLastSelectedRowClass = ""
            break;
        case nGrdNewField:
            //                    LastSelectedRowGrdField = null
            //                    LastSelectedRowClassGrdField = ""
            GrdNewFieldLastSelectedRow = null
            GrdNewFieldLastSelectedRowClass = ""
            GrdNewFieldRowIdx = -1
            //-------------------------Clear GrdLink
            oGrdLinkRowIdx = -1
            LastSelectedRowGrdLink = null
            LastSelectedRowClassGrdLink = ""
            //-------------------------
            GrdNewLinkRowIdx = -1
            GrdNewLinkLastSelectedRow = null
            GrdNewLinkLastSelectedRowClass = ""
            break;
        case "GrdPageParam":
            GrdPageParamRowIdx = 0
            break;
        case nGrdNewLink:
            GrdNewLinkRowIdx = -1
            GrdNewLinkLastSelectedRow = null
            GrdNewLinkLastSelectedRowClass = ""
            //                    LastSelectedRowGrdLink = null
            //                    LastSelectedRowClassGrdLink = ""
            break;
        case nGrdNewGroup:
            GrdNewGroupRowIdx = -1
            GrdNewGroupLastSelectedRow = null
            GrdNewGroupLastSelectedRowClass = ""
            //                    LastSelectedRowGrdGroup = null
            //                    LastSelectedRowClassGrdGroup = ""
            break;
        case nGrdNewSort:
            GrdNewSortRowIdx = -1
            GrdNewSortLastSelectedRow = null
            GrdNewSortLastSelectedRowClass = ""
            //                    LastSelectedRowGrdSort = null
            //                    LastSelectedRowClassGrdSort = "";
            break;
        case nGrdLink:
            oGrdLinkRowIdx = -1
            LastSelectedRowGrdLink = null
            LastSelectedRowClassGrdLink = ""

            GrdNewLinkRowIdx = -1
            GrdNewLinkLastSelectedRow = null
            GrdNewLinkLastSelectedRowClass = ""
            break;
    }

}
//*******************************************************************************
function AddRow_GrdNewSort(ID, Caption, SortOrder, FieldType) {
    var oGrdNewSort = document.getElementById("GrdNewSort")
    oGrdNewSort.insertRow();
    GrdNewSortRowIdx++;
    oGrdNewSort.rows(GrdNewSortRowIdx).insertCell()
    oGrdNewSort.rows(GrdNewSortRowIdx).insertCell()
    oGrdNewSort.rows(GrdNewSortRowIdx).insertCell()

    if (GrdNewSortRowIdx % 2 == 0)
        oGrdNewSort.rows(GrdNewSortRowIdx).className = "CssItemStyle"
    else
        oGrdNewSort.rows(GrdNewSortRowIdx).className = "CssAlternatingItemStyle"
    oGrdNewSort.rows(GrdNewSortRowIdx).setAttribute("TmpID", ID)

    var strName = ""

    if (Caption.length > 30)
        strName = Caption.substr(0, 27) + "..."
    else
        strName = Caption

    oGrdNewSort.rows(GrdNewSortRowIdx).cells(0).innerHTML = "<Div>" + strName + "</Div>"
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(0).title = Caption
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(1).innerHTML = HtmCS
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(1).firstChild.value = SortOrder

    oGrdNewSort.rows(GrdNewSortRowIdx).cells(2).innerHTML = HtmCTyp
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(2).firstChild.value = FieldType

    oGrdNewSort.rows(GrdNewSortRowIdx).align = "center"
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(0).style.width = "230px"
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(1).style.width = "80px"
    oGrdNewSort.rows(GrdNewSortRowIdx).cells(2).style.width = "80px"
}
//*******************************************************************************
function AddRow_GrdNewGroup(ID, Caption, GroupSortOrder, FieldType) {
    var oGrdNewGroup = document.getElementById("GrdNewGroup")
    oGrdNewGroup.insertRow();
    GrdNewGroupRowIdx++;
    oGrdNewGroup.rows(GrdNewGroupRowIdx).insertCell()
    oGrdNewGroup.rows(GrdNewGroupRowIdx).insertCell()
    //            oGrdNewGroup.rows(GrdNewGroupRowIdx).insertCell()

    if (GrdNewGroupRowIdx % 2 == 0)
        oGrdNewGroup.rows(GrdNewGroupRowIdx).className = "CssItemStyle"
    else
        oGrdNewGroup.rows(GrdNewGroupRowIdx).className = "CssAlternatingItemStyle"
    oGrdNewGroup.rows(GrdNewGroupRowIdx).setAttribute("TmpID", ID)

    var strName = ""

    if (Caption.length > 30)
        strName = Caption.substr(0, 27) + "..."
    else
        strName = Caption

    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(0).innerHTML = "<Div>" + strName + "</Div>"
    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(0).title = Caption
    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(1).innerHTML = HtmCS
    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(1).firstChild.value = GroupSortOrder
    //            oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(2).innerHTML = XmtCTyp
    //            oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(2).firstChild.value = FieldType

    oGrdNewGroup.rows(GrdNewGroupRowIdx).align = "center"
    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(0).style.width = "230px"
    oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(1).style.width = "100px"
    //            oGrdNewGroup.rows(GrdNewGroupRowIdx).cells(2).style.width = "80px"
}
//*******************************************************************************
function AddRow_GrdNewLink(ID, Caption, LinkURL, UrlParam, UrlParamVal, UrlFeatur, Encryption, Disabled) {

    var oGrdNewLink = document.getElementById("GrdNewLink")
    oGrdNewLink.insertRow();
    GrdNewLinkRowIdx++;


    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()
    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()
    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()
    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()
    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()
    oGrdNewLink.rows(GrdNewLinkRowIdx).insertCell()


    if (GrdNewLinkRowIdx % 2 == 0)
        oGrdNewLink.rows(GrdNewLinkRowIdx).className = "CssItemStyle"
    else
        oGrdNewLink.rows(GrdNewLinkRowIdx).className = "CssAlternatingItemStyle"

    oGrdNewLink.rows(GrdNewLinkRowIdx).setAttribute("TmpID", ID)
    oGrdNewLink.rows(GrdNewLinkRowIdx).setAttribute("Dis", Disabled)

    var strName = ""

    if (Caption.length > 30)
        strName = Caption.substr(0, 27) + "..."
    else
        strName = Caption

    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(0).innerHTML = "<Div>" + strName + "</Div>"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(0).title = Caption

    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(1).innerHTML = "<INPUT type='text' class='txtControls' onkeypress='onkeypressLink()' style='WIDTH:110px' />"

    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(1).firstChild.value = LinkURL
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(2).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParam + "' style='WIDTH:110px' />"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(3).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParamVal + "' style='WIDTH:110px' />"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(4).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlFeatur + "' style='WIDTH:110px' />"
    var strCheck = ""
    if (Encryption == 1)
        strCheck = "checked"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(5).innerHTML = "<INPUT type='CheckBox' " + strCheck + "  style='WIDTH:60px' />"
    //oGrdNewLink.rows(GrdNewLinkRowIdx).cells(5).innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this) '" + (Encryption=="1" ? "checked":"") + "' style='WIDTH:20px' />"

    if (Disabled == 1)
        DisabledRowObject(oGrdNewLink.rows(GrdNewLinkRowIdx), false)
    else
        DisabledRowObject(oGrdNewLink.rows(GrdNewLinkRowIdx), true)

//    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(5).firstChild.disabled = true

    if (document.getElementById(MasterObj + "txtReportID").value == "" || document.getElementById(MasterObj + "txtReportID").value == 0) {
        oGrdNewLink.rows(GrdNewLinkRowIdx).cells(1).firstChild.disabled = true
        oGrdNewLink.rows(GrdNewLinkRowIdx).cells(2).firstChild.disabled = true
        oGrdNewLink.rows(GrdNewLinkRowIdx).cells(3).firstChild.disabled = true
        oGrdNewLink.rows(GrdNewLinkRowIdx).cells(4).firstChild.disabled = true
//        oGrdNewLink.rows(GrdNewLinkRowIdx).cells(5).firstChild.disabled = true
    }

    oGrdNewLink.rows(GrdNewLinkRowIdx).align = "center"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(0).style.width = "200px"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(1).style.width = "110px"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(2).style.width = "110px"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(3).style.width = "110px"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(4).style.width = "110px"
    oGrdNewLink.rows(GrdNewLinkRowIdx).cells(5).style.width = "20px"
}
//*******************************************************************************
function AddRow_GrdNewField(ID, DefaultValue, Caption, Size, TypeID, DisplayTypeID
                                    , Color, Bgcolor, LinkURL, UrlParam, UrlParamVal, UrlFeatur, FontFamily
                                    , Bold, underLine, Disabled, Condition, Advanced, PreviousName, RealName, Operation
                                    , ColStyle, OperationFieldType, Attribute, CodeNature) {
    
    var oGrdNewField = document.getElementById("GrdNewField")
    oGrdNewField.insertRow();
    GrdNewFieldRowIdx++;
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()
    oGrdNewField.rows(GrdNewFieldRowIdx).insertCell()

    if (GrdNewFieldRowIdx % 2 == 0)
        oGrdNewField.rows(GrdNewFieldRowIdx).className = "CssItemStyle"
    else
        oGrdNewField.rows(GrdNewFieldRowIdx).className = "CssAlternatingItemStyle"

    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("TmpID", ID)
    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("Dis", Disabled)
    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("Name", PreviousName)
    oGrdNewField.rows(GrdNewFieldRowIdx).setAttribute("RealName", RealName)


    var strName = ""

    if (PreviousName.length > 33)
        strName = PreviousName.substr(0, 30) + "..."
    else
        strName = PreviousName

    //            oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).innerHTML = "<div style='WIDTH:200px' >" + strName + "</Div>"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).innerText = strName
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).title = PreviousName
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).innerHTML = "<INPUT type='text' class='txtControls' onkeypress='FKeyPress()' onkeydown='FKeyDown()' value='" + Caption + "' style='WIDTH:150px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(2).innerHTML = CreatCombo(nGrdNewField, TypeID)
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(2).firstChild.value = DisplayTypeID
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:40px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).firstChild.value = Size
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(4).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:60px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(4).firstChild.value = DefaultValue

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).innerHTML = HtmCOp
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).firstChild.value = GetValFromOperand(Condition);

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(6).innerHTML = "<INPUT type='text' class='txtControls' value='" + GetVal1FromCondition(Condition) + "' style='WIDTH:40px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(7).innerHTML = "<INPUT type='text' class='txtControls' value='" + GetVal2FromCondition(Condition) + "' style='WIDTH:40px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(8).innerHTML = HtmCOpT
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(8).firstChild.value = OperationFieldType

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(9).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:60px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(9).firstChild.value = Color
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(10).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:80px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(10).firstChild.value = Bgcolor


    oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).innerHTML = "<INPUT type='text' class='txtControls' onkeypress='onkeypressLink()' style='WIDTH:100px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).firstChild.value = LinkURL
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(12).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParam + "' style='WIDTH:100px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(13).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlParamVal + "' style='WIDTH:100px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(14).innerHTML = "<INPUT type='text' class='txtControls' value='" + UrlFeatur + "' style='WIDTH:100px' />"


    oGrdNewField.rows(GrdNewFieldRowIdx).cells(15).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:40px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(15).firstChild.value = FontFamily
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(16).innerHTML = HtmCBold
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(16).firstChild.value = Bold
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(17).innerHTML = HtmCBold
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(17).firstChild.value = underLine
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(18).innerHTML = HtmCBold
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(18).firstChild.value = Advanced
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(19).innerHTML = HtmCOpr
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(19).firstChild.value = Operation
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(20).innerHTML = "<INPUT type='text' class='txtControls' style='WIDTH:60px' />"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(20).firstChild.value = ColStyle


    oGrdNewField.rows(GrdNewFieldRowIdx).cells(21).innerHTML = HtmCN
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(21).firstChild.value = CodeNature
    var strCheck = "checked"
    if (Attribute == 1)
        strCheck = ""
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(22).innerHTML = "<INPUT type='CheckBox' " + strCheck + " style='WIDTH:25px' />"



    if (Disabled == 1)
        DisabledRowObject(oGrdNewField.rows(GrdNewFieldRowIdx), false)
    else
        DisabledRowObject(oGrdNewField.rows(GrdNewFieldRowIdx), true)

    if (document.getElementById(MasterObj + "txtReportID").value == "" || document.getElementById(MasterObj + "txtReportID").value == 0) {
        oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).firstChild.disabled = true
        oGrdNewField.rows(GrdNewFieldRowIdx).cells(12).firstChild.disabled = true
        oGrdNewField.rows(GrdNewFieldRowIdx).cells(13).firstChild.disabled = true
        oGrdNewField.rows(GrdNewFieldRowIdx).cells(14).firstChild.disabled = true
    }

    oGrdNewField.rows(GrdNewFieldRowIdx).align = "center"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(0).style.width = "200px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(1).style.width = "150px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(2).style.width = "70px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(3).style.width = "40px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(4).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(5).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(6).style.width = "40px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(7).style.width = "40px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(8).style.width = "90px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(9).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(10).style.width = "80px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).style.width = "100px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(12).style.width = "100px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(13).style.width = "100px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(14).style.width = "100px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(15).style.width = "40px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(16).style.width = "70px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(17).style.width = "70px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(18).style.width = "70px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(19).style.width = "50px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(20).style.width = "60px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(21).style.width = "100px"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(22).style.width = "60px"

    oGrdNewField.rows(GrdNewFieldRowIdx).cells(11).style.display = "none"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(12).style.display = "none"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(13).style.display = "none"
    oGrdNewField.rows(GrdNewFieldRowIdx).cells(14).style.display = "none"
}
//*******************************************************************************
var oSelectedLinkRow = null
function onkeypressLink() {
    var oRow = window.event.srcElement.parentElement
    while (oRow.tagName != "TR")
        oRow = oRow.parentElement
    oSelectedLinkRow = oRow
    if (window.event.keyCode == 13)
        ShowPopUpLink()
}
//*******************************************************************************
var oPopup = window.createPopup()
function ShowPopUpLink() {

    var NewObj = window.event.srcElement;


    while (NewObj.tagName != 'FIELDSET') {
        NewObj = NewObj.parentElement
    }

    var posX = NewObj.offsetLeft;
    var posY = NewObj.offsetTop;

    while (NewObj.offsetParent) {
        posX = posX + NewObj.offsetParent.offsetLeft;
        posY = posY + NewObj.offsetParent.offsetTop;
        if (NewObj == document.getElementsByTagName('body')[0]) { break }
        else { NewObj = NewObj.offsetParent; }
    }
    document.getElementById("LinkDiv").style.top = posY + 22;
    document.getElementById("LinkDiv").style.left = posX + 150
    document.getElementById("LinkDiv").style.display = "inline";

    document.getElementById("TdFieldName").innerText = oSelectedLinkRow.cells(0).innerText

    if (oSelectedLinkRow.cells(1).firstChild.value == "") {
        document.getElementById(MasterObj + "cmbPages").value = ""
    } else {
        //                document.getElementById(MasterObj + "cmbPages").value = oSelectedLinkRow.cells(9).firstChild.value; //SetCmbPagesIndex(oSelectedLinkRow.cells(9).firstChild.value,0) //SetComboIndex(oSelectedLinkRow.cells(9).firstChild.value, "cmbPages");  //oSelectedLinkRow.cells(9).firstChild.value
        document.getElementById(MasterObj + "cmbPages").value = SetCmbPagesIndex(oSelectedLinkRow.cells(1).firstChild.value, 0)
        OnChangeCmbPages();
    }
    ClearGrd("GrdPageParam")
}
//*******************************************************************************
var oXmlDocLink = new ActiveXObject("Microsoft.XMLDOM")
oXmlDocLink.async = "false"
oXmlDocLink.loadXML(document.getElementById(MasterObj + "txtXmlMenuItems").value)
function SetCmbPagesIndex(LinkUrl, MenuItemID) {
    var XmlNodeoXmlDocLink; //substring
    var str = "", url = "";
    if (LinkUrl != "") {
        url = ReplaceAll(LinkUrl, "/", "")
        url = url.substring(0, url.length - 5)
        if (url == "FrmPresentationApp_PagesFormGeneratorReportShow") {
            return GetUrlOfReportShow()
        }
        XmlNodeoXmlDocLink = oXmlDocLink.documentElement.selectNodes("/FormGeneratorEntity/GetPrepareMenuItem[Url='" + url + "']")
        if (XmlNodeoXmlDocLink.length > 0)
            str = XmlNodeoXmlDocLink.item(0).selectSingleNode("MenuItemID").text
        else
            str = 0;
    }
    else if (MenuItemID != 0) {
        XmlNodeoXmlDocLink = oXmlDocLink.documentElement.selectNodes("/FormGeneratorEntity/GetPrepareMenuItem[MenuItemID=" + MenuItemID + "]")
        if (XmlNodeoXmlDocLink.length > 0)
            str = XmlNodeoXmlDocLink.item(0).selectSingleNode("LeftUrl").text

    }
    return str;

}
//*******************************************************************************
//براي صفحاتی که از طریق گزارش ساز پویا ساخته شده اند
function GetUrlOfReportShow() {
    var Param = oSelectedLinkRow.cells(2).firstChild.value//MenuItemID@OnLineUser@ToPersonId@SessionID@DateFrom
    var ParamVal = oSelectedLinkRow.cells(3).firstChild.value//2;11167@3;5@3;5@3;4@4;2
    //---------------------------
    arrParam = Param.split('@')
    arrParamVal = ParamVal.split('@')
    //--------------------------
    if (arrParam[0] && arrParam[0] == "MenuItemID") {
        arrVal = arrParamVal[0].split(';')
        return arrVal[1]
    }
    return 0;
}
//*******************************************************************************
function OnClickBtnLinkOk() {
    //            oSelectedLinkRow.cells(9).firstChild.value = document.getElementById(MasterObj + "cmbPages").value //SetCmbPagesIndex("", document.getElementById(MasterObj + "cmbPages").value)//document.getElementById(MasterObj + "cmbPages").options[document.getElementById(MasterObj + "cmbPages").selectedIndex].text;
    oSelectedLinkRow.cells(1).firstChild.value = SetCmbPagesIndex("", document.getElementById(MasterObj + "cmbPages").value)
    oSelectedLinkRow.cells(2).firstChild.value = GenerateUrlParam()
    oSelectedLinkRow.cells(3).firstChild.value = GenerateUrlParamVal()
    document.getElementById("LinkDiv").style.display = "none";
}
//*******************************************************************************
function GenerateUrlParam() {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    var Len = oGrdPageParam.rows.length, v0, v1
    var strParam = 'MenuItemID@OnLineUser@ToPersonId@SessionID'
    for (var i = 0; i < Len; i++) {
        v0 = oGrdPageParam.rows(i).cells(0).firstChild.value

        if (oGrdPageParam.rows(i).cells(1).firstChild.value != "")
            v1 = oGrdPageParam.rows(i).cells(1).firstChild.value

        if (oGrdPageParam.rows(i).cells(2).firstChild.value != "" && oGrdPageParam.rows(i).cells(2).firstChild.value != "0")
            v1 = oGrdPageParam.rows(i).cells(2).firstChild.value

        if (oGrdPageParam.rows(i).cells(3).firstChild.value != "" && oGrdPageParam.rows(i).cells(3).firstChild.value != "0")
            v1 = oGrdPageParam.rows(i).cells(3).firstChild.value

        if (v0 != "0" && v0 != "" && v1 != "0" && v1 != "") {
            strParam += "@" + oGrdPageParam.rows(i).cells(0).firstChild.value
        }
    }
    return strParam
}
//*******************************************************************************
function GenerateUrlParamVal() {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    var Len = oGrdPageParam.rows.length
    var strParamVal, v0, v1, ParamType = "@4;"
    strParamVal = '2;' + document.getElementById(MasterObj + "cmbPages").value
    strParamVal += '@3;5@3;5@3;4'
    for (var i = 0; i < Len; i++) {
        v0 = oGrdPageParam.rows(i).cells(0).firstChild.value
        v1 = oGrdPageParam.rows(i).cells(1).firstChild.value

        if (oGrdPageParam.rows(i).cells(1).firstChild.value != "") {
            v1 = oGrdPageParam.rows(i).cells(1).firstChild.value
            ParamType = "@2;"//مقدار ثابت
        }

        if (oGrdPageParam.rows(i).cells(2).firstChild.value != "" && oGrdPageParam.rows(i).cells(2).firstChild.value != "0") {
            //                    v1 ="["+ oGrdPageParam.rows(i).cells(2).firstChild.options(oGrdPageParam.rows(i).cells(2).firstChild.selectedIndex).text+"]"
            v1 = oGrdPageParam.rows(i).cells(2).firstChild.options(oGrdPageParam.rows(i).cells(2).firstChild.selectedIndex).text

            if (IsAtt(oGrdPageParam.rows(i).cells(2).firstChild.value) == "1")
                ParamType = "@4;"//فیلد Attribute
            else
                ParamType = "@1;"//فیلد عادي
        }

        if (oGrdPageParam.rows(i).cells(3).firstChild.value != "" && oGrdPageParam.rows(i).cells(3).firstChild.value != "0") {
            v1 = oGrdPageParam.rows(i).cells(3).firstChild.value
            ParamType = "@5;" //جدول کد
        }
        if (oGrdPageParam.rows(i).cells(0).firstChild.value == "SDate" && (oGrdPageParam.rows(i).cells(2).firstChild.value == "" || oGrdPageParam.rows(i).cells(2).firstChild.value == "0")) {
            v1 = "1";
            ParamType = "@3;" //جدول کد
        }
        if (oGrdPageParam.rows(i).cells(0).firstChild.value == "EDate" && (oGrdPageParam.rows(i).cells(2).firstChild.value == "" || oGrdPageParam.rows(i).cells(2).firstChild.value == "0")) {
            v1 = "2";
            ParamType = "@3;" //جدول کد
        }
        if (v0 != "0" && v0 != "" && v1 != "0" && v1 != "")
            strParamVal += ParamType + v1
    }
    return strParamVal
}
//*******************************************************************************
function OnClickBtnLinkCancel() {
    document.getElementById("LinkDiv").style.display = "none";
}
//*******************************************************************************
function CreateOperandCombo() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand")
    strHtml = "<select class='txtControls' style='width:70px' >"
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;


}
//*******************************************************************************
function CreateOperationFieldTypeCombo() {

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOpFieldType").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo")
    strHtml = "<select class='txtControls' style='width:90px'> "
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;
}
//*******************************************************************************
function CreateCodeForParameter() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAllCode").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetAllCodeForParameter")
    strHtml = "<select  class='txtControls' style='width:130px'>"
    strHtml += "<option value='0'>انتخاب نشده</option>"
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("CodeID").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("CodeName").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;

}
//*******************************************************************************
function CreateOperationCombo() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperation").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo")
    strHtml = "<select class='txtControls' style='width:60px' >"
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;

}
//*******************************************************************************
function NatureCmb() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    strHtml = "<select class='txtControls' style='width:100px'>"
    if (document.getElementById(MasterObj + "xNature").value == "")
        return strHtml + "</select>";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "xNature").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo")
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;
}
//*******************************************************************************
function ParValCmb() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    strHtml = "<select class='txtControls' style='width:100px'>"
    strHtml += "<option value='0'>انتخاب نشده</option>"
    if (document.getElementById(MasterObj + "xPVal").value == "")
        return strHtml + "</select>"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "xPVal").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetReportParamVal")
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml
}
//*******************************************************************************
function IsAtt(oVal) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    if (document.getElementById(MasterObj + "xPVal").value == "")
        return 0
    oXmlDoc.loadXML(document.getElementById(MasterObj + "xPVal").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetReportParamVal[Val=" + oVal + "]")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("att").text
    else
        return 0
}
//*******************************************************************************
function GenerateCondition(ORowField) {
    var StrWhere = ''
    var op = ORowField.cells(5).firstChild.value
    op = GetOperandFromVal(op)
    var v1 = ORowField.cells(6).firstChild.value
    var v2 = ORowField.cells(7).firstChild.value
    var opFieldType = ORowField.cells(8).firstChild.value
    var Name = ORowField.getAttribute("RealName")
    var Arestring = false;
    if (parseInt(ORowField.cells(21).firstChild.value) > 0)
        Arestring = true;
    Name = "[" + Name + "]"
    //-------------------------------------افزودن نوع فيلد براي شرط

    switch (opFieldType) {
        case "18301": //ساعت
            Name = "Att.TTN(" + Name + ")"
            break;
        case "18302": //عدد اعشار
            Name = "cast(isnull(" + Name + ",0) as float)"
            break;
        case "18303": //عدد صحيح
            Name = "cast(isnull(" + Name + ",0) as int)"
            break;
            //                case "18304": //رشته 
            //                    if (v1!="") 
            //                        v1 = "'" + v1 + "'" 
            //                    if (v2 != "") 
            //                        v2 = "'" + v2 + "'" 
            //                    break; 
    }
    //-------------------------------------
    if (op != 0 && (v1 != "" || v2 != "")) {
        if (Arestring) {
            v1 = "'" + v1.trim() + "'";
            v2 = "'" + v2.trim() + "'";
        }
        switch (op) {
            case "Between":
                if (v1 != "" && v2 != "")
                    StrWhere = Name + " Between " + v1 + " and " + v2
                break;
            case ">":
                StrWhere = Name + " &gt;" + v1
                break;
            case "<":
                StrWhere = Name + "&lt;" + v1
                break;
            case "=":
                StrWhere = Name + op + v1
                break;
            case "<>":
                StrWhere = Name + "&lt;&gt; " + v1
                break;
            case "in":
                StrWhere = Name + " in ("

                if (v1 != "" && v2 != "")
                    StrWhere += v1 + "," + v2

                else if (v1 != "" && v2 == "")
                    StrWhere += v1

                else if (v1 == "" && v2 != "")
                    StrWhere += v2

                StrWhere += ")"

                break;
            case "Like":
                if (v1 != "")
                    StrWhere = Name + " Like '%" + v1 + "%'"

                break;
        }
    }
    return StrWhere;
}
//*******************************************************************************
function GetOperandFromVal(val) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    var strHtml = ''
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[Val=" + val + "]")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("StrVal").text
    return '';
}
//*******************************************************************************
function GetValFromOperand(Condition) {
    var op = GetOperandFromCondition(Condition)

    if (op == "")
        return 0;
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
    oXmlDoc.async = "false"
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlOperand").value)
    XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOperand[StrVal='" + op + "']")

    if (XmlNode.length > 0)
        return XmlNode.item(0).selectSingleNode("Val").text
    return 0;
}
//*******************************************************************************
function GetVal1FromCondition(Condition) {
    var op = GetOperandFromCondition(Condition);
    var v1 = "";
    if (op == ">" || op == "<" || op == "=")
        v1 = Condition.substring(Condition.lastIndexOf(op) + 1, Condition.length);

    if (op == "<>")
        v1 = Condition.substring(Condition.search("<>") + 2, Condition.length);
    if (op == "Between") {
        v1 = Condition.substring(Condition.search("Between") + 7, Condition.search("and"));
    }
    if (op == "Like") {
        v1 = Condition.substring(Condition.indexOf("%") + 1, Condition.lastIndexOf("%"));
    }
    if (op == "in")
        v1 = Condition.substring(Condition.lastIndexOf("(") + 1, Condition.lastIndexOf(","));
    v1 = ReplaceAll(v1, "'", "");
    return ReplaceAll(v1, " ", "");
}
//*******************************************************************************
function GetVal2FromCondition(Condition) {
    var op = GetOperandFromCondition(Condition);
    var v2 = '';
    if (op == "in")
        v2 = Condition.substring(Condition.lastIndexOf(",") + 1, Condition.lastIndexOf(")"));
    if (op == "Between")
        v2 = Condition.substring(Condition.lastIndexOf("and") + 3, Condition.length);
    v2 = ReplaceAll(v2, "'", "");
    return ReplaceAll(v2, " ", "");
}
//*******************************************************************************
function GetOperandFromCondition(Condition) {
    if (Condition.search("<>") != -1)
        return "<>";
    if (Condition.lastIndexOf(">") != -1)
        return ">";
    if (Condition.lastIndexOf("<") != -1)
        return "<";
    if (Condition.lastIndexOf("=") != -1)
        return "=";
    if (Condition.lastIndexOf("%") != -1)
        return "Like";
    if (Condition.search("Between") != -1)
        return "Between";
    if (Condition.lastIndexOf("(") != -1)
        return "in";
    return "";

}
//*******************************************************************************
function DisabledRowObject(ORow, disabled) {
    var len = ORow.cells.length
    if (disabled == 1)
        disabled = true
    else if (disabled == 0)
        disabled = false
    for (var i = 0; i < len; i++) {
        if (ORow.cells(i).firstChild && ORow.cells(i).firstChild.disabled != undefined)
            ORow.cells(i).firstChild.disabled = disabled
    }
}
//*******************************************************************************
function CheckExists(GrdName, tmpID) {

    switch (GrdName) {
        case nGrdNewParam:
            var oGrdParam = document.getElementById("GrdParam")
            var oGrdNewParam = document.getElementById("GrdNewParam")
            if (!oGrdParam || !oGrdNewParam)
                return
            var len = oGrdNewParam.rows.length

            for (var i = 0; i < len; i++) {

                if (oGrdNewParam.rows(i).TmpID == tmpID)
                    return false
            }
            break;
        case nGrdNewField:
            var oGrdField = document.getElementById("GrdField")
            var oGrdNewField = document.getElementById("GrdNewField")
            if (!oGrdField || !oGrdNewField)
                return
            var len = oGrdNewField.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrdNewField.rows(i).TmpID == tmpID)
                    return false
            }
            break;
        case nGrdLink:
            var oGrdLink = document.getElementById("GrdLink")
            var oGrdNewLink = document.getElementById("GrdNewLink")
            if (!oGrdLink || !oGrdNewLink)
                return
            var len = oGrdNewLink.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrdNewLink.rows(i).TmpID == tmpID)
                    return false
            }
            break;
        case nGrdNewGroup:
            var oGrdGroup = document.getElementById("GrdGroup")
            var oGrdNewGroup = document.getElementById("GrdNewGroup")
            if (!oGrdGroup || !oGrdNewGroup)
                return
            var len = oGrdNewGroup.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrdNewGroup.rows(i).TmpID == tmpID)
                    return false
            }
            break;
        case nGrdNewSort:
            var oGrdSort = document.getElementById("GrdSort")
            var oGrdNewSort = document.getElementById("GrdNewSort")
            if (!oGrdSort || !oGrdNewSort)
                return
            var len = oGrdNewSort.rows.length
            for (var i = 0; i < len; i++) {
                if (oGrdNewSort.rows(i).TmpID == tmpID)
                    return false
            }
            break;

    }

    return true
}
//*******************************************************************************
function CreatCombo(GrdName, TypeID) {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strHtml = '';
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtMappingType").value);
    var XmlNode;
    if (GrdName == nGrdNewParam) {
        XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMappingType[TypeID=" + TypeID + "]");
        strHtml = "<select class='txtControls' style='width:100px'>"
        strHtml += "<option value='0'>انتخاب نشده</option>"
        var len = XmlNode.length

        for (var i = 0; i < len; i++) {
            strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("MappedTypeID").text + "'>"
            strHtml += XmlNode.item(i).selectSingleNode("MappedTitle").text
            strHtml += "</option>"
        }
        strHtml += "</select>"
        return strHtml;
    }
    else if (GrdName == nGrdNewField) {
        XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetVariableType[Acronym='Link' or Acronym='Lable']");
        strHtml = "<select  class='txtControls' style='width:70px'>"
        strHtml += "<option value='0'>انتخاب نشده</option>"
        var len = XmlNode.length
        for (var i = 0; i < len; i++) {
            strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("ID").text + "'>"
            strHtml += XmlNode.item(i).selectSingleNode("Name").text
            strHtml += "</option>"
        }
        strHtml += "</select>"
        return strHtml;
    }
    return '';
}
//*******************************************************************************
function CreatComboSortOrder() {
    var strHtml = "<select class='TxtControls' style='width:80px'>";
    strHtml += "<option value='-1'>انتخاب نشده</option>";
    strHtml += "<option value='A'>صعودي</option>";
    strHtml += "<option value='D'>نزولي</option>";
    strHtml += "</select>";
    return strHtml;
}
//*******************************************************************************
function CreatComboFieldType() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strHtml = '';
    oXmlDoc.async = "false";
    strHtml = "<select  class='txtControls' style='width:80px'>";
    strHtml += "<option value='0'>انتخاب نشده</option>";
    if (document.getElementById(MasterObj + "txtXmlSortFieldType").value == "")
        return strHtml += "</select>";

    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlSortFieldType").value);
    var xmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo");

    var len = xmlNode.length;
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + xmlNode.item(i).selectSingleNode("Val").text + "'>";
        strHtml += xmlNode.item(i).selectSingleNode("Title").text;
        strHtml += "</option>";
    }
    strHtml += "</select>";
    return strHtml;
}
//*******************************************************************************
function CreateReportCombo() {

    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    var strHtml = '';
    oXmlDoc.async = "false";
    strHtml = "<select  class='txtControls' style='width:190px'>"
    strHtml += "<option value='0'>انتخاب نشده</option>"
    if (document.getElementById(MasterObj + "txtReportcontrol").value == "")
        return strHtml += "</select>";

    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtReportcontrol").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMenu");

    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + XmlNode.item(i).selectSingleNode("Val").text + "'>"
        strHtml += XmlNode.item(i).selectSingleNode("Title").text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;

}
//*******************************************************************************
function CreatComboBold() {
    var strHtml = "<select class='TxtControls' style='width:70px'>"
    strHtml += "<option value='-1'>انتخاب نشده</option>"
    strHtml += "<option value='0'>False</option>"
    strHtml += "<option value='1'>True</option>"
    strHtml += "</select>"
    return strHtml;
}
//*******************************************************************************
function OnClickGrdParamSub(Obj) {
    var oRow, rIndex;
    oRow = window.event.srcElement

    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement
    if (oRow.parentElement.parentElement.id != nGrdNewParam)
        return
    if (GrdNewParamLastSelectedRow != null) {

        GrdNewParamLastSelectedRow.className = GrdNewParamLastSelectedRowClass;
    }
    GrdNewParamLastSelectedRowClass = oRow.className;
    GrdNewParamLastSelectedRow = oRow;
    oRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OnClickGrdNewField(Obj) {
    var oRow = window.event.srcElement

    if (oRow == null)
        oRow = obj
    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement
    if (oRow.parentElement.parentElement.id != nGrdNewField)
        return
    if (GrdNewFieldLastSelectedRow != null) {

        GrdNewFieldLastSelectedRow.className = GrdNewFieldLastSelectedRowClass;
    }
    GrdNewFieldLastSelectedRowClass = oRow.className;
    GrdNewFieldLastSelectedRow = oRow;
    oRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function OnClickGrdNew(Obj, GrdName) {
    var oRow, rIndex;
    oRow = window.event.srcElement

    while (oRow.tagName != 'TR')
        oRow = oRow.parentElement

    switch (GrdName) {
        case nGrdNewParam: //-------------------------------------------------------------------
            if (oRow.parentElement.parentElement.id != nGrdNewParam)
                return
            if (GrdNewParamLastSelectedRow != null) {

                GrdNewParamLastSelectedRow.className = GrdNewParamLastSelectedRowClass;
            }
            GrdNewParamLastSelectedRowClass = oRow.className;
            GrdNewParamLastSelectedRow = oRow;
            break;
        case nGrdNewField: //-------------------------------------------------------------------
            if (oRow.parentElement.parentElement.id != nGrdNewField)
                return
            if (GrdNewFieldLastSelectedRow != null) {

                GrdNewFieldLastSelectedRow.className = GrdNewFieldLastSelectedRowClass;
            }
            GrdNewFieldLastSelectedRowClass = oRow.className;
            GrdNewFieldLastSelectedRow = oRow;
            break;
        case nGrdLink: //-------------------------------------------------------------------

            if (oRow.parentElement.parentElement.id != nGrdLink)
                return

            if (LastSelectedRowGrdLink != null) {

                LastSelectedRowGrdLink.className = LastSelectedRowClassGrdLink;
            }
            LastSelectedRowClassGrdLink = oRow.className;
            LastSelectedRowGrdLink = oRow;
            break;
        case nGrdNewLink: //-------------------------------------------------------------------

            if (oRow.parentElement.parentElement.id != nGrdNewLink)
                return

            if (GrdNewLinkLastSelectedRow != null) {

                GrdNewLinkLastSelectedRow.className = GrdNewLinkLastSelectedRowClass;
            }
            GrdNewLinkLastSelectedRowClass = oRow.className;
            GrdNewLinkLastSelectedRow = oRow;
            break;
        case nGrdNewGroup: //-------------------------------------------------------------------
            if (oRow.parentElement.parentElement.id != nGrdNewGroup)
                return
            if (GrdNewGroupLastSelectedRow != null) {

                GrdNewGroupLastSelectedRow.className = GrdNewGroupLastSelectedRowClass;
            }
            GrdNewGroupLastSelectedRowClass = oRow.className;
            GrdNewGroupLastSelectedRow = oRow;
            break;
        case nGrdNewSort: //-------------------------------------------------------------------
            if (oRow.parentElement.parentElement.id != nGrdNewSort)
                return
            if (GrdNewSortLastSelectedRow != null) {

                GrdNewSortLastSelectedRow.className = GrdNewSortLastSelectedRowClass;
            }
            GrdNewSortLastSelectedRowClass = oRow.className;
            GrdNewSortLastSelectedRow = oRow;
            break;

    }
    oRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function SetRowStyle(GrdName) {
    var oGrd;
    oGrd = document.getElementById(GrdName)
    var len = oGrd.rows.length
    for (var i = 0; i < len; i++) {
        if (oGrd.rows(i).rowIndex % 2 == 0)
            oGrd.rows(i).className = "CssItemStyle"
        else
            oGrd.rows(i).className = "CssAlternatingItemStyle"
    }
}
//*******************************************************************************
function OnClickBtnNew() {

    ClearGrd(nGrdNewParam)
    ClearGrd(nGrdNewField)
    ClearGrd("GrdPageParam")
    ClearGrd(nGrdNewLink)
    ClearGrd(nGrdNewGroup)
    ClearGrd(nGrdNewSort)
    document.getElementById(MasterObj + "txtMenuName").value = ""
    document.getElementById(MasterObj + 'cmbMenu').value = 0
    document.getElementById(MasterObj + 'txtReportID').value = 0

    document.getElementById(MasterObj + 'chkPageNumber').checked = false
    document.getElementById(MasterObj + 'chkDate').checked = false
    document.getElementById(MasterObj + 'chkRptSubject').checked = false
    document.getElementById(MasterObj + 'txtRptSubject').value = ''
    document.getElementById(MasterObj + 'chkLogo').checked = false
    document.getElementById(MasterObj + "txtPicPatch").value = ""
    document.getElementById(MasterObj + "TdImg").src = "../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
}
//*******************************************************************************
function OnClickBtnSaveAs() {
    document.getElementById(MasterObj + "txtReportID").value = "0";
    OnClickBtnSave()
}
//*******************************************************************************
function OnClickBtnSave() {
    if (CheckEmpty())
        return
    var FlagField = 0, GLen, FlagParm = 0
    var StrXml = "<Root>"
    var oCmbSp = document.getElementById(MasterObj + "cmbSp")
    var oGrdNewParam = document.getElementById("GrdNewParam")
    //------------------------------------------
    document.getElementById(MasterObj + "txtTemplateID").value = document.getElementById(MasterObj + "cmbReport").value
    StrXml += "<Info>"
    StrXml += "<TemplateID>" + document.getElementById(MasterObj + "txtTemplateID").value + "</TemplateID>"
    StrXml += "<ReportName>" + document.getElementById(MasterObj + "txtMenuName").value + "</ReportName>"
    StrXml += "</Info>"

    var oGrdNewField = document.getElementById("GrdNewField")
    GLen = oGrdNewField.rows.length
    var strStyle = ''
    //var j = 0;
    //if (document.getElementById(MasterObj + "ChkControl").checked == true) {
    //    StrXml += "<Field>"
    //    StrXml += "<Name>" + oGrdNewField.rows(i).cells(1).firstChild.value + "</Name>"
    //    StrXml += "<TypeID>" + oGrdNewField.rows(i).cells(2).firstChild.value + "</TypeID>"
    //    StrXml += "<Size>" + oGrdNewField.rows(i).cells(3).firstChild.value + "</Size>"
    //    StrXml += "<TmpFieldID>" + oGrdNewField.rows(i).getAttribute("TmpID") + "</TmpFieldID>"
    //    //StrXml += "<Intval>" + oGrdNewField.rows(i).rowIndex + 1 + "</Intval>"
    //    StrXml += "<Intval>" + (i + 1) + "</Intval>"
    //    StrXml += "<Attribute>0</Attribute>"
    //    //------------------------------------------
    //    StrXml += GenerateUrL(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت لینک ها
    //    StrXml += GenerateGroup(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت گروه بندی
    //    StrXml += GenerateSort(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت مرتب سازی
    //    //------------------------------------------
    //    StrXml += "<Viewable>1</Viewable></Field>"
    //}
    for (var i = 0; i < GLen; i++) {

        if (oGrdNewField.rows(i).cells(1).firstChild.value == "" || oGrdNewField.rows(i).cells(2).firstChild.value == ""
                || oGrdNewField.rows(i).cells(3).firstChild.value == "" || oGrdNewField.rows(i).cells(3).firstChild.value == 0) {
            FlagField = 1
            break
        }
        StrXml += "<Field>"
        StrXml += "<Name>" + oGrdNewField.rows(i).cells(1).firstChild.value + "</Name>"
        StrXml += "<TypeID>" + oGrdNewField.rows(i).cells(2).firstChild.value + "</TypeID>"
        StrXml += "<Size>" + oGrdNewField.rows(i).cells(3).firstChild.value + "</Size>"
        StrXml += "<TmpFieldID>" + oGrdNewField.rows(i).getAttribute("TmpID") + "</TmpFieldID>"
        //StrXml += "<Intval>" + oGrdNewField.rows(i).rowIndex + 1 + "</Intval>"
        StrXml += "<Intval>" + (i + 1) + "</Intval>"


        if (oGrdNewField.rows(i).cells(4).firstChild.value != "")
            StrXml += "<DefaultValue>" + oGrdNewField.rows(i).cells(4).firstChild.value + "</DefaultValue>"

        if (oGrdNewField.rows(i).cells(5).firstChild.value != 0 && oGrdNewField.rows(i).cells(6).firstChild.value != "")
            StrXml += "<Condition>" + GenerateCondition(oGrdNewField.rows(i)) + "</Condition>"

        if (oGrdNewField.rows(i).cells(5).firstChild.value != 0 && oGrdNewField.rows(i).cells(6).firstChild.value != "")
            StrXml += "<ConditionOp>" + oGrdNewField.rows(i).cells(5).firstChild.value + "</ConditionOp>"

        if (oGrdNewField.rows(i).cells(5).firstChild.value != 0 && oGrdNewField.rows(i).cells(6).firstChild.value != "")
            StrXml += "<ConditionValue>" + oGrdNewField.rows(i).cells(6).firstChild.value + "</ConditionValue>"

        if (oGrdNewField.rows(i).cells(5).firstChild.value != 0 && oGrdNewField.rows(i).cells(7).firstChild.value != "")
            StrXml += "<ConditionValue2>" + oGrdNewField.rows(i).cells(7).firstChild.value + "</ConditionValue2>"
        //                if (oGrdNewField.rows(i).cells(9).firstChild.value != "")
        //                    StrXml += "<LinkURL>" + oGrdNewField.rows(i).cells(9).firstChild.value + "</LinkURL>"

        //                if (oGrdNewField.rows(i).cells(10).firstChild.value != "")
        //                    StrXml += "<UrlParam>" + oGrdNewField.rows(i).cells(10).firstChild.value + "</UrlParam>"

        //                if (oGrdNewField.rows(i).cells(11).firstChild.value != "")
        //                    StrXml += "<UrlParamVal>" + oGrdNewField.rows(i).cells(11).firstChild.value + "</UrlParamVal>"

        //                if (oGrdNewField.rows(i).cells(12).firstChild.value != "")
        //                    StrXml += "<UrlFeatur>" + oGrdNewField.rows(i).cells(12).firstChild.value + "</UrlFeatur>"

        if (oGrdNewField.rows(i).cells(8).firstChild.value != 0 && oGrdNewField.rows(i).cells(8).firstChild.value != "")
            StrXml += "<OperationFieldType>" + oGrdNewField.rows(i).cells(8).firstChild.value + "</OperationFieldType>"

        //*strStyle*************************************************************
        strStyle = ""
        if (oGrdNewField.rows(i).cells(9).firstChild.value != "")
            strStyle += " color:" + oGrdNewField.rows(i).cells(9).firstChild.value + ";"

        if (oGrdNewField.rows(i).cells(10).firstChild.value != "")
            strStyle += " background-color:" + oGrdNewField.rows(i).cells(10).firstChild.value + ";"

        if (oGrdNewField.rows(i).cells(15).firstChild.value != "")
            strStyle += " FONT-FAMILY:" + oGrdNewField.rows(i).cells(15).firstChild.value + ";"

        if (oGrdNewField.rows(i).cells(16).firstChild.value == 1)
            strStyle += " font-weight: bold;";

        if (oGrdNewField.rows(i).cells(17).firstChild.value == 1)
            strStyle += " text-decoration: underline;";

        if (strStyle != "")
            StrXml += "<Style>" + strStyle + "</Style>"
        //**************************************************************

        if (oGrdNewField.rows(i).cells(18).firstChild.value == 1)
            StrXml += "<Advanced>1</Advanced>"
        if (oGrdNewField.rows(i).cells(19).firstChild.value != 0 && oGrdNewField.rows(i).cells(19).firstChild.value != "")
            StrXml += "<Operation>" + oGrdNewField.rows(i).cells(19).firstChild.value + "</Operation>"
        //                else
        //                    StrXml += "<Advanced>0</Advanced>"

        if (oGrdNewField.rows(i).cells(20).firstChild.value != "")
            StrXml += "<CssClassName>" + oGrdNewField.rows(i).cells(20).firstChild.value + "</CssClassName>"

        if (oGrdNewField.rows(i).cells(21).firstChild.value != "-1" || oGrdNewField.rows(i).cells(21).firstChild.value != "-1")
            StrXml += "<CodeNature>" + oGrdNewField.rows(i).cells(21).firstChild.value + "</CodeNature>"

        if (oGrdNewField.rows(i).cells(22).firstChild.checked == "false" || oGrdNewField.rows(i).cells(22).firstChild.checked == false)
            StrXml += "<Attribute>1</Attribute>"
        else
            StrXml += "<Attribute>0</Attribute>"
        //------------------------------------------
        StrXml += GenerateUrL(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت لینک ها
        StrXml += GenerateGroup(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت گروه بندی
        StrXml += GenerateSort(oGrdNewField.rows(i).getAttribute("TmpID")); //فيلد هاي مربوط به ذخیره اطلاعا ت مرتب سازی
        //------------------------------------------
        StrXml += "<Viewable>1</Viewable></Field>"
    }
    StrXml += GenerateSortForNotSelectedField()
    StrXml += GenerateGroupForNotSelectedField()
    //------------------------------------------
    var oGrd = document.getElementById("GrdField")
    var len = oGrd.rows.length
    var caption = ''
    for (var i = 1; i < len; i++) {
        if (oGrd.rows(i).getAttribute("Caption").indexOf('*') != -1) {
            caption = oGrd.rows(i).getAttribute("Caption");
            if (StrXml.indexOf(caption.substring(0, caption.length - 1)) == -1) {
                alert('فیلدهای ستاره دار حتما انتخاب شوند')
                return;
            }
        }
    }
    //------------------------------------------
    if (FlagField == 1) {
        alert('لطفا اطلاعات گريد فيلد ها را تکمیل کنيد')
        return
    }
    //------------------------------------------
    GLen = oGrdNewParam.rows.length

    for (var i = 0; i < GLen; i++) {

        if (oGrdNewParam.rows(i).cells(0).firstChild.value == "" || oGrdNewParam.rows(i).cells(1).firstChild.value == ""
                || oGrdNewParam.rows(i).cells(1).firstChild.value == 0 || oGrdNewParam.rows(i).cells(2).firstChild.value == "") {
            FlagParm = 1
            break
        }
        StrXml += "<Param>"
        StrXml += "<Name>" + oGrdNewParam.rows(i).cells(0).firstChild.value + "</Name>"
        StrXml += "<TypeID>" + oGrdNewParam.rows(i).cells(1).firstChild.value + "</TypeID>"
        StrXml += "<Size>" + oGrdNewParam.rows(i).cells(2).firstChild.value + "</Size>"
        StrXml += "<TmpParamID>" + oGrdNewParam.rows(i).getAttribute("TmpID") + "</TmpParamID>"
        //                StrXml += "<Intval>" + oGrdNewParam.rows(i).rowIndex + 1 + "</Intval>"
        StrXml += "<Intval>" + (i + 1) + "</Intval>"

        if (oGrdNewParam.rows(i).cells(3).firstChild.value != "")
            StrXml += "<DefaultValue>" + oGrdNewParam.rows(i).cells(3).firstChild.value + "</DefaultValue>"

        if (oGrdNewParam.rows(i).cells(4).firstChild.value == 1)
            StrXml += "<Advanced>1</Advanced>"

        if (oGrdNewParam.rows(i).cells(5).firstChild.value == 1)
            StrXml += "<Editable>1</Editable>"
        //TODO:field jahate zakhireye LinkUrl
        //bayad meghdare cells(6) gerefte shavad va meghdare linkesh ba function bedast biad va zakhire beshe
        if (oGrdNewParam.rows(i).cells(6).firstChild.value != 0) {
            var linkurl = SetCmbPagesIndex("", oGrdNewParam.rows(i).cells(6).firstChild.value);
            StrXml += "<ReportId>" + oGrdNewParam.rows(i).cells(6).firstChild.value + "</ReportId>";
        }
        StrXml += "</Param>"

    }
    if (FlagParm == 1) {
        alert('لطفا اطلاعات گريد پارامترها را تکمیل کنيد')
        return
    }
    //-Option-----------------------------------------
    StrXml += "<Option>"
    if (document.getElementById(MasterObj + "chkPageNumber").checked == true)
        StrXml += "<PageNumber>1</PageNumber>"
    if (document.getElementById(MasterObj + "chkDate").checked == true)
        StrXml += "<CurrentDate>1</CurrentDate>"
    if (document.getElementById(MasterObj + "chkRptSubject").checked == true)
        StrXml += "<Header>" + document.getElementById(MasterObj + "txtRptSubject").value + "</Header>"

    if (document.getElementById(MasterObj + "ChkHeader").checked == true)
        StrXml += "<ShowFilter>1</ShowFilter>"

    if (document.getElementById(MasterObj + "ChkControl").checked == true)
        StrXml += "<setControl>1</setControl>"

    if (document.getElementById(MasterObj + "chkFilter").checked == true)
        StrXml += "<ShowAdvFilter>1</ShowAdvFilter>"

    if (document.getElementById(MasterObj + "SelSubSys").value != "" && document.getElementById(MasterObj + "SelSubSys").value != "0") {
        if (document.getElementById(MasterObj + "SelMenu").value == "" || document.getElementById(MasterObj + "SelMenu").value == "0") {
            alert("لطفا در تب تنظيمات یک زيرسيستم دارای منو را انتخاب کنيد");
            return
        }
        else{
            StrXml += "<ToSubSysID>" + document.getElementById(MasterObj + "SelSubSys").value + "</ToSubSysID>"
            StrXml += "<ToMenuItemID>" + document.getElementById(MasterObj + "SelMenu").value + "</ToMenuItemID>"
        }
    }

    StrXml += "</Option>"
    StrXml += "</Root>"

    document.getElementById(MasterObj + "txtXmlSave").value = StrXml
    document.getElementById(MasterObj + 'txtSubmit').value = "Save"

    document.getElementById(MasterObj + 'BtnSubmit2').click()

}
//*******************************************************************************
function GenerateGroupForNotSelectedField() {
    var oNewGrd = document.getElementById(nGrdNewGroup)
            , oGrd = document.getElementById(nGrdNewField)
            , GnLen = oNewGrd.rows.length
            , GLen = oGrd.rows.length
            , StrReturn = ''
            , i = 0, j = 0
            , Exists = 0
    for (i = 0; i < GnLen; i++) {
        for (j = 0; j < GLen; j++) {
            if (oNewGrd.rows(i).getAttribute("TmpID") == oGrd.rows(j).getAttribute("TmpID"))
                Exists = 1
        }
        if (Exists == 0) {
            StrReturn += "<Field>"
            StrReturn += "<TmpFieldID>" + oNewGrd.rows(i).getAttribute("TmpID") + "</TmpFieldID>"
            StrReturn += "<IsGroup>" + (oNewGrd.rows(i).rowIndex + 1) + "</IsGroup>"
            if (oNewGrd.rows(i).cells(1).firstChild.value != "")
                StrReturn += "<GroupSortOrder>" + oNewGrd.rows(i).cells(1).firstChild.value + "</GroupSortOrder>"
            else
                StrReturn += "<GroupSortOrder>A</GroupSortOrder>"

            //                    if (oNewGrd.rows(i).cells(2).firstChild.value != "" || oNewGrd.rows(i).cells(2).firstChild.value != 0)
            //                        StrReturn += "<FieldType>" + oNewGrd.rows(i).cells(2).firstChild.value + "</FieldType>"                        

            StrReturn += "<Viewable>0</Viewable></Field>"
        }
        Exists = 0
    }
    return StrReturn;
}
//*******************************************************************************
function GenerateSortForNotSelectedField() {
    var oNewGrd = document.getElementById(nGrdNewSort)
            , oGrd = document.getElementById(nGrdNewField)
            , GnLen = oNewGrd.rows.length
            , GLen = oGrd.rows.length
            , StrReturn = ''
            , i = 0, j = 0
            , Exists = 0
    for (i = 0; i < GnLen; i++) {
        for (j = 0; j < GLen; j++) {
            if (oNewGrd.rows(i).getAttribute("TmpID") == oGrd.rows(j).getAttribute("TmpID"))
                Exists = 1
        }
        if (Exists == 0) {
            StrReturn += "<Field>"
            StrReturn += "<TmpFieldID>" + oNewGrd.rows(i).getAttribute("TmpID") + "</TmpFieldID>"
            StrReturn += "<IsSort>" + (oNewGrd.rows(i).rowIndex + 1) + "</IsSort>"

            if (oNewGrd.rows(i).cells(1).firstChild.value != "")
                StrReturn += "<SortOrder>" + oNewGrd.rows(i).cells(1).firstChild.value + "</SortOrder>"
            else
                StrReturn += "<SortOrder>A</SortOrder>"

            if (oNewGrd.rows(i).cells(2).firstChild.value != "" || oNewGrd.rows(i).cells(2).firstChild.value != 0)
                StrReturn += "<FieldType>" + oNewGrd.rows(i).cells(2).firstChild.value + "</FieldType>"

            StrReturn += "<Viewable>0</Viewable></Field>"

        }
        Exists = 0
    }
    return StrReturn;
}
//*******************************************************************************
function GenerateUrL(TmpFieldID) {
    var oGrd = document.getElementById(nGrdNewLink)
            , GLen = oGrd.rows.length
            , StrReturn = '';
    for (var i = 0; i < GLen; i++) {
        if (oGrd.rows(i).getAttribute("TmpID") == TmpFieldID) {

            if (oGrd.rows(i).cells(1).firstChild.value != "")
                StrReturn += "<LinkURL>" + oGrd.rows(i).cells(1).firstChild.value + "</LinkURL>"

            if (oGrd.rows(i).cells(2).firstChild.value != "")
                StrReturn += "<UrlParam>" + oGrd.rows(i).cells(2).firstChild.value + "</UrlParam>"

            if (oGrd.rows(i).cells(3).firstChild.value != "")
                StrReturn += "<UrlParamVal>" + oGrd.rows(i).cells(3).firstChild.value + "</UrlParamVal>"

            if (oGrd.rows(i).cells(4).firstChild.value != "")
                StrReturn += "<UrlFeatur>" + oGrd.rows(i).cells(4).firstChild.value + "</UrlFeatur>"

            if (oGrd.rows(i).cells(5).firstChild.checked == true)
                StrReturn += "<Encryption>1</Encryption>"
            else
                StrReturn += "<Encryption>0</Encryption>"

        }
    }

    return StrReturn;
}
//*******************************************************************************
function GenerateGroup(TmpFieldID) {
    var oGrd = document.getElementById(nGrdNewGroup)
            , GLen = oGrd.rows.length
            , StrReturn = ''
    for (var i = 0; i < GLen; i++) {
        if (oGrd.rows(i).getAttribute("TmpID") == TmpFieldID) {
            StrReturn += "<IsGroup>" + (i + 1) + "</IsGroup>"
            if (oGrd.rows(i).cells(1).firstChild.value != "")
                StrReturn += "<GroupSortOrder>" + oGrd.rows(i).cells(1).firstChild.value + "</GroupSortOrder>"
            else
                StrReturn += "<GroupSortOrder>A</GroupSortOrder>"
        }
    }
    return StrReturn;
}
//*******************************************************************************
function GenerateSort(TmpFieldID) {
    var oGrd = document.getElementById(nGrdNewSort)
            , GLen = oGrd.rows.length
            , StrReturn = ''
            , rCount = 1
    for (var i = 0; i < GLen; i++) {
        if (oGrd.rows(i).getAttribute("TmpID") == TmpFieldID) {
            StrReturn += "<IsSort>" + (i + 1) + "</IsSort>"

            if (oGrd.rows(i).cells(1).firstChild.value != "")
                StrReturn += "<SortOrder>" + oGrd.rows(i).cells(1).firstChild.value + "</SortOrder>"
            else
                StrReturn += "<SortOrder>A</SortOrder>"

            if (oGrd.rows(i).cells(2).firstChild.value != "" || oGrd.rows(i).cells(2).firstChild.value != 0)
                StrReturn += "<FieldType>" + oGrd.rows(i).cells(2).firstChild.value + "</FieldType>"
        }
    }
    return StrReturn;
}
//*******************************************************************************
function CheckEmpty() {
    //--------------------Close Page Where Key has Problem-----------------------------------
    if (document.getElementById(MasterObj + "txtValue").value == "1"
            && document.getElementById(MasterObj + "txtKeyaError").value == "0" && document.getElementById(MasterObj + "txtValidate").value == "0") {
        alert($get(MasterObj + "txtAlert").value);
        document.getElementById(MasterObj + "txtKeyaError").value = "";
        document.getElementById(MasterObj + "txtValidate").value = "";
        return true
    }
    //----------------------------------------------------------------------------------------
    if (document.getElementById(MasterObj + "cmbReport").value == ""
            || document.getElementById(MasterObj + "cmbReport").value == 0) {
        alert('لطفا نام گزارش را انتخاب کنيد')
        return true
    }
    if (document.getElementById(MasterObj + "txtMenuName").value == ""
            || document.getElementById(MasterObj + "txtMenuName").value == 0) {
        alert('لطفا نام گزارش را وارد کنيد')
        document.getElementById(MasterObj + "txtMenuName").focus()
        return true
    }
    if (document.getElementById("GrdNewParam").rows.length == 0 && document.getElementById("GrdParam") != null) {
        alert('لطفا پارامترهاي مورد نظر را انتخاب کنيد')
        TabStrip1.selectTabById("Param");
        return true
    }
    if (document.getElementById("GrdNewField").rows.length == 0) {
        alert('لطفا فيلدهای مورد نظر را انتخاب کنيد')
        TabStrip1.selectTabById("Field");
        return true
    }
    return false
}
//*******************************************************************************
function OnChangeCmbReport(obj) {
    if (obj.value != "" && obj.value != 0) {
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(document.getElementById(MasterObj + "txtMenu").value);
        var xmlNodes = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetMenu[TemplateID=" + obj.value + "]");

        $get(MasterObj + "cmbMenu").innerHTML = ""
        var optionEl = document.createElement("OPTION")
        $get(MasterObj + "cmbMenu").options.add(optionEl)
        $get(MasterObj + "cmbMenu").all(0).innerText = 'انتخاب نشده'
        $get(MasterObj + "cmbMenu").all(0).value = '0'

        var len = xmlNodes.length
        for (var i = 0; i < len; i++) {
            optionEl = document.createElement("OPTION")
            $get(MasterObj + "cmbMenu").options.add(optionEl)
            $get(MasterObj + "cmbMenu").all(i + 1).innerText = xmlNodes.item(i).selectSingleNode('Title').text
            $get(MasterObj + "cmbMenu").all(i + 1).value = xmlNodes.item(i).selectSingleNode('Val').text

            //alert("title:" + xmlNodes.item(i).selectSingleNode('Title').text);
            //alert("val:" + xmlNodes.item(i).selectSingleNode('Val').text)
        }
        //selectedReport = obj.value;
        //CreateReportCombo(selectedReport);
    }
}
//*******************************************************************************
function OnClickBtnMoveItemField(Direction) {//Direction:-1 Up ___Direction:+1 Down
    if (GrdNewFieldLastSelectedRow != null && GrdNewFieldLastSelectedRow.rowIndex + Direction != -1) {

        var oGrdNewField = document.getElementById("GrdNewField")
        var tmpobj = new Object();
        var len = oGrdNewField.rows.length
        var idx = GrdNewFieldLastSelectedRow.rowIndex + Direction

        if (!oGrdNewField.rows(idx))
            return
        tmpobj.Caption = GrdNewFieldLastSelectedRow.cells(0).innerText
        tmpobj.CaptionT = GrdNewFieldLastSelectedRow.cells(0).title
        tmpobj.Name = GrdNewFieldLastSelectedRow.cells(1).firstChild.value
        tmpobj.DisplayTypeID = GrdNewFieldLastSelectedRow.cells(2).firstChild.value
        tmpobj.Size = GrdNewFieldLastSelectedRow.cells(3).firstChild.value
        tmpobj.DefaultValue = GrdNewFieldLastSelectedRow.cells(4).firstChild.value

        tmpobj.OP = GrdNewFieldLastSelectedRow.cells(5).firstChild.value
        tmpobj.V1 = GrdNewFieldLastSelectedRow.cells(6).firstChild.value
        tmpobj.V2 = GrdNewFieldLastSelectedRow.cells(7).firstChild.value
        tmpobj.OpFieldType = GrdNewFieldLastSelectedRow.cells(8).firstChild.value

        tmpobj.FColor = GrdNewFieldLastSelectedRow.cells(9).firstChild.value
        tmpobj.bColor = GrdNewFieldLastSelectedRow.cells(10).firstChild.value
        tmpobj.Link = GrdNewFieldLastSelectedRow.cells(11).firstChild.value

        tmpobj.LinkParam = GrdNewFieldLastSelectedRow.cells(12).firstChild.value
        tmpobj.LinkVal = GrdNewFieldLastSelectedRow.cells(13).firstChild.value
        tmpobj.LinkF = GrdNewFieldLastSelectedRow.cells(14).firstChild.value

        tmpobj.Font = GrdNewFieldLastSelectedRow.cells(15).firstChild.value
        tmpobj.Bold = GrdNewFieldLastSelectedRow.cells(16).firstChild.value
        tmpobj.UnderLine = GrdNewFieldLastSelectedRow.cells(17).firstChild.value
        tmpobj.Advanced = GrdNewFieldLastSelectedRow.cells(18).firstChild.value
        tmpobj.Operation = GrdNewFieldLastSelectedRow.cells(19).firstChild.value
        tmpobj.CssStyle = GrdNewFieldLastSelectedRow.cells(20).firstChild.value
        tmpobj.nature = GrdNewFieldLastSelectedRow.cells(21).firstChild.value
        tmpobj.att = GrdNewFieldLastSelectedRow.cells(22).firstChild.checked

        tmpobj.TmpID = GrdNewFieldLastSelectedRow.getAttribute("TmpID")
        tmpobj.Dis = GrdNewFieldLastSelectedRow.getAttribute("Dis")
        tmpobj.NameAtt = GrdNewFieldLastSelectedRow.getAttribute("Name")
        tmpobj.RealName = GrdNewFieldLastSelectedRow.getAttribute("RealName")

        GrdNewFieldLastSelectedRow.cells(0).innerText = oGrdNewField.rows(idx).cells(0).innerText
        GrdNewFieldLastSelectedRow.cells(0).title = oGrdNewField.rows(idx).cells(0).title
        GrdNewFieldLastSelectedRow.cells(1).firstChild.value = oGrdNewField.rows(idx).cells(1).firstChild.value
        GrdNewFieldLastSelectedRow.cells(2).firstChild.value = oGrdNewField.rows(idx).cells(2).firstChild.value
        GrdNewFieldLastSelectedRow.cells(3).firstChild.value = oGrdNewField.rows(idx).cells(3).firstChild.value
        GrdNewFieldLastSelectedRow.cells(4).firstChild.value = oGrdNewField.rows(idx).cells(4).firstChild.value
        GrdNewFieldLastSelectedRow.cells(5).firstChild.value = oGrdNewField.rows(idx).cells(5).firstChild.value
        GrdNewFieldLastSelectedRow.cells(6).firstChild.value = oGrdNewField.rows(idx).cells(6).firstChild.value
        GrdNewFieldLastSelectedRow.cells(7).firstChild.value = oGrdNewField.rows(idx).cells(7).firstChild.value
        GrdNewFieldLastSelectedRow.cells(8).firstChild.value = oGrdNewField.rows(idx).cells(8).firstChild.value
        GrdNewFieldLastSelectedRow.cells(9).firstChild.value = oGrdNewField.rows(idx).cells(9).firstChild.value
        GrdNewFieldLastSelectedRow.cells(10).firstChild.value = oGrdNewField.rows(idx).cells(10).firstChild.value

        GrdNewFieldLastSelectedRow.cells(11).firstChild.value = oGrdNewField.rows(idx).cells(11).firstChild.value
        GrdNewFieldLastSelectedRow.cells(12).firstChild.value = oGrdNewField.rows(idx).cells(12).firstChild.value
        GrdNewFieldLastSelectedRow.cells(13).firstChild.value = oGrdNewField.rows(idx).cells(13).firstChild.value
        GrdNewFieldLastSelectedRow.cells(14).firstChild.value = oGrdNewField.rows(idx).cells(14).firstChild.value

        GrdNewFieldLastSelectedRow.cells(15).firstChild.value = oGrdNewField.rows(idx).cells(15).firstChild.value
        GrdNewFieldLastSelectedRow.cells(16).firstChild.value = oGrdNewField.rows(idx).cells(16).firstChild.value
        GrdNewFieldLastSelectedRow.cells(17).firstChild.value = oGrdNewField.rows(idx).cells(17).firstChild.value
        GrdNewFieldLastSelectedRow.cells(18).firstChild.value = oGrdNewField.rows(idx).cells(18).firstChild.value
        GrdNewFieldLastSelectedRow.cells(19).firstChild.value = oGrdNewField.rows(idx).cells(19).firstChild.value
        GrdNewFieldLastSelectedRow.cells(20).firstChild.value = oGrdNewField.rows(idx).cells(20).firstChild.value
        GrdNewFieldLastSelectedRow.cells(21).firstChild.value = oGrdNewField.rows(idx).cells(21).firstChild.value
        GrdNewFieldLastSelectedRow.cells(22).firstChild.checked = oGrdNewField.rows(idx).cells(22).firstChild.checked

        GrdNewFieldLastSelectedRow.setAttribute("TmpID", oGrdNewField.rows(idx).getAttribute("TmpID"))
        GrdNewFieldLastSelectedRow.setAttribute("Dis", oGrdNewField.rows(idx).getAttribute("Dis"))
        GrdNewFieldLastSelectedRow.setAttribute("Name", oGrdNewField.rows(idx).getAttribute("Name"))
        GrdNewFieldLastSelectedRow.setAttribute("RealName", oGrdNewField.rows(idx).getAttribute("RealName"))

        if (oGrdNewField.rows(idx).getAttribute("Dis") == 1)
            DisabledRowObject(GrdNewFieldLastSelectedRow, false)
        else
            DisabledRowObject(GrdNewFieldLastSelectedRow, true)

        oGrdNewField.rows(idx).cells(0).innerText = tmpobj.Caption
        oGrdNewField.rows(idx).cells(0).title = tmpobj.CaptionT
        oGrdNewField.rows(idx).cells(1).firstChild.value = tmpobj.Name
        oGrdNewField.rows(idx).cells(2).firstChild.value = tmpobj.DisplayTypeID
        oGrdNewField.rows(idx).cells(3).firstChild.value = tmpobj.Size
        oGrdNewField.rows(idx).cells(4).firstChild.value = tmpobj.DefaultValue

        oGrdNewField.rows(idx).cells(5).firstChild.value = tmpobj.OP
        oGrdNewField.rows(idx).cells(6).firstChild.value = tmpobj.V1
        oGrdNewField.rows(idx).cells(7).firstChild.value = tmpobj.V2
        oGrdNewField.rows(idx).cells(8).firstChild.value = tmpobj.OpFieldType

        oGrdNewField.rows(idx).cells(9).firstChild.value = tmpobj.FColor
        oGrdNewField.rows(idx).cells(10).firstChild.value = tmpobj.bColor

        oGrdNewField.rows(idx).cells(11).firstChild.value = tmpobj.Link
        oGrdNewField.rows(idx).cells(12).firstChild.value = tmpobj.LinkParam
        oGrdNewField.rows(idx).cells(13).firstChild.value = tmpobj.LinkVal
        oGrdNewField.rows(idx).cells(14).firstChild.value = tmpobj.LinkF

        oGrdNewField.rows(idx).cells(15).firstChild.value = tmpobj.Font
        oGrdNewField.rows(idx).cells(16).firstChild.value = tmpobj.Bold
        oGrdNewField.rows(idx).cells(17).firstChild.value = tmpobj.UnderLine
        oGrdNewField.rows(idx).cells(18).firstChild.value = tmpobj.Advanced
        oGrdNewField.rows(idx).cells(19).firstChild.value = tmpobj.Operation
        oGrdNewField.rows(idx).cells(20).firstChild.value = tmpobj.CssStyle
        oGrdNewField.rows(idx).cells(21).firstChild.value = tmpobj.nature
        oGrdNewField.rows(idx).cells(22).firstChild.checked = tmpobj.att

        oGrdNewField.rows(idx).setAttribute("TmpID", tmpobj.TmpID)
        oGrdNewField.rows(idx).setAttribute("Dis", tmpobj.Dis)
        oGrdNewField.rows(idx).setAttribute("Name", tmpobj.NameAtt)
        oGrdNewField.rows(idx).setAttribute("RealName", tmpobj.RealName)

        if (tmpobj.Dis == 1)
            DisabledRowObject(oGrdNewField.rows(idx), false)
        else
            DisabledRowObject(oGrdNewField.rows(idx), true)

        GrdNewFieldLastSelectedRow.className = GrdNewFieldLastSelectedRowClass;
        GrdNewFieldLastSelectedRowClass = oGrdNewField.rows(idx).className;
        GrdNewFieldLastSelectedRow = oGrdNewField.rows(idx);
        oGrdNewField.rows(idx).className = "CssSelectedItemStyle";

    }
}
//*******************************************************************************
function OnClickBtnMoveItemGroup(Direction) {//Direction:-1 Up ___Direction:+1 Down
    if (GrdNewGroupLastSelectedRow != null && GrdNewGroupLastSelectedRow.rowIndex + Direction != -1) {

        var oGrd = document.getElementById("GrdNewGroup")
        var tmpobj = new Object();
        var len = oGrd.rows.length
        var idx = GrdNewGroupLastSelectedRow.rowIndex + Direction

        if (!oGrd.rows(idx))
            return

        tmpobj.Name = GrdNewGroupLastSelectedRow.cells(0).firstChild.innerText
        tmpobj.tt = GrdNewGroupLastSelectedRow.cells(0).title
        tmpobj.SortOrder = GrdNewGroupLastSelectedRow.cells(1).firstChild.value
        tmpobj.TmpID = GrdNewGroupLastSelectedRow.getAttribute("TmpID")

        GrdNewGroupLastSelectedRow.cells(0).title = oGrd.rows(idx).cells(0).title
        GrdNewGroupLastSelectedRow.cells(0).firstChild.innerText = oGrd.rows(idx).cells(0).firstChild.innerText
        GrdNewGroupLastSelectedRow.cells(1).firstChild.value = oGrd.rows(idx).cells(1).firstChild.value
        GrdNewGroupLastSelectedRow.setAttribute("TmpID", oGrd.rows(idx).getAttribute("TmpID"))

        oGrd.rows(idx).cells(0).title = tmpobj.tt
        oGrd.rows(idx).cells(0).firstChild.innerText = tmpobj.Name
        oGrd.rows(idx).cells(1).firstChild.value = tmpobj.SortOrder
        oGrd.rows(idx).setAttribute("TmpID", tmpobj.TmpID)

        GrdNewGroupLastSelectedRow.className = GrdNewGroupLastSelectedRowClass;
        GrdNewGroupLastSelectedRowClass = oGrd.rows(idx).className;
        GrdNewGroupLastSelectedRow = oGrd.rows(idx);
        oGrd.rows(idx).className = "CssSelectedItemStyle";

    }
}
//*******************************************************************************
function OnClickBtnMoveItemSort(Direction) {//Direction:-1 Up ___Direction:+1 Down
    if (GrdNewSortLastSelectedRow != null && GrdNewSortLastSelectedRow.rowIndex + Direction != -1) {

        var oGrd = document.getElementById("GrdNewSort")
        var tmpobj = new Object();
        var len = oGrd.rows.length
        var idx = GrdNewSortLastSelectedRow.rowIndex + Direction

        if (!oGrd.rows(idx))
            return

        tmpobj.Name = GrdNewSortLastSelectedRow.cells(0).firstChild.innerText
        tmpobj.tt = GrdNewSortLastSelectedRow.cells(0).title
        tmpobj.SortOrder = GrdNewSortLastSelectedRow.cells(1).firstChild.value
        tmpobj.FieldType = GrdNewSortLastSelectedRow.cells(2).firstChild.value
        tmpobj.TmpID = GrdNewSortLastSelectedRow.getAttribute("TmpID")

        GrdNewSortLastSelectedRow.cells(0).title = oGrd.rows(idx).cells(0).title
        GrdNewSortLastSelectedRow.cells(0).firstChild.innerText = oGrd.rows(idx).cells(0).firstChild.innerText
        GrdNewSortLastSelectedRow.cells(1).firstChild.value = oGrd.rows(idx).cells(1).firstChild.value
        GrdNewSortLastSelectedRow.cells(2).firstChild.value = oGrd.rows(idx).cells(2).firstChild.value
        GrdNewSortLastSelectedRow.setAttribute("TmpID", oGrd.rows(idx).getAttribute("TmpID"))

        oGrd.rows(idx).cells(0).title = tmpobj.tt
        oGrd.rows(idx).cells(0).firstChild.innerText = tmpobj.Name
        oGrd.rows(idx).cells(1).firstChild.value = tmpobj.SortOrder
        oGrd.rows(idx).cells(2).firstChild.value = tmpobj.FieldType
        oGrd.rows(idx).setAttribute("TmpID", tmpobj.TmpID)

        GrdNewSortLastSelectedRow.className = GrdNewSortLastSelectedRowClass;
        GrdNewSortLastSelectedRowClass = oGrd.rows(idx).className;
        GrdNewSortLastSelectedRow = oGrd.rows(idx);
        oGrd.rows(idx).className = "CssSelectedItemStyle";

    }
}
//*******************************************************************************
function OnClickBtnFilter() {
    if (document.getElementById(MasterObj + "cmbReport").value != "" && document.getElementById(MasterObj + "cmbReport").value != 0) {

        ClearGrd(nGrdNewParam)
        ClearGrd(nGrdNewField)
        ClearGrd("GrdPageParam")
        ClearGrd(nGrdNewLink)
        ClearGrd(nGrdNewGroup)
        ClearGrd(nGrdNewSort)

        document.getElementById(MasterObj + "txtMenuName").value = ""
        document.getElementById(MasterObj + 'txtReportID').value = 0

        document.getElementById(MasterObj + "txtTemplateID").value = document.getElementById(MasterObj + "cmbReport").value
        var oCmbMenu = document.getElementById(MasterObj + "cmbMenu")
        if (oCmbMenu.value != 0) {
            document.getElementById(MasterObj + 'txtMenuName').value = oCmbMenu.options[oCmbMenu.selectedIndex].text
            document.getElementById(MasterObj + 'txtReportID').value = oCmbMenu.value
        }
        document.getElementById(MasterObj + "txtPicPatch").value = ""
        document.getElementById(MasterObj + "TdImg").src = "../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
        document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
        document.getElementById(MasterObj + 'BtnSubmit').click()
    }
}
//*******************************************************************************

function LoadData() {
    //document.getElementById(MasterObj + "TdImg").src = "~/App_Utility/Images/ModifyPersonImage/userpic.jpg"
    if (document.getElementById(MasterObj + "txtPicPatch").value != "") {
        document.getElementById(MasterObj + 'chkLogo').checked = true
        document.getElementById(MasterObj + "TdImg").src = document.getElementById(MasterObj + "txtPicPatch").value;
    }
    if (document.getElementById(MasterObj + "txtXmlField").value == "")
        return

    LoadGrdNewField()
    LoadGrdNewParam()
    LoadOptionTab()
    LoadLinkTab()
    LoadGroupTab()
    LoadSortTab()
}
//*******************************************************************************
function LoadSortTab() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetSort");
    var len = XmlNode.length
    for (var i = 0; i < len; i++)
        AddRow_GrdNewSort(
                                    XmlNode.item(i).selectSingleNode("TmpFieldID").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("SortOrder").text
                                    , XmlNode.item(i).selectSingleNode("FieldType").text
                                    )
}
//*******************************************************************************
function LoadGroupTab() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetGroup");
    var len = XmlNode.length
    for (var i = 0; i < len; i++)
        AddRow_GrdNewGroup(
                                    XmlNode.item(i).selectSingleNode("TmpFieldID").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("GroupSortOrder").text
                                    , 0// XmlNode.item(i).selectSingleNode("FieldType").text
                                    )
}
//*******************************************************************************
function LoadLinkTab() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetLink");
    var len = XmlNode.length
    for (var i = 0; i < len; i++)
        AddRow_GrdNewLink(XmlNode.item(i).selectSingleNode("TmpFieldID").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("LinkURL").text
                                    , XmlNode.item(i).selectSingleNode("UrlParam").text
                                    , XmlNode.item(i).selectSingleNode("UrlParamVal").text
                                    , XmlNode.item(i).selectSingleNode("UrlFeatur").text
                                    , XmlNode.item(i).selectSingleNode("Encrypt").text
                                    , XmlNode.item(i).selectSingleNode("Disabled").text
                                    )
}
//
//*******************************************************************************
function LoadOptionTab() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetOption");
    var len = XmlNode.length
    if (len > 0) {
        if (XmlNode.item(0).selectSingleNode("CurrentDate").text == "true" || XmlNode.item(0).selectSingleNode("CurrentDate").text == 1)
            document.getElementById(MasterObj + 'chkDate').checked = true
        else
            document.getElementById(MasterObj + 'chkDate').checked = false

        if (XmlNode.item(0).selectSingleNode("PageNumber").text == "true" || XmlNode.item(0).selectSingleNode("PageNumber").text == 1)
            document.getElementById(MasterObj + 'chkPageNumber').checked = true
        else
            document.getElementById(MasterObj + 'chkPageNumber').checked = false

        if (XmlNode.item(0).selectSingleNode("ShowFilter").text == "true" || XmlNode.item(0).selectSingleNode("ShowFilter").text == 1)
            document.getElementById(MasterObj + 'ChkHeader').checked = true
        else
            document.getElementById(MasterObj + 'ChkHeader').checked = false

        if (XmlNode.item(0).selectSingleNode("setControl").text == "true" || XmlNode.item(0).selectSingleNode("setControl").text == 1)
            document.getElementById(MasterObj + 'ChkControl').checked = true
        else
            document.getElementById(MasterObj + 'ChkControl').checked = false

        if (XmlNode.item(0).selectSingleNode("ShowAdvFilterInPage").text == "true" || XmlNode.item(0).selectSingleNode("ShowAdvFilterInPage").text == 1)
            document.getElementById(MasterObj + 'chkFilter').checked = true
        else
            document.getElementById(MasterObj + 'chkFilter').checked = false

        if (XmlNode.item(0).selectSingleNode("Header").text != "")
            document.getElementById(MasterObj + 'chkRptSubject').checked = true
        else
            document.getElementById(MasterObj + 'chkRptSubject').checked = false


        if (XmlNode.item(0).selectSingleNode("MenuItemID").text != "")
            document.getElementById(MasterObj + 'txtSelectedValue').value = XmlNode.item(0).selectSingleNode("MenuItemID").text

        document.getElementById(MasterObj + 'txtRptSubject').value = XmlNode.item(0).selectSingleNode("Header").text

        if (XmlNode.item(0).selectSingleNode("SubsysID").text != "") {
            document.getElementById(MasterObj + 'SelSubSys').value = XmlNode.item(0).selectSingleNode("SubsysID").text
            OnChangeSubSys(document.getElementById(MasterObj + 'SelSubSys')) //AJAX!!!!!!!!!!!
        }


    }
}
//*******************************************************************************
function LoadGrdNewField() {
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlField").value);

    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetTmpFieldNew");
    var arr, arrValue, j = 0;
    var Color = '', Bgcolor = '', FontFamily = '', Bold = 0, underLine = 0;
    var len = XmlNode.length
    for (var i = 0; i < len; i++) {
        arr = (XmlNode.item(i).selectSingleNode("StyleString").text).split(';')
        j = 0, Color = '', Bgcolor = '', FontFamily = '', Bold = 0, underLine = 0;
        for (; j < arr.length; j++) {

            arrValue = arr[j].split(':')
            switch (arrValue[0].trim()) {
                case "color":
                    Color = arrValue[1]
                    break;
                case "background-color":
                    Bgcolor = arrValue[1]
                    break;
                case "FONT-FAMILY":
                    FontFamily = arrValue[1]
                    break;
                case "font-weight":
                    Bold = 1
                    break;
                case "text-decoration":
                    underLine = 1
            }
        }
        //color:, background-color:, FONT-FAMILY:, font-weight: bold; text-decoration: underline;
        AddRow_GrdNewField(XmlNode.item(i).selectSingleNode("TmpFieldID").text
                                    , XmlNode.item(i).selectSingleNode("DefaultValue").text
                                    , XmlNode.item(i).selectSingleNode("Name").text
                                    , XmlNode.item(i).selectSingleNode("Size").text
                                    , XmlNode.item(i).selectSingleNode("TypeID").text
                                    , XmlNode.item(i).selectSingleNode("DisplayTypeID").text
                                    , Color
                                    , Bgcolor
                                    , XmlNode.item(i).selectSingleNode("LinkURL").text
                                    , XmlNode.item(i).selectSingleNode("UrlParam").text
                                    , XmlNode.item(i).selectSingleNode("UrlParamVal").text
                                    , XmlNode.item(i).selectSingleNode("UrlFeatur").text
                                    , FontFamily
                                    , Bold
                                    , underLine
                                    , XmlNode.item(i).selectSingleNode("Disabled").text
                                    , XmlNode.item(i).selectSingleNode("Condition").text
                                    , XmlNode.item(i).selectSingleNode("Advanced").text
                                    , XmlNode.item(i).selectSingleNode("PreviousName").text
                                    , XmlNode.item(i).selectSingleNode("RealName").text

                                    , XmlNode.item(i).selectSingleNode("Operation").text
                                    , XmlNode.item(i).selectSingleNode("CssClassName").text
                                    , XmlNode.item(i).selectSingleNode("OperationFieldType").text
                                    , XmlNode.item(i).selectSingleNode("Attribute").text
                                    , XmlNode.item(i).selectSingleNode("CodeNature").text

                                    )
        //-----------------------------------

        AddRow_GrdLink(XmlNode.item(i).selectSingleNode("TmpFieldID").text
                                    , XmlNode.item(i).selectSingleNode("PreviousName").text
                                    , XmlNode.item(i).selectSingleNode("DisplayTypeID").text
                                    , XmlNode.item(i).selectSingleNode("Size").text
                                    , XmlNode.item(i).selectSingleNode("LinkURL").text
                                    , XmlNode.item(i).selectSingleNode("UrlParam").text
                                    , XmlNode.item(i).selectSingleNode("UrlParamVal").text
                                    , XmlNode.item(i).selectSingleNode("UrlFeatur").text
                                    , XmlNode.item(i).selectSingleNode("Disabled").text
                                    )
    }
}
//*******************************************************************************
function LoadGrdNewParam() {
    if (document.getElementById(MasterObj + "txtXmlParam").value == "")
        return
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlParam").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetTmpParam");
    var len = XmlNode.length
    var Advanced = 0, Editable = 0
    for (var i = 0; i < len; i++) {
        Advanced = 0, Editable = 0

        if (XmlNode.item(i).selectSingleNode("Advanced").text == "true" || XmlNode.item(i).selectSingleNode("Advanced").text == true || XmlNode.item(i).selectSingleNode("Advanced").text == 1)
            Advanced = 1
        if (XmlNode.item(i).selectSingleNode("Editable").text == true || XmlNode.item(i).selectSingleNode("Editable").text == "true" || XmlNode.item(i).selectSingleNode("Editable").text == 1)
            Editable = 1
        AddRow_GrdNewParam(XmlNode.item(i).selectSingleNode("TmpParameterID").text,
            XmlNode.item(i).selectSingleNode("DefaultValue").text,
            XmlNode.item(i).selectSingleNode("Name").text,
            XmlNode.item(i).selectSingleNode("Size").text,
            XmlNode.item(i).selectSingleNode("TypeID").text,
            XmlNode.item(i).selectSingleNode("DisplayTypeID").text,
            Advanced,
            Editable,
            XmlNode.item(i).selectSingleNode("Disabled").text,
            XmlNode.item(i).selectSingleNode("RptControlID").text
        );
    }
}
//*******************************************************************************
function OnClickBtnProperties() {
    document.getElementById(MasterObj + "txtTemplateID").value = document.getElementById(MasterObj + "cmbReport").value
    var URL = "Template.aspx?ToPersonId=" + document.getElementById(MasterObj + 'txtOnLineUser').value
            + "&SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value
            + "&TemplateID=" + document.getElementById(MasterObj + "txtTemplateID").value
    window.open(URL, "_self");
}
//*******************************************************************************
var RunState = 0
function OnClickBtnRun() {
    if (document.getElementById(MasterObj + 'txtSavedMenuItemID').value != "") {
        var URL = "ReportShow.aspx?ToPersonId=" + document.getElementById(MasterObj + 'txtOnLineUser').value
            + "&SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value
            + "&MenuItemID=" + document.getElementById(MasterObj + 'txtSavedMenuItemID').value
        window.open(URL, "_self");
    }
    else {
        if (confirm('آيا مايل به ذخيره تغييرات ميباشيد؟')) {
            RunState = 1
            OnClickBtnSave();
        }
    }
}
//*******************************************************************************
function OnClickBtnUpload() {
    var url = "../BaseInfo/Person/SelectPic.aspx?PersonCode=&ToPersonID=" + document.getElementById(MasterObj + "txtOnLineUser").value;
    // + "&PersonID=" + PrsID; //document.getElementById(MasterObj + "txtPersonID").value
    var StrFeatur = "dialogHeight: 200px;dialogWidth: 400px;center: Yes;help: no;status: no"
    var rv = window.showModalDialog(url, window, StrFeatur)

    var strPath = ""
    var PicPathLen = 0;

    if (rv != "" && rv != undefined) {

        document.getElementById(MasterObj + "txtPicPath").value = rv
        document.getElementById(MasterObj + "TDImg").src = rv
        PicPathLen = document.getElementById(MasterObj + "txtPicPath").value.length;
        document.getElementById(MasterObj + "txtPicFormat").value =
                document.getElementById(MasterObj + "txtPicPath").value.substr(PicPathLen - 3, 3)
    }
}
//*******************************************************************************
function OnChangeCmbPages() {
    document.getElementById(MasterObj + 'txtSubmit').value = "OnChangeCmbPages"
    document.getElementById(MasterObj + 'BtnSubmit3').click()
}
//*******************************************************************************
function LoadGrdPageParam() {
    var oSel = document.getElementById(MasterObj + 'SelParamOfPage')
    ClearGrd("GrdPageParam")
    var RowType, Param, ParamVal, arrParam, arrParamVal, arrVal;
    if (oSel.length > 0)
        RowType = 1 // منو ساخته شده با گزارش ساز
    else
        RowType = 0 // منو از همان صفحات قبلي

    Param = oSelectedLinkRow.cells(2).firstChild.value//MenuItemID@OnLineUser@ToPersonId@SessionID@DateFrom
    ParamVal = oSelectedLinkRow.cells(3).firstChild.value//2;11167@3;5@3;5@3;4@4;2
    //---------------------------

    arrParam = Param.split('@')
    arrParamVal = ParamVal.split('@')
    //--------------------------
    var len = arrParam.length, i = 4
    var Htm1 = ParValCmb()
    var Htm2 = CreateCodeForParameter()

    if (i < len && Param != "" && ParamVal != "")
        for (; i < len; i++) {
            arrVal = arrParamVal[i].split(';')
            AddRow_GrdPageParam(RowType, arrParam[i], arrVal[1], arrVal[0], Htm1, Htm2)
        }
    else {
        AddRow_GrdPageParam(RowType, "", "", 0, Htm1, Htm2)
    }


}
//*******************************************************************************
function AddRow_GrdPageParam(RowType, Param, ParamVal, ParamType, Htm1, Htm2) {
    var oGrdPageParam = document.getElementById("GrdPageParam")
    oGrdPageParam.insertRow();

    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()
    oGrdPageParam.rows(GrdPageParamRowIdx).insertCell()

    oGrdPageParam.rows(GrdPageParamRowIdx).className = "CssItemStyle"

    if (RowType == 1) {//از نوع کمبو
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).innerHTML = CreateComboFromCombo('SelParamOfPage')
    }
    else {
        oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).innerHTML = "<INPUT type='text' class='txtControls'  style='WIDTH:100px' />"
    }

    oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).innerHTML = "<INPUT type='text' class='txtControls'  style='WIDTH:60px' />"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).innerHTML = Htm1// ParValCmb()
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(3).innerHTML = Htm2//CreateCodeForParameter()
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(4).innerHTML = "<IMG src='../../App_Utility/Images/Icons/NewIcon.gif' Style='cursor:pointer' onclick='OnClickBtnAdd(this," + RowType + ")'>"

    if (RowType == 1 && Param == "")//از نوع کمبو
        Param = 0
    if (ParamVal == "")//از نوع کمبو
        ParamVal = 0

    oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).firstChild.value = Param
    switch (ParamType) {
        case "2":
            oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).firstChild.value = ParamVal
            break;
            //                case "4": 
            //                    //oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).firstChild.value = ParamVal 
            //                    oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).firstChild.value = SetComboIndex(ParamVal, oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).firstChild) 
            //                    break; 
        case "5":
            oGrdPageParam.rows(GrdPageParamRowIdx).cells(3).firstChild.value = ParamVal
            break;
        default:
            oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).firstChild.value = SetComboIndex(ParamVal, oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).firstChild)
            break;
    }

    if (GrdPageParamRowIdx > 0)
        oGrdPageParam.rows(GrdPageParamRowIdx - 1).cells(4).style.display = "none"

    oGrdPageParam.rows(GrdPageParamRowIdx).cells(3).focus()
    oGrdPageParam.rows(GrdPageParamRowIdx).align = "center"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(0).style.width = "100px"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(1).style.width = "60px"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(2).style.width = "110px"
    oGrdPageParam.rows(GrdPageParamRowIdx).cells(3).style.width = "130px"

    GrdPageParamRowIdx++;
}
//*******************************************************************************
function OnClickBtnAdd(obj, RowType) {
    obj.style.display = "none"
    AddRow_GrdPageParam(RowType, "", "", 0, ParValCmb(), CreateCodeForParameter())
}
//*******************************************************************************
function CreateComboFromCombo(objName) {
    var strHtml = "<select class='txtControls' style='width:100px'> "
    strHtml += "<option value='0'>انتخاب نشده</option>"
    var oSel = document.getElementById(MasterObj + objName)
    var len = oSel.length
    for (var i = 0; i < len; i++) {
        strHtml += "<option value='" + oSel.options(i).value + "'>"
        strHtml += oSel.options(i).text
        strHtml += "</option>"
    }
    strHtml += "</select>"
    return strHtml;
}
//*******************************************************************************
function SetComboIndex(title, comboObj) {
    if (title == "")
        return 0;
    var oCmbSp = comboObj //document.getElementById(MasterObj + comboName)
    var len = oCmbSp.length
    for (var i = 0; i < len; i++) {
        if (oCmbSp.options[i].text == title)
            return oCmbSp.options[i].value;
    }
    return 0;
}
//*******************************************************************************
function EnabledLink() {
    var oGrdNewField = document.getElementById("GrdNewField")
    var len = oGrdNewField.rows.length
    if (document.getElementById(MasterObj + "txtReportID").value != "" || document.getElementById(MasterObj + "txtReportID").value != 0)
        for (var i = 0; i < len; i++) {
            oGrdNewField.rows(i).cells(11).firstChild.disabled = false
            oGrdNewField.rows(i).cells(12).firstChild.disabled = false
            oGrdNewField.rows(i).cells(13).firstChild.disabled = false
            oGrdNewField.rows(i).cells(14).firstChild.disabled = false
        }
}
//*******************************************************************************
function SearchFieldName(oValue) {
    var oGrd = document.getElementById("GrdField")
    var len = oGrd.rows.length
    oValue = ReplaceAll(oValue, 'ک', 'ك')
    oValue = ReplaceAll(oValue, 'ي', 'ي')
    oValue = ReplaceAll(oValue, 'ی', 'ي')
    oValue = ReplaceAll(oValue, ' ', '')
    var caption = ''
    for (var i = 1; i < len; i++) {
        caption = oGrd.rows(i).getAttribute("Caption")
        caption = ReplaceAll(caption, ' ', '')
        if (getCntChar(oValue.toLowerCase(), caption.toLowerCase()) > 0) {
            if (LastSelectedRowGrdField != null) {
                LastSelectedRowGrdField.className = LastSelectedRowClassGrdField;
            }
            LastSelectedRowClassGrdField = oGrd.rows(i).className
            LastSelectedRowGrdField = oGrd.rows(i)
            oGrd.rows(i).className = "CssSelectedItemStyle"
            oGrd.rows(i).cells(0).focus()
            return
        }
        else {
            if (LastSelectedRowGrdField != null)
                LastSelectedRowGrdField.className = LastSelectedRowClassGrdField;
        }
    }
    if (oValue == "")
        if (LastSelectedRowGrdField != null)
            LastSelectedRowGrdField.className = LastSelectedRowClassGrdField;

}
//*******************************************************************************    
function OnKeypressTxtSearch(oValue) {
    if (window.event.keyCode == 13) {
        SearchFieldName(oValue)
    }
}
//*******************************************************************************
function OnClickImgSearchName() {
    SearchFieldName(document.getElementById("txtSearch").value)
}
//*******************************************************************************
function OnClickBtnReplace() {
    if (LastSelectedRowGrdField != null && GrdNewFieldLastSelectedRow != null) {
        var oGrdField = document.getElementById("GrdField")
                , oGrdNewField = document.getElementById("GrdNewField"), LastTmpID = 0, NewTmpID = 0, NewName = ''
                , strName = ""
        if (!oGrdField || !oGrdNewField) //If No Row
            return

        if (oGrdNewField.rows.length > 0 && !CheckExists("GrdNewField", LastSelectedRowGrdField.getAttribute("ID")))//If Add Befor
            return

        LastTmpID = GrdNewFieldLastSelectedRow.getAttribute("TmpID")
        NewTmpID = LastSelectedRowGrdField.getAttribute("ID")
        NewName = LastSelectedRowGrdField.getAttribute("Name")
        if (!confirm(' آيا مايل به جايگزيني ' + GrdNewFieldLastSelectedRow.cells(0).innerText
                + ' با ' + NewName + ' مي باشيد؟ '))
            return

        GrdNewFieldLastSelectedRow.setAttribute("TmpID", NewTmpID)
        GrdNewFieldLastSelectedRow.setAttribute("Dis", LastSelectedRowGrdField.getAttribute("Editable"))
        GrdNewFieldLastSelectedRow.setAttribute("Name", NewName)

        if (NewName.length > 33)
            strName = NewName.substr(0, 30) + "..."
        else
            strName = NewName

        GrdNewFieldLastSelectedRow.cells(0).innerText = strName
        GrdNewFieldLastSelectedRow.cells(0).title = NewName
        GrdNewFieldLastSelectedRow.cells(1).firstChild.value = NewName

        if (LastSelectedRowGrdField.getAttribute("Editable") == 1)
            DisabledRowObject(GrdNewFieldLastSelectedRow, false)
        else
            DisabledRowObject(GrdNewFieldLastSelectedRow, true)

        //                AddRow_GrdLink(NewTmpID
        //                                    , NewName
        //                                    , LastSelectedRowGrdField.getAttribute("DisplayTypeID")
        //                                    , LastSelectedRowGrdField.getAttribute("Size")
        //                                    , LastSelectedRowGrdField.getAttribute("LinkUrl")
        //                                    , LastSelectedRowGrdField.getAttribute("UrlParam")
        //                                    , LastSelectedRowGrdField.getAttribute("UrlParamVal")
        //                                    , LastSelectedRowGrdField.getAttribute("UrlFeatur")
        //                                    , LastSelectedRowGrdField.getAttribute("Editable")
        //                                    )
        var oGrdNewLink = document.getElementById("GrdNewLink"), GNewLinkIdx = 0, L = oGrdNewLink.rows.length;
        for (var i = 0; i < L; i++)
            if (oGrdNewLink.rows(i).getAttribute("TmpID") == LastTmpID) {
                oGrdNewLink.rows(i).setAttribute("TmpID", NewTmpID)
                oGrdNewLink.rows(i).cells(0).innerText = strName
                oGrdNewLink.rows(i).cells(0).title = NewName
                GNewLinkIdx = i;
                break;
            }
        //اگر گزارش کدی باشد باید کد مربوطه در مقادیر لینک ها هم جایگزین شود
        UpdateLinkParamVal(i, FindCode(NewName))
    }
}
//*******************************************************************************
function UpdateLinkParamVal(idx, CodeID) {
    var oGrdNewLink = document.getElementById("GrdNewLink")
    if (!oGrdNewLink || !oGrdNewLink.rows(idx))
        return
    var ParaVal = oGrdNewLink.rows(idx).cells(3).firstChild.value
    var lastIndex = ParaVal.lastIndexOf('@5;')
    if (lastIndex > 0) {
        var StrParam = ParaVal.substr(lastIndex + 3, ParaVal.lenght)
        var i = 0
        var OldCodeID = ""
        while (1) {//يافتن کد در رشته
            if (StrParam.substr(i, 1) != '@') {
                OldCodeID += StrParam.substr(i, 1)
                i++;
            }
            else
                break;
        }
        ParaVal = ReplaceAll(ParaVal, OldCodeID, CodeID)
        oGrdNewLink.rows(idx).cells(3).firstChild.value = ParaVal
    }
}
//*******************************************************************************
function FindCode(CodeName) {
    if (document.getElementById(MasterObj + "txtXmlAllCode").value == "")
        return
    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    oXmlDoc.async = "false";
    oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlAllCode").value);
    var XmlNode = oXmlDoc.documentElement.selectNodes("/FormGeneratorEntity/GetAllCodeForParameter[CodeName='" + CodeName + "']");
    if (XmlNode.length > 0) {
        return XmlNode.item(0).selectSingleNode("CodeID").text
    }
    return 0;
}
//*******************************************************************************
function OnClickBtnEMail() {

    var strUrl = "ReportPolicy.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&CompanyID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value
                                + "&ReportID=" + document.getElementById(MasterObj + 'txtReportID').value
                                + "&TemplateID=" + document.getElementById(MasterObj + 'txtTemplateID').value

    //    alert(strUrl)
    window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 770px;dialogWidth:850px;center: Yes;help: no;status: no')

}
function OnChangeSubSys(obj) {
    document.getElementById(MasterObj + 'txtSubmit').value = "OnChangeSubSys"
    //    alert(document.getElementById(MasterObj + 'txtSubmit').value)
    document.getElementById(MasterObj + 'BtnSubmit4').click()
}