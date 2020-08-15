
        document.body.scroll = "no";
        $.noConflict();
        var PageSize = 12;
        var DateManage = 0;
       // $("#OToolBar_TDTopToolBar").css("display", "none");
        $("#" + MasterObj + "txtSave").val("<Root></Root>");
        SetDate();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtSubmit").value != "") {
                SetChange();
                $get(MasterObj + "txtSubmit").value = "";
            }
        }
        //----------------------------------
        $(document).ready(function () {
            SetGroupInfo();
            $("#" + MasterObj + "CmbPerson_txtOnChangeFunc").val("OnChangeCmbPerson()");
        });
        //---------------------------------
        function SetGroupInfo() {
            var xml;
            var Data = $("#" + MasterObj + "txtXml").val();
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            var XmlNodeGroupInfo = $(xml).find("NewDataSet").find("Group");
            $("#txtGroupName").val($(XmlNodeGroupInfo[0]).find("Name").text());
            $("#txtAcronymName").val($(XmlNodeGroupInfo[0]).find("Acronym").text());
            $("#" + MasterObj + "CmbCategory").val($(XmlNodeGroupInfo[0]).find("CategoryId").text());
            if ($("#" + MasterObj + "CmbCategory").find("option:selected").text() == "شيفت")
                $("#" + MasterObj + "CmbCategory").attr("disabled",true)
           
            $("#Descript").val($(XmlNodeGroupInfo[0]).find("Description").text());
            //$("#RdActive").attr("checked", $(XmlNodeGroupInfo[0]).find("Active").text() == "1" ? true : false);
            //$("#RDShift").attr("checked", $(XmlNodeGroupInfo[0]).find("Flags").text() == "1" ? true : false);
        }
        function SetDate() {
            $("#" + MasterObj + "KCalSDate_txtYear").val("1390");
            $("#" + MasterObj + "KCalSDate_txtMonth").val("01");
            $("#" + MasterObj + "KCalSDate_txtDay").val("01");
            $("#" + MasterObj + "KCalSDate_txtCalendar").val("01/01/1390" + "  " + F_adbsghh("01/01/1390"));

            $("#" + MasterObj + "KCalEDate_txtYear").val("1399");
            $("#" + MasterObj + "KCalEDate_txtMonth").val("12");
            $("#" + MasterObj + "KCalEDate_txtDay").val("29");
            $("#" + MasterObj + "KCalEDate_txtCalendar").val("29/12/1399" + "  " + F_adbsghh("29/12/1399"));
        }
        function AddRow(obj) {
            $("#TblGroupMember").append("<tr class='CssRow' PersonID=" + obj.find("PersonID").text() + " PersonCode=" + obj.find("PersonCode").text() + " >"
            + "<td  align='center'  ><img  src='../../App_Utility/Images/Icons/Definestructure.gif' style='cursor:hand'/></td>"
            + "<td  align='center'><input type='checkbox' " + (obj.find("Selected").text() == "1" ? " checked " : "") + " RealVal=" + obj.find("Selected").text() + " /></td>"
            + "<td  align='center'>" + obj.find("PersonCode").text() + " </td> "
            + "<td align='right'>" + obj.find("Name").text() + " </td> "
            + "<td  align='center'><input  type='text' style='display:none' RealVal=" + obj.find("StartDate").text() + "   value='" + obj.find("StartDate").text() + "' /> <input RealVal=" + obj.find("StartDate").text() + "  style='width:130px;text-align:right' value='" + obj.find("StartDate").text() + "'  class='TxtControls' type='text'/><img src='/TAPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' /></td>"
            + "<td  align='center'><input  type='text' style='display:none' RealVal=" + obj.find("EndDate").text() + "   value='" + obj.find("EndDate").text() + "'/> <input RealVal=" + obj.find("EndDate").text() + "    style='width:130px;text-align:right' value='" + obj.find("EndDate").text() + "'  class='TxtControls' type='text'/><img src='/TAPresentation/App_Utility/NewCalendar/Images/calendar2.gif' valign='bottom' /></td>"
            + "</tr>");            
        }
        //===========================
        function ClearGrid() {
            $(".CssRow").remove();
        }
        //====================================================CreateGrid==========================
        function CreateGrid(Xml) {
            if (window.ActiveXObject) {
                XmlSave = new ActiveXObject('Microsoft.XMLDOM');
                XmlSave.async = 'false';
                XmlSave.loadXML(Xml);
            } else {
                var parser = new DOMParser();
                XmlSave = parser.parseFromString(Xml, 'text/xml');
            }
            //--------------------------
            var XmlNodes = $(XmlSave).find("Root").find("Tb").each(function () {
                AddRow($(this));
            });
            $("#TblGroupMember").find("tr").each(function () {
                if (!$(this).hasClass("header")) {
                    $(this).find("td:eq(0)").click(function () {
                        onclickImg(this);
                    });
                    $(this).find("td:eq(1)").find("input").click(function () { onchangeCheckDelete(this) });

                    $(this).find("td:eq(4)").find("input:eq(1)").blur(function () { datechk(this); onchangeDate(this); CheckValidDateNewMember(this); chkDayOfDate(this, 4, 2); }).focus(function () { onfocusItem(this) });
                    $(this).find("td:eq(4)").find("Img").click(function () {
                        onclickImgDate(this)
                    });

                    $(this).find("td:eq(5)").find("input:eq(1)").focus(function () { datechk(this);  onfocusItem(this) }).blur(function () { onchangeDate(this); CheckValidDateNewMember(this); chkDayOfDate(this, 5, 2); })

                    $(this).find("td:eq(5)").find("Img").click(function () {
                        onclickImgDate(this)
                    });
                    //  alert($(this).find("td:eq(4)").html());
                    //                    $(this).find("td:eq(4)").find("input:eq(1)").val($("#" + MasterObj + "KCalSDate_txtCalendar").val());
                    //                    $(this).find("td:eq(5)").find("input:eq(1)").val($("#" + MasterObj + "KCalEDate_txtCalendar").val());

                }
            });
        }
        //==============================================================================
        function Isvaliddate(txt) {

            var le, t1, t2, sal, mah, roz
            var arr1, arr2, arr3
            var x = 0
            while (x < this.getCntChar('/', txt + "/")) {

                arr3 = this.getArray(txt + "/", x, '/')
                ++x
                arr2 = this.getArray(txt + "/", x, '/')
                ++x
                arr1 = this.getArray(txt + "/", x, '/')
                ++x
            }
           

            if (this.getCntChar('/', txt) == 2) {
                roz = arr3
                mah = arr2
                sal = arr1

                le = 0
                if (sal < 100)
                    sal = sal + 1300


                if (this.isshleap(sal))
                    le = 1


                t1 = ((mah >= 1) && (mah <= 12))
                t2 = ((roz >= 1) && (roz <= 29 + le))
                t2 = (t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11))))
                t2 = (t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6))))
                
                return (t1 && t2)
            }
            else {
                return false
            }
        }
        function datechk(obj) {
            var val = obj.value
           
            if ((val != "") && (!Isvaliddate(val) || !ChkKeyOfDate(val))) {
                alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
                obj.value = "";
                return false

            }

            else
                if (val != "") {
                    var arr1, arr2, arr3
                    var x = 0
                    while (x < getCntChar('/', val + "/")) {
                        arr3 = getArray(val + "/", x, '/')
                        ++x
                        arr2 = getArray(val + "/", x, '/')
                        ++x
                        arr1 = getArray(val + "/", x, '/')
                        ++x
                    }
                    arr1 = arr1
                    arr2 = arr2
                    arr3 = arr3
                    if (arr1.length < 2)
                        century = "130"
                    else if (arr1.length < 3)
                        century = "13"
                    else
                        century = ""

                    if (arr3.length < 2)
                        val = "0" + arr3 + "/"
                    else
                        val = arr3 + "/"

                    if (arr2.length < 2)
                        val += "0" + arr2 + "/" + century + "" + arr1
                    else
                        val += arr2 + "/" + century + "" + arr1



                    obj.value = val
                    return val
                }


        }
        //-------------------------------------
        function ChkKeyOfDate(obj) {
            var ObjCalendar = obj;
            var lenObj = ObjCalendar.length
            var key
            var eventObj
            var flag=true
            for (var i = 0; i < lenObj; i++) {
                eventObj = ObjCalendar.substring(i, i + 1)

                key = eventObj.charCodeAt(0)

                //alert(eventObj + "   " + key)

                if (!((((key >= 48) && (key <= 58)) || (key == 47) || (key == 189) ||
			(key == 191) ||
			(key == 67) ||
            (key == 111) || (key == 17) || (key == 231) ||
            (key == 8) || (key == 9) //||
                //((key >= 35) && (key <= 40))
            ))) {
                    flag = false
                    i = lenObj;
                }
            }
            return flag;
        }
        //====================================کپی شدن کلیه تاریخ ها در گرید پایین آن
        function onclickCopyDate() {
            $("#TblGroupMember tr").each(function () {
                $(this).find("td:eq(4)").find("input:eq(1)").val($("#" + MasterObj + "KCalSDate_txtCalendar").val());
                $(this).find("td:eq(5)").find("input:eq(1)").val($("#" + MasterObj + "KCalEDate_txtCalendar").val());  
            });
        }

        //====================================باز شدن پنجره تقویمها
        function onclickImgDate(obj) {
            if (obj.parentElement.firstChild.value != "") {
                var Year = obj.parentElement.firstChild.value.substr(6, 4);
                var Month = obj.parentElement.firstChild.value.substr(3, 2);
                var Day = obj.parentElement.firstChild.value.substr(0, 2);
            }
            else {
                var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value
                var Year = objNow.substr(0, 4)
                var Month = objNow.substr(5, 2)
                var Day = objNow.substr(8, 2)
            }
            var strFeature = "dialogHeight:266px;dialogWidth:277px;dialogLeft:200px;dialogTop:200px;status=no";
            var strUrl = "/TAPresentation/App_Utility/NewCalendar/SolarCalendar.htm";
            var oCurrentDate = new Object();
            oCurrentDate.Year = Year;
            oCurrentDate.Month = Month;
            oCurrentDate.Day = Day;
            oCurrentDate.Holiday = $("#" + MasterObj + "KCalSDate_txtXmlHoliday").val();
            var oDate = showModalDialog(strUrl, oCurrentDate, strFeature);
            var strYear = "";
            var strMonth = "";
            var strDay = "";
            if (oDate != null) {
                var strYear = oDate.Year;
                var strMonth = ((parseInt(oDate.Month, 10) < 10) ? "0" + parseInt(oDate.Month, 10).toString() : oDate.Month.toString());
                var strDay = ((parseInt(oDate.Day, 10) < 10) ? "0" + parseInt(oDate.Day, 10).toString() : oDate.Day.toString());
            }
            Year = strYear;
            Month = strMonth;
            Day = strDay;
            oDate = Day + '/' + Month + '/' + Year;
            if (oDate != "//") {
                obj.parentElement.childNodes[2].value = oDate;
                onchangeDate(obj.parentElement.childNodes[2]);
                obj.parentElement.firstChild.value = Year + '/' + Month + '/' + Day;
            }
        }
        //===============================
        function onfocusItem(obj) {
            obj.select();
        }
        //================================تغییر کنترل تاریخ
        function onchangeDate(obj) {
            var objNow = document.getElementById(MasterObj + "KCalSDate_txtDateNow").value;
            var Year = objNow.substr(0, 4)
            var Month = objNow.substr(5, 2)
            var Day = objNow.substr(8, 2)
            var RealVal = "";
            var sal;
//            if (obj.value.length == 10)
//                obj.value = ReverseDate(obj.value.substr(2, 10));
            if (obj.value != "") {
                var Date = "";
               
                var s = obj.value.split('/');
                if (s.length > 3) {
                    obj.value = "";
                    return;
                }
                if (s[2] != null) {

                    sal = s[2].split('  ');
                }
                if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {
                    obj.value = "";
                    //return;
                }
                if (s.length == 3) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    if (s[0].length == 3)
                        Date = Date + Day
                    if (s[2] == null)
                        Date = Year + "/" + Date
                    if (s[2] != null) {
                        var sal;
                        sal = s[2].split('  ');
                        if (sal[0].length == 0)
                            Date = Year + "/" + Date
                        if (sal[0].length == 1)
                            Date = Year.substr(0, 3) + sal[0] + "/" + Date
                        if (sal[0].length == 2)
                            Date = Year.substr(0, 2) + sal[0] + "/" + Date
                        if (sal[0].length == 3)
                            Date = Year.substr(0, 1) + sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] != "0000")
                            Date = sal[0] + "/" + Date
                        if (sal[0].length == 4 && sal[0] == "0000")
                            Date = Year + "/" + Date
                    }
                }
                if (s.length == 2) {
                    if (s[1].length == 1 && s[1] != "0")
                        Date = Date + "0" + s[1] + "/"
                    if (s[1].length == 1 && s[1] == "0")
                        Date = Date + "01" + "/"
                    if (s[1].length == 2 && s[1] != "00")
                        Date = Date + s[1] + "/"
                    if (s[1].length == 2 && s[1] == "00")
                        Date = Date + "01" + "/"
                    if (s[1].length == 0)
                        Date = Date + Month + "/"
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Date + s[0] + "/01"
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Date + "01";
                    if (s[0].length == 0)
                        Date = Date + Day
                    Date = Year + "/" + Date
                }
                if (s.length == 1) {
                    if (s[0].length == 1 && s[0] != "0")
                        Date = Year + "/" + Month + "/" + Date + "0" + s[0]
                    if (s[0].length == 1 && s[0] == "0")
                        Date = Year + "/" + Month + "/" + Date + "01"
                    if (s[0].length == 2 && s[0] != "00")
                        Date = Year + "/" + Month + "/" + Date + s[0]
                    if (s[0].length == 2 && s[0] == "00")
                        Date = Year + "/" + Month + "/" + Date + "01"
                }
                RealVal = Date;
                Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
                obj.value = Date
                obj.value = obj.value + "  " + F_adbsghh(obj.value)
                if (Date == '//')
                    obj.value = '';
            }
            
            obj.parentElement.firstChild.value = ReverseDate(RealVal);
        }
        //--------------------------------
        function OnClickBtnSelect() {
            document.getElementById("OToolBar_ProgressBar").style.visibility="visible"
            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 600px;dialogWidth:900px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')
            if (returnResult != "" && returnResult != undefined) {
                var xmlNew;
                if (window.ActiveXObject) {
                    xmlNew = new ActiveXObject('Microsoft.XMLDOM');
                    xmlNew.async = 'false';
                    xmlNew.loadXML(returnResult);
                } else {
                    var parser = new DOMParser();
                    xmlNew = parser.parseFromString(returnResult, 'text/xml');
                }
                var StrSave = "";
                //---------------------------------               
                var SDate = $("#" + MasterObj + "KCalSDate_txtDay").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtYear").val();
                var EDate = $("#" + MasterObj + "KCalEDate_txtDay").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtYear").val();
                
                var LastRowNumber = $("#TblGroupMember").find("tr").length - 1;
                $(xmlNew).find("Root").find("Tb").each(function () {

                    if ($("#TblGroupMember").find("tr[PersonID='" + $(this).find("PID").text() + "']").length == 0)
                        StrSave += "<Tb><RowNumber>" + (parseInt(LastRowNumber + 1)) + "</RowNumber><Name>" + $(this).find("PName").text() + "</Name><PersonCode>" + $(this).find("PCode").text() + "</PersonCode><Selected>1</Selected><PersonID>" + $(this).find("PID").text() + "</PersonID><StartDate>" + SDate + "</StartDate><EndDate>" + EDate + "</EndDate><OldSDate></OldSDate><OldEDate></OldEDate></Tb>";

                    LastRowNumber++;
                });
                StrSave = "<Root>" + StrSave + "</Root>";
                CreateGrid(StrSave);
            }
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden"
        }
        //--------------------
        function NotEmpty() {
            if ($("#txtGroupName").val() == "") {
                alert("نام گروه را وارد کنید ")
                $("#txtGroupName").focus();
                return false
            }
            if ($("#txtAcronymName").val() == "") {
                alert("نام مخفف را وارد کنید ")
                $("#txtAcronymName").focus();
                return false
            }
            if ($("#txtAcronymName").val().length > "20") {
                alert("تعداد حروف نام مخفف از 20 حرف بزرگتر است  ")
                $("#txtAcronymName").focus();
                return false
            }
            if (!OnCheckValidCodeName($("#txtGroupName").val())) {
                alert("لطفا نام آيتم را درست وارد کنيد،فقط حروف الفبا ی انگليسی و فارسي می توان وارد کرد")
                $("#txtGroupName").focus()
                return false;
            }
            var SDate = $("#" + MasterObj + "KCalSDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalSDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalSDate_txtDay").val();
            var EDate = $("#" + MasterObj + "KCalEDate_txtYear").val() + "/" + $("#" + MasterObj + "KCalEDate_txtMonth").val() + "/" + $("#" + MasterObj + "KCalEDate_txtDay").val();
            if (SDate == "//" ) {
                alert("تاریخ شروع را وارد کنید ")
                $("#"+MasterObj+"KCalSDate_txtCalendar").focus();
                return false
            }
            if (EDate == "//") {
                alert("تاریخ خاتمه را وارد کنید ")
                $("#" + MasterObj + "KCalEDate_txtCalendar").focus();
                return false
            }
            if (SDate>EDate) {
                alert("تاریخ شروع از تاریخ خاتمه بزرگتر است ")
                $("#" + MasterObj + "KCalEDate_txtCalendar").focus();
                return false
            }
            return true;
        }
        //--------------------------------
        function CheckGridForDate() {
            var CheckDate = true;
            var messageDate = "";
            var PersonID = ""
            var Personcode = ""
            var PersonName = "";
            var Data = "<Root>" + $("#" + MasterObj + "txtSave").val().replace("</Root>", "").replace("<Root>", "") + $("#" + MasterObj + "txtSaveNewMember").val().replace("<Root>", "").replace("</Root>", "") + "</Root>";
            if (window.ActiveXObject) {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml
                Save = parser.parseFromString(Data, 'text/xml');
            }
           
            if ($(xmlSave).find("Root") != undefined && $(xmlSave).find("Root").find("Tb") != undefined) {
                $(xmlSave).find("Root").find("Tb").find("StartDate").filter(function () { return $(this).text() == "" }).each(function () {
                    PersonID = $(this).siblings("PersonID").text();
                    $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").each(function () {
                        if ($(this).attr("PersonID") != undefined) {
                            if ($(this).attr("PersonID") == PersonID) {
                                Personcode = $(this).attr("PersonCode")
                                PersonName = $(this).find("td:eq(3)").find("span").text()
                            }
                        }
                    });
                    messageDate = "تاريخ شروع شماره پرسنلی " + Personcode + "به نام  " + PersonName + "بایدوارد شود";
                    CheckDate = false;
                });
                if (CheckDate == true) {
                    $(xmlSave).find("Root").find("Tb").find("EndtDate").filter(function () { return $(this).text() == "" }).each(function () {
                        PersonID = $(this).siblings("PersonID").text();
                        $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").each(function () {
                            if ($(this).attr("PersonID") != undefined) {
                                if ($(this).attr("PersonID") == PersonID) {
                                    Personcode = $(this).attr("PersonCode")
                                    PersonName = $(this).find("td:eq(3)").find("span").text()
                                }
                            }
                        });
                        messageDate = "تاريخ شروع شماره پرسنلی " + Personcode + "به نام  " + PersonName + "بایدوارد شود";
                        CheckDate = false;
                    });
                }
            }
            if (messageDate != "")
                alert(messageDate);
            return CheckDate;
        }
        //--------------------------------
        function OnClickBtnSave() {
            AddNewMemberXml();
            if (CheckGridForDate()  && NotEmpty()) {
                OpenModelPopup();
                var StrXmlSave = "<Root>" + $("#" + MasterObj + "txtSave").val().replace("</Root>", "").replace("<Root>", "") + $("#" + MasterObj + "txtSaveNewMember").val().replace("<Root>", "").replace("</Root>", "") + "</Root>";
                $.ajax({
                    type: "POST",
                    url: "DefineGroupNew.aspx/ModifyGroupAndMembers?SubmitMode=Ajax",
                    contentType: "application/json; charset=utf-8",
                    //data: "{SaveXml:'" + StrXmlSave + "' ,GroupID:'" + $("#" + MasterObj + "txtGroupID").val() + "',GroupName:'" + $("#txtGroupName").val() + "' ,Category:'" + $("#" + MasterObj + "CmbCategory").val() + "' ,Acronym:'" + $("#txtAcronymName").val() + "' ,DateManage:'" + DateManage.toString() + "' ,Description:'" + $("#Descript").val() + "',SystemID:'" + $("#" + MasterObj + "txtSystemID").val() + "',SDate:'" + SDate + "' ,EDate:'" + EDate + "',Active:" + ($("#RdActive").attr("checked") == true ? 1 : 0) + ",ISShift:" + ($("#RDShift").attr("checked") == true ? 1 : 0) + ", CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                    data: "{SaveXml:'" + StrXmlSave + "' ,GroupID:'" + $("#" + MasterObj + "txtGroupID").val() + "',GroupName:'" + $("#txtGroupName").val() + "' ,Category:'" + $("#" + MasterObj + "CmbCategory").val() + "' ,Acronym:'" + $("#txtAcronymName").val() + "' ,DateManage:'" + DateManage.toString() + "' ,Description:'" + $("#Descript").val() + "',SystemID:'" + $("#" + MasterObj + "txtSystemID").val() + "',SDate:'1390/01/01' ,EDate:'1399/12/29',Active:1,ISShift:1, CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                    success: function (Data) {
                        CloseModelPopup();
                        var xmlSave;
                        if (window.ActiveXObject) {
                            xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                            xmlSave.async = 'false';
                            xmlSave.loadXML(Data.d);
                        } else {
                            var parser = new DOMParser();
                            xmlSave = parser.parseFromString(Data.d, 'text/xml');
                        }
                        $("#" + MasterObj + "txtGroupID").val($(xmlSave).find("NewDataSet").find("ShowMessage").find("ID").text());

                        if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "1") {
                            SetMsg($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())
                            $("#" + MasterObj + "txtSave").val("<Root></Root>")
                            $("#" + MasterObj + "txtSaveNewMember").val("<Root></Root>");
                            ClearGrid();
                            $("#" + MasterObj + "txtSubmit").val("Search");
                            $("#" + MasterObj + "BtnSubmit").click();
                        }
                        else
                            if ($(xmlSave).find("NewDataSet").find("ShowMessage").find("Validate").text() == "2") {
                                CreateGridConflict($(xmlSave));
                            }
                            else
                                alert($(xmlSave).find("NewDataSet").find("ShowMessage").find("Message").text())

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        CloseModelPopup();
                        alert("ذخيره با خطا مواجه شد");
                    }
                });
            }
    }
        //---------------------------------
    function CreateGridConflict(Xml) {
        $("#DivShowConflict").html("<table><tr><td class='CssHeaderStyle' style='width:100' align='center'>کد پرسنلي</td><td class='CssHeaderStyle' style='width:200' align='center'>نام پرسنل</td><td class='CssHeaderStyle' style='width:100' align='center'>بازه تاريخ</td><td class='CssHeaderStyle' style='width:200' align='center'>بازه تداخل </td><td class='CssHeaderStyle' style='width:150' align='center'>گروه شیفتی </td></tr></table>");
        Xml.find("NewDataSet").find("ConflictResult").each(function () {
            $("#DivShowConflict").find("table").append("<tr><td class='CssConfictItemStyle' >" + $(this).find("PCode").text() + "</td><td class='CssConfictItemStyle' >" + $(this).find("PName").text() + "</td><td class='CssConfictItemStyle' >" + $(this).find("SDate").text() + "&nbsp;&nbsp; &nbsp;" + $(this).find("EDate").text() + "</td><td class='CssConfictItemStyle' >" + $(this).find("ConflicSDate").text() + "&nbsp;&nbsp; &nbsp;" + $(this).find("ConflicEDate").text() + " </td><td class='CssConfictItemStyle' >" + $(this).find("GroupName").text() + " </td></tr>");
        });
        $("#DivDialogConflict").show("slow");
        }
        //---------------------------------
        function AddNewMemberXml() {
            $("#" + MasterObj + "txtSaveNewMember").val("<Root>");
            $("#TblGroupMember").find("tr").each(function () {
                if (!$(this).hasClass("header") && $(this).find("td:eq(1)").find("input").attr("checked")) {
                    $("#" + MasterObj + "txtSaveNewMember").val($("#" + MasterObj + "txtSaveNewMember").val() + "<Tb><RowNumber></RowNumber><Selected>" + ($(this).find("td:eq(1)").find("input").attr("checked") ? "1" : "0") + "</Selected><PersonID>" + $(this).attr("PersonID") + "</PersonID><StartDate>" + CorrectDate($(this).find("td:eq(4)").find("input:eq(1)").val().substring(0, 10)) + "</StartDate><EndDate>" + CorrectDate($(this).find("td:eq(5)").find("input:eq(1)").val().substring(0, 10)) + "</EndDate><OldSDate></OldSDate><OldEDate></OldEDate></Tb>");
                }
            });
            $("#" + MasterObj + "txtSaveNewMember").val($("#" + MasterObj + "txtSaveNewMember").val() + "</Root>");            
       }
        //---------------------------------
        function onclickSearchImg() {
            var Code = $("#" + MasterObj + "CmbPerson_txtPCode").val();
            $("#TblGroupMember").find("tr[PersonCode=" + Code + "]").addClass("CssRowSearch");
            $("#" + MasterObj + "txtPersonCode").val(Code);
            $("#" + MasterObj + "txtSubmit").val("Search");
            $("#" + MasterObj + "BtnSubmit").click();
        }
        //---------------------------------
        function onchangeCheck(obj) {
            //برای حالت تغییر چک باکس سه لول باید بیرون آمد تا به ردیف برسیم ولی در حالت تغییر تاریخ ها باید دو لول بیرون آمد 
            // این تفاوت به خاطر تگ Span است که خود سیستم برای چک باکس می سازد 
            var Row = obj.parentElement.parentElement;
            if (Row.tagName != "TR")
            //---------------------------
                Row = Row.parentElement;

            var xmlSave;
            var Data = $("#" + MasterObj + "txtSave").val();
            if (window.ActiveXObject) {
                xmlSave = new ActiveXObject('Microsoft.XMLDOM');
                xmlSave.async = 'false';
                xmlSave.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xmlSave = parser.parseFromString(Data, 'text/xml');
            }
            //---------------------------حذف از ایکس ام ال تغییرات به دلیل اینکه می توان مجددا آن را ساخت  
            if ($(xmlSave).find("Root") != undefined && $(xmlSave).find("Root").find("Tb") != undefined) {
                $(xmlSave).find("Root").find("Tb").find("RowNumber").filter(function () { return $(this).text() == $(Row).attr("GMID") }).each(function () {
                    xmlSave.childNodes(0).removeChild($(this).parent(0)[0]);
                });
                $("#" + MasterObj + "txtSave").val(xmlSave.xml != undefined ? xmlSave.xml : (new window.XMLSerializer()).serializeToString(xmlSave));
            }
            //------------------------ایکس ام ال مربوط به تغییرات اعضای قدیمی گروه 
            //-----------------------تاریخ قدیمی موجود برای ذخیره اهمیت دارد چون جدول فیلد یکتا ندارد           
            var xmlN;
            var OldSDate = "", OldEDate = "";
            OldSDate = CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal"));
            OldEDate = CorrectDate(Row.cells(5).firstChild.getAttribute("RealVal"));
            var RowNumber
            if (window.ActiveXObject) {
                xmlN = new ActiveXObject('Microsoft.XMLDOM');
                xmlN.async = 'false';
                xmlN.loadXML("<Root><Tb><RowNumber>" + $(Row).attr("GMID").toString() + "</RowNumber><Selected>" + ($(Row).find("td:eq(1)").find("input").attr("checked") ? "1" : "0") + "</Selected><PersonID>" + $(Row).attr("PersonID") + "</PersonID><StartDate>" + CorrectDate(Row.cells(4).firstChild.value) + "</StartDate><EndDate>" + CorrectDate(Row.cells(5).firstChild.value) + "</EndDate><OldSDate>" + OldSDate + "</OldSDate><OldEDate>" + OldEDate + "</OldEDate></Tb></Root>");
            } else {
                var parser = new DOMParser();
                xmlN = parser.parseFromString("<Root><Tb><RowNumber>" + $(Row).attr("GMID").toString() + "</RowNumber><Selected>" + ($(Row).find("td:eq(1)").find("input").attr("checked") ? "1" : "0") + "</Selected><PersonID>" + $(Row).attr("PersonID") + "</PersonID><StartDate>" + CorrectDate(Row.cells(4).firstChild.value) + "</StartDate><EndDate>" + CorrectDate(Row.cells(5).firstChild.value) + "</EndDate><OldSDate>" + OldSDate + "</OldSDate><OldEDate>" + OldEDate + "</OldEDate></Tb></Root>", 'text/xml');
            }          
            $(xmlSave).children(0).append($(xmlN).find("Root").find("Tb")[0]);
            $("#" + MasterObj + "txtSave").val(xmlSave.xml != undefined ? xmlSave.xml : (new window.XMLSerializer()).serializeToString(xmlSave));           
            SetColorFul(Row);
        }
        function SetColorFul(Row) {
            //-----------------------     
            if ($(Row).find("td:eq(1)").find("input").attr("checked")) {
                if ($(Row).find("td:eq(1)").find("input").hasClass("CssUnSelect"))
                    $(Row).find("td:eq(1)").find("input").removeClass("CssUnSelect");
            }
            else if (!$(Row).find("td:eq(1)").find("input").attr("checked")) {
                $(Row).find("td:eq(1)").find("input").addClass("CssUnSelect");
            }
            if (CorrectDate(Row.cells(4).firstChild.value.trim()) != CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal").trim())) {
                $(Row).find("td:eq(4)").find("input").addClass("CssGreen");
            }

            if (CorrectDate(Row.cells(5).firstChild.value.trim()) != CorrectDate(Row.cells(5).firstChild.getAttribute("RealVal").trim())) {
                $(Row).find("td:eq(5)").find("input").addClass("CssGreen");
            }
            if (!(CorrectDate(Row.cells(4).firstChild.value.trim()) != CorrectDate(Row.cells(4).firstChild.getAttribute("RealVal").trim()))
            && !(CorrectDate(Row.cells(5).firstChild.value.trim()) != CorrectDate(Row.cells(5).firstChild.getAttribute("RealVal").trim()))) {
                $(Row.cells(4).firstChild).removeClass("CssGreen");
                $(Row.cells(5).firstChild).removeClass("CssGreen");
            }

        }
        //----------------------------------
        function ReverseDate(Date) {
            if (Date == "") return "";
            return Date.split("/")[2] + "/" + Date.split("/")[1] + "/" + Date.split("/")[0];
        }
        function CorrectDate(Date) {        
            if (Date.split("/")[0].length == 4)
                return Date;
            else return ReverseDate(Date);
        }
        //--------------------------------------        
        function onclickImg(SelectedImage) {
            var Row = SelectedImage.parentElement;
            var url = "ShowGroupPersonDetail.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&PID=" + Row.PersonID + "&Name=" + Row.cells(3).innerText + "&Code=" + Row.cells(2).innerText;

            strOptions = "dialogHeight:400px;dialogWidth: 600px;center: Yes;help: no;status: no"
            Result = window.showModalDialog(encodeURI(url), "", strOptions)
        }
        //------------------------------------
        function OnClickHeaderChk(header) {
            $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").find("td:eq(1)").find("span").find("input").each(function () {
                if (!$(this.parentElement.parentElement).hasClass("header")) {
                    $(this).attr("checked", $(header).attr("checked"));
                    onchangeCheck(this);
                }
            });
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                $("#" + MasterObj + "txtPersonCode").val("");
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            $("#" + MasterObj + "txtPersonCode").val("");
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===================================================حذف سطری از گرید اعضای جدید که تیک آن برداشته می شود ============================================
        function onchangeCheckDelete(SelectedCheckBox) {         
            if (!$(SelectedCheckBox).attr("checked"))
                $(SelectedCheckBox.parentElement.parentElement).remove();
        }
        //======================================متابعت چکباکس ها از چکباکس هدر=========
        function onclickChkHeaderNewMembers(HeaderChk) {
            $("#TblGroupMember").find("tr").find("td:eq(1)").find("input").each(function () {
                if (!$(this.parentElement.parentElement).hasClass("header")) {
                    $(this).attr("checked", $(HeaderChk).attr("checked"));
                    onchangeCheckDelete(this);
                }
            });
        }
        //----------------------------------اعمال تغییرات در زمان Paging------
        function SetChange() {
            var xml;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML($("#" + MasterObj + "txtSave").val());
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString($("#" + MasterObj + "txtSave").val(), 'text/xml');
            }
            var GMID, XmlChanges;
            $("#" + MasterObj + "GrdGroupMember").find("TBODY").find("tr").each(function () {
                GMID = $(this).attr("GMID");
                XmlChanges = $(xml).find("Root").find("Tb").find("RowNumber").filter(function () { return $(this).text() == GMID });
                if (XmlChanges.length > 0) {
                    $(this).find("td:eq(1)").find("Span").find("Input").attr("checked", $(XmlChanges).siblings("Selected").text() == "1" ? true : false);
                    $(this).find("td:eq(4)").find("Input").val(ReverseDate($(XmlChanges).siblings("StartDate").text()));
                    $(this).find("td:eq(5)").find("Input").val(ReverseDate($(XmlChanges).siblings("EndDate").text()));
                    SetColorFul(this);
                }
            });
        }
        //------------------
        function onclickImgShowNewMember() {         
            $("#DivNewMember").toggle("slow");
        
        }
        //------------------
        function onclickBtnCancel() {
            $("#DivDialogConflict").hide("slow");
        }
        //---------------
        function onclickBtnOK() {
            DateManage = 1;
            $("#DivDialogConflict").hide("slow");
            OnClickBtnSave();
        }
        //---------------
        function CheckValidDate(TextDate) {
            var Row = TextDate.parentElement.parentElement;
            var SDate =CorrectDate($(Row).find("td:eq(4)").find("input:eq(0)").val());
            var EDate =CorrectDate($(Row).find("td:eq(5)").find("input:eq(0)").val());
            if (ReplaceAll(SDate, "/", "") > ReplaceAll(EDate, "/", "")) {
                alert("تاریخ شروع از خاتمه بزرگتر است ");
                $(TextDate).val($(TextDate).attr("RealVal"));
                TextDate.focus();
                TextDate.select()
            }
            else {
                $(TextDate).val($(TextDate).val().replace('undefined', '01'));
                if ($(TextDate).val().indexOf('undefined') != -1) {
                    alert('فرمت تاریخ اشتباه است')
                    TextDate.focus();
                    TextDate.select()
                    return
                }
                if ($(TextDate).val().substr(8, 2) == '') {
                    alert('فرمت تاریخ اشتباه است')
                    TextDate.focus();
                    TextDate.select()
                    $(TextDate).val('')
                    return
                }
                if (!ChkKeyOfDate($(TextDate).val())) {
                    alert('فرمت تاریخ اشتباه است')
                    TextDate.focus();
                    TextDate.select()
                    $(TextDate).val('')
                    return
                }
                onchangeCheck(TextDate);
            }
        }
        //------------------------
        function CheckValidDateNewMember(TextDate) {
            var Row = TextDate.parentElement.parentElement;
            var SDate = CorrectDate($(Row).find("td:eq(4)").find("input:eq(0)").val());
            var EDate = CorrectDate($(Row).find("td:eq(5)").find("input:eq(0)").val());

            var TextForFocus = TextDate.previousSibling;            
            if (ReplaceAll(SDate, "/", "") > ReplaceAll(EDate, "/", "")) {
                alert("تاریخ شروع از خاتمه بزرگتر است ");
                $(TextDate).val($(TextDate).attr("RealVal"));              
                TextDate.focus();
                TextDate.select()
            }
            if ($(TextDate).val().indexOf('undefined') != -1) {
                alert('فرمت تاریخ اشتباه است')
                TextDate.focus();
                TextDate.select()
                return
            }
            if (SDate.indexOf('undefined') != -1) {
                alert('فرمت تاریخ اشتباه است')
                TextDate.focus();
                TextDate.select()
                return
            }
            if (EDate.indexOf('undefined') != -1) {
                alert('فرمت تاریخ اشتباه است')
                TextDate.focus();
                TextDate.select()
                return
            }
        }
        //-------------
        function OnChangeCmbPerson() {         
            $("#" + MasterObj + "txtPersonCode").val("");
        }
        //------------
        function OnCheckValidCodeName(obj) {
            var lenObj = obj.length
            var key
            var eventObj

            for (var i = 0; i < lenObj; i++) {
                eventObj = obj.substring(i, i + 1)
                
                key = eventObj.charCodeAt(0)

                if (((key >= 65) && (key <= 90)) || ((key >= 1570) && (key <= 1641)) || ((key >= 8194) && (key <= 8204)) ||
                     (key == 1670) || (key == 1740) || (key == 1705) || (key == 1662) || (key == 1711) || (key == 1688) ||
                     ((key >= 48) && (key <= 58)) || ((key >= 40) && (key <= 47)) || (key == 95) || (key == 247) ||
                     ((key >= 97) && (key <= 122)) || (key == 32)) {
                    if (i == lenObj - 1) {
                        return true
                    }
                }
                else {
                    return false;
                }
            }
        }
//***************************************************************
        function chkDayOfDate(TextDate, id, type) {
            var Row = TextDate.parentElement.parentElement;
            var SDate = CorrectDate($(Row).find("td:eq("+id+")").find("input:eq(0)").val());
            
            var tempDay = SDate.substr(8,2)
            var tempMonth = SDate.substr(5,2)
            var tempYear = SDate.substr(0, 4)

            var strYear = SDate.substr(0, 4)
            var strMonth = SDate.substr(5, 2)
            var strDay = SDate.substr(8, 2)

            var day = parseInt(tempDay);
            var month = parseInt(tempMonth);
            var year = parseInt(tempYear);

            //alert(tempDay.substring(0,1));
            if (tempDay.substring(0, 1) == "0")
                day = parseInt(tempDay.substring(1, 2));
            //alert(day);

            if (tempMonth.substring(0, 1) == "0")
                month = parseInt(tempMonth.substring(1, 2));
           

            if (parseInt(tempYear) < 100) {
                year = parseInt("13" + tempYear);
                //document.all.item(strUserControlID + "_txtYear").value = year;
            }

            if (strDay != "" && (day > 31 || day == 0)) {
                alert("فرمت روز اشتباه است");
                $(Row).find("td:eq(" + id + ")").find("input:eq(0)").val('');
                if (type == 1) {
                    onchangeDate(TextDate);
                    onchangeCheck(TextDate)
                }
                TextDate.select();
                return;
            }
            if (strMonth != "" && (month > 12 || month == 0)) {
                alert("فرمت ماه اشتباه است");
                $(Row).find("td:eq(" + id + ")").find("input:eq(0)").val('');
                if (type == 1) {
                    onchangeDate(TextDate);
                    onchangeCheck(TextDate)
                }
                TextDate.select();
                return;
            }
            if (strYear != "" && (year < 1300 && year > 100 || year == 100)) {
                alert("فرمت سال اشتباه است");
                $(Row).find("td:eq(" + id + ")").find("input:eq(0)").val('');
                if (type == 1) {
                    onchangeDate(TextDate);
                    onchangeCheck(TextDate)
                }
                TextDate.select();
                return;
            }

            if (strDay != "" && day == 31) {
                if (strMonth != "" && month > 6) {
                    alert("فرمت تاریخ اشتباه است");
                    $(Row).find("td:eq(" + id + ")").find("input:eq(0)").val('');
                    if (type == 1) {
                        onchangeDate(TextDate);
                        onchangeCheck(TextDate)
                    }
                    TextDate.select();
                    return;
                }
            }
//            if (SDate == '') {
//                alert("فرمت تاریخ اشتباه است");
//                $(Row).find("td:eq(" + id + ")").find("input:eq(0)").val('');
//                if (type == 1) {
//                    onchangeDate(TextDate);
//                    onchangeCheck(TextDate)
//                }
//                TextDate.select();
//                return;
            //}
        }
//***********************************************************        
        function getCntChar(subStr1, Str1) {
            var Str = new String
            Str = Str1 + ''
            if (Str1 == '')
                return (0)

            var subStr = new String
            subStr = subStr1 + ''
            if (subStr1 == '')
                return (0)

            var cnt
            cnt = 0
            for (j = 0; j < Str.length; ++j)
                if (Str.substring(j, j + subStr.length) == subStr)
                    cnt += 1
                return (cnt)

            }
            //naraftane tagirat dar pach