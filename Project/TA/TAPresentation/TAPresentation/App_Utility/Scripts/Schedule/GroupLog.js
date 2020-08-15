document.getElementsByTagName("body")[0].scroll = "no";

function OnClickBtnFilter() {
    $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
    $get(MasterObj + "txtKCalSDate").value = document.getElementById(MasterObj + "txtKCalSDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalSDate").value;
    $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
    $get(MasterObj + "txtKCalEDate").value = document.getElementById(MasterObj + "txtKCalEDate").value == "//" ? "" : document.getElementById(MasterObj + "txtKCalEDate").value;
    if (document.getElementById(MasterObj + "txtKCalEDate").value < document.getElementById(MasterObj + "txtKCalSDate").value)
        alert("تاريخ شروع بزرگتر از تاريخ پايان است");
    else {
        $("#" + MasterObj + "txtSubmit").val("Filter");
        $("#" + MasterObj + "BtnSubmit").click();
    }
}