<%@ Page Title="------------------------------------------تعريف گروه کارتخوان---------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardReaderGroupNew.aspx.cs" ValidateRequest="false" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderGroupNew" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var SaveFlag = 0;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

            

        }

        function EndRequestHandler(sender, args) {

          
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                window.returnValue = "1";
                if (($get(MasterObj + "txtStatus").value == "2"))
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    SaveFlag = 1;
                }
            }
            if (StrVal == "Filter") {
                if (document.getElementById(MasterObj + "txtSelected").value == 1 && SelectedFlag == 1) {
                    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
                    document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
                    strChk += document.getElementById(MasterObj + "txtXmlChecked").value;
             
                    clearGrid(oGrid);
                    bindGrid(oGrid);
                    document.getElementById("Tr1").style.display = "none";
                    document.getElementById("Tr2").style.display = "inline";
                }
                else {
                    document.getElementById("Tr1").style.display = "inline";
                    document.getElementById("Tr2").style.display = "none";
                }


            }
         
          
            if (StrVal != "") {
                SetChk();
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
            }
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtStatus").value = "";
        }
    </script>
    <table>
        <tr>
            <td width="500px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="500px">
                <table style="border: thin inset #66FFFF">
                    <tr>
                        <td width="500px">
                            <table>
                                <tr>
                                    <td>
                                        نام گروه :
                                    </td>
                                    <td>
                                        <input type="text" id="txtGroupName" runat="server" Style="width: 250px" />
                                    </td>
                                    <td>
                                        دسته :
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="CmbCategory" Style="width: 120px" CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                 <td colspan="2" >
                                        <input type="checkbox" id="ChkShwAll" runat="server" onclick="OnClickChkShwAll(this)" />
                                        انتخاب همه
                                    </td>
                                    <td colspan="2">
                                        <input type="checkbox" id="chkSelectedCardReader" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                                        کارتخوان های انتخاب شده
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr1">
                        <td style="width: 500;" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <fieldset style="width: 250px; height: 300px; text-align: center;">
                                        <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                            انتخاب کارتخوان</font></legend>
                                        <div style="scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #B1D3FF; height: 300px; width: 240px;">
                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                        </div>
                                    </fieldset>
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
                                    <asp:HiddenField ID="CurPage" runat="server" />
                                    <asp:HiddenField ID="txtXmlChecked" runat="server" />
                                    <asp:HiddenField ID="txtStatus" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr id="Tr2">
                        <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; width: 500px; height: 200px"
                            valign="top" align="center">
                            <fieldset style="width: 260px; height: 200px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                    گروه های انتخاب شده</font></legend>
                                <table id="XTabTable_Header" style="width: 260px; height: 26px;" align="center">
                                    <thead style="display: inline" align="center">
                                        <tr>
                                            <td class="CssHeaderStyle" align="center" style="width: 25px;">
                                            </td>
                                            <td class="CssHeaderStyle" align="center" style="width: 120px">
                                                نام کارتخوان
                                            </td>
                                            <td class="CssHeaderStyle" align="center" style="width: 120px">
                                                شماره کارتخوان
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div style="overflow: auto; width: 260px; height: 270px" align="center">
                                    <table id="grdSub" width="260px" onclick="onClickGrdSub()">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
    <div style="display: none">
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtGroupCardReaderSearch" name="txtGroupCardReaderSearch" runat="server" />
        <input type="text" id="txtSelected" name="txtSelected" runat="server" />
        <input type="text" id="txtXmlCardReaderGroup" name="txtSelected" runat="server" />
        <input type="text" id="txtCardReaderGroupID" name="txtSelected" runat="server" />
        <input type="text" id="txtAllowEdit" name="txtAllowEdit" runat="server" />
         <input type="text" id="txtXmlShowAll" name="txtXmlShowAll" runat="server" />
       
              
    </div>

     <script type="text/javascript" language="javascript">
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         var MasterObj = "ctl00_ContentPlaceHolder1_";

         var oGrid = document.getElementById("grdSub");
         var strChk = "";
         var newrowindex = 0;
         var SelectedFlag = 0;
         var SelectedFlagEdit = 0;
         document.getElementById("Tr2").style.display = "none";
        //-----------------------------------------------------------------------------     
         if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {
             document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("<BaseInfoEntity>", "");
             document.getElementById(MasterObj + "txtXmlChecked").value = document.getElementById(MasterObj + "txtXmlChecked").value.replace("</BaseInfoEntity>", "");
             strChk = document.getElementById(MasterObj + "txtXmlChecked").value;
         }
         ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNext() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnPrv() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnLast() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnFirst() {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }
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
         function OndbClickGrd() {
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnNew() {

             document.getElementById(MasterObj + "txtGroupName").value = "";
             document.getElementById(MasterObj + "CmbCategory").value = "0";
             strChk = "";
             if (LastSelectedRow != null) {
                 LastSelectedRow.className = LastSelectedRowClass;
                 LastSelectedRow = null;
             }
             //======================================================
             var oGrid = document.getElementById("GrdCardReaderGroupNew")
             if (oGrid) {
                 var oLen = oGrid.rows.length

                 for (var i = 1; i < oLen; ++i) {
                     oGrid.rows(i).cells(0).firstChild.checked = false
                 }
             }

         }

         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnCancel() {
             window.returnValue = SaveFlag;
             window.close();

         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnSave() {
//         alert(strChk)
             try {
                 if ($get(MasterObj + "txtGroupName").value == "")
                     alert("لطفا نام گروه را وارد کنيد");
                 else if ($get(MasterObj + "CmbCategory").value == "0")
                     alert("لطفا دسته را انتخاب نماييد");
                 else {

                     document.getElementById(MasterObj + "txtXmlCardReaderGroup").value = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>"
//                      alert(document.getElementById(MasterObj + "txtXmlCardReaderGroup").value);

                     document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
             }
             catch (Exception) {
                 alert("اطلاعات ناقص است");
             }
         }
//         !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickHeaderChk(obj) {
             var OGrid = document.getElementById("GrdSelectCode");
             var oLen = OGrid.rows.length

             for (var i = 1; i < oLen; i++) {
                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                 OnClickChk(OGrid.rows(i).cells(0).firstChild);
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickChk(obj) {
//         alert(strChk)
             var oGrid = obj.parentElement;
             while (oGrid.tagName != "TABLE")
                 oGrid = oGrid.parentElement

             var oRow = obj.parentElement;
             while (oRow.tagName != "TR")
                 oRow = oRow.parentElement
             var oIndex = oRow.rowIndex
             //========================================================
             var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>"

             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(strXml);

             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader [ CardReaderID=" + oGrid.rows(oIndex).getAttribute("CardReaderID") + "]");
             //========================================================
             if (oXmlNodes.length > 0) {
                 if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                     var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                     f.selectSingleNode("Chk").text = 1;
                     oXmlDoc.childNodes[0].appendChild(f);
                     //                oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                 }
                 else {
                     var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                     f.selectSingleNode("Chk").text = 0;
                     oXmlDoc.childNodes[0].appendChild(f);
                     //                oXmlNodes.item(0).selectSingleNode("Selected").text = 0
                 }


                 strXml = oXmlDoc.xml;
                 strChk = strXml.replace("<BaseInfoEntity>", "");
                 strChk = strChk.replace("</BaseInfoEntity>", "");
             }
             else {
                 strChk += "<CardReader>"
                 strChk += "<CardReaderID>" + oGrid.rows(oIndex).getAttribute("CardReaderID") + "</CardReaderID>"
                 strChk += "<CardReaderNo>" + oGrid.rows(oIndex).cells(1).innerText+ "</CardReaderNo>"
                 strChk += "<CardReaderName>" + oGrid.rows(oIndex).cells(2).innerText + "</CardReaderName>"
                 if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                     strChk += "<Chk>0</Chk>"
                 else
                     strChk += "<Chk>1</Chk>"
                
                 strChk += "</CardReader>"
             }

         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function SetChk() {
             var i = 0;
             var j = 0;
            
             var OGrid = document.getElementById("GrdCardReaderGroupNew");
             
             if (OGrid == null)
                 return
             var PageSize = OGrid.rows.length
             var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>"
            
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(strXml);

             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader");

             for (j = 0; j < oXmlNodes.length; j++) {
                 for (i = 1; i < PageSize; i++) {
                     if (OGrid.rows(i).getAttribute("CardReaderID") == oXmlNodes.item(j).selectSingleNode("CardReaderID").text) {
                         if (oXmlNodes.item(j).selectSingleNode("Chk").text == "1")
                             OGrid.rows(i).cells(0).firstChild.checked = true;
                         else
                             OGrid.rows(i).cells(0).firstChild.checked = false;
                     }
                 }
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickChkSelectedGroup() {
             if (document.getElementById(MasterObj + "txtAllowEdit").value == "1") {

                 if (document.getElementById(MasterObj + "chkSelectedCardReader").checked == true && SelectedFlag == 0) {
                     document.getElementById('OToolBar_BtnNext').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnPrv').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnFirst').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnLast').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtFromData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtToData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtCurPage').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalPage').style.visibility = "hidden";
                     SelectedFlag = 1;
                     document.getElementById(MasterObj + "txtSelected").value = 1;
                     document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
                 else if (document.getElementById(MasterObj + "chkSelectedCardReader").checked == true && SelectedFlag == 1) {
                     document.getElementById('OToolBar_BtnNext').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnPrv').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnFirst').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnLast').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtFromData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtToData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtCurPage').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalPage').style.visibility = "hidden";

                     clearGrid(oGrid);
                     bindGrid(oGrid);
                     document.getElementById("Tr1").style.display = "none";
                     document.getElementById("Tr2").style.display = "inline";
                 }
                 else if (document.getElementById(MasterObj + "chkSelectedCardReader").checked == false) {
                 document.getElementById('OToolBar_BtnNext').style.visibility = "visible";
                 document.getElementById('OToolBar_BtnPrv').style.visibility = "visible";
                 document.getElementById('OToolBar_BtnFirst').style.visibility = "visible";
                 document.getElementById('OToolBar_BtnLast').style.visibility = "visible";
                 document.getElementById('OToolBar_txtFromData').style.visibility = "visible";
                 document.getElementById('OToolBar_txtToData').style.visibility = "visible";
                 document.getElementById('OToolBar_txtTotalData').style.visibility = "visible";
                 document.getElementById('OToolBar_txtCurPage').style.visibility = "visible";
                 document.getElementById('OToolBar_txtTotalPage').style.visibility = "visible";
                 
                     document.getElementById(MasterObj + "txtSelected").value = 0;
                     document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
             }
             else {
                 if (document.getElementById(MasterObj + "chkSelectedCardReader").checked == true) {
                     document.getElementById('OToolBar_BtnNext').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnPrv').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnFirst').style.visibility = "hidden";
                     document.getElementById('OToolBar_BtnLast').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtFromData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtToData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalData').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtCurPage').style.visibility = "hidden";
                     document.getElementById('OToolBar_txtTotalPage').style.visibility = "hidden";
                     if (strChk != "<BaseInfoEntity></BaseInfoEntity>")
                         clearGrid(oGrid);
                     bindGrid(oGrid);
                 }
                 else {
                     document.getElementById('OToolBar_BtnNext').style.visibility = "visible";
                     document.getElementById('OToolBar_BtnPrv').style.visibility = "visible";
                     document.getElementById('OToolBar_BtnFirst').style.visibility = "visible";
                     document.getElementById('OToolBar_BtnLast').style.visibility = "visible";
                     document.getElementById('OToolBar_txtFromData').style.visibility = "visible";
                     document.getElementById('OToolBar_txtToData').style.visibility = "visible";
                     document.getElementById('OToolBar_txtTotalData').style.visibility = "visible";
                     document.getElementById('OToolBar_txtCurPage').style.visibility = "visible";
                     document.getElementById('OToolBar_txtTotalPage').style.visibility = "visible";
                     
                     document.getElementById("Tr1").style.display = "inline";
                     document.getElementById("Tr2").style.display = "none";
                     SetChk();
                 }

             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function clearGrid(oGrid) {
             while (oGrid.rows.length > 0) {
                 oGrid.deleteRow(0);
             }
         }
         //====================================================
         function bindGrid(oGrid) {
//         alert()
             clearGrid(oGrid);
             newrowindex = 0;

             var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>";

             var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
             xmlDoc.loadXML(strXml)
             xmlDoc.setProperty("SelectionLanguage", "XPath")
             var XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader[Chk=1]")
//             alert(XmlNodes.length)
             var len = XmlNodes.length

             var oIndex = 0
             for (var i = 0; i < len; i++) {
                 AddRow(oGrid,
                                 XmlNodes.item(i).selectSingleNode('CardReaderNo').text,
                                 XmlNodes.item(i).selectSingleNode('CardReaderName').text);
             }
             document.getElementById("Tr1").style.display = "none";
             document.getElementById("Tr2").style.display = "inline";
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function AddRow(oGrid, CardReaderNo, CardReaderName) {
             oGrid.insertRow();
             
             if ((oGrid.rows.length - 1) % 2 == 0)
                 oGrid.rows(newrowindex).className = "CssItemStyle"
             else
                 oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";
                 
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()

             oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' checked=true   style='WIDTH:23px' onclick='OnClickChkSelectedGrid(this)'  />";
             oGrid.rows(newrowindex).cells(1).innerHTML = "<asp:Label  runat='server'>" + CardReaderNo + "</asp:Label>"
             oGrid.rows(newrowindex).cells(2).innerHTML = "<asp:Label  runat='server'>" + CardReaderName + "'</asp:Label>'"

             oGrid.rows(newrowindex).align = "center"
             oGrid.rows(newrowindex).dir = "rtl"

             oGrid.rows(newrowindex).cells(0).style.width = "23px"
             oGrid.rows(newrowindex).cells(1).style.width = "123px"
             oGrid.rows(newrowindex).cells(2).style.width = "123px"
            
             newrowindex = newrowindex + 1
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function onClickGrdSub() {
             var oGrdSub = document.getElementById("grdSub")
             var index = -1
             var oRow = event.srcElement

             //_______Find Row
             for (var i = 0; oRow.tagName != "TR"; i++)
                 oRow = oRow.parentElement
             index = oRow.rowIndex
             if (oRow.parentElement.parentElement.id == "grdSub") {
                 for (i = 0; i < oGrdSub.rows.length; i++) {
                     if (oGrdSub.rows(i).className == "CssSelectedItemStyle") {
                       
                         if ((i % 2) == 0)
                             oGrdSub.rows(i).className = "CssItemStyle"
                         else
                             oGrdSub.rows(i).className = "CssAlternatingItemStyle";
                     }
                 }
                 oRow.className = "CssSelectedItemStyle"
                 LastSelectedRow = oRow
             }

         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickChkSelectedGrid(obj) {
          
             var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>";
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(strXml)


             if (obj.checked == false) {
                 obj.parentElement.parentElement.style.display = "none";
                 var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM")
                 oXmlDoc1.async = "false";
                 oXmlDoc1.loadXML("<BaseInfoEntity></BaseInfoEntity>")

                 if (oXmlDoc.xml != oXmlDoc1.xml && oXmlDoc.xml != "<BaseInfoEntity></BaseInfoEntity>") {
                     var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader[CardReaderNo=" + obj.parentElement.parentElement.cells(1).innerText + "]");

                     if (xmlNodes.length != 0) {
                         var f = oXmlDoc.documentElement.removeChild(xmlNodes.item(0));
                         f.selectSingleNode("Chk").text = 0;
                         oXmlDoc.childNodes[0].appendChild(f);
                         strChk = oXmlDoc.xml;

                     }
                 }
             }
             strChk = strChk.replace("<BaseInfoEntity>", "");
             strChk = strChk.replace("</BaseInfoEntity>", "");

         }
         // ================================================== Chkتيک خوردن همه ============================================

         function OnClickHeaderChk(obj) {
             var OGrid = document.getElementById("GrdCardReaderGroupNew");
             var grdLen = OGrid.rows.length;

             if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                 grdLen = grdLen - 1;
             for (var i = 1; i < grdLen; i++) {
                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                 OnClickChk(OGrid.rows(i).cells(0).firstChild);
             }
         }
         //===============================================OnClickChkShwAll================================================
         function OnClickChkShwAll(obj) {
        
             var RowIndex = obj.parentElement.parentElement.rowIndex;
             var TbObj = obj.parentElement.parentElement.parentElement.parentElement
             var s = $get(MasterObj + "txtXmlShowAll").value
//            alert($get(MasterObj + "txtXmlShowAll").value)
             var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDocSave.loadXML(s);
             var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/CardReader[Chk=1]");
             strChk = "";
//             alert(XmlNodeTmp.length)
             for (i = 0; i < XmlNodeTmp.length; i++) {
                 strChk += "<CardReader>";
                 if (obj.checked)
                     strChk += "<Chk>1</Chk>"
                 else
                     strChk += "<Chk>0</Chk>"
//                 strChk += "<Selected>1</Selected>"
                 strChk += "<CardReaderID>" + XmlNodeTmp.item(i).selectSingleNode('CardReaderID').text + "</CardReaderID>"
                 strChk += "<CardReaderNo>" + XmlNodeTmp.item(i).selectSingleNode('CardReaderNo').text + "</CardReaderNo>"
                 strChk += "<CardReaderName>" + XmlNodeTmp.item(i).selectSingleNode('CardReaderName').text + "</CardReaderName>"
                 strChk += "</CardReader>";
//                 alert( strChk)
             }

             SetChk()

         }
         //===============================================================================================








  

    </script>
</asp:Content>

 