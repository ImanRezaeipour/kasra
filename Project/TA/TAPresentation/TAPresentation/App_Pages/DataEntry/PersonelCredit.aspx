<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="PersonelCredit.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.PersonelCredit" ValidateRequest="false" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <table>
   <tr>
   <td>
       <uc1:ToolBar ID="OToolBar" runat="server" PageName="PersonelCredit.aspx"  />
       
       <asp:ScriptManager ID="ScriptManager1" runat="server">
       </asp:ScriptManager>

       <script type="text/javascript" language="javascript">

           Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
           function BeginRequestHandler(sender, args) {
               document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
           }

           function EndRequestHandler(sender, args) {
               document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
               LastSelectedRow = null;
               var StrVal = $get(MasterObj + "txtSubmit").value

               if ($get(MasterObj + "txtAlert").value != "") {
                   alert($get(MasterObj + "txtAlert").value);
               }
               $get(MasterObj + "txtSubmit").value = "";
               $get(MasterObj + "txtAlert").value = "";

           }
       </script>
   </td>
   </tr>
   <tr><td  align="center" width="700"> 
   <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:HiddenField ID="txtSDate" runat="server" />
            <asp:HiddenField ID="txtEDate" runat="server" />
            <asp:HiddenField ID="txtAlert" runat="server" />
            <asp:HiddenField ID="txtOrderString" runat="server" />
            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
   </td></tr>
   <tr><td>
  <div style="display: none">
  <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection" runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtpersonID" runat="server" />
                    <input type="text" id="txtStartDate" runat="server" />
                    <input type="text" id="txtEndDate" runat="server" />
                    <input type="text" id="txtGrdpersonID" runat="server" />
                    <input type="text" id="txtGrdStartDate" runat="server" />
                    <input type="text" id="txtGrdEndDate" runat="server" />
                    <input type="text" id="txtCreditID" runat="server" />
                    <input type="text" id="txtXmlWfLog2" runat="server" />
                    <input id="txtSaveXml" type="text" name="txtSaveXml" runat="server" />
  </div> 
   </td></tr>
    </table>
    <script language="javascript" type="text/javascript">
            
            var LastSelectedRow = null;
            var LastSelectedRowClass = "";
            var oGrid = document.getElementById("GrdPersonelCredit")
            
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
            function OnClickBtnDel() {
                if (LastSelectedRow != null) {
                        var Msg = "آيا براي حذف مطمئنيد؟"
                        if (confirm(Msg) == true) {
                            document.getElementById(MasterObj + "txtGrdpersonID").value =document.getElementById(MasterObj + "txtpersonID").value  
                            document.getElementById(MasterObj + "txtGrdStartDate").value = LastSelectedRow.cells(3).innerText
                            document.getElementById(MasterObj + "txtGrdEndDate").value = LastSelectedRow.cells(4).innerText
                            document.getElementById(MasterObj + "txtCreditID").value = LastSelectedRow.CreditID
                            document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                            document.getElementById(MasterObj + "BtnSubmit").click();
                        }
                    }
                else {
                    alert("به منظور حذف يک سطر را انتخاب کنيد")
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function onClickGardeshCredit(obj) {
                var oRow = window.event.srcElement.parentElement.parentElement.rowIndex
                var oGrid = document.getElementById("GrdPersonelCredit")
                var CreditID = oGrid.rows(oRow).CreditID
                var DocId = 0
                var WFDocId = 0
                DocId = CreditID
                var xmlStr = document.getElementById(MasterObj + "txtXmlWfLog2").value
                root = '/DataEntryEntity/WFLog'
                newrowindex = 0
                if (xmlStr == "")
                    xmlStr = "<DataEntryEntity></DataEntryEntity>"
                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(xmlStr);
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[DocId=" + DocId + "]");
                if (xmlNodes.length != 0)
                    WFDocId = xmlNodes.item(0).selectSingleNode('WFDocId').text
                window.showModalDialog("/TA/TAPeresentation/Pages/Reports/FlowDoc.aspx?WFDocId=" + WFDocId + "&DocId=" + DocId, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function ModifyXMLCredit(obj) {
                var TbObj = obj.parentElement.parentElement.parentElement;
                if (TbObj.tagName != "Table")
                    TbObj = obj.parentElement.parentElement.parentElement.parentElement;
                var RowIndex = obj.parentElement.parentElement.rowIndex;
                var CellIndex = obj.parentElement.cellIndex;
                var SaveXml = $get(MasterObj + "txtSaveXml").value;

                if (SaveXml == "") {
                    SaveXml = '<Root>' + MakeXML(TbObj, RowIndex, CellIndex) + "</Root>"
                }
                else if (SaveXml != "") {
                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(SaveXml);


                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[RowIndex=" + RowIndex + " and PersonCode='" + $get(MasterObj + "txtpersonID").value + "']");

                    if (oXmlNodes.length == 0) {
                        if (TbObj.rows(RowIndex).cells(8).firstChild.value != "0") {
                            SaveXml = SaveXml.replace("</Root>", MakeXML(TbObj, RowIndex, CellIndex) + "</Root>")
                        }
                    }

                    else if (oXmlNodes.length != 0) {
                        oXmlNodes.item(0).selectSingleNode("StartTime").text = TbObj.rows(RowIndex).cells(5).firstChild.value;
                        oXmlNodes.item(0).selectSingleNode("EndTime").text = TbObj.rows(RowIndex).cells(6).firstChild.value;
                        oXmlNodes.item(0).selectSingleNode("CreditType").text = TbObj.rows(RowIndex).cells(8).firstChild.value
                        oXmlNodes.item(0).selectSingleNode("Des").text = TbObj.rows(RowIndex).cells(9).firstChild.value;
                        SaveXml = oXmlDoc.xml;
                    }
                }
                $get(MasterObj + "txtSaveXml").value = SaveXml;
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!        
            function MakeXML(TbObj, RowIndex, CellIndex) {
                var SaveXml = "";
                var SDate = '',EDate='';
                var Year = '';
                var Month = '';
                var Day = '';

                Year = TbObj.rows(RowIndex).cells(3).innerText.substring(6, 8);
                Month = TbObj.rows(RowIndex).cells(3).innerText.substring(3, 5);
                Day = TbObj.rows(RowIndex).cells(3).innerText.substring(0, 2);
                SDate = Day + "/" + Month + "/" + "13" + Year
                Year = TbObj.rows(RowIndex).cells(4).innerText.substring(6, 8);
                Month = TbObj.rows(RowIndex).cells(4).innerText.substring(3, 5);
                Day = TbObj.rows(RowIndex).cells(4).innerText.substring(0, 2);
                EDate = Day + "/" + Month + "/" + "13" + Year

                SaveXml += "<Tb>"
                SaveXml += "<RowIndex>" + RowIndex + "</RowIndex>"
                SaveXml += "<PersonCode>" + $get(MasterObj + "txtpersonID").value + "</PersonCode>"
                SaveXml += "<Type>" + TbObj.rows(RowIndex).MainTypeID + "</Type>"
                SaveXml += "<StartDate>" + TbObj.rows(RowIndex).cells(3).innerText + "</StartDate>"
                SaveXml += "<EndDate>" + TbObj.rows(RowIndex).cells(4).innerText + "</EndDate>"
                SaveXml += "<CreditType>" + TbObj.rows(RowIndex).cells(8).firstChild.value + "</CreditType>"
                SaveXml += "<CreditID>" + TbObj.rows(RowIndex).CreditID + "</CreditID>"
                SaveXml += "<Des>" + TbObj.rows(RowIndex).cells(9).firstChild.value + "</Des>"
                
                if (TbObj.rows(RowIndex).cells(5).firstChild.value == '00:00' && TbObj.rows(RowIndex).cells(6).firstChild.value == '00:00') {

                    SaveXml += "<Daily>1</Daily>"
                    SaveXml += "<StartTime>00:00</StartTime>"
                    SaveXml += "<EndTime>00:00</EndTime>"
                }
                else {
                    SaveXml += "<Daily>2</Daily>"
                    SaveXml += "<StartTime>" + TbObj.rows(RowIndex).cells(5).firstChild.value + "</StartTime>"
                    SaveXml += "<EndTime>" + TbObj.rows(RowIndex).cells(6).firstChild.value + "</EndTime>"
                }

                SaveXml += "<Des>" + TbObj.rows(RowIndex).cells(9).firstChild.value + "</Des>"
                SaveXml += "<PersonID>" + $get(MasterObj + "txtpersonID").value + "</PersonID>"
                SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
                SaveXml += "</Tb>"
                return SaveXml;
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnCancel() {
                window.close()
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnSave() {
                
                if (checkNotEmpty() == true) {
                    //alert($get(MasterObj + "txtSaveXml").value)
                    document.getElementById(MasterObj + "txtSubmit").value = "Save";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function GetTime(minute) {

                var hour = minute / 60
                hour = parseInt(hour, 10)
                var min = minute % 60
                min = parseInt(min, 10)
                var time = ""
                if (hour < 10) {
                    time = "0" + hour + ":"
                }
                else {
                    time = hour + ":"
                }
                if (min < 10) {
                    time += "0" + min
                }
                else {
                    time += min
                }
                return time
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function GetMinute(time) {
                if (time == "")
                    return 0
                var arr
                arr = time.split(":")
                arr[0] = parseInt(arr[0], 10)
                arr[1] = parseInt(arr[1], 10)
                return (arr[0] * 60 + arr[1])
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function onfocusTxtTime(obj) {
                lastValue = obj.value
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function checkNotEmpty() {
                var TbObj = document.getElementById("GrdCredit")
                var SaveXml = $get(MasterObj + "txtSaveXml").value;

                if (SaveXml != "") {
                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(SaveXml);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");

                    for (var i = 0; i < oXmlNodes.length; i++) {
                        var RowIndex = parseInt(oXmlNodes.item(0).selectSingleNode("RowIndex").text)
                        if (oXmlNodes.item(0).selectSingleNode("StartTime").text > oXmlNodes.item(0).selectSingleNode("EndTime").text) {
                            alert("زمان شروع بايد کوچکتر از زمان خاتمه باشد")
                            TbObj.rows(RowIndex).cells(1).firstChild.focus()
                            return false
                        }
                        else if (oXmlNodes.item(0).selectSingleNode("CreditType").text == "0") {
                            alert(" لطفا نوع مجوز را انتخاب نماييد")
                            TbObj.rows(RowIndex).cells(8).firstChild.focus()
                            return false
                        }
                    }
                }
                else {
                    alert("هيچ آيتمی جهت ذخيره انتخاب نشده")
                    return false
                }
                return true;
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
    
</asp:Content>


