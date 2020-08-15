<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SelectAction.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.Action.SelectAction" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <table  >
                    <tr>
                        <td style="width: 100px">
                            نام فعاليت
                        </td>
                        <td style="width: 80px">
                            <select id="cmbNameAction" runat="server" class="TxtControls" onchange="onchangeNameAction()"
                                style="height: 300px; width: 150px" align="right">
                                <option></option>
                            </select>
                        </td>
                        <td style="width: 80px">
                            کد فعاليت
                        </td>
                        <td style="width: 80px">
                            <select id="cmbCodeAction" runat="server" class="TxtControls" onchange="onchangeCodeAction()"
                                style="height: 300px; width: 150px" align="right">
                                <option></option>
                            </select>
                        </td>
                        <td style="width: 70px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            زير سيستم
                        </td>
                        <td>
                            <select id="cmbSystem" runat="server" class="TxtControls" style="height: 300px; width: 150px"
                                align="right" onchange="OnchangeCmbSubSystem()">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            نام صفحه
                        </td>
                        <td>
                            <select id="cmbPageName" runat="server" class="TxtControls" style="height: 300px;
                                width: 150px" align="right">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!--toolbar-->
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div align="right">
                    <table>
                        <tr>
                            <td>
                                <input type="checkbox" id="ChkShwAll" onclick="OnClickChkShwAll(this)" runat="server" />انتخاب
                                همه
                                <input type="checkbox" id="ChkShwSelect" onclick="OnClickChkShwSelect(this)" runat="server" />
                                نمايش انتخاب شده ها
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <!--Grid-->
        <tr>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" style="height: 300px; width: 325px" align="center">
                            <cc2:KasraGrid ID="GrdSelectAction" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>                       
                        <asp:HiddenField ID="Totalpage" runat="server" />
                         <asp:HiddenField ID="txtSearchflag" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSerchXml" name="txtSerchXml" runat="server" />
        
        <input type="text" id="txtXMLSaved" name="txtXMLSaved" runat="server" />
        <input type="text" id="txtXmlChk" name="txtXmlChk" runat="server" />
        <input type="text" id="txtSelectChk" name="txtSelectChk" runat="server" />
        <input type="text" id="txtXmlShowAll" name="txtXmlShowAll" runat="server" />
        <input type="text" id="txtXmlPageName" name="txtXmlPageName" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        var str1 = ""
        var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
        oXmlDocSave.async = false;
        var s = $get(MasterObj + "txtXMLSaved").value
        oXmlDocSave.loadXML(s);
        var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/AccessEntity/SelectAction[chk=1]");
        for (i = 0; i < XmlNodeTmp.length; i++) {
            str1 += "<SelectAction>";
            str1 += "<chk>1</chk>"
            str1 += "<ID>" + XmlNodeTmp.item(i).selectSingleNode('ID').text + "</ID>"
            str1 += "<ACode>" + XmlNodeTmp.item(i).selectSingleNode('ACode').text + "</ACode>"
            str1 += "<AName>" + XmlNodeTmp.item(i).selectSingleNode('AName').text + "</AName>"
            str1 += "</SelectAction>"
            //                      alert(str1)
        }
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            LastSelectedRow = null
            LastSelectedRowClass = ""
            SetChk();
        }
        //===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //=================================================== Chkتيک خوردن همه =================================================
        function OnClickHeaderChk(obj) {
            var GrdSelectAction = document.getElementById(MasterObj + "GrdSelectAction");
            var grdLen = GrdSelectAction.rows.length;
            if (GrdSelectAction.rows(grdLen - 1).getAttribute("Footer") == 1)
                grdLen = grdLen - 1;
            for (var i = 1; i < grdLen; i++) {
                GrdSelectAction.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(GrdSelectAction.rows(i).cells(0).firstChild)
            }
        }
        //==============================================OnClickChk======================================================
        function OnClickChk(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var ID = TbObj.rows(RowIndex).getAttribute("ID")
            var Code = TbObj.rows(RowIndex).cells(3).firstChild.innerText.trim();
            var Name = TbObj.rows(RowIndex).cells(2).firstChild.innerText.trim();
            var strXML = "<AccessEntity>" + str1 + "</AccessEntity>";
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(strXML);
            var XmlNodeTmp = "";
            if ((strXML != "<AccessEntity></AccessEntity>") && (strXML != "<AccessEntity/>"))
                XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/AccessEntity/SelectAction[ID=" + ID + "]");
            if (XmlNodeTmp.length > 0) {
                if (obj.checked == true)
                    XmlNodeTmp.item(0).selectSingleNode('chk').text = 1
                else
                    XmlNodeTmp.item(0).selectSingleNode('chk').text = 0

                str1 = oXmlDocSave.xml;
                str1 = str1.replace("<AccessEntity>", "")
                str1 = str1.replace("</AccessEntity>", "")
            }
            else {

                str1 += "<SelectAction>";
                str1 += "<chk>1</chk>"
                str1 += "<ID>" + ID + "</ID>"
                str1 += "<ACode>" + Code + "</ACode>"
                str1 += "<AName>" + Name + "</AName>"
                str1 += "</SelectAction>";
                //                             alert(strXML);
                SetChk()
            }
            //            alert(str1);
        }
        //================================================SetChk====================================================
        function SetChk() {
            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            var strXML = "<AccessEntity>" + str1 + "</AccessEntity>";
            oXml.loadXML(strXML);
            //           alert(strXML)
            var XmlNode = oXml.documentElement.selectNodes("/AccessEntity/SelectAction");
            if (XmlNode.length != 0) {
                var OGrid = document.getElementById(MasterObj + "GrdSelectAction");
                if (OGrid != null) {
                    var PageSize = OGrid.rows.length;
                    if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                        PageSize = PageSize - 1;

                    for (var i = 1; i < PageSize; i++) {
                        var XmlNode1 = oXml.documentElement.selectNodes("SelectAction[ID=" + OGrid.rows(i).getAttribute("ID") + "]");
                        //alert(XmlNode1.length)
                        if (XmlNode1.length != 0) {
                            if (XmlNode1.item(0).selectSingleNode('chk').text.toString() == "1")
                                OGrid.rows(i).cells(0).firstChild.checked = true
                            else
                                OGrid.rows(i).cells(0).firstChild.checked = false
                        }
                    }

                }
            }
        }
        //=============================================تاييد کردن ==================================================
        function OnClickBtnOk() {
            var strXML = "<AccessEntity>" + str1 + "</AccessEntity>"
            window.returnValue = strXML
            window.close()
            //                     alert(strXML)
        }


        //==================================================فیلتر کردن=============================================

        function OnClickBtnFilter() {
            var Str = "<Root>"
            Str = Str + "<tb>"
            Str = Str + "<CodeID>" + document.getElementById(MasterObj + "cmbCodeAction").value + "</CodeID>"
            Str = Str + "<SubSysId>" + document.getElementById(MasterObj + "cmbSystem").value + "</SubSysId>"
            Str = Str + "<pageID>" + document.getElementById(MasterObj + "cmbPageName").value + "</pageID>"
            Str = Str + "</tb>"
            Str = Str + "</Root>"
            document.getElementById(MasterObj + "txtSerchXml").value = Str;
            //           alert(Str)
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
            $get(MasterObj + "txtSearchflag").value = "0"
        }
        //=============================================جستجو کردن ==================================================
        function OnClickBtnSearch() {
            $get(MasterObj + "txtSearchflag").value = "1"
            OnClickBtnFilter()
            var LastSelectedRow = null;
            var LastSelectedRowClass = "";
            document.getElementById(MasterObj + "txtSerchXml").value=""
        }
        //=============================================نمايش همه==================================================
        function OnClickBtnShowAll() {
            Clear();
            OnClickBtnFilter();
            $get(MasterObj + "txtSearchflag").value = "0"

        }
        //=============================================
        function Clear() {
            $get(MasterObj + "cmbNameAction").value = "0"
            $get(MasterObj + "cmbCodeAction").value = "0"
            $get(MasterObj + "cmbSystem").value = "0"
            $get(MasterObj + "cmbPageName").value = "0"
            $get(MasterObj + "txtSelectChk").value = "0"
            document.getElementById(MasterObj + "ChkShwAll").checked = ""
            document.getElementById(MasterObj + "ChkShwSelect").checked = "";
            document.getElementById(MasterObj + "txtSerchXml").value = "";
        }
        //===============================================OnClickChkShwAll================================================
        function OnClickChkShwAll(obj) {
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            $get(MasterObj + "txtXMLSaved").value = $get(MasterObj + "txtXmlShowAll").value
            var s = $get(MasterObj + "txtXMLSaved").value
            var oXmlDocSave = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDocSave.loadXML(s);
            var XmlNodeTmp = oXmlDocSave.documentElement.selectNodes("/AccessEntity/SelectAction[chk=1]");
            str1 = "";

            for (i = 0; i < XmlNodeTmp.length; i++) {
                str1 += "<SelectAction>";
                if (obj.checked)
                    str1 += "<chk>1</chk>"
                else
                    str1 += "<chk>0</chk>"
                str1 += "<chk>1</chk>"
                str1 += "<ID>" + XmlNodeTmp.item(i).selectSingleNode('ID').text + "</ID>"
                str1 += "<ACode>" + XmlNodeTmp.item(i).selectSingleNode('ACode').text + "</ACode>"
                str1 += "<AName>" + XmlNodeTmp.item(i).selectSingleNode('AName').text + "</AName>"
                str1 += "</SelectAction>";
            }

            SetChk()

        }
        //===============================================OnClickChkShwSelect================================================
        function OnClickChkShwSelect(obj) {
            var strXML = ""
            if (obj.checked == true) {
                strXML = "<AccessEntity>" + str1 + "</AccessEntity>";
                //                             alert(strXML)
                $get(MasterObj + "txtXmlChk").value = strXML

                $get(MasterObj + "txtSelectChk").value = "1"

            }
            else
                $get(MasterObj + "txtSelectChk").value = "0"
            MakeXml()

        }
        //===================================================MakeXml================================================
        function MakeXml() {
            document.getElementById(MasterObj + "txtSubmit").value = "Filter"
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //------------------------------------------------آوردن کمبو صفحه ها بر اساس زیر ساخت------------------------------------------
        function OnchangeCmbSubSystem() {
            var OxmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            OxmlDoc.async = "false";
            OxmlDoc.loadXML($get(MasterObj + "txtXmlPageName").value);
            var xmlNodes;
            xmlNodes = OxmlDoc.documentElement.selectNodes("/AccessEntity/PageName[flag=" + $get(MasterObj + "cmbSystem").value + "]");
            $get(MasterObj + "cmbPageName").innerHTML = "";

            optionEl = document.createElement("OPTION")
            $get(MasterObj + "cmbPageName").options.add(optionEl);
            $get(MasterObj + "cmbPageName").all(0).innerText = "انتخاب نشده"
            $get(MasterObj + "cmbPageName").all(0).value = "0"

            for (var i = 0; i < xmlNodes.length; ++i) {
                optionEl = document.createElement("OPTION")
                $get(MasterObj + "CmbPageName").options.add(optionEl)
                $get(MasterObj + "CmbPageName").all(i + 1).innerText = xmlNodes.item(i).selectSingleNode('Title').text
                $get(MasterObj + "CmbPageName").all(i + 1).value = xmlNodes.item(i).selectSingleNode('val').text
            }
        }

        //=============================================onchangeNameAction======================================================
        function onchangeNameAction() {
            $get(MasterObj + "cmbCodeAction").value = $get(MasterObj + "cmbNameAction").value
        }
        //=============================================onchangeNameAction======================================================
        function onchangeCodeAction() {
            $get(MasterObj + "cmbNameAction").value = $get(MasterObj + "cmbCodeAction").value

        }
       
    </script>
</asp:Content>
