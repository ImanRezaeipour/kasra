

        var LastSelectedRow = null
        var LastSelectedRowClass = "";
        var PageSize = 10;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var OSelectedMamber = "";
        window.returnValue = 0;

        document.body.scroll = "no"
        
     //   alert(document.getElementById(MasterObj + "txtXmlValidPersonFlag").value);


        //##################################################اصلی
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtActionXml').value)
        //################################################
        if (document.getElementById(MasterObj + "txtID").value == "0") {
            ChangeActionCombo();
            $get(MasterObj + "txtSaveXml").value = "<Root></Root>";
        }
        else {
            ChangeActionCombo();
            SetDate();
            document.getElementById(MasterObj + "CmbAction").value = document.getElementById(MasterObj + "txtActionEdit").value;
            // CreateGrid("First");
            document.getElementById("OToolBar_BtnSelect").style.visibility = "hidden";
            document.getElementById("RadRole").disabled = true;
            document.getElementById("RadGroup").disabled = true;
            document.getElementById("RadPerson").disabled = true;
            document.getElementById("RadTableOff").disabled = true;
           // XTabTable.rows(0).cells(0).disabled = true;
        }

        if (document.getElementById(MasterObj + "txtFlag").value == "0" && document.getElementById(MasterObj + "txtID").value != "0") {
            CreateGrid("First");
            XTabTable.rows(0).cells(0).disabled = true;
        }
        else if(document.getElementById(MasterObj + "txtFlag").value != "0" && document.getElementById(MasterObj + "txtID").value != "0")
            CreateGridValidPersonCardFlag();
        //====================================================================================
        function SetDate() {
            $get(MasterObj + "KCalSDate_txtYear").value = document.getElementById(MasterObj + "SDate").value.substr(6, 4);
            $get(MasterObj + "KCalSDate_txtMonth").value = document.getElementById(MasterObj + "SDate").value.substr(3, 2);
            $get(MasterObj + "KCalSDate_txtDay").value = document.getElementById(MasterObj + "SDate").value.substr(0, 2);

            $get(MasterObj + "KCalEDate_txtYear").value = document.getElementById(MasterObj + "EDate").value.substr(6, 4);
            $get(MasterObj + "KCalEDate_txtMonth").value = document.getElementById(MasterObj + "EDate").value.substr(3, 2);
            $get(MasterObj + "KCalEDate_txtDay").value = document.getElementById(MasterObj + "EDate").value.substr(0, 2);
        }
        //====================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";        
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {

            
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value;
            if (StrVal != "") {
                if (StrVal == "Save") {                    
                    if ($get(MasterObj + "txtValidate").value == "1" && $get(MasterObj + "txtID").value == "0") {
                        $get(MasterObj + "txtSaveXml").value = "<Root></Root>";
                        $get(MasterObj + "KCalSDate_txtYear").value = "";
                        $get(MasterObj + "KCalSDate_txtMonth").value = "";
                        $get(MasterObj + "KCalSDate_txtDay").value = "";
                        $get(MasterObj + "KCalEDate_txtYear").value = "";
                        $get(MasterObj + "KCalEDate_txtMonth").value = "";
                        $get(MasterObj + "KCalEDate_txtDay").value = "";
                        //$get(MasterObj + "CmbCardGroup").value = "0";
                        $get(MasterObj + "CmbCause").value = "0";
                        $get(MasterObj + "CmbAction").value = "0";
                        $get(MasterObj + "RadHard").checked = true;
                        $get(MasterObj + "txtDesc").value = "";                                         
                        window.returnValue = 1;               
                    }
                    CreateGrid("First");
                    if ($get(MasterObj + "txtID").value != "0") {
                        XTabTable.rows(0).cells(0).disabled = true;
                        window.returnValue = 1;      
                    }
                    alert($get(MasterObj + "txtAlert").value);
                    window.close();
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                CreateGrid("Next")
        }
        //*******************************************************************************
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1)
                CreateGrid("Previous")
        }
        //*******************************************************************************
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                CreateGrid("Const")
            }
        }
        //*******************************************************************************
        function OnClickBtnLast() {
            CreateGrid("Last")
        }
        //*******************************************************************************
        function OnClickBtnFirst() {
            CreateGrid("First")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       
        //***********************************گرید********************************************
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }       
        //*******************************************************************************
        function ClearRowGrid() {
            var oGrid = XTabTable
            while (oGrid.rows.length > 0) {
                oGrid.deleteRow(oGrid.rows.length - 1);
            }
        }       
        //*******************************************************************************
        function CreateGrid(direction) {
            ClearRowGrid()            
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + "txtSaveXml").value)
//                alert($get(MasterObj + "txtSaveXml").value)
             

                var xmlNodesG = oXmlDoc.documentElement.selectNodes("/Root/G")
                var xmlNodesD = oXmlDoc.documentElement.selectNodes("/Root/D")
                var xmlNodesP = oXmlDoc.documentElement.selectNodes("/Root/P")
                var xmlNodesT = oXmlDoc.documentElement.selectNodes("/Root/T")

                var PNum, GNum, DNum,TNum
                PNum = xmlNodesP.length;
                DNum = xmlNodesD.length;
                GNum = xmlNodesG.length;
                TNum = xmlNodesT.length;
//                alert(DNum)
                $get(MasterObj + "lblTotal").value = PNum + GNum + DNum + TNum;
                //================================Paging
                var totalRecords
                totalRecords = $get(MasterObj + "lblTotal").value;
                $get(MasterObj + "Totalpage").value = Math.ceil(totalRecords / PageSize)

                if (totalRecords > 0) {
                    currentPage_X = parseInt((($get(MasterObj + "txtCurPage").value == "") ? "1" : $get(MasterObj + "txtCurPage").value))

                    switch (direction) {
                        case "Const":
                            currentPage_X = currentPage_X
                            break
                        case "Next":
                            currentPage_X = parseInt(currentPage_X) + 1
                            break
                        case "Previous":
                            currentPage_X = parseInt(currentPage_X) - 1
                            break
                        case "First":
                            currentPage_X = 1
                            break
                        case "Last":
                            currentPage_X = parseInt($get(MasterObj + "Totalpage").value)
                            break
                    }
                    var endFor
                    if (currentPage_X * PageSize - 1 < 0)
                        return
//                   if (totalRecords <= currentPage_X * PageSize - 1)
////                    {
                        endFor = totalRecords - 1
//                        alert(0)
//                    }
//                    else
////                        endFor = parseInt(currentPage_X) * PageSize - 1
//                      endFor = totalRecords - 1
                    //====================================================
                    $get(MasterObj + "txtCurPage").value = currentPage_X
                    $get(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
                    $get(MasterObj + "lblTo").value = endFor + 1;
                    //====================================================
                    var i = (currentPage_X - 1) * PageSize
                    for (; i <= endFor; i++) {
//                    alert(i)
                        if (i < PNum) {
                            var Param = "" + xmlNodesP.item(i).selectSingleNode("ID").text + "," + xmlNodesP.item(i).selectSingleNode("Name").text + ",";
                            AddToGrid("ID", xmlNodesP.item(i).selectSingleNode("ID").text, "Name", xmlNodesP.item(i).selectSingleNode("Name").text, "Type", "P", Param)
                        }
                        else if (i < PNum + GNum) {
                            var Param = "" + xmlNodesG.item(i - PNum).selectSingleNode("ID").text + "," + xmlNodesG.item(i - PNum).selectSingleNode("Name").text + ",";
                            AddToGrid("ID", xmlNodesG.item(i - PNum).selectSingleNode("ID").text, "Name", xmlNodesG.item(i - PNum).selectSingleNode("Name").text, "Type", "G", Param)
                        }
                        else if (i < PNum + GNum + DNum) {
                            var Param = "" + xmlNodesD.item(i - PNum - GNum).selectSingleNode("ID").text + "," + xmlNodesD.item(i - PNum - GNum).selectSingleNode("Name").text + ",";
                            AddToGrid("ID", xmlNodesD.item(i - PNum - GNum).selectSingleNode("ID").text, "Name", xmlNodesD.item(i - PNum - GNum).selectSingleNode("Name").text, "Type", "D", Param)
                        }
                        else {
                            var Param = "" + xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("ID").text + "," + xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("Name").text + ",";
                            AddToGrid("ID", xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("ID").text, "Name", xmlNodesT.item(i - PNum - GNum - DNum).selectSingleNode("Name").text, "Type", "T", Param)                        
                        }
                    }
                }
                else {

                    //====================================================
                    $get(MasterObj + "txtCurPage").value = "0";
                    $get(MasterObj + "lblFrom").value = "0";
                    $get(MasterObj + "lblTo").value = "0";
                    $get(MasterObj + "Totalpage").value = "0";
                    $get(MasterObj + "lblTotal").value = "0";
                    //====================================================
                }                     
            SetPagingInfo();
        }
        //*******************************************************************************
        function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, Param) {
            var oGrid = XTabTable;
            var oRow = oGrid.insertRow();

            oRow.setAttribute(AttrName1, AttrValue1) //ID            
            oRow.setAttribute(AttrName2, AttrValue2) //Name
            oRow.setAttribute(AttrName3, AttrValue3) //Type

            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";
            oRow.style.height = "25";
            var x = 0;
            var p = new String;
            var val = "";            
            while (x < getCntChar(",", Param)) {
                val = getArray(Param, x, ",")

                switch (x) {
                    case 0:
                        var oCell0 = oRow.insertCell();
                        oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this,-1)'  checked />";
                        oCell0.className = "XTabTable";
                        oCell0.style.width = "25px"
                        oCell0.align = "center"
                        break

                    case 1:
                        var tempSrc = "";
                        var picTitle = "";
                        switch (AttrValue3) {
                            case "P":
                                tempSrc = "../../../App_Utility/Images/Icons/Personel.gif"
                                picTitle = "پرسنل"
                                break
                            case "G":
                                tempSrc = "../../../App_Utility/Images/Icons/G1.png"
                                picTitle = "گروه"
                                break
                            case "D":
                                tempSrc = "../../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                                picTitle = "واحدسازماني"
                                break
                            case "T":
                                tempSrc = "../../../App_Utility/Images/Icons/Group.gif"
                                picTitle = "دفتر تابل"
                                break                    
                        }
                        var oCell1 = oRow.insertCell();
                        oCell1.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
                        oCell1.className = "XTabTable";
                        oCell1.style.width = "40px"
                        oCell1.align = "center"

                        var oCell2 = oRow.insertCell();
                        oCell2.innerText = ((val.length > 30) ? val.substring(0, 28) + "..." : val);
                        oCell2.title = val;
                        oCell2.style.width = "300px"
                        oCell2.align = "center";
                        break
                }

                x = x + 1;
            }
        }
        //*****************************************************************************   
        function SetPagingInfo() {
            document.getElementById("OToolBar_txtFromData").value = $get(MasterObj + "lblFrom").value;
            document.getElementById("OToolBar_txtToData").value = $get(MasterObj + "lblTo").value;
            document.getElementById("OToolBar_txtTotalData").value = $get(MasterObj + "lblTotal").value;
            document.getElementById("OToolBar_txtCurPage").value = $get(MasterObj + "txtCurPage").value;
            document.getElementById("OToolBar_txtTotalPage").value = $get(MasterObj + "Totalpage").value;

            if (document.getElementById("OToolBar_txtCurPage").value == "" | document.getElementById("OToolBar_txtCurPage").value == "0")
                document.getElementById("OToolBar_BtnPrv").disabled = true
            else
                document.getElementById("OToolBar_BtnPrv").disabled = false;

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById("OToolBar_BtnNext").disabled = true
            else
                document.getElementById("OToolBar_BtnNext").disabled = false;
        }
        //*******************************************************************************
        function OnClickChk(obj) {
            var SelectedRowID
            var SelectedRowType
            
            SelectedRowID = obj.parentElement.parentElement.ID;
            SelectedRowType = obj.parentElement.parentElement.Type;
            var RowIndex=obj.parentElement.parentElement.rowIndex;

            var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//انتخاب شده ها
            oXmlSaveDoc.async = "false";
            oXmlSaveDoc.loadXML($get(MasterObj + "txtSaveXml").value)

            var OXmlNode = oXmlSaveDoc.documentElement.selectNodes("/Root/" + SelectedRowType + "[ID=" + SelectedRowID + "]");
             if (obj.checked == false & OXmlNode.length != 0) {
                var f = oXmlSaveDoc.documentElement.removeChild(OXmlNode.item(0))
                XTabTable.deleteRow(RowIndex);
//               alert($get(MasterObj + "txtSaveXml").value)               
            }
            $get(MasterObj + "txtSaveXml").value = oXmlSaveDoc.xml;
             CreateGrid("Const");
        }
        //*****************************************End Grid**************************************
        //=========================================ToolBar=============================
        function OnClickBtnSave() {
            if (CheckDate()) {

                var oGridGroup = document.getElementById(MasterObj + "GrdCardReaderGroup");
                if (oGridGroup == null)
                {
                    alert("مشکلی پیش آمده است");
                    return
                }

                var j = 0;
                for(var i=0 ; i < oGridGroup.rows.length ; i++)
                {
                    //alert(oGridGroup.rows.length);
                    //alert(oGridGroup.rows(1).cells(0).firstChild.checked);
                    if (oGridGroup.rows(i).cells(0).firstChild.checked)
                        j++

                }
                if (j <= 0) {
                    alert("ابتدا گروه های کارتخوان مورد نظر را انتخاب کنید ");
                    return;
                }
                else {

                    //alert($get(MasterObj + "txtSaveXml").value);
                    var XMLGroup ="";
                    for (var i = 1; i < oGridGroup.rows.length; i++) {
                        if (oGridGroup.rows(i).cells(0).firstChild.checked) {
                            XMLGroup += "<Group>";
                            XMLGroup += "<GroupCardID>" + oGridGroup.rows(i).getAttribute("CardReaderGroupID").toString() + "</GroupCardID>";
                            XMLGroup += "</Group>";
                        }
                    }


//                    $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("</Root>", "");
//                    $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("<Root>", "");
//                    $get(MasterObj + "txtSaveXml").value += XMLGroup
                    //                    $get(MasterObj + "txtSaveXml").value = "<Root>" + $get(MasterObj + "txtSaveXml").value + "</Root>"

                    //alert($get(MasterObj + "txtSaveXml").value);
                }
//               alert($get(MasterObj + "txtSaveXml").value)
                if ($get(MasterObj + "txtSaveXml").value == "" || $get(MasterObj + "txtSaveXml").value == "<Root/>" || $get(MasterObj + "txtSaveXml").value == "<Root></Root>") {
                    alert("لطفا ابتدا اعضا را انتخاب نماييد")
                    return
                }

                else {
                    $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("</Root>", "");
                    $get(MasterObj + "txtSaveXml").value = $get(MasterObj + "txtSaveXml").value.replace("<Root>", "");
                    $get(MasterObj + "txtSaveXml").value += XMLGroup
                    $get(MasterObj + "txtSaveXml").value = "<Root>" + $get(MasterObj + "txtSaveXml").value + "</Root>"

                    $get(MasterObj + "txtSubmit").value = "Save";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                    
                }
            }
        }        
        //=========================================================================
        function ModifyXML(Type) {
            // واحد سازمانی  :D گروه:G  پرسنل:P   
                        
            if (Type == "D")
                OSelectedMamber = OSelectedMamber.substr(3, OSelectedMamber.length - 3);
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")//xml انتخاب شده
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML(OSelectedMamber)
            var xmlNodesTemp = oXmlDocTemp.documentElement.selectNodes("/Root/Tb")
            //--------------------------------------
            var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")//تیک خورده ها 
            oXmlSaveDoc.async = "false";
            oXmlSaveDoc.loadXML($get(MasterObj + "txtSaveXml").value)
            var OXmlNodeSave = oXmlSaveDoc.documentElement.selectNodes("/Root/" + Type);
                                                                                            //alert($get(MasterObj + "txtSaveXml").value);
            //---------------------------------------
            if (xmlNodesTemp.length > 0) {
                for (var i = 0; i < xmlNodesTemp.length; i++) {
                    var MemberID, MemberName;
                    switch (Type) {
                        case "P":
                            MemberID = xmlNodesTemp.item(i).selectSingleNode("PID").text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode("PName").text;
                            break
                        case "G":
                            MemberID = xmlNodesTemp.item(i).selectSingleNode("GroupId").text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode("GroupName").text;
                            break

                        case "D":
                            MemberID = xmlNodesTemp.item(i).selectSingleNode("DID").text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode("DName").text;
                            break
                        case "T":
                            MemberID = xmlNodesTemp.item(i).selectSingleNode("TID").text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode("TName").text;
                            break
                    }
                    var XmlNode = oXmlSaveDoc.documentElement.selectNodes("/Root/" + Type + "[ID=" + MemberID + "]");
                    if (XmlNode.length == 0) {
                        var oXmlDocTemp2 = new ActiveXObject("Microsoft.XMLDOM")
                        oXmlDocTemp2.async = "false";
                        oXmlDocTemp2.loadXML("<Root><" + Type + "><ID>" + MemberID + "</ID><Name>" + MemberName + "</Name></" + Type + "></Root>")
                        var xmlNodesTemp2 = oXmlDocTemp2.documentElement.selectNodes("/Root/" + Type);
                        oXmlSaveDoc.childNodes[0].appendChild(xmlNodesTemp2.item(0));
                        $get(MasterObj + "txtSaveXml").value = oXmlSaveDoc.xml;
//                        alert($get(MasterObj + "txtSaveXml").value)
                    }
                }
            }     
        }     
        //*******************************************************************************
        function OnClickBtnSelect() {
        
            var strOptions = ""
            var url
            var OUserFlag

            if (document.getElementById("RadPerson").checked) {           
                OUserFlag = "P"
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("RadGroup").checked) {

                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
            }           
            else if (document.getElementById("RadRole").checked) {

                OUserFlag = "D"
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("RadTableOff").checked) {
                OUserFlag = "T"
                url = "/FrmPresentation/App_Pages/BaseInfo/TableOffice/SelectTableOffice.aspx?Type=Check&SessionID=" + $get(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + $get(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 600px;dialogWidth: 600px;center: Yes;help: no;status: no"
            }

            //-------------------------------------------------------
            if (url != "") {
                OSelectedMamber = "";                
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                url = ""
            }
            if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>") {
                if (document.getElementById("XTabTable").rows.length > 0) {
                    if (confirm("پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟"))
                        $get(MasterObj + "txtSaveXml").value = "<Root></Root>";
                }
                //----------------------------------------------------------
                ModifyXML(OUserFlag);
                if (OSelectedMamber != "") {               
                    CreateGrid("First");
                }
            }
        }
        //*******************************************************************************
        function CheckDate() {
        
            $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;


            if ($get(MasterObj + "CmbAction").value == "0" || $get(MasterObj + "CmbAction").value == "") {
                alert(" فعاليت را انتخاب کنيد")
                return false;
            }
            else
                document.getElementById(MasterObj + "txtActionEdit").value = $get(MasterObj + "CmbAction").value;
                if ($get(MasterObj + "CmbCause").value == "0" || $get(MasterObj + "CmbCause").value == "") {
                alert(" علت  را انتخاب کنيد")
                return false;
            }            
            else if ($get(MasterObj + "KCalSDate_txtYear").value == "" || $get(MasterObj + "KCalSDate_txtMonth").value == "" || $get(MasterObj + "KCalSDate_txtDay").value == "") {
                 alert("فرمت تاریخ شروع درست نمی باشد.")
                return false;
            }
            else if ($get(MasterObj + "KCalEDate_txtYear").value == "" || $get(MasterObj + "KCalEDate_txtMonth").value == "" || $get(MasterObj + "KCalEDate_txtDay").value == "") {
                alert("فرمت تاریخ خاتمه درست نمی باشد.")
                return false;
            }
            else if ($get(MasterObj + "SDate").value > $get(MasterObj + "EDate").value) {
                alert("تاریخ شروع باید از تاریخ خاتمه کوچکتر باشد.")
                return false;
            }
            return true;
        }

       //*******************************************************************************       
        function OnClickBtnCancel() {
            window.close();
        }
        //=================================================================================       
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
            if (document.getElementById(MasterObj + "RadHard").checked && !document.getElementById(MasterObj + "RadSoft").checked) {
                LoadComboAction(1);
            }
            else
                if (document.getElementById(MasterObj + "RadSoft").checked && !document.getElementById(MasterObj + "RadHard").checked) {
                LoadComboAction(2);
            }
            else
                LoadComboAction(0);
        }
        //======================================================================
        function CreateGridValidPersonCardFlag() {

            var str = "<Root>";
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")//انتخاب شده ها
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtXmlValidPersonFlag").value)

           // var OXmlNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetValidPersonCard");
            var OXmlNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderMemberEditValid");
            if (OXmlNode.length != 0)
                for (var i = 0; i < OXmlNode.length; i++) {
                    if (OXmlNode.item(i).selectSingleNode("Type").text == "G") {
                    str += "<G>";
                    str += "<ID>" + OXmlNode.item(i).selectSingleNode("ID").text + "</ID>";
                    str += "<Name>" + OXmlNode.item(i).selectSingleNode("Name").text + "</Name>";
                    str += "</G>";
                }
                else if (OXmlNode.item(i).selectSingleNode("Type").text == "D") {
                    str += "<D>";
                    str += "<ID>" + OXmlNode.item(i).selectSingleNode("ID").text + "</ID>";
                    str += "<Name>" + OXmlNode.item(i).selectSingleNode("Name").text + "</Name>";
                    str += "</D>";
                }
                else if (OXmlNode.item(i).selectSingleNode("Type").text == "T") {
                    str += "<T>";
                    str += "<ID>" + OXmlNode.item(i).selectSingleNode("ID").text + "</ID>";
                    str += "<Name>" + OXmlNode.item(i).selectSingleNode("Name").text + "</Name>";
                    str += "</T>";
                }
                else if (OXmlNode.item(i).selectSingleNode("Type").text == "P") {
                    str += "<P>";
                    str += "<ID>" + OXmlNode.item(i).selectSingleNode("ID").text + "</ID>";
                    str += "<Name>" + OXmlNode.item(i).selectSingleNode("Name").text + "</Name>";
                    str += "</P>";
                }
            }
            str += "</Root>";
            document.getElementById(MasterObj + "txtSaveXml").value = str;
            CreateGrid("First");
            for (var i = 0; i < XTabTable.rows.length; i++)
                XTabTable.rows(i).cells(0).disabled = true;

        }
        //=================================================گرید گروه ها========================
        function OnClickGrdGroup(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //----------------------------------------------------------------------------------------
        function onclickchkGroup(obj) {

            if ($(obj).attr("checked")) {
                $(obj).addClass("CheckedRows");
               // $(obj).removeClass("UnCheckedRows");
            }
            else {
               // $(obj).addClass("UnCheckedRows");
                $(obj).removeClass("CheckedRows");
            }
            //alert($(".CheckedRows").length);
            // alert(obj.className);


        }
        //=================================================== Chkتيک خوردن همه ============================================
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById(MasterObj + "GrdCardReaderGroup");
            var grdLen = OGrid.rows.length;
            if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }