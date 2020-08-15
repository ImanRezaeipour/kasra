//تعداد يک رشته خاص در يک رشته را برميگرداند
function getCntChar(subStr1, Str1) {
    var Str = new String
    Str = Str1 + ''
    if (Str1 == '')
        return (0)
    var subStr = new String
    subStr = subStr1 + ''
    if (subStr1 == '')
        return (0)
    var cnt = 0
    for (j = 0; j < Str.length; ++j)
        if (Str.substring(j, j + subStr.length) == subStr)
            cnt += 1
        return (cnt)
    } 
    function getArray(Str, Index, sep) {
        var j, i = 0
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
    //فقط اجازه ورود عدد صحيح و اعشاري را با توجه به پارامترهاي ورودي به کاربر ميدهد.
    function OnKeyDownNum(TypeNum, number) {
        var key = window.event.keyCode
        if (TypeNum == 'double') {
            window.event.returnValue =
			(
				((key >= 96) && (key <= 105)) ||
				((key >= 48) && (key <= 57)) ||
				(key == 8) || (key == 9) || (key == 46) ||
				((key >= 35) && (key <= 40)) || ((key == 110) && getCntChar('.', number) < 1) ||
				((key == 190) && getCntChar('.', number) < 1)

			)
        }
        if (TypeNum == 'integer') {
            window.event.returnValue =
			(
				((key >= 96) && (key <= 105)) ||
				((key >= 48) && (key <= 57)) ||
				(key == 8) || (key == 9) || (key == 46) ||
				((key >= 35) && (key <= 40))
			)
        }
    }
    function OnKeyDownInt(number) {
        var key = window.event.keyCode
        window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40))
		)
    }
    function OnKeyDownTime(number) {
        var key = window.event.keyCode
        //alert(key)
        window.event.returnValue =
		(

			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40)) ||
			(key == 186) || (key == 231) || (key == 17) 
            
		)
    }
    function OnKeyDownDate(number) {
        var key = window.event.keyCode
        window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40)) ||
			(key == 191) || (key == 111)
		)
    }
    function ReplaceAll(str, char1, replaceChar) {
        var x = getCntChar(char1, str)
        var s = new String()
        s = str
        while (x > 0) {
            s = s.replace(char1, replaceChar)
            x--
        }
        return (s)
    }
    function Timechk(obj) {
        var val = ReplaceAll(obj.value, " ", "")
        var negativeFlag = val.substr(0, 1)
        if (negativeFlag == "-")
            val = val.substr(1, val.length)
        if ((val != "") && (IsvalidTime(val) == false)) {
            var strQuestion, intReturn
            strQuestion = "  ! لطفا دراين قسمت ساعت صحيح وارد كنيد"
            strQuestion = alert(strQuestion, 0, "ساعت اشتباه ")
            obj.focus()
            return
        }
        else if ((val != "") && (IsvalidTime(val) == true)) {
            var arr
            if (getCntChar(':', val) == 0) {
                arr = val
                if (arr.length == 1)
                    arr = "0" + arr + ":00"
                else if (arr.length == 2)
                    arr = arr + ":00"
                else if (arr.length == 4)
                    arr = arr.substr(0, 2) + ":" + arr.substr(2, 2)
                val = arr
            }
            else {
                arr = val.split(":")
                var str1 = arr[0]
                var str2 = arr[1]
                if (str1.length == 0)
                    str1 = "00"
                else if (str1.length == 1)
                    str1 = "0" + str1
                if (str2.length == 0)
                    str2 = "00"
                else if (str2.length == 1)
                    str2 = "0" + str2
                val = str1 + ":" + str2
            }
            if (negativeFlag == "-")
                obj.value = "-" + val
            else
                obj.value = val
        }
    }
    function IsvalidTime(txt) {
        
        var t1, t2, Hour, Min, arr, H, M
        if (getCntChar(':', txt) > 1)
            return (false)
        else if (getCntChar(':', txt) == 0) {
            if (txt.length == 2) {
                if (txt > 23)
                    return (false)
                else
                    return (true)
            }
            if (txt.length == 4) {
                H = txt.substr(0, 2)
                M = txt.substr(2, 2)
                if (H > 23 || M > 59)
                    return (false)
                else
                    return (true)
            }
            if (txt.length == 1 || txt.length == 2)
                return (true)
            else if (txt.length > 2)
                return (false)
            if (txt.length > 2)
                return (false)
        }
        else {
            arr = txt.split(":")
            Hour = parseInt(arr[0])
            Min = parseInt(arr[1])
            if (Hour > 23 || Min > 59)
                return (false)
            else
                return (true)
        }
    }
    function GetAccessCode(obj) {
        var RequsterAction = obj.id
        if (RequsterAction.indexOf('OToolBar_') != -1)
            RequsterAction = RequsterAction.replace('OToolBar_', '')
        return RequsterAction
    }
    var SignMenue = 0
    function onMouseOverDiv(obj, Sign) {
        obj.className = "CssDivSelected"
        SignMenue = 1
    }
    function onMouseDown(obj) {
        obj.className = ""
        SignMenue = 0
    }
    function onclickHidden(obj) {
        if (obj.firstChild.style.display == "inline") {
            document.getElementById("OToolBar_TRBtn").style.display = "none"
            document.getElementById("OToolBar_btnHidden").style.display = "none"
            document.getElementById("OToolBar_btnShow").style.display = "inline"
        }
        else {
            document.getElementById("OToolBar_TRBtn").style.display = "inline"
            document.getElementById("OToolBar_btnHidden").style.display = "inline"
            document.getElementById("OToolBar_btnShow").style.display = "none"
        }
    }
    function onclickDivMenue(obj, Len1, Len2) {
        if (document.getElementById("OToolBar_XTableToolBar") != null) {
            if (SignForMenue == 0)
                obj = document.getElementById("OToolBar_XTableToolBar")
            var Str = obj.getAttribute("SubMenue")
            newOBJ = document.getElementById("OToolBar_XTableToolBar")
            newOBJ = newOBJ.nextSibling
            while (newOBJ.nextSibling != null) {
                if (newOBJ.nextSibling != document.getElementById(Str))
                    if (newOBJ.nextSibling.style != null) {
                        newOBJ.nextSibling.style.display = "none"
                    }

                newOBJ = newOBJ.nextSibling
            }
            if (document.getElementById(Str) != null) {
                if (document.getElementById(Str).style.display == "inline")
                    document.getElementById(Str).style.display = "none"
                else {
                    var posX = obj.offsetLeft, posY = obj.offsetTop
                    while (obj.offsetParent) {
                        posX = posX + obj.offsetParent.offsetLeft
                        posY = posY + obj.offsetParent.offsetTop
                        if (obj == document.getElementsByTagName('body')[0])
                            break
                        else
                            obj = obj.offsetParent
                    }
                    document.getElementById(Str).style.top = posY + 27
                    if (Len1 > Len2)
                        document.getElementById(Str).style.left = posX
                    else
                        document.getElementById(Str).style.left = posX + (Len1 - Len2)
                    document.getElementById(Str).style.display = "inline"
                } 
            } 
        } 
    }
    function onclickBodyForMenue() {
        if (SignForMenue == 0)
            onclickDivMenue()
        else
            SignForMenue = 0
    }
    function onclickSubMenue(obj) {
        obj.className = ""
        obj.parentElement.style.display = "none"
    }
    var SignForMenue = 0
    function onclickXTableToolBar(obj, Len1, Len2) {
        SignForMenue = 1
        onclickDivMenue(obj, Len1, Len2)
    }
   function CorrectToolBar() {
        if (document.getElementById("OToolBar_TRBtn") != null) {
            var SubMenu, flag = true, FirstNode, Counter = 0, Tbl, FlagBase = true
            var obj = document.getElementById("OToolBar_TRBtn").cells(0).firstChild
            obj = obj.rows(0)
            for (var i = 0; i < obj.cells.length; i++) {
                if (obj.cells(i).firstChild.tagName == "TABLE") {
                    Tbl = obj.cells(i).firstChild
                    SubMenu = obj.cells(i).firstChild.rows(0).cells(1).subMenue
                    FlagBase = Tbl.cells(0).style.display == "none" ? false : true;
                    flag = true
                    Counter = 0
                    while (flag && $get(SubMenu).childNodes.length > Counter) {
                        if (document.getElementById(SubMenu).childNodes(Counter).id == Tbl.cells(0).id)
                            document.getElementById(SubMenu).childNodes(Counter).style.display = FlagBase ? "inline" : "none"
                        if (document.getElementById(SubMenu).childNodes(Counter).style.display != "none" && document.getElementById(SubMenu).childNodes(Counter).id != Tbl.cells(0).id) {
                            flag = false
                            if (!FlagBase) {
                                Tbl.cells(0).id = document.getElementById(SubMenu).childNodes(Counter).id
                                Tbl.cells(0).innerHTML = document.getElementById(SubMenu).childNodes(Counter).innerHTML
                                Tbl.cells(0).title = document.getElementById(SubMenu).childNodes(Counter).title
                                Tbl.cells(0).setAttribute("onclick", "")
                                eval("Tbl.cells(0).attachEvent('onclick',OnClick" + document.getElementById(SubMenu).childNodes(Counter).id.substr(9, document.getElementById(SubMenu).childNodes(Counter).id.length) + ")")
                                Tbl.cells(0).style.display = "inline"
                            }
                        }
                        Counter++
                    }
                    if (flag && !FlagBase)
                        Tbl.style.display = "none"
                    else if (flag && FlagBase)
                        Tbl.cells(1).style.display = "none"
                }
            }
        }
    }

    function datechk(obj) {
        var val = obj.value

        if ((val != "") && !Isvaliddate(val)) {
            alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
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
        //======================================just Enter English========================
        [ ].indexOf || (Array.prototype.indexOf = function (v, n) {
            n = (n == null) ? 0 : n; var m = this.length;
            for (var i = n; i < m; i++)
                if (this[i] == v)
                    return i;
            return -1;
        });
        var Farsi = ['1590', '1589', '1579', '1602', '1601', '1594', '1593', '1607', '1582', '1581', '1580', '1670', '1588', '1587', '1740', '1576', '1604', '1575', '1578', '1606', '1605', '1705', '1711', '1592', '1591', '1586', '1585', '1584', '1583', '1574', '1608', '1662'];
        var English = ['113', '119', '101', '114', '116', '121', '117', '105', '111', '112', '91', '93', '97', '115', '100', '102', '103', '104', '106', '107', '108', '59', '39', '122', '120', '99', '118', '98', '110', '109', '44', '92'];
        function keyEnter(field, e) {
            if (window.event) {
                keynum = e.keyCode;
            }
            else if (e.which) {
                keynum = e.which;
            }
            var FarsiIndex = Farsi.indexOf(keynum.toString());
            if (FarsiIndex != -1) {
                var EnglishCode = English[FarsiIndex];
                field.value += String.fromCharCode(EnglishCode);
                return false;
            }
            else {
                return true;
            }
        }
        //===============================================================
        function CorrectGridClass(OGridClass) {
            for (var i = 0; i < OGridClass.rows.length; i++)
                OGridClass.rows(i).className = i % 2 == 0 ? "CssItemStyle" : "CssAlternatingItemStyle";
        }
        //-----------------------input: مقدار وارد شده برای تبدیل --------------------------
        var keyStr = "ABCDEFGHIJKLMNOP" +
                "QRSTUVWXYZabcdef" +
                "ghijklmnopqrstuv" +
                "wxyz0123456789+/" +
                "=";
        function encode64(input) {

            input = escape(input);

            var output = "";
            var chr1, chr2, chr3 = "";
            var enc1, enc2, enc3, enc4 = "";
            var i = 0;

            do {

                chr1 = input.charCodeAt(i++);
                chr2 = input.charCodeAt(i++);
                chr3 = input.charCodeAt(i++);

                enc1 = chr1 >> 2;
                enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                enc4 = chr3 & 63;

                if (isNaN(chr2)) {
                    enc3 = enc4 = 64;

                } else if (isNaN(chr3)) {
                    enc4 = 64;
                }

                output = output +
            keyStr.charAt(enc1) +
            keyStr.charAt(enc2) +
            keyStr.charAt(enc3) +
            keyStr.charAt(enc4);

                chr1 = chr2 = chr3 = "";
                enc1 = enc2 = enc3 = enc4 = "";
            } while (i < input.length);
            return output;
        }