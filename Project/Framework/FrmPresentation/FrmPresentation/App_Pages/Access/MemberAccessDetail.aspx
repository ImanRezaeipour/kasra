<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberAccessDetail.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Access.MemberAccessDetail" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = "";
        var strXml = '';

    </script>

    <table style="width: 786px" dir="rtl">
        <tr>
            <td valign="top" align="center" style="width: 809px">
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
                        
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        LastSelectedRow = "";
                        CountChkSelected = 0
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            $get(MasterObj + "txtAlert").value = ""
                        }
                        if (StrVal != "") {


                            if ($get(MasterObj + "txtAlert").value == "Save") {
                                returnValue = "1";
                            }
                            $get(MasterObj + "CmbAccessType").value = (($get(MasterObj + "txtAccessType").value != "") ? $get(MasterObj + "txtAccessType").value : "0");

                            if ($get(MasterObj + "txtMemberID").value != "0" & $get(MasterObj + "txtMemberID").value != "") {
                                var OGrid = document.getElementById("GrdGroupAccess");
                                for (var i = 1; i < OGrid.rows.length; i++)
                                    if (OGrid.rows(i).getAttribute("GroupAccessID") == $get(MasterObj + "txtMemberID").value) {
                                    OGrid.rows(i).cells(0).firstChild.checked = true
                                    i = OGrid.rows.length;
                                }
                            }
                        }
                        $get(MasterObj + "txtSubmit").value = "";

                        SetChk()
                    }       
                </script>

            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="width: 809px">
                <table style="width: 101%;">
                    <tr>
                        <td style="width: 156px; height: 14px;" valign="top">
                            نوع دسترسي :
                        </td>
                        <td style="height: 14px; width: 217px;" valign="top">
                            <select id="CmbAccessType" runat="server" name="CmbAccessType" onchange="OnChangeCmb(this)"
                                style="width: 160px">
                                <option></option>
                            </select>
                        </td>
                        <td style="width: 145px; height: 14px;" valign="top">
                            نام زيرسيتم :
                        </td>
                        <td style="width: 136px; height: 14px;" valign="top">
                            <asp:DropDownList onchange="onChangeCmbSubSys()" onkeypress="return KeySort(this,false)"
                                ID="CmbSubSys" runat="server" Width="112px" Style="height: 22px" Height="23px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 111px; height: 14px;" valign="top">
                            نام صفحه :
                        </td>
                        <td style="height: 14px; width: 165px;" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList ID="CmbPageName" onchange="onChangeCmbPageName()" onkeypress="return KeySort(this,false)"
                                        runat="server" Width="150px">
                                    </asp:DropDownList>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtSubSysID" runat="server" />
                                        <asp:HiddenField ID="txtPageID" runat="server" />
                                        
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="height: 14px; width: 152px;">
                          
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="width: 809px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="height: 347px; width: 809px;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtMemberAccessID" runat="server" />
                            <asp:HiddenField ID="txtMemberID" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtGroupID" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtTempXML" runat="server" />
                            <asp:HiddenField ID="txtTempXMLAccess" runat="server" />
                        </div>
                        <table style="width: 94%" align="center" dir="rtl">
                            <tr>
                                <td style="width: 272px" align="center">
                                    <fieldset style="width: 271px; height: 485px">
                                        <legend><font class="AutomationTxts" style="font-size: 14px; color: #cc0000">گروهها</font></legend>
                                        <div style="width: 100%; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #B1D3FF; height: 456px">
                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                        </div>
                                    </fieldset>
                                </td>
                                <td align="center">
                                    <fieldset style="width: 425px; height: 94px">
                                        <legend><font class="AutomationTxts" style="font-size: 14px; color: #cc0000">دسترسی
                                            ها</font></legend>
                                        <table>
                                            <tr align="right">
                                                <td>
                                                    <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمایش
                                                    انتخاب شده ها
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="width: 425px; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                        scrollbar-base-color: #B1D3FF; height: 425px">
                                                        <asp:PlaceHolder ID="AccessGridViewPlaceHolder" runat="Server" />
                                                        <asp:HiddenField ID="txtChkAllXML" runat="server" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
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
        <div style="display: none">
         <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
            <input type="text" id="txtAccessID" name="txtAccessID" runat="server" />
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
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <input type="text" id="txtAccessType" name="txtAccessType" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <asp:Button ID="BtnSubmitPageName" runat="server" Text="BtnSubmitPageName" OnClick="BtnSubmitPageName_Click" />
        </div>
    </table>

    <script language="javascript">

        //*************************************Declaration*************************************
        var LastSelectedRow = ""
        var CountChkSelected = 0
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
        //document.body.attachEvent('onkeydown', SetEnter)
        //document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        MakeXML()
        //**********************************EndOnLoad*************************************
        //**********************************Thispage***************************************
        function OnClickBtnCancel() {
            returnValue = "1";
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtAccessType").value = "0"
            $get(MasterObj + "CmbAccessType").value = "0";
            $get(MasterObj + "txtMemberID").value = "0";
            $get(MasterObj + "txtMemberAccessID").value = "0";

            str='<Tb></Tb>'
            
            $get(MasterObj + "txtSubmit").value = "Search";
            $get(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //--------------
            if ($get(MasterObj + "txtMemberID").value == "" || $get(MasterObj + "txtMemberID").value == "0") {
                $get(MasterObj + "txtMemberID").value = "0";
                alert("گروهی را انتخاب نمایید")
                return;
            }
            //--------------
            if (str == "") {
                alert("آیتمی برای ذخیره وجود ندارد")
                return;
            }
            //--------------
            if (strXml == "") {
                strXml += "<GroupAccess>"
                strXml += "<MemberID>" + $get(MasterObj + "txtMemberID").value + "</MemberID>"
                strXml += "<Type>G</Type>"
                strXml += "</GroupAccess>"
            }

            //--------------
            $get(MasterObj + "txtSaveXml").value = "<Root>" + strXml + str + "</Root>";
            //alert($get(MasterObj + "txtSaveXml").value)
            $get(MasterObj + "txtSubmit").value = "Save";
            $get(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //-------------------
            document.getElementById(MasterObj + "txtChkAllXML").value = "<Root></Root>"
            $get(MasterObj + "txtSubmit").value = "Search";
            $get(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*function OnClickGrd(SelectedRow) {

         if (LastSelectedRow != "")
        SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
        LastSelectedRow = SelectedRow.rowIndex;
        SelectedRow.style.backgroundColor = "#FFFFCC";
        $get(MasterObj + "txtMemberAccessID").value = SelectedRow.MemberAccessID
         

     }*/
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtTempXML").value);

            var oXmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc1.async = "false";
            oXmlDoc1.loadXML($get(MasterObj + "txtTempXMLAccess").value);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/AccessEntity/GroupAccess [Checked='1']");
            //alert(oXmlNodes.length)
            if (oXmlNodes.length != 0) {
                strXml = "<GroupAccess><MemberID>" + oXmlNodes.item(0).selectSingleNode("GroupAccessID").text + "</MemberID><Type>G</Type></GroupAccess>";
                var oXmlNodes2 = oXmlDoc1.documentElement.selectNodes("/AccessEntity/AccessForMemberAccess [Checked='1']");
                //alert(oXmlNodes2.length)
                for (var i = 0; i < oXmlNodes2.length; i++) {
                    str += "<Tb>"
                    str += "<ID>" + oXmlNodes2.item(i).selectSingleNode("ID").text + "</ID>";
                    str += "<AccessID>" + oXmlNodes2.item(i).selectSingleNode("AccessID").text + "</AccessID>";
                    str += "<AccessTypeID>" + oXmlNodes2.item(i).selectSingleNode("AccessTypeID").text + "</AccessTypeID>"
                    str += "<Selected>1</Selected>"
                    str += "</Tb>"

                }
                //$get(MasterObj + 'txtSaveXml').value = "<Root>" + Str + "</Root>";
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickGroupAccessChk(obj) {
            var OGrid = document.getElementById("GrdGroupAccess");
            RowIndex = obj.parentElement.parentElement.rowIndex;

            if (obj.checked) {
                if ($get(MasterObj + "txtMemberID").value != '0' &
                    $get(MasterObj + "txtMemberID").value != '') {
                    alert('امکان انتخاب بيش از يک گروه جهت ذخيره اطلاعات وجود ندارد')
                    obj.checked = false
                    return
                }
                $get(MasterObj + "txtMemberID").value = OGrid.rows(RowIndex).GroupAccessID
            }
            else
                $get(MasterObj + "txtMemberID").value = "0";       
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdAccess");

            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = "<Root>" + str + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

            for (var j = 0; j < oXmlNodes.length; j++) {
                for (var i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute('AccessTypeID') == oXmlNodes.item(j).selectSingleNode("AccessTypeID").text) && (OGrid.rows(i).getAttribute('AccessID') == oXmlNodes.item(j).selectSingleNode("AccessID").text)) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                        CountChkSelected++;
                    }
                }
            }
            //------------------
            var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=0]");

            for (var j = 0; j < oXmlNodes1.length; j++) {
                for (var i = 1; i < PageSize; i++) {
                    if ((OGrid.rows(i).getAttribute('AccessTypeID') == oXmlNodes1.item(j).selectSingleNode("AccessTypeID").text) && (OGrid.rows(i).getAttribute('AccessID') == oXmlNodes1.item(j).selectSingleNode("AccessID").text)) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;
                        CountChkSelected--;
                    }
                }
            }

            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickchkAllSelected(obj) {
            var strXml = "<Root>" + str + "</Root>"
            document.getElementById(MasterObj + "txtChkAllXML").value = strXml
            //            alert(document.getElementById(MasterObj + "txtChkAllXML").value)
            //            if (document.getElementById(MasterObj + "txtChkAllXML").value.length > 20)
            //                alert(strXml.substring(document.getElementById(MasterObj + "txtChkAllXML").value.length - 20, document.getElementById(MasterObj + "txtChkAllXML").value.length - 1))
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdAccess");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0

            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                onclickAccessChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickAccessChk(obj) {

            var OGrid = document.getElementById("GrdAccess");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            //========================================================
            if (obj.checked == true && CountChkSelected != OGrid.rows.length - 1)
                CountChkSelected++;
            else if (obj.checked == false)
                CountChkSelected--;

            if (CountChkSelected == OGrid.rows.length - 1 && OGrid.rows(0).cells(0).firstChild.checked != true)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else if (CountChkSelected != OGrid.rows.length - 1 && OGrid.rows(0).cells(0).firstChild.checked != false)
                OGrid.rows(0).cells(0).firstChild.checked = false
            //========================================================
            var strXml = "<Root>" + str + "</Root>"
            var ID = OGrid.rows(RowIndex).getAttribute('ID');
            OGrid.rows(RowIndex).getAttribute('AccessTypeID')
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [AccessTypeID=" + OGrid.rows(RowIndex).getAttribute('AccessTypeID') + " and AccessID=" + OGrid.rows(RowIndex).getAttribute('AccessID') + "]");
            //alert(oXmlNodes.length)
            //alert(OGrid.rows(RowIndex).cells(0).firstChild.checked)
            if (oXmlNodes.length > 0) {
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == true)
                    if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1;
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == false)
                    if (oXmlNodes.item(0).selectSingleNode("Selected").text == 1)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0;


                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                var selected = 0
                if (obj.checked == true)
                    selected = 1
                str += "<Tb>"
                str += "<ID>" + OGrid.rows(RowIndex).getAttribute('ID') + "</ID>";
                str += "<AccessID>" + OGrid.rows(RowIndex).AccessID + "</AccessID>";
                str += "<AccessTypeID>" + OGrid.rows(RowIndex).AccessTypeID + "</AccessTypeID>"
                str += "<Selected>" + selected + "</Selected>"
                str += "</Tb>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeCmb(obj) {
            if (obj.id == "ctl00_ContentPlaceHolder1_CmbAccessType") {
                $get(MasterObj + "txtAccessType").value = $get(MasterObj + "CmbAccessType").value;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbSubSys() {
            $get(MasterObj + "txtSubSysID").value = $get(MasterObj + "CmbSubSys").value;
            document.getElementById(MasterObj + "BtnSubmitPageName").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPageName() {
            $get(MasterObj + "txtPageID").value = $get(MasterObj + "CmbPageName").value;
        }
        //*******************************EndThispage***************************************
    
    </script>

</asp:Content>
