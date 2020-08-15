<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="DutyManagement.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DutyManagement" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .DivStyle1
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:450px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server"  LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td >
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table cellpadding="0" cellspacing="0" >
                        <tr>
                            <td>
                                <table >
                                    <tr>
                                        <td>
                                            از تاريخ :
                                        </td>
                                        <td>
                                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                                        </td>
                                        <td>
                                            تا تاريخ :
                                        </td>
                                        <td>
                                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                                        </td>
                                        <td>
                                            پرسنلي :
                                        </td>
                                        <td>
                                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                                        </td>
                                          <td>
                                            نمايش :
                                        </td>
                                        <td>
                                            <input type="radio" runat="server" checked="true" id="rdRequestDuty" name="ViewState" onclick="OnClickDutyStatus()"/>
                                            درخواست ماموريت
                                        </td>
                                        <td>
                                            <input type="radio" runat="server" id="rdRegisterDuty" name="ViewState" onclick="OnClickDutyStatus()" />
                                            عملکرد ماموريت
                                        </td>
                                       
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table >
                                    <tr>
                                        <td>
                                            ش. حکم :
                                        </td>
                                        <td>
                                            <input type="text" runat="server" id="txtSerialNo" class="TxtControls"/>
                                        </td>
                                        
                                        <td>
                                            وضعيت :
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="CmbStatus" Style="width: 150px" class="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                      <td>
                                            نوع ماموريت :
                                        </td>
                                        <td>
                                            <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 180px"
                                                class="TxtControls">
                                                <option></option>
                                            </select>
                                        </td>
                                        <td id="DutyStatus1" style="display:none" >
                                            وضعيت عملکرد :
                                        </td>
                                        <td  id="DutyStatus2" style="display:none">
                                            <asp:DropDownList runat="server" ID="CmbDutyStatus" Style="width: 180px" class="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                          <asp:HiddenField ID="txtSortExpression2" runat="server" />
                        <asp:HiddenField ID="txtSortDirection2" runat="server" />
                        <asp:HiddenField ID="Totalpage2" runat="server" />
                        <asp:HiddenField ID="txtCurPage2" runat="server" />
                        <div id="DivGrid" class="DivStyle1">
                            <cc2:KasraGrid ID="GrdDutyManagement" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="Grd_Sorting">
                            </cc2:KasraGrid>
                            <cc2:KasraGrid ID="GrdDutyGeneral" runat="server"  Visible="false" OnRowDataBound="Grid_RowDataBound2"
                                AllowSorting="true" OnSorting="Grd_Sorting2">
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtPageNumber" name="txtPageNumber" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSerialNoSearch" name="txtSerialNoSearch" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
        <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
        <input type="text" id="txtDutyDetailID" name="txtDutyDetailID" runat="server" />
        <input type="text" id="txtDutyDetailOption" name="txtDutyDetailOption" runat="server" />
        <input type="text" id="txtExpireXml" name="txtExpireXml" runat="server" />
        <input type="text" id="txtExpireStatus" name="txtExpireStatus" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
    </div>
   <script>
       WidthScreen = window.screen.width; 
       $get("DivGrid").style.width = WidthScreen - 40;
       //*************************************Declaration*************************************
       var LastSelectedRow = null;
       var LastSelectedRowClass = "";
       document.dir = "rtl";
       var StrChk = "";
       document.getElementsByTagName("body")[0].scroll = "no";
       if (typeof document.getElementById("OToolBar_BtnExpireDuty") == "object") {
           if (document.getElementById("OToolBar_BtnExpireDuty")!=null)
               document.getElementById("OToolBar_BtnExpireDuty").style.display = "none";
       }
       if (typeof document.getElementById("OToolBar__BtnUnExpireDuty") == "object") {
           if (document.getElementById("OToolBar_BtnUnExpireDuty")!=null)
               document.getElementById("OToolBar_BtnUnExpireDuty").style.display = "none";
       }
       if (typeof document.getElementById("OToolBar_BtnLoadReport") == "object") {
           if (document.getElementById("OToolBar_BtnLoadReport")!=null)
               document.getElementById("OToolBar_BtnLoadReport").style.display = "none";
       }
       if (typeof document.getElementById("OToolBar_BtnViewReport") == "object") {
           if (document.getElementById("OToolBar_BtnViewReport")!=null)
               document.getElementById("OToolBar_BtnViewReport").style.display = "none";
       }
       OnClickRdDuty();
       //**************************************EndDeclaration*****************************************       
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

       function BeginRequestHandler(sender, args) {
           
       }
       //====================================================================================
       function EndRequestHandler(sender, args) {
           $get("DivGrid").style.width = WidthScreen - 40;
           //---------------------------------------------------------------------------------
           var StrVal = $get(MasterObj + "txtSubmit").value
           if ($get(MasterObj + "txtAlert").value != "") {
               if ($get(MasterObj + "txtValidate").value == 0 || $get(MasterObj + "txtValidate").value == "" )
                   alert($get(MasterObj + "txtAlert").value)
               else
                   SetMsg($get(MasterObj + "txtAlert").value);
           }
           if (StrVal == "Filter")
               OnClickRdDuty();
           if (StrVal != "ExpireDuty")
               SetChk();
           else
               StrChk = "";
           $get(MasterObj + "txtSubmit").value = "";
           $get(MasterObj + "txtAlert").value = "";
           LastSelectedRow = null;
          
       }
       //===============================================Paging================================================
       function OnBlurtxtCurPage(obj) {
           var oRow = window.event.srcElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           if (obj.value != 0 && obj.value.replace(" ", "") != "") {
               if (oRow.id == MasterObj + "GrdDutyManagement") {
                   document.getElementById(MasterObj + "txtCurPage").value = obj.value
                   document.getElementById(MasterObj + "txtSubmit").value = "Const"
                   document.getElementById(MasterObj + "BtnSubmit").click()
               }
               else if (oRow.id == MasterObj + "GrdDutyGeneral") {
                   document.getElementById(MasterObj + "txtCurPage2").value = obj.value
                   document.getElementById(MasterObj + "txtSubmit").value = "Const2"
                   document.getElementById(MasterObj + "BtnSubmit").click()
               }
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnNext() {
           var oRow = window.event.srcElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           if (oRow.id == MasterObj + "GrdDutyManagement") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           else if (oRow.id == MasterObj + "GrdDutyGeneral") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnNext2";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnLast() {
           var oRow = window.event.srcElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           if (oRow.id == MasterObj + "GrdDutyManagement") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           else if (oRow.id == MasterObj + "GrdDutyGeneral") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnLast2";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnPrv() {
           var oRow = window.event.srcElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           if (oRow.id == MasterObj + "GrdDutyManagement") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           else if (oRow.id == MasterObj + "GrdDutyGeneral") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev2";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //--------------------------------------------------------------------------------------------
       function OnClickBtnFirst() {
           var oRow = window.event.srcElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           if (oRow.id == MasterObj + "GrdDutyManagement") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           else if (oRow.id == MasterObj + "GrdDutyGeneral") {
               document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst2";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //===============================================================================
       function OnClickBtnSave() {
           if (SaveExtendedCode()) {
               save();
               document.getElementById(MasterObj + "txtSubmit").value = "Modify";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
       }
       //====================================================
       function OnClickBtnFilter() {
           $get(MasterObj + "txtPCode").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;
           $get(MasterObj + "txtSerialNoSearch").value = $get(MasterObj + "txtSerialNo").value;
           $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
           $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
           if ($get(MasterObj + "SDate").value == "//") $get(MasterObj + "SDate").value = "";
           if ($get(MasterObj + "EDate").value == "//") $get(MasterObj + "EDate").value = "";
           $get(MasterObj + "txtCreditType").value = $get(MasterObj + "CmbCreditType").value;
           if ($get(MasterObj + "SDate").value > $get(MasterObj + "EDate").value)
               alert("تاريخ شروع بزرگتر از تاريخ پايان است");
           else {
               $get(MasterObj + "txtSubmit").value = "Filter";
               $get(MasterObj + "BtnSubmit").click();
           }
       }
       //==========================================================
       function OnClickGrd(SelectedRow) {
           if (LastSelectedRow != null)
               LastSelectedRow.className = LastSelectedRowClass
           LastSelectedRowClass = SelectedRow.className
           LastSelectedRow = SelectedRow
           SelectedRow.className = "CssSelectedItemStyle"
       }
       //========================================================
       function OnDblClickGrd() {
           if (LastSelectedRow.StatusID != "205" && LastSelectedRow.StatusID != "204") {
               if (LastSelectedRow.TableName == "Att.Credit") {
                   var url = "../Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&TableName=" + LastSelectedRow.getAttribute("TableName")
                + "&FieldName=" + LastSelectedRow.getAttribute("FieldName")
                + "&FieldValue=" + LastSelectedRow.getAttribute("CrID")
                + "&ModifyFlag=1";
                   var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
               }
               else {
                   var url = "../Reports/RegisterDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&SerialNo=" + LastSelectedRow.cells(3).innerText
                    + "&CreditID=" + LastSelectedRow.CrID
                    + "&StatusID=" + LastSelectedRow.StatusID
                    + "&ModifyFlag=1";
                   if ($get(MasterObj + "txtDutyDetailOption").value == "1")
                       var DialogProperty = "dialogHeight:750px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                   else
                       var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
               }
               returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
               if (returnValue == 1) {
                   if ($get(MasterObj + "rdRequestDuty").checked == true) {
                       document.getElementById(MasterObj + "txtSubmit").value = "Const"
                       document.getElementById(MasterObj + "BtnSubmit").click()
                   }
                   else {
                       document.getElementById(MasterObj + "txtSubmit").value = "Const2"
                       document.getElementById(MasterObj + "BtnSubmit").click()
                   }
               }
           }
           else
               alert("امکان ويرايش مجوز حذف شده/تاييد نشده وجود ندارد");
       }
       //=====================================================
       function OnClickBtnRequestDuty() {
           var url = "../Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ModifyFlag=1";
           var DialogProperty = "dialogHeight:500px;dialogWidth:750px;center: Yes;help: no;status: no;resizable=1"
           returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
           if (returnValue == 1)
               OnClickBtnFilter();
       }
       //=====================================================
       function OnClickBtnRegisterDuty() {
           if (LastSelectedRow != null) {
               if (LastSelectedRow.StatusID != "205" && LastSelectedRow.StatusID != "204") {
                   var SerialNo;
                   if (LastSelectedRow.TableName == "Att.Credit")
                       SerialNo = LastSelectedRow.cells(2).innerText
                   else
                       SerialNo = LastSelectedRow.cells(3).innerText
                   var url = "../Reports/RegisterDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&SerialNo=" + SerialNo
                    + "&CreditID=" + LastSelectedRow.CrID
                    + "&StatusID=" + LastSelectedRow.StatusID
                    + "&RegDuty=" + oRow.RegDuty
                    + "&ModifyFlag=0";
                   if ($get(MasterObj + "txtDutyDetailOption").value == "1")
                       var DialogProperty = "dialogHeight:750px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                   else
                       var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                   returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
                   if (returnValue == 1) {
                       if ($get(MasterObj + "rdRequestDuty").checked == true) {
                           document.getElementById(MasterObj + "txtSubmit").value = "Const"
                           document.getElementById(MasterObj + "BtnSubmit").click()
                       }
                       else {
                           document.getElementById(MasterObj + "txtSubmit").value = "Const2"
                           document.getElementById(MasterObj + "BtnSubmit").click()
                       }
                   }
               }
               else
                   alert("امکان ثبت عملکرد براي ماموريت حذف شده/تاييد نشده وجود ندارد");
           }
           else
               alert('لطفا يک سطر از گريد انتخاب کنيد')
       }
       //===============================================================================================
       function OnClickRegisterDuty(obj) {
           oRow = obj.parentElement;
           if (oRow != null) {
               if (oRow.StatusID != "205" && oRow.StatusID != "204") {
                   var SerialNo;
                   if (oRow.TableName == "Att.Credit")
                       SerialNo = oRow.cells(2).innerText
                   else
                       SerialNo = oRow.cells(3).innerText
                   var url = "../Reports/RegisterDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                    + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&SerialNo=" + SerialNo
                    + "&CreditID=" + oRow.CrID
                    + "&StatusID=" + oRow.StatusID
                    + "&RegDuty=" + oRow.RegDuty
                    + "&ModifyFlag=0";
                 
                   if ($get(MasterObj + "txtDutyDetailOption").value == "1")
                       var DialogProperty = "dialogHeight:750px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
                   else
                       var DialogProperty = "dialogHeight:550px;dialogWidth:950px;center: Yes;help: no;status: no;resizable=1"
              
                   returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
                   if (returnValue == 1) {
                       if ($get(MasterObj + "rdRequestDuty").checked == true) {
                           document.getElementById(MasterObj + "txtSubmit").value = "Const"
                           document.getElementById(MasterObj + "BtnSubmit").click()
                       }
                       else {
                           document.getElementById(MasterObj + "txtSubmit").value = "Const2"
                           document.getElementById(MasterObj + "BtnSubmit").click()
                       }
                   }
               }
               else
                   alert("امکان ثبت عملکرد براي ماموريت حذف شده/تاييد نشده وجود ندارد");
           }
           else
               alert('لطفا يک سطر از گريد انتخاب کنيد')
       }
       //===============================================================================================
       function OnClickBtnDel() {
           if (LastSelectedRow != null) {
               if (LastSelectedRow.StatusID != "205" && LastSelectedRow.StatusID != "204") {
                   if (confirm("آيا براي حذف مطمئنيد؟")) {
                       document.getElementById(MasterObj + "txtCreditID").value = LastSelectedRow.CrID;
                       document.getElementById(MasterObj + "txtDutyDetailID").value = LastSelectedRow.getAttribute("ID");
                       $get(MasterObj + "txtSubmit").value = "Delete";
                       $get(MasterObj + "BtnSubmit").click();
                   }
               }
               else
                   alert("امکان حذف مجوز حذف شده/تاييد نشده وجود ندارد");
           }
           else
               alert('لطفا يک سطر از گريد انتخاب کنيد')
       }
       //===============================================================================================
       function OnClickBtnEdit() {
           if (LastSelectedRow != null) {
               OnDblClickGrd();
           }
           else
               alert("لطفا به منظور ويرايش یک سطر را انتخاب کنید")
       }
       //===============================================================================================
       function OnClickImgFlow(obj) {
           var OGrid = $get(MasterObj + "GrdDutyManagement");
           var OGrid2 = $get(MasterObj + "GrdDutyGeneral");
           var oRow = window.event.srcElement
           var oRow2 = window.event.srcElement.parentElement
           while (oRow2.tagName != "TR")
               oRow2 = oRow2.parentElement
           while (oRow.tagName != "TR")
               oRow = oRow.parentElement
           for (var i = 0; oRow.tagName != "TABLE"; i++) {
               oRow = oRow.parentElement
           }
           var DocID, WFDocId, DocTypeID
           if (oRow.id == MasterObj + "GrdDutyManagement" && OGrid != null) {
               DocID = oRow2.getAttribute('CrID')
               WFDocId = oRow2.getAttribute('WFDocId')
               DocTypeID = oRow2.DocTypeID
           }
           else if (oRow.id == MasterObj + "GrdDutyGeneral" && OGrid2 != null) {
               DocID = oRow2.getAttribute('ID')
               WFDocId = oRow2.getAttribute('WFDocId')
               DocTypeID = oRow2.DocTypeID
           }
      
           if (DocTypeID == "0" && WFDocId != "0")
               window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
           else
               window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + DocTypeID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")

       }
       //===============================================================================================
       function OnClickHeaderChk(obj) {
           var OGrid = document.getElementById(MasterObj + "GrdDutyGeneral");
           var oLen = OGrid.rows.length;
           if (OGrid.rows(oLen - 1).getAttribute("Footer") == 1)
               oLen = oLen - 1;
           for (var i = 1; i < oLen; i++) {
               if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
                   OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                   OnClickChk(OGrid.rows(i).cells(0).firstChild);
               }
           }
       }
       //===============================================================================================
       function OnClickChk(obj) {
           var oGrid = obj.parentElement;
           while (oGrid.tagName != "TABLE")
               oGrid = oGrid.parentElement

           var oRow = obj.parentElement;
           while (oRow.tagName != "TR")
               oRow = oRow.parentElement
           var oIndex = oRow.rowIndex
           var strXml = "<Root>" + StrChk + "</Root>"
           //========================================================
           var CreditID = oGrid.rows(oIndex).CrID;
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(strXml);

           var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ CreditID=" + CreditID + "]");
           //========================================================
           if (oXmlNodes.length > 0) {
               if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                   var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                   f.selectSingleNode("Selected").text = 1;
                   oXmlDoc.childNodes[0].appendChild(f);
               }
               else {
                   var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                   f.selectSingleNode("Selected").text = 0;
                   oXmlDoc.childNodes[0].appendChild(f);
               }
               strXml = oXmlDoc.xml;
               StrChk = strXml.replace("<Root>", "");
               StrChk = StrChk.replace("</Root>", "");
           }
           else {
               StrChk += "<Tb>"
               StrChk += "<CreditID>" + CreditID + "</CreditID>"
               if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                   StrChk += "<Selected>0</Selected>"
               else
                   StrChk += "<Selected>1</Selected>"
               StrChk += "</Tb>"
           }

       }
       //===============================================================================================
       function SetChk() {
           var OGrid = document.getElementById(MasterObj + "GrdDutyGeneral");
           if (OGrid == null)
               return
           var PageSize = OGrid.rows.length;
           if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
               PageSize = PageSize - 1;
           var strXml = "<Root>" + StrChk + "</Root>"
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(strXml);

           var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
           for (var j = 0; j < oXmlNodes.length; j++) {
               for (var i = 1; i < PageSize; i++) {
                   if (OGrid.rows(i).CrID == oXmlNodes.item(j).selectSingleNode("CreditID").text) {
                       if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                           OGrid.rows(i).cells(0).firstChild.checked = true;
                       else
                           OGrid.rows(i).cells(0).firstChild.checked = false;
                   }
               }
           }
       }
       //===============================================================================================
       function OnClickBtnExpireDuty() {
           if (StrChk != "") {
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML("<Root>" + StrChk + "</Root>");
               var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ Selected=1 ]");
               if (oXmlNodes.length > 0) {
                   $get(MasterObj + "txtExpireXml").value = "<Root>" + StrChk + "</Root>";
                   $get(MasterObj + "txtExpireStatus").value = "1";
                   $get(MasterObj + "txtSubmit").value = "ExpireDuty";
                   $get(MasterObj + "BtnSubmit").click();
               }
               else
                   alert("هيچ موردي انتخاب نشده است");
           }
           else
               alert("هيچ موردي انتخاب نشده است");
       }
       //===============================================================================================
       function OnClickBtnUnExpireDuty() {
           if (StrChk != "") {
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML("<Root>" + StrChk + "</Root>");
               var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ Selected=1 ]");
               if (oXmlNodes.length > 0) {
                   $get(MasterObj + "txtExpireXml").value = "<Root>" + StrChk + "</Root>";
                   $get(MasterObj + "txtExpireStatus").value = "0";
                   $get(MasterObj + "txtSubmit").value = "ExpireDuty";
                   $get(MasterObj + "BtnSubmit").click();
               }
               else
                   alert("هيچ موردي انتخاب نشده است");
           }
           else
               alert("هيچ موردي انتخاب نشده است");
       }
       //===============================================================================================  
       function OnClickRdDuty() {
           if ($get(MasterObj + "rdRequestDuty").checked == true) {    //درخواست ماموریت

               if (typeof document.getElementById("OToolBar_BtnExpireDuty") == "object") {
                   if (document.getElementById("OToolBar_BtnExpireDuty")!=null)
                       document.getElementById("OToolBar_BtnExpireDuty").style.display = "none";
               }
               if (typeof document.getElementById("OToolBar_BtnUnExpireDuty") == "object") {
                   if (document.getElementById("OToolBar_BtnUnExpireDuty")!=null)
                       document.getElementById("OToolBar_BtnUnExpireDuty").style.display = "none";
               }
               GetAccessBtn1();
           }

           else {

               if (typeof document.getElementById("OToolBar_BtnLoadReport") == "object") {
                   if (document.getElementById("OToolBar_BtnLoadReport")!=null)
                       document.getElementById("OToolBar_BtnLoadReport").style.display = "none";
               }
               if (typeof document.getElementById("OToolBar_BtnViewReport") == "object") {
                   if (document.getElementById("OToolBar_BtnViewReport")!=null)
                       document.getElementById("OToolBar_BtnViewReport").style.display = "none";
               }
               GetAccessBtn();
           }
       }


       //===============================================================================================  
       function GetAccessBtn1() {


           var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
           xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
           xmlDoc.setProperty("SelectionLanguage", "XPath")
           var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
           if (xmlNodes.length != 0) {

               if (xmlNodes.item(0).selectSingleNode('BtnLoadReport') && xmlNodes.item(0).selectSingleNode('BtnLoadReport').text == "1")
                   if (typeof document.getElementById("OToolBar_BtnLoadReport") == "object") {
                       if (document.getElementById("OToolBar_BtnLoadReport") != null) {
                           document.getElementById('OToolBar_BtnLoadReport').style.display = "inline"
                       }
                   }
                   if (xmlNodes.item(0).selectSingleNode('BtnViewReport') && xmlNodes.item(0).selectSingleNode('BtnViewReport').text == "1") {
                       if (typeof document.getElementById("OToolBar_BtnViewReport") == "object") {
                           if (document.getElementById("OToolBar_BtnViewReport") != null)
                           document.getElementById('OToolBar_BtnViewReport').style.display = "inline"
                       }
                   }
           }
       }
       
       function GetAccessBtn() {
           
           var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
           xmlDoc.loadXML(document.getElementById(MasterObj + "txtAccessBtn").value)
           xmlDoc.setProperty("SelectionLanguage", "XPath")
           var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/SurveyAccess")
           if (xmlNodes.length != 0) {
               if (xmlNodes.item(0).selectSingleNode('BtnExpireDuty') && xmlNodes.item(0).selectSingleNode('BtnExpireDuty').text == "1") {
                   if (typeof document.getElementById("OToolBar_BtnExpireDuty") == "object") {
                       if (document.getElementById("OToolBar_BtnExpireDuty")!=null)
                       document.getElementById('OToolBar_BtnExpireDuty').style.display = "inline"
                   }
               }

               if (xmlNodes.item(0).selectSingleNode('BtnUnExpireDuty') && xmlNodes.item(0).selectSingleNode('BtnUnExpireDuty').text == "1") {
                   if (typeof document.getElementById("OToolBar_BtnUnExpireDuty") == "object") {
                       if (document.getElementById("OToolBar_BtnUnExpireDuty") != null)
                       document.getElementById('OToolBar_BtnUnExpireDuty').style.display = "inline"
                   }
               }
           }
       }
       //===============================================================================================
       function OnClickDutyStatus() {
           if ($get(MasterObj + "rdRequestDuty").checked == true) {
               $get("DutyStatus1").style.display = "none";
               $get("DutyStatus2").style.display = "none";
           }
           else {
               $get("DutyStatus1").style.display = "inline";
               $get("DutyStatus2").style.display = "inline";
           }
       }

       //================================================================================================
       function OnClickBtnLoadReport() {
           var url = "/../../frmPresentation/App_Pages/FormGenerator/DutyManageReportDesign.aspx?Mode=Design"
        + "&PageID=131106"
        + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        + "&EDate=" + document.getElementById(MasterObj + "EDate").value
        + "&PCode=" + document.getElementById(MasterObj + "txtPCode").value
        + "&SerialNoSearch=" + document.getElementById(MasterObj + "txtSerialNoSearch").value
        + "&CreditType=" + document.getElementById(MasterObj + "txtCreditType").value
        + "&PageSize=" + document.getElementById(MasterObj + "txtPageSize").value
        + "&PageNumber=" + document.getElementById(MasterObj + "txtPageNumber").value   
        + "&Status=" + document.getElementById(MasterObj + "CmbStatus").value
        + "&SortExpression=" + document.getElementById(MasterObj + "txtSortExpression").value
        + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value
        + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value

           var DialogProperty = "dialogHeight:700px;dialogWidth:1100px;center: Yes;help: no;status: no;resizable=1"
           returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
       }
 
      
       //----------------------------------------------------------------
       function OnClickBtnViewReport() {
           var url = "/../../frmPresentation/App_Pages/FormGenerator/DutyManageReportDesign.aspx?Mode=View"
        + "&PageID=131106"
        + "&SDate=" + document.getElementById(MasterObj + "SDate").value
        + "&EDate=" + document.getElementById(MasterObj + "EDate").value
        + "&PCode=" + document.getElementById(MasterObj + "txtPCode").value
        + "&SerialNoSearch=" + document.getElementById(MasterObj + "txtSerialNoSearch").value
        + "&CreditType=" + document.getElementById(MasterObj + "txtCreditType").value
        + "&PageSize=" + document.getElementById(MasterObj + "txtPageSize").value
        + "&PageNumber=" + document.getElementById(MasterObj + "txtPageNumber").value
        + "&Status=" + document.getElementById(MasterObj + "CmbStatus").value
        + "&SortExpression=" + document.getElementById(MasterObj + "txtSortExpression").value
        + "&CompanyFinatialPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value
        + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
       
           var DialogProperty = "dialogHeight:700px;dialogWidth:1100px;center: Yes;help: no;status: no;resizable=1"
           returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);

       }
       
   </script>
</asp:Content>


