//*******************************************************************************************
var oInterval = "";
var Counter = 0;
var TimeCount = 0
var LastSelectedRow = null;
var LastSelectedRowClass = "";
var tmpImg = '';
var tmpPerson='';
var tmpSemat='';
var tmpDateTime='';
var tmpCardKhan='';
var tmpCardcode='';
var tmpCredit = '';
var tmpColor = '';
var whichClass = '';
var w = $(document).width();
var h = $(document).height();

fnStartInterval();
function fnStartInterval() {
    CreateGrid();
    if (oInterval == "")
        oInterval = window.setInterval("fnRecycle()", 9000);
    else {
        fnStopInterval();
    }
}
function fnStopInterval() {
    if (oInterval != "") {
        window.clearInterval(oInterval);
        resetVariable();
    }
}
function fnRecycle() {
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();

}
function resetVariable() {
    oInterval = "";
    Counter = 0;
    TimeCount = 0;
}
//*******************************************************************************************
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function BeginRequestHandler(sender, args) {

    document.getElementById("ctl00_ProgressState").value = 1;

}

//====================================================================================
function EndRequestHandler(sender, args) {
    var StrVal = $get(MasterObj + "txtSubmit").value;
    $get(MasterObj + "txtSubmit").value = "";
    
    var wPic = Math.round(w / 7);
    var hPic = Math.round(h / 5);
    $("#tb1").css("height", (Math.round(h) - 70));
    //==========================add Row New To Right====================
    var i = 0;
   
    if (StrVal == "Filter" && $("#" + MasterObj + "LastRowGridXml").val() != "") {
        /// person left
        var counterlow = 4;
        while (counterlow > 0) {

            $("#img" + (counterlow + 1)).attr("src", $("#img" + counterlow).attr("src"));

            //---3 4 5 left
            if (counterlow != 1) {
                $("#div" + (counterlow + 1)).html($("#div" + counterlow).html());
            } //---2 left
            else {
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(0)").find("td:eq(1)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(0)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(0)").find("td:eq(3)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(1)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(1)").find("td:eq(1)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(2)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(2)").find("td:eq(1)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(3)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(2)").find("td:eq(3)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(4)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(3)").find("td:eq(1)").text($("#tempLastPerson").find("tr:eq(1)").children(0).children(0).find("tr:eq(5)").find("td:eq(1)").text());
                $("#div" + (counterlow + 1)).children(0).find("tr:eq(0)").find("td:eq(1)").css("background-color", $("#tempLastPerson").find("tr:eq(1)").children(0).css("background-color"));
                $("#tdF" + (counterlow + 1)).attr("class", $("#tempLastPerson").find("tr:eq(0)").children(0).attr("class"));
            }
            counterlow -= 1;
        }

        $("#img2").attr("src", $("#tempLastPerson").children(0).find("tr:eq(0)").find("td:eq(0)").children(0).attr("src"));
        /// person right
        var xmlNewRowGrid;
        var ImgSrc;
       
        xmlNewRowGrid = $.xmlDOM($("#" + MasterObj + "LastRowGridXml").val());

        if ($(xmlNewRowGrid).find("PicUrl:eq(0)").text() != "" && $(MasterObj + "txtRegInOutPic").val() == "1") {
            ImgSrc=$(xmlNewRowGrid).find("PicUrl:eq(0)").text()
        }
        else if ($(xmlNewRowGrid).find("ImageFormat:eq(0)").text() != "") {
            ImgSrc = "../../App_Utility/Images/Upload/PersonPic/Pic" + $(xmlNewRowGrid).find("PersonID:eq(0)").text() + "." + $(xmlNewRowGrid).find("ImageFormat:eq(0)").text();
        }
        else {
            ImgSrc = "/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg";
        }
        $("#img1").attr("src", ImgSrc);

        $("#img1").css("width", "300px");
        $("#img1").css("height", "300px");

        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(0)").find("td:eq(1)").text($(xmlNewRowGrid).find("Person:eq(0)").text());
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(1)").find("td:eq(1)").text($(xmlNewRowGrid).find("Semat:eq(0)").text());
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(2)").find("td:eq(1)").text($(xmlNewRowGrid).find("dateTime:eq(0)").text());
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(3)").find("td:eq(1)").text($(xmlNewRowGrid).find("CardKhan:eq(0)").text());
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(4)").find("td:eq(1)").text($(xmlNewRowGrid).find("cardcode:eq(0)").text());
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(5)").find("td:eq(1)").text($(xmlNewRowGrid).find("credit:eq(0)").text());

        if ($(xmlNewRowGrid).find("Type:eq(0)").text() == "ورود") {
            tmpColor = "#cdf5b8"
            whichClass = "fieldsetStyleForTdEnter"
        }
        else if ($(xmlNewRowGrid).find("Type:eq(0)").text() == "خروج") {
            tmpColor = "#f5b8ec"
            whichClass = "fieldsetStyleForTdExit"
        }
        else {
            whichClass = "fieldsetStyleForTD"
        }

        $("#tb1").find("tr:eq(1)").children(0).css("background-color", tmpColor);

        if (whichClass !="" && whichClass !=undefined)
            $("#tdF1").attr('class', whichClass);

        tmpImg = ImgSrc;
        tmpPerson = $(xmlNewRowGrid).find("Person:eq(0)").text();
        tmpSemat = $(xmlNewRowGrid).find("Semat:eq(0)").text();
        tmpDateTime = $(xmlNewRowGrid).find("dateTime:eq(0)").text();
        tmpCardKhan = $(xmlNewRowGrid).find("CardKhan:eq(0)").text();
        tmpCardcode = $(xmlNewRowGrid).find("cardcode:eq(0)").text();
        tmpCredit = $(xmlNewRowGrid).find("credit:eq(0)").text(); 

    }

    else {
        // $("#tb1").html($("#" + MasterObj + "Xmltb1").val());
        $("#img1").attr("src", tmpImg);
        $("#img1").css("width", "300px");
        $("#img1").css("height", "300px");

        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(0)").find("td:eq(1)").text(tmpPerson);
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(1)").find("td:eq(1)").text(tmpSemat);
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(2)").find("td:eq(1)").text(tmpDateTime);
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(3)").find("td:eq(1)").text(tmpCardKhan);
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(4)").find("td:eq(1)").text(tmpCardcode);
        $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(5)").find("td:eq(1)").text(tmpCredit);
        $("#tb1").find("tr:eq(1)").children(0).css("background-color", tmpColor);
        $("#tdF1").attr('class', whichClass);
    }
    $("#" + MasterObj + "Xmltb1").val($("#tb1").html());
    $("#tempLastPerson").html($("#tb1").html());
    //====================================================
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function OnClickBtnSelectCardReader() {
    var DialogProperty = "dialogHeight:450px;dialogWidth:400px;center: Yes;help: no;status: no;resizable=1";

    var url = "/FrmPresentation/App_Pages/BaseInfo/CardReader/Select CardReader.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
         + "&CardReader=" + $get(MasterObj + "txtXmlCardReader").value
    returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
    if (returnValue != undefined) {
        $get(MasterObj + "txtXmlCardReader").value = returnValue

        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDoc.async = "false";
        oXmlDoc.loadXML(returnValue);

        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[Chk=1]");
        var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb[Chk=0]");
        if (oXmlNodes.length > 0) {
            $get(MasterObj + "lblCardReader").innerText = "";

            for (var i = 0; i < oXmlNodes.length; i++) {
                if ($get(MasterObj + "lblCardReader").innerText == "")
                    $get(MasterObj + "lblCardReader").innerText = oXmlNodes[i].selectSingleNode("CardReaderNo").text
                else
                    $get(MasterObj + "lblCardReader").innerText += "," + oXmlNodes[i].selectSingleNode("CardReaderNo").text;
            }
        }
        if (oXmlNodes.length == 0 && oXmlNodes1.length > 0) {
            $get(MasterObj + "lblCardReader").innerText = "";
        }
    }
}

function CreateGrid() {
    var xmlCreateGrid;

//    var w = $(document).width();
//    var h = $(document).height();
    var wPic = Math.round(w / 7);
    var hPic = Math.round(h / 5);

    xmlCreateGrid = $.xmlDOM($("#" + MasterObj + "GridXml").val());
    var counter = 1;
   
    $("#tb1").css("height", (Math.round(h) - 70));
    var ImgSrc = "";

    while (counter < 6) {
        if (counter == 1) {

            if ($(xmlCreateGrid).find("PicUrl:eq(0)").text() != "" && $(MasterObj + "txtRegInOutPic").val() == "1") {

                ImgSrc = $(xmlCreateGrid).find("PicUrl:eq(0)").text()
                // $("#img1").attr("src", $(xmlCreateGrid).find("PicUrl:eq(0)").text());
            }
            else
                if ($(xmlCreateGrid).find("ImageFormat:eq(0)").text() != "") {
                    ImgSrc = "../../App_Utility/Images/Upload/PersonPic/Pic" + $(xmlCreateGrid).find("PersonID:eq(0)").text() + "." + $(xmlCreateGrid).find("ImageFormat:eq(0)").text();
                    //$("#img1").attr("src", ImgSrc)
                }
                else {
                    ImgSrc = "/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg";
                    //$("#img1").attr("src", "/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg");
                }

            $("#img1").attr("src", ImgSrc);

            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(0)").find("td:eq(1)").text($(xmlCreateGrid).find("Person:eq(0)").text());
            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(1)").find("td:eq(1)").text($(xmlCreateGrid).find("Semat:eq(0)").text());
            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(2)").find("td:eq(1)").text($(xmlCreateGrid).find("dateTime:eq(0)").text());
            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(3)").find("td:eq(1)").text($(xmlCreateGrid).find("CardKhan:eq(0)").text());
            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(4)").find("td:eq(1)").text($(xmlCreateGrid).find("cardcode:eq(0)").text());
            $("#tb1").find("tr:eq(1)").children(0).children(0).find("tr:eq(5)").find("td:eq(1)").text($(xmlCreateGrid).find("credit:eq(0)").text());

            if ($(xmlCreateGrid).find("Type:eq(0)").text() == "ورود") {
                tmpColor = "#cdf5b8"
                whichClass = "fieldsetStyleForTdEnter"
            }
            //$("#tb1").find("tr:eq(1)").children(0).css("background-color", "#cdf5b8");
            else if ($(xmlCreateGrid).find("Type:eq(0)").text() == "خروج") {
                tmpColor = "#f5b8ec"
                whichClass = "fieldsetStyleForTdExit"
            }
            else
                whichClass = "fieldsetStyleForTD";

            $("#tb1").find("tr:eq(1)").children(0).css("background-color", tmpColor);
            if (whichClass != "" && whichClass != undefined) {
                $("#tdF1").attr('class', whichClass);
                $("#tb1").attr('frameClass', whichClass);
            }

            tmpImg = ImgSrc;
            tmpPerson = $(xmlCreateGrid).find("Person:eq(0)").text();
            tmpSemat = $(xmlCreateGrid).find("Semat:eq(0)").text();
            tmpDateTime = $(xmlCreateGrid).find("dateTime:eq(0)").text();
            tmpCardKhan = $(xmlCreateGrid).find("CardKhan:eq(0)").text();
            tmpCardcode = $(xmlCreateGrid).find("cardcode:eq(0)").text();
            tmpCredit = $(xmlCreateGrid).find("credit:eq(0)").text();

        }
        else {

            if ($(xmlCreateGrid).find("PicUrl:eq(" + (counter - 1) + ")").text() != "" && $(MasterObj + "txtRegInOutPic").val() == "1") {
                $("#img" + counter).attr("src", $(xmlCreateGrid).find("PicUrl:eq(" + (counter - 1) + ")").text());
            }
            else
                if ($(xmlCreateGrid).find("ImageFormat:eq(" + (counter - 1) + ")").text() != "") {
                    var ImgSrc = "";
                    ImgSrc = "../../App_Utility/Images/Upload/PersonPic/Pic" + $(xmlCreateGrid).find("PersonID:eq(" + (counter - 1) + ")").text() + "." + $(xmlCreateGrid).find("ImageFormat:eq(" + (counter - 1) + ")").text();
                    $("#img" + counter).attr("src", ImgSrc)
                }
                else
                    $("#img" + counter).attr("src", "/FrmPresentation/App_Utility/Images/ModifyPersonImage/userpic.jpg");

            $("#img" + counter).css("width", wPic);
            $("#img" + counter).css("height", hPic);

            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(0)").find("td:eq(1)").text($(xmlCreateGrid).find("Person:eq(" + (counter - 1) + ")").text());
            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(0)").find("td:eq(3)").text($(xmlCreateGrid).find("Semat:eq(" + (counter - 1) + ")").text());
            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(1)").find("td:eq(1)").text($(xmlCreateGrid).find("dateTime:eq(" + (counter - 1) + ")").text());
            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(2)").find("td:eq(1)").text($(xmlCreateGrid).find("CardKhan:eq(" + (counter - 1) + ")").text());
            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(2)").find("td:eq(3)").text($(xmlCreateGrid).find("cardcode:eq(" + (counter - 1) + ")").text());
            $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").children(0).find("tr:eq(3)").find("td:eq(1)").text($(xmlCreateGrid).find("credit:eq(" + (counter - 1) + ")").text());

            if ($(xmlCreateGrid).find("Type:eq(" + (counter - 1) + ")").text() == "ورود") {
                $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").css("background-color", "#cdf5b8");
                $("#tdF" + counter).attr('class', "fieldsetStyleForTdEnter");
            }
            else if ($(xmlCreateGrid).find("Type:eq(" + (counter - 1) + ")").text() == "خروج") {
                $("#div" + counter).children(0).find("tr:eq(0)").find("td:eq(1)").css("background-color", "#f5b8ec");
                $("#tdF" + counter).attr('class', "fieldsetStyleForTdExit");
            }
            else
                $("#tdF" + counter).attr('class', "fieldsetStyleForTD");

        }
        counter += 1;
    }

    
    $("#" + MasterObj + "Xmltb1").val($("#tb1").html());
    $("#tempLastPerson").html($("#tb1").html());
}
