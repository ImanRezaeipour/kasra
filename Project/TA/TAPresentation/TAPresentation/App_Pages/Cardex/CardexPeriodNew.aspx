<%@ Page Title="ایجاد دوره کاردکس" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardexPeriodNew.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CardexPeriodNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cssInsertSelectChk
        {
            background-color: #96CFAD;
        }
        .cssDeleteSelectChk
        {
            background-color: #FFAAAA;
        }
        .cssSelectedRow
        {
            background-color: #f2c8e4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>
    <script src="../../App_Utility/Scripts/farsitype.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            var elem = args.get_postBackElement();


        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == 0)
                    alert($get(MasterObj + "txtAlert").value)
                else
                    SetMsg($get(MasterObj + "txtAlert").value)
            }
            $get(MasterObj + "txtSubmit").value = "";
            strAfzaiandeCode = "<root></root>";
            strKahandeCode = "<root></root>";
            window.returnValue = 1;


        }
        function New() {

            $get(MasterObj + "ddlPeriodKind").selectedIndex = "0";
            $get(MasterObj + "txtPeriodName").value = "";
            $get(MasterObj + "ddlStartPeriod").selectedIndex = "0";
            $get(MasterObj + "ddlEndPeriod").selectedIndex = "0";
            $get(MasterObj + "ddlStartCode_txtCode").value = "";
            $get(MasterObj + "ddlRemainCode_txtCode").value = "";
            $get(MasterObj + "ddlFireCode_txtCode").value = "";
            $get(MasterObj + "ddlMolzamCode_txtCode").value = "";
            $get(MasterObj + "ddlStartCode_txtName").value = "";
            $get(MasterObj + "ddlRemainCode_txtName").value = "";
            $get(MasterObj + "ddlFireCode_txtName").value = "";
            $get(MasterObj + "ddlMolzamCode_txtName").value = "";
            $get(MasterObj + "ddlRemainType").selectedIndex = "0";
            $get(MasterObj + "txtMoadelDay").value = "";
            $get(MasterObj + "chkShow").checked = false;
            $get("tdMoadel").style.display = "none";
            $get("txtMoadel").style.display = "none";



        }                                                      
    </script>
    <table>
        <tr>
            <td colspan="4">
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" />
            </td>
        </tr>
        <tr>
            <td>
                نوع کاردکس
            </td>
            <td>
                <select id="ddlPeriodKind" runat="server" style="width: 150px" class="TxtControls">
                </select>
            </td>
            <td>
                نام کاردکس
            </td>
            <td>
                <input id="txtPeriodName" type="text" style="width: 150px" runat="server" class="TxtControls"
                    lang="fa-IR" />
            </td>
        </tr>
        <tr>
            <td>
                دوره کارکردی شروع
            </td>
            <td>
                <select id="ddlStartPeriod" runat="server" style="width: 150px" class="TxtControls">
                </select>
            </td>
            <td>
                دوره کارکردی خاتمه
            </td>
            <td>
                <select id="ddlEndPeriod" runat="server" style="width: 150px" class="TxtControls">
                </select>
            </td>
        </tr>
        <tr>
            <td>
                کد اول دوره
            </td>
            <td>
                <uc2:ComboBox ID="ddlStartCode" runat="server" />
            </td>
            <td>
                کد مانده دوره
            </td>
            <td>
                <uc2:ComboBox ID="ddlRemainCode" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                کد سوخت شده
            </td>
            <td>
                <uc2:ComboBox ID="ddlFireCode" runat="server" />
            </td>
            <td>
                کد ملزم به استفاده
            </td>
            <td>
                <uc2:ComboBox ID="ddlMolzamCode" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset style="width: 790px; border-right: #77a4c7 thin inset; border-top: #77a4c7 thin solid;
                    border-left: #77a4c7 thin outset; border-bottom: #77a4c7 thin solid">
                    <legend style="color: #3333CC">فيلترهاي جستجو</legend>
                    <table>
                        <tr>
                            <td style="width:110px">
                                فیلتر کد افزاينده :
                            </td>
                            <td>
                                <uc2:ComboBox ID="cmbAddCode" runat="server" />
                               <%-- <input type="image" id="imgSelectAdd"  style="cursor:hand"  onclick="OnClickBtnFilterAdd()" src="../../App_Utility/Images/Icons/S2.png" runat="server" />--%>
                            </td>
                            <td>
                                فيلتر کد کاهنده :
                            </td>
                            <td>
                                <uc2:ComboBox ID="cmbReducerCode" runat="server" />
                                <%-- <input type="image" id="imgSelectred" style="cursor:hand" onclick="OnClickBtnFilterRed()" src="../../App_Utility/Images/Icons/S2.png" runat="server"  />--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ChkSelectedAdd" onclick="OnClickChkSelected(this)" runat="server" />
                                        </td>
                                        <td align="right" style="width: 370px">
                                            نمايش انتخاب شده کدافزاینده
                                        </td>
                                        <td>
                                            <input type="checkbox" id="ChkSelectedReduce"  onclick="OnClickChkSelected(this)" runat="server" />
                                        </td>
                                        <td align="right" style="width: 200px">
                                            نمايش انتخاب شده کد کاهنده
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table>
                    <tr align="center">
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table align="center">
                                        <tr>
                                            <td valign="top">
                                                کدهای افزاينده
                                            </td>
                                            <td>
                                                <div id="AfzaiandeDiv" style="scrollbar-highlight-color: white; overflow: auto; width: 250px;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 402px;">
                                                    <asp:PlaceHolder ID="AfzaiandeGridViewPlaceHolder" runat="Server" />
                                                </div>
                                            </td>
                                            <td valign="top">
                                                کدهای کاهنده
                                            </td>
                                            <td>
                                                <div id="KahandeDiv" style="scrollbar-highlight-color: white; overflow: auto; width: 250px;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 402px;">
                                                    <asp:PlaceHolder ID="KahandeGridViewPlaceHolder" runat="Server" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:HiddenField ID="txtAlert" runat="server" />
                                                <asp:HiddenField ID="txtValidate" runat="server" />
                                                <asp:HiddenField ID="txtCardexPeriodID" runat="server" />
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
            </td>
        </tr>
        <tr>
            <td>
                نمايش مانده به صورت
            </td>
            <td>
                <select id="ddlRemainType" runat="server" onchange="onChangeddlRemainType()" style="width: 150px"
                    class="TxtControls">
                </select>
            </td>
            <td id="tdMoadel">
                هرروز معادل
            </td>
            <td id="txtMoadel">
                <input id="txtMoadelDay" type="text" style="width: 150px" runat="server" class="TxtControls"
                    lang="fa-IR" onblur="Timechk(this)" onkeydown="OnKeyDownInt(this)" />
            </td>
        </tr>
        <tr>
            <td>
                نمايش در صفحات مرتبط
            </td>
            <td>
                <input id="chkShow" type="checkbox" runat="server" />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtXmlAfzaiandeCode" name="txtXmlAfzaiandeCode" runat="server" />
        <input type="text" id="txtXmlKahandeCode" name="txtXmlKahandeCode" runat="server" />
    </div>
    <script type="text/javascript" language="javascript">

        var LastSelectedRowAfzaiande = null;
        var LastSelectedRowClassAfzaiande = "";
        var LastSelectedRowKahande = null;
        var LastSelectedRowClassKahande = "";
        var strAfzaiandeCode = "<root></root>";
        var strKahandeCode = "<root></root>";
        window.returnValue = '';
//        window.name = "CardexPeriodNew.aspx"
//        aspnetForm.target = "CardexPeriodNew.aspx"
        $(document).ready(function () {
            $("#" + MasterObj + "cmbAddCode_txtOnChangeFunc").val("OnClickBtnFilter('Add')");
            $("#" + MasterObj + "cmbReducerCode_txtOnChangeFunc").val("OnClickBtnFilter('Red')");
        });
        //=========================================================
//        function OnClickBtnFilterAdd() {
//            OnClickBtnFilter("Add")
//        }
//        //---------------------------------
//        function OnClickBtnFilterRed() {
//            OnClickBtnFilter("Red")
//        }
        //=========================================================
        function getElementPosition(id) {
            var offsetTrail = document.getElementById(id);
            var offsetLeft = 0;
            var offsetTop = 0;
            while (offsetTrail) {
                offsetLeft += offsetTrail.offsetLeft;
                offsetTop += offsetTrail.offsetTop;
                offsetTrail = offsetTrail.offsetParent;
            }
            return {
                left: offsetLeft
                //,
                // top: offsetTop

            };

        }
        //---------------------------------------------------------
        function OnClickBtnFilter(obj) {
            var Ogrid
            var Top, Left;
            var NewObj, posX, posY
            var OldBG,OldBGR
            var TopY
            var colorSelector = "cssSelectedRow";
            var colorSelectorR = "cssSelectedRow";
            var oldRow

            if (obj == "Add")
                Ogrid = document.getElementById("GrdAfzaiandeCode");
            else
                Ogrid = document.getElementById("GrdKahandeCode");

            posX = Ogrid.offsetLeft;
            posY = Ogrid.offsetTop;
           
            if (obj == "Add") {
                for (var i = 0; i < Ogrid.rows.length; ++i) {
                    if (Ogrid.rows[i].getAttribute("CodeID") == $("#" + MasterObj + "cmbAddCode_txtCode").val()) {
                        if (Ogrid.rows[i].className != colorSelector) {
                            OldBG = Ogrid.rows[i].className;
                            oldRow = i;
                        }
                        Ogrid.rows[i].className = colorSelector;
                       
                        TopY = Ogrid.rows[i].offsetTop
                        $("#AfzaiandeDiv")[0].scrollTop = TopY - 220;
                    }
                    else if (Ogrid.rows[i].className == colorSelector) {
                        Ogrid.rows[i].className = OldBG;
                    }
                }
                
            }
            else {
                for (var i = 0; i < Ogrid.rows.length; ++i) {
                    if (Ogrid.rows[i].getAttribute("CodeID") == $("#" + MasterObj + "cmbReducerCode_txtCode").val()) {
                        if (Ogrid.rows[i].style.backgroundColor != colorSelector)
                            OldBGR = Ogrid.rows[i].className;
                        Ogrid.rows[i].className = colorSelectorR;

                        TopY = Ogrid.rows[i].offsetTop
                        $("#KahandeDiv")[0].scrollTop = TopY - 220;
                    }
                    else if (Ogrid.rows[i].className == colorSelectorR) {
                        Ogrid.rows[i].className = OldBGR;
                    }
                }
            }
        }

        if ($get(MasterObj + "ddlRemainType").value == "3") {
            $get("tdMoadel").style.display = "inline";
            $get("txtMoadel").style.display = "inline";

        }
        else {
            $get("tdMoadel").style.display = "none";
            $get("txtMoadel").style.display = "none";
        }
        function onChangeddlRemainType() {

            if ($get(MasterObj + "ddlRemainType").value == "3") {
                $get("tdMoadel").style.display = "inline";
                $get("txtMoadel").style.display = "inline";

            }
            else {
                $get("tdMoadel").style.display = "none";
                $get("txtMoadel").style.display = "none";
            }
        }
        function OnClickGrdAfzaiande(SelectedRow) {

            if (LastSelectedRowAfzaiande != null) {
                LastSelectedRowAfzaiande.className = LastSelectedRowClassAfzaiande;
            }
            LastSelectedRowClassAfzaiande = SelectedRow.className;
            LastSelectedRowAfzaiande = SelectedRow;

            SelectedRow.className = "CssSelectedItemStyle";
        }
        function OnClickGrdKahande(SelectedRow) {


            if (LastSelectedRowKahande != null) {
                LastSelectedRowKahande.className = LastSelectedRowClassKahande;
            }
            LastSelectedRowClassKahande = SelectedRow.className;
            LastSelectedRowKahande = SelectedRow;

            SelectedRow.className = "CssSelectedItemStyle";
        }
        function OnClickBtnCancel() {

            window.close()
        }
        function OnClickBtnSave() {

            if ($get(MasterObj + "ddlRemainCode_txtCode").value == "" || $get(MasterObj + "ddlStartCode_txtCode").value == "" || $get(MasterObj + "ddlPeriodKind").value == "" || $get(MasterObj + "txtPeriodName").value == "" || $get(MasterObj + "ddlStartPeriod").value == "0" || $get(MasterObj + "ddlEndPeriod").value == "0") {
                alert("لطفا اطلاعات را تکمیل نمایید")
                return
            }
            if ($get(MasterObj + "ddlRemainType").value == "3" && $get(MasterObj + "txtMoadelDay").value == "") {
                alert("لطفا اطلاعات را تکمیل نمایید")
                return
            }
            if ($get(MasterObj + "ddlFireCode_txtCode").value == "")
                $get(MasterObj + "ddlFireCode_txtCode").value = "0"
            if ($get(MasterObj + "ddlMolzamCode_txtCode").value == "")
                $get(MasterObj + "ddlMolzamCode_txtCode").value = "0"


            $get(MasterObj + "txtXmlAfzaiandeCode").value = strAfzaiandeCode
            $get(MasterObj + "txtXmlKahandeCode").value = strKahandeCode

            var OgridAfzaiande = document.getElementById("GrdAfzaiandeCode");
            var OgridKAhande = document.getElementById("GrdKahandeCode");
            $get(MasterObj + "txtXmlAfzaiandeCode").value = "<root>"
            //انهایی که در حال حاضر تیک دارند را ذخیره می کنم و در اسپی تمام قبلی ها را پاک کرده و مجددا ذخیره می کنم
            for (var i = 1; i < OgridAfzaiande.rows.length; ++i) {

                if (OgridAfzaiande.rows[i].cells[0].firstChild.checked) {
                    //                alert(1)
                    $get(MasterObj + "txtXmlAfzaiandeCode").value = $get(MasterObj + "txtXmlAfzaiandeCode").value + "<Afzaiande><CodeID>" + OgridAfzaiande.rows[i].getAttribute("CodeID") + "</CodeID><State>1</State></Afzaiande>"
                }
            }
            $get(MasterObj + "txtXmlAfzaiandeCode").value = $get(MasterObj + "txtXmlAfzaiandeCode").value + "</root>"

            $get(MasterObj + "txtXmlKahandeCode").value = "<root>"

            for (var i = 1; i < OgridKAhande.rows.length; ++i) {

                if (OgridKAhande.rows[i].cells[0].firstChild.checked)
                    $get(MasterObj + "txtXmlKahandeCode").value = $get(MasterObj + "txtXmlKahandeCode").value + "<Kahande><CodeID>" + OgridKAhande.rows[i].getAttribute("CodeID") + "</CodeID><State>1</State></Kahande>"
            }
            $get(MasterObj + "txtXmlKahandeCode").value = $get(MasterObj + "txtXmlKahandeCode").value + "</root>"
            if ($get(MasterObj + "txtXmlKahandeCode").value == "<root></root>" || $get(MasterObj + "txtXmlAfzaiandeCode").value == "<root></root>") {
                alert("لطفا اطلاعات را تکمیل نمایید")
                return
            }
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        function onclickAfzaiandeCHK(Obj) {
            //مربوط به رنگی کردن سطرها بر اساس اینکه جدیدا تیک خورده یا از ابتدا تیک داشته است یا تیک ان برداشته شده است
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strAfzaiandeCode);

            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            oXml.loadXML("<root/>");

            var oXmlNodes = oXmlDoc.documentElement.selectSingleNode("Afzaiande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");

            if (Obj.checked == true) {

                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";

                    oXml.loadXML("<root><Afzaiande><CodeID>" + Obj.parentNode.parentNode.getAttribute("CodeID") + "</CodeID><State>1</State></Afzaiande></root>");

                    var XmlNode = oXml.documentElement.selectNodes("Afzaiande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");

                    oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));

                    Obj.className = "cssInsertSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }

            }
            else {

                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";
                    oXml.loadXML("<root><Afzaiande><CodeID>" + Obj.parentNode.parentNode.getAttribute("CodeID") + "</CodeID><State>0</State></Afzaiande></root>");
                    var XmlNode = oXml.documentElement.selectSingleNode("Afzaiande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");
                    oXmlDoc.childNodes[0].appendChild(XmlNode);
                    Obj.className = "cssDeleteSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }
            }
            strAfzaiandeCode = oXmlDoc.xml;


        }
        function onclickKahandeCHK(Obj) {

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strKahandeCode);

            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            oXml.loadXML("<root/>");

            var oXmlNodes = oXmlDoc.documentElement.selectSingleNode("Kahande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");

            if (Obj.checked == true) {

                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";

                    oXml.loadXML("<root><Kahande><CodeID>" + Obj.parentNode.parentNode.getAttribute("CodeID") + "</CodeID><State>1</State></Kahande></root>");

                    var XmlNode = oXml.documentElement.selectNodes("Kahande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");

                    oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));

                    Obj.className = "cssInsertSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }

            }
            else {

                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";
                    oXml.loadXML("<root><Kahande><CodeID>" + Obj.parentNode.parentNode.getAttribute("CodeID") + "</CodeID><State>0</State></Kahande></root>");
                    var XmlNode = oXml.documentElement.selectSingleNode("Kahande[CodeID=" + Obj.parentNode.parentNode.getAttribute("CodeID") + "]");
                    oXmlDoc.childNodes[0].appendChild(XmlNode);
                    Obj.className = "cssDeleteSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }
            }
            strKahandeCode = oXmlDoc.xml;


        }
        //=============================================================
        function OnClickChkSelected(obj) {
            var oGrid
            var i
           
            if (ReplaceAll(obj.name,"$","_")== MasterObj+"ChkSelectedAdd")
                oGrid = document.getElementById("GrdAfzaiandeCode");
            else
                oGrid = document.getElementById("GrdKahandeCode");

            if (obj.checked == true) {
                for (i = 1; i < oGrid.rows.length; i++) {
                    if (oGrid.rows[i].cells[0].firstChild.checked != true) {
                        oGrid.rows[i].style.display = "none";
                    }
                }
            }
            else {
                for (i = 1; i < oGrid.rows.length; i++) {
                        oGrid.rows[i].style.display = "";
                }
            }
               
        }
    </script>
</asp:Content>
