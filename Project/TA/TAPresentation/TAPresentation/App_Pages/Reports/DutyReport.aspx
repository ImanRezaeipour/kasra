<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="DutyReport.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.DutyReport" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="1000px" style="border: medium groove #C0C0C0; background-color: #DBE3F0;
        height: 95%" cellspacing="2">
        <tr>
            <td style="width: 80px">
                 پرسنلی :
            </td>
            <td>
                <uc4:ComboBox ID="CmbPerson" runat="server" />
            </td>
            <td>
                نوع مجوز
            </td>
            <td>
                <div align="right">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <asp:HiddenField ID="ShouldBeOpen" runat="server" />
                            <select id="CmbCreditType" runat="server" name="CmbCreditType" style="width: 190px"
                                class="TxtControls">
                                <option></option>
                            </select>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </td>
            <td>
                شماره سريال:               
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <div align="right">
                            <input id="txtSerialCode" type="text" class="TxtControls" style="width: 120px" runat="server"
                                 /></div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            </tr>
            <tr>
            <td>
                از تاريخ :
            </td>
            <td>
                <div align="right">
                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                </div>
            </td>
            <td align="right">
                تا تاريخ :
            </td>
            <td>
                <div align="right">
                    <uc3:KCalendar ID="KCalEDate" runat="server" />
                </div>
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td align="center" colspan="8">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center" style="width:40%">
             <fieldset dir="rtl" style="width: 100%; height: 380px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">ليست مجوزهاي ماموريت برون شهري روزانه</legend>
                <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                    scrollbar-base-color: #b0c4de; height:380px;">
                   
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                     </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>                     
                </div>
                 </fieldset>
            </td>        
            <td id="DownRow" colspan="5" align="center" style="width:60%">
                <fieldset dir="rtl" style="width: 100%; height: 380px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">آيتم هاي گزارش</legend>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <div id="DivExtended" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 380px;">
                                <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                <asp:HiddenField ID="txtFirstTagName" runat="server" />
                                <asp:HiddenField ID="txtXMLCmbCredite" runat="server" />
                                <asp:HiddenField ID="txtSubmit" runat="server" />                                
                                <asp:HiddenField ID="txtSaveXml" runat="server" />
                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                <asp:HiddenField ID="txtSearch" runat="server" />
                                <asp:HiddenField ID="txtTempSearch" runat="server" />
                                <asp:HiddenField ID="txtTmpPersonCode" runat="server" />
                                <asp:HiddenField ID="SearchRowIndex" runat="server" />
                                <asp:HiddenField ID="txtHokmID" runat="server" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">      
    <input type="text" id="txtXml" name="txtXml" runat="server" /> 
        <input type="text" id="txtCreditID" name="txtCreditID" runat="server" />
        <input type="text" id="txtPCode" name="txtPCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
        <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
        <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
        <asp:HiddenField ID="txtCodeID" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtTmpPersonID" name="txtTmpPersonID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtExSaveXml" name="txtSubmit" runat="server" />
        <input type="text" id="txtXmlGrid" name="txtSubmit" runat="server" />
        <input type="text" id="txtVCredit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtFieldValue" name="txtFieldValue" runat="server" />
        <input type="text" id="txtXmlRegisterDetail" name="txtXmlRegisterDetail" runat="server" />
        <input type="text" id="txtModifyFlag" name="txtModifyFlag" runat="server" />
        <input type="text" id="txtExtended" name="txtExtended" runat="server" />  
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />   
        <input type="text" id="txtStatusId" name="txtStatusId" runat="server" />            
    </div>
    

    <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var IsChanged = false;
        var heightGeneral;
        var SaveNewFlag = 0;
        document.dir = "rtl";
        //**************************************EndDeclaration*****************************************       
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
            $get(MasterObj + "txtAlert").value = "";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                alert($get(MasterObj + "txtAlert").value)
            }
                   if (StrVal == "ShouldBeOpen") {
                       IsChanged = false;
                       if (document.getElementById(MasterObj + "XmlSERIALCODE") != null) {
                           document.getElementById(MasterObj + "XmlSERIALCODE").value = LastSelectedRow.cells(1).firstChild.innerText;
                           document.getElementById(MasterObj + "XmlSERIALCODE").disabled = true;
                       }      
            }           
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            SaveFlagNew = 0;
        }
        //================================================================
        function save() {
            var xmlStr;
            var sDate = LastSelectedRow.cells(3).firstChild.innerText;
            var eDate = LastSelectedRow.cells(4).firstChild.innerText;
//            SaveXml += "<ModifyCreditInput>"
//            SaveXml += "<Type>" + Body.rows(RowIndex).CodeGroupID + "</Type>"
//            SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
//            SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
//            SaveXml += "<CreditType>" + Body.rows(RowIndex).cells(9).firstChild.value + "</CreditType>"
//            if (Body.rows(RowIndex).cells(6).firstChild.value == '00:00' && Body.rows(RowIndex).cells(7).firstChild.value == '00:00') {

//                        
//                SaveXml += "<StartTime>00:00</StartTime>"
//                SaveXml += "<EndTime>00:00</EndTime>"
//                SaveXml += "<Daily>1</Daily>"
//                        
//            }
//            else {
//                SaveXml += "<StartTime>" + Body.rows(RowIndex).cells(6).firstChild.value + "</StartTime>"
//                SaveXml += "<EndTime>" + Body.rows(RowIndex).cells(7).firstChild.value + "</EndTime>"
//                SaveXml += "<Daily>2</Daily>"
//                        
//            }

//            SaveXml += "<Des>" + Body.rows(RowIndex).cells(10).firstChild.value + "</Des>"
////                    SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
//            SaveXml += "<CreditID>0</CreditID>"
//            SaveXml += "<RowIndex>" + (parseInt(RowIndex, 10)) + "</RowIndex>"
//            SaveXml += "<JPersonelID>0</JPersonelID>"
//            //SaveXml += "<PersonCode>" + Body.rows(RowIndex).cells(4).innerText + "</PersonCode>"
//                    
//            SaveXml += "<MID>" + Body.rows(RowIndex).PersonelID + "</MID>"
//            SaveXml += "<MType>U</MType>";
////                    if (((GridSDate != GridEDate && Body.rows(RowIndex).cells(7).firstChild.value < Body.rows(RowIndex).cells(6).firstChild.value)))
////                        SaveXml += "<_Flags>1</_Flags>";
//            SaveXml += "</ModifyCreditInput>"
//        }

//    }
//    SaveXml += "</ReportsEntity>"
            xmlStr = "<ReportsEntity><ModifyCreditInput>";
            xmlStr = xmlStr + "<Type>25</Type>";
            xmlStr = xmlStr + "<StartDate>" + sDate + "</StartDate>";
            xmlStr = xmlStr + "<EndDate>" + eDate + "</EndDate>";
            xmlStr = xmlStr + "<CreditType>" + document.getElementById(MasterObj + "CmbCreditType").value + "</CreditType>";
            xmlStr = xmlStr + "<StartTime>00:00</StartTime>";
            xmlStr = xmlStr + "<EndTime>00:00</EndTime>";
            xmlStr = xmlStr + "<Daily>1</Daily>";
            xmlStr = xmlStr + "<Des></Des>";

            if (document.getElementById(MasterObj + "txtFieldValue").value == "")
                document.getElementById(MasterObj + "txtFieldValue").value = "0";
            document.getElementById(MasterObj + "txtFieldValue").value = document.getElementById(MasterObj + "txtFieldValue").value == "undefined" ? "0" : document.getElementById(MasterObj + "txtFieldValue").value;
            xmlStr = xmlStr + "<CreditID>" + document.getElementById(MasterObj + "txtFieldValue").value + "</CreditID>";
            xmlStr = xmlStr + "<RowIndex>0</RowIndex>";
            xmlStr = xmlStr + "<JPersonelID>0</JPersonelID>";
            xmlStr = xmlStr + "<MID>" + LastSelectedRow.cells(2).firstChild.innerText + "</MID>";
            xmlStr = xmlStr + "<MType>U</MType>";
            xmlStr = xmlStr + "<Extended></Extended>";
            xmlStr = xmlStr + "<SerialNo>" + LastSelectedRow.cells(1).firstChild.innerText + "</SerialNo>";
            
            //xmlStr = xmlStr + "<UserPersonelID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</UserPersonelID>";

            
            xmlStr = xmlStr + "</ModifyCreditInput></ReportsEntity>";
            document.getElementById(MasterObj + "txtXml").value = xmlStr;           
        }
        //==================================================================
        function SaveExtendedCode() {
            var StrXml = "";
            var OExGrid = DivExtended.firstChild;
            if (OExGrid.rows.length > 0) {
                StrXml = "<" + document.getElementById(MasterObj + "txtFirstTagName").value + ">";

                for (var i = 0; i < OExGrid.rows.length; i++) {
                    if (OExGrid.rows(i).cells(0).firstChild.tagName != "FIELDSET") {
                        if (OExGrid.rows(i).cells(1) != null)
                            if (OExGrid.rows(i).cells(1).firstChild != null) {
                            if (CheckValidData(OExGrid.rows(i).cells(1), OExGrid.rows(i).cells(0).firstChild.innerText)) {
                                StrXml = StrXml + "<" + OExGrid.rows(i).cells(1).Tag + ">" + GetData(OExGrid.rows(i).cells(1).firstChild) + "</" + OExGrid.rows(i).cells(1).Tag + ">"
                            }
                            else return false;
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

                document.getElementById(MasterObj + "txtExSaveXml").value = StrXml;
            }
            return true;
        }
        //*******************************************************************************
        function GetData(Obj) {
            if (Obj.tagName == "SCRIPT")
                return eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtYear').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtMonth').value") + "/" + eval("document.getElementById(MasterObj+'Xml" + Obj.parentElement.Tag + "_txtDay').value");
            else if (Obj.tagName == "INPUT") {
                if (Obj.getAttribute("type") == "checkbox")
                    return Obj.checked ? "1" : "0";
            }
            return Obj.value;
        }
        //===============================================================================        
        function CheckValidData(Obj, Caption) {

            if (Obj.Require == "True") {
                if (Obj.firstChild.value == "") {
                    alert(Caption + " را وارد کنيد");
                    return false;
                }
            }
            return true;
        }
        //===============================================================================
        function OnClickBtnSave() {           
                if (SaveExtendedCode()) {
                    save();
                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }        
        //=================================================================
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtPersonCodeSearch").value = document.getElementById(MasterObj + "CmbPerson_txtCode").value;
            document.getElementById(MasterObj + "txtCodeID").value = document.getElementById(MasterObj + "txtSerialCode").value;
            document.getElementById(MasterObj+"SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            if (document.getElementById(MasterObj + "SDate").value == "//") document.getElementById(MasterObj + "SDate").value = "";
            if (document.getElementById(MasterObj + "EDate").value == "//") document.getElementById(MasterObj + "EDate").value = "";
            document.getElementById(MasterObj + "txtCreditType").value = document.getElementById(MasterObj + "CmbCreditType").value;
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //==========================================================
        function onclickGrd(SelectedRow) {
            if (LastSelectedRow != null)
                LastSelectedRow.className = LastSelectedRowClass
            LastSelectedRowClass = SelectedRow.className
            LastSelectedRow = SelectedRow
            SelectedRow.className = "CssSelectedItemStyle"
            document.getElementById(MasterObj + "txtFieldValue").value = LastSelectedRow.CreditID;               
        }
        //========================================================
        function ondblclickGrd(Obj) {
            document.getElementById(MasterObj + "txtCreditID").value = LastSelectedRow.CreditID;
            document.getElementById(MasterObj + "txtSubmit").value = "ShouldBeOpen";
            document.getElementById(MasterObj + "BtnSubmit2").click();
        }
        //=====================================================
        function onclickDefineDuty(obj) {           
            var url = "../Reports/DefineDutyCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&TableName=" + obj.parentElement.getAttribute("TableName")
            + "&FieldName=" + obj.parentElement.getAttribute("FieldName")
            + "&FieldValue=" + obj.parentElement.cells(1).firstChild.innerText
            + "&StatusId=" + obj.parentElement.getAttribute("HokmID")
            + "&ModifyFlag=0";
            var DialogProperty = "dialogHeight:550px;dialogWidth:750px;center: Yes;help: no;status: no"
            
            window.showModalDialog(encodeURI(url), "", DialogProperty);
        }
    </script>

</asp:Content>
