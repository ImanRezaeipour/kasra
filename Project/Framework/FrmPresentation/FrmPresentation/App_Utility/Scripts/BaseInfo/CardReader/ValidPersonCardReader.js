
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var Str = ""
        var str1 = ""
        var s = $get(MasterObj + "txtXML").value
        var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocSave.loadXML(s);
        document.body.dir = "rtl";
        var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/GetValidPersonCard[Chk=1]");
        for (i = 0; i < XmlNodeTmp.length; i++) {       
            str1 += "<GetValidPersonCard>";
            str1 += "<Chk>1</Chk>"
            str1 += "<ValidID>" + XmlNodeTmp.item(i).selectSingleNode('ValidID').text + "</ValidID>"
            str1 += "<MemberID>" + XmlNodeTmp.item(i).selectSingleNode('MemberID').text + "</MemberID>"
            str1 += "<Type>" + XmlNodeTmp.item(i).selectSingleNode('Type').text + "</Type>"
            str1 += "</GetValidPersonCard>"
//            alert(str1)

        }
         
        //##################################################اصلی
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtActionXml').value)
        //################################################        
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        ChangeActionCombo();
        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {
            

            var StrVal = $get(MasterObj + "txtSubmit").value
            $get(MasterObj + "txtSubmit").value = "";

            if (StrVal != "") {
                if ($get(MasterObj + "lblTo").value == "") {
                    document.getElementById('OToolBar_txtFromData').value = "";
                    document.getElementById('OToolBar_txtToData').value = "";
                    document.getElementById('OToolBar_txtTotalData').value = "";

                    document.getElementById('OToolBar_BtnNext').disabled = true;
                    document.getElementById('OToolBar_BtnPrv').disabled = true;
                    document.getElementById('OToolBar_BtnFirst').disabled = true;
                    document.getElementById('OToolBar_BtnLast').disabled = true;
                }
                else if ($get(MasterObj + "lblTo").value != "") {
                    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                        document.getElementById('OToolBar_BtnNext').disabled = true
                    else
                        document.getElementById('OToolBar_BtnNext').disabled = false;

                    if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                        document.getElementById('OToolBar_BtnPrv').disabled = true
                    else
                        document.getElementById('OToolBar_BtnPrv').disabled = false;

                    document.getElementById('OToolBar_BtnFirst').disabled = false;
                    document.getElementById('OToolBar_BtnLast').disabled = false;
                }
                if (StrVal == "Delete") {
                    if (document.getElementById(MasterObj + "txtValidate").value == "1") {
                        SetMsg(document.getElementById(MasterObj + "txtAlert").value);
                        str1 = "";
                    }
                    else
                        alert(document.getElementById(MasterObj + "txtAlert").value);
                    LastSelectedRow.className = LastSelectedRowClass;
                    LastSelectedRow = null;
                }

            }
            SetChk();
        }
        //============================================================================================

        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById('OToolBar_BtnPrv').disabled = true;
        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
            document.getElementById('OToolBar_BtnNext').disabled = true
        else
            document.getElementById('OToolBar_BtnNext').disabled = false;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtCauseIDTmp").value = document.getElementById(MasterObj + "CmbCause").value;
            document.getElementById(MasterObj + "txtValidTypeTmp").value = document.getElementById("RadHard").checked && !document.getElementById("RadSoft").checked ? "1" : !document.getElementById("RadHard").checked && document.getElementById("RadSoft").checked ? "2" : "0";
            document.getElementById(MasterObj + "txtActionIDTmp").value = document.getElementById(MasterObj + "CmbAction").value;
            document.getElementById(MasterObj + "txtCardGroupTmp").value = document.getElementById(MasterObj + "CmbCardReader").value;
            document.getElementById(MasterObj + "txtPersonCodeTemp").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;

            document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
            document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value;
            document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "SDate").value == "//" ? "" : document.getElementById(MasterObj + "SDate").value;
            document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "EDate").value == "//" ? "" : document.getElementById(MasterObj + "EDate").value;

            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        
        function OnClickBtnNew() {
            var strUrl = 'ValidPersonCardReaderNew.aspx?ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 560px;dialogWidth:  850px;center: Yes;help: no;status: no')

            if (rValue == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //==================================================================================
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtCauseIDTmp").value = "0";
            document.getElementById(MasterObj + "CmbCause").value = "0";
            document.getElementById(MasterObj + "txtValidTypeTmp").value = "0";
            document.getElementById("RadHard").checked = true;
            document.getElementById("RadSoft").checked = true;
            document.getElementById(MasterObj + "txtActionIDTmp").value = "0";
            document.getElementById(MasterObj + "CmbAction").value = "0";
            document.getElementById(MasterObj + "txtCardGroupTmp").value = "0";
            document.getElementById(MasterObj + "CmbCardReader").value = "0";
            document.getElementById(MasterObj + "txtPersonCodeTemp").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtPCode").value = "";
            document.getElementById(MasterObj + "CmbPerson_txtName").value = "";
            document.getElementById(MasterObj + "KCalSDate_txtYear").value = "";
            document.getElementById(MasterObj + "KCalSDate_txtMonth").value = "";
            document.getElementById(MasterObj + "KCalSDate_txtDay").value = "";
            document.getElementById(MasterObj + "KCalEDate_txtYear").value = "";
            document.getElementById(MasterObj + "KCalEDate_txtMonth").value = "";
            document.getElementById(MasterObj + "KCalEDate_txtDay").value = "";
            document.getElementById(MasterObj + "SDate").value = "";
            document.getElementById(MasterObj + "EDate").value = "";
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //============================================================================
        function LoadComboAction(Sign) {
            var CmbObj = document.getElementById(MasterObj + "CmbAction");
            CmbObj.innerHTML = "";
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo");
            var optionEl = document.createElement("OPTION");
            CmbObj.options.add(optionEl);
            CmbObj.all(0).value = "0";
            CmbObj.all(0).innerText = 'انتخاب نشده';
            var j = 0;
            if (oXmlNodes.length != 0)
                for (var i = 0; i < oXmlNodes.length; i++) {
                if (oXmlNodes.item(i).selectSingleNode("Title").text.split("#")[1] == Sign || Sign == 0) {
                    var optionEl = document.createElement("OPTION");
                    CmbObj.options.add(optionEl);
                    CmbObj.all(j + 1).value = oXmlNodes.item(i).selectSingleNode("Val").text;
                    CmbObj.all(j + 1).innerText = oXmlNodes.item(i).selectSingleNode("Title").text.split("#")[0];
                    j++;
                }
            }
        }
        //==========================================================================
        function ChangeActionCombo() {
            if (document.getElementById("RadHard").checked && !document.getElementById("RadSoft").checked) {
                LoadComboAction(1);
            }
            else
                if (document.getElementById("RadSoft").checked && !document.getElementById("RadHard").checked) {
                LoadComboAction(2);
            }
            else
                LoadComboAction(0);
        }
      
        //======================================================================
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) {
                document.getElementById(MasterObj + "txtID").value = LastSelectedRow.ValidID;
                var Xml = "<Root><" + LastSelectedRow.Type + "><ID>" + LastSelectedRow.MemberID + "</ID><Name>" + LastSelectedRow.cells(1).firstChild.innerText + "</Name></" + LastSelectedRow.Type + "></Root>";
                var strUrl = 'ValidPersonCardReaderNew.aspx?ToPersonId=' + encode64($get(MasterObj + "txtOnLineUser").value)
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                + "&ID=" + encode64(document.getElementById(MasterObj + "txtID").value)
                + "&HashFlag=1";
//                + "&Xml=" + Xml
//                + "&SDate=" + LastSelectedRow.cells(3).firstChild.innerText
//                + "&EDate=" + LastSelectedRow.cells(4).firstChild.innerText
//                + "&ValidType=" + LastSelectedRow.ValidType
//                + "&CauseID=" + LastSelectedRow.CauseID
//                + "&ActionID=" + LastSelectedRow.ActionID
//                + "&CardGroup=" + LastSelectedRow.CardReaderGroupID
//                + "&Desc=" + LastSelectedRow.cells(9).firstChild.innerText
//                + "&Flag=" + LastSelectedRow.getAttribute("Flag");


                var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 560px;dialogWidth:  850px;center: Yes;help: no;status: no')

                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("لطفا يک سطر را انتخاب کنيد");
            }
        }
        //======================================================================
        function OndbClickGrd() {
            OnClickBtnEdit();
        }

        //=================================================== Chkتيک خوردن همه ============================================

        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdValidPersonCard");
            var grdLen = OGrid.rows.length;

            if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
               OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //==============================================OnClickChk======================================================
        function OnClickChk(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var ValidID = TbObj.rows(RowIndex).getAttribute("ValidID")
            var MemberID = TbObj.rows(RowIndex).getAttribute("MemberID")
            var Type = TbObj.rows(RowIndex).getAttribute("Type")

           var strXML = "<BaseInfoEntity>"+ str1 + "</BaseInfoEntity>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<BaseInfoEntity></BaseInfoEntity>") && (strXML != "<BaseInfoEntity/>"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/GetValidPersonCard[ ValidID=" + ValidID + " and MemberID=" + MemberID + " and Type='" + Type + "']");
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true)
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                str1 = oXmlDocSave.xml;
                str1 = str1.replace("<BaseInfoEntity>", "")
                str1 = str1.replace("</BaseInfoEntity>", "")

            }
            else {

                str1 += "<GetValidPersonCard>";
                str1 += "<Chk>1</Chk>"
                str1 += "<ValidID>" + ValidID + "</ValidID>"
                str1 += "<MemberID>" + MemberID + "</MemberID>"
                str1 += "<Type>" + Type + "</Type>"
                str1 += "</GetValidPersonCard>";
                SetChk()
            }
        }
        //================================================SetChk====================================================
        function SetChk() {
       
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            var strXML = "<BaseInfoEntity>" + str1 + "</BaseInfoEntity>";
            oXml.loadXML(strXML);
            var XmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/GetValidPersonCard");
            if (XmlNode.length != 0) {
                var OGrid = document.getElementById("GrdValidPersonCard");
                if (OGrid != null) {
                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;
                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("GetValidPersonCard[ValidID=" + OGrid.rows(i).getAttribute("ValidID") + " and MemberID=" + OGrid.rows(i).getAttribute("MemberID") + " and Type='" + OGrid.rows(i).getAttribute("Type") + "']");                     
                        if (XmlNode1.length != 0) {
                            if (XmlNode1.item(0).selectSingleNode('Chk').text.toString() == "1")
                                OGrid.rows(i).cells(0).firstChild.checked = true
                            else
                                OGrid.rows(i).cells(0).firstChild.checked = false
                        }
                    }

                }
            }
        }
// =============================================حذف ==================================================
        function OnClickBtnDelete() {
            var OGrid = document.getElementById("GrdValidPersonCard");
            var strXML = "<Root>" + str1 + "</Root>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
//                       alert(strXML)
            var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("GetValidPersonCard[Chk=1]");
         
//                     alert(XmlNodeTmp.length)
            if (XmlNodeTmp.length != 0) {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {
//                alert()
                    document.getElementById(MasterObj +"txtXMLDel").value = strXML
//                  alert( document.getElementById(MasterObj +"txtXMLDel").value)
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();

                }
            }
            
            else
                alert("به منظور حذف یک سطر را انتخاب کنید")

            
        }
   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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












   