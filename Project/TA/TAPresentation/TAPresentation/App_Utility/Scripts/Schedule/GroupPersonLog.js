var RowIndex = 0, RowId;
document.getElementsByTagName("body")[0].scroll = "no";
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//====================================================================================================
CreateGrd();
//====================================================================================================
function EndRequestHandler(sender, args) {
    var Strval = $('#' + MasterObj + 'txtSubmit').val();
    switch (Strval) {
        case "FilterLog":
            CreateGrd();
            break;
        case "FilterLogDetail":
            CreateGrdLogDetail();
            break;
    }
    $('#' + MasterObj + 'txtSubmit').val("");
}
//====================================================================================================
function OnClickBtnFilter() {
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;

    $get(MasterObj + "txtKCalActSDate").value = $get(MasterObj + "KCalActSDate_txtYear").value + "/" + $get(MasterObj + "KCalActSDate_txtMonth").value + "/" + $get(MasterObj + "KCalActSDate_txtDay").value;
    $get(MasterObj + "txtKCalActSDate").value = document.getElementById(MasterObj + "txtKCalActSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalActSDate").value;
    $get(MasterObj + "txtKCalActEDate").value = $get(MasterObj + "KCalActEDate_txtYear").value + "/" + $get(MasterObj + "KCalActEDate_txtMonth").value + "/" + $get(MasterObj + "KCalActEDate_txtDay").value;
    $get(MasterObj + "txtKCalActEDate").value = document.getElementById(MasterObj + "txtKCalActEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalActEDate").value;

    if (document.getElementById(MasterObj + "txtKCalActEDate").value < document.getElementById(MasterObj + "txtKCalActSDate").value)
        alert("تاريخ شروع عمليات بزرگتر از تاريخ پايان عمليات است");
    else if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
        alert("تاريخ شروع عضويت بزرگتر از تاريخ پايان عضويت است");
    else {
        $("#" + MasterObj + "txtSubmit").val("FilterLog");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//====================================================================================================
function CreateGrd() {
    ClearGrid();
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlLog").val() != "<ScheduleEntity />") {
        Data = $("#" + MasterObj + "txtXmlLog").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("ScheduleEntity").find("GroupPersonLog");
        for (var i = 0; i < $(XmlNodes).length; i++)
            AddRowGrd($(XmlNodes[i]), i);
        //---------------------------------------------------------------------------------
    }
}
//====================================================================================================
function AddRowGrd(obj, index) {
    var id = "Tr" + index;
    $("#TblLog").append("<tr class='CssNewRow' id='" + id + "'  valign='middle' IsLoad=0 IsOpen=0  ActionTimeGP='" + obj.find("ActionTimeGP").text() + "'  OnlineuserID='" + obj.find("OnlineuserID").text() + "' >" +
               "<td style='width: 30px;text-align:center;height:20px' align='right'><img style='cursor:hand'  src='/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif' ></td>" +
                "<td style='width: 100px;height:20px' align='right'>" + obj.find("personCode").text() + "</td>" +
                "<td style='width: 300px;text-align:center;height:20px' align='right'> " + obj.find("DisplayName").text() + " </td>" +
                "<td style='width: 300px;text-align:center;height:20px' align='right'> " + obj.find("ComputerName").text() + " </td>" +
                "<td style='width: 200px;text-align:center;height:20px' align='right'>" + obj.find("ActionTime").text() + "</td></tr>");
    $("#TblLog").find("tr").last().addClass(id);
    $("#TblLog").find("tr").last().find("td:eq(0)").children(0).click(function () {
        OnClickImgLogDetail(this);
    });
}
//====================================================================================================
function CreateGrdLogDetail() {
    var Data = "", XmlNodes = "", xml;
    if ($("#" + MasterObj + "txtXmlLogDetail").val() != "<ScheduleEntity />") {
        Data = $("#" + MasterObj + "txtXmlLogDetail").val();

        if (window.ActiveXObject) {
            xml = new ActiveXObject('Microsoft.XMLDOM');
            xml.async = 'false';
            xml.loadXML(Data);
        } else {
            var parser = new DOMParser();
            xml = parser.parseFromString(Data, 'text/xml');
        }
        //---------------------------------------------------------------------------------
        XmlNodes = $(xml).find("ScheduleEntity").find("GroupPersonLogDetail");
        if ($(XmlNodes).length > 0) {
            var TblId = "TblLogDetail" + RowId;
            $("#TblLog").find("." + RowId).after("<tr class='CssNewRowDetail' ><td colspan=5 cellspacing=0 cellpadding=0 width='100%'><table id='" + TblId + "'><tr>" + $("#TrLogDetailHeader").html() + "</tr></table></td></tr>");
            for (var i = 0; i < $(XmlNodes).length; i++)
                AddRowGrdDetail($(XmlNodes[i]), TblId);
        }
        //---------------------------------------------------------------------------------
    }
}
//====================================================================================================
function AddRowGrdDetail(obj, TblId) {
    var ImgTitle, ImgSrc, GrouplinkClass, TargetGroupLinkClass;
    switch (obj.find("Act").text()) {
        case "1":
            ImgTitle = "اضافه شده";
            ImgSrc = "/TAPresentation/App_Utility/Images/Icons/Add.png";
            break;
        case "0":
            ImgTitle = "حذف شده";
            ImgSrc = "/TAPresentation/App_Utility/Images/Icons/Cross.gif";
            break;
    }
    switch (obj.find("GroupColor").text()) {
        case "Red":
            GrouplinkClass = "RedLink";
            break;
    }
    switch (obj.find("TargetGroupColor").text()) {
        case "Red":
            TargetGroupLinkClass = "RedLink";
            break;
    }
    $("#" + TblId).append("<tr>" +
                "<td class='CssGroupClass' style='width: 50px;height:20px' align='right'>" + obj.find("PersonCode").text() + "</td>" +
                "<td class='CssGroupClass' style='width: 150px;text-align:center;height:20px' align='right'> " + obj.find("PersonName").text() + " </td>" +
                "<td class='CssGroupClass' style='width: 50px;text-align:center;height:20px' align='right'> " + obj.find("GroupID").text() + " </td>" +
                "<td class='CssGroupClass' style='width: 100px;text-align:center;height:20px' align='right'><label  class='" + GrouplinkClass + "'>" + obj.find("GroupName").text() + "</label></td>" +
                "<td class='CssGroupClass' style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("SDate").text() + " </td>" +
                "<td class='CssGroupClass' style='width: 100px;text-align:center;height:20px' align='right'> " + obj.find("EDate").text() + " </td>" +
                "<td class='CssGroupClass' style='width: 50px;text-align:center;height:20px' align='right'> <img style='cursor:pointer' title='" + ImgTitle + "' src='" + ImgSrc + "'/></td>" +
                "<td class='CssTargetGroupClass' style='width: 50px;text-align:center;height:20px' align='right'>" + obj.find("TargetPersonelID").text() + "</td>" +
                "<td class='CssTargetGroupClass' class='CssTargetGroupClass' style='width: 150px;text-align:center;height:20px' align='right'>" + obj.find("TargetPersonName").text() + "</td>" +
                "<td class='CssTargetGroupClass' style='width: 50px;text-align:center;height:20px' align='right'>" + obj.find("TargetGroupID").text() + "</td>" +
                "<td class='CssTargetGroupClass' style='width: 150px;text-align:center;height:20px' align='right'><label  class='" + TargetGroupLinkClass + "'>" + obj.find("TargetGroupName").text() + "</label></td>" +
                "<td class='CssTargetGroupClass' style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("TargetSDate").text() + "</td>" +
                "<td class='CssTargetGroupClass' style='width: 100px;text-align:center;height:20px' align='right'>" + obj.find("TargetEDate").text() + "</td></tr>");
    $("#" + TblId).find("tr").last().find("td:eq(3)").children(0).click(function () {
        OnClickGroupLink(this);
    });
    $("#" + TblId).find("tr").last().find("td:eq(10)").children(0).click(function () {
        OnClickTargetGroupLink(this);
    });
}
//===========================================================================================================
function ClearGrid() {
    $(".CssNewRow").remove();
    $(".CssNewRowDetail").remove();
}
//====================================================================================================
function OnClickImgLogDetail(obj) {
    RowIndex = $(obj).parent().parent().index();
    RowId = $(obj).parent().parent().attr("Id");
    if ($(obj).parent().parent().attr("IsOpen") == "0") {
        $(obj).parent().parent().attr("IsOpen", "1");
        $(obj).attr("src", "/TAPresentation/App_Utility/Images/Icons/btnNodes.gif");
        if ($(obj).parent().parent().attr("IsLoad") == "1") {
            $("#TblLogDetail" + RowId).find("tr").each(function () {
                $(this).css("display", "inline");
            });
        }
    }
    else {
        $(obj).parent().parent().attr("IsOpen", "0");
        $(obj).attr("src", "/TAPresentation/App_Utility/Images/Icons/btnSubNodes.gif");
        if ($(obj).parent().parent().attr("IsLoad") == "1") {
            $("#TblLogDetail" + RowId).find("tr").each(function () {
                $(this).css("display", "none");
            });
        }
    }
    if ($(obj).parent().parent().attr("IsLoad") == "0") {
        var ActionTimeGP = $(obj).parent().parent().attr("ActionTimeGP");
        var OnlineUserID = $(obj).parent().parent().attr("OnlineuserID");
        $(obj).parent().parent().attr("IsLoad", "1");
        $("#" + MasterObj + "txtActionTimeGP").val(ActionTimeGP);
        $("#" + MasterObj + "txtOnlineUserID").val(OnlineUserID);
        $("#" + MasterObj + "txtSubmit").val("FilterLogDetail");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}
//====================================================================================================
function OnClickGroupLink(obj) {
    var GroupID = $(obj).parent().parent().find("td:eq(2)").text();
    var SDate = $get(MasterObj + "KCalActSDate_txtYear").value + "/" + $get(MasterObj + "KCalActSDate_txtMonth").value + "/" + $get(MasterObj + "KCalActSDate_txtDay").value;
    var EDate = $get(MasterObj + "KCalActEDate_txtYear").value + "/" + $get(MasterObj + "KCalActEDate_txtMonth").value + "/" + $get(MasterObj + "KCalActEDate_txtDay").value;
    var url = "GroupLog.aspx?GroupID=" + GroupID.toString().trim() + "&SDate=" + SDate + "&EDate=" + EDate + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val();
    strOptions = "dialogHeight:700px;dialogWidth:1200px;center: Yes;help: no;status: no;resizable:1";
    returnValue = window.showModalDialog(url, "", strOptions)
}
//====================================================================================================
function OnClickTargetGroupLink(obj) {
    var GroupID = $(obj).parent().parent().find("td:eq(9)").text();
    var SDate = $get(MasterObj + "KCalActSDate_txtYear").value + "/" + $get(MasterObj + "KCalActSDate_txtMonth").value + "/" + $get(MasterObj + "KCalActSDate_txtDay").value;
    var EDate = $get(MasterObj + "KCalActEDate_txtYear").value + "/" + $get(MasterObj + "KCalActEDate_txtMonth").value + "/" + $get(MasterObj + "KCalActEDate_txtDay").value;
    var url = "GroupLog.aspx?GroupID=" + GroupID.toString().trim() + "&SDate=" + SDate + "&EDate=" + EDate + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val();
    strOptions = "dialogHeight: 700px;dialogWidth:1200px;center: Yes;help: no;status: no;resizable:1";
    returnValue = window.showModalDialog(url, "", strOptions)
}
//====================================================================================================