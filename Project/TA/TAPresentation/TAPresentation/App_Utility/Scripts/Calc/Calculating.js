var LastSelectedRow = null
var LastSelectedRowClass = "";
var PageSize = 10;
var OSelectedMamber = "";
var SaveXml = "<Root></Root>";
var XMLNames = "<Root><G></G><P></P><D></D><T></T></Root>"
var SDate, EDate;
var CurPage, lblTotal, Totalpage, lblFrom, lblTo


$(document).ready(function () {
    $("#ImgProgress").hide();   
    $("#RadioPrs").attr("checked", "checked")
});
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function OnClickBtnNext() {
    if (parseInt($("#OToolBar_txtCurPage").val()) < parseInt($("#OToolBar_txtTotalPage").val()))
        CreateGrid("Next")
}
//*******************************************************************************
function OnClickBtnPrv() {
    if (parseInt($("#OToolBar_txtCurPage").val()) > 1)
        CreateGrid("Previous")
}
//*******************************************************************************
function OnBlurtxtCurPage() {
    $("#OToolBar_txtCurPage").val($("#OToolBar_txtCurPage").val().replace(" ", ""));

    var TotalPage = parseInt($("#OToolBar_txtTotalPage").val());
    if ($("#OToolBar_txtCurPage").val() != "" &&
                    $("#OToolBar_txtCurPage").val() != "0") {
        if (parseInt($("#OToolBar_txtCurPage").val()) <= parseInt(TotalPage)) {
            CurPage = $("#OToolBar_txtCurPage").val();
        }
        CreateGrid("Const")
    }
}
//*******************************************************************************
function OnClickBtnLast() {
    CreateGrid("Last")
}
//*******************************************************************************
function OnClickBtnFirst() {
    CreateGrid("First")
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//***********************************گرید********************************************
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//*******************************************************************************
function ClearRowGrid() {
    var oGrid = $("#XTabTable");
    while ($(oGrid).find("tr").length > 0) {
        $(oGrid).find("tr:last").remove();
    }
}
//*******************************************************************************
function CreateGrid(direction) {
    ClearRowGrid()

    if (XMLNames != "<Root><G></G><P></P><D></D><T></T></Root>") {

        var oXmlDoc; if (window.ActiveXObject) {
            oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(XMLNames)
        } else {
            var parser = new DOMParser(); oXmlDoc = parser.parseFromString(XMLNames, 'text/xml');
        }

        var xmlNodesG = oXmlDoc.selectNodes("/Root/G/All")
        var xmlNodesD = oXmlDoc.selectNodes("/Root/D/All")
        var xmlNodesT = oXmlDoc.selectNodes("/Root/T/All")
        var xmlNodesP = oXmlDoc.selectNodes("/Root/P/All")

        var PNum, GNum, DNum, TNum
        PNum = xmlNodesP.length;
        DNum = xmlNodesD.length;
        TNum = xmlNodesT.length;
        GNum = xmlNodesG.length;

        lblTotal = PNum + GNum + DNum + TNum;

        //================================Paging
        var totalRecords
        totalRecords = lblTotal;
        Totalpage = Math.ceil(totalRecords / PageSize);

        if (totalRecords > 0) {
            currentPage_X = parseInt((CurPage == "" ? "1" : CurPage))

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
                    currentPage_X = parseInt(Totalpage)
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
            CurPage = currentPage_X;
            lblFrom = ((currentPage_X - 1) * PageSize) + 1;
            lblTo = endFor + 1;
            //====================================================


            var oXmlSaveDocTemp; if (window.ActiveXObject) {
                oXmlSaveDocTemp = new ActiveXObject("Microsoft.XMLDOM")
                oXmlSaveDocTemp.async = "false";
                oXmlSaveDocTemp.loadXML(SaveXml)
            } else { var parser = new DOMParser(); oXmlSaveDocTemp = parser.parseFromString(SaveXml, 'text/xml'); }
            var Temp;


            var i = (currentPage_X - 1) * PageSize
            for (; i <= endFor; i++) {
                if (i < PNum) {
                    Temp = oXmlSaveDocTemp.selectNodes("/Root/P[ID=" + $($(xmlNodesP)[i]).find("ID").text() + "]").length > 0 ? 1 : 0;
                    var Param = "" + $($(xmlNodesP)[i]).find("ID").text() + "," + $($(xmlNodesP)[i]).find("N").text() + ",";
                    AddToGrid("ID", $($(xmlNodesP)[i]).find("ID").text(), "Name", $($(xmlNodesP)[i]).find("N").text(), "Type", "P", Param, Temp)

                }
                else if (i < PNum + GNum) {
                    Temp = oXmlSaveDocTemp.selectNodes("/Root/G[ID=" + $($(xmlNodesG)[i - PNum]).find("ID").text() + "]").length > 0 ? 1 : 0;
                    var Param = "" + $($(xmlNodesG)[i - PNum]).find("ID").text() + "," + $($(xmlNodesG)[i - PNum]).find("N").text() + ",";
                    AddToGrid("ID", $($(xmlNodesG)[i - PNum]).find("ID").text(), "Name", $($(xmlNodesG)[i - PNum]).find("N").text(), "Type", "G", Param, Temp)

                }
                else if (i < PNum + GNum + DNum) {
                    Temp = oXmlSaveDocTemp.selectNodes("/Root/D[ID=" + $($(xmlNodesD)[i - PNum - GNum]).find("ID").text() + "]").length > 0 ? 1 : 0;
                    var Param = "" + $($(xmlNodesD)[i - PNum - GNum]).find("ID").text() + "," + $($(xmlNodesD)[i - PNum - GNum]).find("N").text() + ",";
                    AddToGrid("ID", $($(xmlNodesD)[i - PNum - GNum]).find("ID").text(), "Name", $($(xmlNodesD)[i - PNum - GNum]).find("N").text(), "Type", "D", Param, Temp)

                }
                else {
                    Temp = oXmlSaveDocTemp.selectNodes("/Root/T[ID=" + $($(xmlNodesT)[i - PNum - GNum - DNum]).find("ID").text() + "]").length > 0 ? 1 : 0;
                    var Param = "" + $($(xmlNodesT)[i - PNum - GNum - DNum]).find("ID").text() + "," + $($(xmlNodesT)[i - PNum - GNum - DNum]).find("N").text() + ",";
                    AddToGrid("ID", $($(xmlNodesT)[i - PNum - GNum - DNum]).find("ID").text(), "Name", $($(xmlNodesT)[i - PNum - GNum - DNum]).find("N").text(), "Type", "T", Param, Temp)
                }
            }
            $("#chkAll").attr("checked", ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "P") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "G") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "D") && ISCheckAll(oXmlDoc, oXmlSaveDocTemp, "T"));
        }
        else {
            //====================================================
            CurPage = "0";
            lblFrom = "0";
            lblTo = "0";
            Totalpage = "0";
            lblTotal = "0";
            //====================================================
        }
    }
    SetPagingInfo();
}
//*******************************************************************************
function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, Param, CheckState) {
    $("#XTabTable").append("<tr " + AttrName1 + "=" + AttrValue1 + " " + AttrName2 + "=" + AttrValue2 + " " + AttrName3 + "=" + AttrValue3 + " ></tr>");
    var oRow = $("#XTabTable").find("tr:last");

    if (($("#XTabTable").find("tr").length - 1) % 2 == 0)
        $(oRow).addClass("CssItemStyle");
    else
        $(oRow).addClass("CssAlternatingItemStyle");

    var x = 0;
    var p = new String;
    var val = "";
    var val1 = CheckState;
    while (x < getCntChar(",", Param)) {
        val = getArray(Param, x, ",")

        switch (x) {
            case 0:
                $(oRow).html("<td class='XTabTable' style='width:25px;' align='center'><INPUT type='checkbox' onclick='OnClickChk(this,-1)' " + ((val1 == 1) ? " checked >" : ">") + "</td>");
                break;

            case 1:
                var tempSrc = "";
                var picTitle = "";
                switch (AttrValue3) {
                    case "P":
                        tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                        picTitle = "پرسنل"
                        break
                    case "G":
                        tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                        picTitle = "گروه"
                        break
                    case "D":
                        tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                        picTitle = "واحدسازماني"
                        break
                    case "T":
                        tempSrc = "../../App_Utility/Images/Icons/Group.gif"
                        picTitle = "دفاتر تابل"
                        break
                }
                $(oRow).html($(oRow).html() + "<td class='XTabTable' style='width:40px' align='right'><IMG src=" + tempSrc + " title=" + picTitle + "  border='0'></td><td style='width:300px;' align='center' title='" + val + "'>" + ((val.length > 30) ? val.substring(0, 25) + "..." : val) + "</td>");

                break;
        }
        x = x + 1;
    }
}
//*******************************************************************************
function SetPagingInfo() {
    $("#OToolBar_txtFromData").val(lblFrom);
    $("#OToolBar_txtToData").val(lblTo);
    $("#OToolBar_txtTotalData").val(lblTotal);
    $("#OToolBar_txtCurPage").val(CurPage);
    $("#OToolBar_txtTotalPage").val(Totalpage);

    if ($("#OToolBar_txtCurPage").val() == "" | $("#OToolBar_txtCurPage").val() == "0")
        $("#OToolBar_BtnPrv").attr("disabled", true)
    else
        $("#OToolBar_BtnPrv").attr("disabled", false);

    if (parseInt($("#OToolBar_txtCurPage").val()) == parseInt($("#OToolBar_txtTotalPage").val()))
        $("#OToolBar_BtnNext").attr("disabled", true)
    else
        $("#OToolBar_BtnNext").attr("disabled", false);
}
//*******************************************************************************
function OnClickChk(obj) {
    var SelectedRowID
    var SelectedRowType
    SelectedRowID = $(obj).parent(0).parent(0).attr("ID");
    SelectedRowType = $(obj).parent(0).parent(0).attr("Type");
   
    var xmlDoc; if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //اصلی
        xmlDoc.async = "false";
        xmlDoc.loadXML(XMLNames);
    } else { var parser = new DOMParser(); xmlDoc = parser.parseFromString(XMLNames, 'text/xml'); }

    var oXmlSaveDoc; if (window.ActiveXObject) {
        oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//انتخاب شده ها
        oXmlSaveDoc.async = "false";
        oXmlSaveDoc.loadXML(SaveXml)
    } else { var parser = new DOMParser(); oXmlSaveDoc = parser.parseFromString(SaveXml, 'text/xml'); }

    var OXmlNode = oXmlSaveDoc.selectNodes("/Root/" + SelectedRowType + "[ID=" + SelectedRowID + "]");

    if ($(obj).attr("checked") == true & OXmlNode.length == 0) {
        var oXmlSaveDocTemp; if (window.ActiveXObject) {
            oXmlSaveDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlSaveDocTemp.async = "false";
            oXmlSaveDocTemp.loadXML("<Root><" + SelectedRowType + "><ID>" + SelectedRowID + "</ID></" + SelectedRowType + "></Root>")
            
        } else {
            var parser = new DOMParser(); oXmlSaveDocTemp = parser.parseFromString("<Root><" + SelectedRowType + "><ID>" + SelectedRowID + "</ID></" + SelectedRowType + "></Root>", 'text/xml');
        }
        var OXmlNodeTemp = oXmlSaveDocTemp.selectNodes("/Root/" + SelectedRowType)
        oXmlSaveDoc.childNodes[0].appendChild(OXmlNodeTemp.item(0));
        $("#chkAll").attr("checked", ISCheckAll(xmlDoc, oXmlSaveDoc, "P") && ISCheckAll(xmlDoc, oXmlSaveDoc, "G") && ISCheckAll(xmlDoc, oXmlSaveDoc, "D") && ISCheckAll(xmlDoc, oXmlSaveDoc, "T"));
    }
    else if (!($(obj).attr("checked")) & OXmlNode.length != 0) {
        var f = oXmlSaveDoc.documentElement.removeChild(OXmlNode.item(0))
        $("#chkAll").attr("checked", false);
    }
    SaveXml = oXmlSaveDoc.xml;
   
}
//*****************************************End Grid**************************************
//=========================================ToolBar=============================
function OnClickBtnCalc() {
    if (CheckDate()) {
        if (!$("#RdoFromPerson").attr("checked")) {
            if (SaveXml == "" || SaveXml == "<Root/>" || SaveXml == "<Root></Root>") {
                alert("لطفا ابتدا اعضا را انتخاب نماييد")
                return
            }
            else {
                $("#ImgProgress").show();
                $.ajax({
                    type: "POST",
                    url: "Calculating.aspx/Calc?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SDate:'" + SDate + "' ,EDate:'" + EDate + "' ,XmlSelected:'" + SaveXml + "'}",
                    success: function (Data) {
                        SaveXml = "<Root></Root>";
                        alert(Data.d);
                        CreateGrid("First")
                        $("#ImgProgress").hide();                  
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert(jqXHR.responseText);
                        $("#ImgProgress").hide(); 
                    }
                });
            }
        }
        else {
            if ($("#txtFromPerson").val() == "") {
                alert("لطفا از پرسنل را وارد کنيد")
                $("#txtFromPerson").select();
                $("#txtFromPerson").focus();
                return
            }

            else if ($("#txtToPerson").val() == "") {
                alert("لطفا تا پرسنل را وارد کنيد")
                $("#txtToPerson").select();
                $("#txtToPerson").focus();
                return
            }
            else {
                $("#ImgProgress").show();
                $.ajax({
                    type: "POST",
                    url: "Calculating.aspx/CalcPerson?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    data: "{SPID:" + $("#txtFromPerson").val() + ",SDate:'" + SDate + "' ,EDate:'" + EDate + "' ,EPID:" + $("#txtToPerson").val() + "}",
                    success: function (Data) {
                        alert(Data.d);
                        $("#ImgProgress").hide();                      
                       
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert(jqXHR.responseText);
                        $("#ImgProgress").hide();
                    }
                });
            }
        }
    }
}
//*******************************************************************************
function OnclickSelectAllChk(obj) {
    var oGrid = XTabTable;
    var xmlDoc; if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(XMLNames);
    } else { var parser = new DOMParser(); xmlDoc = parser.parseFromString(XMLNames, 'text/xml'); }

    SaveXml = "<Root></Root>";

    var oXmlSaveDoc; if (window.ActiveXObject) {
        oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlSaveDoc.async = "false";
        oXmlSaveDoc.loadXML(SaveXml);
    } else { var parser = new DOMParser(); oXmlSaveDoc = parser.parseFromString(SaveXml, 'text/xml'); }

    var Glen = $(oGrid).find("tr").length

    for (var j = 0; j < Glen; j++) {
        $(oGrid).find("tr:eq(" + j + ")").find("td:eq(0)").find("input[type='checkbox']").attr("checked", ($(obj).attr("checked") ? true : false));
    }
    if ($(obj).attr("checked")) {
        oXmlSaveDoc = SetChecked(xmlDoc, "P", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "G", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "D", oXmlSaveDoc);
        oXmlSaveDoc = SetChecked(xmlDoc, "T", oXmlSaveDoc);
        SaveXml = oXmlSaveDoc.xml;
    }
}
//=========================================================================
function SetChecked(xmlDoc, Type, xmlSaveDoc) {
    var xmlNodesTemp = xmlDoc.selectNodes("/Root/" + Type + "/All");

    for (var i = 0; i < xmlNodesTemp.length; i++) {
        var oXmlDocTemp2; if (window.ActiveXObject) {
            oXmlDocTemp2 = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp2.async = "false";
            oXmlDocTemp2.loadXML("<Root><" + Type + "><ID>" + $($(xmlNodesTemp)[i]).find("ID").text() + "</ID></" + Type + "></Root>")
        } else { var parser = new DOMParser(); oXmlDocTemp2 = parser.parseFromString("<Root><" + Type + "><ID>" + $($(xmlNodesTemp[i]).find("ID").text() + "</ID></" + Type + "></Root>"), 'text/xml'); }
        var xmlNodesTemp2 = oXmlDocTemp2.selectNodes("/Root/" + Type);
        xmlSaveDoc.childNodes[0].appendChild(xmlNodesTemp2.item(0));
    }
    return xmlSaveDoc
}
//=========================================================================
function ModifyXML(Type) {
    // دفاتر تابل :T , واحد سازمانی  :D گروه:G  پرسنل:P             
    var oXmlDoc; if (window.ActiveXObject) {
        oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")//xml اصلی
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(XMLNames);
    } else { var parser = new DOMParser(); oXmlDoc = parser.parseFromString(XMLNames, 'text/xml'); }
    var xmlNodes;
    //--------------------------------------
    if (Type == "D")
        OSelectedMamber = OSelectedMamber.substr(3, OSelectedMamber.length - 3);
    var oXmlDocTemp; if (window.ActiveXObject) {
        oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")//xml انتخاب شده
        oXmlDocTemp.async = "false";
        oXmlDocTemp.loadXML(OSelectedMamber)
    } else { var parser = new DOMParser(); oXmlDocTemp = parser.parseFromString(OSelectedMamber, 'text/xml'); }
    var xmlNodesTemp = oXmlDocTemp.selectNodes("/Root/Tb")
    //--------------------------------------
    var oXmlSaveDoc;
    if (window.ActiveXObject) {
        oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//تیک خورده ها 
        oXmlSaveDoc.async = "false";
        oXmlSaveDoc.loadXML(SaveXml);
    } else { var parser = new DOMParser(); oXmlSaveDoc = parser.parseFromString(SaveXml, 'text/xml'); }
    var OXmlNodeSave = oXmlSaveDoc.selectNodes("/Root/" + Type);

    //---------------------------------------
    if (xmlNodesTemp.length > 0) {
        for (var i = 0; i < xmlNodesTemp.length; i++) {
            var MemberID, MemberName;
            switch (Type) {
                case "P":
                    MemberID = $($(xmlNodesTemp)[i]).find("PID").text();
                    MemberName = $($(xmlNodesTemp)[i]).find("PName").text();
                    break
                case "G":
                    MemberID = $($(xmlNodesTemp)[i]).find("GroupId").text();
                    MemberName = $($(xmlNodesTemp)[i]).find("GroupName").text();
                    break

                case "D":
                    MemberID = $($(xmlNodesTemp)[i]).find("DID").text();
                    MemberName = $($(xmlNodesTemp)[i]).find("DName").text();
                    break

                case "T":
                    MemberID = $($(xmlNodesTemp)[i]).find("TID").text();
                    MemberName = $($(xmlNodesTemp)[i]).find("TName").text();
                    break
            }
            var xmlRepeateNodes = oXmlDoc.selectNodes(Type + "/All[ID= " + MemberID + "]");
            if (xmlRepeateNodes.length == 0) {

                var oXmlDocTemp1; if (window.ActiveXObject) {
                    oXmlDocTemp1 = new ActiveXObject("Microsoft.XMLDOM")
                    oXmlDocTemp1.async = "false";
                    oXmlDocTemp1.loadXML("<Root><" + Type + "><All><ID>" + MemberID + "</ID><N>" + MemberName + "</N></All></" + Type + "></Root>")
                } else { var parser = new DOMParser(); oXmlDocTemp1 = parser.parseFromString("<Root><" + Type + "><All><ID>" + MemberID + "</ID><N>" + MemberName + "</N></All></" + Type + "></Root>", 'text/xml'); }
                var xmlNodesTemp1 = oXmlDocTemp1.selectNodes("/Root/" + Type + "/All");
                xmlNodes = oXmlDoc.selectNodes("/Root/" + Type);
                xmlNodes.item(0).appendChild(xmlNodesTemp1.item(0));

                var oXmlDocTemp2; if (window.ActiveXObject) {
                    oXmlDocTemp2 = new ActiveXObject("Microsoft.XMLDOM")
                    oXmlDocTemp2.async = "false";
                    oXmlDocTemp2.loadXML("<Root><" + Type + "><ID>" + MemberID + "</ID></" + Type + "></Root>")
                } else { var parser = new DOMParser(); oXmlDocTemp2 = parser.parseFromString("<Root><" + Type + "><ID>" + MemberID + "</ID></" + Type + "></Root>", 'text/xml'); }
                var xmlNodesTemp2 = oXmlDocTemp2.selectNodes("/Root/" + Type);
                oXmlSaveDoc.childNodes[0].appendChild(xmlNodesTemp2.item(0));

            }
        }
    }
    XMLNames = oXmlDoc.xml;
    SaveXml = oXmlSaveDoc.xml;
}
//*******************************************************************************
function OnClickBtnShowCalcMemebr() {

    var strOptions = ""
    var url
    var OUserFlag

    if ($("#RadioPrs").attr("checked")) {
        OUserFlag = "P"
        url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check"
        strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
    }
    else if ($("#RadioGR").attr("checked")) {

        OUserFlag = "G"
        url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check"
        strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if ($("#RadioTab").attr("checked")) {
        OUserFlag = "T"
        url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?Type=Check"
        strOptions = "dialogHeight: 600px;dialogWidth: 600px;center: Yes;help: no;status: no"
    }
    else if ($("#RadioDep").attr("checked")) {

        OUserFlag = "D"
        url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
        strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
    }

    //-------------------------------------------------------
    if (url != "") {
        OSelectedMamber = "";
        OSelectedMamber = window.showModalDialog(url, "", strOptions)
        url = ""
    }
    if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
        if ($($("#XTabTable")).find("tr").length > 0) {
            if (confirm("پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟"))
                XMLNames = "<Root><G></G><P></P><D></D><T></T></Root>";
        }
        //----------------------------------------------------------       
        ModifyXML(OUserFlag);
        if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
            CreateGrid("First");
        }
    }
}
//*******************************************************************************
function CheckDate() {
    SDate = $("#" + MasterObj + "KcalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KcalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KcalSDate_txtDay").val();
    EDate = $("#" + MasterObj + "KcalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KcalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KcalEDate_txtDay").val();

    if ($("#" + MasterObj + "KcalSDate_txtYear").val() == "" || $("#" + MasterObj + "KcalSDate_txtMonth").val() == "" || $("#" + MasterObj + "KcalSDate_txtDay").val() == "") {
        alert("فرمت تاریخ شروع درست نمی باشد.")
        return false;
    }
    else if ($("#" + MasterObj + "KcalEDate_txtYear").val() == "" || $("#" + MasterObj + "KcalEDate_txtMonth").val() == "" || $("#" + MasterObj + "KcalEDate_txtDay").val() == "") {
        alert("فرمت تاریخ خاتمه درست نمی باشد.")
        return false;
    }
    else if (SDate > EDate) {
        alert("تاریخ شروع باید از تاریخ خاتمه کوچکتر باشد.")
        return false;
    }
    return true;
}
//*******************************************************************************

function ISCheckAll(xmlDoc, oXmlSaveDoc, Type) {
    var flag = true;
    var i = 0;
    var xmlNodesTemp = xmlDoc.selectNodes("/Root/" + Type + "/All");
    while (flag && i < xmlNodesTemp.length) {
        var xmlNodesTemp2 = oXmlSaveDoc.selectNodes(Type + "[ID=" + $($(xmlNodesTemp)[i]).find("ID").text() + "]");
        flag = xmlNodesTemp2.length > 0 ? true : false;
        i++;
    }
    return flag
}
//*******************************************************************************
function OnClickBtnCalcAll() {
    var url = "/TA/TAPeresentation/Pages/Calc/FinalCalc.aspx";
    window.showModalDialog(url, window, "dialogHeight:350px;dialogWidth:550px;center: Yes;help: no;status: no")
}
//===============================================================================
