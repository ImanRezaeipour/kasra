<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" CodeBehind="Scheduling.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Scheduling.Scheduling" ValidateRequest="false" %>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc2" %>
<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">
       var MasterObj = "ctl00_ContentPlaceHolder1_";
       /////-------------------------------------------
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <script type="text/javascript" language="javascript">
     window.document.title = "زمانبندی"
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     function BeginRequestHandler(sender, args) {
         
     }

     function EndRequestHandler(sender, args) {
         
       
         LastSelectedRow = "";
         var StrVal = $get(MasterObj + "txtSubmit").value
         FirstDo();   
         if (StrVal != "") {
             LastSelectedRow = "";
             if (document.getElementById(MasterObj + "txtMode").value == "BankBackup") {
                if(document.getElementById('OToolBar_AssignToCardReader')!=null)
                 document.getElementById('OToolBar_AssignToCardReader').style.visibility = "hidden";                
                     ShowCheckInNewPage();
             }
             
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

             /*if (document.getElementById(MasterObj + "txtAlert").value == "-1" &
             StrVal == "Save")
             alert("اين دوره داراي تلاقي با ساير دوره ها مي باشد")
             else if (document.getElementById(MasterObj + "txtAlert").value == "-2" &
             StrVal == "Save")
             alert("ايجاد گپ بين آخر دوره قبل و اول اين دوره")
             else if (document.getElementById(MasterObj + "txtAlert").value == "-3" &
             StrVal == "Save")
             alert("ايجاد گپ بين آخر اين دوره و اول دوره بعد")         
             else if (document.getElementById(MasterObj + "txtAlert").value == "-1" &
             StrVal == "Delete") 
             alert("اين دوره استفاده شده")
             else*/

             SetMsg(document.getElementById(MasterObj + "txtAlert").value)


         }
         $get(MasterObj + "txtSubmit").value = "";
         $get(MasterObj + "txtAlert").value = "";
         var OGrid = $get("GrdScheduling");
         if (OGrid != null) {
             for (var i = 1; i < OGrid.rows.length; i++) {
                 if (OGrid.rows[i].PeriodTypeID == 2) {
                     var array;
                     var str = OGrid.rows[i].WeekDay
                     str = str.substr(0, str.length - 1);
                     array = str.split(',');
                     OGrid.rows(i).cells(7).innerText = ""
                     for (var j = 0; j < array.length; j++) {
                         if (array[j] == 0)
                             OGrid.rows(i).cells(7).innerText += "شنبه" + ","
                         if (array[j] == 1)
                             OGrid.rows(i).cells(7).innerText += "یکشنبه" + ","
                         if (array[j] == 2)
                             OGrid.rows(i).cells(7).innerText += "دوشنبه" + ","
                         if (array[j] == 3)
                             OGrid.rows(i).cells(7).innerText += "سه شنبه" + ","
                         if (array[j] == 4)
                             OGrid.rows(i).cells(7).innerText += "چهار شنبه" + ","
                         if (array[j] == 5)
                             OGrid.rows(i).cells(7).innerText += "پنج شنبه" + ","
                         if (array[j] == 6)
                             OGrid.rows(i).cells(7).innerText += "جمعه" + ","
                     }


                 }

             }
         }
     }
     
   </script>      
 <table style="width: 89%">
        <tr>
            <td align="center">
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: lightblue">آيتم هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                &nbsp;&nbsp;
                            </td>
                            <td>
                                تاريخ شروع:
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalGrdSDate" runat="server" />
                            </td>
                            <td>
                                تاريخ خاتمه:
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalGrdEDate" runat="server" />
                            </td>
                            <td>
                                نوع محدوده:
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbPeriodType" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" height: 400px" align="center" valign="top" >
             <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="height: 339px; position: fixed; top: 10px; right: 484px;" align="center">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtCodePermision" runat="server" />
                        <asp:HiddenField ID="txtSchedulingID" runat="server" />
                        <input type="text" id="txtMode" name="txtMode" runat="server" style="display:none;"/>
                        <input type="text" id="txtXmlSchedule" name="txtXmlSchedule" runat="server" style="display:none;"/>
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
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
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
        <input type="text" id="txtSearch" name="txtSearch" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSaveXML" name="txtSaveXML" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <asp:HiddenField ID="CurPage" runat="server" />
    </div>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>
    <script language="javascript">

        //*************************************Declaration*************************************
        var str = "";
        var XmlStr = "<Root></Root>";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var PersonCode = "0";
        var LastSelectedRow = "";
        var ScheduligIDTmp = "0";
        var OGrid = document.getElementById("GrdScheduling");
        if (document.getElementById(MasterObj + "txtMode").value != "BankBackup") {
            if (document.getElementById('OToolBar_BtnOK') != null)
                document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
            HideAllChecked();
        }
        else {
            if(document.getElementById('OToolBar_AssignToCardReader')!=null)
            document.getElementById('OToolBar_AssignToCardReader').style.visibility = "hidden";
            XmlStr = document.getElementById(MasterObj + "txtXmlSchedule").value;
            if (XmlStr == "") XmlStr = "<Root></Root>";
            ShowCheckInNewPage();
        }
        onload()
        function onload() {
            if (document.getElementById(MasterObj + "txtMode").value == "ReportPolicy") {
                ScheduligIDTmp = document.getElementById(MasterObj + "txtSchedulingID").value
                document.getElementById('OToolBar_BtnOK').style.visibility = "visible";
//                document.getElementById('OToolBar_BtnEdit').style.display = "none";
            }
            if (document.getElementById(MasterObj + "txtSchedulingID").value != "" && document.getElementById(MasterObj + "txtSchedulingID").value != "0") {
                var oGrd = document.getElementById("GrdScheduling")
                if (oGrd) {
                    var len = oGrd.rows.length
                    if(len==2)
                        OnClickGrd(oGrd.rows(1))
                }                
            }
        }
        function FirstDo() {            
            var OGrid = document.getElementById("GrdScheduling");           
            if (document.getElementById(MasterObj + "txtMode").value != "BankBackup") {
                if (document.getElementById('OToolBar_BtnOK') != null)
                    document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
                HideAllChecked();
            }
            else
                if (document.getElementById('OToolBar_AssignToCardReader') != null)
                    document.getElementById('OToolBar_AssignToCardReader').style.visibility = "hidden";
            if (document.getElementById(MasterObj + "txtMode").value == "ReportPolicy") {
                document.getElementById('OToolBar_BtnOK').style.visibility = "visible";
            }
        }
        function onclickCHK(Obj) {        
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(XmlStr);
            var oXmlNodes = oXmlDoc.documentElement.selectSingleNode("Schedul[SC=" + Obj.parentNode.parentNode.getAttribute("SchedulingID") + "]");
            if (Obj.checked == true) {
                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";
                    oXml.loadXML("<Root><Schedul><SC>" + Obj.parentNode.parentNode.getAttribute("SchedulingID") + "</SC></Schedul></Root>");
                    var XmlNode = oXml.documentElement.selectNodes("Schedul[SC=" + Obj.parentNode.parentNode.getAttribute("SchedulingID") + "]");
                    oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));
                }
            }
            else {
                if (oXmlNodes != null) {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);                   
                }
            }
            XmlStr= oXmlDoc.xml;                   
        } 
        //*************************************EndDeclaration*************************************
        function ShowCheckInNewPage() {
            var OGrid = document.getElementById("GrdScheduling")            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML(XmlStr)            
            for (var i = 0; i < OGrid.rows.length-1; i++) {                    
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("Schedul[SC=" + OGrid.rows(i).getAttribute("SchedulingID") + "]")
                if (oXmlNodes.length != 0)
                    OGrid.rows(i).cells(0).firstChild.checked = true
            }            
        }
        //*************************************OnLoad*************************************    
        if (OGrid != null) {
            for (var i = 1; i < OGrid.rows.length; i++) {
                if (OGrid.rows[i].PeriodTypeID == 2) {
                    var array, str = OGrid.rows[i].WeekDay
                    str = str.substr(0, str.length - 1);
                    array = str.split(',');
                    OGrid.rows(i).cells(7).innerText = ""
                    for (var j = 0; j < array.length; j++) {
                        if (array[j] == 0)
                            OGrid.rows(i).cells(7).innerText += "شنبه" + ","
                        if (array[j] == 1)
                            OGrid.rows(i).cells(7).innerText += "یکشنبه" + ","
                        if (array[j] == 2)
                            OGrid.rows(i).cells(7).innerText += "دوشنبه" + ","
                        if (array[j] == 3)
                            OGrid.rows(i).cells(7).innerText += "سه شنبه" + ","
                        if (array[j] == 4)
                            OGrid.rows(i).cells(7).innerText += "چهار شنبه" + ","
                        if (array[j] == 5)
                            OGrid.rows(i).cells(7).innerText += "پنج شنبه" + ","
                        if (array[j] == 6)
                            OGrid.rows(i).cells(7).innerText += "جمعه" + ","
                    }
                }
            }
        }        
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

        //*************************************Toolbar*************************************
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtSchedulingID").value = "0";
            url = "SchedulingNew.aspx?SchedulingID=0" + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:590px;dialogWidth: 800px;center: Yes;help: no;status: no")

            document.getElementById(MasterObj + "txtSubmit").value = "Const";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (document.getElementById(MasterObj + "txtSchedulingID").value != ""
                    & document.getElementById(MasterObj + "txtSchedulingID").value != "0") {
                var Strconfirm ="آيا از حذف مطمئنيد؟"
                if (confirm(Strconfirm)) {
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("ابتدا يک سطر انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            document.getElementById(MasterObj + "txtSchedulingID").value="0"
            SetSearchStr()
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {

            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            LastSelectedRow = "";
            document.getElementById(MasterObj + "txtSchedulingID").value = "0"
            $get(MasterObj + "KCalGrdSDate_txtDay").value = '';
            $get(MasterObj + "KCalGrdSDate_txtMonth").value = '';
            $get(MasterObj + "KCalGrdSDate_txtYear").value = '';

            $get(MasterObj + "KCalGrdEDate_txtDay").value = '';
            $get(MasterObj + "KCalGrdEDate_txtMonth").value = '';
            $get(MasterObj + "KCalGrdEDate_txtYear").value = '';
            
            $get(MasterObj + "CmbPeriodType").value = "0";

            document.getElementById(MasterObj + "txtSearch").value = "<Root><Tb></Tb></Root>"
            
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetSearchStr() {
            LastSelectedRow = "";
            var str = ""
            var SDate = $get(MasterObj + "KCalGrdSDate_txtYear").value + '/' + $get(MasterObj + "KCalGrdSDate_txtMonth").value + '/' + $get(MasterObj + "KCalGrdSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalGrdEDate_txtYear").value + '/' + $get(MasterObj + "KCalGrdEDate_txtMonth").value + '/' + $get(MasterObj + "KCalGrdEDate_txtDay").value;
            str += "<Root><Tb>"
            str += "<SDate>" + ((SDate=='//')? '':SDate) + "</SDate>"
            str += "<EDate>" + ((EDate=='//')? '':EDate) + "</EDate>"
            str += "<PeriodTypeID>" + $get(MasterObj + "CmbPeriodType").value + "</PeriodTypeID>"
            str += "</Tb></Root>"
            document.getElementById(MasterObj + "txtSearch").value = str
        }
        //*************************************ThisPage***************************************
        function OnClickBtnEdit() {
            OndbClickGrd();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPersonName() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPersonName").value
            if (document.getElementById(MasterObj + "CmbPersonName").value == 0)
                document.getElementById(MasterObj + "txtPersonCode").value = ""
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonCode() {
            document.getElementById(MasterObj + "CmbPersonName").value = document.getElementById(MasterObj + "txtPersonCode").value
            if (document.getElementById(MasterObj + "txtPersonCode").value == "" || document.getElementById(MasterObj + "txtPersonCode").value == "0")
                document.getElementById(MasterObj + "CmbPersonName").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonName() {
            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                document.getElementById(MasterObj + "txtPersonCode").value = ""
                document.getElementById(MasterObj + "CmbPersonName").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != "") {
                if (LastSelectedRow % 2 == 1)
                    SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).className = "CssItemStyle"
                else
                    SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).className = "CssAlternatingItemStyle"
            }
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtSchedulingID").value = SelectedRow.SchedulingID;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            url = "SchedulingNew.aspx?SchedulingID=" + document.getElementById(MasterObj + "txtSchedulingID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            if (ScheduligIDTmp==document.getElementById(MasterObj + "txtSchedulingID").value)
                url  +="&Mode=" + document.getElementById(MasterObj + "txtMode").value 

            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 590px;dialogWidth: 800px;center: Yes;help: no;status: no")
            document.getElementById(MasterObj + "txtSchedulingID").value="0"
            document.getElementById(MasterObj + "txtSubmit").value = "Const";
            document.getElementById(MasterObj + "BtnSubmit").click();        
            //document.getElementById(MasterObj + "BtnSubmitSearch").click();
        }
        //
        function  OnClickBtnCancel() {
            if (document.getElementById(MasterObj + "txtMode").value == "BankBackup") {
                window.returnValue = "0#";
            }
        window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickAssignToCardReader() {        
            if (LastSelectedRow == "") { 
            alert("لطفا یک سطر را انتخاب نمایید")
            }
            else {                
                url = "../CardReader/AssignSchedulingToCardReader.aspx" + "?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SchedulingID=" + document.getElementById(MasterObj + "txtSchedulingID").value
                returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no")
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function HideAllChecked() {
            var OGrid = document.getElementById("GrdScheduling")
            if (OGrid != null) {
                for (var i = 0; i < OGrid.rows.length; i++) {
                    OGrid.rows(i).cells(0).style.display = "none";
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOK() {
            if (document.getElementById(MasterObj + "txtMode").value == "ReportPolicy") {
                window.returnValue = document.getElementById(MasterObj + "txtSchedulingID").value
            }
            else {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML("<Root/>");
                if (XmlStr == "<Root></Root>" || oXmlDoc.xml == XmlStr)
                    XmlStr = "";
                window.returnValue = "1#" + XmlStr;               
            }
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnView() {
            url = "../CardReader/AssignSchedulingToCardReaderNew.aspx" + "?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value
             + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&ModalFlag=1";
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 750px;dialogWidth:800px;center: Yes;help: no;status: no")
        }
      </script>
     
</asp:Content>

