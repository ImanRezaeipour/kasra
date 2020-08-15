var Shift;
//================zahraMoslehi===============
function F_adbsghh(obj) {

    var DayNum;
    var _FullDayNames;
    if (obj != "//") {
        if ((this.SHDtoInt(obj)) <= 0) {
            DayNum = ((this.SHDtoInt(obj)) % 7) + 7;
            DayNum = DayNum % 7;
        }
        else {
            DayNum = (this.SHDtoInt(obj) - 1) % 7;
        }
        this._FullDayNames = ['شنبه', 'يكشنبه', 'دوشنبه', 'سه شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه']

        return this._FullDayNames[DayNum];
    }
    else
        return ""

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
function F_GetUserControlID(obj) {
    // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 

    try {
        var strUserControlID = "";
        var iCounter = 0;

        while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
            obj = obj.parentElement;

        }
        if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
            strUserControlID = obj.UserControlID;

        }
        return strUserControlID;
    }
    catch (e) {
    }
}
//===============================
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
//===============================
function onchangeTxtCalender() {
    this.id = F_GetUserControlID(event.srcElement);

    var obj = document.getElementById(this.id + "_txtDateNow").value

    var Year = obj.substr(0, 4)
    var Month = obj.substr(5, 2)
    var Day = obj.substr(8, 2)

    if (document.getElementById(this.id + "_txtCalendar").value != "") {
        var Date = "";
        var s = document.getElementById(this.id + "_txtCalendar").value.split('/');
        if (s.length > 3) {

            document.getElementById(this.id + "_txtYear").value = ""
            document.getElementById(this.id + "_txtMonth").value = "";
            document.getElementById(this.id + "_txtDay").value = "";
            document.getElementById(this.id + "_txtCalendar").value = "";
            return;
        }
        if (s[2] != null) {
            var sal;
            sal = s[2].split('  ');
        }
        if ((s[2] != null && sal[0].length > 4) || (s[1] != null && s[1].length > 2) || (s[0] != null && s[0].length > 2)) {

            document.getElementById(this.id + "_txtYear").value = ""
            document.getElementById(this.id + "_txtMonth").value = "";
            document.getElementById(this.id + "_txtDay").value = "";
            document.getElementById(this.id + "_txtCalendar").value = "";
            return;
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
                Date = Date + s[0]
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

        Date = Date.substr(8, 2) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4)
        document.getElementById(this.id + "_txtCalendar").value = Date
        document.getElementById(this.id + "_txtYear").value = document.getElementById(this.id + "_txtCalendar").value.substr(6, 4)
        document.getElementById(this.id + "_txtMonth").value = CorrectlyCheked(document.getElementById(this.id + "_txtCalendar").value.substr(3, 2), "Month")
        document.getElementById(this.id + "_txtDay").value = CorrectlyCheked(document.getElementById(this.id + "_txtCalendar").value.substr(0, 2), "Day")

        document.getElementById(this.id + "_txtCalendar").value = document.getElementById(this.id + "_txtDay").value + "/" + document.getElementById(this.id + "_txtMonth").value + "/" + document.getElementById(this.id + "_txtYear").value
        //==========برای جلوگیری از وارد کردن فرمت نادرست تاریخ ================
        var ObjCalendar = document.getElementById(this.id + "_txtYear").value + document.getElementById(this.id + "_txtMonth").value + document.getElementById(this.id + "_txtDay").value
        var lenObj = ObjCalendar.length
        var key
        var eventObj
        for (var i = 0; i < lenObj; i++) {
            eventObj = ObjCalendar.substring(i, i + 1)
            key = eventObj.charCodeAt(0)
            if (!((((key >= 48) && (key <= 58)) || (key == 32) || (key == 47) || (key == 189) ||
			(key == 191) ||
			(key == 67) ||
            (key == 111) || (key == 17) || (key == 231) ||
            (key == 8) || (key == 9) ||
			((key >= 35) && (key <= 40))))) {
                alert("فرمت تاريخ وارد شده درست نمی باشد ");
                document.getElementById(this.id + "_txtCalendar").value = "";
                document.getElementById(this.id + "_txtMonth").value = "";
                document.getElementById(this.id + "_txtDay").value = "";
                document.getElementById(this.id + "_txtYear").value = "";
                return
            }
        }
        //======================================================================

        document.getElementById(this.id + "_txtCalendar").value = document.getElementById(this.id + "_txtCalendar").value + "  " + F_adbsghh(document.getElementById(this.id + "_txtCalendar").value)

    }
    else {
        document.getElementById(this.id + "_txtYear").value = "";
        document.getElementById(this.id + "_txtMonth").value = "";
        document.getElementById(this.id + "_txtDay").value = "";
    }
}
//===============================
function CorrectlyCheked(obj, str) {
    if (str == "Month")
        if (obj > 12)
        return 12
    else
        return obj
    if (str == "Day") {
        if (!F_LeapPersian(document.getElementById(this.id + "_txtYear").value) && obj > 29
                        && document.getElementById(this.id + "_txtMonth").value == 12
                        )//سال کبیسه
        {
            return 29
        }
        if (document.getElementById(this.id + "_txtMonth").value > '06' && obj > 30)
            return 30
        else if (obj > 31)
            return 31
        else
            return obj
    }
}
//===============================
function onClickForFocus() {
    this.id = F_GetUserControlID(event.srcElement);
    document.getElementById(this.id + "_txtCalendar").focus();
    document.getElementById(this.id + "_txtCalendar").select();
}
//===============================
function datechk(val) {


    if ((val != "") && !this.Isvaliddate(val)) {
        //alert("تاريخ شمسي اشتباه")
        return false

    }

    else
        if (val != "") {
        var arr1, arr2, arr3
        var x = 0
        while (x < this.getCntChar('/', val + "/")) {
            arr3 = this.getArray(val + "/", x, '/')
            ++x
            arr2 = this.getArray(val + "/", x, '/')
            ++x
            arr1 = this.getArray(val + "/", x, '/')
            ++x
        }
        arr1 = new Number(arr1)
        arr2 = new Number(arr2)
        arr3 = new Number(arr3)

        if (arr1 < 100)
            century = "13"
        else
            century = ""

        if (arr2 < 10)
            val = century + "" + arr1 + "/0" + arr2
        else
            val = century + "" + arr1 + "/" + arr2

        if (arr3 < 10)
            val += "/0" + arr3
        else
            val += "/" + arr3


        return val
    }
}
//===============================
function isshleap(sal) {
    var ybase_sh, L1

    if (sal < 100)
        sal = sal + 1300


    ybase_sh = parseInt((sal - 125) / 99) * 99 + 125


    L1 = ((sal - ybase_sh) % 99)
    if (L1 >= 98)
        return (((L1 - 89) % 4) == 0)
    else {
        if (L1 >= 61)
            return (((L1 - 62) % 4) == 0)
        else
            if (L1 >= 28)
            return (((L1 - 29) % 4) == 0)
        else
            return ((L1 % 4) == 0)


    }
    //return true
}
//===============================
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
//===============================
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
//===============================
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
//===============================
function revDateChk(val) {


    //    if ((val != "") && !this.Isvaliddate(val)) {
    //        //alert("تاريخ شمسي اشتباه")
    //        return false

    //    }

    //    else
    if (val != "") {

        var arr1, arr2, arr3
        var x = 0
        while (x < this.getCntChar('/', val + "/")) {

            arr1 = this.getArray(val + "/", x, '/')
            ++x
            arr2 = this.getArray(val + "/", x, '/')
            ++x
            arr3 = this.getArray(val + "/", x, '/')
            ++x
        }


        arr1 = new Number(arr1)
        arr2 = new Number(arr2)
        arr3 = new Number(arr3)

        if (arr3 < 100)
            century = "13"
        else
            century = ""

        if (arr2 < 10)
            val = "0" + arr2 + "/" + century + "" + arr3
        else
            val = arr2 + "/" + century + "" + arr3

        if (arr1 < 10)
            val = "0" + arr1 + "/" + val
        else
            val = arr1 + "/" + val


        return val
    }


}
//=========================
function F_LeapPersian(year) {
    return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
}
//=========================
function F_onkeydownText(obj) {
    //=========برای جلوگیری از واردن فرمت های نادرست=======
    var key = window.event.keyCode

    if (!Shift) {
        if (key == 16)
            Shift = true;
        else {
            window.event.returnValue = (((key >= 48) && (key <= 58)) || (key == 32) || (key == 47) || (key == 189) || (key == 17) ||
			            (key == 191) || (key == 231) ||
			            (key == 67) ||
                        (key == 111) ||
                        (key == 8) || (key == 9) ||
                        ((key >= 96) && (key <= 105)) ||
			            ((key >= 35) && (key <= 40)));
        }
    }
    else if (Shift) {
        window.event.returnValue =
		            (
			        ((key >= 65) && (key <= 90))
	      	        )
        Shift = false;
    }
    //==========================================================
    var str;
    str = obj.value.substring(0, 10)
    str = str.substr(6, 4) + "/" + str.substr(3, 2) + "/" + str.substr(0, 2)
    var sal, mah, ruz
    var salNew, mahNew, ruzNew
    sal = str.substr(0, 4)
    mah = str.substr(5, 2)
    ruz = str.substr(8, 2)
    salNew = str.substr(0, 4)
    mahNew = str.substr(5, 2)
    ruzNew = str.substr(8, 2)
    this.id = F_GetUserControlID(event.srcElement);
    //کلید بالا برای اضافه شده روز
    if (event.keyCode == 38) {

        ruz = Math.abs(ruz) + 1
        if (!F_LeapPersian(sal) && ruz > 29
                        && mah == 12
                        )//سال کبیسه
        {
            //                ruzNew= 29
            ruzNew = 01
            mahNew = 01
            salNew = Math.abs(sal) + 1

        }
        else if (mah == '12' && ruz > 30) {
            //ruzNew = 30
            ruzNew = 01
            mahNew = 01
            salNew = Math.abs(sal) + 1

        }
        //اگر بیش از 30روز بود و نیمه دوم سال
        else if (mah > '06' && ruz > 30) {
            //ruzNew = 30
            ruzNew = 01
            mahNew = Math.abs(mah) + 1

        }
        //اگر نیمه اول سال و بیش از 31بود
        else if (ruz > 31) {
            //                ruzNew = 31
            ruzNew = 01
            mahNew = Math.abs(mah) + 1

        }
        else
            ruzNew = ruz
    }
    //کلید پایین برای کم کردن روز
    if (event.keyCode == 40) {

        ruz = Math.abs(ruz) - 1

        if (ruz < 1) {
            ruzNew = 1
            if (mah == '01') {
                mahNew = 12
                salNew = Math.abs(sal) - 1
            }
            else
                mahNew = Math.abs(mah) - 1
            if (!F_LeapPersian(salNew) && mahNew == 12

                        )//سال کبیسه نبوو
            {
                ruzNew = 29
            }
            //سال کبیسه بود
            else if (mahNew == '12') {
                ruzNew = 30

            }
            //ماه 12 نبود و نیمه دوم سال بود
            else if (mahNew > '06')
                ruzNew = 30
            else
            //ماه 12 نبود و نیمه اول سال بود
                ruzNew = 31
        }
        else
            ruzNew = ruz
    }
    //کلید راست برای اضافه شدن ماه
    if (event.keyCode == 39) {


        mah = Math.abs(mah) + 1

        if (Math.abs(mah) > 12)
            mahNew = 1
        else
            mahNew = mah
    }
    //کلید چپ برای کم شدن ماه
    if (event.keyCode == 37) {

        mah = Math.abs(mah) - 1

        if (Math.abs(mah) < 1)
            mahNew = 12
        else
            mahNew = mah
    }
    if (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) {

        document.getElementById(this.id + "_txtCalendar").value = ruzNew.toString() + "/" + mahNew.toString() + "/" + salNew.toString()

        onchangeTxtCalender();
    }
}