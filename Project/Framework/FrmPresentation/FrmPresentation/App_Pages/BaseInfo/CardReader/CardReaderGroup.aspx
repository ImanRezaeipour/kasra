<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardReaderGroup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderGroup" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>    
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

            
            
        }

        function EndRequestHandler(sender, args) {
               
            
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if (($get(MasterObj + "txtStatus").value == "2"))
                    alert($get(MasterObj + "txtAlert").value);
                else
                    SetMsg($get(MasterObj + "txtAlert").value);
            }

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtStatus").value = "";

            if (StrVal != "") {

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
           SetGrideReload()
            SetChk()
        }
    </script>

    <table  align="center">
        <tr>
            <td>
             <fieldset dir="rtl" style="width: 100%; height:50px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: lightblue">آيتم هاي جستجو</legend>
                <table  align="center">
                    <tr>
                        <td>
                            نام گروه :
                        </td>
                        <td>
                        <input type="text" class="TxtControls" style="width:250px" runat="server" id="txtGroupName" />
                        </td>
                        <td style="width:120px"></td>
                        <td>
                             کارتخوان :
                        </td>
                        <td>
                            <componentart:combobox id="CmbCardReader" runat="server" onchange="OnChangePersponCode()"
                                runningmode="CallBack" autohighlight="false" autocomplete="true" autofilter="true"
                                datatextfield="CardReaderNo" datafields="CardReaderNo,Name" cssclass="comboBox"
                                hovercssclass="comboBoxHover" bordercolor="#528bc5" focusedcssclass="comboBoxHover"
                                textboxcssclass="TxtControls" textboxhovercssclass="comboBoxHover" dropdowncssclass="comboDropDown"
                                itemclienttemplateid="itemTemplate" itemcssclass="comboItem" itemhovercssclass="comboItemHover"
                                selecteditemcssclass="comboItemHover" drophoverimageurl="../../../App_Utility/Images/Icons/Down1.gif"
                                dropimageurl="../../../App_Utility/Images/Icons/Down1.gif" dropdownpagesize="10"
                                dropdownwidth="300" width="200" ondatarequested="ComboBox1_DataRequested" filterfield="CardReaderNo">
                            <ClientTemplates>
                            <ComponentArt:ClientTemplate ID="itemTemplate">
                          <table border="2" cellpadding="0" cellspacing="0" width="100%" style="background-color:White";><tr class="dataRow"><!--<td class="dataCell" style="width:100px;">## DataItem.getProperty('PersonID') ##</td>--><td class="dataCell" align="center" style="width:100px;">## DataItem.getProperty('CardReaderNo') ##</td><td class="dataCell">## DataItem.getProperty('Name') ##&nbsp;</td></tr></table>
                        </ComponentArt:ClientTemplate>
                       </ClientTemplates>
                            <DropDownHeader>
                             <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr class="headingRow" style="background-color:White";><!--<td class="headingCell" style="width:100px;">PersonID</td>--><td class="headingCell" align="center" style="width:100px;">CardReaderNo</td><td class="headingCell">Name</td></tr></table>
                                                      </DropDownHeader>
                            </componentart:combobox>
                        </td>
                   
                      
                    </tr>
                </table>
                  </fieldset>
            </td>
        </tr>
        <tr>
            <td style="width:900px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        
                        <td>
                            <input type="checkbox" id="ChkShwAll" onclick="OnClickChkShwAll(this)" runat="server" />انتخاب
                             همه
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:400px;">
            <td style="border: medium groove #C0C0C0; background-color: #C5D5E9; height: 400px"
                valign="top" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
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
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtStatus" runat="server" />
                          <asp:HiddenField ID="txtCardReaderGroupID" runat="server" />
                           <asp:HiddenField ID="txtXmlShowAll" runat="server" />
                           <asp:HiddenField ID="txtXML" runat="server" />
                        <div style="height: 339px; position: fixed; top: 10px; right: 484px;"  align="center">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
        <input type="text" id="txtCardReaderNo" name="txtCardReaderNo" runat="server" />
        <input type="text" id="txtCardReaderGroupSearch" name="txtActiveStatus" runat="server" />
       
          <input type="text" id="txtXmlDel" name="txtXmlDel" runat="server" />
           <input type="text" id="txtXmlChk" name="txtXmlChk" runat="server" />
            <input type="text" id="txtSelectChk" name="txtSelectChk" runat="server" />
            
           
    </div>

    <script type="text/javascript" language="javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var Str = ""
        var str1 = ""
        var s = $get(MasterObj + "txtXML").value
//        alert ($get(MasterObj + "txtXMLSaved").value)
        var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocSave.loadXML(s);
        document.body.dir = "rtl";
        var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup[Chk=1]");
        for (i = 0; i < XmlNodeTmp.length; i++) {
            str1 += "<GetCardReaderGroup>";
            str1 += "<Chk>1</Chk>"
            str1 += "<CardReaderGroupID>" + XmlNodeTmp.item(i).selectSingleNode('CardReaderGroupID').text + "</CardReaderGroupID>"
            str1 += "</GetCardReaderGroup>"
          

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
            var url = "CardReaderGroupNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
            + "&CardReaderGroupID=" + LastSelectedRow.getAttribute("CardReaderGroupID")
            + "&GroupName=" + LastSelectedRow.cells(1).innerText
            + "&CategoryID=" + LastSelectedRow.getAttribute("CategoryID")
            + "&AllowEdit=1" 
            + "&SessionID=" + $get(MasterObj + "txtSessionID").value;
            url = encodeURI(url)

            returnValue = window.showModalDialog(url, "window", 'dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no');

            if (returnValue == 1) {
                OnClickBtnFilter();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {

            document.getElementById(MasterObj + "txtCardReaderNo").value = $get(MasterObj + "CmbCardReader_Input").value.split("-")[0];
            document.getElementById(MasterObj + "txtCardReaderGroupSearch").value = document.getElementById(MasterObj + "txtGroupName").value
        
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {

            $get(MasterObj + "txtCardReaderNo").value = "";
            $get(MasterObj + "txtCardReaderGroupSearch").value = "";
            $get(MasterObj + "txtGroupName").value = "";
            $get(MasterObj + "CmbCardReader_Input").value = "";
            document.getElementById(MasterObj + "ChkShwAll").checked = ""
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnDel() {
             var OGrid = document.getElementById("GrdCardReaderGroup");
             var strXML = "<Root>" + str1 + "</Root>";
//             alert(strXML)
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
        
            var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/Root/GetCardReaderGroup[Chk=1]");
//                            alert(XmlNodeTmp.length)
                     if (XmlNodeTmp.length != 0) {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {
                    //                alert()
                     document.getElementById(MasterObj +"txtXMLDel").value = strXML
//                  alert( document.getElementById(MasterObj +"txtXMLDel").value)
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();

                }
            }
            
            else
                alert("به منظور حذف یک سطر را انتخاب کنید")

            
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            if (LastSelectedRow != null) {
                OndbClickGrd();
            }
            else
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
        function OnClickBtnNew() {
            returnValue = window.showModalDialog("CardReaderGroupNew.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value +"&AllowEdit=0", "", 'dialogHeight: 550px;dialogWidth: 550px;center: Yes;help: no;status: no');
            if (returnValue == 1) {
                OnClickBtnFilter();
            }
        }
//        =================================================== Chkتيک خوردن همه ============================================

        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdCardReaderGroup");
            var grdLen = OGrid.rows.length;

            if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }

  
        //==============================================================================================
        function OnClickChk(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var CardReaderGroupID = TbObj.rows(RowIndex).getAttribute("CardReaderGroupID")
            var strXML = "<BaseInfoEntity>" + str1 + "</BaseInfoEntity>";
//            alert(str1)
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<BaseInfoEntity></BaseInfoEntity>") && (strXML != "<BaseInfoEntity/>"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup[CardReaderGroupID=" + CardReaderGroupID + "]");
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true)
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                str1 = oXmlDocSave.xml;
                str1 = str1.replace("<BaseInfoEntity>", "")
                str1 = str1.replace("</BaseInfoEntity>", "")

            }
            else {

                str1 += "<GetCardReaderGroup>";
                str1 += "<Chk>1</Chk>"
                str1 += "<CardReaderGroupID>" +CardReaderGroupID+"</CardReaderGroupID>"
                str1 += "</GetCardReaderGroup>";
                SetChk()
            }
            if (obj.checked == false) {
                $get(MasterObj + "ChkShwAll").checked=false

            }
        }
        //================================================SetChk====================================================
        function SetChk() {
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            var OGrid = document.getElementById("GrdCardReaderGroup");
            oXml.async = "false";
            var strXML = "<BaseInfoEntity>" + str1 + "</BaseInfoEntity>";
//            alert(str1)
            oXml.loadXML(strXML);
            var XmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup");
//            alert(XmlNode.length)
            if (XmlNode.length != 0) {
//               alert(4)
                if (OGrid != null) {
//                alert(10)
                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;

                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("GetCardReaderGroup[CardReaderGroupID=" + OGrid.rows(i).getAttribute("CardReaderGroupID") + "]");
                        if (XmlNode1.length != 0) {
//                        alert()
                            if (XmlNode1.item(0).selectSingleNode('Chk').text.toString() == "1")
                                OGrid.rows(i).cells(0).firstChild.checked = true
                            else
                                OGrid.rows(i).cells(0).firstChild.checked = false
                        }
                    }

                }
            }
        }


//        ========================================OnClickChkShwAll(obj)======================================================
               function OnClickChkShwAll(obj) {
                   var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                   oXmlDocSave.loadXML($get(MasterObj + "txtXmlShowAll").value);
                   var XmlNode = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup[Chk=1]");
                   str1 = "";
        //           alert( XmlNode.length)
                   for (i = 0; i < XmlNode.length; i++) {
                       str1 += "<GetCardReaderGroup>";
                       if (obj.checked) 
                           str1 += "<Chk>1</Chk>"
                       else
                           str1 += "<Chk>0</Chk>"
                          
                       str1 += "<CardReaderGroupID>" + XmlNode.item(i).selectSingleNode('CardReaderGroupID').text + "</CardReaderGroupID>"
                       str1 += "</GetCardReaderGroup>";
        //               alert(str1)

                   }

                 SetChk()
               }
                  
// ==============================================================================================
               function SetGrideReload() {
                   var OGrid = document.getElementById("GrdCardReaderGroup");
                   var PageSize = OGrid.rows.length;
                   if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                       PageSize = PageSize - 1;

                   if ($get(MasterObj + "ChkShwAll").checked) {
                       var oXml = new ActiveXObject("Microsoft.XMLDOM");
                       oXml.async = "false";
                       oXml.loadXML($get(MasterObj + "txtXML").value);
                       var XmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup");
                       var oXmlDocBase = new ActiveXObject("Microsoft.XMLDOM");
                       var xmlNodeBase;
                       oXmlDocBase.async = "false";
                       oXmlDocBase.loadXML($get(MasterObj + "txtXmlShowAll").value)
                       xmlNodeBase = oXmlDocBase.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup");
                       if ($get(MasterObj + "txtXmlShowAll").value == "")
                           $get(MasterObj + "txtXmlShowAll").value = "<BaseInfoEntity></BaseInfoEntity>";

                       if (XmlNode.length > 0) {
                           for (var i = 0; i < XmlNode.length; i++) {
                               xmlNodeBase = oXmlDocBase.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup[CardReaderGroupID=" + XmlNode.item(i).selectSingleNode('CardReaderGroupID').text.toString() + "]");
//                                                      alert(xmlNodeBase.length)
                               if (xmlNodeBase.length == 0) {
 
//                                                          alert()
//                                  if (XmlNode[i].selectSingleNode("Chk").text == "1") {
                                   str1 += "<GetCardReaderGroup>";
                                   str1 += "<Chk>1</Chk>"
                                   str1 += "<CardReaderGroupID>" + XmlNode.item(i).selectSingleNode('CardReaderGroupID').text + "</CardReaderGroupID>"
                                   str1 += "</GetCardReaderGroup>";


//                                                              }

                               }

                           }


                           xmlNodeBase = oXmlDocBase.documentElement.selectNodes("/BaseInfoEntity/GetCardReaderGroup");
                           if (xmlNodeBase.length == 0)
                               $get(MasterObj + "txtXmlShowAll").value = "<BaseInfoEntity>" + str1 + "</BaseInfoEntity>"
                           else
                               $get(MasterObj + "txtXmlShowAll").value = $get(MasterObj + "txtXmlShowAll").value.replace("</BaseInfoEntity>", str1 + "</BaseInfoEntity>")
                          
//                                              alert($get(MasterObj + "txtXmlShowAll").value)

                       }

//                       else if (OGrid.rows(0).cells(0).firstChild.checked = true) {
////                           alert()
//                           for (var i = 1; i < PageSize; i++) {
//                               OGrid.rows(i).cells(0).firstChild.checked = true
//                               OnClickChk(OGrid.rows(i).cells(0).firstChild);
//                           }
//                       }
                   }
               }



               

    </script>
</asp:Content>
