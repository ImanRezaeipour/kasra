
         var MasterObj = "ctl00_ContentPlaceHolder1_";         
         var LastSelectedRow = null
         var LastSelectedRowClass = "";
     //=====================================================        
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    //========================================================
    //*************************************OnLoad*************************************        
    document.getElementById('OToolBar_BtnPrv').disabled = true;
    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
   
    //**********************************EndOnLoad*************************************
    
    function BeginRequestHandler(sender, args) {
        
    }
    //================================================
    function EndRequestHandler(sender, args) {
        
        if (LastSelectedRow != null) {
            LastSelectedRow.className = LastSelectedRowClass;
            LastSelectedRow = null;
        }
        var StrVal = $get(MasterObj + "txtSubmit").value
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
            if (StrVal != "Filter") {
                if (document.getElementById(MasterObj + "txtValidate").value == "1")
                    SetMsg(document.getElementById(MasterObj + "txtAlert").value);
                else alert(document.getElementById(MasterObj + "txtAlert").value)
            }   
        }
        $get(MasterObj + "txtSubmit").value = "";
        document.getElementById(MasterObj + "txtValidate").value = "";
        document.getElementById(MasterObj + "txtAlert").value = "";
    }
    //========================================================    
    function OnClickGrd(SelectedRow) {       
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";            
        
    }
    //=====================================
    function OnClickBtnFilter() {
        document.getElementById(MasterObj + "txtModelTemp").value = document.getElementById("txtCardReaderModel").value;
        document.getElementById(MasterObj + "txtTypeTemp").value = document.getElementById(MasterObj + "CmbCardType").value;
        document.getElementById(MasterObj + "txtBrandTemp").value = document.getElementById(MasterObj + "CmbBrand").value;
        document.getElementById(MasterObj + "txtFormatTemp").value = document.getElementById("txtFormat").value;
        document.getElementById(MasterObj + "txtCodeTemp").value = document.getElementById(MasterObj + "CmbCode").value ;
       
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //===============================    
    function OnClickBtnShowAll() {
        document.getElementById(MasterObj + "txtModelTemp").value = "";
        document.getElementById("txtCardReaderModel").value = "";
        document.getElementById(MasterObj + "txtTypeTemp").value = "0";
        document.getElementById(MasterObj + "CmbCardType").value = "0";
        document.getElementById(MasterObj + "txtBrandTemp").value = "0";
        document.getElementById(MasterObj + "CmbBrand").value = "0";
        document.getElementById(MasterObj + "txtFormatTemp").value ="";
         document.getElementById("txtFormat").value="";
        document.getElementById(MasterObj + "txtCodeTemp").value ="0";
        document.getElementById(MasterObj + "CmbCode").value = "";
        
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //===============================================================================
    function OndbClickGrd(Obj) {
        OnClickBtnEdit();
    }
    //===================================
    function OnClickBtnEdit() {
        if (LastSelectedRow != null) {
            TDCardModel.innerText = LastSelectedRow.cells(1).innerText;
            TDFactory.innerText = LastSelectedRow.cells(3).innerText;
            TDFormat.innerText = LastSelectedRow.cells(4).innerText;
            TDType.innerText = LastSelectedRow.cells(2).innerText;
            document.getElementById(MasterObj + "CmbCodeNew").value = LastSelectedRow.CodeID;
            DivFormatValue.setAttribute("ID", LastSelectedRow.getAttribute("ID"));
            DivFormatValue.style.display = "inline";
        }
        else alert("لطفا يک سطر را انتخاب کنيد");

    }
    //=========================================
    function OnClickBtnDelete() {
        if (LastSelectedRow != null) {
            if (LastSelectedRow.Deleteable == "1") {
                if (confirm("آیا براي حذف مطمئن هستيد؟")) {
                    document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID");
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else alert("کد پيش فرض قابل حذف نيست");
        }
        else
            alert("لطفا يک سطر را انتخاب کنيد"); 
            }
    //=========================================
    function onclickBtnFormatSaveNew() {        
        document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID");
        DivFormatValue.style.display = "none";
        document.getElementById(MasterObj + "txtSubmit").value = "Save";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //======================================
    function onclickBtnFormatClose() {
        DivFormatValue.style.display = "none";
    }
    
    //*************************************Toolbar*************************************
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnBlurtxtCurPage() {
        document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

        var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);

        if (document.getElementById("OToolBar_txtCurPage").value != "" && document.getElementById("OToolBar_txtCurPage").value != "0"
                && document.getElementById("OToolBar_txtCurPage").value != document.getElementById(MasterObj + "txtCurPage").value) {

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
        }
        else
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById(MasterObj + "txtCurPage").value;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnNext() {
        var TotalPage = parseInt($get(MasterObj + "txtCurPage").value);
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
                document.getElementById("OToolBar_BtnNext").disabled = true
            else
                document.getElementById("OToolBar_BtnNext").disabled = false
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnLast() {
        document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnPrv() {
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
            document.getElementById(MasterObj + "BtnSubmit").click();

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
                document.getElementById("OToolBar_BtnPrv").disabled = true
            else
                document.getElementById("OToolBar_BtnPrv").disabled = false
        }
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function OnClickBtnFirst() {
        document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
    
 