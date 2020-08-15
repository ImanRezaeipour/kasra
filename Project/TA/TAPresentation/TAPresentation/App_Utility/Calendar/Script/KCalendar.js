/*====================================================بهاره قدمي============================================*/
function F_OnkeyUpText(obj) {
    try {
        var key = window.event.keyCode
        if ((key > 47 && key < 58) || (key > 95 && key < 106)) {
            var len = (obj.value).length
            if (len >= 2 && obj.inputType != "Year") {
                switch (obj.inputType) {
                    case "Day":
                        if (!F_LeapPersian(document.getElementById(this.id + "_txtYear").value) && parseInt(obj.value, 10) > 29
                        && document.getElementById(this.id + "_txtMonth").value == 12
                        )//سال کبیسه
                        {
                            
                            obj.value = 29
                        }
                        else if (document.getElementById(this.id + "_txtMonth").value > 6 && parseInt(obj.value, 10) > 30)
                            obj.value = 30
                        else if (parseInt(obj.value, 10) > 31)
                            obj.value = 31
                        document.getElementById(this.id + "_txtMonth").focus()
                        window.event.keyCode = 0
                        break
                    case "Month":
                        if (parseInt(obj.value, 10) > 12)
                            obj.value = 12
                        document.getElementById(this.id + "_txtYear").focus()
                        window.event.keyCode = 0
                        break
                }
            }
            else if (len > 3 && obj.inputType == "Year") {
                document.getElementById(this.id + "_btnImg").focus()
            }
        }
    }
    catch (e)
    { }
}
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
function getArray(Str, Index, sep) {
    var j
    var i
    i = 0
    var items = new String
    items = Str
    var p = new String
    if (items != "") {
        j = items.search(sep)
        while (j <= items.length && i <= Index) {
            p = items.substring(0, j)
            if (j < 0) p = items.substring(0, items.length)
            j = j + 1
            items = items.substring(j, items.length)
            j = items.search(sep)
            if (j < 0) j = items.length + 1
            i = i + 1
        }
    }
    i = i - 1
    if (i == Index)
        return (p.substring(0, p.length))
    else
        return ('')
}
 function SHDtoInt(shd) {

    var sal, mah, roz, Tr
    var arr1, arr2, arr3


    var x = 0

    while (x < this.getCntChar('/', shd + "/")) {

        arr3 = this.getArray(shd + "/", x, '/')
        ++x
        arr2 = this.getArray(shd + "/", x, '/')
        ++x
        arr1 = this.getArray(shd + "/", x, '/')
        ++x
    }
    //alert(arr1)
    if (this.getCntChar('/', shd) == 2) {
        roz = arr3 - 1
        mah = arr2 - 1
        sal = arr1
        Tr = 0

        if (sal < 100)
            sal = 1300 + sal

        sal = sal - 1314

        while (sal < 0) {
            Tr = Tr - 36159 - 366
            sal = sal + 100
        }

        while (sal > 98) {
            Tr = Tr + 36159
            sal = sal - 99
        }

        if ((sal >= 0) && (sal <= 27))
            Tr = Tr + sal * 365 + parseInt(sal / 4)

        if ((sal >= 28) && (sal <= 60))
            Tr = Tr + sal * 365 + parseInt((sal - 1) / 4)

        if ((sal >= 61) && (sal <= 97))
            Tr = Tr + sal * 365 + parseInt((sal - 2) / 4)

        if (sal == 98)
            Tr = Tr + sal * 365 + parseInt((sal - 3) / 4)


        if (mah > 6)
            Tr = Tr + (mah - 6) * 30 + 186
        else
            Tr = Tr + mah * 31

        return (Tr + roz)

    }
    else {
        //alert("اشكال در تاريخ شمسي")
        return 0
    }


}


//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_OnFocus(obj) {
    obj.select()
}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_onkeydownText(obj) {
    try {

        //---------Arrow Up And Down
        this.id = F_GetUserControlID(event.srcElement);
        if (event.keyCode == 38) {
            var vInput;
            if (obj.value != "")
                vInput = parseInt(obj.value, 10)
            else
                vInput = 0
            vInput = vInput + 1;
            switch (obj.inputType) {
                case "Day":
                    if (document.getElementById(this.id + "_txtYear").value != "" && !F_LeapPersian(document.getElementById(this.id + "_txtYear").value) && parseInt(obj.value, 10) == 29)
                        return
                    if (vInput > 30 && document.getElementById(this.id + "_txtMonth").value > 6)
                        return
                    else if (vInput > 31)
                        return
                    break
                case "Month":
                    if (vInput > 6 && parseInt(document.getElementById(this.id + "_txtDay").value, 10) == 31)
                        document.getElementById(this.id + "_txtDay").value = 30
                    if (vInput > 12)
                        return
                    break
            }
            obj.value = vInput;
        }
        else if (event.keyCode == 40) {
            var vInput = parseInt(obj.value, 10)
            vInput = vInput - 1;
            if (vInput < 1)
                return
            obj.value = vInput;
        }
        //--------------------------
    }
    catch (e)
    { }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_OnKeyDownInt(number) {
    try {
        if (event.keyCode == 13) {  //بهاره قدمي
            event.keyCode = 9;
            return event.keyCode
        }
        var key = window.event.keyCode
        window.event.returnValue =
		    (
			    ((key >= 96) && (key <= 105)) ||
			    ((key >= 48) && (key <= 57)) ||
			    (key == 8) || (key == 9) || (key == 46) ||
			    ((key >= 35) && (key <= 40))
		    )
    }
    catch (e)
    { }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_GetCal() {
    try {

        var strUserControlID = F_GetUserControlID(event.srcElement);
        var vTxtName = strUserControlID + "_txtHidden";
        var vBtnName = strUserControlID + "_btnImg";
        this.id = strUserControlID;
        setActiveStyleSheet("blue");
        var popupCal1 = Calendar.setup({
            inputField: vTxtName,  // id of the input field
            button: vBtnName,   // trigger for the calendar (button ID)
            ifFormat: "%d/%m/%Y",       // format of the input field
            dateType: "jalali",
            weekNumbers: false,
            LangNumbers: "no",
            showOthers: true,
            ShowsTime: "no",
            flatCallback: dateChanged,          // our callback function
            dateStatusFunc: ourDateStatusFunc

        });
        if (document.getElementById(strUserControlID + "_txtFlag").value == "") {
            document.getElementById(strUserControlID + "_txtFlag").value = "1";
            document.getElementById(strUserControlID + "_btnImg").onclick();
        }
    }
    catch (e) {
    }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_onChangeHidden(obj) {
    try {
        if (obj.value != "") {
            var str = obj.value
            var arr;
            arr = str.split('/')
            var strUserControlID = this.id;

            strUserControlID = F_GetUserControlID(obj);
            this.id = strUserControlID;

            document.getElementById(strUserControlID + "_txtDay").value = arr[0]
            document.getElementById(strUserControlID + "_txtMonth").value = arr[1]
            document.getElementById(strUserControlID + "_txtYear").value = arr[2].substr(0, 4)
            obj.value = obj.value.substr(0, 10)
        }
    }
    catch (e) {
    }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_OnblurAllText(obj) {
    try {
        if (obj.value == "")
            return
        var strUserControlID = this.id;
        if (this.id == undefined)
            return
        /*------------------------*/    //Zero
        if (obj.value == 0) //Tak Raghami
            obj.value = "01"
        /*------------------------*/
        if (obj.value.length > 0 && obj.value.length < 2) //Tak Raghami
            obj.value = "0" + obj.value
        /*------------------------*/
        if (obj.id == strUserControlID + "_txtYear" && obj.value.length > 0 && obj.value.length < 3)
            obj.value = "13" + obj.value
        /*------------------------*/
        if (document.getElementById(strUserControlID + "_txtYear").value != "" && !F_LeapPersian(document.getElementById(strUserControlID + "_txtYear").value) && document.getElementById(strUserControlID + "_txtMonth").value == 12
        && parseInt(obj.value,10)>29 ) //سال کبیسه
        {   
            document.getElementById(strUserControlID + "_txtDay").value = 29
        }
        /*------------------------*/
        var v_Date = document.getElementById(strUserControlID + "_txtDay").value + "/" + document.getElementById(strUserControlID + "_txtMonth").value + "/" + document.getElementById(strUserControlID + "_txtYear").value
        if (v_Date != "//")
            document.getElementById(strUserControlID + "_txtHidden").value = v_Date
        else
            document.getElementById(strUserControlID + "_txtHidden").value = ""
    }
    catch (e) {
    }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function F_GetUserControlID(obj) {
    try {
        var strUserControlID = "";
        var iCounter = 0;

        while (++iCounter < 20 && obj != null && obj.IsMainTable == null)
            obj = obj.parentElement;

        if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true")
            strUserControlID = obj.UserControlID;
        return strUserControlID;
    }
    catch (e) {
    }

}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//  LEAP_PERSIAN  --  Is a given year a leap year in the Persian calendar ?
function F_LeapPersian(year) {
    return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>