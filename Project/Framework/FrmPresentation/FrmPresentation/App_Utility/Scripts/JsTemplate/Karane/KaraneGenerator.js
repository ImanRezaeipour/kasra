var ConstCell = 3;
//===========================================================================================
function ChkDisableCellCondition(Code1, Value, Operation, Code2, RoleType, Obj) {
    var OGrd = $("#" + MasterObj + "GrdKaraneReport");
    var CellIndex1 = parseInt(Code1.split("C")[1]) + ConstCell;
    var CellIndex2 = parseInt(Code2.split("C")[1]) + ConstCell;
    var rowIndex = $(Obj).parent().parent().index();
    var oRow = OGrd.find("tr:eq(" + rowIndex + ")");

    if (RoleType != "" && RoleType != undefined) {
        OGrd.find("tr").each(function () {
            if ($(this).attr("RoleType") != RoleType) {
                if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                    $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                    $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                }
            }
        });
    }
    else {
        switch (Operation) {
            case ">":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() > Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() > Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
            case "<":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() < Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() < Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
            case "=":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() == Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() == Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
            case ">=":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() >= Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() >= Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
            case "<=":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() <= Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() <= Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
            case "!=":
                if (Obj != "" && Obj != undefined) {
                    if (oRow.find("td:eq(" + CellIndex1 + ")").children().val() != Value) {
                        if ($(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                            $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                        }
                    }
                    else {
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().attr("disabled", false);
                        $(Obj).parent().parent().find("td:eq(" + CellIndex2 + ")").children().removeClass("GrdTxtDisableControls");
                    }
                }
                else {
                    OGrd.find("tr").each(function () {
                        if ($(this).find("td:eq(" + CellIndex1 + ")").text().toString().trim() != Value) {
                            if ($(this).find("td:eq(" + CellIndex2 + ")").children().length > 1) {
                                $(this).find("td:eq(" + CellIndex2 + ")").children().attr("disabled", true);
                                $(this).find("td:eq(" + CellIndex2 + ")").children().addClass("GrdTxtDisableControls");
                            }
                        }
                    });
                }
                break;
        }
    }
}
//===========================================================================================
function OnBlurCellScript(Obj, Formula, Code) {
    var OGrd = $("#" + MasterObj + "GrdKaraneReport");
    if (Obj != "" && Obj != undefined)
        CalcCellFormula(OGrd, Obj, Formula, Code);
    else if (OGrd.find("tr").find("td").length > 0)
        CalcGrdFormula(OGrd, Formula, Code);
}
//===========================================================================================
function CalcCellFormula(OGrd, Obj, Formula, Code) {
    var rowIndex = $(Obj).parent().parent().index()
    var oRow = OGrd.find("tr:eq(" + rowIndex + ")");
    var CellIndex = parseInt(Code.split("C")[1]) + ConstCell;
    var len = oRow.find("td").length;
    //----------------------------------------------
    var CNameNatureArr = $("#" + MasterObj + "txtCNameNature").val();
    var CNature = 0;
    CNameNatureArr = CNameNatureArr.split(',');
    //----------------------------------------------
    for (var j = 0; j < CNameNatureArr.length; j++) {
        if (CNameNatureArr[j].split('#')[0] == OGrd.find("th:eq(" + CellIndex + ")").text())
            CNature = CNameNatureArr[j].split('#')[1];
    }
    //----------------------------------------------
    for (var i = (len - 1); i >= 0; i--) {
        if (Formula.trim().toString().indexOf(i.toString(), 0) > 0) {
            var oCell = oRow.find("td:eq(" + (i + ConstCell) + ")");
            if (oCell.children().length > 1) {
                if (oCell.children().val() != "") {
                    if (oCell.children().val().split(':').length > 1)
                        Formula = ReplaceAll(Formula, "C" + i, SetMinuteTime(oCell.children().val()));
                    else
                        Formula = ReplaceAll(Formula, "C" + i, oCell.children().val());
                }
                else
                    Formula = ReplaceAll(Formula, "C" + i, 0);
            }
            else {
                if (oCell.text() != "") {
                    if (oCell.text().split(':').length > 1)
                        Formula = ReplaceAll(Formula, "C" + i, SetMinuteTime(oCell.text()));
                    else
                        Formula = ReplaceAll(Formula, "C" + i, parseFloat(oCell.text()));
                }
                else
                    Formula = ReplaceAll(Formula, "C" + i, 0);
            }
        }
    }
    if (CNature == 1)
        oRow.find("td:eq(" + CellIndex + ")").text(SetHourlyTime(eval(Formula)));
    else
        oRow.find("td:eq(" + CellIndex + ")").text(eval(Formula));
}
//===========================================================================================
function CalcGrdFormula(OGrd, Formula, Code) {
    var CalcFormula;
    var CellIndex = parseInt(Code.split("C")[1]) + ConstCell;
    var colCount = OGrd.find("tr:eq(1)").find("td").length;
    //----------------------------------------------
    var CNameNatureArr = $("#" + MasterObj + "txtCNameNature").val();
    var CNature = 0;
    CNameNatureArr = CNameNatureArr.split(',');
    //----------------------------------------------
    for (var j = 0; j < CNameNatureArr.length; j++) {
        if (CNameNatureArr[j].split('#')[0] == OGrd.find("th:eq(" + CellIndex + ")").text())
            CNature = CNameNatureArr[j].split('#')[1];
    }
    //----------------------------------------------
    OGrd.find("tr").each(function () {
        if ($(this).index() != 0 && $(this).index() <= 12) {
            CalcFormula = Formula;
            for (var i = (colCount - 1); i >= 0; i--) {
                if (Formula.indexOf(i, 0) > 0) {
                    var oCell = $(this).find("td:eq(" + (i + ConstCell) + ")");

                    if (oCell.children().length > 1) {
                        if (oCell.children().val() != "") {
                            if (oCell.children().val().split(':').length > 1)
                                CalcFormula = ReplaceAll(CalcFormula, "C" + i, SetMinuteTime(oCell.children().val()));
                            else
                                CalcFormula = ReplaceAll(CalcFormula, "C" + i, oCell.children().val());
                        }
                        else
                            CalcFormula = ReplaceAll(CalcFormula, "C" + i, 0);
                    }
                    else {
                        if (oCell.text() != "") {
                            if (oCell.text().split(':').length > 1)
                                CalcFormula = ReplaceAll(CalcFormula, "C" + i, SetMinuteTime(oCell.text()));
                            else
                                CalcFormula = ReplaceAll(CalcFormula, "C" + i, parseFloat(oCell.text()));
                        }
                        else
                            CalcFormula = ReplaceAll(CalcFormula, "C" + i, 0);
                    }
                }
            }
            if (CNature == 1)
                $(this).find("td:eq(" + CellIndex + ")").text(SetHourlyTime(eval(CalcFormula)));
            else
                $(this).find("td:eq(" + CellIndex + ")").text(eval(CalcFormula));
        }
    });
}
//===========================================================================================
function ChkValidCellCondition(Obj, Code, Value, Operation, Msg) {
    var OGrd = $("#" + MasterObj + "GrdKaraneReport");
    var rowIndex = $(Obj).parent().parent().index();
    var oRow = OGrd.find("tr:eq(" + rowIndex + ")");
    var CellIndex = parseInt(Code.split("C")[1]) + ConstCell;
    var defalut;
    var CNameNatureArr = $("#" + MasterObj + "txtCNameNature").val();
    var CNature = 0;
    //-----------------------------------------------------------------
    if (oRow.find("td:eq(" + CellIndex + ")").children().length > 1)
        oValue = oRow.find("td:eq(" + CellIndex + ")").children().val();
    else
        oValue = oRow.find("td:eq(" + CellIndex + ")").text();
    //-----------------------------------------------------------------
    CNameNatureArr = CNameNatureArr.split(',');
    for (var i = 0; i < CNameNatureArr.length; i++) {
        if (CNameNatureArr[i].split('#')[0] == OGrd.find("th:eq(" + $(Obj).parent().index() + ")").text())
            var CNature = CNameNatureArr[i].split('#')[1]
    }
    //-----------------------------------------------------------------
    if (Obj.value != "" || Obj.value != "0") {
        if (CNature == "18701")
            defalut = "00:00";
        else
            defalut = "0";
        switch (Operation) {
            case ">":
                if (oValue > Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
            case "<":
                if (oValue < Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
            case "=":
                if (oValue == Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
            case ">=":
                if (oValue >= Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
            case "<=":
                if (oValue <= Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
            case "!=":
                if (oValue != Value) {
                    $(Obj).val(defalut);
                    alert(Msg);
                }
                break;
        }
    }
}
//===========================================================================================
 