<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="KaraneReportStatic.aspx.cs" Inherits="FrmPresentation.App_Pages.Karane.KaraneReportStatic" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .CssSumItemStyle
        {
            direction: rtl;
            color: #FFFF00;
            background-color: #006699;
            cursor: default;
            text-decoration: none;
        }
        .DivStyle1
        {
            border:  thin groove #000000;
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto;
            scrollbar-arrow-color: black;
            scrollbar-base-color: #B1D3FF;
            height: 455px;
            width: 1180px;
            float: center;
            clear: right;
            clip: rect(auto, auto, auto, auto);
        }
        .GrdTxtControls
        {
            font-weight: bold;
            font-size: 8pt;
            font-family: Tahoma;
            background-color: white;
            border-color: lightsteelblue;
            height: 20px;
            background-color: #FFCCFF;
        }
        .GrdTxtSaveControls
        {
            font-weight: bold;
            font-size: 8pt;
            font-family: Tahoma;
            background-color: white;
            border-color: lightsteelblue;
            height: 20px;
            background-color: #D1FFC1;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" ScriptMode="Release" LoadScriptsBeforeUI="false"
        AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
             <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="right">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                <table align="right">
                    <tr>
                        <td>
                            دوره :
                        </td>
                        <td>
                            <select id="CmbWP" runat="server"  class="TxtControls" style="width: 120px">
                            </select>
                        </td>
                        <td>
                            پرسنلي :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td id="TDNewComboName">
                            واحد سازمانی :
                        </td>
                        <td id="TDNewCombo">
                            <uc3:MultiPerson ID="MultiDep" runat="server" />
                        </td>
                        <td id="TDOldCombo">
                            <select id="CmbDept" runat="server" class="TxtControls" style="width: 150px">
                            </select>
                        </td>
                        <td id="TDGroupName" >
                            گروه :
                        </td>
                        <td id="TDGroup">
                            <select id="CmbGroup" runat="server" class="TxtControls" style="width: 150px">
                            </select>
                        </td>
                          <td>
                            پرسنل زیر مجموعه
                        </td>
                            <td>
                            <input type="checkbox" id="chkChildren" checked="true" runat="server" />
                        </td>
                    </tr>
                   
                </table>
                 </fieldset>
            </td>
        </tr>
        <tr>
            <td>
             <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCNameNature" runat="server" />
                        <div id="GridViewCountainer" class="DivStyle1" align="center">
                            <cc2:KasraGrid ID="GrdKaraneReport" runat="server" OnRowDataBound="Grid_RowDataBound"
                            AllowSendToPDF="true"  AllowSendToExcel="true">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPCodeTemp" name="txtPCodeTemp" runat="server" />
        <input type="text" runat="server" id="txtMenuItemID" />
        <input type="text" runat="server" id="txtOnLineUser" />
        <input type="text" runat="server" id="txtReportID" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtGridName" name="txtGridName" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtGridID" name="txtGridID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtWPID" name="txtWPID" runat="server" />
        <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtDepartmentName" name="txtDepartmentName" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtWorkPeriodOption" name="txtWorkPeriodOption" runat="server" />
        <input type="text" id="txtKaraneComboboxOption" name="txtKaraneComboboxOption" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
         document.dir = "RTL";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         var idx = 0;
         $get("OToolBar_TDTopToolBar").style.display = "none"
         var SumArray = new Array;
         for (var i = 0; i < 100; i++)
             SumArray[i] = 0;
         $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
         SetDisableStatusImage();
         //------------------------مشخص شدن مقدار کمبو دوره از روی آپشن موجود-------------------------------
         if ($("#" + MasterObj + "txtWorkPeriodOption").val() != "0") {
             $("#" + MasterObj + "CmbWP").val($("#" + MasterObj + "txtWorkPeriodOption").val())
             $("#" + MasterObj + "CmbWP").attr("disabled", true);
         }

         //------------------------------------------------------------------------------------------------------
         SetSumRowColor();
         AddRowForDiffValue();
         GetAccessBtn();

         //----------------------------------مربوط به تنظیمات کمبوی واحد سازماني-------------------------------
         if (document.getElementById(MasterObj + "txtKaraneComboboxOption").value != "1") {
             document.getElementById("TDNewCombo").style.display = "none";
             document.getElementById("TDOldCombo").style.display = "inline";
             $("#" + MasterObj + "CmbDept").val($("#" + MasterObj + "txtDepartment").val());
         }
         else {
             $("#" + MasterObj + "MultiDep_cmbPerson_txtCode").val($("#" + MasterObj + "txtDepartment").val());
             $("#" + MasterObj + "MultiDep_cmbPerson_txtPCode").val($("#" + MasterObj + "txtDepartment").val());
             $("#" + MasterObj + "MultiDep_cmbPerson_txtName").val($("#" + MasterObj + "txtDepartmentName").val());
         }
         //------------------------------------------------------------------------------------------------------
         function SetDisableStatusImage() {           
             var CellsChild;
             var OGrid = $get(MasterObj + "GrdKaraneReport");
             if (OGrid) {
                 for (var IndexTable = 0; IndexTable < OGrid.rows.length - 1; IndexTable++) {
                     for (var IndexCells = 0; IndexCells < OGrid.rows(IndexTable).cells.length; IndexCells++) {
                         CellsChild = OGrid.rows(IndexTable).cells(IndexCells).firstChild;

                         if (CellsChild.tagName == 'INPUT')
                             if (CellsChild.getAttribute("CID") != null) {                        
                                 if (CellsChild.getAttribute("CID").split(";")[1] == "0") {
                                     OGrid.rows(IndexTable).cells(IndexCells).childNodes[1].style.display = "none";                                     
                                 }
                             }
                     }
                 }
             }
         }
         //*****************************************************************************************************
         Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
         //*****************************************************************************************************
         function BeginRequestHandler(sender, args) {
             var StrVal = $get(MasterObj + "txtSubmit").value

             //-------------------------------------------------------------------------------------------------
             if (StrVal != "Modify" && StrVal != "Filter") {

                 // ------------------------------Set Sum Row Attribute-----------------------------------------
                 var OGrid = $get(MasterObj + "GrdKaraneReport");
                 if (OGrid) {
                     //----------------------------------------------
                     var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
                     var CNature = 0;
                     CNameNatureArr = CNameNatureArr.split(',');
                     //----------------------------------------------
                     for (var i = 0; i < OGrid.rows(1).cells.length; i++)
                         if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                             for (var j = 0; j < CNameNatureArr.length; j++) {
                                 if (CNameNatureArr[j].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                                     var CNature = CNameNatureArr[j].split('#')[1]
                             }
                             if (CNature == "18701")
                                 SumArray[i] = SetMinuteTime(OGrid.rows(idx).cells(i).innerText) - SetMinuteTime(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                             else
                                 SumArray[i] = parseInt(OGrid.rows(idx).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).getAttribute("SumVal"));
                         }
                 }
                 //---------------------------------------------------------------------------------------------
             }
             else {
                 for (var i = 0; i < 100; i++)
                     SumArray[i] = 0;                
             }

         }
         //*****************************************************************************************************
         function EndRequestHandler(sender, args) {
             var StrVal = $get(MasterObj + "txtSubmit").value
             if (StrVal != "") {
                 SetDisableStatusImage();
                 if (StrVal == "Filter")
                     $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";



                 if (StrVal == "BtnFirst" || StrVal == "BtnPrev" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "Const" || StrVal == "Modify")
                     SetChk();
                 //------------------------------------------
                 if (document.getElementById(MasterObj + "txtValidate").value != "") {
                     if (document.getElementById(MasterObj + "txtValidate").value != "1")
                         alert($get(MasterObj + "txtAlert").value);
                     else {
                         SetMsg($get(MasterObj + "txtAlert").value);
                         if (StrVal == "Filter" || StrVal == "Modify")
                             $get(MasterObj + 'txtXmlSave').value = "<Root></Root>";
                     }
                 }
                 //-------------------------------------------------------------------------------------------------
                 SetSumRowColor();
                 AddRowForDiffValue();
                 //------------------------------Set Sum Row Attribute---------------------------------------------- 
                 var OGrid = $get(MasterObj + "GrdKaraneReport");
                 if (OGrid) {
                     //----------------------------------------------
                     var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
                     var CNature = 0;
                     CNameNatureArr = CNameNatureArr.split(',');
                     //----------------------------------------------
                     for (var i = 0; i < OGrid.rows(1).cells.length; i++) {
                         if (OGrid.rows(1).cells(i).firstChild.tagName == "INPUT") {
                             var PageVal = 0;
                             for (var k = 0; k < CNameNatureArr.length; k++) {
                                 if (CNameNatureArr[k].split('#')[0] == OGrid.rows(0).cells(i).innerText)
                                     var CNature = CNameNatureArr[k].split('#')[1]
                             }
                             for (var j = 1; j < idx; j++) {
                                 if (OGrid.rows(j).cells(i).firstChild.value != "" && OGrid.rows(j).cells(i).firstChild.value != "00:00")
                                     if (CNature == "18701")
                                         PageVal += parseInt(SetMinuteTime(OGrid.rows(j).cells(i).firstChild.value));
                                     else
                                         PageVal += parseInt(OGrid.rows(j).cells(i).firstChild.value);
                             }
                             OGrid.rows(idx).cells(i).PageVal = PageVal;
                             if (CNature == "18701") {
                                 OGrid.rows(idx).cells(i).innerText = SetHourlyTime(parseInt(SumArray[i]) + SetMinuteTime(OGrid.rows(idx).cells(i).innerText));
                                 OGrid.rows(idx + 2).cells(i).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx + 1).cells(i).innerText)) - parseInt(SetMinuteTime(OGrid.rows(idx).cells(i).innerText)));
                             }
                             else {
                                 OGrid.rows(idx).cells(i).innerText = parseInt(SumArray[i]) + parseInt(OGrid.rows(idx).cells(i).innerText);
                                 OGrid.rows(idx + 2).cells(i).innerText = parseInt(OGrid.rows(idx + 1).cells(i).innerText) - parseInt(OGrid.rows(idx).cells(i).innerText);
                             }


                         }
                     }
                 }
             }
             //-------------------------------------------------------------------------------------------------
             document.getElementById(MasterObj + "txtAlert").value = ""
             document.getElementById(MasterObj + "txtValidate").value = ""
             document.getElementById(MasterObj + "txtSubmit").value = ""
         }
         //===============================================Paging=================================================
         function OnBlurtxtCurPage(obj) {
             if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                 document.getElementById(MasterObj + "txtCurPage").value = obj.value
                 document.getElementById(MasterObj + "txtSubmit").value = "Const"
                 document.getElementById(MasterObj + "BtnSubmit").click()
             }
         }
         //--------------------------------------------------------------------------------------------
         function OnClickBtnNext() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
             document.getElementById(MasterObj + "BtnSubmit").click()
         }
         //--------------------------------------------------------------------------------------------
         function OnClickBtnLast() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
             document.getElementById(MasterObj + "BtnSubmit").click()
         }
         //--------------------------------------------------------------------------------------------
         function OnClickBtnPrv() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
             document.getElementById(MasterObj + "BtnSubmit").click()
         }
         //--------------------------------------------------------------------------------------------
         function OnClickBtnFirst() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
             document.getElementById(MasterObj + "BtnSubmit").click()
         }
         //=============================================================================
         function OnClickGrd(SelectedRow) {
             if (LastSelectedRow != null) {
                 LastSelectedRow.className = LastSelectedRowClass;
             }
             LastSelectedRowClass = SelectedRow.className;
             LastSelectedRow = SelectedRow;
             SelectedRow.className = "CssSelectedItemStyle";
         }
         //=============================================================================
         function OnClickBtnFilter() {
             $("#" + MasterObj + "txtWPID").val($("#" + MasterObj + "CmbWP").val());
             $("#" + MasterObj + "txtGroupID").val($("#" + MasterObj + "CmbGroup").val());
             $("#" + MasterObj + "txtPCodeTemp").val(document.getElementById(MasterObj + "CmbPerson_txtCode").value.trim())

             if ($get(MasterObj + "txtKaraneComboboxOption").value != "1")
                 $("#" + MasterObj + "txtDepartment").val($("#" + MasterObj + "CmbDept").val());
             else {
                 if ($("#" + MasterObj + "MultiDep_txtHidden").val() != "") {
                     var Departments = "<Root>" + $("#" + MasterObj + "MultiDep_txtHidden").val() + "</Root>", DeptString = '';
                     if (window.ActiveXObject) {
                         xml = new ActiveXObject("Microsoft.XMLDOM");
                         xml.async = "false";
                         xml.loadXML(Departments);
                     } else {
                         var parser = new DOMParser();
                         xml = parser.parseFromString(Departments, 'text/xml');
                     }
                     $(xml)
                .find("Root").find("Tb").each(function () {
                    DeptString = DeptString + "," + $(this).find('DepartmentID').text();
                });
                     if (DeptString != "") {
                         DeptString = DeptString.substring(1, DeptString.length)
                         $("#" + MasterObj + "txtDepartment").val(DeptString);
                     }
                 }
                 else
                     $("#" + MasterObj + "txtDepartment").val($("#" + MasterObj + "MultiDep_cmbPerson_txtCode").val());

                
                 $("#" + MasterObj + "txtDepartmentName").val($("#" + MasterObj + "MultiDep_cmbPerson_txtName").val());
             }

             if ($("#" + MasterObj + "txtWPID").val() == "" || $("#" + MasterObj + "txtWPID").val() == "0") {
                 alert("دوره کارانه ای را انتخاب کنید ");
                 $("#" + MasterObj + "CmbWP").focus();
                 $("#" + MasterObj + "CmbWP").select();
                 return false;
             }
             if ($("#" + MasterObj + "txtDepartment").val() == "" || $("#" + MasterObj + "txtDepartment").val() == "0") {
                 alert(" واحد سازمانی را انتخاب کنید  ");
                 if ($get(MasterObj + "txtKaraneComboboxOption").value != "1") {
                     $("#" + MasterObj + "CmbDept").focus();
                     $("#" + MasterObj + "CmbDept").select();
                 }
                 else {
                     $("#" + MasterObj + "MultiDep_cmbPerson").focus();
                     $("#" + MasterObj + "MultiDep_cmbPerson").select();
                 }
                 return false;
             }
             if ($("#" + MasterObj + "txtDepartment").val().split(',').length > 1) {
                 alert("امکان انتخاب بيش از يک واحد سازماني وجود ندارد");
                 $("#" + MasterObj + "MultiDep_cmbPerson").focus();
                 $("#" + MasterObj + "MultiDep_cmbPerson").select();
                 return false;
             }
             $("#" + MasterObj + "txtSubmit").val("Filter");
             $("#" + MasterObj + "BtnSubmit").click();

         }
         //=========================================================================================================
         function SetChk() {
             var OGrid = document.getElementById(MasterObj + "GrdKaraneReport");
             if (OGrid == null)
                 return
             var PageSize = OGrid.rows.length - 1;
             var ColCount = OGrid.rows(0).cells.length;
             var strXml = $get(MasterObj + 'txtXmlSave').value
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(strXml);

             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB");
             if (oXmlNodes.length > 0) {
                 for (j = 0; j < oXmlNodes.length; j++) {
                     for (i = 1; i < PageSize; i++) {
                         if (OGrid.rows(i).PersonelID == oXmlNodes.item(j).selectSingleNode("PId").text) {
                             for (var k = 2; k < ColCount; k++) {
                                 if (OGrid.rows(i).cells(k).cellIndex == oXmlNodes.item(j).selectSingleNode("cellIndex").text) {
                                     var cellIndex = OGrid.rows(i).cells(k).cellIndex;
                                     OGrid.rows(i).cells(cellIndex).firstChild.value = oXmlNodes.item(j).selectSingleNode("RealVal").text
                                 }
                             }
                         }
                     }
                 }
             }
         }
         //==================================================================================
         function OnBlurCellCode(Obj) {
             var cellIndex = Obj.parentElement.cellIndex;
             var CName = Obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
             var PId = Obj.parentElement.parentElement.PersonelID;
             var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
             var CNature = 0;
             CNameNatureArr = CNameNatureArr.split(',');
             for (var i = 0; i < CNameNatureArr.length; i++) {
                 if (CNameNatureArr[i].split('#')[0] == CName)
                     var CNature = CNameNatureArr[i].split('#')[1]
             }
             if (Obj.value != "" || Obj.value != "0") {
                 if (CNature == "18701")
                     TimechkNew(Obj);
                 else
                     Obj.value = Obj.value.split(":")[0];
             }
             var strXml = "";
             if (Obj.value != "") {
                 var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                 oXmlDoc.async = "false";
                 oXmlDoc.loadXML($get(MasterObj + 'txtXmlSave').value)

                 var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TB[PId=" + PId + " and CName='" + CName + "']");
                 ///////////////////////////////////////////////////////////////////////////////
                 if (oXmlNodes.length > 0) {
                     var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                     $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
                 }
                 var Value = Obj.value;
                 if (CNature == "18701")
                     Value = parseInt(Value.split(":")[0] * 60) + parseInt(Value.split(":")[1]);
                 //                if (Value != "0") {
                 var CodeID = Obj.getAttribute("CID").split(";")[0];
                 strXml += "<TB>";
                 strXml += "<PId>" + PId + "</PId>";
                 strXml += "<CName>" + CName + "</CName>";
                 strXml += "<CID>" + CodeID + "</CID>";
                 strXml += "<Val>" + Value + "</Val>";
                 strXml += "<Descript></Descript>";
                 strXml += "<RealVal>" + Obj.value + "</RealVal>";
                 strXml += "<cellIndex>" + cellIndex + "</cellIndex>";
                 strXml += "<ID>" + Obj.getAttribute("WRID") + "</ID>";
                 strXml += "<Kind>" + Obj.getAttribute("Kind") + "</Kind>";
                 strXml += "</TB>";
                 var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
                 oXmlDocTemp.async = "false";
                 oXmlDocTemp.loadXML("<Root>" + strXml + "</Root>")
                 var XmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/TB");
                 oXmlDoc.childNodes[0].appendChild(XmlNodeTemp);
                 $get(MasterObj + 'txtXmlSave').value = oXmlDoc.xml;
                 //                }
             }
             //---------------------------Set Sum Row Value-----------------------------------------------------
             var OGrid = $get(MasterObj + "GrdKaraneReport");
             var CellVal = 0;
             if (OGrid) {
                 for (var i = 1; i < idx; i++) {
                     if (OGrid.rows(i).cells(cellIndex).firstChild.value != "" && OGrid.rows(i).cells(cellIndex).firstChild.value != "00:00")
                         if (CNature == "18701")
                             CellVal += parseInt(SetMinuteTime(OGrid.rows(i).cells(cellIndex).firstChild.value));
                         else
                             CellVal += parseInt(OGrid.rows(i).cells(cellIndex).firstChild.value);
                 }
                 if (CNature == "18701") {
                     OGrid.rows(idx).cells(cellIndex).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal"))) + parseInt((CellVal - OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex]);
                     OGrid.rows(idx + 2).cells(cellIndex).innerText = SetHourlyTime(parseInt(SetMinuteTime(OGrid.rows(idx + 1).cells(cellIndex).innerText)) - parseInt(SetMinuteTime(OGrid.rows(idx).cells(cellIndex).innerText)));
                 }
                 else {
                     OGrid.rows(idx).cells(cellIndex).innerText = parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal") == "00:00" ? 0 : OGrid.rows(idx).cells(cellIndex).getAttribute("SumVal")) + parseInt(CellVal - parseInt(OGrid.rows(idx).cells(cellIndex).getAttribute("PageVal"))) + SumArray[cellIndex];
                     OGrid.rows(idx + 2).cells(cellIndex).innerText = parseInt(OGrid.rows(idx + 1).cells(cellIndex).innerText) - parseInt(OGrid.rows(idx).cells(cellIndex).innerText);
                 }
             }
         }
         //==============================================================================================================
         function OnClickBtnSave() {
             //alert($get(MasterObj + "txtXmlSave").value);
             if ($get(MasterObj + "txtXmlSave").value != "<Root></Root>") {
                 $get(MasterObj + "txtSubmit").value = "Modify";
                 $get(MasterObj + "BtnSubmit").click();
             }
         }
         //==============================================================================================================
         function OnFocusCellCode(obj) {
             obj.select();
             obj.focus();
         }
         //==============================================================================================================
         function checkEnter(obj) {
             var OGrid = obj.parentElement.parentElement.parentElement;
             var grdLen = OGrid.rows.length;
             if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                 grdLen = grdLen - 1;

             var row = obj.parentElement.parentElement;
             var CellIndex = obj.parentElement.cellIndex;
             var CellLeng = ColCount = OGrid.rows(0).cells.length;
             //-----------------------مقدار دهی نوع کلید فشرده شده-----------      
             WindowEvent = window.event.keyCode
             //-----------------------------------------------تشخیص نوع کلید
             switch (WindowEvent) {
                 case 40: //---------------اروکی بالا
                     var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
                     if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                     }
                     else if (OGrid.rows(rowIndex) != null && rowIndex != grdLen && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                         rowIndex = rowIndex + 1
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                     }
                     break;
                 case 39: //---------------اروکی راست    
                     CellIndex = CellIndex - 1;
                     while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex > 1) {
                         CellIndex = CellIndex - 1;
                     }
                     if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                         OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus();
                         OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
                     }
                     break;
                 case 38: //----------------اروکی پایین
                     var rowIndex = parseInt(row.rowIndex) - 1; //----------index ردیف جدید
                     if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == false) {
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                     }
                     else if (OGrid.rows(rowIndex) != null && rowIndex != 0 && OGrid.rows(rowIndex).cells(CellIndex).firstChild.disabled == true) {
                         rowIndex = rowIndex - 1;
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                     }
                     break;
                 case 37: //----------------اروکی چپ
                     CellIndex = CellIndex < ColCount - 1 ? CellIndex + 1 : CellIndex;
                     while (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "INPUT" && CellIndex < ColCount - 1)
                         CellIndex = CellIndex + 1;
                     if (OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.tagName != "SPAN") {
                         OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(row.rowIndex).cells(CellIndex).firstChild.select()
                     }
                     break;
                 case 13:
                     var rowIndex = parseInt(row.rowIndex) + 1; //----------index ردیف جدید
                     if (OGrid.rows(rowIndex) != null && rowIndex != 0) {
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.focus()
                         OGrid.rows(rowIndex).cells(CellIndex).firstChild.select()
                     }
                     break;
             }
         }
         //==============================================================================================================
         function OnKeyDownTimeNew(obj) {
             var cellIndex = obj.parentElement.cellIndex;
             var CName = obj.parentElement.parentElement.parentElement.rows(0).cells(cellIndex).innerText;
             var CNameNatureArr = $get(MasterObj + "txtCNameNature").value;
             var CNature = 0;
             CNameNatureArr = CNameNatureArr.split(',');
             for (var i = 0; i < CNameNatureArr.length; i++) {
                 if (CNameNatureArr[i].split('#')[0] == CName)
                     CNature = CNameNatureArr[i].split('#')[1]
             }
             if (CNature == "18701")
                 OnKeyDownTime();
             else
                 OnKeyDownInt(obj);
         }
         //===============================================================================================================
         function TimechkNew(Obj) {
             if (Obj.value.split(":").length == 1)
                 Obj.value = Obj.value + ":00";
             else
                 if (Obj.value.split(":")[1] > 59) {
                     alert("!لطفا ساعت صحيح را وارد کنيد");
                     Obj.select();
                     Obj.focus();
                 }
         }
         //===============================================================================================================
         function OnClickBtnFlow(Obj) {
             var DocID = Obj.parentElement.childNodes[0].getAttribute("WRID");
             var WFDocId = 4;
             window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocId + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
         }
         //===============================================================================================================
         function SetSumRowColor() {
             var oGrd = document.getElementById(MasterObj + "GrdKaraneReport"), i = 0
             if (oGrd)
                 var len = oGrd.rows.length
             else
                 return

             if (oGrd.rows(len - 3).cells(i) && oGrd.rows(len - 3).PersonelID == "-1")
                 idx = len - 3
             else if (oGrd.rows(len - 2).cells(i) && oGrd.rows(len - 2).PersonelID == "-1")
                 idx = len - 2
             try {
                 if (idx != 0) {

                     while (oGrd.rows(idx).cells(i)) {
                         oGrd.rows(idx).className = ""
                         oGrd.rows(idx).cells(i).className = ""
                         oGrd.rows(idx).className = "CssSumItemStyle"
                         oGrd.rows(idx).cells(i).className = "CssSumItemStyle"
                         oGrd.rows(idx).cells(0).innerText = "مجموع کل";

                         i++
                     }
                     i = 0;
                     while (oGrd.rows(idx + 1).cells(i)) {
                         oGrd.rows(idx + 1).className = ""
                         oGrd.rows(idx + 1).cells(i).className = ""
                         oGrd.rows(idx + 1).className = "CssSumItemStyle"
                         oGrd.rows(idx + 1).cells(i).className = "CssSumItemStyle"
                         oGrd.rows(idx + 1).cells(0).innerText = "ميانگين / سقف ";

                         i++
                     }
                 }
             }
             catch (ex) { }

         }
         //===============================================================================================================
         function AddRowForDiffValue() {
             var OGrid = $get(MasterObj + "GrdKaraneReport");
             if (OGrid != null) {
                 var len = OGrid.rows.length, rowIndex = 0;
                 if (OGrid.rows(len - 1).getAttribute("Footer") == 1)
                     rowIndex = len - 1;
                 else
                     rowIndex = len;
                 var oRow = OGrid.insertRow(rowIndex);
                 for (var i = 0; i < OGrid.rows(0).cells.length; i++) {
                     var oCell = oRow.insertCell();
                     oCell.innerHTML = OGrid.rows((oRow.rowIndex) - 1).cells(i).innerHTML;
                     oCell.className = "CssSumItemStyle"
                 }
                 OGrid.rows(oRow.rowIndex).cells(0).innerText = "تفاوت مقادير ";
             }
         }
         //================================================================================================================
         function SetMinuteTime(Time) {
             var Hour = Time.split(':')[0]
             var Minute = Time.split(':')[1];
             if (Hour.substr(0, 1) == '0')
                 Hour = Hour.substr(1, 2);
             if (Minute.substr(0, 1) == '0')
                 Minute = Minute.substr(1, 2);
             return parseInt(Hour) * 60 + parseInt(Minute)
         }
         //================================================================================================================
         function SetHourlyTime(Sum) {
             var SignFlag = Sum < 0 ? 1 : 0;
             Sum = Math.abs(Sum);
             var Hour = parseInt(Sum / 60).toString();
             var Minute = Sum % 60
             if (Hour.toString().length == 1)
                 Hour = "0" + Hour;
             if (Minute.toString().length == 1)
                 Minute = "0" + Minute;
             return Hour + ":" + Minute + (SignFlag == 1 ? "-" : "");
         }
         //=================================================================================================================
         function OnClickBtnAllPDF() {
             document.getElementById(MasterObj + "txtSubmit").value = "AllPDF"
             document.getElementById(MasterObj + "BtnSubmitSend").click()
         }
         //=================================================================================================================
         function OnClickBtnOnePDF() {
             document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
             document.getElementById(MasterObj + "BtnSubmitSend").click()
         }
         //=================================================================================================================
         function OnClickBtnAllExcel() {
             document.getElementById(MasterObj + "txtSubmit").value = "AllExcel"
             document.getElementById(MasterObj + "BtnSubmitSend").click()
         }
         //=================================================================================================================
         function OnClickBtnOneExcel() {
             document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
             document.getElementById(MasterObj + "BtnSubmitSend").click()
         }
         //=================================================================================================================
         function GetAccessBtn() {
             
             if (window.ActiveXObject) {
                 // code for IE6, IE5
                 xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                 xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
                 xmlDoc.setProperty("SelectionLanguage", "XPath")

                 var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
                 
                 if (xmlNodes.length != 0) {
                     if (xmlNodes.item(0).selectSingleNode('GroupFilter')
                      && xmlNodes.item(0).selectSingleNode('GroupFilter').text == 2) {
                         document.getElementById(MasterObj + "CmbGroup").style.display = "none"
                         document.getElementById("TDGroup").style.display = "none"
                         document.getElementById("TDGroupName").style.display = "none"

                     }
                     if (xmlNodes.item(0).selectSingleNode('DepartmentFilter')
                      && xmlNodes.item(0).selectSingleNode('DepartmentFilter').text == 2) {
                         document.getElementById("TDNewCombo").style.display = "none";
                         document.getElementById("TDOldCombo").style.display = "none";
                         document.getElementById("TDNewComboName").style.display = "none";
                     }
                 }
             }
         }
    </script>
</asp:Content>
