<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RegisterDynamicSchedule.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RegisterDynamicSchedule" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <div style="float: right">
            دوره:</div>
        <div style="float: right">
            <select id="CmbWorkPeriod" name="CmbWorkPeriod" style="width: 120px" onkeydown="OnKeyEnter(this)"
                runat="server" class="TxtControls">
                <option></option>
            </select>
        </div>
        <div style="float: right">
            پرسنلي:
        </div>
        <div style="float: right">
            <uc2:ComboBox ID="CmbPerson" runat="server" />
        </div>
        <div style="float: right">
            <input id="ChkCheck" onkeydown="OnKeyEnter(this)" type="checkbox" runat="server" />کنترل
            بر اساس ساختار مرتبط
        </div>
    </div>
    <div style="width: 800px">
        <uc1:ToolBar ID="OToolBar" runat="server" />
    </div>
    <table id="XTabTable" cellpadding="0" cellspacing="0">
        <tr>
            <td class="CssHeaderStyle" style="width: 25px" align="center" valign="top">
                رديف
            </td>
            <td class="CssHeaderStyle" style="width: 60px" align="center" valign="top">
                پرسنلي
            </td>
            <td class="CssHeaderStyle" style="width: 95px" align="center" valign="top">
                نام
            </td>
            <td class="CssHeaderStyle" align="center" id="TDWP" style="width: 700px; height: 10px">
                روزهاي دوره
            </td>
            <td class="CssHeaderStyle" align="center" style="width: 40px; font-size: 11" valign="top">
                جمع
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        document.dir = "RTL"
       
        var flag = true; //نشان دهنده زماني که بايد هدر دوره ساخته شود
        //--------------------------------------ساختارهاXml
        var oXmlStruct = new ActiveXObject("Microsoft.XMLDOM")
        oXmlStruct.async = "false";
        oXmlStruct.loadXML($get(MasterObj + 'XmlStruct').value)
        //--------------------------------------دوره هاXml  
        var oXmlWP = new ActiveXObject("Microsoft.XMLDOM")
        oXmlWP.async = "false";
        oXmlWP.loadXML($get(MasterObj + 'txtWP').value)
        var EDate, SDate, CountDay, WPDayName, xmlNodesme; //اطلاعات دوره انتخاب شده براي جستجو
        //--------------------------------------داده هاي گريدXml
        var oXmlData = new ActiveXObject("Microsoft.XMLDOM")
        oXmlData.async = "false";
        oXmlData.loadXML($get(MasterObj + 'txtXml').value)
        //--------------------------------------پيش فرضXml
        var oXmlDefault = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDefault.async = "false";
        oXmlDefault.loadXML($get(MasterObj + 'txtDefXml').value)
        var xmlNodeDefault;
        //--------------------------------------DetailCollection Xml
        var oXmlDCOll = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDCOll.async = "false";
        oXmlDCOll.loadXML($get(MasterObj + 'XmlDColl').value)
        //----------------------------------------------------
        //-------------PopupStruct
        var XTabTableRow = 0
        var LastSelectedRow = ""
        var gridRowIndex = null
        var InputPopupStc = null;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!راهنماي رنگ ها
        var arrColor = {
            0: ["Black", "ساختار قبلي"],
            1: ["Blue", "ساختار تغيير يافته"],
            2: ["Red", "ساختار نادرست"]
        };
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!راهنمای ShortKeys
        ShowDefaultShortKeys(0)

        var arrShortKey = {
            0: ["F2", "نمايش ساختارها"],
            1: ["F7", "بازگشت به ساختار قبلي"],
            2: ["دابل کليک روی هر سلول", "فعال سازي مود استفاده از موس"]
        };
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //=========================================================
        var S = new Array();
        var StructRow = null;
        var NewObj = null;
        var PersonCode = "";
        var SelectWPDate = "";
        PageLoad();
        $get(MasterObj + "CmbWorkPeriod").focus();
        $get(MasterObj + "CmbWorkPeriod").setActive();
        //==========================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //==========================================================================
        //###################################Create Grid#########################################
        function CreateGrid() {
            ClearRowGrid()
            var xmlNodes = oXmlData.documentElement.selectNodes("/DataEntryEntity/PersonDateStruct")

            if (xmlNodes.length > 0) {
                var XmlStructMember = "";
                for (var i = 0; i < xmlNodes.length; i++) {
                    if ($get(MasterObj + "txtChk").value == "1" && XmlNewNode.item(0).selectSingleNode("ID").text != "")
                        XmlStructMember = oXmlData.documentElement.selectNodes("/DataEntryEntity/Structure[Member=" + XmlNewNode.item(0).selectSingleNode("ID").text + "]");
                    else XmlStructMember = "";
                    AddToGrid(xmlNodes[i], XmlStructMember, i == 0 ? 1 : 0)
                }
            }
        }
        //********************************************************************************
        function ClearRowGrid() {
            var oGrid = XTableData
            while (oGrid.rows.length > 0)
                oGrid.deleteRow(oGrid.rows.length - 1);
        }
        //*******************************************************************************
        function AddToGrid(XMLNODE, XmlStructM, Sign) {
            //----------------------ایجاد ردیف          
            var oGrid = XTableData;
            var oRow = oGrid.insertRow();
            oRow.style.width = "100%";
            oRow.style.height = "30px";
            oRow.setAttribute("WPID", XMLNODE.item(0).selectSingleNode('WPID').text)
            oRow.setAttribute("ID", XMLNODE.item(0).selectSingleNode('ID').text)     
            //-------------------------------ساختارها       
            var STRC = "";
            if ($get(MasterObj + "txtChk").value == "1") {
                STRC = STRC + "0" + ":";
                STRC = STRC + "پيش فرض" + ":";
                STRC = STRC + "P.F" + ":#";
                for (var Count = 0; Count < XmlStructM.length; Count++) {
                    STRC = STRC + XmlStructM.item(Count).selectSingleNode("SID").text + ":";
                    STRC = STRC + XmlStructM.item(Count).selectSingleNode("Name").text + ":";
                    STRC = STRC + XmlStructM.item(Count).selectSingleNode("Acronym").text + ":#";
                }
            }
            oRow.setAttribute("Struct", STRC);
            //-----------------------------------------استایل ردیف--
            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle";
            else
                oRow.className = "CssAlternatingItemStyle";
            var val = "";
            //--------------------------رديف   
            var OCell0 = oRow.insertCell();
            OCell0.innerText = oRow.rowIndex()+1;
            OCell0.style.width = "25px";
            OCell0.align = "center"
            //--------------------------پرسنلی              
            val = XMLNODE.selectSingleNode('Code').text;
            var oCell1 = oRow.insertCell()
            if (val != "") {
                oCell1.innerHTML = "<input align='center' type='text' value='" + val + "' style='width:60px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
                oCell1.firstChild.innerText = val;
            }
            else oCell1.innerHTML = "<input align='center' type='text' value='' style='width:60px;font-weight:bold' onkeydown='OnKeyDownInt(this);onKeyDownEnter(this)' onblur='onblurtxtPersonCode(this)' onfocus='onfocusPersonCode(this)'  />";
            oCell1.style.width = "60px";
            oCell1.align = "center"
            //------------------------------نام
            val = XMLNODE.selectSingleNode('Name').text;
            var oCell2 = oRow.insertCell()
            oCell2.innerHTML = "<div oncontextmenu='contextMenu(this);return false;'></div>"
            if (val != "") {
                if (val.length > 18) {
                    oCell2.firstChild.innerText = val.substring(0, 16) + "...";
                    oCell2.title = val;
                }
                else
                    oCell2.firstChild.innerText = val;
            }
            oCell2.style.width = "95px";
            oCell2.align = "center"
            //======================================================روزهای دوره====================================
            if (Sign == 1) {
                if (flag) {
                    while (XTabTable.rows.length > 0)
                        XTabTable.deleteRow(XTabTable.rows.length - 1);
                    MakeHeader();
                }
            }
            //-----------------------------------------            
            var SDate1 = SDate;
            var EDate1 = EDate;
            if (oRow.className == "CssItemStyle")
                str = "background-color:#EAE7F1;"; //#FFE1E1
            else str = "background-color:#FFFFE1;"; //#FFEBD7         
            var OXMLTMPNode;
            var WPDayName1 = parseInt(WPDayName);
            for (var i = 1; i <= CountDay; i++) {
                if (WPDayName1 == 6)
                    str2 = "border-left-style: groove; border-left-width: medium; border-left-color: #808080;";
                else str2 = "";
                j = 0;
                Flag = true;
                var OCell = oRow.insertCell();
                OCell.align = "center";
                while (j < XMLNODE.length && Flag) {
                    if (XMLNODE.item(j).selectSingleNode('Date').text == SDate1) {
                        OXMLTMPNode = oXmlStruct.documentElement.selectNodes("/DataEntryEntity/Structure[SID=" + XMLNODE.item(j).selectSingleNode('SID').text + "]");
                        OCell.innerHTML = "<input align='center'  onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)' onkeydown='onkeydownEnter(this)'  Type='text' Value='" + XMLNODE.item(j).selectSingleNode('Acronym').text + "' style='text-align:center;Width:23px;font-weight:bold;height:28px;" + str + str2 + "'  title='" + OXMLTMPNode.item(0).selectSingleNode('Name').text + "'/>";
                        Flag = false;
                    }
                    j++;
                }
                if (Flag) {
                    OCell.innerHTML = "<input align='center'  onfocus='onfocusWPDate(this)' onblur='onblurWPDate(this)' ondblclick='ondblclickWPDate(this)' Type='Text'  onkeydown='onkeydownEnter(this)'  Value='' style='text-align:center;Width:23px;font-weight:bold ;height:28px;" + str + str2 + "'  title=''/>";
                }
                SDate1 = shdAdd('13' + SDate1, 1);
                SDate1 = SDate1.substr(SDate1.length - 8, 8);
                WPDayName1 = (WPDayName1 + 1) % 7;
            }
            //====================================مجموع================================================================
            var oCell3 = oRow.insertCell()
            oCell3.innerText = XMLNODE.item(0).selectSingleNode('SumHour').text.toString();
            oCell3.style.width = "40px";
            oCell3.align = "center"
        }
        //====================================================================================
        function MakeHeader() {
            XTabTable.insertRow(0);
            XTabTable.insertRow(1);
            var OCEll = XTabTable.rows(0).insertCell();
            XTabTable.rows(0).insertCell();
            XTabTable.rows(0).insertCell();
            XTabTable.rows(0).cells(0).className = "CssHeaderStyle"
            XTabTable.rows(0).cells(1).className = "CssHeaderStyle"
            XTabTable.rows(0).cells(2).className = "CssHeaderStyle"
            XTabTable.rows(1).insertCell();
            XTabTable.rows(1).insertCell();
            XTabTable.rows(1).insertCell();
            XTabTable.rows(1).cells(0).colspan = "1";
            XTabTable.rows(1).cells(1).colspan = "1";
            XTabTable.rows(1).cells(2).colspan = "1";

            XTabTable.rows(1).cells(0).innerText = "رديف";
            XTabTable.rows(1).cells(1).innerText = "پرسنلي";
            XTabTable.rows(1).cells(2).innerText = "نام";
            XTabTable.rows(1).cells(0).className = "CssHeaderStyle"
            XTabTable.rows(1).cells(1).className = "CssHeaderStyle"
            XTabTable.rows(1).cells(2).className = "CssHeaderStyle"
            XTabTable.rows(1).cells(0).style.width = "25px";
            XTabTable.rows(1).cells(1).style.width = "60px";
            XTabTable.rows(1).cells(2).style.width = "95px";
            XTabTable.rows(1).cells(0).align = "center";
            XTabTable.rows(1).cells(1).align = "center";
            XTabTable.rows(1).cells(2).align = "center";

            flag = false;
            var SDate1 = SDate;
            var EDate1 = EDate;
            var WPDayName1 = parseInt(WPDayName);
            var str = "background-color:#CBD5DE;";
            var StrDay = '';
            var DayName = "";
            for (var i = 0; i < CountDay; i++) {
                var Ocell1 = XTabTable.rows(0).insertCell();
                var OCEllName = XTabTable.rows(1).insertCell();
                switch (WPDayName1) {
                    case 0:
                        StrDay = 'ش';
                        DayName = "شنبه";
                        break;
                    case 1:
                        StrDay = 'ي';
                        DayName = "يکشنبه";
                        break;
                    case 2:
                        StrDay = 'د';
                        DayName = "دوشنبه";
                        break;
                    case 3:
                        StrDay = 'س';
                        DayName = "سه&nbsp;شنبه";
                        break;
                    case 4:
                        StrDay = 'چ';
                        DayName = "چهارشنبه";
                        break;
                    case 5:
                        StrDay = 'پ';
                        DayName = "پنجشنبه";
                        break;
                    case 6:
                        StrDay = 'ج';
                        DayName = "جمعه";
                        break;
                }
                if (WPDayName1 == 0 && str == "background-color:#CBD5DE;")
                    str = "background-color:#B1C0CD;"
                else if (WPDayName1 == 0 && str == "background-color:#B1C0CD;")
                    str = "background-color:#CBD5DE;"

                Ocell1.innerHTML = "<div style='width:23px;color:Black;" + str + "' title=" + DayName + ">" + StrDay + "</div>";
                Ocell1.style.width = "23px";
                Ocell1.align = "center"
                Ocell1.className = "CssHeaderStyle";

                OCEllName.innerHTML = "<div title=" + SDate1 + ">" + SDate1.substr(6, 2) + "</div>";
                OCEllName.style.width = "23px";
                OCEllName.align = "center"
                OCEllName.className = "CssHeaderStyle";
                SDate1 = shdAdd('13' + SDate1, 1);
                SDate1 = SDate1.substr(SDate1.length - 8, 8);
                WPDayName1 = (WPDayName1 + 1) % 7;
            }
            var Ocell1 = XTabTable.rows(0).insertCell();
            var OCEllName = XTabTable.rows(1).insertCell();
            Ocell1.style.width = "23px";
            Ocell1.align = "center"
            Ocell1.className = "CssHeaderStyle";
            OCEllName.innerText = "جمع";
            OCEllName.style.width = "40px";
            OCEllName.align = "center"
            OCEllName.className = "CssHeaderStyle";
        }
        //###########################end Create Grid********************************************
    </script>
</asp:Content>
