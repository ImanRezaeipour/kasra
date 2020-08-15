var LastSelectedRow = "";
var LastSelectedRowClass = "";
document.getElementsByTagName("body")[0].scroll = "no";
//==================================PageLoad====================================================
$("#ctl00_ContentPlaceHolder1_CmbGroups").hide()
$("#ctl00_ContentPlaceHolder1_MultiPerson_TBMain").show("slow");
$("#ctl00_ContentPlaceHolder1_CmbDepartment_TBMain").hide()
$("#RDPerson").click();
//============================================================================= 
$(document).ready(function () {
    $("#RDGroup").click(function () {
        var CheckVal = $('[name="RDFilter"]:checked').val()
        if (CheckVal == 1) {

            $("#ctl00_ContentPlaceHolder1_MultiPerson_TBMain").hide()
            $("#ctl00_ContentPlaceHolder1_CmbDepartment_TBMain").hide()
            $("#ctl00_ContentPlaceHolder1_CmbGroups").show("slow")
        }
    })
    $("#RDPerson").click(function () {
        var CheckVal = $('[name="RDFilter"]:checked').val()
        if (CheckVal == 0) {
            $("#ctl00_ContentPlaceHolder1_CmbGroups").hide()
            $("#ctl00_ContentPlaceHolder1_CmbDepartment_TBMain").hide()
            $("#ctl00_ContentPlaceHolder1_MultiPerson_TBMain").show("slow")
        }
    })
    $("#RDDepartment").click(function () {
        var CheckVal = $('[name="RDFilter"]:checked').val()
        if (CheckVal == 2) {
            $("#ctl00_ContentPlaceHolder1_CmbGroups").hide()
            $("#ctl00_ContentPlaceHolder1_MultiPerson_TBMain").hide()
            $("#ctl00_ContentPlaceHolder1_CmbDepartment_TBMain").show("slow")
        }
    })

})
//*****************************************************************************************************
function OnClickBtnFilter() {
    var CheckVal = $('[name="RDFilter"]:checked').val(), MemberID, MType;
    switch (CheckVal) {
        case "0":
            MType = "P";
            //---------------------------------------------------------------------------------------------
            if ($("#" + MasterObj + "MultiPerson_txtHidden").val() == "")
                MemberID = $("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val();
            else {
                MemberID = $("#" + MasterObj + "MultiPerson_txtHidden").val();
                $("#" + MasterObj + "MultiPerson_cmbPerson_txtPCode").val($("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val())
                if (window.ActiveXObject) {
                    xml = new ActiveXObject("Microsoft.XMLDOM");
                    xml.async = "false";
                    xml.loadXML("<Root>" + MemberID + "</Root>")
                }
                else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString("<Root>" + MemberID + "</Root>", 'text/xml');
                }
                MemberID = $(xml).find("Root").find("Tb:eq(0)").find("PCode").text();
            }
            //---------------------------------------------------------------------------------------------
            break;
            break;
        case "1":
            MType = "G";
            MemberID = $("#" + MasterObj + "CmbGroups").val();
            break;
        case "2":
            MType = "D";
            MemberID = $get(MasterObj + "CmbDepartment_txtID").value;
    }
    if (MemberID != "" && MemberID != "0") {
        OpenModelPopup();
        $.ajax({
            type: "POST",
            url: "DefineDepartmentShift.aspx/BindGrid?SubmitMode=Ajax",
            contentType: "application/json; charset=utf-8",

            data: "{MemberID:'" + MemberID + "' ,Type:'" + MType + "' ,  WPID:'" + $("#" + MasterObj + "CmbPeriod").val() + "',CardReaderNo:'" + $("#" + MasterObj + "CmbCardReaderNo").val() +"',SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "',CompanyID:'" + $("#" + MasterObj + "txtCompanyID").val() + "'}",
            success: function (Data) {
                CreateGrid(Data.d);
                CloseModelPopup();

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("جستجو با خطا مواجه شد" + jqXHR.responseText);
                CloseModelPopup();
            }
        });

    }
    else {
        alert("لطفا یک پرسنل /گروه /واحد را انتخاب کنيد");
    }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------
function CreateGrid(Data) {
    ClearGrid();
    if (Data != "{\"DailyShift\" : ]}") {
        var Date = eval('(' + Data.split('#')[0] + ')');
        if (Data.split('#')[1] != "{\"DailyShift\" : ]}")
            var DailyShift = eval('(' + Data.split('#')[1] + ')');
        $(Date.Date).each(function () {
            var Date = this.Date;
            var M = new Array('00:00;00:00', '00:00;00:00', '00:00;00:00', '00:00;00:00', '00:00;00:00', '00:00;00:00')
            var MID = new Array(0, 0, 0, 0, 0, 0);
            var i = 0, RowID = 0;
            if (Data.split('#')[1] != "{\"DailyShift\" : ]}") {
                $(DailyShift.DailyShift).each(function () {
                    if (this.Date == Date) {
                        M[i] = this.Movazafi;
                        MID[i] = this.ID;
                        i++;
                    }
                });
            }
            RowID = MID[0] + MID[1] + MID[2] + MID[3] + MID[4] + MID[5]
            AddRow(RowID, this.RDate,this.Dow, this.HolidayFlag, MID[0], M[0], MID[1], M[1], MID[2], M[2], MID[3], M[3], MID[4], M[4], MID[5], M[5]);
        });
        //------------------------Show Row Items For Registered Credit--------------------------------------
        OnClickGrd($("#TblShift").find("tr:eq(1)"), 0);
        $("#TblShift").find("tr").each(function () {
            if ($(this).attr("RowID") != 0 && $(this).attr("RowID") != undefined) {
                OnClickGrd($(this));
            }
        });
        //---------------------------------------------------
    }
}
//===========================================================================================================
function ClearGrid() {
    $(".CssNewRow").remove();
    $(".CssHolidayStyle").remove();
}
//------------------------------------------------------------------------------------------------------------------------------------------------------
function AddRow(RowID, Date,Dow, HolidayFlag, MID1, M1, MID2, M2, MID3, M3, MID4, M4, MID5, M5, MID6, M6) {
    var ClassName = HolidayFlag == 1 ? "CssHolidayStyle" : "CssNewRow";
    $("#TblShift").append("<tr class='" + ClassName + "' RowID='" + RowID + "'  valign='middle'>" +
                "<td class='CssItemSavedStyle' style='width: 70px;text-align:right' align='right' RealVal=" + Date + "  > " + Date + " </td>" +
                 "<td class='CssItemSavedStyle' style='width: 70px;text-align:right' align='right'> " + Dow + " </td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID1 + "' RealVal='" + M1 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #b1cafb;' align='right' ></td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID2 + "' RealVal='" + M2 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #d1b0e8;' align='right' ></td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID3 + "' RealVal='" + M3 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #b1cafb;' align='right' ></td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID4 + "' RealVal='" + M4 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #d1b0e8;' align='right' ></td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID5 + "' RealVal='" + M5 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #b1cafb;' align='right' ></td>" +
                 "<td class='CssItemSavedStyle' ID='" + MID6 + "' RealVal='" + M6 + "' RelatedObj='DivMovazafi' style='width: 120px;height:25px; background-color: #d1b0e8;' align='right' ></td></tr>");

    $("#TblShift").find("tr").last().click(function () {
        OnClickGrd(this);
    });
}
//===========================================================================================================
function OnClickGrd(SelectedRow, SelectItemindex) {
    var RelatedObj = $(SelectedRow).find("[RelatedObj]");
    RelatedObj.each(function () {
        if ($(this).find($(this).attr("RelatedType")).length == 0) {
            if ($(this).find("input:text").length == 0) {
                $(this).append($("#" + $(this).attr("RelatedObj")).html());

                $($(this).find("input:text")[0]).val($(this).attr("RealVal").split(';')[0]);
                $($(this).find("input:text")[1]).val($(this).attr("RealVal").split(';')[1]);


                $(this).children().focus(function () {
                    SetFocusItem(this);
                });
            }
        }
    });
}
//===========================================================================================================
$(document).delegate(".CssTimeStyle", "keydown", function () {
    OnKeyDownTime(this);
});
//===========================================================================================================
$(document).delegate(".CssTimeStyle", "change", function () {
    Timechk(this);
//    if ($(this).attr("id") == "txtETime"
//            && $(this).val() < $($(this).parent().find("input:text")[0]).val()) {
//        $(this).focus();
//        alert("ساعت شروع از ساعت خاتمه بزرگتر است");
//    }
//    else if ($(this).attr("id") == "txtSTime"
//                  && $(this).val() > $($(this).parent().find("input:text")[1]).val()
//                  && $($(this).parent().find("input:text")[1]).val() != "00:00") {
//        $(this).focus();
//        alert("ساعت شروع از ساعت خاتمه بزرگتر است");
//    }
});
//===========================================================================================================
//انتخاب متن داخل هر آیتم و سطر معادل با فوکوس آن آیتم
function SetFocusItem(SelecteItem) {
    $(SelecteItem).select();
    if (LastSelectedRow != "")
        $(LastSelectedRow).removeClass("CssSelectedRow");
    LastSelectedRow = $(SelecteItem).parent().parent();
    $(LastSelectedRow).addClass("CssSelectedRow");
}
//===========================================================================================================
function OnClickBtnSave() {
    var CheckVal = $('[name="RDFilter"]:checked').val(), MemberID, MType;
    switch (CheckVal) {
        case "0":
            MType = "P";
            //---------------------------------------------------------------------------------------------
            if ($("#" + MasterObj + "MultiPerson_txtHidden").val() == "")
                MemberID = $("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val() + ",";
            else {
                MemberID = $("#" + MasterObj + "MultiPerson_txtHidden").val();
                $("#" + MasterObj + "MultiPerson_cmbPerson_txtPCode").val($("#" + MasterObj + "MultiPerson_cmbPerson_txtCode").val())
                if (window.ActiveXObject) {
                    xml = new ActiveXObject("Microsoft.XMLDOM");
                    xml.async = "false";
                    xml.loadXML("<Root>" + MemberID + "</Root>")
                }
                else {
                    var parser = new DOMParser();
                    xml = parser.parseFromString("<Root>" + MemberID + "</Root>", 'text/xml');
                }
                MemberID = "";
                $(xml).find("Root").find("Tb").each(function () {
                    MemberID += $(this).find("PCode").text() + ',';
                });

            }
            //---------------------------------------------------------------------------------------------
            break;
            break;
        case "1":
            MType = "G";
            MemberID = $("#" + MasterObj + "CmbGroups").val();
            break;
        case "2":
            MType = "D";
            MemberID = $get(MasterObj + "CmbDepartment_txtID").value;
    }
    if (MemberID != "" && MemberID != "0") {
        CreateXmlSave();
        if (checkNotEmpty()) {
            OpenModelPopup();
            $.ajax({
                type: "POST",
                url: "DefineDepartmentShift.aspx/ModifyDailyShift?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{MemberID:'" + MemberID + "',Type:'" + MType + "',CardReaderNo:'" + $("#" + MasterObj + "CmbCardReaderNo").val() + "',XmlSave:'" + $("#" + MasterObj + "txtSaveXml").val() + "',SessionID:" + $("#" + MasterObj + "txtSessionID").val() + " ,CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + "}",
                success: function (Data) {
                    var Validate = 1, Message;
                    if (Data.d != "{\"ShowMessage\" : ]}") {
                        var myObjectjson = eval('(' + Data.d + ')');
                        $(myObjectjson.ShowMessage).each(function () {
                            Validate = this.Validate;
                            Message = this.Message
                        });
                    }
                    else
                        Validate = 0;

                    if (Validate == 1)
                        SetMsg(Message);
                    else
                        alert(Message);


                    CloseModelPopup();
                    OnClickBtnFilter();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
                    CloseModelPopup();
                }
            });
        }
    }
    else
        alert("لطفا یک پرسنل /گروه /واحد را انتخاب کنيد");
}
//===========================================================================================================
function checkNotEmpty() {
    var Data = $("#" + MasterObj + "txtSaveXml").val(), XmlNodes;
    var TbObj = $("#TblShift");
    if (Data != "") {
        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        var XmlNodes = $(xml).find("Root").find("Tb");
        for (var i = 0; i < $(XmlNodes).length; i++) {
            //                    var RowIndex = parseInt($(XmlNodes[i]).find("RowIndex").text());
            var STime = $(XmlNodes[i]).find("STime").text()
            var ETime = $(XmlNodes[i]).find("ETime").text()

            if ((STime == "" || STime == "00:00")
                     && ETime != ""
                     && ETime != "00:00") {
                alert("ساعت شروع را وارد نماييد")
                //                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                return false
            }
            else if ((ETime == "" || ETime == "00:00")
                     && STime != ""
                     && STime != "00:00") {
                alert("ساعت خاتمه را وارد نماييد")
                //                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                return false
            }
            else if (STime == ETime && (STime != "00:00")) {
                alert("ساعت شروع برابر ساعت خاتمه است")
                //                        TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                return false
            }
            else if (STime > ETime) {
                alert("ساعت شروع از ساعت خاتمه بزرگتر است")
//                TbObj.find("tr:eq(" + (RowIndex + 1) + ")").find("td:eq(1)").children().focus();
                return false
            }
        }
    }
    else {
        alert("هيچ آيتمی جهت ذخيره انتخاب نشده")
        return false
    }
    return true;
}
//===========================================================================================================
function CreateXmlSave() {
    var OGrid = $("#TblShift");
    var SaveXml = "<Root>";
    var GridDate = '';
    var Year = '';
    var Month = '';
    var Day = '';
    var flagDo = 0
    var DateCell;
    $("#" + MasterObj + "txtSaveXml").val("");

    if (OGrid)
        var len = OGrid.find("tr").length;
    else
        return false

    for (var RowIndex = 1; RowIndex < len; RowIndex++) {
        $(OGrid).find("tr:eq(" + RowIndex + ")").find("input:text").each(function () {
            if ($(this).attr("id") == "txtSTime"
                    && ($(this).val() != "" || $(this).parent().attr("ID") != "0")
                    && ($(this).val() != "00:00" || $(this).parent().attr("ID") != "0")
                    && $(this).val() != undefined) {
                DateCell = $(OGrid).find("tr:eq(" + RowIndex + ")").find("td:eq(0)").text()
                Year = DateCell.substring(6, 8);
                Month = DateCell.substring(3, 5);
                Day = DateCell.substring(0, 2);
                GridDate = "13" + Year + "/" + Month + "/" + Day;
                if ($(this).val() != "" && $($(this).parent().find("input:text")[1]).val() != "") {
                    SaveXml += "<Tb>"
                    SaveXml += "<ID>" + $(this).parent().attr("ID") + "</ID>";
                    SaveXml += "<Date>" + GridDate + "</Date>";
                    SaveXml += "<STime>" + $(this).val() + "</STime>";
                    SaveXml += "<ETime>" + $($(this).parent().find("input:text")[1]).val() + "</ETime>";
                    SaveXml += "</Tb>"
                }
                else if ($(this).val() == "" && $($(this).parent().find("input:text")[1]).val() == "") {
                    SaveXml += "<Tb>"
                    SaveXml += "<ID>" + $(this).parent().attr("ID") + "</ID>";
                    SaveXml += "<Date>" + GridDate + "</Date>";
                    SaveXml += "<STime>00:00</STime>";
                    SaveXml += "<ETime>00:00</ETime>";
                    SaveXml += "</Tb>"
                }
            }
        });
    }
    SaveXml += "</Root>"
    $("#" + MasterObj + "txtSaveXml").val(SaveXml);
}
//===========================================================================================================
//---------------------------------------------------------------------------