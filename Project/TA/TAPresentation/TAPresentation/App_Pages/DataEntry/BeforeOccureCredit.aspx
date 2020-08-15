<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BeforeOccureCredit.aspx.cs" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" Inherits="TAPresentation.App_Pages.DataEntry.BeforeOccureCredit"
    Title="---------------------------------------------------------------------------ثبت مجوزهاي قبل از وقوع-----------------------------------------------------------------------------" 
    ValidateRequest ="false" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script language ="javascript" type ="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script> 
   <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
   <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/farsitype.js"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var lastPersonCode = "";
        var lastGrdPersonCode = "";
        var lastGrdGroupCodeID = "";
        var lastGroupCodeID = "";
        //-------------------------------------------
        //*************************************Declaration*************************************
        var LastSelectedRow = ""
        var PageSize = 9;
        var currentPage_X = 0
        var TempGrdPersonCode = "";
        var TempPersonCode = "";
        //*************************************EndDeclaration*************************************
    </script>
     
    <div scroll="yes" style="width: 95%">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
   </asp:ScriptManager>  
   
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            $get(MasterObj + "txtAlert").value = "";
            //alert($get(MasterObj + "txtSubmit").value)
            ChangeEnableItem(0)
        }

        function EndRequestHandler(sender, args) {
            ChangeEnableItem(1)
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal != "") {

                if (StrVal == "RefreshWorkTimes") {
                    $get(MasterObj + 'txtSubmit').value = "";
                    
                }
                else if (StrVal == "Filter") {
                    //alert($get(MasterObj + 'txtXMLCredit').value);
                    $get(MasterObj + 'txtCreditID').value = "";
                    $get(MasterObj + 'txtCurPage').value = "0";
                    CreateGrid("Next")
                    
                }
                else if (StrVal == "Delete") {
                    
//                    if ($get(MasterObj + "txtAlert").value == "Delete") {
//                        //ModifyXML()
//                        
//                        CreateGrid("Const")
//                        
//                        Clear()

//                    }

                    if ($get(MasterObj + "txtAlert").value != "") {
                        alert(AlertMsg($get(MasterObj + "txtAlert").value))

                        CreateGrid("Const")

                        Clear()
                    }
                    //alert("حذف گرديد");
                        //alert($get(MasterObj + "txtAlert").value)
                    
                }
                else if (StrVal == "Save") {

                    $get(MasterObj + 'txtSaveXML').value = "";
                    $get(MasterObj + "txtCreditID").value = $get(MasterObj + "txtAlert").value.split(';')[1];
                    $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtAlert").value.split(';')[0];

                    if ($get(MasterObj + "txtCreditID").value != "0") {
                        //ModifyXML()
                        if ($get(MasterObj + "txtCurPage").value == "0")
                            CreateGrid("Next")
                        else
                            CreateGrid("Const")
                    }
                    Clear()
                    if ($get(MasterObj + "txtAlert").value != "") {
                        //alert($get(MasterObj + "txtAlert").value);
                        alert(AlertMsg($get(MasterObj + "txtAlert").value))
                    }
                }
                else if (StrVal == "SaveNew") {
                    //alert(2)
                    $get(MasterObj + 'txtSaveXML').value = "";
                    $get(MasterObj + "txtCreditID").value = $get(MasterObj + "txtAlert").value.split(';')[1];
                    $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtAlert").value.split(';')[0];

                    if ($get(MasterObj + "txtCreditID").value != "0") {
                        //ModifyXML()
                        if ($get(MasterObj + "txtCurPage").value == "0")
                            CreateGrid("Next")
                        else
                            CreateGrid("Const")
                    }
                    Clear()
                    if ($get(MasterObj + "txtAlert").value != "") {
                        //alert($get(MasterObj + "txtAlert").value);
                        alert(AlertMsg($get(MasterObj + "txtAlert").value))
                    }
                }
                else if (StrVal == "BindCmbSecondCode") {
                    $get(MasterObj + 'CmbSecondCode').disabled = false;
                    $get(MasterObj + 'txtPersonName').disabled = false;

                    if ($get(MasterObj + 'CmbCategoryNew').value != "0") {
                        OnChangeCmbFirstCode();
                        if ($get(MasterObj + 'txtSecondCode').value != "")
                            $get(MasterObj + 'CmbSecondCode').value = $get(MasterObj + 'txtSecondCode').value
                    }
                }
                else if (StrVal == "BindGrdCmbSecondCode") {
                    $get(MasterObj + 'CmbGrdSecondCode').disabled = false;
                    $get(MasterObj + 'txtGrdPersonName').disabled = false;

                    if ($get(MasterObj + 'CmbCategory').value != '0') {
                        
                        OnChangeCmbGroupCode();
                    }
                }
                else if (StrVal == "ImgRefreshPerson") {

                    document.getElementById('ImgRefreshPerson').disabled = true;
                    document.getElementById('ImgGrdRefreshPerson').disabled = true;
                    document.getElementById('MaskedDiv').style.display = 'none';
                    document.getElementById('ModalPopupDiv').style.display = 'none';
                }
                else if (StrVal == "ImgGrdRefreshPerson") {

                    document.getElementById('ImgRefreshPerson').disabled = true;
                    document.getElementById('ImgGrdRefreshPerson').disabled = true;
                    document.getElementById('MaskedDiv').style.display = 'none';
                    document.getElementById('ModalPopupDiv').style.display = 'none';
                }
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            }

            if (LastSelectedRow == "0") {
                LoadDataAfterAjax(XTabTable.rows(LastSelectedRow))
            }
            else if (LastSelectedRow != "") {
                LoadDataAfterAjax(XTabTable.rows(LastSelectedRow))
                
            }

            
            
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            //OnChangeCmbGrdGroupCode()

            
            PassFocusAfterAjax($get(MasterObj + 'txtObjectID').value)
            
            CheckOptions();

        }
        //*******************************************************************************
        function ChangeEnableItem(Val) {
            if (Val == 0) {
                $get(MasterObj + 'ChkOp').disabled = true
                $get(MasterObj + 'ChkPrsId').disabled = true
                $get(MasterObj + 'ChkCard').disabled = true
                $get(MasterObj + 'ChkSDate').disabled = true
                $get(MasterObj + 'ChkEDate').disabled = true
                $get(MasterObj + 'ChkFirstCode').disabled = true
                $get(MasterObj + 'ChkSecondCode').disabled = true
                $get(MasterObj + 'ChkSTime').disabled = true
                $get(MasterObj + 'ChkETime').disabled = true
                $get(MasterObj + 'ChkDescr').disabled = true
            }
            else {
                $get(MasterObj + 'ChkOp').disabled = false
                $get(MasterObj + 'ChkPrsId').disabled = false
                $get(MasterObj + 'ChkCard').disabled = false;
                $get(MasterObj + 'ChkSDate').disabled = false
                $get(MasterObj + 'ChkEDate').disabled = false
                $get(MasterObj + 'ChkFirstCode').disabled = false
                $get(MasterObj + 'ChkSecondCode').disabled = false
                $get(MasterObj + 'ChkSTime').disabled = false
                $get(MasterObj + 'ChkETime').disabled = false
                $get(MasterObj + 'ChkDescr').disabled = false
            }
        }
        //*******************************************************************************
        function CheckOptions() {
            if (Type == 1) {
                $get(MasterObj + 'txtStartTime').value = "00:00";
                $get(MasterObj + 'txtEndTime').value = "00:00";
            }

            if ($get(MasterObj + 'OpDaily').checked) 	//روزانه
            {
                $get(MasterObj + 'txtStartTime').disabled = true
                $get(MasterObj + 'txtEndTime').disabled = true


                document.getElementById(MasterObj + "EDateDay").disabled = false
                document.getElementById(MasterObj + "EDateMonth").disabled = false
                document.getElementById(MasterObj + "EDateYear").disabled = false
            }
            else if ($get(MasterObj + 'OpHourly').checked) //ساعتي	
            {
                $get(MasterObj + 'txtStartTime').disabled = false
                $get(MasterObj + 'txtEndTime').disabled = false


                document.getElementById(MasterObj + "EDateDay").disabled = true
                document.getElementById(MasterObj + "EdateMonth").disabled = true
                document.getElementById(MasterObj + "EDateYear").disabled = true
            }

//            var tempValue = 0
//            tempValue = $get(MasterObj + 'CmbSecondCode').value
//            OnChangeCmbGroupCode()

//            $get(MasterObj + 'CmbSecondCode').value = tempValue

//            if ($get(MasterObj + 'CmbSecondCode').value == "") {
//                $get(MasterObj + 'CmbSecondCode').value = 0
//            }   
        }
        //*******************************************************************************
        function PassFocusAfterAjax(objId) {

            //alert(objId)
            switch (objId) {
                case "txtPersonCode":


                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'txtPersonCode').focus()
                        
                    }
                    else {
                           


                        if ($get(MasterObj + 'txtPersonName').value == 0) {
                            $get(MasterObj + 'txtPersonCode').focus()
                            
                        }
                        else {
                            if ($get(MasterObj + 'ChkSDate').checked) {
                                PassFocusAfterAjax("SDateYear")

                            }
                            else {
                                document.getElementById(MasterObj + "SDateDay").focus()
                                document.getElementById(MasterObj + "SDateDay").select()

                            }
                            
                        }
                    }



                    break

                case "txtPersonName":
                    if ($get(MasterObj + 'ChkSDate').checked) {
                        PassFocusAfterAjax("SDateYear")

                    }
                    else {
                        document.getElementById(MasterObj + "SDateDay").focus()
                        document.getElementById(MasterObj + "SDateDay").select()

                    }
                    
                    break

                case "SDateDay":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'SDateDay').focus()
                    }
                    else {
                        if (FixDate('Day', $get(MasterObj + objId))) {

                            document.getElementById(MasterObj + "SDateMonth").focus()
                            document.getElementById(MasterObj + "SDateMonth").select()
                            
                        }
                    }

                    break

                case "SDateMonth":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'SDateMonth').focus()
                    }
                    else {
                        if (FixDate('Month', $get(MasterObj + objId))) {
                            document.getElementById(MasterObj + "SDateYear").focus()
                            document.getElementById(MasterObj + "SDateYear").select()
                            
                        }
                    }
                    break

                case "SDateYear":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'SDateYear').focus()
                    }
                    else {

                        if (FixDate('Year', $get(MasterObj + objId))) {
                            if ($get(MasterObj + 'ChkEDate').checked) {
                                PassFocusAfterAjax("EDateYear")
                            }
                            else {
                                if ($get(MasterObj + 'OpDaily').checked) {
                                   

                                    document.getElementById(MasterObj + "EDateDay").focus()
                                    document.getElementById(MasterObj + "EDateDay").select()

                                }
                                else

                                    $get(MasterObj + 'CmbGroupCode').focus()
                            }

                        }
                    }
                    break

                case "EDateDay":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'EDateDay').focus()
                    }
                    else {
                        if (FixDate('Day', $get(MasterObj + objId))) {
                            document.getElementById(MasterObj + "EDateMonth").focus()
                            document.getElementById(MasterObj + "EDateMonth").select()
                            
                        }
                    }
                    break

                case "EDateMonth":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'EDateMonth').focus()
                    }
                    else {
                        if (FixDate('Month', $get(MasterObj + objId))) {
                            document.getElementById(MasterObj + "EDateYear").focus()
                            document.getElementById(MasterObj + "EDateYear").select()
                            
                        }
                    }
                    break

                case "EDateYear":
                    if ($get(MasterObj + objId).value == "") {
                        $get(MasterObj + 'EDateYear').focus()
                    }
                    else {
                        if (FixDate('Year', $get(MasterObj + objId))) {
                            if ($get(MasterObj + 'ChkFirstCode').checked) {
                                PassFocusAfterAjax("CmbGroupCode")

                            }
                            else {
                                $get(MasterObj + 'CmbGroupCode').focus()
                            }
                        }
                        
                    }
                    break

                case "CmbGroupCode":

                    if ($get(MasterObj + 'CmbSecondCode').disabled) {

                        $get(MasterObj + 'CmbGroupCode').focus()
                    }
                    else {

                        if ($get(MasterObj + 'ChkSecondCode').checked) {
                            PassFocusAfterAjax("CmbSecondCode")

                        }
                        else {
                            $get(MasterObj + 'CmbSecondCode').focus();
                        }
                        
                    }

                    break

                case "CmbSecondCode":
                    
                    if ($get(MasterObj + 'OpHourly').checked) {
                        if ($get(MasterObj + 'ChkSTime').checked) {
                            PassFocusAfterAjax("txtStartTime")

                        }
                        else {
                            $get(MasterObj + 'txtStartTime').disabled = false;
                            $get(MasterObj + 'txtStartTime').focus()
                            $get(MasterObj + 'txtStartTime').select()
                        }

                    }
                    else {
                        if ($get(MasterObj + 'ChkDescr').checked) {
                            PassFocusAfterAjax("txtDescr")

                        }
                        else
                            $get(MasterObj + 'txtDescr').focus()

                    }
                    
                    break

                case "txtStartTime":
                    if ($get(MasterObj + 'ChkSTime').checked) {
                        PassFocusAfterAjax("txtEndTime")

                    }
                    else {
                        $get(MasterObj + 'txtEndTime').disabled = false;
                        $get(MasterObj + 'txtEndTime').focus()
                        $get(MasterObj + 'txtEndTime').select()
                    }
                    
                    break

                case "txtEndTime":
                    if ($get(MasterObj + 'ChkDescr').checked) {
                        PassFocusAfterAjax("txtDescr")

                    }
                    else {
                        $get(MasterObj + 'txtDescr').focus()
                    }
                    
                    break

                case "txtDescr":

                    if ($get(MasterObj + 'ChkCard').checked) {
                        PassFocusAfterAjax('txtCardCode')
                    }
                    else {
                        $get(MasterObj + 'txtCardCode').focus()
                        $get(MasterObj + 'txtCardCode').select()
                    }
                    break

                case "txtCardCode":
                    if ($get(MasterObj + 'ChkPrsId').checked) {
                        PassFocusAfterAjax('txtPersonCode')
                    }
                    else {
                        $get(MasterObj + 'txtPersonCode').focus()
                        $get(MasterObj + 'txtPersonCode').select()
                    }
                    break  
               
                case "":

                    if ($get(MasterObj + 'ChkCard').checked) {
                        PassFocusAfterAjax('txtCardCode')
                    }
                    else {
                        $get(MasterObj + 'txtCardCode').focus()
                        $get(MasterObj + 'txtCardCode').select()
                    }
                    break
                    
                    
                default:

                    if ($get(MasterObj + 'ChkCard').checked) {
                        PassFocusAfterAjax('txtCardCode')
                    }
                    else {
                        $get(MasterObj + 'txtCardCode').focus()
                        $get(MasterObj + 'txtCardCode').select()
                    }
                    break
            }
        }
        //*******************************************************************************
        function LoadDataAfterAjax(SelectedRow) {

            $get(MasterObj + 'txtCreditID').value = SelectedRow.CreditId;
            $get(MasterObj + 'txtPersonCode').value = SelectedRow.cells(0).innerText;
           

            var Sd = SelectedRow.cells(2).innerText;

            $get(MasterObj + 'SDateDay').value = Sd.substr(0, 2)
            $get(MasterObj + 'SDateMonth').value = Sd.substr(3, 2)
            $get(MasterObj + 'SDateYear').value = Sd.substr(6, 4)

            var Ed = SelectedRow.cells(3).innerText

            $get(MasterObj + 'EDateDay').value = Ed.substr(0, 2)
            $get(MasterObj + 'EDateMonth').value = Ed.substr(3, 2)
            $get(MasterObj + 'EDateYear').value = Ed.substr(6, 4)

            $get(MasterObj + 'CmbGroupCode').value = SelectedRow.FirstCode;
            //OnChangeCmbGroupCode()
            $get(MasterObj + 'CmbSecondCode').value = ((SelectedRow.SecondCode.substr(0, 1) == '9') ? "0" + SelectedRow.SecondCode.substr(1, 2) : SelectedRow.SecondCode);

            $get(MasterObj + 'txtStartTime').value = SelectedRow.cells(4).innerText;
            
            $get(MasterObj + 'txtEndTime').value = SelectedRow.cells(5).innerText;
            $get(MasterObj + 'txtDescr').value = SelectedRow.cells(8).title;
            if (SelectedRow.Daily && !SelectedRow.Timely) {//روزانه

                document.getElementById(MasterObj + "EDateDay").disabled = false
                document.getElementById(MasterObj + "EDateMonth").disabled = false
                document.getElementById(MasterObj + "EDateYear").disabled = false

                $get(MasterObj + 'txtStartTime').disabled = true;
                $get(MasterObj + 'txtEndTime').disabled = true;
                $get(MasterObj + 'OpDaily').checked = true;
            }
            else if (!SelectedRow.Daily && SelectedRow.Timely) {//ساعتي


                document.getElementById(MasterObj + "EDateDay").disabled = true
                document.getElementById(MasterObj + "EDateMonth").disabled = true
                document.getElementById(MasterObj + "EDateYear").disabled = true

                $get(MasterObj + 'txtStartTime').disabled = false;
                $get(MasterObj + 'txtEndTime').disabled = false;
                $get(MasterObj + 'OpHourly').checked = true;
            }
            else if (SelectedRow.Daily && SelectedRow.Timely) {
                if ($get(MasterObj + 'txtStartTime').value == '00:00' && $get(MasterObj + 'txtEndTime').value == '00:00') {//روزانه

                    document.getElementById(MasterObj + "EDateDay").disabled = false
                    document.getElementById(MasterObj + "EDateMonth").disabled = false
                    document.getElementById(MasterObj + "EDateYear").disabled = false

                    $get(MasterObj + 'txtStartTime').disabled = true;
                    $get(MasterObj + 'txtEndTime').disabled = true;
                    $get(MasterObj + 'OpDaily').checked = true;
                }
                else if ($get(MasterObj + 'txtStartTime').value != '00:00' || $get(MasterObj + 'txtEndTime').value != '00:00') {//ساعتي

                    document.getElementById(MasterObj + "EDateDay").disabled = true
                    document.getElementById(MasterObj + "EDateMonth").disabled = true
                    document.getElementById(MasterObj + "EDateYear").disabled = true

                    $get(MasterObj + 'txtStartTime').disabled = false;
                    $get(MasterObj + 'txtEndTime').disabled = false;
                    $get(MasterObj + 'OpHourly').checked = true;
                }
            }

        }
        //*******************************************************************************
                </script>          
        <table style="width: 100%">
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td class="style4" style="width: 121px">
                                شماره پرسنلي :</td>
                            <td>
                                        <input ID="txtGrdPersonCode" runat="server" name="txtGrdPersonCode" onblur="OnBlurtxtGrdPersonCode(this)" 
                                             onkeydown="OnKeyDownInt(this)" style="width: 100px" onfocus="OnFocusPerson(this)"
                                            type="text" class="TxtControls" /></td>
                            <td class="style3" style="width: 140px">
                                نام و نام خانوادگي :</td>
                            <td class="style2" style="width: 188px">
                             <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate> 
                                        &nbsp;<input ID="txtGrdPersonName" runat="server" name="txtGrdPersonName" 
                                             style="width: 100px" type="text" class="TxtControls" />
                                        <input ID="btnRefreshGrdPerson" name="btnRefreshGrdPerson" 
                                            onclick="onClickBtnRefreshGrdPerson(this)" 
                                            style="WIDTH: 25px; CURSOR: hand; HEIGHT: 22px ;" type="button" 
                                            value="..." class="HeaderStyle" />
                               </ContentTemplate>
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>              
                            </td>
                            <td class="style5" style="width: 74px">
                                از تاريخ :</td>
                            <td style="width: 129px">
                                <uc2:KCalendar ID="KCalGrdSDate" runat="server" />
                            </td>
                            <td class="style1" style="width: 65px">
                                تا تاريخ :</td>
                            <td>
                                <uc2:KCalendar ID="KCalGrdEDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style17">
                                مجوز :</td>
                            <td class="style18">
                              
                                <select id="CmbGrdGroupCode" name="CmbGroupCode0" style="width: 120px" onchange="OnChangeCmbGrdGroupCode()"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select></td>
                            <td class="style19">
                                نوع مجوز:</td>
                            <td class="style20">
                              
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <select ID="CmbGrdSecondCode" runat="server" name="CmbGrdSecondCode" 
                                    style="width: 122px" class="TxtControls">
                                            <option></option>
                                        </select>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="style21">
                                <input id="ChkDaily" name="ChkDaily" style="background-color: transparent" runat="server"
                                    type="checkbox" />روزانه                                 </td>
                            <td class="style22">
                            
                            
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                           <ContentTemplate> 
                                &nbsp;
                                <input ID="ChkHourly" runat="server" name="ChkHourly" 
                                    style="background-color: transparent" type="checkbox" />ساعتي
                                </ContentTemplate>
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                             </Triggers>
                             </asp:UpdatePanel>  </td>
                            <td class="style23">
                                &nbsp;</td>
                            <td class="style18">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    
                    <uc1:ToolBar ID="OToolBar" runat="server" />
                    
                </td>
            </tr>
            <tr>
                <td align="center">
                                 <table id="XTabTable_Header" style="width: 99%; height: 26px;">
                            <thead style="display: inline">
                                <tr>
                                    <td class="CssHeaderStyle" style="width: 95px" align="center">
                                        ش پرسنلي
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 160px">
                                        نام و نام خانوادگي
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 100px">
                                        از تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 100px">
                                        تا تاريخ
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 65px">
                                        ازساعت</td>
                                    <td class="CssHeaderStyle" align="center" style="width: 65px">
                                        تا
                                        ساعت</td>
                                    <td class="CssHeaderStyle" align="center" style="width: 120px">
                                        مجوز
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 120px">
                                        نوع مجوز
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 120px">
                                        توضيحات
                                    </td>
                                    <td class="CssHeaderStyle" align="center" style="width: 140px">
                                        زمان ثبت
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <div style="overflow: auto; width: 100%; height: 265px">
                            <table width="99%" id="XTabTable" onclick="OnClickGrdXTabTable()">
                                <thead style="display: none">
                                </thead>
                            </table>
                        </div>
                </td>
            </tr>
            <tr>
                <td >
                <hr />
                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                  <ContentTemplate> 
                    <table style="width: 100%; height: 106px;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style53">
                                <input id="ChkOp" name="ChkOp" style="background-color: transparent" runat="server"
                                    type="checkbox" />مجوز</td>
                            <td class="style68">
                                <input id="OpDaily" checked name="OpType" runat="server" onclick="OnClickOptions(1)"
                                    style="background-color: transparent" type="radio" />روزانه&nbsp;<input id="OpHourly"
                                        name="OpType" runat="server" style="background-color: transparent" type="radio"
                                        value="1" onclick="OnClickOptions(1)" />ساعتي 
                            </td>
                            <td class="style58" align="center">
                                نوبت کاري :
                             </td>                           
                            <td colspan="2" style="color: #ff00ff" id="NobatKariTD" runat="server" align="right" 
                                class="style67">
                            </td>
                            <td align="right" class="style50">
                                شيفت :
                            </td>
                            <td style="color: #ff00ff" id="ShiftTD" runat="server" align="right">
                            </td>
                            <td align="right">
                                تردد:
                            </td>
                            <td style="color: #ff00ff" id="TaradodTD" runat="server"  align="right">
                            </td>
                        </tr>
                        <tr>
                              <td> <input id="ChkCard" name="ChkCard" style="background-color: transparent" runat="server"
                                    type="checkbox" />ش کارت </td>
                            <td class="style38">
                                        <input ID="txtCardCode" runat="server" name="txtCardCode" onblur="OnBlurtxtCardCode(this);" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" style="width: 86px" value="0" type="text" class="TxtControls" /></td>        
                            <td class="style62" colspan="2">
                                <input id="ChkPrsId" name="ChkPrsId" style="background-color: transparent" runat="server"
                                   type="checkbox" />پرسنلی<input ID="txtPersonCode" runat="server" 
                                    class="TxtControls" name="txtPersonCode" onblur="OnBlurtxtPersonCode(this);" 
                                    onfocus="OnFocusPerson(this)" 
                                    onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" style="width: 99px" 
                                    type="text" value="0" /></td>
                            <td class="style45" align="right">
                               <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>&nbsp;&nbsp;نام
                                        <input ID="txtPersonName" runat="server" class="TxtControls" 
                                            name="txtPersonName" style="width: 110px; margin-right: 0px;" type="text" 
                                            align="right" />
                                        <input ID="btnRefreshPerson" class="HeaderStyle" name="btnRefreshPerson" 
                                            onclick="onClickBtnRefreshPerson(this)" 
                                            style="WIDTH: 25px; CURSOR: hand; HEIGHT: 22px ;" type="button" 
                                            value="..." align="right" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="style51">
                            
                                <input id="ChkSDate" name="ChkSDate" style="background-color: transparent" runat="server"
                                    type="checkbox" />از تاريخ </td>
                            <td class="style40">
                            
                                <table class="style27">
                                    <tr>
                                        <td>
                                        <input ID="SDateDay" runat="server" name="SDateDay" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this)"
                                    style="width: 25px" onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="2" class="TxtControls" /></td>
                                        <td>
                                            <span class="style24">/</span></td>
                                        <td>
                                        <input ID="SDateMonth" runat="server" name="txtPersonCode1" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this)"
                                    style="width: 25px" onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="2" class="TxtControls" /></td>
                                        <td>
                                            <span class="style24">/</span></td>
                                        <td>
                                        <input ID="SDateYear" runat="server" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this);RefreshWorkTimes();"
                                    style="width: 50px" onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="4" class="TxtControls" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="style33">
                            
                                <input id="ChkEDate" name="ChkEDate" style="background-color: transparent" runat="server"
                                    type="checkbox" />تا تاريخ</td>
                            <td width="80" class="style37">
                                <table class="style27">
                                    <tr>
                                        <td>
                                        <input ID="EDateDay" runat="server" name="txtPersonCode3" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this)"
                                    style="width: 25px" onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="2" class="TxtControls" /></td>
                                        <td>
                                            <span class="style24">/</span></td>
                                        <td>
                                        <input ID="EDateMonth" runat="server" name="txtPersonCode4" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this)"
                                    style="width: 25px; " onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="2" class="TxtControls" /></td>
                                        <td>
                                            <span class="style24">/</span></td>
                                        <td>
                                        <input ID="EDateYear" runat="server" name="txtPersonCode5" 
                                            onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" 
                                            onblur="onBlurDate(this)"
                                    style="width: 50px" onfocus="OnFocusPerson(this)"
                                            type="text" maxlength="4" class="TxtControls" /></td>
                                    </tr>
                                </table>
                             </td>
                        </tr>
                        <tr>
                            <td class="style31" colspan="5">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                         <td class="style65">
                                            <input ID="ChkFirstCode" runat="server" name="ChkSecondCode0" 
                                                style="background-color: transparent" type="checkbox" />مجوز</td>
                                         <td class="style66">
                                            <select ID="CmbGroupCode" runat="server" name="CmbGroupCode" 
                                                onchange="OnChangeCmbGroupCode()" onkeydown="onKeyDownEnter(this)" 
                                                style="width: 120px" class="TxtControls">
                                                <option></option>
                                            </select></td>
                                        <td class="style52">
                                            <input ID="ChkSecondCode" runat="server" name="ChkSecondCode" 
                                                style="background-color: transparent" type="checkbox" />نوع مجوز</td>
                                         <td class="style63">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <select ID="CmbSecondCode" runat="server" name="CmbSecondCode" 
                                                        onchange="OnChangeCmbSecondCode()" onkeydown="onKeyDownEnter(this)" 
                                                        style="width: 100px" class="TxtControls">
                                                        <option></option>
                                                    </select>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                       <td class="style65">
                                            <input ID="ChkSTime" runat="server" name="ChkSTime" 
                                                style="background-color: transparent" type="checkbox" />از ساعت</td>
                                        <td class="style66">
                                            <input ID="txtStartTime" runat="server" name="txtStartTime" 
                                                onblur="Timechk(this)" 
                                                onkeydown="OnKeyDownDate(this.value);onKeyDownEnter(this)" 
                                                style="width: 99px; margin-right: 0px;" type="text" value="00:00" 
                                                class="TxtControls" /></td>
                                        <td class="style52">
                                            <input ID="ChkETime" runat="server" name="ChkETime" 
                                                style="background-color: transparent" type="checkbox" />تا ساعت</td>
                                       <td class="style63">
                                            <input ID="txtEndTime" runat="server" name="txtEndTime" onblur="Timechk(this)" 
                                                onkeydown="OnKeyDownDate(this.value);onKeyDownEnter(this)" style="width: 99px" 
                                                type="text" value="00:00" class="TxtControls" /></td>
                                    </tr>
                                    <tr>
                                        <td class="style65" valign="top">
                                            <input ID="ChkDescr" runat="server" name="ChkDescr" 
                                                style="background-color: transparent" type="checkbox" />توضيحات</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDescr" runat="server" Height="37px" 
                                                 onkeydown="onKeyDownEnter(this)" TextMode="MultiLine" Width="91%" 
                                                CssClass="TxtControls"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="style32" colspan="4">
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                                        <table ID="grdCardexRemain_Header" style="width: 100%; height: 26px;">
                                            <thead style="display: inline">
                                                <tr>
                                                    <td align="center" class="CssHeaderStyle" width="120">
                                                        كاردكس</td>
                                                    <td align="center" class="CssHeaderStyle" style="width: 117px">
                                                        دوره كاردكس</td>
                                                    <td align="center" class="CssHeaderStyle" width="150">
                                                        مانده</td>
                                                    
                                                </tr>
                                            </thead>
                                        </table>
                                        <div style="overflow: auto; width: 100%; height: 100px; margin-right: 0px;">
                                            <table width="99%" id="grdCardexRemain" runat="server">
                                                <thead style="display: none">
                                                    
                                                </thead>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style53">
                                &nbsp;</td>
                             <td class="style12" colspan="6" width="175">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                           <ContentTemplate> 
                                &nbsp;<div style="display:none">
                            <asp:HiddenField ID="txtReplacementID" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtXMLCredit" runat="server" />
                            <asp:HiddenField ID="txtXMLGrdSC" runat="server" />
                            <asp:HiddenField ID="txtXmlCardexRemain" runat="server" />
                            <asp:HiddenField ID="txtXMLSC" runat="server" />
                            <asp:HiddenField ID="txtXmlAllPersonelName" runat="server" />
                           </div>              
                             </ContentTemplate>  
                             <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                
                             </Triggers>
                        </asp:UpdatePanel>
                            </td>
                        </tr>
                        </table>
                
                </ContentTemplate>
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                             </Triggers>
                </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    
  
    <div style="display:none">
          
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
        <input id="txtSessionID" maxlength="10" runat="server" name="txtSessionID" type="text" />
                   <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input id="txtOnLineUser" maxlength="10" runat="server" name="txtOnLineUser" type="text" />                
        <input id="CurDate" maxlength="10" runat="server" name="CurDate" type="text" />                
        <input id="SDate" maxlength="10" runat="server" name="SDate" type="text" />
        <input id="EDate" maxlength="10" runat="server" name="EDate" type="text" />
        <input id="txtDelSDate" maxlength="10" runat="server" name="SDate" type="text" />
        <input id="txtDelEDate" maxlength="10" runat="server" name="EDate" type="text" />
        <input id="txtCreditID" maxlength="10" runat="server" name="txtCreditID" type="text" />      
        <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
        <input type="text" id="txtSaveXML" name="txtSaveXML" runat="server" />
        <input type="text" id="txtDelXml" name="txtDelXml" runat="server" />
        <input type="text" id="txtSecondCode" name="txtSecondCode" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtObjectID" name="txtObjectID" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
        
        
    </div>
    
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
    <script language="javascript" type="text/javascript">

       
           
        //**************************************OnLoad********************************************
        window.name = "BeforeOccureCredit"
        aspnetForm.target = "BeforeOccureCredit"

        document.getElementById(MasterObj + "KCalGrdSDate_txtDay").value = document.getElementById(MasterObj + "SDate").value.substr(8, 2);
        document.getElementById(MasterObj + "KCalGrdSDate_txtMonth").value = document.getElementById(MasterObj + "SDate").value.substr(5, 2);
        document.getElementById(MasterObj + "KCalGrdSDate_txtYear").value = document.getElementById(MasterObj + "SDate").value.substr(0, 4);
        
        document.getElementById(MasterObj + "KCalGrdEDate_txtDay").value = document.getElementById(MasterObj + "EDate").value.substr(8, 2);
        document.getElementById(MasterObj + "KCalGrdEDate_txtMonth").value = document.getElementById(MasterObj + "EDate").value.substr(5, 2);
        document.getElementById(MasterObj + "KCalGrdEDate_txtYear").value = document.getElementById(MasterObj + "EDate").value.substr(0, 4);


        document.getElementById(MasterObj + "SDateDay").value = document.getElementById(MasterObj + "CurDate").value.substr(8, 2);
        document.getElementById(MasterObj + "SDateMonth").value = document.getElementById(MasterObj + "CurDate").value.substr(5, 2);
        document.getElementById(MasterObj + "SDateYear").value = document.getElementById(MasterObj + "CurDate").value.substr(0, 4);
   

        document.getElementById(MasterObj + "EDateDay").value = document.getElementById(MasterObj + "CurDate").value.substr(8, 2);
        document.getElementById(MasterObj + "EDateMonth").value = document.getElementById(MasterObj + "CurDate").value.substr(5, 2);
        document.getElementById(MasterObj + "EDateYear").value = document.getElementById(MasterObj + "CurDate").value.substr(0, 4);

        lastPersonCode = $get(MasterObj + "txtPersonCode").value
        if ($get(MasterObj + "txtGrdPersonCode").value != "") {
            OnBlurtxtGrdPersonCode($get(MasterObj + "txtGrdPersonCode"))
            
        }

        lastGrdPersonCode = $get(MasterObj + "txtGrdPersonCode").value

        lastGrdGroupCodeID = $get(MasterObj + "CmbGrdGroupCode").value
        lastGroupCodeID = $get(MasterObj + "CmbGroupCode").value

        OnClickOptions(1);
        Clear()
        
        
        //***************************************ToolBar********************************
        function OnClickBtnNew() {
            /***********************************/
            var obj;
            obj = XTabTable

            if (LastSelectedRow != "")
                if (parseInt(LastSelectedRow) < obj.rows.length) {
                if (parseInt(LastSelectedRow) % 2 == 0)
                    obj.rows(parseInt(LastSelectedRow)).className = "CssItemStyle"
                else
                    obj.rows(parseInt(LastSelectedRow)).className = "CssAlternatingItemStyle";
                //obj.rows(parseInt(LastSelectedRow)).style.backgroundColor = '';
            }

            if (LastSelectedRow == "0")
                if (obj.rows.length > 0)
                obj.rows(parseInt(LastSelectedRow)).className = "CssItemStyle";

            LastSelectedRow = "";
            
            /*************************************/
            ClearAll();
            document.getElementById(MasterObj + "txtPersonCode").focus();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function FixDate(Tag,obj) {

                      
           if (obj.value == '') {
                //alert("لطفا در اين قسمت مقدار وارد نماييد")
                obj.focus()
                obj.select()
                return false
            }
            else 
            {
                if (Tag == 'Day') {
                    //alert(Tag)
                    if (obj.value > 31) {
                        //alert('عدد وارد شده به عنوان روز صحيح نمي باشد')
                        obj.value = ''
                        obj.focus()
                        obj.select()
                        return false
                    }
                    else if (obj.value < 10 && obj.value.length == 1) {
                        obj.value = '0' + obj.value
                    }
                }
                else if (Tag == 'Month') {
                    //alert(Tag)
                    if (obj.value > 12) {
                        //alert('عدد وارد شده به عنوان ماه صحيح نمي باشد')
                        obj.value = ''
                        obj.focus()
                        obj.select()
                        return false
                    }
                    else if (obj.value < 10 && obj.value.length == 1) {
                        obj.value = '0' + obj.value
                    }
                    
                    
                }
                else if (Tag == 'Year') {
                    //alert(Tag)
                    if (obj.value.length == 1) {
                        //alert('عدد وارد شده به عنوان سال صحيح نمي باشد')
                        obj.value = ''
                        obj.focus()
                        obj.select()
                        return false
                    }
                    else if (obj.value.length == 3) {
                        //alert('عدد وارد شده به عنوان سال صحيح نمي باشد')
                        obj.value = ''
                        obj.focus()
                        obj.select()
                        return false
                    }
                    else if (obj.value.length == 2) {
                        obj.value = '13' + obj.value
                    }

                    if (obj.id == MasterObj + "SDateYear") {
                        if ($get(MasterObj + "SDateMonth").value > 6 && $get(MasterObj + "SDateMonth").value < 12) {
                            if ($get(MasterObj + "SDateDay").value > 30) {
                                //alert("تاريخ شروع صحيح نمي باشد")
                                $get(MasterObj + "SDateDay").focus()
                                $get(MasterObj + "SDateDay").select()
                                return false
                            }
                        }
                        else if ($get(MasterObj + "SDateMonth").value == 12) {

                            if ((parseInt(obj.value) + 1) % 4 == 0) {

                                if ($get(MasterObj + "SDateDay").value > 30) {
                                    //alert("تاريخ شروع صحيح نمي باشد")
                                    $get(MasterObj + "SDateDay").focus()
                                    $get(MasterObj + "SDateDay").select()
                                    return false
                                }
                            }
                            else {
                                if ($get(MasterObj + "SDateDay").value > 29) {
                                    //alert("تاريخ شروع صحيح نمي باشد")
                                    $get(MasterObj + "SDateDay").focus()
                                    $get(MasterObj + "SDateDay").select()
                                    return false
                                }
                            }
                        }

                    }
                    else if (obj.id == MasterObj + "EDateYear") {
                        if ($get(MasterObj + "EDateMonth").value > 6 && $get(MasterObj + "EDateMonth").value < 12) {
                            if ($get(MasterObj + "EDateDay").value > 30) {
                                //alert("تاريخ پايان صحيح نمي باشد")
                                $get(MasterObj + "EDateDay").focus()
                                $get(MasterObj + "EDateDay").select()
                                return false
                            }
                        }
                        else if ($get(MasterObj + "EDateMonth").value == 12) {

                            if ((parseInt(obj.value) + 1) % 4 == 0) {

                                if ($get(MasterObj + "EDateDay").value > 30) {
                                    //alert("تاريخ پايان صحيح نمي باشد")
                                    $get(MasterObj + "EDateDay").focus()
                                    $get(MasterObj + "EDateDay").select()
                                    return false
                                }
                            }
                            else {
                                if ($get(MasterObj + "EDateDay").value > 29) {
                                    //alert("تاريخ پايان صحيح نمي باشد")
                                    $get(MasterObj + "EDateDay").focus()
                                    $get(MasterObj + "EDateDay").select()
                                    return false
                                }
                            }
                        }
                    }
                }
                
            }
            
             
                return true
        }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnSave() {
           
           if (CheckNotEmpty())
           {
               if (CheckCorrectDateRange()) {
                   Save("Save")
                   document.getElementById(MasterObj + "txtGrdPersonCode").value = document.getElementById(MasterObj + "txtPersonCode").value
                    if (document.getElementById(MasterObj + "txtSaveXml").value != "") {
                        document.getElementById(MasterObj + "txtSaveXml").value = document.getElementById(MasterObj + "txtSaveXml").value.replace("</Root>", "<Setting><CalcParam>3</CalcParam><Flag>1</Flag><OnlineUserID>" + $get(MasterObj + "txtOnLineUser").value + "</OnlineUserID><SubSysID>13</SubSysID><PageID>1322</PageID></Setting></Root>")
                        //alert(document.getElementById(MasterObj + "txtSaveXml").value)
                        $get(MasterObj + "txtSubmit").value = "Save";
                        $get(MasterObj + "BtnSubmit").click();
                    }
                    else {
                        alert("تغییری جهت ذخیره داده نشده است")
                    }
                }
                else
                    alert("تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد")
           }
           else
               return false
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnSaveNew() {
           document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
           if (CheckNotEmpty())
           {
               if (CheckCorrectDateRange())
               {
                    Save("SaveNew")
                    if (document.getElementById(MasterObj + "txtSaveXml").value != "") {
                        document.getElementById(MasterObj + "txtSaveXml").value = document.getElementById(MasterObj + "txtSaveXml").value.replace("</Root>", "<Setting><CalcParam>3</CalcParam><Flag>1</Flag><OnlineUserID>" + $get(MasterObj + "txtOnLineUser").value + "</OnlineUserID><SubSysID>13</SubSysID><PageID>1322</PageID></Setting></Root>")
                        $get(MasterObj + "txtSubmit").value = "Save";
                        $get(MasterObj + "BtnSubmit").click();
                    }
                    else {
                        alert("تغییری جهت ذخیره داده نشده است")
                    }
                }
                else
                    alert("تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد")
           }
           return false
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnDel() {
           
           document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
           if ($get(MasterObj + "txtCreditID").value == "" || $get(MasterObj + "txtCreditID").value == "0") {
               alert("لطفا یک سطر را انتخاب نمایید")
               return;
           }
           if (confirm('آيا براي حذف مطمئن هستيد؟') == true) {

//               $get(MasterObj + "txtDelSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
//               $get(MasterObj + "txtDelSDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

               $get(MasterObj + "txtDelSDate").value = $get(MasterObj + "SDateYear").value + "/" + $get(MasterObj + "SDateMonth").value + "/" + $get(MasterObj + "SDateDay").value
               $get(MasterObj + "txtDelSDate").value = $get(MasterObj + "EDateYear").value + "/" + $get(MasterObj + "EDateMonth").value + "/" + $get(MasterObj + "EDateDay").value
               
             
             $get(MasterObj + "txtSubmit").value = "Delete";
             $get(MasterObj + "BtnSubmit").click();
           }
       }
       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnFilter() {
            
           document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
           
           LastSelectedRow = "";
           var str = ""
           var SD = $get(MasterObj + "KCalGrdSDate_txtYear").value + "/" + $get(MasterObj + "KCalGrdSDate_txtMonth").value + "/" + $get(MasterObj + "KCalGrdSDate_txtDay").value
           var ED = $get(MasterObj + "KCalGrdEDate_txtYear").value + "/" + $get(MasterObj + "KCalGrdEDate_txtMonth").value + "/" + $get(MasterObj + "KCalGrdEDate_txtDay").value  
           
           str += "<Root><Tb>"
           str += "<PersonCode>" + (($get(MasterObj + "txtGrdPersonCode").value == "") ? "0" : $get(MasterObj + "txtGrdPersonCode").value) + "</PersonCode>"
           str += "<SDate>" + SD + "</SDate>"
           str += "<EDate>" + ED + "</EDate>"
           str += "<STime>00:00</STime>"
           str += "<ETime>00:00</ETime>"

           str += "<FirstCode>" + (($get(MasterObj + "CmbGrdGroupCode").value == "") ? "0" : $get(MasterObj + "CmbGrdGroupCode").value) + "</FirstCode>"
           str += "<SecondCode>" + (($get(MasterObj + "CmbGrdSecondCode").value == "") ? "0" : $get(MasterObj + "CmbGrdSecondCode").value) + "</SecondCode>"
           str += "<Daily>" + (($get(MasterObj + "ChkDaily").checked) ? "1" : "0") + "</Daily>"
           str += "<Hourly>" + (($get(MasterObj + "ChkHourly").checked) ? "1" : "0") + "</Hourly>"
           
           str += "</Tb></Root>"
            //alert(str)
           document.getElementById(MasterObj + "txtSearch").value = str
           //-------------------
           $get(MasterObj + "txtSubmit").value = "Filter";
           $get(MasterObj + "BtnSubmit").click();
           
       }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                CreateGrid('Const')
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                CreateGrid('Next')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            CreateGrid('Last')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1)
                CreateGrid('Previous')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            CreateGrid('First')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //*************************************EndToolBar*******************************
        //***************************************ThisPage*******************************
        function GetPersonelName(PersonCode) {
            //alert(PersonCode)
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXMLAllPersonelName').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/DataEntryEntity/AllPersonelName[PersonCode='+PersonCode+']')

            if (xmlNodes.length != 0) {
                return (xmlNodes.item(0).selectSingleNode('PersonName').text)
            }
            else
                return ''
        }
        //*******************************************************************************
        function GetPersonelCode(CardCode) {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXMLAllPersonelName').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/DataEntryEntity/AllPersonelName[CardCode=' + CardCode + ']')

            if (xmlNodes.length != 0) {
                return (xmlNodes.item(0).selectSingleNode('PersonCode').text)
            }
            else
                return ''
        }

        //================================================
        function OnBlurtxtGrdPersonCode(obj) {
        
            if ($get(MasterObj + "txtGrdPersonCode").value == "") {
                $get(MasterObj + "txtGrdPersonName").value = "";
                lastGrdPersonCode = "";
            }
            else
                if ($get(MasterObj + "txtGrdPersonCode").value != lastGrdPersonCode) {
                    lastGrdPersonCode = $get(MasterObj + "txtGrdPersonCode").value
                    var PersonName = GetPersonelName($get(MasterObj + "txtGrdPersonCode").value)
                    if (PersonName != '')
                        $get(MasterObj + "txtGrdPersonName").value = PersonName
                    else {
                        $get(MasterObj + "txtGrdPersonCode").value = ''
                        $get(MasterObj + "txtGrdPersonName").value = ''
                        alert('شماره پرسنلي نادرست')
                        $get(MasterObj + "txtGrdPersonCode").focus()
                    }

            }
        }
        //***************************************ThisPage*******************************
        function OnBlurtxtCardCode(obj) {
            if ($get(MasterObj + "txtCardCode").value == "") {
                //$get(MasterObj + "txtPersonCode").value = "";
                //OnBlurtxtPersonCode($get(MasterObj + "txtPersonCode"));
                CardCode = "";
            }
            else
                if ($get(MasterObj + "txtCardCode").value != CardCode) {
                CardCode = $get(MasterObj + "txtCardCode").value;
                $get(MasterObj + "txtPersonCode").value = "";
                $get(MasterObj + "txtPersonCode").value = GetPersonelCode($get(MasterObj + "txtCardCode").value);
                if ($get(MasterObj + "txtPersonCode").value == "") {
                    alert("شماره کارت نا معتبر است ");
                    $get(MasterObj + "txtCardCode").focus();
                    $get(MasterObj + "txtCardCode").select();
                }
                else
                    OnBlurtxtPersonCode($get(MasterObj + "txtPersonCode"));
            }
        }
        //================================================
        var CardCode = "";
        function OnBlurtxtPersonCode(obj) {
            
            
            if ($get(MasterObj + "txtPersonCode").value == "") {
                $get(MasterObj + "txtPersonName").value = "";
                lastPersonCode = "";
                
            }
            else
               
                if ($get(MasterObj + "txtPersonCode").value != lastPersonCode) {
                    //alert()
                    lastPersonCode = $get(MasterObj + "txtPersonCode").value
                    var PersonName = GetPersonelName($get(MasterObj + "txtPersonCode").value)
                    if (PersonName != '') {
                        $get(MasterObj + "txtPersonName").value = PersonName
                        RefreshWorkTimes()
                    }
                    else {
                        $get(MasterObj + "txtPersonCode").value = ''
                        $get(MasterObj + "txtPersonName").value = ''
                        alert('شماره پرسنلي نادرست')
                        $get(MasterObj + "txtPersonCode").focus()
                    }
            }


            
            
        }
        
        //*******************************************************************************
        function OnFocusPerson(obj) {
            if (obj.id == MasterObj + "CmbGrdPerson" | obj.id == MasterObj + "txtGrdPersonCode")
                TempGrdPersonCode = obj.value
            if (obj.id == MasterObj + "CmbPerson" | obj.id == MasterObj + "txtPersonCode")
                TempPersonCode = obj.value  
        }
        //*******************************************************************************
        function ClearAll() {
            
            $get(MasterObj+'ChkOp').checked = false;
            $get(MasterObj + 'ChkPrsId').checked = false;
            $get(MasterObj + 'ChkSDate').checked = false;
            $get(MasterObj + 'ChkEDate').checked = false;
            $get(MasterObj + 'ChkFirstCode').checked = false;
            $get(MasterObj + 'ChkSecondCode').checked = false;
            $get(MasterObj+'ChkSTime').checked = false;
            $get(MasterObj+'ChkETime').checked = false;
            $get(MasterObj + 'ChkDescr').checked = false;
            $get(MasterObj + 'txtSecondCode').value = "";

            Clear()
        }
        //*******************************************************************************
        function Clear() {

            lastPersonCode = ""
            if (!$get(MasterObj + 'ChkCard').checked && !$get(MasterObj + 'ChkPrsId').checked) {
                $get(MasterObj + 'txtCardCode').value = ""
                CardCode = "";
            }
            else {
                if ($get(MasterObj + 'txtCardCode').value != "")
                    $get(MasterObj + 'ChkPrsId').checked = true;
            }
            if (!$get(MasterObj + 'ChkOp').checked) {
                
                $get(MasterObj + 'OpDaily').checked = true;
                
            }
            OnClickOptions(2)

            if (!$get(MasterObj+'ChkPrsId').checked) {
                $get(MasterObj + 'txtPersonCode').value = "";
                $get(MasterObj + 'txtPersonName').value = '';
            }

            if (!$get(MasterObj + 'ChkFirstCode').checked)
                $get(MasterObj + 'CmbGroupCode').value = '0';

            if (!$get(MasterObj + 'ChkSecondCode').checked)
                $get(MasterObj + 'CmbSecondCode').value = '0';

            if (!$get(MasterObj + 'ChkSDate').checked) {

                document.getElementById(MasterObj + "SDateDay").value = document.getElementById(MasterObj + "CurDate").value.substr(8, 2);
                document.getElementById(MasterObj + "SDateMonth").value = document.getElementById(MasterObj + "CurDate").value.substr(5, 2);
                document.getElementById(MasterObj + "SDateYear").value = document.getElementById(MasterObj + "CurDate").value.substr(0, 4);
            }

            if (!$get(MasterObj + 'ChkEDate').checked) {

                document.getElementById(MasterObj + "EDateDay").value = document.getElementById(MasterObj + "CurDate").value.substr(8, 2);
                document.getElementById(MasterObj + "EDateMonth").value = document.getElementById(MasterObj + "CurDate").value.substr(5, 2);
                document.getElementById(MasterObj + "EDateYear").value = document.getElementById(MasterObj + "CurDate").value.substr(0, 4);
            }

            if (!$get(MasterObj + 'ChkSTime').checked)
                $get(MasterObj + 'txtStartTime').value = "00:00";    

            if (!$get(MasterObj + 'ChkETime').checked)
                $get(MasterObj + 'txtEndTime').value = "00:00";

            if (!$get(MasterObj + 'ChkDescr').checked)
                $get(MasterObj + 'txtDescr').value = '';

            $get(MasterObj + 'txtCreditID').value = "0";
            LastSelectedRow = "";

            $get(MasterObj + 'txtPersonCode').focus()
            $get(MasterObj + 'txtPersonCode').select()
        }
        //*******************************************************************************
        function OnClickOptions(Type) {
            if (Type == 1) {
                $get(MasterObj + 'txtStartTime').value = "00:00";
                $get(MasterObj + 'txtEndTime').value = "00:00";
            }
            
            if ($get(MasterObj + 'OpDaily').checked) 	//روزانه
            {
                $get(MasterObj + 'txtStartTime').disabled = true
                $get(MasterObj + 'txtEndTime').disabled = true


                document.getElementById(MasterObj + "EDateDay").disabled = false
                document.getElementById(MasterObj + "EDateMonth").disabled = false
                document.getElementById(MasterObj + "EDateYear").disabled = false
            }
            else if ($get(MasterObj + 'OpHourly').checked) //ساعتي	
            {
                $get(MasterObj + 'txtStartTime').disabled = false
                $get(MasterObj + 'txtEndTime').disabled = false


                document.getElementById(MasterObj + "EDateDay").disabled = true
                document.getElementById(MasterObj + "EdateMonth").disabled = true
                document.getElementById(MasterObj + "EDateYear").disabled = true
            }

            var tempValue = 0
            tempValue=$get(MasterObj + 'CmbSecondCode').value
            OnChangeCmbGroupCode()

            $get(MasterObj + 'CmbSecondCode').value = tempValue

            if ($get(MasterObj + 'CmbSecondCode').value == "") {
                $get(MasterObj + 'CmbSecondCode').value=0
            }   
        }
        //*******************************************************************************
        function ClearRowGrid() {
            var oGrid = XTabTable
            for (var i = oGrid.rows.length - 1; i >= 0; i--) {
                oGrid.deleteRow(i);
            }
        }
        //*******************************************************************************
        function SetPagingInfo() {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

            if (document.getElementById("OToolBar_txtCurPage").value=="" | document.getElementById("OToolBar_txtCurPage").value=="0")
                 document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                 document.getElementById('OToolBar_BtnPrv').disabled = false;     

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;
        }
        //*******************************************************************************
        function CreateGrid(direction) {
            
            ClearRowGrid()
            
            if ($get(MasterObj + 'txtXMLCredit').value != "") {
                
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLCredit').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/DataEntryEntity/CreditBeforeOccure')
                $get(MasterObj + 'lblTotal').value = xmlNodes.length;
                //================================Paging
                var totalRecords
                totalRecords = xmlNodes.length
                $get(MasterObj + 'Totalpage').value = Math.ceil(totalRecords / PageSize)

                if (totalRecords > 0) {
                    currentPage_X = parseInt((($get(MasterObj + 'txtCurPage').value == "") ? "1" : $get(MasterObj + 'txtCurPage').value))
                    //currentPage_X = parseInt((($get(MasterObj + 'txtCurPage').value == "" | $get(MasterObj + 'txtCurPage').value == "0") ? "1" : $get(MasterObj + 'txtCurPage').value))
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
                            currentPage_X = parseInt($get(MasterObj + 'Totalpage').value)
                            break
                    }
                    var endFor
                    if (currentPage_X * PageSize - 1 < 0)
                        return
                    if (totalRecords <= currentPage_X * PageSize - 1)
                        endFor = totalRecords - 1
                    else
                        endFor = parseInt(currentPage_X) * PageSize - 1
                    //====================================================
                    $get(MasterObj + 'txtCurPage').value = currentPage_X
                    $get(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
                    $get(MasterObj + "lblTo").value = endFor + 1;
                    //====================================================

                    var i = (currentPage_X - 1) * PageSize
                    for (; i <= endFor; i++) {

                        var Param = '' + xmlNodes.item(i).selectSingleNode('PersonCode').text + ',' + xmlNodes.item(i).selectSingleNode('PersonName').text + ',' + xmlNodes.item(i).selectSingleNode('StartDate').text + ',' + xmlNodes.item(i).selectSingleNode('EndDate').text + ',' + xmlNodes.item(i).selectSingleNode('StartTime').text + ',' + xmlNodes.item(i).selectSingleNode('EndTime').text + ',' + xmlNodes.item(i).selectSingleNode('FirstCodeName').text + ',' + xmlNodes.item(i).selectSingleNode('SecondCodeName').text + ',' + xmlNodes.item(i).selectSingleNode('Descr').text + ',' + xmlNodes.item(i).selectSingleNode('CreateDate').text + ',';
                        AddToGrid('CreditId', xmlNodes.item(i).selectSingleNode('CreditId').text, 'FirstCode', xmlNodes.item(i).selectSingleNode('FirstCode').text, 'SecondCode', xmlNodes.item(i).selectSingleNode('SecondCode').text, 'Daily', xmlNodes.item(i).selectSingleNode('Daily').text, 'Timely', xmlNodes.item(i).selectSingleNode('Timely').text, Param)
                    }
                }
                else {
                   
                    //====================================================
                    $get(MasterObj + 'txtCurPage').value = "0";
                    $get(MasterObj + "lblFrom").value = "0";
                    $get(MasterObj + "lblTo").value = "0";
                    $get(MasterObj + 'Totalpage').value = "0";
                    $get(MasterObj + 'lblTotal').value = "0";
                    //====================================================
                }
            }
            else {

                //====================================================
                $get(MasterObj + 'txtCurPage').value = "0";
                $get(MasterObj + "lblFrom").value = "0";
                $get(MasterObj + "lblTo").value = "0";
                $get(MasterObj + 'Totalpage').value = "0";
                $get(MasterObj + 'lblTotal').value = "0";
                //====================================================
            }
            SetPagingInfo();
        }
        /*******************************************************************/
        function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3,AttrName4, AttrValue4, AttrName5, AttrValue5,Param) {
            var oGrid = XTabTable;
            var oRow = oGrid.insertRow();
            oRow.setAttribute(AttrName1, AttrValue1) //CreditId
            oRow.setAttribute(AttrName2, AttrValue2) //CmbCategoryNew
            oRow.setAttribute(AttrName3, AttrValue3) //CmbSecondCode
            oRow.setAttribute(AttrName4, AttrValue4) //CmbCategoryNew
            oRow.setAttribute(AttrName5, AttrValue5) //CmbSecondCode

            if ((oGrid.rows.length-1)%2==0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";
               
            var x = 0;
            var p = new String;
            var val = "";

            while (x < getCntChar(',', Param)) {
                val = getArray(Param, x, ',')
                switch (x) {
                    case 0:
                        var oCell0 = oRow.insertCell(); //PersonCode	
                        oCell0.innerText = val;
                        oCell0.className = "XTabTable";
                        oCell0.style.width = "95px"  //"92px"
                        oCell0.align = "center"
                        break

                    case 1:
                        var oCell1 = oRow.insertCell(); //Name
                        oCell1.innerText = ((val.length > 15) ? val.substring(0, 15) + "..." : val);
                        oCell1.title = val;
                        oCell1.className = "XTabTable";
                        oCell1.style.width = "160px"  //"150px"
                        oCell1.align = "right"
                        break

                    case 2:
                        var oCell2 = oRow.insertCell(); //StartDate
                        oCell2.innerText = val;
                        oCell2.style.width = "100px"   //"85px"
                        oCell2.align = "center";
                        break

                    case 3:
                        var oCell3 = oRow.insertCell();  //EndDate
                        oCell3.innerText = val;
                        oCell3.align = "center"
                        oCell3.style.width = "100px";
                        break

                    case 4:
                        var oCell4 = oRow.insertCell() //StartTime
                        oCell4.innerText = val;
                        oCell4.style.width = "65px";
                        oCell4.align = "center"
                        break

                    case 5:
                        var oCell5 = oRow.insertCell() //EndTime
                        oCell5.innerText = val;
                        oCell5.style.width = "65px"; //"68px";
                        oCell5.align = "center"
                        break

                    case 6:
                        var oCell6 = oRow.insertCell() //FirstCode
                        oCell6.innerText = ((val.length > 10) ? val.substring(0, 10) + "..." : val);
                        oCell6.title = val;
                        oCell6.style.width = "120px";   //"100px";
                        break

                    case 7:
                        var oCell7 = oRow.insertCell() //SecondCode
                        oCell7.innerText = ((val.length > 8) ? val.substring(0, 8) + "..." : val);
                        oCell7.title = val;
                        oCell7.style.width = "120px";   //"120px";
                        break

                    case 8:
                        var oCell8 = oRow.insertCell() //Descr
                        oCell8.innerText = ((val.length > 8) ? val.substring(0, 8) + "..." : val);
                        oCell8.title = val;
                        oCell8.style.width = "120px";   //"130px";
                        break
                    case 9:
                        var oCell9 = oRow.insertCell() //Descr
                        oCell9.innerText = ((val.length > 10) ? val.substring(0, 10) + "..." : val);
                        //oCell9.innerText = val;
                        oCell9.title = val;
                        oCell9.style.width = "140px";   //"130px";
                        break
                }
                x = x + 1;
            }

        }
        /*******************************************************************/
        function OnClickGrdXTabTable() {
            
            if (window.event.srcElement.tagName != 'IMG' && window.event.srcElement.tagName != 'TABLE') {
                var SelectedRow
                if (window.event.srcElement.parentElement.tagName == 'TD')
                    SelectedRow = window.event.srcElement.parentElement.parentElement
                else
                    SelectedRow = window.event.srcElement.parentElement

                var obj;
                obj = XTabTable

                if (LastSelectedRow != "") 
                    if (parseInt(LastSelectedRow) < obj.rows.length) {
                        if (parseInt(LastSelectedRow) % 2 == 0)
                            obj.rows(parseInt(LastSelectedRow)).className = "CssItemStyle"
                        else
                            obj.rows(parseInt(LastSelectedRow)).className = "CssAlternatingItemStyle";
                        //obj.rows(parseInt(LastSelectedRow)).style.backgroundColor = '';
                    }

                    if (LastSelectedRow == "0")
                        if (obj.rows.length > 0)
                        obj.rows(parseInt(LastSelectedRow)).className = "CssItemStyle";
                
                LastSelectedRow = SelectedRow.rowIndex;
                SelectedRow.className = "CssSelectedItemStyle";
                //SelectedRow.style.backgroundColor = '#FFD599'

                LoadData(SelectedRow)
            }
        }
        //*******************************************************************************
        function LoadData(SelectedRow) {

            if (window.event.srcElement.tagName != "TBODY") {
                $get(MasterObj + 'txtCreditID').value = SelectedRow.CreditId;
                $get(MasterObj + 'txtPersonCode').value = SelectedRow.cells(0).innerText;
                
                $get(MasterObj + 'txtPersonName').value = SelectedRow.cells(1).title;
                //OnBlurtxtPersonCode($get(MasterObj + 'txtPersonCode'))
                
                var Sd = SelectedRow.cells(2).innerText;

                $get(MasterObj + 'SDateDay').value = Sd.substr(0, 2)
                $get(MasterObj + 'SDateMonth').value = Sd.substr(3, 2)
                $get(MasterObj + 'SDateYear').value = Sd.substr(6, 4)

                var Ed = SelectedRow.cells(3).innerText

                $get(MasterObj + 'EDateDay').value = Ed.substr(0, 2)
                $get(MasterObj + 'EDateMonth').value = Ed.substr(3, 2)
                $get(MasterObj + 'EDateYear').value = Ed.substr(6, 4)

                $get(MasterObj + 'CmbGroupCode').value = SelectedRow.FirstCode;
                OnChangeCmbGroupCode()
                $get(MasterObj + 'CmbSecondCode').value = ((SelectedRow.SecondCode.substr(0,1)=='9')? "0"+SelectedRow.SecondCode.substr(1,2) : SelectedRow.SecondCode);
                
                $get(MasterObj + 'txtStartTime').value = SelectedRow.cells(4).innerText;
                $get(MasterObj + 'txtEndTime').value = SelectedRow.cells(5).innerText;
                $get(MasterObj + 'txtDescr').value = SelectedRow.cells(8).title;
                if (SelectedRow.Daily && !SelectedRow.Timely) {//روزانه

                    document.getElementById(MasterObj + "EDateDay").disabled = false
                    document.getElementById(MasterObj + "EDateMonth").disabled = false
                    document.getElementById(MasterObj + "EDateYear").disabled = false

                    $get(MasterObj + 'txtStartTime').disabled = true;
                    $get(MasterObj + 'txtEndTime').disabled = true;
                    $get(MasterObj + 'OpDaily').checked = true;
                }
                else if (!SelectedRow.Daily && SelectedRow.Timely) {//ساعتي


                    document.getElementById(MasterObj + "EDateDay").disabled = true
                    document.getElementById(MasterObj + "EDateMonth").disabled = true
                    document.getElementById(MasterObj + "EDateYear").disabled = true

                    $get(MasterObj + 'txtStartTime').disabled = false;
                    $get(MasterObj + 'txtEndTime').disabled = false;
                    $get(MasterObj + 'OpHourly').checked = true;
                }
                else if (SelectedRow.Daily && SelectedRow.Timely) {
                    if ($get(MasterObj + 'txtStartTime').value == '00:00' && $get(MasterObj + 'txtEndTime').value == '00:00') {//روزانه

                        document.getElementById(MasterObj + "EDateDay").disabled = false
                        document.getElementById(MasterObj + "EDateMonth").disabled = false
                        document.getElementById(MasterObj + "EDateYear").disabled = false

                        $get(MasterObj + 'txtStartTime').disabled = true;
                        $get(MasterObj + 'txtEndTime').disabled = true;
                        $get(MasterObj + 'OpDaily').checked = true;
                    }
                    else if ($get(MasterObj + 'txtStartTime').value != '00:00' || $get(MasterObj + 'txtEndTime').value != '00:00') {//ساعتي

                        document.getElementById(MasterObj + "EDateDay").disabled = true
                        document.getElementById(MasterObj + "EDateMonth").disabled = true
                        document.getElementById(MasterObj + "EDateYear").disabled = true

                        $get(MasterObj + 'txtStartTime').disabled = false;
                        $get(MasterObj + 'txtEndTime').disabled = false;
                        $get(MasterObj + 'OpHourly').checked = true;
                    }
                }
            }
        }
        //*******************************************************************************
        function ModifyXML() {
            
            $get(MasterObj + 'txtXMLCredit').value = (($get(MasterObj + 'txtXMLCredit').value == "<DataEntryEntity />") ? "" : $get(MasterObj + 'txtXMLCredit').value);
           
            if ($get(MasterObj + 'txtXMLCredit').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLCredit').value)
                
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/DataEntryEntity/CreditBeforeOccure [CreditId=' + $get(MasterObj + 'txtCreditID').value + ']')
                
                if ($get(MasterObj + 'txtSubmit').value == "Delete") {
                    var index = $get(MasterObj + 'txtXMLCredit').value.indexOf('<CreditId>' + $get(MasterObj + 'txtCreditID').value + '</CreditId>')
                    var StrTemp = $get(MasterObj + 'txtXMLCredit').value.substring(0, index)
                    StrTemp = StrTemp.substring(0, StrTemp.lastIndexOf("<CreditBeforeOccure>"));
                    var StrTemp2 = $get(MasterObj + 'txtXMLCredit').value.substring(index++, $get(MasterObj + 'txtXMLCredit').value.length)
                    StrTemp2 = StrTemp2.substring(StrTemp2.indexOf('</CreditBeforeOccure>'), StrTemp2.length)
                    StrTemp2 = StrTemp2.replace('</CreditBeforeOccure>', '')
                    $get(MasterObj + 'txtXMLCredit').value = StrTemp + StrTemp2;
                    if ($get(MasterObj + 'txtXMLCredit').value.search("<DataEntryEntity>") == -1)
                        $get(MasterObj + 'txtXMLCredit').value = "<DataEntryEntity>"+$get(MasterObj + 'txtXMLCredit').value
                }
                else
                    if (xmlNodes.length != 0) {//Modify
                    xmlNodes.item(0).selectSingleNode('PersonCode').text = $get(MasterObj + 'txtPersonCode').value;
                    if ($get(MasterObj + 'CmbPerson').selectedIndex!=-1)
                        xmlNodes.item(0).selectSingleNode('PersonName').text = $get(MasterObj + 'CmbPerson')($get(MasterObj + 'CmbPerson').selectedIndex).text
                    
//                    var SD = document.getElementById(MasterObj + "KCalSDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtYear").value;
//                    var ED = document.getElementById(MasterObj + "KCalEDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtYear").value;

                    var SD = document.getElementById(MasterObj + "SDateDay").value + '/' + document.getElementById(MasterObj + "SDateMonth").value + '/' + document.getElementById(MasterObj + "SDateYear").value;
                    var ED = document.getElementById(MasterObj + "EDateDay").value + '/' + document.getElementById(MasterObj + "EDateMonth").value + '/' + document.getElementById(MasterObj + "EDateYear").value;
                    
                    xmlNodes.item(0).selectSingleNode('StartDate').text = SD;
                    xmlNodes.item(0).selectSingleNode('EndDate').text = ED;
                    xmlNodes.item(0).selectSingleNode('StartTime').text = $get(MasterObj + 'txtStartTime').value;
                    xmlNodes.item(0).selectSingleNode('EndTime').text = $get(MasterObj + 'txtEndTime').value;
                    xmlNodes.item(0).selectSingleNode('FirstCode').text = $get(MasterObj + 'CmbCategoryNew').value;
                    xmlNodes.item(0).selectSingleNode('FirstCodeName').text = $get(MasterObj + 'CmbCategoryNew')($get(MasterObj + 'CmbCategoryNew').selectedIndex).text;
                    xmlNodes.item(0).selectSingleNode('SecondCode').text = (($get(MasterObj + 'OpDaily').checked) ? '9' + $get(MasterObj + 'CmbSecondCode').value.substr(1, 2) : $get(MasterObj + 'CmbSecondCode').value);
                    xmlNodes.item(0).selectSingleNode('SecondCodeName').text = $get(MasterObj + 'CmbSecondCode')($get(MasterObj + 'CmbSecondCode').selectedIndex).text;
                    xmlNodes.item(0).selectSingleNode('Descr').text = $get(MasterObj + 'txtDescr').value;

                    $get(MasterObj + 'txtXMLCredit').value = oXmlDoc.xml;
                }
                else //New
                    $get(MasterObj + 'txtXMLCredit').value = $get(MasterObj + 'txtXMLCredit').value.replace('</DataEntryEntity>', MakeXml() + '</DataEntryEntity>')
            }
            else if ($get(MasterObj + 'txtSubmit').value != "Delete")
               $get(MasterObj + 'txtXMLCredit').value = '<DataEntryEntity>' + MakeXml() + '</DataEntryEntity>'
            //alert($get(MasterObj + 'txtXMLCredit').value)    
              
        }
        /*******************************************************************/
        function MakeXml() {
            var StrXml = "<CreditBeforeOccure>"
            StrXml += "<CreditId>" + $get(MasterObj + 'txtCreditID').value + "</CreditId>"
            StrXml += "<PersonCode>" + $get(MasterObj + 'txtPersonCode').value + "</PersonCode>"
            StrXml += "<PersonName>" + $get(MasterObj + 'CmbPerson')($get(MasterObj + 'CmbPerson').selectedIndex).text + "</PersonName>"

//            var SD = document.getElementById(MasterObj + "KCalSDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtYear").value;
//            var ED = document.getElementById(MasterObj + "KCalEDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtYear").value;

            var SD = document.getElementById(MasterObj + "SDateDay").value + '/' + document.getElementById(MasterObj + "SDateMonth").value + '/' + document.getElementById(MasterObj + "SDateYear").value;
            var ED = document.getElementById(MasterObj + "EDateDay").value + '/' + document.getElementById(MasterObj + "EDateMonth").value + '/' + document.getElementById(MasterObj + "EDateYear").value;
            
            StrXml += "<StartDate>" + SD + "</StartDate>"
            StrXml += "<EndDate>" + ED + "</EndDate>"
            
            StrXml += "<StartTime>" + $get(MasterObj + 'txtStartTime').value + "</StartTime>"
            StrXml += "<EndTime>" + $get(MasterObj + 'txtEndTime').value + "</EndTime>"
            StrXml += "<FirstCode>" + $get(MasterObj + 'CmbCategoryNew').value + "</FirstCode>"
            StrXml += "<FirstCodeName>" + $get(MasterObj + 'CmbCategoryNew')($get(MasterObj + 'CmbCategoryNew').selectedIndex).text + "</FirstCodeName>"
            StrXml += "<SecondCode>" + (($get(MasterObj + 'OpDaily').checked) ? '9' + $get(MasterObj + 'CmbSecondCode').value.substr(1, 2) : $get(MasterObj + 'CmbSecondCode').value) + "</SecondCode>"
            StrXml += "<SecondCodeName>" + $get(MasterObj + 'CmbSecondCode')($get(MasterObj + 'CmbSecondCode').selectedIndex).text + "</SecondCodeName>"
            StrXml += "<Descr>" + $get(MasterObj + 'txtDescr').value + "</Descr>"
            StrXml += "</CreditBeforeOccure>"
            return StrXml
        }
        //*******************************************************************************
        function CheckNotEmpty() {

            if ($get(MasterObj + 'txtPersonCode').value == "" || $get(MasterObj + 'txtPersonCode').value == "0") {
                alert("لطفا شماره پرسنلي را وارد نماييد")
                $get(MasterObj + 'txtPersonCode').focus()
                $get(MasterObj + 'txtPersonCode').select()
                return false
            }
            else if ($get(MasterObj + 'CmbGroupCode').value == "0") {
                 alert("لطفا مجوز را انتخاب نماييد")
                $get(MasterObj + 'CmbGroupCode').focus()
                return false
            }
            else if ($get(MasterObj + 'CmbSecondCode').value == "0") {
            alert("لطفا نوع مجوز را انتخاب نماييد")
                $get(MasterObj + 'CmbSecondCode').focus()
                return false
            }
            else if ($get(MasterObj + 'SDateDay').value == "") {
            alert("لطفا تاريخ شروع را تكميل نماييد")
                $get(MasterObj + 'SDateDay').focus()
                $get(MasterObj + 'SDateDay').select()
                return false
            }
            else if ($get(MasterObj + 'SDateMonth').value == "") {
            alert("لطفا تاريخ شروع را تكميل نماييد")
                $get(MasterObj + 'SDateMonth').focus()
                $get(MasterObj + 'SDateMonth').select()
                return false
            }
            else if ($get(MasterObj + 'SDateYear').value == "") {
            alert("لطفا تاريخ شروع را تكميل نماييد")
                document.all.item('SDateYear').focus()
                document.all.item('SDateYear').select()
                return false
            }
            else if ($get(MasterObj + 'EDateDay').value == "") {
            alert("لطفا تاريخ پايان را تكميل نماييد")
                $get(MasterObj + 'EDateDay').focus()
                $get(MasterObj + 'EDateDay').select()
                return false
            }
            else if ($get(MasterObj + 'EDateMonth').value == "") {
            alert("لطفا تاريخ پايان را تكميل نماييد")
                $get(MasterObj + 'EDateMonth').focus()
                $get(MasterObj + 'EDateMonth').select()
                return false
            }
            else if ($get(MasterObj + 'EDateYear').value == "") {
            alert("لطفا تاريخ پايان را تكميل نماييد")
                $get(MasterObj + 'EDateYear').focus()
                $get(MasterObj + 'EDateYear').select()
                return false
            }
            else if ($get(MasterObj + 'OpHourly').checked) {

                if ($get(MasterObj + 'txtStartTime').value == "00:00" && $get(MasterObj + 'txtEndTime').value == "00:00") {
                    alert("لطفا اطلاعات ساعت مجوز را تكميل نماييد")
                    $get(MasterObj + 'txtStartTime').focus()
                    $get(MasterObj + 'txtStartTime').select()
                    //alert(1)
                    return false
                }
                else {
                    if ($get(MasterObj + 'txtStartTime').value > $get(MasterObj + 'txtEndTime').value) {
                        alert("لطفا اطلاعات ساعت مجوز را تكميل نماييد")
                        $get(MasterObj + 'txtStartTime').focus()
                        $get(MasterObj + 'txtStartTime').select()
                        //alert(2)
                        return false
                    }
                    else
                        return true
                }
            }
            else
                return true
        }
        //*******************************************************************************
        function Save(Type) {

            var SD = document.getElementById(MasterObj + "SDateDay").value + '/' + document.getElementById(MasterObj + "SDateMonth").value + '/' + document.getElementById(MasterObj + "SDateYear").value;

            if ($get(MasterObj + 'OpHourly').checked) //مجوز ساعتي
                var ED = SD
            else
                var ED = document.getElementById(MasterObj + "EDateDay").value + '/' + document.getElementById(MasterObj + "EDateMonth").value + '/' + document.getElementById(MasterObj + "EDateYear").value;
            

 
            //====================================================
            var Str = "<Root><Tb>";
            Str += "<Selected>1</Selected>"
            //Str += "<CreditID>" + $get(MasterObj + 'txtCreditID').value + "</CreditID>";
            Str += "<PersonID>" + $get(MasterObj + 'txtPersonCode').value + "</PersonID>"
            Str += "<StartDate>" + SD + "</StartDate>"
            Str += "<EndDate>" + ED + "</EndDate>"
            Str += "<Type>" + $get(MasterObj + 'CmbGroupCode').value + "</Type>"
            Str += "<CreditType>" + $get(MasterObj + 'CmbSecondCode').value + "</CreditType>"
                      
            Str += "<StartTime>" + (($get(MasterObj + 'OpHourly').checked)? $get(MasterObj + 'txtStartTime').value:'00:00') + "</StartTime>"
            Str += "<EndTime>" + (($get(MasterObj + 'OpHourly').checked) ? $get(MasterObj + 'txtEndTime').value : '00:00') + "</EndTime>"
            Str += "<Des>" + $get(MasterObj + 'txtDescr').value + "</Des>"
            Str += "<StatusType>Admin</StatusType>"
            Str += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
            Str += "<UserPersonelID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
            Str += "<CreditID>" + $get(MasterObj + 'txtCreditID').value + "</CreditID>"
            Str += "</Tb></Root>"

            //Str = Str.replace("</Root>", "<Setting><Flag>0</Flag><CalcParam>3</CalcParam><OnlineUserID>" + $get(MasterObj + "txtOnLineUser").value + "</OnlineUserID><SubSysID>13</SubSysID><PageID>1322</PageID></Setting>" + "</Root>")

            $get(MasterObj + 'txtSaveXML').value = Str;
            //alert(Str)
//            //====================================================
//            $get(MasterObj + "txtSubmit").value = Type;
//            $get(MasterObj + "BtnSubmit").click();
            //alert(Str)
//        //}
        }
        //*******************************************************************************
        function CheckCorrectDateRange() {
//            var SD = document.getElementById(MasterObj + "KCalSDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalSDate_txtYear").value;
//            var ED = document.getElementById(MasterObj + "KCalEDate_txtDay").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + '/' + document.getElementById(MasterObj + "KCalEDate_txtYear").value;
            if ($get(MasterObj + 'OpHourly').checked) {
                return true
            }
            else {
                var SD = document.getElementById(MasterObj + "SDateYear").value + '/' + document.getElementById(MasterObj + "SDateMonth").value + '/' + document.getElementById(MasterObj + "SDateDay").value
                var ED = document.getElementById(MasterObj + "EDateYear").value + '/' + document.getElementById(MasterObj + "EDateMonth").value + '/' + document.getElementById(MasterObj + "EDateDay").value

                if (SD > ED)
                    return false
                else
                    return true
            }
        }
        //*******************************************************************************
        function onBlurDate(obj) {
            //alert(obj.id)
            switch (obj.id) {
                case MasterObj + "txtPersonCode":

                    if (obj.value == "")
                        $get(MasterObj + 'txtPersonCode').focus()
                    else {

                        OnBlurtxtPersonCode(obj)

                        if ($get(MasterObj + 'txtPersonName').value == 0)
                            $get(MasterObj + 'txtPersonCode').focus()
                        else {
                            document.getElementById(MasterObj + "SDateDay").focus()
                            document.getElementById(MasterObj + "SDateDay").select()
                        }
                    }

                    break

                case MasterObj + "txtPersonName":

                    document.getElementById(MasterObj + "SDateDay").focus()
                    document.getElementById(MasterObj + "SDateDay").select()
                    break

                case MasterObj + "SDateDay":
                    if (obj.value == "") {
                        $get(MasterObj + 'SDateDay').focus()
                    }
                    else {
                        FixDate('Day', obj)
                    }

                    break

                case MasterObj + "SDateMonth":
                    if (obj.value == "") {
                        $get(MasterObj + 'SDateMonth').focus()
                    }
                    else {
                        FixDate('Month', obj)
                    }
                    break

                case MasterObj + "SDateYear":
                    if (obj.value == "") {
                        $get(MasterObj + 'SDateYear').focus()
                    }
                    else {

                        if (FixDate('Year', obj)) {

                            if ($get(MasterObj + 'ChkEDate').checked) {
                                onKeyDownEnter(document.getElementById(MasterObj + "EDateYear"))
                            }
                            else {
                                if ($get(MasterObj + 'OpDaily').checked) {
                                    $get(MasterObj + "EDateDay").value = $get(MasterObj + "SDateDay").value
                                    $get(MasterObj + "EDateMonth").value = $get(MasterObj + "SDateMonth").value
                                    $get(MasterObj + "EDateYear").value = $get(MasterObj + "SDateYear").value

                                    document.getElementById(MasterObj + "EDateDay").focus()
                                    document.getElementById(MasterObj + "EDateDay").select()

                                }
                                else

                                    $get(MasterObj + 'CmbGroupCode').focus()
                            }
                        }
                    }
                    break

                case MasterObj + "EDateDay":
                    if (obj.value == "") {
                        $get(MasterObj + 'EDateDay').focus()
                    }
                    else {
                        FixDate('Day', obj)
                    }
                    break

                case MasterObj + "EDateMonth":
                    if (obj.value == "") {
                        $get(MasterObj + 'EDateMonth').focus()
                    }
                    else {
                        FixDate('Month', obj)
                    }
                    break

                case MasterObj + "EDateYear":
                    if (obj.value == "") {
                        $get(MasterObj + 'EDateYear').focus()
                    }
                    else {
                        FixDate('Year', obj)
                    }
                    break

                case MasterObj + "CmbGroupCode":

                    if ($get(MasterObj + 'CmbSecondCode').disabled) {

                        $get(MasterObj + 'CmbGroupCode').focus()
                    }
                    else {

                        $get(MasterObj + 'CmbSecondCode').focus();
                    }
                    break

                case MasterObj + "CmbSecondCode":
                    if ($get(MasterObj + 'OpHourly').checked) {
                        $get(MasterObj + 'txtStartTime').disabled = false;
                        $get(MasterObj + 'txtStartTime').focus()
                        $get(MasterObj + 'txtStartTime').select()
                    }
                    else
                        $get(MasterObj + 'txtDescr').focus()
                    break

                case MasterObj + "txtStartTime":
                    $get(MasterObj + 'txtEndTime').disabled = false;
                    $get(MasterObj + 'txtEndTime').focus()
                    $get(MasterObj + 'txtEndTime').select()
                    break

                case MasterObj + "txtEndTime":
                    $get(MasterObj + 'txtDescr').focus()
                    break

                case MasterObj + "txtDescr":
                    document.getElementById('OToolBar_BtnSave').focus()
                    break
            }
        }
        //----------------------------------------------
        function onKeyDownEnter(obj) {

            //alert(obj.id)
            if (event.keyCode == 13)
                switch (obj.id) {
                    case MasterObj + "txtCardCode":
                        if (obj.value != "") {
                            OnBlurtxtCardCode(obj)
                            if ($get(MasterObj + 'txtPersonCode').value != "") {
                                onKeyDownEnter($get(MasterObj + 'txtPersonCode'));
                            }
                        }
                        else $get(MasterObj + 'txtPersonCode').focus()

                        break;
                    case MasterObj + "txtPersonCode":

                        
                        if (obj.value == "") {
                            $get(MasterObj + 'txtPersonCode').focus()
                            
                        }
                        else {

                            OnBlurtxtPersonCode(obj)

                            if ($get(MasterObj + 'txtPersonName').value == 0) {
                                $get(MasterObj + 'txtPersonCode').focus()
                                
                            }
                            else {
                                if ($get(MasterObj + 'ChkSDate').checked) {
                                    onKeyDownEnter(document.getElementById(MasterObj + "SDateYear"))
                                    
                                }
                                else {
                                    document.getElementById(MasterObj + "SDateDay").focus()
                                    document.getElementById(MasterObj + "SDateDay").select()
                                    
                                }
                                $get(MasterObj + 'txtObjectID').value = "txtPersonCode"
                            }
                        }



                        break

                    case MasterObj + "txtPersonName":
                        if ($get(MasterObj + 'ChkSDate').checked) {
                            onKeyDownEnter(document.getElementById(MasterObj + "SDateYear"))
                            
                        }
                        else {
                            document.getElementById(MasterObj + "SDateDay").focus()
                            document.getElementById(MasterObj + "SDateDay").select()

                        }
                        $get(MasterObj + 'txtObjectID').value = "txtPersonName"
                        break
                
                case MasterObj + "SDateDay":
                    if (obj.value == "") {
                        $get(MasterObj + 'SDateDay').focus()
                    }
                    else {
                        if (FixDate('Day', obj)) {

                            document.getElementById(MasterObj + "SDateMonth").focus()
                            document.getElementById(MasterObj + "SDateMonth").select()
                            $get(MasterObj + 'txtObjectID').value = "SDateDay"
                        }
                    }

                     break

                 case MasterObj + "SDateMonth":
                     if (obj.value == "") {
                         $get(MasterObj + 'SDateMonth').focus()
                     }
                     else {
                         if (FixDate('Month', obj)) {
                             document.getElementById(MasterObj + "SDateYear").focus()
                             document.getElementById(MasterObj + "SDateYear").select()
                             $get(MasterObj + 'txtObjectID').value = "SDateMonth"
                         }
                     }
                     break

                case MasterObj + "SDateYear":
                        if (obj.value == "") {
                            $get(MasterObj + 'SDateYear').focus()
                        }
                        else {

                            if (FixDate('Year', obj)) {
                                if ($get(MasterObj + 'ChkEDate').checked) {
                                    onKeyDownEnter(document.getElementById(MasterObj + "EDateYear"))
                                }
                                else {
                                    if ($get(MasterObj + 'OpDaily').checked) {
                                        //                                $get(MasterObj + "EDateDay").value = $get(MasterObj + "SDateDay").value
                                        //                                $get(MasterObj + "EDateMonth").value = $get(MasterObj + "SDateMonth").value
                                        //                                $get(MasterObj + "EDateYear").value = $get(MasterObj + "SDateYear").value

                                        document.getElementById(MasterObj + "EDateDay").focus()
                                        document.getElementById(MasterObj + "EDateDay").select()

                                    }
                                    else

                                        $get(MasterObj + 'CmbGroupCode').focus()
                                }
                                $get(MasterObj + 'txtObjectID').value = "SDateYear"

                            }
                        }
                        break

                    case MasterObj + "EDateDay":
                        if (obj.value == "") {
                            $get(MasterObj + 'EDateDay').focus()
                        }
                        else {
                            if (FixDate('Day', obj)) {
                                document.getElementById(MasterObj + "EDateMonth").focus()
                                document.getElementById(MasterObj + "EDateMonth").select()
                                $get(MasterObj + 'txtObjectID').value = "EDateDay"
                            }
                        }
                        break

                    case MasterObj + "EDateMonth":
                        if (obj.value == "") {
                            $get(MasterObj + 'EDateMonth').focus()
                        }
                        else {
                            if (FixDate('Month', obj)) {
                                document.getElementById(MasterObj + "EDateYear").focus()
                                document.getElementById(MasterObj + "EDateYear").select()
                                $get(MasterObj + 'txtObjectID').value = "EDateMonth"
                            }
                        }
                        break

                    case MasterObj + "EDateYear":
                        if (obj.value == "") {
                            $get(MasterObj + 'EDateYear').focus()
                        }
                        else {
                            if (FixDate('Year', obj)) {
                                if ($get(MasterObj + 'ChkFirstCode').checked) {
                                    onKeyDownEnter(document.getElementById(MasterObj + "CmbGroupCode"))

                                }
                                else {
                                    $get(MasterObj + 'CmbGroupCode').focus()
                                }
                            }

                            $get(MasterObj + 'txtObjectID').value = "EDateYear"
                        }
                        break

                    case MasterObj + "CmbGroupCode":
                        
                        if ($get(MasterObj + 'CmbSecondCode').disabled) {

                            $get(MasterObj + 'CmbGroupCode').focus()
                        }
                        else {
                            //alert()
                            if ($get(MasterObj + 'ChkSecondCode').checked) {
                                onKeyDownEnter(document.getElementById(MasterObj + "CmbSecondCode"))

                            }
                            else {
                                $get(MasterObj + 'CmbSecondCode').focus();
                            }
                            $get(MasterObj + 'txtObjectID').value = "CmbGroupCode"
                        }

                        break

                    case MasterObj + "CmbSecondCode":

                        if ($get(MasterObj + 'OpHourly').checked) {
                            if ($get(MasterObj + 'ChkSTime').checked) {
                                onKeyDownEnter(document.getElementById(MasterObj + "txtStartTime"))

                            }
                            else {
                                $get(MasterObj + 'txtStartTime').disabled = false;
                                $get(MasterObj + 'txtStartTime').focus()
                                $get(MasterObj + 'txtStartTime').select()
                            }

                        }
                        else {
                            if ($get(MasterObj + 'ChkDescr').checked) {
                                onKeyDownEnter(document.getElementById(MasterObj + "txtDescr"))

                            }
                            else
                                $get(MasterObj + 'txtDescr').focus()

                        }
                        $get(MasterObj + 'txtObjectID').value = "CmbSecondCode"
                        break

                    case MasterObj + "txtStartTime":
                        if ($get(MasterObj + 'ChkSTime').checked) {
                            onKeyDownEnter(document.getElementById(MasterObj + "txtEndTime"))

                        }
                        else {
                            $get(MasterObj + 'txtEndTime').disabled = false;
                            $get(MasterObj + 'txtEndTime').focus()
                            $get(MasterObj + 'txtEndTime').select()
                        }
                        $get(MasterObj + 'txtObjectID').value = "txtStartTime"
                        break

                    case MasterObj + "txtEndTime":
                        if ($get(MasterObj + 'ChkDescr').checked) {
                            onKeyDownEnter(document.getElementById(MasterObj + "txtDescr"))

                        }
                        else {
                            $get(MasterObj + 'txtDescr').focus()
                        }
                        $get(MasterObj + 'txtObjectID').value = "txtEndTime"
                        break

                    case MasterObj + "txtDescr":
                        //OnClickBtnSave()
                        document.getElementById('OToolBar_BtnSave').focus()
                        $get(MasterObj + 'txtObjectID').value = "txtDescr"
                        break
                }
            
        }
        //*******************************************************************************
        function OnChangeCmbGrdGroupCode() {

            //if ($get(MasterObj + "CmbGrdGroupCode").value != lastGrdGroupCodeID) {
                lastGrdGroupCodeID = $get(MasterObj + "CmbGrdGroupCode").value

                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML($get(MasterObj + "txtXMLGrdSC").value);
                var xmlNodes;
                //alert($get(MasterObj + "txtXMLGrdSC").value)
                $get(MasterObj + "CmbGrdSecondCode").innerHTML = ""

                var j = 0
                if ($get(MasterObj + "CmbGrdGroupCode").value != 0 && $get(MasterObj + "CmbGrdGroupCode").value != "") {
                    xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGrdGroupCode").value + "]");
                    
                    
                }
                else {
                    xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
                }


                if (xmlNodes.length != 0) {
                    if ($get(MasterObj + "CmbGrdGroupCode").value != 0) {
                        if (j == 0) {

                            optionEl = document.createElement("OPTION")
                            $get(MasterObj + "CmbGrdSecondCode").options.add(optionEl)
                            $get(MasterObj + "CmbGrdSecondCode").all(j).innerText = 'انتخاب نشده'
                            $get(MasterObj + "CmbGrdSecondCode").all(j).value = '0'
                            j++
                        }
                    }
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        
                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbGrdSecondCode").options.add(optionEl)
                        $get(MasterObj + "CmbGrdSecondCode").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                        $get(MasterObj + "CmbGrdSecondCode").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                        j++
                    }
                }
            //}
            

        }
        //*******************************************************************************
        function OnChangeCmbGroupCode() {

            
            //if ($get(MasterObj + "CmbGroupCode").value != lastGroupCodeID) {
                lastGroupCodeID = $get(MasterObj + "CmbGroupCode").value
                
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML($get(MasterObj + "txtXMLGrdSC").value);
                var xmlNodes;
                //alert($get(MasterObj + "txtXMLGrdSC").value)
                $get(MasterObj + "CmbSecondCode").innerHTML = ""

                var j = 0
                var XmlPath=''
                if ($get(MasterObj + "OpDaily").checked) {
                    XmlPath += "[Daily=1]"
                }
                else if ($get(MasterObj + "OpHourly").checked) {
                    XmlPath += "[Timely=1]"
                }
                
                if ($get(MasterObj + "CmbGroupCode").value != 0 && $get(MasterObj + "CmbGroupCode").value != "") {
                    
                    XmlPath += "[CodeGroupID=" + $get(MasterObj + "CmbGroupCode").value + "]"

                }
                
               

                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo"+XmlPath);
                

                if (xmlNodes.length != 0) {
                    
                    if (j == 0) {
                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbSecondCode").options.add(optionEl)
                        $get(MasterObj + "CmbSecondCode").all(j).innerText = 'انتخاب نشده'
                        $get(MasterObj + "CmbSecondCode").all(j).value = '0'
                        j++
                    }
                
                    
                    for (var i = 0; i < xmlNodes.length; ++i) {

                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbSecondCode").options.add(optionEl)
                        $get(MasterObj + "CmbSecondCode").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                        $get(MasterObj + "CmbSecondCode").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                        j++
                    }
                }
            
            //}
        }
        //*******************************************************************************
        /*function OnChangeCmbFirstCode() {
            if ($get(MasterObj + 'txtXMLSC').value != "" &
                ($get(MasterObj + 'txtPersonCode').value != "" | $get(MasterObj + 'txtPersonCode').value != "0")) {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLSC').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [BaseCodeID=' + $get(MasterObj + 'CmbFirstCode').value + ']')
                LoadSecondCodeData($get(MasterObj + 'CmbSecondCode'), xmlNodes);
            }
        }*/
        //*******************************************************************************
        function OnChangeCmbFirstCode() {

            //alert($get(MasterObj + 'txtXMLSC').value)
            var xmlNodes;

            if ($get(MasterObj + 'txtXMLSC').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                //alert($get(MasterObj + 'txtXMLSC').value)
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLSC').value)
                //alert("ddd")
                //alert($get('OptKasreKar').checked)
//                if ($get('OptKasreKar').checked == true && $get('OptMazadeKar').checked == true)
//                    xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [MainCategoryID=' + $get(MasterObj + 'CmbCategoryNew').value + '][BaseCodeID=1 or BaseCodeID=2]')
                if ($get('OptKasreKar').checked == true)
                    xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [MainCategoryID=' + $get(MasterObj + 'CmbCategoryNew').value + '][BaseCodeID=1]')
                else if ($get('OptMazadeKar').checked == true)
                    xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [MainCategoryID=' + $get(MasterObj + 'CmbCategoryNew').value + '][BaseCodeID=2]')
                //alert(xmlNodes.length)
                LoadSecondCodeData($get(MasterObj + 'CmbSecondCode'), xmlNodes);
            }
        }
        //*******************************************************************************
        function OnChangeCmbSecondCode() {
            if ($get(MasterObj + 'CmbSecondCode').value != '0')
                $get(MasterObj + 'txtSecondCode').value = $get(MasterObj + 'CmbSecondCode').value;
        }
        //*******************************************************************************
        function LoadSecondCodeData(CmbObj, oXmlNodes) {
            CmbObj.innerHTML = "";
            var optionEl = document.createElement("OPTION");
            CmbObj.options.add(optionEl);
            CmbObj.all(0).value = "0";
            CmbObj.all(0).innerText = 'انتخاب نشده';

            if (oXmlNodes.length != 0)
                for (var i = 0; i < oXmlNodes.length; i++) {
                var optionEl = document.createElement("OPTION");
                CmbObj.options.add(optionEl);
                CmbObj.all(i + 1).value = oXmlNodes.item(i).selectSingleNode("Val").text;
                CmbObj.all(i + 1).innerText = oXmlNodes.item(i).selectSingleNode("Title").text;
            }
        }
        //*******************************************************************************
        function OnClickCreditPersonShow(obj) {
            var SelectedRow = obj.parentElement.parentElement;

            var SD = SelectedRow.cells(2).innerText;
            var ED = SelectedRow.cells(3).innerText;
            SD = SD.substr(6, 4) + '/' + SD.substr(3, 2) + '/' + SD.substr(0, 2);
            ED = ED.substr(6, 4) + '/' + ED.substr(3, 2) + '/' + ED.substr(0, 2);

            var url = "../ModalReport/CreditPersonShow.aspx?PersonCode=" + SelectedRow.cells(0).innerText +
            " &PersonName=" + ((SelectedRow.cells(1).title!="")? SelectedRow.cells(1).title : SelectedRow.cells(1).innerText) + 
            " &SDate=" + SD + " &EDate=" + ED;
            var strFeature = "dialogHeight: 570px;dialogWidth: 690px;center: Yes;help: no;status: no;minimize: yes"
            window.showModelessDialog(encodeURI(url), "", strFeature)
        }
        //*******************************************************************************
        function onClickImgGrdRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgGrdRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //*******************************************************************************
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //*******************************************************************************
        function onClickBtnRefreshGrdPerson(obj) {
            
            //alert($get(MasterObj + "txtSessionID").value)
            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + "1" + " &MenuItemID=" + "1322" + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
            var Result = "";
            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

            if (Result != "") {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    var PCode;
                    PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
                    $get(MasterObj + "txtGrdPersonCode").value = PCode;
                    $get(MasterObj + "txtGrdPersonName").value = xmlNodes.item(0).selectSingleNode('Family').text
                }
            }
        }
        //*******************************************************************************
        function onClickBtnRefreshPerson(obj) {

            //alert($get(MasterObj + "txtSessionID").value)
            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + "1" + " &MenuItemID=" + "1322" + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
            var Result = "";
            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

            if (Result != "") {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    var PCode;
                    PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
                    $get(MasterObj + "txtPersonCode").value = PCode;
                    $get(MasterObj + "txtPersonName").value = xmlNodes.item(0).selectSingleNode('Family').text
                    RefreshWorkTimes();
                }
            }
        }
        //**************************************EndThisPage*****************************
        
        /****************************************************************/
        function RefreshWorkTimes() {
            
            if ($get(MasterObj + "SDateMonth").value > 6 && $get(MasterObj + "SDateMonth").value < 12) {
                if ($get(MasterObj + "SDateDay").value > 30) {
                    //alert("تاريخ شروع صحيح نمي باشد")
                    $get(MasterObj + "SDateDay").focus()
                    $get(MasterObj + "SDateDay").select()
                    return false
                }
            }
            else if ($get(MasterObj + "SDateMonth").value == 12) {

            if ((parseInt($get(MasterObj + "SDateYear").value) + 1) % 4 == 0) {

                    if ($get(MasterObj + "SDateDay").value > 30) {
                        //alert("تاريخ شروع صحيح نمي باشد")
                        $get(MasterObj + "SDateDay").focus()
                        $get(MasterObj + "SDateDay").select()
                        return false
                    }
                }
                else {
                    if ($get(MasterObj + "SDateDay").value > 29) {
                        //alert("تاريخ شروع صحيح نمي باشد")
                        $get(MasterObj + "SDateDay").focus()
                        $get(MasterObj + "SDateDay").select()
                        return false
                    }
                }
            }

            if ($get(MasterObj + "EDateMonth").value > 6 && $get(MasterObj + "EDateMonth").value < 12) {
                if ($get(MasterObj + "EDateDay").value > 30) {
                    //alert("تاريخ شروع صحيح نمي باشد")
                    $get(MasterObj + "EDateDay").focus()
                    $get(MasterObj + "EDateDay").select()
                    return false
                }
            }
            else if ($get(MasterObj + "EDateMonth").value == 12) {

            if ((parseInt($get(MasterObj + "EDateYear").value) + 1) % 4 == 0) {

                    if ($get(MasterObj + "EDateDay").value > 30) {
                        //alert("تاريخ شروع صحيح نمي باشد")
                        $get(MasterObj + "EDateDay").focus()
                        $get(MasterObj + "EDateDay").select()
                        return false
                    }
                }
                else {
                    if ($get(MasterObj + "EDateDay").value > 29) {
                        //alert("تاريخ شروع صحيح نمي باشد")
                        $get(MasterObj + "EDateDay").focus()
                        $get(MasterObj + "EDateDay").select()
                        return false
                    }
                }
            }
            
            if (FixDate($get(MasterObj + "SDateYear"), 'Year')) {

                if ($get(MasterObj + "txtPersonCode").value != "" && $get(MasterObj + "txtPersonCode").value != "0") {
                    
                    document.getElementById(MasterObj + "txtSubmit").value = "RefreshWorkTimes";
                    document.getElementById(MasterObj + "btnSubmit").click();
                }
                else {
                    document.all.item(MasterObj + "NobatKariTD").innerText = ""
                    document.all.item(MasterObj + "ShiftTD").innerText = ""
                    document.all.item(MasterObj + "TaradodTD").innerText=""
                }
            }         
            
        }
        
    </script>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 120px;
        }
        .style2
        {
            width: 160px;
        }
        .style3
        {
            width: 109px;
        }
        .style4
        {
            width: 83px;
        }
        .style5
        {
            width: 62px;
        }
        .style12
        {
        }
        .style17
        {
            width: 121px;
            height: 22px;
        }
        .style18
        {
            height: 22px;
        }
        .style19
        {
            width: 140px;
            height: 22px;
        }
        .style20
        {
            width: 188px;
            height: 22px;
        }
        .style21
        {
            width: 74px;
            height: 22px;
        }
        .style22
        {
            width: 129px;
            height: 22px;
        }
        .style23
        {
            width: 65px;
            height: 22px;
        }
        .style24
        {
            font-size: large;
        }
        .style27
        {
            width: 100%;
        }
        .style31
        {
        }
        .style32
        {
        }
        .style33
        {
            width: 67px;
            height: 18px;
        }
        .style37
        {
            height: 18px;
        }
        .style38
        {
             width: 187px;
            height: 18px;
        }
        .style40
        {
            width: 118px;
            height: 18px;
        }
         .style45
        {
            height: 10px;
            width: 200px;
        }
        .style50
        {
            height: 21px;
            width: 53px;
        }
        .style51
        {
            height: 18px;
            width: 75px;
        }
        .style52
        {
            width: 100px;
        }
        .style53
        {
            width: 80px;
        }
        .style58
        {
            width: 86px;
        }
        .style62
        {
            height: 18px;
        }
        .style63
        {
            width: 106px;
        }
        .style65
        {
            width: 76px;
        }
        .style66
        {
            width: 99px;
        }
        .style67
        {
            width: 14px;
        }
        .style68
        {
            width: 187px;
        }
        </style>  

</asp:Content>

