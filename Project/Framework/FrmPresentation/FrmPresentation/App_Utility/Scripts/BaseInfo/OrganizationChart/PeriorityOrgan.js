var LastSelectedRow = null;
var LastSelectedRowClass = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";



function OnClickGrd(SelectedRow) {

    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}

function OnClickBtnOk() {

    if (LastSelectedRow == null) {
        alert('لطفا یک واحد سازمانی انتخاب شود')
        returnValue = 0
    }
    else {
        returnValue = LastSelectedRow.getAttribute("Periority");
        window.close();
    }
}
function OndbClickGrd(SelectedRow) {
    LastSelectedRow = SelectedRow;
    OnClickBtnOk();
}
