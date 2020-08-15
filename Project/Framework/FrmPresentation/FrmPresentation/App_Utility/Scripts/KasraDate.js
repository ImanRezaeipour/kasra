///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function KasraDate()
{	
	//-------
	this.J0000 = 1721424.5;                // Julian date of Gregorian epoch: 0000-01-01
	this.J1970 = 2440587.5;                // Julian date at Unix epoch: 1970-01-01
	this.JMJD  = 2400000.5;                // Epoch of Modified Julian Date system
	this.J1900 = 2415020.5;                // Epoch (day 1) of Excel 1900 date system (PC)
	this.J1904 = 2416480.5;                // Epoch (day 0) of Excel 1904 date system (Mac)
	this.GREGORIAN_EPOCH = 1721425.5;
	this.PERSIAN_EPOCH = 1948320.5;
	
	//-------
	this.Persian2JD = __Persian2JD;
	this.LeapPersian = __LeapPersian;
	this.JD2Persian = __JD2Persian;
	this.ValidPersianDate = __ValidPersianDate;
	this.PersianDateAdd = __PersianDateAdd;

	//-------
	this.Gregorian2JD = __Gregorian2JD;
	this.LeapGregorian = __LeapGregorian;
	this.JD2Gregorian = __JD2Gregorian;

	//-------
	this.Mod = __Mod;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  LEAP_GREGORIAN  --  Is a given year in the Gregorian calendar a leap year ?
function __LeapGregorian(year)
{
    return ((year % 4) == 0) &&
            (!(((year % 100) == 0) && ((year % 400) != 0)));
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  GREGORIAN_TO_JD  --  Determine Julian day number from Gregorian calendar date
function __Gregorian2JD(year, month, day)
{
	year = new Number(year);
	month = new Number(month);
	day = new Number(day);

    return (this.GREGORIAN_EPOCH - 1) +
           (365 * (year - 1)) +
           Math.floor((year - 1) / 4) +
           (-Math.floor((year - 1) / 100)) +
           Math.floor((year - 1) / 400) +
           Math.floor((((367 * month) - 362) / 12) +
           ((month <= 2) ? 0 :
                               (this.LeapGregorian(year) ? -1 : -2)
           ) +
           day);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////  JD_TO_GREGORIAN  --  Calculate Gregorian calendar date from Julian day
function __JD2Gregorian(jd) 
{
	jd = new Number(jd);
    var wjd, depoch, quadricent, dqc, cent, dcent, quad, dquad,
        yindex, dyindex, year, yearday, leapadj;

    wjd = Math.floor(jd - 0.5) + 0.5;
    depoch = wjd - this.GREGORIAN_EPOCH;
    quadricent = Math.floor(depoch / 146097);
    dqc = this.Mod(depoch, 146097);
    cent = Math.floor(dqc / 36524);
    dcent = this.Mod(dqc, 36524);
    quad = Math.floor(dcent / 1461);
    dquad = this.Mod(dcent, 1461);
    yindex = Math.floor(dquad / 365);
    year = (quadricent * 400) + (cent * 100) + (quad * 4) + yindex;
    if (!((cent == 4) || (yindex == 4))) {
        year++;
    }
    yearday = wjd - this.Gregorian2JD(year, 1, 1);
    leapadj = ((wjd < this.Gregorian2JD(year, 3, 1)) ? 0
                                                  :
                  (this.LeapGregorian(year) ? 1 : 2)
              );
    month = Math.floor((((yearday + leapadj) * 12) + 373) / 367);
    day = (wjd - this.Gregorian2JD(year, month, 1)) + 1;

    return new Array(year, month, day);
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*  MOD  --  Modulus function which works for non-integers.  */
function __Mod(a, b)
{
    return a - (b * Math.floor(a / b));
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  LEAP_PERSIAN  --  Is a given year a leap year in the Persian calendar ?
function __LeapPersian(year)
{
    return ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function __Persian2JD(year, month, day)
{
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function __JD2Persian(jd)
{
	jd = new Number(jd);
	
    var year, month, day, depoch, cycle, cyear, ycycle,
        aux1, aux2, yday;

    jd = Math.floor(jd) + 0.5;

    depoch = jd - this.Persian2JD(475, 1, 1);
    cycle = Math.floor(depoch / 1029983);
    cyear = this.Mod(depoch, 1029983);
    if (cyear == 1029982) {
        ycycle = 2820;
    } else {
        aux1 = Math.floor(cyear / 366);
        aux2 = this.Mod(cyear, 366);
        ycycle = Math.floor(((2134 * aux1) + (2816 * aux2) + 2815) / 1028522) +
                    aux1 + 1;
    }
    year = ycycle + (2820 * cycle) + 474;
    if (year <= 0) {
        year--;
    }

    yday = (jd - this.Persian2JD(year, 1, 1)) + 1;
    month = (yday <= 186) ? Math.ceil(yday / 31) : Math.ceil((yday - 6) / 30);
    day = (jd - this.Persian2JD(year, month, 1)) + 1;
    return new Array(year, month, day);
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function __ValidPersianDate(year , month , day)
{
	//------
	if(isNaN(parseInt(year , 10)) || parseInt(year , 10)<0 || isNaN(parseInt(month , 10)) || parseInt(month , 10)<0 || parseInt(month , 10)>12 || isNaN(parseInt(day , 10)) || parseInt(day , 10)<0 || parseInt(day , 10)>32)
		return false;

	//------
	var bValidDate = (month>=1 && month<=6 && day<=31);
	bValidDate = bValidDate || (month>=7 && month<=11 && day<=30);
	bValidDate = bValidDate || (this.LeapPersian(year) && month==12 && day<=30);
	bValidDate = bValidDate || (!this.LeapPersian(year) && month==12 && day<=29);
		
	//------
	return bValidDate;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
function __PersianDateAdd(year , month , day , unit , part)
{
	//-----
	var arrNewDate = new Array();
	arrNewDate[0] = year;
	arrNewDate[1] = month;
	arrNewDate[2] = day;
	
	//----------------------------------------------------
	//----- Add To Year
	if(part==0)
	{
		//------
		arrNewDate[0] = year + unit;
		if(arrNewDate[0]<=0)
		{
			arrNewDate[0] = 0;
			return arrNewDate;
		}

		//------
		if(!this.LeapPersian(arrNewDate[0]) && month==12 && day==30)	
			arrNewDate[2] = 29;
	}

	//----------------------------------------------------
	//----- Add To Month
	if(part==1)
	{
		//------
		arrNewDate[1] = month + unit;
		if(arrNewDate[1]==0)
		{
			arrNewDate[0] = year - 1;
			arrNewDate[1] = 12;
			arrNewDate[2] = ((this.LeapPersian(arrNewDate[0])) ? 30 : 29);
			return arrNewDate;
		}
		
		if(arrNewDate[1]==13)
		{
			arrNewDate[0] = year + 1;
			arrNewDate[1] = 1;
			arrNewDate[2] = 1;
			return arrNewDate;
		}

		//------
		if(arrNewDate[1]==12 && !this.LeapPersian(arrNewDate[0]) && day==30)
		{
			arrNewDate[2] = 29;
			return arrNewDate;
		}

		//------
		if(arrNewDate[1]>=7 && arrNewDate[1]<=11 && day==31)
		{
			arrNewDate[2] = 20;
			return arrNewDate;
		}
	}

	//----------------------------------------------------
	//----- Add To Day
	if(part==2)
	{
		//------
		arrNewDate[2] = day + unit;
		if(arrNewDate[2]==0)
		{
			if(arrNewDate[1]==1)
			{
				arrNewDate[0] = year - 1;
				arrNewDate[1] = 12;
				arrNewDate[2] = ((this.LeapPersian(arrNewDate[0])) ? 30 : 29);
				return arrNewDate;
			}
			
			if(arrNewDate[1]>=2 && arrNewDate[1]<=7)
			{
				arrNewDate[1] = month - 1;
				arrNewDate[2] = 31;
				return arrNewDate;
			}
			
			if(arrNewDate[1]>=8 && arrNewDate[1]<=12)
			{
				arrNewDate[1] = month - 1;
				arrNewDate[2] = 30;
				return arrNewDate;
			}
		}

		//------
		if(arrNewDate[1]>=1 && arrNewDate[1]<=6 && arrNewDate[2]==32)
		{
			arrNewDate[1] = month + 1;
			arrNewDate[2] = 1;
			return arrNewDate;
		}

		//------
		if(arrNewDate[1]>=7 && arrNewDate[1]<=11 && arrNewDate[2]==31)
		{
			arrNewDate[1] = month + 1;
			arrNewDate[2] = 1;
			return arrNewDate;
		}

		//------
		if(arrNewDate[1]==12 && this.LeapPersian(arrNewDate[0]) && arrNewDate[2]==31)
		{
			arrNewDate[0] = year + 1;
			arrNewDate[1] = 1;
			arrNewDate[2] = 1;
			return arrNewDate;
		}

		//------
		if(arrNewDate[1]==12 && !this.LeapPersian(arrNewDate[0]) && arrNewDate[2]==30)
		{
			arrNewDate[0] = year + 1;
			arrNewDate[1] = 1;
			arrNewDate[2] = 1;
			return arrNewDate;
		}
	}

	//------
	return arrNewDate;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
