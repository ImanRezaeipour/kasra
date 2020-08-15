<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="Grid.ascx.cs" EnableViewState="true"   Inherits="FrmPresentation.App_Utility.Grid.Grid" %>
<%@ Register Src="../ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<link href="/frmpresentation/App_Utility/Grid/Style/PersonComboStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .HeaderStyle
    {
        border-right: #346fa4 2px solid;
        border-top: lightsteelblue 2px solid;
        font-weight: bold;
        font-size: 12px;
        border-left: lightsteelblue 2px solid;
        direction: rtl;
        border-bottom: #346fa4 2px solid;
        font-family: Tahoma,Tahoma;
        background-color: #83afe5;
    }
</style>
<table id="MainGrid" IsMainTableGrid="true" runat="server" cellpadding ="0" cellspacing="0" >
    <tr> 
        <td >
            <div id="divToolBarGrid" runat="server">
                <asp:Literal ID="litContent" runat="server">ToolBarGrid</asp:Literal>
            </div>
        </td>
    </tr>
    <tr><td></td></tr>
    <tr >
        <td  id="tdField" style="width:100%" >
        <table  cellspacing="0"  style="width:100%" >
            <asp:PlaceHolder ID="PHField" runat="server"></asp:PlaceHolder>
            </table>
        </td>
    </tr>
    <tr>
        <td  >
           <asp:UpdatePanel ID="UpdatePanelPaging" runat="server" UpdateMode ="Conditional" >
                <ContentTemplate>
                    <div style="display: none">
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                         
                    </div>
                    <div runat="server" id="DivGrid" style="scrollbar-highlight-color: white; overflow: auto;
                        scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitBindGrid" EventName="click" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>
        <asp:UpdatePanel ID="UpdatePanelSorting" runat="server" UpdateMode ="Conditional" >
                <ContentTemplate>
                    <div style="display: none">
                         <asp:HiddenField  id="txtGridSetting"  runat="server" />
                    </div>
                    
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitSortGrid" EventName="click" />
                </Triggers>
            </asp:UpdatePanel>
            </td>
    </tr>
    <tr>
        <td >
            <div style="display: none">
                <input type="text" id="Text1" name="SDate" runat="server" />
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
                    <input type="text" id="txtMultiColumnSortExpression" enableviewstate="true" name="txtMultiColumnSortExpression"
                    runat="server" />
                <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                <input type="text" id="txtSubmitGrid" name="txtSubmitGrid" runat="server" />
                <asp:Button ID="BtnSubmitBindGrid" runat="server" Text="BtnSubmitBindGrid" OnClick="BtnSubmitBindGrid_Click" />
                <asp:Button ID="BtnSubmitSortGrid" runat="server" Text="BtnSubmitSortGrid" OnClick="BtnSubmitSortGrid_Click" />
                <input type="text" id="txtSearchflag" runat="server" />
                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                    runat="server" />
                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                <input type="text" id="txtAllowPaging" name="txtAllowPaging" runat="server" />
                <input type="text" id="txtGridProperty" name="txtGridProperty" runat="server" />
               
                
            </div>
        </td>
    </tr>
    <tr><td><div runat="server" isGrid="true"  id="DivPopup" dir="rtl" 
        style="border: 2px solid #858585; width: 211px;  background-color: #FFFFF2; position: absolute; display: none; "
        >
            <table  cellspacing="0" cellspacing="0" id="grd_Header" style="width: 100%;height:20px" border="0" cellpadding="0" 
                cellspacing="0">
                <tr>
                    <td align="center" style="width: 90px;height:20px" class="CssGridHeader">
                        نام ستون </td>
                    <td align="right" style="width: 171px;height:20px" class="CssGridHeader">
                        صعودی/نزولی </td>
                </tr>
            </table>
            <div dir="rtl" style="width: 100%;">
                <table  runat="server" id="grd" style="width: 100%" border="0" cellpadding="0" 
                    cellspacing="0" onkeydown="grd_OnKeyDown(this)"   >
                    <tr  >
                        <td  align="center" style="width: 90px">
                            &nbsp;</td>
                        <td align="center" style="width: 171px">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </div></td></tr>
</table>

<script language="javascript" type="text/javascript">

    var MasterObj = "ctl00_ContentPlaceHolder1_";

    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    

    function BeginRequestHandler(sender, args) {
        
    }

    function EndRequestHandler(sender, args) {
    
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisID = this.id
        }
        
        if (ThisID != null && ThisID != undefined) {
            var StrVal = $get(ThisID + "_txtSubmitGrid").value
            
            document.getElementById(ThisID + "_txtSubmitGrid").value = "";
            
            if (StrVal == "GetGridSettingSearch") {

                Fillgrd();
               
                            }



                            

//            try {
//                document.getElementById(ThisID + "_grd").focus();
//            }
//            catch (e) {

//            }
        }
            
        //             if (StrVal != "") {
        //                 if ($get(ThisID + "_lblTo").value == "") {
        //                    document.getElementById('OToolBar_txtFromData').value = "";
        //                    document.getElementById('OToolBar_txtToData').value = "";
        //                    document.getElementById('OToolBar_txtTotalData').value = "";

        //                    document.getElementById('OToolBar_BtnNext').disabled = true;
        //                    document.getElementById('OToolBar_BtnPrv').disabled = true;
        //                    document.getElementById('OToolBar_BtnFirst').disabled = true;
        //                    document.getElementById('OToolBar_BtnLast').disabled = true;
        //                }
        //                else if ($get(ThisID + "_lblTo").value != "") {
        //                document.getElementById('OToolBar_txtFromData').value = $get(ThisID + "_lblFrom").value;
        //                document.getElementById('OToolBar_txtToData').value = $get(ThisID + "_lblTo").value;
        //                document.getElementById('OToolBar_txtTotalData').value = $get(ThisID + "_lblTotal").value;
        //                document.getElementById('OToolBar_txtCurPage').value = $get(ThisID + "_txtCurPage").value;
        //                document.getElementById('OToolBar_txtTotalPage').value = $get(ThisID + "_Totalpage").value;

        //                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
        //                        document.getElementById('OToolBar_BtnNext').disabled = true
        //                    else
        //                        document.getElementById('OToolBar_BtnNext').disabled = false;

        //                    if (parseInt($get(ThisID + "_lblFrom").value) == 1)
        //                        document.getElementById('OToolBar_BtnPrv').disabled = true
        //                    else
        //                        document.getElementById('OToolBar_BtnPrv').disabled = false;

        //                    document.getElementById('OToolBar_BtnFirst').disabled = false;
        //                    document.getElementById('OToolBar_BtnLast').disabled = false;
        //                }
        //            }

    }  


</script>
<script language="javascript" type="text/javascript">
    var ThisID = null;
    var RowIndex = 0;
    var objSorting;

    function onClickForSorting() {
    
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisID = this.id
        }
        if (ThisID != null) {
            document.getElementById(ThisID + "_txtMultiColumnSortExpression").value = ""
            
            for (var i = 1; i < document.getElementById(ThisID + "_grd").rows.length; ++i) {

                if (document.getElementById(ThisID +"_"+ i + "_rdAsc").checked == true) {

                    if (document.getElementById(ThisID + "_txtMultiColumnSortExpression").value != "")
                        document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += "," + document.getElementById(ThisID +"_"+ i + "_rdAsc").value + " Asc"
                    else
                        document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += document.getElementById(ThisID +"_"+ i + "_rdAsc").value + " Asc"
                }

                if (document.getElementById(ThisID +"_"+ i + "_rdDesc").checked == true) {
                    if (document.getElementById(ThisID + "_txtMultiColumnSortExpression").value != "")
                        document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += "," + document.getElementById(ThisID +"_"+ i + "_rdDesc").value + " Desc"
                    else
                        document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += document.getElementById(ThisID +"_"+ i + "_rdAsc").value + " Asc"
                }

            }

            HideDivPopup();
        }
    }
    function onClickDivSorting(obj) {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisID = this.id
        }
        if (document.getElementById(ThisID + "_DivPopup").style.display == "none") {
            objSorting = obj
            

            document.getElementById(ThisID + "_txtSubmitGrid").value = "GetGridSettingSearch";
            document.getElementById(ThisID + "_BtnSubmitSortGrid").click();
        }
        if (document.getElementById(ThisID + "_DivPopup").style.display == "inline") {

            if (ThisID != null) {
                document.getElementById(ThisID + "_txtMultiColumnSortExpression").value = ""

                for (var i = 0; i < document.getElementById(ThisID + "_grd").rows.length; ++i) {

                    if (document.getElementById(ThisID + "_" + i + "_rdAsc").checked == true) {

                        if (document.getElementById(ThisID + "_txtMultiColumnSortExpression").value != "")
                            document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += "," + document.getElementById(ThisID + "_" + i + "_rdAsc").value + " Asc"
                        else
                            document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += document.getElementById(ThisID + "_" + i + "_rdAsc").value + " Asc"
                    }

                    if (document.getElementById(ThisID + "_" + i + "_rdDesc").checked == true) {
                        if (document.getElementById(ThisID + "_txtMultiColumnSortExpression").value != "")
                            document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += "," + document.getElementById(ThisID + "_" + i + "_rdDesc").value + " Desc"
                        else
                            document.getElementById(ThisID + "_txtMultiColumnSortExpression").value += document.getElementById(ThisID + "_" + i + "_rdAsc").value + " Asc"
                    }

                }

                HideDivPopup();
                if (document.getElementById(ThisID + "_txtMultiColumnSortExpression").value != "") {
                    document.getElementById(ThisID + "_txtSubmitGrid").value = "Sort";
                    document.getElementById(ThisID + "_BtnSubmitSortGrid").click();
                }
                
            }
        }
    }
    function F_GetUserControlID(obj) {

        try {
            var strUserControlID = "";
            var iCounter = 0;

            while (++iCounter < 20 && obj != null && obj.IsMainTableGrid == null) {
                obj = obj.parentElement;

            }
            if (obj != null && obj.IsMainTableGrid != null && obj.IsMainTableGrid == "true") {
                strUserControlID = obj.UserControlID;

            }
            return strUserControlID;
        }
        catch (e) {
        }
    }

    
    //*************************************OnLoad*************************************
    function ShowDivPopup(obj) {


        var NewObj = obj.parentElement;
       
            var posX = NewObj.offsetLeft;
            var posY = NewObj.offsetTop;
           
            while (NewObj.offsetParent) {
            
                posX = posX + NewObj.offsetParent.offsetLeft;
                posY = posY + NewObj.offsetParent.offsetTop;
                if (NewObj == document.getElementsByTagName('body')[0]) { break }
                else { NewObj = NewObj.offsetParent; }
            }
            
            document.getElementById(ThisID + "_DivPopup").style.top = posY;
            document.getElementById(ThisID + "_DivPopup").style.left = posX-210 ;
            document.getElementById(ThisID + "_DivPopup").style.display = "inline";
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function HideDivPopup() {
            
            document.getElementById(ThisID + "_DivPopup").style.top = "";
            document.getElementById(ThisID + "_DivPopup").style.left = "";
            document.getElementById(ThisID + "_DivPopup").style.display = "none";
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function Cleargrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function Fillgrd() {
            RowIndex = 0;
            
            if (document.getElementById(this.id + "_txtGridSetting").value != "") {
                Cleargrd(document.getElementById(ThisID + "_grd"))     
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(ThisID + "_txtGridSetting").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/GridSetting[Viewable=1]')
                document.getElementById(ThisID + "_grd").style.height = 20*parseInt(xmlNodes.length)
                if (xmlNodes.length != 0) {

                    for (var j = 0; j < xmlNodes.length; ++j) {

                        document.getElementById(ThisID + "_grd").insertRow();
                        


                        document.getElementById(ThisID + "_grd").rows(j).insertCell();
                        document.getElementById(ThisID + "_grd").rows(j).insertCell();
                        document.getElementById(ThisID + "_grd").rows(j).insertCell();
                        

                        document.getElementById(ThisID + "_grd").rows(j).cells(0).style.width = "100px";
                        document.getElementById(ThisID + "_grd").rows(j).cells(1).style.width = "200px";
                        document.getElementById(ThisID + "_grd").rows(j).cells(2).style.width = "200px";

                        document.getElementById(ThisID + "_grd").rows(j).cells(0).align = "center";
                        document.getElementById(ThisID + "_grd").rows(j).cells(1).align = "right";
                        document.getElementById(ThisID + "_grd").rows(j).cells(2).align = "right";
                        
                        document.getElementById(ThisID + "_grd").rows(j).attachEvent('onmouseover', grd_OnMouseOver);
                        document.getElementById(ThisID + "_grd").rows(j).cells(0).innerHTML = "<input  style='background-color:Transparent;border-width: 0px;color:Black;width:100px' class='TxtControls' type='label' value='" + xmlNodes.item(j).selectSingleNode('ColTitle').text + "' />";
                        document.getElementById(ThisID + "_grd").rows(j).cells(1).innerHTML = "<input  id='" + ThisID +"_"+ j+ "_rdAsc'  type='radio' name='" + ThisID + j + "_rdSort'  value='" + xmlNodes.item(j).selectSingleNode('ColName').text + "'/>";
                        document.getElementById(ThisID + "_grd").rows(j).cells(2).innerHTML = "<input  id='" + ThisID +"_"+ j+ "_rdDesc' name='" + ThisID + j + "_rdSort'  type='radio'  value='" + xmlNodes.item(j).selectSingleNode('ColName').text + "'/></td></tr></table>";

                    }
                    

                    
                    document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRowSelected";

                    ShowDivPopup(objSorting);
                    

                }
            }



        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function onClickRdDesc(obj) {
            if (obj != null && obj.checked == true) {
                alert(obj.checked)
                obj.checked = false;
            }

        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function grd_OnMouseOver() {
            var obj = window.event.srcElement.parentElement.parentElement
            if (window.event.srcElement.tagName == "TD") {
                obj = window.event.srcElement.parentElement
            }
           
            
            if (obj != null && document.getElementById(ThisID + "_grd").rows(RowIndex) != null) {
                document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRow";
                RowIndex = obj.rowIndex;
                document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRowSelected";
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function grd_OnKeyDown(obj) {

            if (event.keyCode == 38) {
                if (RowIndex > 0) {
                    document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRow";
                    --RowIndex;
                    document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRowSelected";
                }

            }
            else if (event.keyCode == 40) {

                if (RowIndex < document.getElementById(ThisID + "_grd").rows.length - 1) {
                    document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRow";
                    ++RowIndex;
                    document.getElementById(ThisID + "_grd").rows(RowIndex).className = "CssGridRowSelected";
                }
            }            
            else if (event.keyCode == 27 || event.keyCode == 13) {
                HideDivPopup();

            }


        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
//    var ThisID = null;

//    this.id = F_GetUserControlID();

//    ThisID = this.id
//    alert(1)

    //            if ($get(ThisID + "_txtAllowPaging").value == "true") {
    //                document.getElementById('OToolBar_BtnPrv').disabled = true;

    //                document.getElementById('OToolBar_txtFromData').value = $get(ThisID + "_lblFrom").value;

    //                document.getElementById('OToolBar_txtToData').value = $get(ThisID + "_lblTo").value;
    //                document.getElementById('OToolBar_txtTotalData').value = $get(ThisID + "_lblTotal").value;
    //                alert(1)
    //                document.getElementById('OToolBar_txtCurPage').value = $get(ThisID + "_txtCurPage").value;
    //                document.getElementById('OToolBar_txtTotalPage').value = $get(ThisID + "_Totalpage").value;
    //                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
    //                    document.getElementById('OToolBar_BtnNext').disabled = true
    //                else
    //                    document.getElementById('OToolBar_BtnNext').disabled = false;
    //            }      
    //**********************************EndOnLoad*************************************


    //*************************************Toolbar*************************************
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //            alert(document.getElementById("ctl00_MtxtPageID").value)

//    AddHeader(document.getElementById(ThisID + "_MainGrid"))
//   alert(1)
//    function F_GetUserControlID() {
//        var UserControlID;
//        var nodes = document.getElementsByTagName('Table')
//        for (var i = 0; i < nodes.length; i++) {
//            if (nodes[i].IsGrid == "true") {
//                UserControlID = nodes[i].UserControlID;
//                return UserControlID;
//            }
//        }
//        return UserControlID;
//    }
//    function OnBlurtxtCurPage() {
//        document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

//        var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);

//        if (document.getElementById("OToolBar_txtCurPage").value != "" && document.getElementById("OToolBar_txtCurPage").value != "0"
//                && document.getElementById("OToolBar_txtCurPage").value != document.getElementById(ThisID + "txtCurPage").value) {

//            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
//                document.getElementById(ThisID + "_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
//                document.getElementById(ThisID + "txtSubmitGrid").value = "Const";
//                document.getElementById(ThisID + "BtnSubmitBindGrid").click();
//            }
//            else document.getElementById("OToolBar_txtCurPage").value = document.getElementById(ThisID + "_txtCurPage").value;
//        }
//        else
//            document.getElementById("OToolBar_txtCurPage").value = document.getElementById(ThisID + "_txtCurPage").value;
//    }
//    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    function OnClickBtnNext() {
//        var TotalPage = parseInt($get(ThisID + "_txtCurPage").value);
//        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
//            document.getElementById(ThisID + "_txtSubmitGrid").value = "BtnNext";
//            document.getElementById(ThisID + "_BtnSubmitBindGrid").click();
//            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
//                document.getElementById("OToolBar_BtnNext").disabled = true
//            else
//                document.getElementById("OToolBar_BtnNext").disabled = false
//        }
//    }
//    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    function OnClickBtnLast() {
//        document.getElementById(ThisID + "_txtSubmitGrid").value = "BtnLast";
//        document.getElementById(ThisID + "_BtnSubmitBindGrid").click();
//    }
//    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    function OnClickBtnPrv() {
//        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
//            document.getElementById(ThisID + "_txtSubmitGrid").value = "BtnPrev";
//            document.getElementById(ThisID + "_BtnSubmitBindGrid").click();

//            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
//                document.getElementById("OToolBar_BtnPrv").disabled = true
//            else
//                document.getElementById("OToolBar_BtnPrv").disabled = false
//        }
//    }
//    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    function OnClickBtnFirst() {
//        document.getElementById(ThisID + "_txtSubmitGrid").value = "BtnFirst";
//        document.getElementById(ThisID + "_BtnSubmitBindGrid").click();
//    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    function AddHeader(oGrid) {
//        var root = '/GeneralEntity/GridProperty'
//        var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
//        xmlDoc.loadXML(document.getElementById(ThisID + "_txtGridProperty").value)
//        xmlDoc.setProperty("SelectionLanguage", "XPath")
//        var xmlNodes = xmlDoc.documentElement.selectNodes(root);

//        //برای اضافه کردن ستونها
//        var rootGridSetting = '/GeneralEntity/GridSetting'
//        var xmlDocGridSetting = new ActiveXObject("MsXml2.DomDocument")
//        xmlDocGridSetting.loadXML(document.getElementById(ThisID + "_txtGridSetting").value)
//        xmlDocGridSetting.setProperty("SelectionLanguage", "XPath")
//        var xmlNodesGridSetting = xmlDocGridSetting.documentElement.selectNodes(rootGridSetting + "[Viewable=1]");
//        var str = ""
//        for (var k = 0; k < xmlNodesGridSetting.length; k++) {
//            document.getElementById(ThisID + "_header").insertCell()
//            document.getElementById(ThisID + "_header").cells(k).width = parseInt(xmlNodesGridSetting.item(k).selectSingleNode('Width').text)
//            if (xmlNodesGridSetting.item(k).selectSingleNode('Heigth').text == "")
//                document.getElementById(ThisID + "_header").cells(k).height = 20
//            else
//                document.getElementById(ThisID + "_header").cells(k).height = xmlNodesGridSetting.item(k).selectSingleNode('Heigth').text

//            str = "<th scope='col' style='height:" + xmlNodesGridSetting.item(k).selectSingleNode('Heigth').text + ";width:" + xmlNodesGridSetting.item(k).selectSingleNode('Width').text + ";'><span style=' color: #000000;font-family: Tahoma,Tahoma;'>" + xmlNodesGridSetting.item(k).selectSingleNode('ColTitle').text + "</span></th>";
//            document.getElementById(ThisID + "_header").cells(k).innerHTML = str
//            //                oGrid.rows(0).insertCell()
//            //                oGrid.rows(0).cells(k).width =parseInt( xmlNodesGridSetting.item(k).selectSingleNode('Width').text)
//            //                oGrid.rows(0).cells(k).height = xmlNodesGridSetting.item(k).selectSingleNode('Heigth').text
//            //                
//            //                str = "<th scope='col' style='height:" + xmlNodesGridSetting.item(k).selectSingleNode('Heigth').text + ";width:" + xmlNodesGridSetting.item(k).selectSingleNode('Width').text + ";'><span style=' color: #000000;font-family: Tahoma,Tahoma;'>" + xmlNodesGridSetting.item(k).selectSingleNode('ColTitle').text + "</span></th>";                             
//            //                oGrid.rows(0).cells(k).innerHTML = str
//        }
//        str = ""
//        alert(ThisID)
//        alert(document.getElementById(ThisID + "_header").innerHTML)
//    }
//        
</script>
