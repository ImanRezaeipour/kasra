/*
--------------------------------------------
نوشته شده توسط بهاره قدمي در 1389/03/02
--------------------------------------------
براي استفاده از راهنمای رنگ در صفحه مربوطه باید آرایه ای مشابه وهمنام با آرایه زیر شامل رنگ ها و توضیح کاملا خلاصه تعریف نمائید
var arrColor = {
0: ["lightgrey", "روزهاي جمعه"],
1: ["#ffdfe7", "تعطيلات رسمي"],
2: ["OldLace", "کارت ناقصي"]
};
--------------------------------------------
برای اینکه دکمه های پيش فرض نمایش داده شود 
ShowDefaultShortKeys(1)
var arrShortKey = {
0: ["Shift + Escape", "انصراف"]}
*/
var isMain = false;
var MainKey; //Shift
var key, Help = 49//72 ;                //H

var ScX = 50, ScY = 200, ScWidth = 258, ScHeight = 0, EachRowHeight = 25.7;
var oPopup = window.createPopup()
var indxKeys = 0, vShowDefault = 0
var arrDefault = { 0: ["Shift + F2", "ايجاد"] };
function ShowDefaultShortKeys(value) {
    if (value)
        vShowDefault = 1
    else
        vShowDefault = 0
}
function Master_onkeyup() {
    if (window.event.keyCode == MainKey) isMain = false;
}
function InvisPopUp1() {
    oPopup.hide()
}
function ShowPopUp_Master() {
    if (indxKeys == 0)
        return
    var oPopupBody = oPopup.document.body
    oPopupBody.className = "CssPage"
    oPopupBody.style.backgroundColor = "#e7eeff"
    oPopupBody.dir = "rtl"
    oPopup.document.body.innerHTML = document.getElementById("DivShortKeysInfo").innerHTML
    //var Y = screen.availWidth/3
    //var X = screen.availHeight/2
    oPopup.show(ScX, ScY, ScWidth, ScHeight)
}
function AddRowKeys(ShortKey, Caption, ColType) { //ColType=1 For Show Color Description
    var oGrid = document.getElementById("GrdShortKey")
    oGrid.insertRow()
    if (indxKeys % 2 == 0)
        oGrid.rows(indxKeys).style.backgroundColor = "#d5e1fd"
    else
        oGrid.rows(indxKeys).style.backgroundColor = "OldLace"
    oGrid.rows(indxKeys).insertCell()
    oGrid.rows(indxKeys).insertCell()
    if (ColType == 1) {
        oGrid.rows(indxKeys).cells(0).innerText = Caption
        oGrid.rows(indxKeys).cells(1).innerHTML = " <div style='border: thin groove white; width:30px; background-color:" + ShortKey + ";'></div>"
    }
    else {
        oGrid.rows(indxKeys).cells(0).innerText = ShortKey
        oGrid.rows(indxKeys).cells(1).innerText = Caption
    }
    oGrid.rows(indxKeys).cells(0).align = "Right"
    oGrid.rows(indxKeys).cells(0).style.width = "200px"
    oGrid.rows(indxKeys).cells(1).style.width = "130px"
    indxKeys++;
}
function CreateDivShortKeys() {
    var i = 0;
    if (vShowDefault == 1) {
        while (arrDefault[i]) {
            AddRowKeys(arrDefault[i][1], arrDefault[i][0], 0)
            ScHeight = ScHeight + EachRowHeight;
            i++;
        }
    }
    i = 0;
    if (typeof arrMyShortKey == 'object') {
        while (arrMyShortKey[i]) {
            AddRowKeys(arrMyShortKey[i][1], arrMyShortKey[i][0], 0)
            ScHeight = ScHeight + EachRowHeight;
            i++;
        }
    }
    i = 0;
    if (typeof arrShortKey == 'object') {
        while (arrShortKey[i]) {
            AddRowKeys(arrShortKey[i][1], arrShortKey[i][0], 0)
            ScHeight = ScHeight + EachRowHeight;
            i++;
        }
    }
    i = 0;
    if (typeof arrColor == 'object') {
        while (arrColor[i]) {
            AddRowKeys(arrColor[i][0], arrColor[i][1], 1);
            ScHeight = ScHeight + EachRowHeight;
            i++;
        }
    }
    if (i < 4)
        ScHeight = ScHeight + 5
}