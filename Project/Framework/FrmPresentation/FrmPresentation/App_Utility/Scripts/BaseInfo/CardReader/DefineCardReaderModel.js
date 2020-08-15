        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        //##################################################اصلی
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXmlAll').value)
        //################################################
        var VALUEArray = new Array();
        var Counter = 0;
        document.getElementById(MasterObj + "txtArray").value = "";
        CreateGrid();

        //==============================================
        for (var j = 0; j < XTable.rows.length; j++) {
            if (XTable.rows(j).Parent == 1) {
                VALUEArray[Counter] = 0;
                Counter++;
            }
        }
        document.getElementById(MasterObj + "txtArray").value = VALUEArray;

        //========================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {
            
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal != "") {
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlAll').value);
                if (StrVal == "Filter") {
                    oXmlDoc.loadXML($get(MasterObj + 'txtXmlAll').value)
                }
                else {
                    if ($get(MasterObj + "txtValidate").value == 1)
                        SetMsg($get(MasterObj + "txtAlert").value);
                    else
                        alert($get(MasterObj + "txtAlert").value);
                }
                DivBaseNew.style.display = "none";
                DivFormat.style.display = "none";
                CreateGrid();
            }
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";

            var Counter1 = 0;
            var ArrayNew = document.getElementById(MasterObj + "txtArray").value;
            if (StrVal == "Filter")
                VALUEArray = 0;
            else
                for (var K = 1; K < XTable.rows.length; ++K) {
                if (XTable.rows(K).Header == 1) {
                    if (ArrayNew.split(",")[Counter1] == 1)
                        onclickImg(XTable.rows(K - 1).cells(0).firstChild);
                    Counter1++;
                }
            }

            document.getElementById(MasterObj + "txtArray").value = ArrayNew;
        }
        //##########################################################
        function CreateGrid() {
            ClearRowGrid()
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderModel")
            for (var i = 0; i < xmlNodes.length; i++) {
                var XmlNewNode = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/IOStructure[IOID=" + xmlNodes.item(i).selectSingleNode("STID").text + "]")
                AddToGrid(XmlNewNode, xmlNodes.item(i))
            }
        }
        //********************************************************************************
        function ClearRowGrid() {
            var oGrid = XTable
            while (oGrid.rows.length > 0)
                oGrid.deleteRow(oGrid.rows.length - 1);               
                   
        }
        //*******************************************************************************
        function AddToGrid(FormatNodes, BaseNode) {

            var ORow = XTable.insertRow();
            ORow.className = "CssNew";

            var OCell1 = ORow.insertCell();
            var OCell2 = ORow.insertCell();
            var OCell3 = ORow.insertCell();
            var OCell4 = ORow.insertCell();

            OCell1.colSpan = 1;
            OCell2.colSpan = 4;
            OCell3.colSpan = 4;
            OCell4.colSpan = 4;

            OCell1.innerHTML = "<IMG src='../../../App_Utility/Images/Icons/btnSubNodes.gif' onclick='onclickImg(this)' width='30px' style=' cursor:pointer' />";
            OCell2.innerText = BaseNode.selectSingleNode("Name").text;
            OCell3.innerText = BaseNode.selectSingleNode("TypeName").text;
            OCell4.innerText = BaseNode.selectSingleNode("COName").text;

            OCell1.style.width = "25px";
            OCell2.style.width = "300px";
            OCell3.style.width = "300px";
            OCell4.style.width = "300px";

            ORow.setAttribute("ID", BaseNode.selectSingleNode("ID").text);
            ORow.setAttribute("BrandID", BaseNode.selectSingleNode("BrandID").text);
            ORow.setAttribute("TypeID", BaseNode.selectSingleNode("TypeID").text);
            ORow.setAttribute("STID", BaseNode.selectSingleNode("STID").text);
            ORow.setAttribute("Parent", 1);


            var ORow1 = XTable.insertRow();

            if ((XTable.rows.length - 1) % 2 == 0)
                ORow1.className = "CssItemStyle";
            else
                ORow1.className = "CssAlternatingItemStyle";
            ORow1.setAttribute("Header", 1);
            SetHeaderFormat(ORow1, FormatNodes.length > 0 ? 0 : 1);

            ORow1.setAttribute("IOID", BaseNode.selectSingleNode("STID").text);
            ORow1.style.display = "none";
            for (var i = 0; i < FormatNodes.length; i++) {
                AddFormatGrid(FormatNodes.item(i), FormatNodes.length == i + 1 ? 1 : 0);
            }

        }
        //===========================================================================================================
        function AddFormatGrid(FormatNodes, Sign) {
            var ORow = XTable.insertRow();
            if ((XTable.rows.length - 1) % 2 == 0)
                ORow.className = "CssItemStyle";
            else
                ORow.className = "CssAlternatingItemStyle";
            var OCell1 = ORow.insertCell();
            var OCell2 = ORow.insertCell();
            var OCell3 = ORow.insertCell();
            var OCell4 = ORow.insertCell();
            var OCell5 = ORow.insertCell();
            var OCell6 = ORow.insertCell();
            var OCell7 = ORow.insertCell();
            var OCell8 = ORow.insertCell();
            var OCell9 = ORow.insertCell();
            var OCell10 = ORow.insertCell();
            var OCell11 = ORow.insertCell();
            var OCell12 = ORow.insertCell();
            var OCell13 = ORow.insertCell();

            OCell1.style.width = "25px";
            ORow.setAttribute("IOID", FormatNodes.selectSingleNode("IOID").text);
            ORow.setAttribute("STDID", FormatNodes.selectSingleNode("STDID").text);

            OCell2.innerHTML = FormatNodes.selectSingleNode("IsCardCode").text == "True" ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif' />" : "";
            OCell3.innerText = FormatNodes.selectSingleNode("Name").text;
            OCell4.innerText = FormatNodes.selectSingleNode("SCHK").text;
            OCell5.innerText = FormatNodes.selectSingleNode("Length").text;
            OCell6.innerText = FormatNodes.selectSingleNode("Field").text;
            OCell7.innerText = FormatNodes.selectSingleNode("ConditionSCHK").text;
            OCell8.innerText = FormatNodes.selectSingleNode("ConditionLength").text;
            OCell9.innerText = FormatNodes.selectSingleNode("ConditionValue").text;
            OCell10.innerText = FormatNodes.selectSingleNode("ReplaceFormat").text;
            OCell11.innerText = FormatNodes.selectSingleNode("ReplaceValue").text;
            if (Sign == 1)
                OCell12.innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' onclick='onclickImgInsert(this)' style=' cursor:pointer'/>";
            OCell13.innerHTML = "<img src='../../../App_Utility/Images/Icons/Cross.gif' onclick='onclickImgDelete(this)' style=' cursor:pointer'/>";

            ORow.style.display = "none";

        }
        //==========================================================
        function onclickImgInsert(obj) {
           
            DivFormat.setAttribute("ID", 0);
            DivFormat.setAttribute("IOID", obj.parentElement.parentElement.IOID);
            document.getElementById(MasterObj + "ChkCardCode").checked = false;
            document.getElementById(MasterObj + "txtName").value = "";
            document.getElementById(MasterObj + "txtSCHK").value = "";
            document.getElementById(MasterObj + "txtCSCHK").value = "";
            document.getElementById(MasterObj + "txtLength").value = "";
            document.getElementById(MasterObj + "txtField").value = "";
            document.getElementById(MasterObj + "txtCLength").value = "";
            document.getElementById(MasterObj + "txtCValue").value = "";
            document.getElementById(MasterObj + "txtReplaceFormat").value = "";
            document.getElementById(MasterObj + "txtReplaceValue").value = "";
            document.getElementById(MasterObj + "CmbCardCode").value = "";
            DivFormat.style.display = "inline";
            //alert(DivFormat.ID)
        }
        //==========================================================
        function OnClickChkCardCode() {
            if (document.getElementById(MasterObj + "ChkCardCode").checked == true) {
                document.getElementById(MasterObj+"CmbCardCode").value = 0; 
                document.getElementById(MasterObj + "txtReplaceValue").style.display = "none";
                document.getElementById(MasterObj + "CmbCardCode").value = document.getElementById(MasterObj + "txtReplaceValue").value;                
                document.getElementById("DivCmbCardCode").style.display = "inline";               
            }
            else {
                document.getElementById("DivCmbCardCode").style.display = "none";
                document.getElementById(MasterObj + "txtReplaceValue").style.display = "inline";
            }
        }
        //==========================================================
        function onclickImgDelete(obj) {
            if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                document.getElementById(MasterObj + "txtDeleteID").value = obj.parentElement.parentElement.STDID;
                document.getElementById(MasterObj + "txtSubmit").value = "DeleteFormat";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //=========================================================
        function SetHeaderFormat(Obj, Sign) {
            var OCell1 = Obj.insertCell();
            var OCell2 = Obj.insertCell();
            var OCell3 = Obj.insertCell();
            var OCell4 = Obj.insertCell();
            var OCell5 = Obj.insertCell();
            var OCell6 = Obj.insertCell();
            var OCell7 = Obj.insertCell();
            var OCell8 = Obj.insertCell();
            var OCell9 = Obj.insertCell();
            var OCell10 = Obj.insertCell();
            var OCell11 = Obj.insertCell();
            var OCell12 = Obj.insertCell();
            var OCell13 = Obj.insertCell();
            OCell1.innerText = "   ";
            OCell2.innerText = "کارت کد";
            OCell3.innerText = "نام اطلاعات";
            OCell4.innerText = "کاراکتر شروع";
            OCell5.innerText = "طول";
            OCell6.innerText = "فيلدجدول";
            OCell7.innerText = "کاراکترشروع شرط";
            OCell8.innerText = "طول شرط";
            OCell9.innerText = "مقدار شرط";
            OCell10.innerText = "فرمت رشته جايگزين";
            OCell11.innerText = "مقدار جايگزين";
            if (Sign == 1)
                OCell12.innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' onclick='onclickImgInsert(this)' style=' cursor:pointer'/>";
            else OCell12.innerHTML = "    ";
            OCell13.innerText = "    ";

            OCell1.className = "";
            OCell2.className = "CssHeaderStyle";
            OCell3.className = "CssHeaderStyle";
            OCell4.className = "CssHeaderStyle";
            OCell5.className = "CssHeaderStyle";
            OCell6.className = "CssHeaderStyle";
            OCell7.className = "CssHeaderStyle";
            OCell8.className = "CssHeaderStyle";
            OCell9.className = "CssHeaderStyle";
            OCell10.className = "CssHeaderStyle";
            OCell11.className = "CssHeaderStyle";
            OCell12.className = "CssHeaderStyle";
            OCell13.className = "CssHeaderStyle";

        }
        //==========================================================
        function onclickImg(Obj) {
            var Url = document.getElementById("Url").href;
            var STID = Obj.parentElement.parentElement.getAttribute("STID");
            var index = Obj.parentElement.parentElement.rowIndex + 1;

            var Flag = false;
            if (Obj.src == Url)
                Obj.src = "../../../App_Utility/Images/Icons/btnNodes.gif";
            else Obj.src = Url;

            while (!Flag && index < XTable.rows.length) {
                if (XTable.rows(index).getAttribute("IOID") == STID) {
                    XTable.rows(index).style.display = XTable.rows(index).style.display == "inline" ? "none" : "inline";
                }
                else
                    Flag = true;
                index++;
            }
            Counter = 0;
            for (var i = 1; i < XTable.rows.length; i++) {
                if (XTable.rows(i).Header == 1) {
                    VALUEArray[Counter] = XTable.rows(i).style.display == "inline" ? 1 : 0;
                    Counter++;
                }
            }
            document.getElementById(MasterObj + "txtArray").value = VALUEArray;
        }
        //=========================================
        function ondblclickGrd() {
            if (window.event.srcElement.tagName == "TD")
                OnClickBtnEdit();
        }
        //==========================================
        function onclickGrd() {
            if (window.event.srcElement.parentElement.Header != 1 && window.event.srcElement.tagName == "TD") {
                var SelectedRow = window.event.srcElement.parentElement;
                if (LastSelectedRow != null) {
                    LastSelectedRow.className = LastSelectedRowClass;
                }
                LastSelectedRowClass = SelectedRow.className;
                LastSelectedRow = SelectedRow;
                SelectedRow.className = "CssSelectedItemStyle";
            }
        }
        //==========================================
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //=====================================================
        function OnClickBtnNew() {
            DivBaseNew.setAttribute("ID", 0);
            document.getElementById(MasterObj + "CmbMakerCoNew").value = "0";
            document.getElementById(MasterObj + "CmbCardTypeNew").value = "0";
            document.getElementById(MasterObj + "txtCardModelNew").value = "";
            DivBaseNew.style.display = "inline";
            //alert(DivBaseNew.ID)
        }
        //==================================================
        function onclickBtnClose() {
            DivBaseNew.style.display = "none";
        }
        //=========================================================
        function onclickBtnSaveNew() {
            if (document.getElementById(MasterObj + "CmbMakerCoNew").value == "0" || document.getElementById(MasterObj + "CmbMakerCoNew").value == "") {
                alert("شرکت سازنده را انتخاب کنيد")
                return
            }
            if (document.getElementById(MasterObj + "CmbCardTypeNew").value == "0" || document.getElementById(MasterObj + "CmbCardTypeNew").value == "") {
                alert("نوع را انتخاب کنيد")
                return
            }
            if (document.getElementById(MasterObj + "txtCardModelNew").value == "") {
                alert("نام مدل بايد وارد شود")
                return
            }            

            document.getElementById(MasterObj + "txtSave").value = DivBaseNew.ID;
            DivBaseNew.style.display = "none";
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //==========================================================
        function onclickBtnFormatSaveNew() {
            if (CheckValid()) {
                document.getElementById(MasterObj + "txtSave").value = DivFormat.ID;
                document.getElementById(MasterObj + "txtIOID").value = DivFormat.IOID;
                DivFormat.style.display = "none";
                if (document.getElementById("DivCmbCardCode").style.display == "inline")
                    document.getElementById(MasterObj + "txtReplaceValue").value = document.getElementById(MasterObj + "CmbCardCode").value
                document.getElementById(MasterObj + "txtSubmit").value = "SaveFormat";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //=========================================================
        function CheckValid() {
            if (document.getElementById(MasterObj + "txtName").value == "") {
                alert("نام اطلاعات بايد وارد شود");
                return
            }
            if (document.getElementById(MasterObj + "txtSCHK").value == "") {
                alert("کاراکتر شروع بايد وارد شود");
                return
            }
            if (document.getElementById(MasterObj + "txtCSCHK").value == "") {
                document.getElementById(MasterObj + "txtCSCHK").value = "0";
//                alert("کاراکتر شروع شرط بايد وارد شود");
//                return
            }
            if (document.getElementById(MasterObj + "txtLength").value == "") {
                //document.getElementById(MasterObj + "txtLength").value ="0"
                alert("طول بايد وارد شود");
                return
            }
            //            if (document.getElementById(MasterObj + "txtField").value == "") {
            //                alert("فيلد جدول بايد وارد شود");
            //                return
            //            }
            if (document.getElementById(MasterObj + "txtCLength").value == "") {
                document.getElementById(MasterObj + "txtCLength").value = "0";
//                alert("طول شرط بايد وارد شود");
//                return
            }
            //            if (document.getElementById(MasterObj + "txtCValue").value == "") {
            //                alert("مقدار شرط بايد وارد شود");
            //                return
            //            }
            //            if (document.getElementById(MasterObj + "txtReplaceFormat").value == "") {
            //                alert("فرمت رشته جايگزين بايد وارد شود");
            //                return
            //            }
            //            if ((document.getElementById(MasterObj + "ChkCardCode").checked == false && document.getElementById(MasterObj + "txtReplaceValue").value == "")
            //            || (document.getElementById(MasterObj + "ChkCardCode").checked == true && document.getElementById(MasterObj + "CmbCardCode").value == "")) {
            //                alert("مقدار جايگزين بايد وارد شود");
            //                return
            //            }
            return true;
        }
        //=========================================================
        function onclickBtnFormatClose() {
            DivFormat.style.display = "none";
        }
        //=====================================================
        function OnClickBtnDelete() {
            if (LastSelectedRow != null)
                if (LastSelectedRow.Parent == 1) {
                if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                    document.getElementById(MasterObj + "txtDeleteID").value = LastSelectedRow.ID;
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else alert("يک مدل کارتخوان را براي حذف انتخاب کنيد");
            else alert("يک مدل کارتخوان را براي حذف انتخاب کنيد");
        }
        //===========================================================
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) {
                if (LastSelectedRow.Header != 1 && LastSelectedRow.getAttribute("Parent") == 1) {
                    document.getElementById(MasterObj + "CmbMakerCoNew").value = LastSelectedRow.BrandID;
                    document.getElementById(MasterObj + "CmbCardTypeNew").value = LastSelectedRow.TypeID;
                    document.getElementById(MasterObj + "txtCardModelNew").value = LastSelectedRow.cells(1).innerText;
                    DivBaseNew.setAttribute("ID", LastSelectedRow.ID);
                    DivBaseNew.style.display = "inline";
                    //alert(DivBaseNew.ID)
                }
                else if (LastSelectedRow.Header != 1 && LastSelectedRow.getAttribute("Parent") != 1) {

                    document.getElementById(MasterObj + "ChkCardCode").checked = LastSelectedRow.cells(1).firstChild == null ? false : true;
                    document.getElementById(MasterObj + "txtName").value = LastSelectedRow.cells(2).innerText;
                    document.getElementById(MasterObj + "txtSCHK").value = LastSelectedRow.cells(3).innerText;
                    document.getElementById(MasterObj + "txtLength").value = LastSelectedRow.cells(4).innerText;
                    document.getElementById(MasterObj + "txtCSCHK").value = LastSelectedRow.cells(6).innerText;
                    document.getElementById(MasterObj + "txtField").value = LastSelectedRow.cells(5).innerText;
                    document.getElementById(MasterObj + "txtCLength").value = LastSelectedRow.cells(7).innerText;
                    document.getElementById(MasterObj + "txtCValue").value = LastSelectedRow.cells(8).innerText;
                    document.getElementById(MasterObj + "txtReplaceFormat").value = LastSelectedRow.cells(9).innerText;
                    document.getElementById(MasterObj + "txtReplaceValue").value = LastSelectedRow.cells(10).innerText;
                    DivFormat.setAttribute("ID", LastSelectedRow.STDID);
                    DivFormat.setAttribute("IOID", LastSelectedRow.IOID);
                    document.getElementById("DivCmbCardCode").style.display = document.getElementById(MasterObj + "ChkCardCode").checked ? "inline" : "none";
                    document.getElementById(MasterObj + "CmbCardCode").value = document.getElementById(MasterObj + "txtReplaceValue").value;
                    DivFormat.style.display = "inline";
                    //alert(DivFormat.ID)
                }
            }
            else alert("يک مدل کارتخوان يا فرمت را انتخاب کنيد");
        }
        //===========================================================
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtCardModel").value = "";
            document.getElementById(MasterObj + "CmbCardType").value = "0";
            document.getElementById(MasterObj + "CmbMakerCo").value = "0";
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //===========================================================
