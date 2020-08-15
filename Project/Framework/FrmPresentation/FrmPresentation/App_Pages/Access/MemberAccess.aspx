<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.MemberAccess"
    MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

    </script>

    <table style="width: 800px" dir="rtl">
      
        <tr>
            <td valign="top" align="center">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

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

                        if (StrVal != "") {
                            {
                                LastSelectedRow = "";
                                CountChkSelected = 0
                                if ($get(MasterObj + "lblTo").value == "") {
                                    document.getElementById('OToolBar_txtFromData').value = "";
                                    document.getElementById('OToolBar_txtToData').value = "";
                                    document.getElementById('OToolBar_txtTotalData').value = "";

                                    document.getElementById('OToolBar_BtnNext').disabled = true;
                                    document.getElementById('OToolBar_BtnPrv').disabled = true;
                                    document.getElementById('OToolBar_BtnFirst').disabled = true;
                                    document.getElementById('OToolBar_BtnLast').disabled = true;
                                    document.getElementById('OToolBar_txtCurPage').value = "";
                                }
                                else if ($get(MasterObj + "lblTo").value != "") {
                                    document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                    document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                    document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                    document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                    document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                                    if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= parseInt(document.getElementById("OToolBar_txtTotalPage").value))
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

                                $get(MasterObj + "CmbAccessType").value = (($get(MasterObj + "txtAccessType").value != "") ? $get(MasterObj + "txtAccessType").value : "0");
                                $get(MasterObj + "CmbAccessName").value = (($get(MasterObj + "txtAccessName").value != "") ? $get(MasterObj + "txtAccessName").value : "0");
                                $get(MasterObj + "CmbGroupAccess").value = (($get(MasterObj + "txtGroupName").value != "") ? $get(MasterObj + "txtGroupName").value : "0");
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                SetChk()
                                if (StrVal == "Del") {
                                    if ($get(MasterObj + "txtAlert").value != "")
                                        SetMsg($get(MasterObj + "txtAlert").value);

                                }
                            }

                        }

                        $get(MasterObj + "txtSubmit").value = "";

                    }
                </script>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 90px; height: 21px;">
                                    نوع دسترسي :&nbsp;
                                </td>
                                <td style="width: 121px; height: 21px;">
                                    <asp:DropDownList ID="CmbAccessType" runat="server" Width="150px" onchange="OnChangeCmb(this)">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 94px; height: 21px;">
                                    نام دسترسي :
                                </td>
                                <td style="height: 21px; width: 152px;">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="CmbAccessName" runat="server" Width="170px" onchange="OnChangeCmb(this)">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitAccessName" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td style="height: 21px; width: 69px;">
                                    نام گروه :
                                </td>
                                <td style="height: 21px">
                                    <asp:DropDownList ID="CmbGroupAccess" runat="server" Width="150px" onchange="OnChangeCmb(this)">
                                    </asp:DropDownList>
                                    
                                </td>
                               <td>
                               
                                  
                               
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
        <tr>
            <td valign="top" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" GridID="1" PageName="MemberAccess.aspx"
                    PageID="1125" />
            </td>
        </tr>
        <tr>
        <td align="right">
        <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمایش انتخاب شده ها
        </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="height: 347px" dir="rtl">
            
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
                            <asp:HiddenField ID="txtStrDel" runat="server" />
                            <asp:HiddenField ID="txtChkAllXML" runat="server" />
                        </div>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <div style="display: none">
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
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
            <input type="text" id="txtAccessType" name="txtAccessType" runat="server" />
            <input type="text" id="txtAccessName" name="txtAccessName" runat="server" />
            <input type="text" id="txtGroupName" name="txtGroupName" runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <asp:Button ID="BtnSubmitAccessName" runat="server" Text="BtnSubmitAccessName" OnClick="BtnSubmitAccessName_Click" />
        </div>
    </table>

    <script language="javascript">
        //*************************************Declaration*************************************
        var LastSelectedRow = ""
        var strChk = "";
        var CountChkSelected = 0
        var AccessType = 0;
        var AccessID = 0;
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
        //document.body.attachEvent('onkeydown', SetEnter)
        //document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        document.getElementById("OToolBar_txtCurPage").value = "";
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

        //**********************************EndOnLoad*************************************
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
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
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
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //$get(MasterObj + "txtMemberAccessID").value = "0"
            url = "MemberAccessDetail.aspx?MemberAccessID=0 &MemberID=0 &Mode=New"
            //alert(url)
            var returnValue
            returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")
           //window.open(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")
            //alert(returnValue)
            if (returnValue == "1") {
                $get(MasterObj + "txtSubmit").value = "Search";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtStrDel").value = "<Root>" + strChk + "</Root>"
            if (strChk != "") {
                if (confirm("آيا از حذف مطمئنيد؟")) {
                    $get(MasterObj + "txtSubmit").value = "Del";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("ابتدا سطرهاي مورد نظر را انتخاب نماييد")

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            url = "MemberAccessDetail.aspx?MemberAccessID=" + $get(MasterObj + "txtMemberAccessID").value + " &MemberID=" + $get(MasterObj + "txtMemberID").value + "&Mode=Edit" + " &AccessType=" + AccessType + " &AccessID=" + AccessID
            //alert(url)
            var returnValue
            returnValue = window.showModalDialog(url, window, "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no")
            //alert(returnValue)
            if (returnValue == "1") {
                $get(MasterObj + "txtSubmit").value = "Search";
                $get(MasterObj + "BtnSubmit").click();
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var str = ""
            str += "<Root><Tb>"
            str += "<AccessTypeID>" + $get(MasterObj + "CmbAccessType").value + "</AccessTypeID>"
            str += "<MemberAccessID>" + $get(MasterObj + "CmbAccessName").value + "</MemberAccessID>"
            str += "<GroupID>" + $get(MasterObj + "CmbGroupAccess").value + "</GroupID>"
            //str += "<GroupName>" + $get(MasterObj + "CmbGroupAccess").value + "</GroupName>"
            //str += "<AccessName>" + $get(MasterObj + "txtAccessName").value + "</AccessName>"
            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            //-------------------
            $get(MasterObj + "txtSubmit").value = "Search";
            $get(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            $get(MasterObj + "CmbAccessType").value = '0'
            $get(MasterObj + "CmbAccessName").value='0'
            $get(MasterObj + "CmbGroupAccess").value = '0'

            $get(MasterObj + "txtAccessType").value = '0';
            $get(MasterObj + "txtAccessName").value = '0';
            $get(MasterObj + "txtGroupName").value = '0';
            
            var str = ""
            str += "<Root><Tb>"
            str += "<AccessTypeID>0</AccessTypeID>"
            str += "<MemberAccessID>0</MemberAccessID>"
            str += "<GroupID>0</GroupID>"
            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            //-------------------
            $get(MasterObj + "txtSubmit").value = "Search";
            $get(MasterObj + "BtnSubmit").click();
        }
        //**********************************EndToolbar*************************************

        //**********************************Thispage***************************************
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != "")
                SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.style.backgroundColor = "#FFFFCC";
            $get(MasterObj + "txtMemberAccessID").value = SelectedRow.MemberAccessID
            //alert($get(MasterObj + "txtMemberAccessID").value)
            $get(MasterObj + "txtMemberID").value = SelectedRow.MemberID
            AccessType = SelectedRow.AccessTypeID
            AccessID = SelectedRow.AccessID
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd(SelectedRow) {

            OnClickBtnEdit();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeCmb(obj) {
            if (obj.id == "ctl00_ContentPlaceHolder1_CmbAccessType") {
                $get(MasterObj + "txtAccessType").value = $get(MasterObj + "CmbAccessType").value;
                $get(MasterObj + "txtSubmit").value = "BindCmbAccessName";
                $get(MasterObj + "BtnSubmitAccessName").click();
            }
            else if (obj.id == "ctl00_ContentPlaceHolder1_CmbAccessName")
                $get(MasterObj + "txtAccessName").value = $get(MasterObj + "CmbAccessName").value;
            else if (obj.id == "ctl00_ContentPlaceHolder1_CmbGroupAccess")
                $get(MasterObj + "txtGroupName").value = $get(MasterObj + "CmbGroupAccess").value;
        }
        //*******************************EndThispage***************************************
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            //-------------------------------  
            var oIndex = oRow.rowIndex

            var AccID = oGrid.rows(oIndex).getAttribute('MemberAccessID');
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            //========================================================
            if (obj.checked == true && CountChkSelected != oGrid.rows.length - 1)
                CountChkSelected++;
            else if (obj.checked == false)
                CountChkSelected--;

            if (CountChkSelected == oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != true)
                oGrid.rows(0).cells(0).firstChild.checked = true
            else if (CountChkSelected != oGrid.rows.length - 1 && oGrid.rows(0).cells(0).firstChild.checked != false)
                oGrid.rows(0).cells(0).firstChild.checked = false
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and MemberAccessID=" + AccID + "]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [MemberAccessID=" + AccID + "]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<Tb>"
                //strChk += "<PageNo>" + document.getElementById(MasterObj + "txtCurPage").value + "</PageNo>"
                strChk += "<MemberAccessID>" + AccID + "</MemberAccessID>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</Tb>"
            }

        }
        ////_________________________________________________________________________________
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdMemberAccess");

            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = "<Root>" + strChk + "</Root>"
            var CurPage = document.getElementById(MasterObj + "txtCurPage").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            //var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [PageNo='" + CurPage + "' and Selected=1]");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute('MemberAccessID') == oXmlNodes.item(j).selectSingleNode("MemberAccessID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                        CountChkSelected++;
                    }
                }
            }
            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false
        }
        ////_________________________________________________________________________________
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdMemberAccess");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }

        }

        ////_________________________________________________________________________________
        function onclickchkAllSelected(obj) {

            var strXml = "<Root>" + strChk + "</Root>"
            document.getElementById(MasterObj + "txtChkAllXML").value = strXml
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click();
            //         alert(strXml)
        }
    </script>

</asp:Content>
