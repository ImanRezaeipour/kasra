/// <reference name="MicrosoftAjax.js"/>

// code to change the active stylesheet
if (!window.XMLHttpRequest)
    XMLHttpRequest = function() {
        return new ActiveXObject("Microsoft.XMLHTTP");
    };
/**##################################################################################****************************************************/
var J0000 = 1721424.5;                // Julian date of Gregorian epoch: 0000-01-01
var J1970 = 2440587.5;                // Julian date at Unix epoch: 1970-01-01
var JMJD = 2400000.5;                // Epoch of Modified Julian Date system
var J1900 = 2415020.5;                // Epoch (day 1) of Excel 1900 date system (PC)
var J1904 = 2416480.5;                // Epoch (day 0) of Excel 1904 date system (Mac)
var GREGORIAN_EPOCH = 1721425.5;
var PERSIAN_EPOCH = 1948320.5;
var MonthDays = new Array(
/* فروردين */31,     /* ارديبهشت */31, /* خرداد */31,     /* تير */31,
/* مرداد */31,     /* شهريور */31, /* مهر */30,     /* آبان */30,
/* آذر */30,     /* دي */30, /* بهمن */30,     /* اسفند */29)
/******************************************************/
//Gregorian 
var curMDay = 0
var curMMonth = 0
var curMYear = 0
/******************************************************/
//Persian
var curPDay = 0
var curPMonth = 0
var curPYear = 0
/******************************************************/
var oldPDay = 0
var oldPMonth = 0
var oldPYear = 0
var newPDay = 0
var newPMonth = 0
var newPYear = 0
var curMonthDays = 0
var oldMonthDays = 0
var newMonthDays = 0
var firstDayMonth = 0
/******************************************************/
/******************************************************/
function Gregorian2JD(year, month, day) {
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
/******************************************************/
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
    yearday = wjd - Gregorian2JD(year, 1, 1);
    leapadj = ((wjd < Gregorian2JD(year, 3, 1)) ? 0
														:
						(LeapGregorian(year) ? 1 : 2)
					);
    month = Math.floor((((yearday + leapadj) * 12) + 373) / 367);
    day = (wjd - Gregorian2JD(year, month, 1)) + 1;

    return new Array(year, month, day);
}
/******************************************************/
function LeapGregorian(year) {
    return ((year % 4) == 0) &&
					(!(((year % 100) == 0) && ((year % 400) != 0)));
}
/******************************************************/
function LeapPersian(year) {
    return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
}
/******************************************************/
function Persian2JD(year, month, day) {
    year = new Number(year);
    month = new Number(month);
    day = new Number(day);

    var epbase, epyear;

    epbase = year - ((year >= 0) ? 474 : 473);
    epyear = 474 + this.Mod(epbase, 2820);

    return day +
					((month <= 7) ?
						((month - 1) * 31) :
						(((month - 1) * 30) + 6)
					) +
					Math.floor(((epyear * 682) - 110) / 2816) +
					(epyear - 1) * 365 +
					Math.floor(epbase / 2820) * 1029983 +
					(this.PERSIAN_EPOCH - 1);
}
/******************************************************/
function Mod(a, b) {
    return a - (b * Math.floor(a / b));
}
/******************************************************/
function JD2Persian(jd) {
    jd = new Number(jd);

    var year, month, day, depoch, cycle, cyear, ycycle,
				aux1, aux2, yday;

    jd = Math.floor(jd) + 0.5;

    depoch = jd - Persian2JD(475, 1, 1);
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

    yday = (jd - Persian2JD(year, 1, 1)) + 1;
    month = (yday <= 186) ? Math.ceil(yday / 31) : Math.ceil((yday - 6) / 30);
    day = (jd - Persian2JD(year, month, 1)) + 1;
    return new Array(year, month, day);
}
/******************************************************/
function CurrentDate() {
    var oDate = new Date()
    var arr
    arr = JD2Persian(Gregorian2JD(oDate.getFullYear(), oDate.getMonth() + 1, oDate.getDate()))
    return arr;
}