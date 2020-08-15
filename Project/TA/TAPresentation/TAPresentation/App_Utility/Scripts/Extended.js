
//============================================================New
function OnChangeXml(P1,P2,P3,P4,P5) {
    alert(P1)
    P1 = P1 != null ? document.getElementById(MasterObj + P1) : null;    
    P2 = P2 != null ? document.getElementById(MasterObj + P2) : null;    
    P3 = P3 != null ? document.getElementById(MasterObj + P3) : null;    
    P4 = P4 != null ? document.getElementById(MasterObj + P4) : null;    
    P5 = P5 != null ? document.getElementById(MasterObj + P5) : null;

    P1 = P1 != null ? ((P1.tagName == "SCRIPT") ? eval("document.getElementById(MasterObj+'" + HideElement + "'_txtCalendar)") : P1) : null;
    P2 = P2 != null ? ((P2.tagName == "SCRIPT") ? eval("document.getElementById(MasterObj+'" + HideElement + "'_txtCalendar)") : P2) : null;
    P3 = P3 != null ? ((P3.tagName == "SCRIPT") ? eval("document.getElementById(MasterObj+'" + HideElement + "'_txtCalendar)") : P3) : null;
    P4 = P4 != null ? ((P4.tagName == "SCRIPT") ? eval("document.getElementById(MasterObj+'" + HideElement + "'_txtCalendar)") : P4) : null;
    P5 = P5 != null ? ((P5.tagName == "SCRIPT") ? eval("document.getElementById(MasterObj+'" + HideElement + "'_txtCalendar)") : P5) : null;

    alert(P1 + "   " + P2 + "   " + P3 + "   " + P4 + "   " + P5)


}
//===================================================================
function NewExendeCode() {
    var StrXml = "";
    var OExGrid = DivExtended.firstChild;
    if (OExGrid.rows != undefined && OExGrid.rows != null) {
        if (OExGrid.rows.length > 0) {
            for (var i = 0; i < OExGrid.rows.length; i++) {
                if (OExGrid.rows(i).cells(0).firstChild.tagName != "FIELDSET") {
                    if (OExGrid.rows(i).cells(1) != null)
                        if (OExGrid.rows(i).cells(1).firstChild != null) {
                            SetClearData(OExGrid.rows(i).cells(1).firstChild);
                        }
                    if (OExGrid.rows(i).cells(3) != null) {
                        if (OExGrid.rows(i).cells(3).firstChild != null) {
                            SetClearData(OExGrid.rows(i).cells(3).firstChild);
                        }
                    }
                }
                else {
                    var OGrid = OExGrid.rows(i).cells(0).firstChild.childNodes(1);
                    for (var j = 0; j < OGrid.rows.length; j++) {
                        if (OGrid.rows(j).cells(1) != null)
                            if (OGrid.rows(j).cells(1).firstChild != null) {
                                SetClearData(OGrid.rows(j).cells(1).firstChild);
                            }
                        if (OGrid.rows(j).cells(3) != null)
                            if (OGrid.rows(j).cells(3).firstChild != null) {
                                SetClearData(OGrid.rows(j).cells(3).firstChild);
                            }
                    }
                }
            }
        }
    }
}
    //========================================================================
    //*******************************************************************************
    function SetClearData(Obj) {
        if (Obj.tagName == "SCRIPT") {
            eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtYear').value=''; document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtMonth').value='';document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtDay').value='';document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtCalendar').value='';");
            eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "').value='" + Obj.parentElement.Default);
        }
        else if (Obj.tagName == "INPUT") {
            if (Obj.getAttribute("type") == "checkbox")
                Obj.checked = Obj.parentElement.Default;
            else Obj.value = Obj.parentElement.Default;
        }
        else if (Obj.tagName == "LINK")
            eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtCode').value='" + Obj.parentElement.Default + "';" + "document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtName').value=''; document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_BtnDown').click();");
        else Obj.value = Obj.parentElement.Default;
    }
    //*******************************************************************************
    function SaveExtendedCode(TextBox) { 
        var StrXml = "";
        var OExGrid = DivExtended.firstChild;
        
        if (OExGrid.rows != undefined && OExGrid.rows != null) {
            if (OExGrid.rows.length > 0) {
                StrXml = "<" + document.getElementById(MasterObj + "txtFirstTagName").value + ">";

                for (var i = 0; i < OExGrid.rows.length; i++) {
                    if (OExGrid.rows(i).cells(0).firstChild.tagName != "FIELDSET") {
                        if (OExGrid.rows(i).cells(1) != null) {
                            if (OExGrid.rows(i).cells(1).firstChild != null) {

                                if (CheckValidData(OExGrid.rows(i).cells(1), OExGrid.rows(i).cells(0).firstChild.innerText)) {
                                    StrXml = StrXml + "<" + OExGrid.rows(i).cells(1).Tag + ">" + GetData(OExGrid.rows(i).cells(1).firstChild) + "</" + OExGrid.rows(i).cells(1).Tag + ">"
                                }
                                else return false;
                            }
                        }
                        if (OExGrid.rows(i).cells(3) != null) {
                            if (OExGrid.rows(i).cells(3).firstChild != null) {
                                 
                                if (CheckValidData(OExGrid.rows(i).cells(3), OExGrid.rows(i).cells(2).firstChild.innerText)) {
                                    StrXml = StrXml + "<" + OExGrid.rows(i).cells(3).Tag + ">" + GetData(OExGrid.rows(i).cells(3).firstChild) + "</" + OExGrid.rows(i).cells(3).Tag + ">"
                                }
                                else return false;
                            }
                        }
                    }
                    else {
                        var OGrid = OExGrid.rows(i).cells(0).firstChild.childNodes(1);
                        StrXml = StrXml + "<" + OExGrid.rows(i).cells(0).firstChild.Tag + ">"
                        for (var j = 0; j < OGrid.rows.length; j++) {
                            if (OGrid.rows(j).cells(1) != null)
                                if (OGrid.rows(j).cells(1).firstChild != null) {
                                    if (CheckValidData(OGrid.rows(j).cells(1), OGrid.rows(j).cells(0).firstChild.innerText)) {
                                        StrXml = StrXml + "<" + OGrid.rows(j).cells(1).Tag + ">" + GetData(OGrid.rows(j).cells(1).firstChild) + "</" + OGrid.rows(j).cells(1).Tag + ">"
                                    }
                                    else {
                                        return false;
                                    }
                                }
                            if (OGrid.rows(j).cells(3) != null)
                                if (OGrid.rows(j).cells(3).firstChild != null) {
                                    if (CheckValidData(OGrid.rows(j).cells(3), OGrid.rows(j).cells(2).firstChild.innerText)) {
                                        StrXml = StrXml + "<" + OGrid.rows(j).cells(3).Tag + ">" + GetData(OGrid.rows(j).cells(3).firstChild) + "</" + OGrid.rows(j).cells(3).Tag + ">"
                                    }
                                    else return false;
                                }

                        }
                        StrXml = StrXml + "</" + OExGrid.rows(i).cells(0).firstChild.Tag + ">";
                    }
                }
                StrXml = StrXml + "</" + document.getElementById(MasterObj + "txtFirstTagName").value + ">";
                eval("document.getElementById(MasterObj +'" + TextBox + "').value ='" + StrXml + "'");
              
            }
        }
        
        return true;
    }
    //====================================================
    function CheckValidData(Obj, Caption) {
        var ObjEx = "Xml" + Obj.Tag;
        var flag = true;
        if (Obj.firstChild.tagName == "SCRIPT")
            ObjEx = "Xml" + Obj.Tag + "_txtYear";
        else if (Obj.firstChild.tagName == "LINK") {
            ObjEx = "Xml" + Obj.Tag + "_txtPCode";
            var i = 0;

            while ((i < $get(MasterObj + ObjEx).value.length) && flag) {                
                if (parseInt($get(MasterObj + ObjEx).value.substr(i, 1)).toString() == "NaN") {
                   flag = false;                 
               }
               i++;              
            }           
            if (!flag) {
                $get(MasterObj + ObjEx).value = "";             
            }
        }
        if (Obj.Require == "True") {
            if (ObjEx != "") {
                if ($get(MasterObj + ObjEx).value == "" ) {
                    alert(Caption + " را وارد کنيد");
                    $get(MasterObj + ObjEx).focus();
                    return false;
                }
            }
            else if (Obj.firstChild.value == "") {
                alert(Caption + " را وارد کنيد");
                $get(MasterObj + ObjEx).focus();
                return false;
            }
        }
        return true;
    }
    //*******************************************************************************
    function GetData(Obj) {
        if (Obj.tagName == "SPAN") Obj = Obj.firstChild;
        if (Obj.tagName == "SCRIPT")
            return eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtYear').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtMonth').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtDay').value");
        else if (Obj.tagName == "INPUT") {
            if (Obj.getAttribute("type") == "checkbox")
                return Obj.checked ? "1" : "0";
            if (Obj.getAttribute("Kind").trim() == "Time") {
                if (Obj.value != "") {
                    return parseInt(Obj.value.split(":")[0]) * 60 + parseInt(Obj.value.split(":")[1]);
                }
            }
        }
        else if (Obj.tagName == "LINK")
            return eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtCode').value");
        else if (Obj.tagName == "DIV")
            return Obj.value == undefined ? "" : Obj.value;
        else if (Obj.tagName == "IMG") {
            if (Obj.getAttribute("Kind").trim() == "BtnTimeSheetCell") 
                Obj.value = Obj.getAttribute("XmlValue");
        }
        return Obj.value;
    }
    //=======================================================
    function OnClickHLinkXml(obj) {
        var PARENT = obj.parentElement;
        var Result = window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/XmlField/SelectFile.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value, window, "dialogHeight:200px;dialogWidth:600px;center: Yes;help: no;status: no");
        if (Result != null) {
            PARENT.setAttribute("value", PARENT.getAttribute("value") != undefined ? PARENT.getAttribute("value") + "*" + Result.split(":")[0] : Result.split(":")[0]);
            SetInfoLink(Result.split(":")[1], PARENT);
        }
    }
    //===================================================================================
    function SetInfoLink(Result, Parent) {
        var SubResult = "";
        for (var i = 0; i < Result.split("*").length; i++) {
            SubResult = Result.split("*")[i];
            Parent.innerHTML += "<SPAN><br style='font-size:1'/><span style='text-decoration:underline;color:Blue;cursor:pointer;'  onclick='GetFile(this)' fileName=" + SubResult.split("?")[2] + " FileID=" + SubResult.split("?")[0] + "><img src='/FrmPresentation/App_Utility/Images/Icons/Attachment.gif'/>" + SubResult.split("?")[1] + "</span><img src='/FrmPresentation/App_Utility/Images/Icons/DelIcon.gif' onclick='DeleteFile(this)' style='cursor:pointer' /></SPAN>";
        }
    }
    //----------------------------------------------------
    function GetFile(obj) {
        window.open("/FrmPresentation/App_Utility/Images/Upload/Extended/" + obj.fileName);
    }
    //---------------------------------------------------
    function DeleteFile(obj) {
        var Span = obj.parentElement;
        Span.parentElement.value = Span.parentElement.value.replace("*" + Span.childNodes(1).FileID + "?" + Span.childNodes(1).innerText, "");
        Span.parentElement.value = Span.parentElement.value.replace(Span.childNodes(1).FileID + "?" + Span.childNodes(1).innerText, "");
        Span.parentElement.removeChild(Span);
    }
    //====================================================================================
    function OnClickBtnTimeSheetCell(obj) {
        var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
        var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

        if ($get(MasterObj + "CmbPerson_txtCode").value == "") {
            alert("لطفا پرسنل مورد نظر خود را انتخاب نماييد");
            $get(MasterObj + "CmbPerson_txtPCode").focus();
        }
        else if (SDate == "//") {
            alert("لطفا تاريخ شروع مجوز را وارد نماييد");
            $get(MasterObj + "KCalSDate_txtCalendar").focus();
            return false;
        }
        else if (EDate == "//") {
            alert("لطفا تاريخ پايان مجوز را وارد نماييد");
            $get(MasterObj + "KCalEDate_txtCalendar").focus();
            return false;
        }
        else {
            var url = "/TshPresentation/App_Pages/TimeSheetCell/EnterTimeSheetInfo.aspx"
            var winPro = "dialogWidth:" + window.screen.width + ";dialogHeight:630px;center: Yes;help: no;status:no#1;minimize: yes;resizable:yes";
            url += "?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&Extended=1"
                + "&PCode=" + $get(MasterObj + "CmbPerson_txtCode").value
                + "&Date=" + $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            
            
            returnValue = window.showModalDialog(encodeURI(url), "", winPro);
            if (returnValue != null && returnValue != undefined) {
                obj.setAttribute("XmlValue", returnValue);

            }
        }
    }
    //====================================================================================