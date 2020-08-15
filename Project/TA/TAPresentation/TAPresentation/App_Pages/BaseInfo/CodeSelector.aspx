<%@ Page Title="----------------------------------------------------------------------انتخاب کد----------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeSelector.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.CodeSelector" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 700px">
        <%--Filter--%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            کد :
                        </td>
                        <td>
                            <uc1:ComboBox ID="cmbCode" runat="server" />
                        </td>
                        <td style="width: 20px">
                        </td>
                        <td>
                            گروه کد :
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbCodeGroup" runat="server" CssClass="TxtControls" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Toolbar--%>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <%--Filter--%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <input type="checkbox" id="ChkShwAll" onclick="OnClickChkShwAll(this)" runat="server" style="color: "/>
                        </td>
                        <td align="right" style="width: 70px">
                            انتخاب همه
                        </td>
                        <td>
                            <input type="checkbox" id="ChkShwSelect" onclick="OnClickChkShwSelect(this)" runat="server" />
                        </td>
                        <td align="right" style="width: 120px">
                            نمايش انتخاب شده ها
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--KasraGrid--%>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 400px" align="right">
                            <cc2:KasraGrid ID="GrdCodeGroup" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCodeID" runat="server" />
                        <asp:HiddenField ID="txtXmlShowAll" runat="server" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtCodeValue" name="txtCodeValue" runat="server" />
        <input type="text" id="txtXmlChk" name="txtXmlChk" runat="server" />
        <input type="text" id="txtSelectChk" name="txtSelectChk" runat="server" />
        <input type="text" id="txtXMLSaved" runat="server" />
        <input type="text" id="txtSearchXml" runat="server" />
        <input type="text" id="txtSearchFlag" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var OGrid = $get(MasterObj + "GrdCodeGroup");
        if ($get(MasterObj + "txtType").value == "Code" && $get(MasterObj + "txtType").value != "") {
            $get(MasterObj + "ChkShwAll").disabled = true;
            $get(MasterObj + "ChkShwSelect").disabled = true;
            if (document.getElementById('OToolBar_BtnOK') != null)
                document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
            HideAllChecked();
        }
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        var Str = ""
        var StrSet = ""

        var ParentDialog = window.dialogArguments;
        if (ParentDialog!="" && ParentDialog!=undefined && ParentDialog.$get(MasterObj + "txtCodeValue"))
            $get(MasterObj + "txtCodeValue").value = ParentDialog.$get(MasterObj + "txtCodeValue").value;
        //----------------------------Open Xml Fol Load Page-------------------------------------
        var s = $get(MasterObj + "txtXMLSaved").value
        var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocSave.loadXML(s);
        var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/CodeGroup[Chk=1]");
        for (i = 0; i < XmlNodeTmp.length; i++) {
            Str += "<CodeGroup>";
            Str += "<Chk>1</Chk>"
            Str += "<CodeID>" + XmlNodeTmp.item(i).selectSingleNode('CodeID').text + "</CodeID>"
            Str += "<CodeName>" + XmlNodeTmp.item(i).selectSingleNode('CodeName').text + "</CodeName>"
            Str += "<Desc>" + XmlNodeTmp.item(i).selectSingleNode('Desc').text + "</Desc>"
            Str += "<GroupName>" + XmlNodeTmp.item(i).selectSingleNode('GroupName').text + "</GroupName>"
            Str += "</CodeGroup>"
            //alert(Str)
        }
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function EndRequestHandler(sender, args) {
            LastSelectedRow = null
            LastSelectedRowClass = ""
            SetChk();
            if ($get(MasterObj + "txtType").value == "Code" && $get(MasterObj + "txtType").value != "") {
                if (document.getElementById('OToolBar_BtnOK') != null)
                    document.getElementById('OToolBar_BtnOK').style.visibility = "hidden";
                HideAllChecked();
            }
            LastSelectedRow = null;
            LastSelectedRowClass = "";
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                $get(MasterObj + "txtCurPage").value = obj.value
                $get(MasterObj + "txtSubmit").value = "Const"
                $get(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            $get(MasterObj + "txtSubmit").value = "BtnNext"
            $get(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            $get(MasterObj + "txtSubmit").value = "BtnLast"
            $get(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            $get(MasterObj + "txtSubmit").value = "BtnPrev"
            $get(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickBtnFirst() {
            $get(MasterObj + "txtSubmit").value = "BtnFirst"
            $get(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            //--------------------ویرایش کد در هنگام نداشتن چک باکس-----------------------------
            if ($get(MasterObj + "txtType").value == "Code") {
                StrSet=""
                var StrID = "";
                var StrName = "";
                StrID = LastSelectedRow.cells(1).innerText.toString()
                StrName = LastSelectedRow.cells(2).innerText.toString();
                StrSet += "<Root>"
                StrSet += "<Tb>"
                StrSet += "<ID>" + StrID + "</ID>"
                StrSet += "<Name>" + StrName + "</Name>"
                StrSet += "</Tb>"
                StrSet += "</Root>";
            }
        }
        SelectRow()
        //===================================================انتخاب یک سطر درحالت داشتن کد===============================
        function SelectRow() {
            if ($get(MasterObj + "txtType").value != "" && $get(MasterObj + "txtType").value == "Code") {
                if ($get(MasterObj + "txtCodeValue").value != "") {
                    $get(MasterObj + "txtCodeValue").value = $get(MasterObj + "txtCodeValue").value.replace(",", "")
                    $get(MasterObj + "cmbCode_txtCode").value = $get(MasterObj + "txtCodeValue").value
                    OnClickBtnSearch()
                    $get(MasterObj + "cmbCode_txtCode").value = ""
                }
            }
            else if ($get(MasterObj + "txtType").value == "MultiCode" || $get(MasterObj + "txtType").value == "Code/Int") {
                if ($get(MasterObj + "txtCodeValue").value != "") {
                    //------------------------------------------------------------------------------------------
                    Str = "";
                    //---------------------------------------LoadXml------------------------------------------------
                    $get(MasterObj + "txtXMLSaved").value = $get(MasterObj + "txtXmlShowAll").value
                    var s = $get(MasterObj + "txtXMLSaved").value
                    var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDocSave.loadXML(s);
                    var XmlNodeTmp;
                    //-----------------------------------------------------------------------------------------------
                    var str = $get(MasterObj + "txtCodeValue").value
                    if ($get(MasterObj + "txtType").value == "MultiCode")
                        str = str + ",";
                    var LenSpl = getCntChar(',', str)
                    if (LenSpl == 0)
                        LenSpl += 1
                    var ArrCode = new Array(LenSpl)
                    //-----------------------------------------------------------------------------------------------
                    for (var j = 0; j < LenSpl; j++) {
                        if ($get(MasterObj + "txtType").value == "Code/Int")
                            ArrCode[j] = str.split(",")[j + 1];
                        else
                            ArrCode[j] = str.split(",")[j];
                        XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/CodeGrp[CodeID=" + ArrCode[j] + "]");
                        //------------------------------------------------------------------------------------------
                        //alert(XmlNodeTmp.length)
                        if(XmlNodeTmp.length!=0) {
                            XmlNodeTmp.item(0).selectSingleNode('Chk').text = "1"
                            Str += "<CodeGroup>"
                            Str += "<Chk>" + XmlNodeTmp.item(0).selectSingleNode('Chk').text + "</Chk>"
                            Str += "<CodeID>" + XmlNodeTmp.item(0).selectSingleNode('CodeID').text + "</CodeID>"
                            Str += "<CodeName>" + XmlNodeTmp.item(0).selectSingleNode('CodeName').text + "</CodeName>"
                            Str += "<Desc>" + XmlNodeTmp.item(0).selectSingleNode('Desc').text + "</Desc>"
                            Str += "<GroupName>" + XmlNodeTmp.item(0).selectSingleNode('GroupName').text + "</GroupName>"
                            Str += "</CodeGroup>";
                        }
                        SetChk()
                    }
                }
            }
        }
        //=================================================== Chkتيک خوردن همه ============================================
        function OnClickHeaderChk(obj) {
            var OGrid = $get(MasterObj + "GrdCodeGroup");
            var grdLen = OGrid.rows.length;
            if (OGrid.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //==============================================OnClickChk======================================================
        function OnClickChk(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;                    //-----------پیدا کردن Indexسطر
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement     //-----پیدا کردن گرید
            var CodeID = TbObj.rows(RowIndex).cells(1).firstChild.innerText.trim();
            var CodeName = TbObj.rows(RowIndex).cells(2).firstChild.innerText.trim();
            var Desc = TbObj.rows(RowIndex).cells(3).firstChild.innerText.trim();
            var GroupName = TbObj.rows(RowIndex).cells(4).firstChild.innerText.trim();
            var strXML = "<BaseInfoEntity>" + Str + "</BaseInfoEntity>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<BaseInfoEntity></BaseInfoEntity>") && (strXML != "<BaseInfoEntity />"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/CodeGroup[CodeID=" + CodeID + "]");
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true)
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('Chk').text = 0
                Str = oXmlDocSave.xml;
                Str = Str.replace("<BaseInfoEntity>", "")
                Str = Str.replace("</BaseInfoEntity>", "")
            }
            else {
                Str += "<CodeGroup>";
                Str += "<Chk>1</Chk>"
                Str += "<CodeID>" + CodeID + "</CodeID>"
                Str += "<CodeName>" + CodeName + "</CodeName>"
                Str += "<Desc>" + Desc + "</Desc>"
                Str += "<GroupName>" + GroupName + "</GroupName>";
                Str += "</CodeGroup>";
                SetChk()
            }
        }
        //================================================SetChk====================================================
        function SetChk() {
           
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            var strXML = "<BaseInfoEntity>" + Str + "</BaseInfoEntity>";
            oXml.loadXML(strXML);
            var OGrid = $get(MasterObj + "GrdCodeGroup");
            var XmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/CodeGroup");
            if (XmlNode.length != 0) {
                if (OGrid != null) {

                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;
                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("CodeGroup[CodeID=" + OGrid.rows(i).cells(1).firstChild.innerText.trim() + "]");
                        if (XmlNode1.length != 0) {
                            if (XmlNode1.item(0).selectSingleNode('Chk').text == "1")
                                OGrid.rows(i).cells(0).firstChild.checked = true
                            else
                                OGrid.rows(i).cells(0).firstChild.checked = false
                        }
                    }
                }
            }
        }
        //=============================================تاييد کردن ==================================================
        function OnClickBtnSet() {
            //StrSet="";
            var strXML = "<BaseInfoEntity>" + Str + "</BaseInfoEntity>"
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            oXml.loadXML(strXML);
            var XmlNode = oXml.documentElement.selectNodes("/BaseInfoEntity/CodeGroup[Chk=1]");

            if ($get(MasterObj + "txtType").value == "MultiCode" || $get(MasterObj + "txtType").value == "Code/Int") {
                StrSet = "";
                var StrID = "";
                var StrName = "";
                for (var i = 0; i < XmlNode.length; i++) {
                    if ($get(MasterObj + "txtType").value == "MultiCode") {
                        StrID += XmlNode.item(i).selectSingleNode('CodeID').text.toString() + ",";
                        StrName += XmlNode.item(i).selectSingleNode('CodeName').text.toString() + ",";
                    }
                    else if ($get(MasterObj + "txtType").value == "Code/Int") {
                        StrID += "," + XmlNode.item(i).selectSingleNode('CodeID').text.toString();
                        StrName += "," + XmlNode.item(i).selectSingleNode('CodeName').text.toString()
                    }
                }
                if ($get(MasterObj + "txtType").value == "MultiCode")
                    StrID = StrID.substr(0, StrID.length - 1);
                StrSet += "<Root>"
                StrSet += "<Tb>"
                StrSet += "<ID>" + StrID + "</ID>"
                StrSet += "<Name>" + StrName + "</Name>"
                StrSet += "</Tb>"
                StrSet += "</Root>";
            }
            
            window.returnValue = StrSet
            window.close()
        }
        //===================================================================================================
        function LoadInfo() {
            var Pcode = $get(MasterObj + "cmbCode_txtCode").value
            $get(MasterObj + "txtCodeID").value = Pcode

            var Str = "<Root>"
            Str = Str + "<Tb>"
            Str = Str + "<CodeID>" + $get(MasterObj + "txtCodeID").value + "</CodeID>"
            Str = Str + "<GrpID>" + $get(MasterObj + "cmbCodeGroup").value + "</GrpID>"
            Str = Str + "</Tb>"
            Str = Str + "</Root>"
            $get(MasterObj + "txtSearchXml").value = Str;
            //alert(Str)
            $get(MasterObj + "txtSubmit").value = "Filter";
        }
        //==================================================فیلتر=============================================
        function OnClickBtnFilter() {
            LoadInfo()
            $get(MasterObj + "txtSearchFlag").value = "0"
            $get(MasterObj + "BtnSubmit").click();
        }
        //=============================================نمايش همه==================================================
        function OnClickBtnShowAll() {
            Str = "";
            $get(MasterObj + "cmbCode_txtPCode").value = ""
            $get(MasterObj + "cmbCode_txtCode").value = ""
            $get(MasterObj + "cmbCode_txtName").value = ""
            $get(MasterObj + "cmbCodeGroup").value = ""
            $get(MasterObj + "ChkShwAll").checked = ""
            $get(MasterObj + "ChkShwSelect").checked = ""
            $get(MasterObj + "txtSelectChk").value = "0"
            $get(MasterObj + "txtXmlShowAll").value = ""
            $get(MasterObj + "txtXMLSaved").value = ""
            OnClickBtnFilter();
            $get(MasterObj + "txtSearchflag").value = "0"
        }
        //=============================================جستجو کردن ==================================================
        function OnClickBtnSearch() {
            LoadInfo()
            $get(MasterObj + "txtSearchflag").value = "1"
            $get(MasterObj + "BtnSubmit").click();
//            var LastSelectedRow = null;
//            var LastSelectedRowClass = "";
        }
        //===============================================OnClickChkShwSelect==========================================
        function OnClickChkShwSelect(obj) {
            var strXML = ""
            if (obj.checked == true) {
                strXML = "<BaseInfoEntity>" + Str + "</BaseInfoEntity>";
                //alert(strXML)
                $get(MasterObj + "txtXmlChk").value = strXML
                $get(MasterObj + "txtSelectChk").value = "1"
            }
            else
                $get(MasterObj + "txtSelectChk").value = "0"
            $get(MasterObj + "txtSubmit").value = "Filter"
            $get(MasterObj + "BtnSubmit").click();
        }
        //===============================================OnClickChkShwAll================================================
        function OnClickChkShwAll(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            $get(MasterObj + "txtXMLSaved").value = $get(MasterObj + "txtXmlShowAll").value
            var s = $get(MasterObj + "txtXMLSaved").value
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(s);
            var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/BaseInfoEntity/CodeGrp[Chk=1]");
            Str = "";
            for (i = 0; i < XmlNodeTmp.length; i++) {
                Str += "<CodeGroup>";
                if (obj.checked)
                    Str += "<Chk>1</Chk>"
                else
                    Str += "<Chk>0</Chk>"
                Str += "<CodeID>" + XmlNodeTmp.item(i).selectSingleNode('CodeID').text + "</CodeID>"
                Str += "<CodeName>" + XmlNodeTmp.item(i).selectSingleNode('CodeName').text + "</CodeName>"
                Str += "<Desc>" + XmlNodeTmp.item(i).selectSingleNode('Desc').text + "</Desc>"
                Str += "<GroupName>" + XmlNodeTmp.item(i).selectSingleNode('GroupName').text + "</GroupName>"
                Str += "</CodeGroup>";
            }
            SetChk()
        }
        //---------------------------HideChekBox Column---------------------------------------
        function HideAllChecked() {
            var OGrid = $get(MasterObj + "GrdCodeGroup");
            if (OGrid != null) {
                for (var i = 0; i < OGrid.rows.length; i++) {
                    //-----------------جلوگیری از برداشتن Paging-----------------------
                    if (!(OGrid.rows(i).getAttribute("Footer")))
                        OGrid.rows(i).cells(0).style.display = "none";
                }
            }
        }
    </script>
</asp:Content>
