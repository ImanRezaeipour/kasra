var rValue;
var MasterObj = "ctl00_ContentPlaceHolder1_";
document.getElementsByTagName("body")[0].scroll = "no";
var LastSelectedRow = null;
var isUpdate = false;
var LastSelectedRowClass = "";
var Ogrid = document.getElementById("GrdBaseInfo");
if (Ogrid != null) {
    for (var i = 1; i < Ogrid.rows.length; ++i) {
        if (Ogrid.rows[i].Kind == 1)
            Ogrid.rows[i].style.display = "none";
        else
            Ogrid.rows[i].style.display = "inline";
    }
}
//======================================================
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

//=============================================
//var str = $get(MasterObj + "txtXmlDesc").value
//alert(str)
//        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
//        oXmlDoc.loadXML(str);
//        var XmlNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ItemCode");
//        alert(XmlNode);
//        if ($get(MasterObj + "txtID").value != "0") {

//            //            if (XmlNode.length != 0) {
//            if (XmlNode.item(0).selectSingleNode("system").text.toString() == "true")
//                $get(MasterObj + "txtSystem").value = "1";
//            else
//                $get(MasterObj + "txtSystem").value = "0";

//            alert($get(MasterObj + "txtSystem").value)
//        }

//=============================================

function BeginRequestHandler(sender, args) {

}
//============================================================
function EndRequestHandler(sender, args) {

    if ($get(MasterObj + "txtAlert").value != "") {
        SetMsg($get(MasterObj + "txtAlert").value);
        $get(MasterObj + "txtAlert").value = "";
    }
    $get(MasterObj + "txtSubmit").value = "";
    var Ogrid = document.getElementById("GrdBaseInfo");
    if (Ogrid != null) {
        for (var i = 1; i < Ogrid.rows.length; ++i) {
            if (Ogrid.rows[i].Kind == 1)
                Ogrid.rows[i].style.display = "none";
            else
                Ogrid.rows[i].style.display = "inline";
        }
    }
    rValue = "";
    LastSelectedRow = null
}
//============================================================
function OnClickCell0(obj) {
    var Ogrid = document.getElementById("GrdBaseInfo");
    var SelectedRow = obj.parentElement;
    if (SelectedRow.Kind == 0) {
        var CategoryGroupID = SelectedRow.CategoryGroupID;

        var Url = document.getElementById("Url").href;
        if (SelectedRow.cells[0].firstChild.src == Url)
            SelectedRow.cells[0].firstChild.src = "../../App_Utility/Images/Icons/btnNodes.gif";
        else
            SelectedRow.cells[0].firstChild.src = Url;
        for (var i = 1; i < Ogrid.rows.length; ++i) {


            if (Ogrid.rows[i].CategoryGroupID == CategoryGroupID && Ogrid.rows[i].Kind == 1) {
                if (Ogrid.rows[i].style.display == "none")
                    Ogrid.rows[i].style.display = "inline";
                else
                    Ogrid.rows[i].style.display = "none";
            }
        }
    }
}
//============================================================
function OnClickGrd(SelectedRow) {

    isUpdate = false;
    var Ogrid = document.getElementById("GrdBaseInfo");
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";

}
//============================================================
function OndbClickGrd() {
   var sys = (LastSelectedRow.getAttribute("system"));
   if (sys == "True") {
       alert("قابلیت ویرایش وجود ندارد ")
       window.close();
   }
   else if (LastSelectedRow.Kind == 1) {
       isUpdate = true;
       $get(MasterObj + "txtIntVal2").value = LastSelectedRow.cells[3].firstChild.innerText;
       $get(MasterObj + "txtTitle").value = LastSelectedRow.cells[2].firstChild.innerText;
   }
   else {

       var strUrl = "BasicInformationList.aspx?ID=" + LastSelectedRow.getAttribute("ID") + "&SystemID=" + document.getElementById(MasterObj + "txtSystemID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
       rValue = window.showModalDialog(encodeURI(strUrl), "", "dialogWidth=600px;dialogHeight=175px;status:no;");
       if (rValue == "1")
           OnClickBtnFilter()
   }
}
//============================================================
function OnClickBtnNew() {
    isUpdate = false;
    $get(MasterObj + "txtIntVal2").value = "";
    $get(MasterObj + "txtTitle").value = "";
}
//============================================================
function OnClickBtnGroupNew() {
    var url = "BasicInformationList.aspx?ID=0&SystemID=" + document.getElementById(MasterObj + "txtSystemID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
    rValue = window.showModalDialog(encodeURI(url), "", "dialogWidth=600px;dialogHeight=175px;status:no;");
    if (rValue == "1") {
       // alert(rValue)
        OnClickBtnFilter();
    }
}
//============================================================
function OnClickBtnDel() {
    if (LastSelectedRow != null) {

        if (LastSelectedRow.Kind == 0) {
            var Msg = "آیا برای حذف مطمئن هستید ؟"
            if (confirm(Msg) == true) {
                document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID")
                document.getElementById(MasterObj + "txtCategoryID").value = LastSelectedRow.getAttribute("CategoryGroupID")
                document.getElementById(MasterObj + "txtSubmit").value = "DeleteFromBasic"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
            //            else {
            ////                alert("به منظور حذف یک سطر را انتخاب کنید")
            //            }
        }
        else if (LastSelectedRow.Kind == 1) {
            if (confirm("آیا مطمئن هستید؟") == true) {
                document.getElementById(MasterObj + "txtDLookupID").value = LastSelectedRow.getAttribute("ID");
                document.getElementById(MasterObj + "txtSubmit").value = "DeleteDLookup";
                document.getElementById(MasterObj + "btnSubmit").click();
            }
        }
    }
    else {
        alert("به منظور حذف یک سطر را انتخاب کنید")
    }
}

//============================================================
function OnClickBtnSave() {
    var Ogrid = document.getElementById("GrdBaseInfo");
    if (LastSelectedRow == null) {
        alert("ابتدا يک سطر را انتخاب کنيد");
        return;
    }
    if ($get(MasterObj + "txtTitle").value == "") {
        alert("لطفا عنوان را وارد نماييد");
        $get(MasterObj + "txtTitle").focus();
        return;
    }
    if ($get(MasterObj + "txtIntVal2").value == "") {
        alert("لطفا اولويت را وارد نمایید");
        $get(MasterObj + "txtIntVal2").focus();
        return;
    }
    else {
        if (LastSelectedRow != null) {
            if (LastSelectedRow.cells[3].firstChild.innerText == '') {
                for (var i = 1; i < Ogrid.rows.length; ++i) {
                    if (Ogrid.rows[i].CategoryGroupID == LastSelectedRow.CategoryGroupID && Ogrid.rows[i].Kind == 1) {
                        if ($get(MasterObj + "txtIntVal2").value == Ogrid.rows[i].cells[3].firstChild.innerText) {
                            alert("شماره اولویت تکراری است");
                            return;
                        }
                    }
                }
            }
            else {
                for (var i = 1; i < Ogrid.rows.length; ++i) {
                    if (Ogrid.rows[i].CategoryGroupID == LastSelectedRow.CategoryGroupID && Ogrid.rows[i].Kind == 1 && Ogrid.rows[i] != LastSelectedRow) {
                        if ($get(MasterObj + "txtIntVal2").value == Ogrid.rows[i].cells[3].firstChild.innerText) {
                            alert("شماره اولویت تکراری است");
                            return;
                        }
                    }
                }
            }

            var str = "<root>";
            str = str + "<tb>";
            str = str + "<IsUpdate>";
            str = str + isUpdate;
            str = str + "</IsUpdate>";
            str = str + "<GrpID>";
            str = str + LastSelectedRow.CategoryGroupID;
            str = str + "</GrpID>";
            str = str + "<Title>";
            str = str + $get(MasterObj + "txtTitle").value;
            str = str + "</Title>";
            str = str + "<IntVal>";
            str = str + $get(MasterObj + "txtIntVal2").value;
            str = str + "</IntVal>";
            str = str + "<ID>";
            str = str + LastSelectedRow.getAttribute("ID");
            str = str + "</ID>";
            str = str + "<SystemID>";
            str = str + $get(MasterObj + "txtSystemID").value; 
            str = str + "</SystemID>";
            str = str + "</tb>";
            str = str + "</root>";
            document.getElementById(MasterObj + "txtXML").value = str;
//            alert(str)

            document.getElementById(MasterObj + "txtSubmit").value = "save";
            document.getElementById(MasterObj + "btnSubmit").click();
            OnClickBtnNew();
        }
    }

}

//================================================================
function OnClickBtnEdit() {
    var Identity = ""
    
      if (LastSelectedRow == null)
        alert("به منظور ويرايش یک سطر را انتخاب کنید")

      else {
          var sys = (LastSelectedRow.getAttribute("system"));
             if (sys == "True") {
              alert("قابلیت ویرایش وجود ندارد ")
              window.close();
              }

             else if (LastSelectedRow != null) {
                  if (LastSelectedRow.cells(1).firstChild.title == "" && LastSelectedRow.getAttribute("ID") != 0) {
                  OndbClickGrd();
                  //Identity = LastSelectedRow.cells(1).firstChild.innerText
                  }
                 else {
                   var strUrl = "BasicInformationList.aspx?ID=" + LastSelectedRow.getAttribute("ID") + "&SystemID=" + document.getElementById(MasterObj + "txtSystemID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                   //alert(strUrl)
                   rValue = window.showModalDialog(encodeURI(strUrl), "", "dialogWidth=600px;dialogHeight=175px;status:no;");
                   if (rValue == "1")
                    OnClickBtnFilter();
            }
        }
    }
}
//=============================================================
function OnClickBtnFilter() {
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "btnSubmit").click();
}
//=============================================================
function OnClickBtnShowAll() {
    $get(MasterObj + "CmbCategory").value = "0"
    OnClickBtnFilter()
}