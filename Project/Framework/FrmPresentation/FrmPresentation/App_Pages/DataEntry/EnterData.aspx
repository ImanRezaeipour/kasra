<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterData.aspx.cs" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" Inherits="FrmPresentation.App_Pages.DataEntry.EnterData" validateRequest="false"%>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title></title>
<style type="text/css">
.CssItemStyle /*برای CssItemStyle در PageGrid*/
        {
            
            direction: rtl;
           
            border-top-style: groove;
            border-right-style: groove;
            border-left-style: groove;
            background-color: #d5e1fd;
            border-bottom-style: groove;
        }
    .CssAlternatingItemStyle /*برای CssAlternatingItemStyle در PageGrid*/
        {
            
            direction: rtl;
            
            direction: rtl;
            background-color: OldLace;
        }     
        .CssSelectedItemStyle /*استایل کلیک روی گرید*/
        {
           
            direction: rtl;
           
            direction: rtl;
            background-color: #FFD599;
        }   
        .CssHeaderStyle /*استایل هدر گرید*/
        {
	        border-right: #346fa4 2px solid;
	        border-top: lightsteelblue 2px solid;
	        font-weight: bold;
	        font-size: 10px;
	        border-left: lightsteelblue 2px solid;
	        direction: rtl;
	        border-bottom: #346fa4 2px solid;
	        font-family: 'Tahoma',Tahoma; 
	        background-color: #83afe5;
        }  
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 137px;
    }
    </style>  
    <script language ="javascript" type ="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script> 
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var lastPersonCode = "";
        var lastGrdPersonCode = "";
        var lastGrdGroupCodeID = "";
        var lastGroupCodeID = "";
        //-------------------------------------------
    </script>
    
   <asp:ScriptManager ID="ScriptManager1" runat="server">
   </asp:ScriptManager> 
    
    
    <script type="text/javascript" language="javascript">
        document.dir = "RTL";

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
            $get(MasterObj + "txtAlert").value = "";
            //alert($get(MasterObj + "txtSubmit").value)
        }

        function EndRequestHandler(sender, args) {
            //alert($get(MasterObj + "txtSubmit").value)
            
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal != "") {
                if (StrVal == "Save") {

                    OnChangeCmbBatchEnterDataType($get(MasterObj + 'CmbBatchEnterDataType'))

                    if ($get(MasterObj + "CmbReciveDataType").value == 0 || $get(MasterObj + "CmbReciveDataType").value == "") {
                        OnClickBtnNew()
                    }
                    else {

                        if ($get(MasterObj + "txtCurPage").value == "0") {

                            CreateGrid("Next")

                        }
                        else {
                            CreateGrid("Const")

                        }

                    }

                    if ($get(MasterObj + "txtAlert").value != "") {
                        SetMsg($get(MasterObj + "txtAlert").value);
                    }


                }


            }

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";

        }
        </script>          

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width:100%">
                    <tr>
                        <td align="center">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td align="center" id="tdEnterDataType">
                                        <table width="400px">
                                            <tr>
                                                <td class="style2">
                                                    نوع اطلاعات دريافتي
                                                </td>
                                                <td>
                                                    <select id="CmbBatchEnterDataType" name="CmbBatchEnterDataType" style="width: 200px"
                                                        class="TxtControls" onchange="OnChangeCmbBatchEnterDataType(this)" runat="server">
                                                        <option></option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" dir="ltr">
                                        <table width="400px">
                                            <tr>
                                                <td>
                                                    <select id="CmbReciveDataType" runat="server" dir="rtl" class="TxtControls" name="CmbReciveDataType"
                                                        style="width: 200px">
                                                        <option></option>
                                                    </select>
                                                </td>
                                                <td>
                                                    روش دريافت اطلاعات
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div style="overflow: auto">
                                <table style="width: 100%">
                                    <tr>
                                        <td align="center">
                                            <table id="grdData_Header">
                                                <thead style="display: inline">
                                                </thead>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 400">
                                        <td align="center" valign="top">
                                            <div style="overflow: auto">
                                                <table id="grdData" onclick="OnClickGrdData()">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>  
           
           
               <div style="display:none">
                   <cc1:MySecurity ID="OnLineUser" runat="server">
                   </cc1:MySecurity>
                    <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input id="txtOnLineUser" maxlength="10" runat="server" name="txtOnLineUser" type="text" />                
                    <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
                    <input type="text" id="txtSaveXML" name="txtSaveXML" runat="server" />
                    <input type="text" id="CurDate" name="CurDate" runat="server" />
                    <input type="text" id="txtDelXml" name="txtDelXml" runat="server" />
                    <input type="text" id="txtXmlBatchEnterDataType" name="txtXmlBatchEnterDataType" runat="server" />
                    <input type="text" id="txtXmlBatchEnterDataProperty" name="txtXmlBatchEnterDataProperty" runat="server" />
                    <input type="text" id="txtXmlTextData" name="txtXmlTextData" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtTableName" name="txtTableName" runat="server" />
                    <input type="text" id="txtBatchEnterDataTypeID" name="txtBatchEnterDataTypeID" runat="server" />
                    <input type="text" id="txtBatchEnterDataTypeAcronym" name="txtBatchEnterDataTypeAcronym" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" onclick="BtnSubmit2_Click" />
                    <input id="txtSessionID" maxlength="10" runat="server" name="txtSessionID" type="text" />
                    <asp:HiddenField ID="txtReplacementID" runat="server" />
                    <asp:HiddenField ID="Totalpage" runat="server" />
                    <asp:HiddenField ID="txtAlert" runat="server" />
                    <asp:HiddenField ID="txtCurPage" runat="server" />
                    <asp:HiddenField ID="txtSearch" runat="server" />
                    <asp:HiddenField ID="lblFrom" runat="server" />
                    <asp:HiddenField ID="lblTo" runat="server" />
                    <asp:HiddenField ID="lblTotal" runat="server" />
                    
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>   
          
        
    
    
    </div>    
    <script language="javascript" type="text/javascript">
        document.body.style.overflowX = "hidden";
        document.body.style.overflowY = "hidden";
        //*******************************************************************************************
        var oInterval = "";
        var Counter = 0;
        var TimeCount = 0;
        function fnStartInterval() {
            if (oInterval == "")
                oInterval = window.setInterval("fnRecycle()", 500)
            else {
                fnStopInterval()
            }
        }
        function fnStopInterval() {
            if (oInterval != "") {
                window.clearInterval(oInterval);
                resetVariable()
                resetColor()
            }
        }
        function fnRecycle() {
            if (Counter == 6) {
                Counter = 0;
                TimeCount++;
            }
            else if (TimeCount % 2 == 0) {
                Counter++;
                switch (Counter) {
                    case 1:
                        document.all.item('td1').bgColor = "#ff99cc"
                        break
                    case 2:
                        document.all.item('td2').bgColor = "#ff99cc"
                        break
                    case 3:
                        document.all.item('td3').bgColor = "#ff99cc"
                        break
                    case 4:
                        document.all.item('td4').bgColor = "#ff99cc"
                        break
                    case 5:
                        document.all.item('td5').bgColor = "#ff99cc"
                        break
                    case 6:
                        document.all.item('td6').bgColor = "#ff99cc"
                        break
                }
            }
            else if (TimeCount % 2 != 0) {
                Counter++;
                switch (Counter) {
                    case 1:
                        document.all.item('td1').bgColor = "#ffffff"
                        break
                    case 2:
                        document.all.item('td2').bgColor = "#ffffff"
                        break
                    case 3:
                        document.all.item('td3').bgColor = "#ffffff"
                        break
                    case 4:
                        document.all.item('td4').bgColor = "#ffffff"
                        break
                    case 5:
                        document.all.item('td5').bgColor = "#ffffff"
                        break
                    case 6:
                        document.all.item('td6').bgColor = "#ffffff"
                        break
                }
            }
        }
        function resetVariable() {
            oInterval = "";
            Counter = 0;
            TimeCount = 0
        }
        function resetColor() {
            document.all.item('td1').bgColor = "#ffffff"
            document.all.item('td2').bgColor = "#ffffff"
            document.all.item('td3').bgColor = "#ffffff"
            document.all.item('td4').bgColor = "#ffffff"
            document.all.item('td5').bgColor = "#ffffff"
            document.all.item('td6').bgColor = "#ffffff"
        }
        //*******************************************************************************************
        //*************************************Declaration*************************************
        var LastSelectedRow = ""
        var PageSize = 25;

        var currentPage_X = 0
        var ExcelFilePath = ""
        var HelpFilePath = ""
        //*************************************End Declaration*************************************
        //**************************************OnLoad********************************************
        window.name = "EnterData"
        aspnetForm.target = "EnterData"

        //alert($get(MasterObj + "txtXmlBatchEnterDataProperty").value)
        //alert($get(MasterObj + "txtXmlBatchEnterDataType").value)
        //alert($get(MasterObj + "txtBatchEnterDataTypeAcronym").value)
        if ($get(MasterObj + 'txtBatchEnterDataTypeAcronym').value == "0") {
            document.all.item("tdEnterDataType").style.display = "inline"
        }
        else {
            document.all.item("tdEnterDataType").style.display = "none"
        }
        OnChangeCmbBatchEnterDataType($get(MasterObj + 'CmbBatchEnterDataType'))

        //        if ($get(MasterObj + "CmbReciveDataType").value == 0 || $get(MasterObj + "CmbReciveDataType").value == "") {
        //            OnClickBtnNew()
        //        }
        //        else {

        //            if ($get(MasterObj + "txtCurPage").value == "0") {

        //                CreateGrid("Next")

        //            }
        //            else {
        //                CreateGrid("Const")

        //            }
        //     
        //**************************************End OnLoad********************************************
        //***************************************ToolBar********************************
        function OnClickBtnReciveData() {

            ClearRowGrid(grdData)
            if ($get(MasterObj + 'CmbReciveDataType').value == 1) {
                //"دريافت اطلاعات از clipboard"
                PasteFromClipboard()
            }
            else if ($get(MasterObj + 'CmbReciveDataType').value == 2) {
                //"دريافت اطلاعات از فايل"
                if ($get(MasterObj + 'CmbBatchEnterDataType').value == 0)
                    alert("لطفا نوع اطلاعات دريافتي را انتخاب کنيد");
                else {
                    //--------------------------------------------------------------------------------
                    var oXmlDocT = new ActiveXObject("Microsoft.XMLDOM")
                    oXmlDocT.async = "false";
                    oXmlDocT.loadXML($get(MasterObj + 'txtXmlBatchEnterDataType').value)
                    var xmlNodesT = oXmlDocT.documentElement.selectNodes('/GeneralEntity/Lcombo[ID=' + $get(MasterObj + 'CmbBatchEnterDataType').value + ']')

                    if (xmlNodesT.length != 0) {
                        $get(MasterObj + 'txtTableName').value = xmlNodesT.item(0).selectSingleNode('TableName').text
                        SchemaName = xmlNodesT.item(0).selectSingleNode('Schema').text
                    }
                    var strUrl = "EnterDataFile.aspx?CompanyID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value + "&TableName=" + SchemaName + "." + $get(MasterObj + 'txtTableName').value + "&ID=" + $get(MasterObj + 'CmbBatchEnterDataType').value
                    strUrl = encodeURI(strUrl)
                    var rValue = window.showModalDialog(strUrl, window, 'dialogHeight: 300px;dialogWidth: 450px;center: Yes;help: no;status: no;scroll:no');
                    //--------------------------------------------------------------------------------
                }

            }
            else {
                alert("لطفا ابتدا روش دريافت اطلاعات را مشخص نماييد")
                $get(MasterObj + 'CmbReciveDataType').focus()
            }
        }
        //-----------------------------------------------------------------------------------
        function OnClickBtnNew() {

            if ($get(MasterObj + 'txtBatchEnterDataTypeAcronym').value == "0") {
                $get(MasterObj + "CmbBatchEnterDataType").value = 0
                OnChangeCmbBatchEnterDataType($get(MasterObj + "CmbBatchEnterDataType"))
            }
            $get(MasterObj + 'CmbReciveDataType').value = 0
            $get(MasterObj + 'txtXmlTextData').value = "<Root></Root>"
            CreateGrid("First")

            if ($get(MasterObj + 'txtBatchEnterDataTypeAcronym').value == "0") {
                $get(MasterObj + "CmbBatchEnterDataType").focus()
            }
            else {
                $get(MasterObj + 'CmbReciveDataType').focus()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {

            if (CheckNotEmpty())

                Save("Save")
            else
                alert("ابتدا اطلاعات را تکميل نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSetting() {
            var strUrl = "EnterDataSetting.aspx?CompanyID=" + $get(MasterObj + "txtCompanyFinatialPeriodID").value;
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, window, 'dialogHeight:400px;dialogWidth:930px;center: Yes;help: no;status: no;scroll:no');
            $get(MasterObj + "BtnSubmit2").click();        
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //-----------------------------------------------------------------------------------
        function OnClickBtnSampleFile() {
            //alert(ExcelFilePath)
            window.open(ExcelFilePath)
        }
        //-----------------------------------------------------------------------------------
        function OnClickBtnHelpFile() {
            //alert(HelpFilePath)
            window.open(HelpFilePath)
        }
        //-----------------------------------------------------------------------------------
        function OnClickBtnHelp() {
            //alert("Help")
            window.open("Help/Help.doc")
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
        //-------------------------------------------------------------------
        function getCntChar(subStr1, Str1) {
            var Str = new String
            Str = Str1 + ''
            if (Str1 == '')
                return (0)

            var subStr = new String
            subStr = subStr1 + ''
            if (subStr1 == '')
                return (0)

            var cnt
            cnt = 0
            for (j = 0; j < Str.length; ++j)
                if (Str.substring(j, j + subStr.length) == subStr)
                cnt += 1
            return (cnt)
        }

        /////////////////////////////////////////////
        function getArray(Str, Index, sep) {
            var j
            var i
            i = 0
            var items = new String
            items = Str
            var p = new String
            if (items != "") {
                j = items.search(sep)
                while (j <= items.length && i <= Index) {
                    p = items.substring(0, j)
                    if (j < 0) p = items.substring(0, items.length)
                    j = j + 1
                    items = items.substring(j, items.length)
                    j = items.search(sep)
                    if (j < 0) j = items.length + 1
                    i = i + 1
                }
            }
            i = i - 1
            if (i == Index)
                return (p.substring(0, p.length))
            else
                return ('')
        }
        ///////////////////////////////////////////
        function ReplaceAll(str, char1, replaceChar) {
            var x = getCntChar(char1, str)
            var s = new String()
            s = str
            while (x > 0) {
                s = s.replace(char1, replaceChar)
                x--
            }
            return (s)
        }
        ///////////////////////////////////////////
        function PasteFromClipboard() {
            
            var oStrGetData
            var TableName = ''
            oStrGetData = window.clipboardData.getData("Text");
            /*********************************************************************/
            //            var fs = new ActiveXObject("Scripting.FileSystemObject");

            //            var a = fs.CreateTextFile("c:\testfile.txt", true);

            //            a.WriteLine("This is a test.");

            //            a.Close();
            /*********************************************************************/
            if (grdData_Header.rows(0).cells.length == 0 || $get(MasterObj + 'CmbBatchEnterDataType').value == 0 || $get(MasterObj + 'CmbBatchEnterDataType').value == "") {
                alert("ابتدا نوع اطلاعات را مشخص نماييد")
                $get(MasterObj + 'CmbBatchEnterDataType').focus()
                TableName = ''
                $get(MasterObj + 'txtTableName').value = TableName
                
                return
            }
            else {
                var oXmlDocT = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocT.async = "false";
                oXmlDocT.loadXML($get(MasterObj + 'txtXmlBatchEnterDataType').value)
                var xmlNodesT = oXmlDocT.documentElement.selectNodes('/GeneralEntity/Lcombo[ID=' + $get(MasterObj + 'CmbBatchEnterDataType').value + ']')

                if (xmlNodesT.length != 0) {
                    TableName = xmlNodesT.item(0).selectSingleNode('TableName').text
                    $get(MasterObj + 'txtTableName').value = TableName
                }
            }

            if (oStrGetData == "") {
                alert("لطفا اطلاعات مورد نظر را كپي نماييد")
            }
            else {

                if (!confirm("عمليات دريافت اطلاعات ممكن است مدتي طول بكشد.\nرا انتخاب نماييد 'No' در صورت نمايش پيامي\nجهت عدم نمايش پيام مورد نظر مي توانيد گزينه دريافت فايل تنظيمات را انتخاب نماييد\nآيا مايل به ادامه عمليات دريافت اطلاعات مي باشيد؟")) {
                    return
                }

                var LineIdx = 0
                var oLineStr
                var oStrLen
                var oLineLen
                var TempLineStr
                var TempStrGetData = oStrGetData
                var StrIdx = 0
                var oStr
                var oStrXml = "<Root>"


                var LineCount = getCntChar('\r\n', oStrGetData)
                var ColumnCount = 0
                for (var i = 0; i < LineCount; ++i) {


                    oStrLen = TempStrGetData.length

                    oLineStr = getArray(TempStrGetData, 0, '\r\n')
                    //alert(oLineStr)
                    LineIdx = oLineStr.length + 1
                    TempLineStr = oLineStr

                    //-------------------------------------
                    if (parseInt(getCntChar('\t', oLineStr) + 1) != (parseInt(grdData_Header.rows(0).cells.length) - 1)) {
                        alert("ساختار اطلاعات كپي شده نادرست مي باشد\nلطفا اطلاعات را با ساختار ستون هاي گريد كپي نماييد")
                        return
                    }

                    if (i > 0) {

                        oStrXml += "<" + TableName + ">"
                        oStrXml += "<ID>" + i + "</ID>"
                        ColumnCount = getCntChar('\t', oLineStr)
                        for (var j = 0; j < ColumnCount + 1; ++j) {

                            oLineLen = TempLineStr.length

                            oStr = getArray(TempLineStr, 0, '\t')

                            StrIdx = oStr.length + 1

                            TempLineStr = TempLineStr.substring(StrIdx, oLineLen)

                            oStr = ReplaceAll(oStr, '\n', '')
                            //alert(oStr)
                            //alert(grdData_Header.rows(0).cells(j).TagName)
                            oStrXml += "<" + grdData_Header.rows(0).cells(j + 1).TagName + ">"
                            oStrXml += oStr
                            oStrXml += "</" + grdData_Header.rows(0).cells(j + 1).TagName + ">"
                        }
                        oStrXml += "<Selected>1</Selected>"
                        oStrXml += "</" + TableName + ">"
                    }

                    //-------------------------------------
                    TempStrGetData = TempStrGetData.substring(LineIdx, oStrLen)

                }
                oStrXml += "</Root>"

            }


            $get(MasterObj + 'txtXmlTextData').value = oStrXml
            //alert($get(MasterObj + 'txtXmlTextData').value)
            CreateGrid("First")
            
        }
        //----------------------------------------------
        function OnChangeCmbBatchEnterDataType(obj) {
          
            ClearRowGrid(grdData);
            
            if (grdData_Header.rows.length == 0) {
                grdData_Header.insertRow()
            }
            if (obj.value != 0 && obj.value != "") {

                var oXmlDocT = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDocT.async = "false";
                oXmlDocT.loadXML($get(MasterObj + 'txtXmlBatchEnterDataType').value)
                var xmlNodesT = oXmlDocT.documentElement.selectNodes('/GeneralEntity/Lcombo[ID=' + obj.value + ']')


                if (xmlNodesT.length != 0) {

                    ExcelFilePath = xmlNodesT.item(0).selectSingleNode('ExcelFilePath').text
                    HelpFilePath = xmlNodesT.item(0).selectSingleNode('HelpFilePath').text
                    CreateGrdData_Header(xmlNodesT.item(0).selectSingleNode('ID').text, xmlNodesT.item(0).selectSingleNode('Title').text, xmlNodesT.item(0).selectSingleNode('TableName').text)

                }

            }
            else {
                ClearGrdCell(grdData_Header, 0)
            }

        }
        //--------------------------------------------------------
        function CreateGrdData_Header(BatchEnterDataTypeID, BatchEnterDataTypeTitle, TableName) {

            ClearGrdCell(grdData_Header, 0)

            //alert($get(MasterObj + 'txtXmlBatchEnterDataProperty').value)
            var oXmlDocP = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocP.async = "false";
            oXmlDocP.loadXML($get(MasterObj + 'txtXmlBatchEnterDataProperty').value)
            var xmlNodesP = oXmlDocP.documentElement.selectNodes('/DataEntryEntity/GetBatchEnterDataProperty[BatchEnterDataTypeID=' + BatchEnterDataTypeID + ']')

            if (xmlNodesP.length != 0) {

                var oCell
                oCell = grdData_Header.rows(0).insertCell()
                //Set Cell Style
                oCell.className = "CssHeaderStyle"
                //Set Cell Width
                oCell.width = "30px"
                //Fill Cell Header
                oCell.innerText = "*"

                for (var i = 0; i < xmlNodesP.length; ++i) {

                    AddCellGrdData_Header(xmlNodesP.item(i).selectSingleNode('TagName').text, xmlNodesP.item(i).selectSingleNode('HeaderCaption').text, xmlNodesP.item(i).selectSingleNode('CellWidth').text, xmlNodesP.item(i).selectSingleNode('HeaderTitle').text)
                }
            }
        }
        //------------------------------------------------------------------
        function AddCellGrdData_Header(TagName, HeaderCaption, CellWidth, HeaderTitle) {
            //alert(TagName)
            var oCell
            oCell = grdData_Header.rows(0).insertCell()
            //Set Cell Attribute
            oCell.setAttribute("TagName", TagName)
            //Set Cell Style
            oCell.className = "CssHeaderStyle"
            //Set Cell Width
            oCell.width = CellWidth + "px"
            //Fill Cell Header
            oCell.innerText = HeaderCaption
            //Set Cell title
            oCell.title = HeaderTitle
        }
        //------------------------------------------------------------
        function ClearGrdCell(oGrid, RowIndex) {
            //alert(oGrid.rows(RowIndex).cells.length)
            //alert(oGrid.rows(RowIndex).cells.length)
            for (var i = oGrid.rows(RowIndex).cells.length - 1; i >= 0; i--) {
                oGrid.rows(RowIndex).deleteCell(i);
                //alert()
            }
        }
        //------------------------------------------------------------
        //*******************************************************************************
        function CreateGrid(direction) {
            ClearRowGrid(grdData)

            if ($get(MasterObj + 'txtXmlTextData').value != "<Root></Root>") {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlTextData').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/' + $get(MasterObj + 'txtTableName').value)

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

                    //alert(grdData_Header.rows(0).cells.length)

                    var i = (currentPage_X - 1) * PageSize
                    for (; i <= endFor; i++) {
                        var Param = ''
                        for (var j = 1; j < grdData_Header.rows(0).cells.length; ++j) {
                            //alert(grdData_Header.rows(0).cells(j).TagName)

                            Param += '' + xmlNodes.item(i).selectSingleNode(grdData_Header.rows(0).cells(j).TagName).text + ','

                        }

                        //var Param = '' + xmlNodes.item(i).selectSingleNode('PersonCode').text + ',' + xmlNodes.item(i).selectSingleNode('PersonName').text + ',' + xmlNodes.item(i).selectSingleNode('StartDate').text + ',' + xmlNodes.item(i).selectSingleNode('EndDate').text + ',' + xmlNodes.item(i).selectSingleNode('StartTime').text + ',' + xmlNodes.item(i).selectSingleNode('EndTime').text + ',' + xmlNodes.item(i).selectSingleNode('FirstCodeName').text + ',' + xmlNodes.item(i).selectSingleNode('SecondCodeName').text + ',' + xmlNodes.item(i).selectSingleNode('Descr').text + ',';
                        AddToGrid(Param, xmlNodes.item(i).selectSingleNode('Selected').text, xmlNodes.item(i).selectSingleNode('ID').text)
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
        //---------------------------------------------------------------------
        function AddToGrid(Param, Selected, ID) {
            var oGrid = grdData;
            var oRow = oGrid.insertRow();

            oRow.setAttribute("ID", ID) //CreditId

            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";

            var x = 0;
            var p = new String;
            var val = "";

            var oCell

            oCell = oRow.insertCell();
            if (Selected == 0)
                oCell.innerHTML = "<input type='checkbox' onclick='ChkOnClick(this)'>";
            else
                oCell.innerHTML = "<input type='checkbox' checked onclick='ChkOnClick(this)'>";
            oCell.className = "XTabTable";
            oCell.style.width = grdData_Header.rows(0).cells(x).width
            oCell.align = "center"

            while (x < getCntChar(',', Param)) {

                val = getArray(Param, x, ',')

                oCell = oRow.insertCell();

                if (val.length > grdData_Header.rows(0).cells(x + 1).width / 30) {
                    oCell.innerText = val.substr(0, grdData_Header.rows(0).cells(x + 1).width / 30) + "..";
                    oCell.title = val;
                }
                else oCell.innerText = val;
                oCell.className = "XTabTable";
                oCell.style.width = grdData_Header.rows(0).cells(x + 1).width
                oCell.align = "center"

                ++x;
            }



        }
        //---------------------------------------------------------------------
        function ChkOnClick(obj) {
            var oRow = obj.parentElement.parentElement

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXmlTextData').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/' + $get(MasterObj + 'txtTableName').value + "[ID=" + oRow.ID + "]")

            if (xmlNodes.length != 0) {
                if (obj.checked) {
                    xmlNodes.item(0).selectSingleNode('Selected').text = 1
                }
                else {
                    xmlNodes.item(0).selectSingleNode('Selected').text = 0
                }
            }


            $get(MasterObj + 'txtXmlTextData').value = oXmlDoc.xml

        }
        //---------------------------------------------------------------------
        function ClearRowGrid(oGrid) {

            for (var i = oGrid.rows.length - 1; i >= 0; i--) {
                oGrid.deleteRow(i);
            }
        }
        //---------------------------------------------------------------------
        function SetPagingInfo() {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

            if (document.getElementById("OToolBar_txtCurPage").value == "" | document.getElementById("OToolBar_txtCurPage").value == "0")
                document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                document.getElementById('OToolBar_BtnPrv').disabled = false;

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;
        }
        //-------------------------------------------------------------------------
        function OnClickGrdData() {
            if (window.event.srcElement.tagName != 'IMG' && window.event.srcElement.tagName != 'TABLE') {
                var SelectedRow
                if (window.event.srcElement.parentElement.tagName == 'TD')
                    SelectedRow = window.event.srcElement.parentElement.parentElement
                else
                    SelectedRow = window.event.srcElement.parentElement

                var obj;
                obj = grdData

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

                //LoadData(SelectedRow)
            }
        }
        //---------------------------------------------------------
        function CheckNotEmpty() {
            if ($get(MasterObj + 'CmbBatchEnterDataType').value == 0 || $get(MasterObj + 'CmbBatchEnterDataType').value == "") {
                //alert("لطفا نوع اطلاعات دريافت شده را مشحص نماييد")
                return false
            }

            if ($get(MasterObj + 'txtXmlTextData').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlTextData').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/' + $get(MasterObj + 'txtTableName').value + "[Selected=1]")

                if (xmlNodes.length == 0) {
                    //alert("اطلاعاتي جهت ذخيره وجود ندارد")
                    return false
                }
            }
            else { 
                return false
            }
            return true
        }
        //*******************************************************************************
        function Save(Type) {

            //           alert($get(MasterObj + 'txtXmlTextData').value)
            $get(MasterObj + "txtSaveXML").value = $get(MasterObj + 'txtXmlTextData').value
            $get(MasterObj + "txtSubmit").value = Type;
            $get(MasterObj + "BtnSubmit").click();
            //           
        }
    </script>
    
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server"  >
    
    
    </asp:Content>