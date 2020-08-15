<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionRelationDetail.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.ActionRelationDetail" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<title>ارتباط فعاليت و داده</title>

<script language="javascript">
       var MasterObj = "ctl00_ContentPlaceHolder1_";
       var str = '';
       /////-------------------------------------------
    </script>
    
    
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 
                   <script type="text/javascript" language="javascript">
                       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                       function BeginRequestHandler(sender, args) {
                           //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
                           document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                       }

                       function EndRequestHandler(sender, args) {
                          document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                           var StrVal = $get(MasterObj + "txtSubmit").value

                           if (StrVal == "Modify") {
                               //alert("ذخيره شد")
                               if ($get(MasterObj + "txtAlert").value != "")
                                   SetMsg($get(MasterObj + "txtAlert").value);
                               $get(MasterObj + "txtSaveXml").value = "";
                               MakeXML();
                           }
                           $get(MasterObj + "txtSubmit").value = "";
                       }
                             </script>
    <table style="width: 100%; height: 505px">
        <tr>
            <td style="height: 39px">
        
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">    
            <ContentTemplate> 
            <table style="width: 62%">
                <tr>
                    <td style="width: 119px">
                        نام زیرسیستم :</td>
                    <td style="width: 186px">
                        <asp:DropDownList ID="CmbSubSys" runat="server" onchange="onChangeCmbSubSys()" 
                            style="height: 22px" Width="135px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 87px">
                        نام صفحه :</td>
                    <td>
                        <asp:DropDownList ID="CmbPageName" runat="server" onchange="onChangeCmbPage()" 
                            Width="135px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>    
            </td>
        </tr>
        <tr>
            <td style="height: 12px">
                <uc1:ToolBar ID="OToolBar" runat="server" 
                    PageName="ActionRelationDetail.aspx" PageID="1127" />
               
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional"> 
                     <ContentTemplate>
                <table style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                    border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid;top: 200px; left: 200px; display: inline; background-color: #e7eeff; 
                    width: 100%;height:100%">
                    <tr>
                        <td valign="top" style="height: 488px; width: 58%;">
                     <div style="DISPLAY: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="txtTempSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtActionRelationID" runat="server" />
                            <asp:HiddenField ID="txtSubSysID" runat="server" />
                            <asp:HiddenField ID="txtPageID" runat="server" />
                            <asp:HiddenField ID="txtTempXML" runat="server" />
                        </div>
                        <fieldset style="WIDTH: 100%; HEIGHT: 100%"><legend><FONT class="AutomationTxts" style="FONT-SIZE: 14px; COLOR: #cc0000">فعاليت</FONT></legend>
                        <div style="width: 100%; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF; height: 500px" >   
                            <asp:placeholder EnableViewState="false" id="ActionGridViewPlaceHolder" runat="Server"/>
                        </div> 
                           </fieldset> 
                        </td>
                        <td valign="top" style="height: 488px">
                        <fieldset style="WIDTH: 100%; HEIGHT: 100%"><legend><FONT class="AutomationTxts" style="FONT-SIZE: 14px; COLOR: #cc0000">دسترسی هاي داده اي</FONT></legend>
                        <div style="width: 100%; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF; height: 500px; margin-right: 0px;" >   
                            <asp:placeholder EnableViewState="false" id="AccessGridViewPlaceHolder" runat="Server"/>
                        </div>  
                        </fieldset>   
                        </td>
                    </tr>
                </table>
               </ContentTemplate>
                         <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                            </Triggers>
                       </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="DISPLAY: none">
    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />           
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server"  />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server"/>
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server"/>
        <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server"  />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server"  />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
       <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />  
       <asp:Button ID="BtnSubmitPageName" runat="server" Text="BtnSubmitPageName" onclick="BtnSubmitPageName_Click" />     
    </div>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
    <script language="javascript" type="text/javascript">
        window.name = "ActionRelationDetail.aspx"
        aspnetForm.target = "ActionRelationDetail.aspx"

        if ($get(MasterObj + "txtTempXML").value != "")
            MakeXML();
        //*************************************Toolbar*************************************
        function OnClickBtnCancel() {
            returnValue = "1";
            window.close();
        }
        //*************************************Toolbar*************************************
        function OnClickBtnNew() {
            $get(MasterObj + 'txtSaveXml').value = '';
            $get(MasterObj + "txtSubmit").value = "New";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if ($get(MasterObj + 'txtSaveXml').value != "") {
                $get(MasterObj + "txtSubmit").value = "Modify";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else
                alert("لطفا فعاليت و دسترسي هاي مورد نظر را انتخاب نماييد.")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //**********************************EndToolbar*************************************
        
        //*************************************ThisPage*************************************
        function OnClickChk(obj) {
            var SelectedRow = obj.parentElement.parentElement;
            
            if ($get(MasterObj + 'txtSaveXml').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + "txtSaveXml").value);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/ActionDetail");  //[ActionID='" + obj.value + "']");
                oXmlNodes.item(0).selectSingleNode('ActionID').text = SelectedRow.getAttribute("ActionAccessID");
                $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
            }
            else {
                $get(MasterObj + 'txtSaveXml').value = "<Root><ActionDetail>"
                $get(MasterObj + 'txtSaveXml').value += "<ActionID>" + SelectedRow.getAttribute("ActionAccessID") + "</ActionID>";
                $get(MasterObj + 'txtSaveXml').value += "</ActionDetail></Root>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbSubSys() {
            document.getElementById(MasterObj + "txtSubSysID").value = document.getElementById(MasterObj + "CmbSubSys").value
            document.getElementById(MasterObj + "txtSubmit").value = "FilterCmbPageName";
            document.getElementById(MasterObj + "BtnSubmitPageName").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPage() {
            document.getElementById(MasterObj + "txtPageID").value = document.getElementById(MasterObj + "CmbPageName").value
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChkAccessDetail(obj) {
            var SelectedRow = obj.parentElement.parentElement;
            
            if ($get(MasterObj + 'txtSaveXml').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + "txtSaveXml").value);

                var Val = ((SelectedRow.getAttribute("MainRowID") == 1) ? "0" : SelectedRow.getAttribute("Val"))
                var StrWh = '';
                if (SelectedRow.getAttribute("MainRowID") == 1)  //سطر اصلي
                    StrWh = "AccessID='" + SelectedRow.getAttribute("AccessID") + "' and SubAccessID='" + Val + "'"
                else  //زير مجموعه سطر اصلي
                    StrWh = "AccessID='" + Val + "' and SubAccessID='" + SelectedRow.getAttribute("AccessID") + "'";

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/AccessDetail ["+StrWh+" and TypeID='" + SelectedRow.getAttribute("TypeID") + "' and Selected=1]");
                
                if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
                    $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;

                    if (SelectedRow.getAttribute("MainRowID") == 1)
                        SetChkGrid(obj, SelectedRow)
                    else if (SelectedRow.getAttribute("MainRowID") == 0 & !obj.checked) {
                        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/AccessDetail [AccessID='" + SelectedRow.getAttribute("AccessID") + "' and SubAccessID=0 and TypeID='" + SelectedRow.getAttribute("TypeID") + "' and Selected=1]");
                        if (oXmlNodes.length != 0) {
                            oXmlNodes.item(0).selectSingleNode('Selected').text = "0";
                            $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
                            SetChkGrid(obj, SelectedRow)
                        }
                    }
                }

                else { // if (oXmlNodes.length == 0)
                    /*oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/AccessDetail [TypeID='" + SelectedRow.getAttribute("TypeID") + "' and AccessTypeID='" + SelectedRow.getAttribute("AccessTypeID") + "' and Selected=1]");

                    if (oXmlNodes.length == 0 | SelectedRow.getAttribute("TypeID") == 2 |
                        (SelectedRow.getAttribute("TypeID") == 1 & SelectedRow.getAttribute("MainRowID") == 0)) {
                        */
                        var Str = "<AccessDetail>";
                        if (SelectedRow.getAttribute("MainRowID")=="1")
                        {
                            Str += "<AccessID>" + SelectedRow.getAttribute("AccessID") + "</AccessID>";
                            Str += "<SubAccessID>0</SubAccessID>"
                        }
                        else{
                            Str += "<AccessID>" + SelectedRow.getAttribute("Val") + "</AccessID>";
                            Str += "<SubAccessID>" + SelectedRow.getAttribute("AccessID") + "</SubAccessID>"
                        }
                       
                        Str += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                        Str += "<TypeID>" + SelectedRow.getAttribute("TypeID") + "</TypeID>"
                        Str += "<ActionRelationID>" + SelectedRow.getAttribute("ActionRelationID") + "</ActionRelationID>";
                        Str += "<AccessTypeID>" + SelectedRow.getAttribute("AccessTypeID") + "</AccessTypeID></AccessDetail>"
                    /*}
                    else {
                        alert("فقط مجاز به انتخاب يک مورد از اين نوع دسترسي هستيد.");
                        obj.checked = !obj.checked;
                    }*/

                        $get(MasterObj + 'txtSaveXml').value = $get(MasterObj + 'txtSaveXml').value.replace('</Root>', Str + '</Root>');

                    if (SelectedRow.getAttribute("MainRowID") == 1)
                        SetChkGrid(obj, SelectedRow)
                    else if (SelectedRow.getAttribute("MainRowID") == 0 & !obj.checked) {
                        oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/AccessDetail [AccessID='" + SelectedRow.getAttribute("AccessID") + "' and SubAccessID=0 and TypeID='" + SelectedRow.getAttribute("TypeID") + "' and Selected=1]");
                        if (oXmlNodes.length != 0) {
                            oXmlNodes.item(0).selectSingleNode('Selected').text = "0";
                            $get(MasterObj + "txtSaveXml").value = oXmlDoc.xml;
                            var RowIndex=SetChkGrid(obj, SelectedRow)
                            //===========================================
                            var oGrid = SelectedRow.parentElement;
                            while (oGrid.tagName != "TABLE")
                                oGrid = oGrid.parentElement
                                
                            Str = "";
                            for (var i = RowIndex; i < oGrid.rows.length; ++i) {
                                if (oGrid.rows(i).getAttribute("AccessID") == SelectedRow.getAttribute("AccessID")) {
                                    if (oGrid.rows(i).cells(1).firstChild.checked &
                                            oGrid.rows(i).getAttribute("Val") != SelectedRow.getAttribute("Val")) {
                                        Str += "<AccessDetail>";
                                        Str += "<AccessID>" + oGrid.rows(i).getAttribute("Val") + "</AccessID>";
                                        Str += "<SubAccessID>" + SelectedRow.getAttribute("AccessID") + "</SubAccessID>"
                                        Str += "<Selected>1</Selected>"
                                        Str += "<TypeID>" + SelectedRow.getAttribute("TypeID") + "</TypeID>"
                                        Str += "<AccessTypeID>" + SelectedRow.getAttribute("AccessTypeID") + "</AccessTypeID></AccessDetail>"
                                        //alert(Str)
                                    }
                                }
                                else
                                    i = oGrid.rows.length;
                            }
                            if (Str!="")
                                $get(MasterObj + 'txtSaveXml').value = $get(MasterObj + 'txtSaveXml').value.replace('</Root>', Str + '</Root>');
                            //===========================================    
                        }
                    }       
                }
            }
            else {
                alert("ابتدا فعاليت مورد نظر را انتخاب نماييد")
                obj.checked = !obj.checked;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtTempXML").value);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/ActionDetail [Chk='1']");
            if (oXmlNodes.length != 0) {
                var Str = "<ActionDetail><ActionID>" + oXmlNodes.item(0).selectSingleNode("ActionAccessID").text + "</ActionID></ActionDetail>";
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/AccessDetail [Chk='1']");
                var AccessID=0;
                
                for (var i = 0; i < oXmlNodes.length; i++) {
                    if (oXmlNodes.item(i).selectSingleNode("MainRowID").text == "1" |
                        (oXmlNodes.item(i).selectSingleNode("MainRowID").text == "0" & oXmlNodes.item(i).selectSingleNode("AccessID").text != AccessID)) {
                        var Val = ((oXmlNodes.item(i).selectSingleNode("MainRowID").text == 1) ? "0" : oXmlNodes.item(i).selectSingleNode("Val").text)
                        AccessID = oXmlNodes.item(i).selectSingleNode("AccessID").text;

                        if (oXmlNodes.item(i).selectSingleNode("MainRowID").text == "1") {
                            Str += "<AccessDetail><AccessID>" + oXmlNodes.item(i).selectSingleNode("AccessID").text + "</AccessID>";
                            Str += "<SubAccessID>" + Val + "</SubAccessID>"
                        }
                        else {
                            Str += "<AccessDetail><AccessID>" + Val + "</AccessID>";
                            Str += "<SubAccessID>" + oXmlNodes.item(i).selectSingleNode("AccessID").text + "</SubAccessID>"
                        }
                        Str += "<Selected>1</Selected>"
                        Str += "<TypeID>" + oXmlNodes.item(i).selectSingleNode("TypeID").text + "</TypeID>"
                        Str += "<ActionRelationID>" + oXmlNodes.item(i).selectSingleNode("ActionRelationID").text + "</ActionRelationID>";
                        Str += "<AccessTypeID>" + oXmlNodes.item(i).selectSingleNode("AccessTypeID").text + "</AccessTypeID></AccessDetail>"
                    }
                }
                $get(MasterObj + 'txtSaveXml').value = "<Root>" + Str + "</Root>";
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChkGrid(obj, SelectedRow) {
            var RowIndex=0
            var AccessID = SelectedRow.getAttribute('AccessID');
            var oGrid = SelectedRow.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            if (SelectedRow.getAttribute('MainRowID') == 1) {
                for (var j = SelectedRow.rowIndex; j < oGrid.rows.length; ++j) {
                    if (oGrid.rows(j).AccessID == AccessID)
                        oGrid.rows(j).cells(1).firstChild.checked = obj.checked
                    else
                        j = oGrid.rows.length
                }
            }
            else {
                for (var j = SelectedRow.rowIndex; j > 0; --j) {
                    if (oGrid.rows(j).AccessID == AccessID & oGrid.rows(j).Val == AccessID) {
                        oGrid.rows(j).cells(1).firstChild.checked = obj.checked
                        RowIndex = j;
                        j = 0;
                    }    
                }
            }
            
            return RowIndex;   
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetGridStyle(OGrid) {
            for (var i = 1; i < OGrid.rows.length; i++)
                if (i % 2 == 1)
                OGrid.rows(i).className = 'CssItemStyle'
            else
                OGrid.rows(i).className = 'CssAlternatingItemStyle'
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickSubNode(SelectedImage) {
            var oGrid = SelectedImage.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = SelectedImage.parentElement.parentElement
            var AccessID = oRow.getAttribute('AccessID');
            var StrStyle;

            if (SelectedImage.src.search("/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png") != -1) {
                SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/add_sub_task.png"
                StrStyle = "inline";
            }
            else if (SelectedImage.src.search("/FrmPresentation/App_Utility/Images/Icons/add_sub_task.png") != -1) {
                SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png";
                StrStyle = "none";
            }
            for (var j = oRow.rowIndex + 1; j < oGrid.rows.length; j++) {
                if (oGrid.rows(j).AccessID == AccessID)
                    oGrid.rows(j).style.display = StrStyle
                else
                    j = oGrid.rows.length
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        //**********************************EndThisPage*************************************
    </script>           
</asp:Content>