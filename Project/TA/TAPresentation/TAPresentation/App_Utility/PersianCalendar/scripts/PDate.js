/****************************************************Arrays****************************************************/

var PersianMonthName = new Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دي", "بهمن", "اسفند");

var PersianDayName = new Array(
              new Array('شنبه', 'يکشنبه', 'دوشنبه', 'سه شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه'),
              new Array('شنبه', 'يک', 'دو', 'سه', 'چهار', 'پنج', 'جمعه')
              );

var PersianMonthDays = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
var PersianHoliday = new Array(
            new Array("عيد نوروز", "عيد نوروز", "عید نوروز", "عید نوروز", "", "", "", "", "", "", "", "روز جمهوری اسلامی ایران", "روز طبیعت", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "رحلت امام خمینی (ره) بنیانگذار جمهوری اسلامی ایران", "قیام خونین 15 خرداد", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "پيروزی انقلاب اسلامی ایران و سقوط نظام شاهنشاهی", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "روز ملی شدن صنعت نفت ایران", "", "")
            );

var IslamicHoliday = new Array(
            new Array("", "", "", "", "", "", "", "", "تاسوعای حسینی", "عاشورای حسینی", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "اربعین حسینی", "", "", "", "", "", "", "", "رحلیت حضرت رسول اکرم (ص) و شهادت حضرت امام حسن مجتبی (ع)", "", "شهادت حضرت امام رضا (ع)", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "میلاد حضرت رسول اکرم (ص) و میلاد حضرت امام جعفر صادق (ع)", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "شهادت حضرت فاطمه زهرا سلام الله علیها", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "ولادت حضرت امام علی (ع)", "", "", "", "", "", "", "", "", "", "", "", "", "", "مبعث حضرت روسل اکرم (ص)", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "ولادت حضرت قائم (عج)", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "شهادت حضرت امام علی (ع)", "", "", "", "", "", "", "", "", "", ""),
            new Array("عید سعید فطر", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "شهادت حضرت امام جعفر صادق (ع)", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""),
            new Array("", "", "", "", "", "", "", "", "", "عید سعید قربان", "", "", "", "", "", "", "", "عید غدیر خم", "", "", "", "", "", "", "", "", "", "", "", "", "")
            );
/****************************************************Arrays****************************************************/


/********************************************* Persion Date ***********************START*****************/
function IsShLeap(sal) {
    var ybase_sh, L1;
    if (sal < 100)
        sal = sal + 1300;

    if ((sal % 4) == 3)
        return true;
    else
        return false;
}
/********************************************************************************************************/
function IsValidDate(PD) {
    var le, t1, t2, sal, mah, roz, arr;
    arr = PD.split("/");
    if (arr.length == 3) {
        roz = parseInt(arr[2], 10);
        mah = parseInt(arr[1], 10);
        sal = parseInt(arr[0], 10);

        le = 0;
        if (sal < 100)
            sal = sal + 1300;

        if (IsShLeap(sal))
            le = 1

        t1 = (mah >= 1) && (mah <= 12);
        t2 = (roz >= 1) && (roz <= 29 + le);
        t2 = t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11)));
        t2 = t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6)));
        return (t1 && t2);
    }
    else
        return false;
}

function IsValidDateRev(PD) {
    var le, t1, t2, sal, mah, roz, arr;
    arr = PD.split("/");
    if (arr.length == 3) {
        roz = parseInt(arr[0], 10);
        mah = parseInt(arr[1], 10);
        sal = parseInt(arr[2], 10);

        le = 0;
        if (sal < 100)
            sal = sal + 1300;

        if (IsShLeap(sal))
            le = 1

        t1 = (mah >= 1) && (mah <= 12);
        t2 = (roz >= 1) && (roz <= 29 + le);
        t2 = t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11)));
        t2 = t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6)));
        return (t1 && t2);
    }
    else
        return false;
}

/********************************************************************************************************/
function DateChk(PD) {

    var TP;
    TP = new String;

    TP = PD.replace(" ", "");

    if (TP != "" && !IsValidDate(TP)) {

        //alert("! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد");
        return false;
    }
    else {
        var arr;
        arr = TP.split("/");

        if (arr[0] < 100)
            arr[0] = parseInt(arr[0], 10) + 1300;

        if (arr[2].length == 1)
            arr[2] = "0" + arr[2];

        if (arr[1].length == 1)
            arr[1] = "0" + arr[1];

        return arr[0] + "/" + arr[1] + "/" + arr[2];
    }

}
/********************************************************************************************************/
function IntToShd(roz) {
    var leap, Esal, sal, Mah, base, tag;
    sal = 0;
    Mah = 0;
    leap = 0;
    tag = 0;
    Esal = 0;

    while (roz < 00000) {
        roz = roz + 36159;
        sal = sal - 99;
    }

    while (roz > 36158) {
        roz = roz - 36159;
        sal = sal + 99;
    }

    switch (roz) {
        case 10591:
        case 22644:
        case 36158:
        default:
            if (roz >= 00000 && roz <= 10225) {
                tag = 1;
                Esal = 0;
                base = 00000;
            }

            if (roz >= 10226 && roz <= 10590) {
                tag = 2;
                Esal = 1;
                base = 10226;
            }

            if (roz >= 10592 && roz <= 22278) {
                tag = 3;
                Esal = 1;
                base = 10592;
            }

            if (roz >= 22279 && roz <= 22643) {
                tag = 4;
                Esal = 2;
                base = 22279;
            }

            if (roz >= 22645 && roz <= 35792) {
                tag = 5;
                Esal = 2;
                base = 22645;
            }

            if (roz >= 35793 && roz <= 36157) {
                tag = 6;
                Esal = 3;
                base = 35793;
            }
    }



    if (((tag % 2) == 1) && (((roz - base + 1) % 1461) == 0)) {
        roz = roz - 1;
        leap = 1;
    }

    if (tag > 0) {
        roz = roz - Esal * 365;
        roz = roz - parseInt(roz / 1461);
        sal = Esal + sal + parseInt(roz / 365) + 1314;
        roz = roz % (365 + leap);
    }

    if (roz >= 186) {
        roz = roz - 186;
        Mah = 6 + parseInt(roz / 30, 10);
        roz = roz % 30;
    }
    else {
        Mah = parseInt(roz / 31, 10);
        roz = roz % 31;
    }

    var StrRoz, StrMah;
    StrRoz = new String;
    StrMah = new String;

    StrRoz = String(roz + 1);
    StrMah = String(Mah + 1);

    if (StrRoz.length == 1)
        StrRoz = "0" + StrRoz;

    if (StrMah.length == 1)
        StrMah = "0" + StrMah;

    return (sal + "/" + StrMah + "/" + StrRoz);
}
/********************************************************************************************************/
function ShdToInt(PD) {
    if (!IsValidDate(PD)) {
        alert("اشکال در تاریخ شمسی!!")
        return false;
    }
    else {
        var sal, mah, roz, Tr, arr;
        arr = PD.split("/");
        if (arr.length == 3) {
            sal = parseInt(arr[0], 10);
            mah = parseInt(arr[1], 10) - 1;
            roz = parseInt(arr[2], 10) - 1;
            Tr = 0;

            if (sal < 100)
                sal = 1300 + sal;

            sal = sal - 1314;

            while (sal < 0) {
                Tr = Tr - 36159 - 366;
                sal = sal + 100;
            }

            while (sal > 98) {
                Tr = Tr + 36159;
                sal = sal - 99;
            }

            if (sal >= 0 && sal <= 27)
                Tr = Tr + sal * 365 + Math.floor(sal / 4);

            if (sal >= 28 && sal <= 60)
                Tr = Tr + sal * 365 + Math.floor((sal - 1) / 4);

            if (sal >= 61 && sal <= 97)
                Tr = Tr + sal * 365 + Math.floor((sal - 2) / 4);

            if (sal == 98)
                Tr = Tr + sal * 365 + Math.floor((sal - 3) / 4);


            if (mah > 6)
                Tr = Tr + (mah - 6) * 30 + 186;
            else
                Tr = Tr + mah * 31;

            return (Tr + roz);
        }
    }
}
/********************************************************************************************************/
function BetweenDay(SDate, EDate) {
    return (ShdToInt(EDate) - ShdToInt(SDate) + 1);
}
/********************************************************************************************************/
function ShdAdd(PD, Days) {
    Days = parseInt(Days, 10);
    if (Days != 0)
        return (IntToShd(ShdToInt(PD) + Days));
    else
        return (PD);
}
/********************************************************************************************************/
function WeekDayNum(PD) {
    var roz;
    roz = ShdToInt(PD);
    if ((roz % 7 - 1) == -1)
        return 6
    else
        return (roz % 7 - 1)
}

function GetPersianDayName(PDate) {
    return (PersianDayName[0][WeekDayNum(PDate)]);
}
/********************************************* Persion Date ************************END******************/

/********************************************* Convert Date ***********************START*****************/
var J0000 = 1721424.5;
var J1970 = 2440587.5;
var JMJD = 2400000.5;
var J1900 = 2415020.5;
var J1904 = 2416480.5;
var GREGORIAN_EPOCH = 1721425.5;
var PERSIAN_EPOCH = 1948320.5;

/********************************************************************************************************/
function LeapGregorian(year) {
    return ((year % 4) == 0) &&
            (!(((year % 100) == 0) && ((year % 400) != 0)));
}
/********************************************************************************************************/
function Mod(a, b) {
    return a - (b * Math.floor(a / b));
}
/********************************************************************************************************/
function Gregorian2JD(GD) {

    var year, month, day;
    year = GD.split("/")[0];
    month = GD.split("/")[1];
    day = GD.split("/")[2];

    year = new Number(year);
    month = new Number(month);
    day = new Number(day);

    return (GREGORIAN_EPOCH - 1) +
           (365 * (year - 1)) +
           Math.floor((year - 1) / 4) +
           (-Math.floor((year - 1) / 100)) +
           Math.floor((year - 1) / 400) +
           Math.floor((((367 * month) - 362) / 12) +
           ((month <= 2) ? 0 :
                               (LeapGregorian(year) ? -1 : -2)
           ) +
           day);
}
/********************************************************************************************************/
function JD2Gregorian(jd) {
    jd = new Number(jd);
    var wjd, depoch, quadricent, dqc, cent, dcent, quad, dquad,
        yindex, dyindex, year, yearday, leapadj;

    wjd = Math.floor(jd - 0.5) + 0.5;
    depoch = wjd - GREGORIAN_EPOCH;
    quadricent = Math.floor(depoch / 146097);
    dqc = Mod(depoch, 146097);
    cent = Math.floor(dqc / 36524);
    dcent = Mod(dqc, 36524);
    quad = Math.floor(dcent / 1461);
    dquad = Mod(dcent, 1461);
    yindex = Math.floor(dquad / 365);
    year = (quadricent * 400) + (cent * 100) + (quad * 4) + yindex;
    if (!((cent == 4) || (yindex == 4))) {
        year++;
    }
    yearday = wjd - Gregorian2JD(year + "/1/1");
    leapadj = ((wjd < Gregorian2JD(year + "3/1")) ? 0
                                                  :
                  (LeapGregorian(year) ? 1 : 2)
              );
    month = Math.floor((((yearday + leapadj) * 12) + 373) / 367);
    day = (wjd - Gregorian2JD(year + "/" + month + "/1")) + 1;

    //    //return new Array(year, month, day);
    return year + "/" + month + "/" + day;
}
/********************************************************************************************************/
function LeapPersian(year) {
    return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
}
/********************************************************************************************************/
function Persian2JD(PD) {

    var year, month, day;
    year = PD.split("/")[0];
    month = PD.split("/")[1];
    day = PD.split("/")[2];

    year = new Number(year);
    month = new Number(month);
    day = new Number(day);

    var epbase, epyear;

    epbase = year - ((year >= 0) ? 474 : 473);
    epyear = 474 + Mod(epbase, 2820);

    return day +
            ((month <= 7) ?
                ((month - 1) * 31) :
                (((month - 1) * 30) + 6)
            ) +
            Math.floor(((epyear * 682) - 110) / 2816) +
            (epyear - 1) * 365 +
            Math.floor(epbase / 2820) * 1029983 +
            (PERSIAN_EPOCH - 1);
}
/********************************************************************************************************/
function JD2Persian(jd) {
    jd = new Number(jd);

    var year, month, day, depoch, cycle, cyear, ycycle,
        aux1, aux2, yday;

    jd = Math.floor(jd) + 0.5;

    depoch = jd - Persian2JD("475/1/1");
    cycle = Math.floor(depoch / 1029983);
    cyear = Mod(depoch, 1029983);
    if (cyear == 1029982) {
        ycycle = 2820;
    } else {
        aux1 = Math.floor(cyear / 366);
        aux2 = Mod(cyear, 366);
        ycycle = Math.floor(((2134 * aux1) + (2816 * aux2) + 2815) / 1028522) +
                    aux1 + 1;
    }
    year = ycycle + (2820 * cycle) + 474;
    if (year <= 0) {
        year--;
    }

    yday = (jd - Persian2JD(year + "/1/1")) + 1;
    month = (yday <= 186) ? Math.ceil(yday / 31) : Math.ceil((yday - 6) / 30);
    day = (jd - Persian2JD(year + "/" + month + "/1")) + 1;
    //return new Array(year, month, day);
    return year + "/" + month + "/" + day;
}
/********************************************* Convert Date ************************END******************/

/********************************************** Miladi Date **********************START******************/
var d, CurMDate;
d = new Date();

var CurMDateArr = new Array(0, 0, 0);
CurMDateArr[0] = d.getFullYear();
CurMDateArr[1] = d.getMonth() + 1;
CurMDateArr[2] = d.getDate();

var CurMDay, CurMMonth, CurMYear;
CurMDay = new String;
CurMMonth = new String;
CurMYear = new String;

CurMDay = CurMDateArr[2].toString();
CurMMonth = CurMDateArr[1].toString();
CurMYear = CurMDateArr[0].toString();

if (CurMMonth.length == 1)
    CurMMonth = "0" + CurMMonth;

if (CurMDay.length == 1)
    CurMDay = "0" + CurMDay;

CurMDate = CurMYear + "/" + CurMMonth + "/" + CurMDay;
var CurMDateRev = CurMDay + "/" + CurMMonth + "/" + CurMYear;


CurPDate = JD2Persian(Gregorian2JD(CurMDate));

var CurPDateArr = CurPDate.split("/");

var CurPDay, CurPMonth, CurPYear, CurPDate;
CurPDay = new String;
CurPMonth = new String;
CurPYear = new String;

CurPDay = CurPDateArr[2].toString();
CurPMonth = CurPDateArr[1].toString();
CurPYear = CurPDateArr[0].toString();

if (CurPMonth.length == 1)
    CurPMonth = "0" + CurPMonth;

if (CurPDay.length == 1)
    CurPDay = "0" + CurPDay;

CurPDate = CurPYear + "/" + CurPMonth + "/" + CurPDay;
var CurPDateRev = CurPDay + "/" + CurPMonth + "/" + CurPYear;


/********************************************** Miladi Date ************************END******************/

/********************************************* Islamic Date ***********************START*****************/
function persian_jdn(PD) {

    var iYear, iMonth, iDay;
    iYear = PD.split("/")[0];
    iMonth = PD.split("/")[1];
    iDay = PD.split("/")[2];

    iYear = new Number(iYear);
    iMonth = new Number(iMonth);
    iDay = new Number(iDay);



    var PERSIAN_EPOCH = 1948321 // The JDN of 1 Farvardin 1
    var epbase
    var epyear
    var mdays

    if (iYear >= 0)
        epbase = iYear - 474
    else
        epbase = iYear - 473

    epyear = 474 + (epbase % 2820)

    if (iMonth <= 7)
        mdays = (parseInt(iMonth) - 1) * 31
    else
        mdays = (parseInt(iMonth) - 1) * 30 + 6

    return (parseInt(iDay) + mdays + parseInt(((epyear * 682) - 110) / 2816) + (epyear - 1) * 365 + parseInt(epbase / 2820) * 1029983 + (PERSIAN_EPOCH - 1))
}
/********************************************************************************************************/
function jdn_islamic(jd) {
    var iYear, iMonth, iDay;
    var mjd
    //var k
    var hm

    /*******************/
    /*****jdn_civil*****/
    var l
    var k
    var n
    var i
    var j

    if (jd > 2299160) {
        l = jd + 68569
        n = parseInt((4 * l) / 146097)
        l = l - parseInt((146097 * n + 3) / 4)
        i = parseInt((4000 * (l + 1)) / 1461001)
        l = l - parseInt((1461 * i) / 4) + 31
        j = parseInt((80 * l) / 2447)
        iDay = l - parseInt((2447 * j) / 80)
        l = parseInt(j / 11)
        iMonth = j + 2 - 12 * l
        iYear = 100 * (n - 49) + i + l

    }
    else {
        /*******************/
        /*****jdn_julian****/
        j = jd + 1402
        k = parseInt((j - 1) / 1461)
        l = j - 1461 * k
        n = parseInt((l - 1) / 365) - parseInt(l / 1461)
        i = l - 365 * n + 30
        j = parseInt((80 * i) / 2447)
        iDay = i - parseInt((2447 * j) / 80)
        i = parseInt(j / 11)
        iMonth = j + 2 - 12 * i
        iYear = 4 * k + n + i - 4716
        /*****jdn_julian****/
        /*******************/
    }
    /*****jdn_civil*****/
    /*******************/

    k = Math.floor(0.6 + (iYear + (parseInt(iMonth - 0.5)) / 12 + iDay / 365 - 1900) * 12.3685)
    do {
        mjd = visibility(k)
        k = k - 1
    }
    while (mjd > (jd - 0.5))

    k = k + 1
    hm = k - 1048
    iYear = 1405 + parseInt(hm / 12)

    iMonth = (hm % 12) + 1
    if ((hm != 0) && (iMonth <= 0)) {
        iMonth = iMonth + 12
        iYear = iYear - 1
    }

    if (iYear <= 0)
        iYear = iYear - 1

    iDay = Math.floor(jd - mjd + 0.5)

    return iYear + "/" + iMonth + "/" + iDay;
}
/********************************************************************************************************/
function visibility(n) {
    var TIMZ = 3
    var MINAGE = 13.5
    var SUNSET = 19.5
    var TIMDIF = (SUNSET - MINAGE)


    var jd
    var tf
    var d

    jd = tmoonphase(n, 0)

    d = Math.floor(jd)
    tf = (jd - d)

    if (tf <= 0.5) // new moon starts in the afternoon
        return (jd + 1)
    else  // new moon starts before noon
    {
        tf = (tf - 0.5) * 24 + TIMZ // local time
        if (tf > TIMDIF)
            return (jd + 1) // age at sunset < min for visiblity
        else
            return (jd)

    }

}
/********************************************************************************************************/
function tmoonphase(n, nph) {
    var RPD = 0.0174532925199433

    var jd
    var t
    var t2
    var t3
    var k
    var ma
    var sa
    var tf
    var xtra

    k = n + nph / 4
    t = k / 1236.85
    t2 = t * t
    t3 = t2 * t
    jd = 2415020.75933 + 29.53058868 * k - 0.0001178 * t2 - 0.000000155 * t3 + 0.00033 * Math.sin(RPD * (166.56 + 132.87 * t - 0.009173 * t2))

    sa = RPD * (359.2242 + 29.10535608 * k - 0.0000333 * t2 - 0.00000347 * t3)

    ma = RPD * (306.0253 + 385.81691806 * k + 0.0107306 * t2 + 0.00001236 * t3)

    tf = RPD * 2 * (21.2964 + 390.67050646 * k - 0.0016528 * t2 - 0.00000239 * t3)

    switch (nph) {
        case 0:
            xtra = (0.1734 - 0.000393 * t) * Math.sin(sa) + 0.0021 * Math.sin(sa * 2) - 0.4068 * Math.sin(ma) + 0.0161 * Math.sin(2 * ma) - 0.0004 * Math.sin(3 * ma) + 0.0104 * Math.sin(tf) - 0.0051 * Math.sin(sa + ma) - 0.0074 * Math.sin(sa - ma) + 0.0004 * Math.sin(tf + sa) - 0.0004 * Math.sin(tf - sa) - 0.0006 * Math.sin(tf + ma) + 0.001 * Math.sin(tf - ma) + 0.0005 * Math.sin(sa + 2 * ma)
            break
        case 1:
            {
                xtra = (0.1721 - 0.0004 * t) * Math.sin(sa) + 0.0021 * Math.sin(sa * 2) - 0.628 * Math.sin(ma) + 0.0089 * Math.sin(2 * ma) - 0.0004 * Math.sin(3 * ma) + 0.0079 * Math.sin(tf) - 0.0119 * Math.sin(sa + ma) - 0.0047 * Math.sin(sa - ma) + 0.0003 * Math.sin(tf + sa) - 0.0004 * Math.sin(tf - sa) - 0.0006 * Math.sin(tf + ma) + 0.0021 * Math.sin(tf - ma) + 0.0003 * Math.sin(sa + 2 * ma) + 0.0004 * Math.sin(sa - 2 * ma) - 0.0003 * Math.sin(2 * sa + ma)

                if (nph = 1)
                    xtra = xtra + 0.0028 - 0.0004 * Math.cos(sa) + 0.0003 * Math.cos(ma)
                else
                    xtra = xtra - 0.0028 + 0.0004 * Math.cos(sa) - 0.0003 * Math.cos(ma)

                break
            }
        case 2:
            xtra = (0.1734 - 0.000393 * t) * Math.sin(sa) + 0.0021 * Math.sin(sa * 2) - 0.4068 * Math.sin(ma) + 0.0161 * Math.sin(2 * ma) - 0.0004 * Math.sin(3 * ma) + 0.0104 * Math.sin(tf) - 0.0051 * Math.sin(sa + ma) - 0.0074 * Math.sin(sa - ma) + 0.0004 * Math.sin(tf + sa) - 0.0004 * Math.sin(tf - sa) - 0.0006 * Math.sin(tf + ma) + 0.001 * Math.sin(tf - ma) + 0.0005 * Math.sin(sa + 2 * ma)
            break
        case 3:
            {
                xtra = (0.1721 - 0.0004 * t) * Math.sin(sa) + 0.0021 * Math.sin(sa * 2) - 0.628 * Math.sin(ma) + 0.0089 * Math.sin(2 * ma) - 0.0004 * Math.sin(3 * ma) + 0.0079 * Math.sin(tf) - 0.0119 * Math.sin(sa + ma) - 0.0047 * Math.sin(sa - ma) + 0.0003 * Math.sin(tf + sa) - 0.0004 * Math.sin(tf - sa) - 0.0006 * Math.sin(tf + ma) + 0.0021 * Math.sin(tf - ma) + 0.0003 * Math.sin(sa + 2 * ma) + 0.0004 * Math.sin(sa - 2 * ma) - 0.0003 * Math.sin(2 * sa + ma)

                if (nph = 1)
                    xtra = xtra + 0.0028 - 0.0004 * Math.cos(sa) + 0.0003 * Math.cos(ma)
                else
                    xtra = xtra - 0.0028 + 0.0004 * Math.cos(sa) - 0.0003 * Math.cos(ma)

                break
            }
        default:
            return 0
    }

    return (jd + xtra - (0.41 + 1.2053 * t + 0.4992 * t2) / 1440)

}
/********************************************* Islamic Date ***********************START*****************/



function GetHoliday(PD, ID) {
    var m, d, gm, gd;

    m = PD.split("/")[1];
    d = PD.split("/")[2];

    gm = ID.split("/")[1];
    gd = ID.split("/")[2];

    m = new Number(m);
    d = new Number(d);

    gm = new Number(gm);
    gd = new Number(gd);


    var HolidayDescr = "";
    if (PersianHoliday[m - 1][d - 1] != "" && IslamicHoliday[gm - 1][gd - 1] != "")
        return PersianHoliday[m - 1][d - 1] + "\n" + IslamicHoliday[gm - 1][gd - 1];
    else if (PersianHoliday[m - 1][d - 1] != "" && IslamicHoliday[gm - 1][gd - 1] == "")
        return PersianHoliday[m - 1][d - 1];
    else if (PersianHoliday[m - 1][d - 1] == "" && IslamicHoliday[gm - 1][gd - 1] != "")
        return IslamicHoliday[gm - 1][gd - 1];
    else
        return "";
}

function DatePicker_OnBlur(DatePicker) {
    var Date = DatePicker.value;
    var SYear, SMonth, SDay;


    CurrentDate = CurPDate;
    var CurYear, CurMonth, CurDay;
    CurYear = CurrentDate.split("/")[0];
    CurMonth = CurrentDate.split("/")[1];
    CurDay = CurrentDate.split("/")[2];


    var SelDate = Date.replace(" ", "");
    var SelYear, SelMonth, SelDay;
    SelYear = SelDate.split("/")[2];
    SelMonth = SelDate.split("/")[1];
    SelDay = SelDate.split("/")[0];

    if ((SelDay == undefined || SelDay == "") && (SelMonth == undefined || SelMonth == "") && (SelYear == undefined || SelYear == "")) {
        DatePicker.value = "";
        return;
    }

    if (SelDay == undefined || SelDay == "")
        SelDay = CurDay;

    if (SelMonth == undefined || SelMonth == "")
        SelMonth = CurMonth;

    if (SelYear == undefined || SelYear == "")
        SelYear = CurYear;

    SelDay = parseInt(SelDay, 10);
    SelMonth = parseInt(SelMonth, 10);
    SelYear = parseInt(SelYear, 10);

    if (SelYear == 0)
        SelYear = parseInt(CurYear, 10);

    if (SelMonth == 0)
        SelMonth = parseInt(CurMonth, 10);

    if (SelDay == 0)
        SelDay = parseInt(CurDay, 10);

    var MonthDay;
    if (IsShLeap(SelYear))
        MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
    else
        MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);



    if (SelMonth < 1)
        SelMonth = 1;
    else if (SelMonth > 12)
        SelMonth = 12;

    if (SelDay < 1)
        SelDay = 1;
    else if (SelDay > MonthDay[SelMonth - 1])
        SelDay = MonthDay[SelMonth - 1];


    DatePicker.value = ReverceDate(DateChk(SelYear + '/' + SelMonth + '/' + SelDay));
}

function ArrowKeyManager(DatePicker) {
    if (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) {
        var Date = DatePicker.value.replace(" ", "").substring(0, 10);

        if (Date == "")
            return;


        var SelYear, SelMonth, SelDay;
        SelYear = Date.split("/")[2];
        SelMonth = Date.split("/")[1];
        SelDay = Date.split("/")[0];

        SelDay = parseInt(SelDay, 10);
        SelMonth = parseInt(SelMonth, 10);
        SelYear = parseInt(SelYear, 10);

        var NewYear, NewMonth, NewDay;
        NewYear = SelYear;
        NewMonth = SelMonth;
        NewDay = SelDay;

        var MonthDay;
        if (IsShLeap(SelYear))
            MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
        else
            MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);



        if (event.keyCode == 38) {
            NewDay = SelDay + 1;

            if (NewDay > MonthDay[SelMonth - 1] && SelMonth == 12) {
                NewDay = 1;
                NewMonth = 1;
                NewYear = SelYear + 1;


            }
            else if (NewDay > MonthDay[SelMonth - 1] && SelMonth < 12) {
                NewDay = 1;
                NewMonth = SelMonth + 1;
            }

        }
        else if (event.keyCode == 40) {
            NewDay = SelDay - 1;

            if (NewDay < 1 && SelMonth == 1) {
                NewMonth = 12;

                NewYear = SelYear - 1;

                if (IsShLeap(NewYear))
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
                else
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);

                NewDay = MonthDay[NewMonth - 1];
            }
            else if (NewDay < 1 && SelMonth > 1) {

                NewMonth = SelMonth - 1;
                NewDay = MonthDay[NewMonth - 1];
            }

        }
        else if (event.keyCode == 39) {
            NewMonth = SelMonth + 1;
            if (NewMonth > 12) {
                NewMonth = 1;

                NewYear = SelYear + 1;

                if (IsShLeap(NewYear))
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
                else
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);
            }


            if (NewDay > MonthDay[NewMonth - 1]) {
                NewDay = MonthDay[NewMonth - 1];
            }
        }
        else if (event.keyCode == 37) {
            NewMonth = SelMonth - 1;

            if (NewMonth < 1) {
                NewMonth = 12;
                NewYear = SelYear - 1;

                if (IsShLeap(NewYear))
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30);
                else
                    MonthDay = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);
            }

            if (NewDay > MonthDay[NewMonth - 1]) {
                NewDay = MonthDay[NewMonth - 1];
            }
        }


        DatePicker.value = ReverceDate(DateChk(NewYear + '/' + NewMonth + '/' + NewDay));
    }
}

function ReverceDate(Date) {
    var Year, Month, Day;

    Year = Date.split("/")[2];
    Month = Date.split("/")[1];
    Day = Date.split("/")[0];

    return (Year + "/" + Month + "/" + Day)
}

