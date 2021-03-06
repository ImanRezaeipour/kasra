<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardReader.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReader"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <table style="width: 96%; height: 489px;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        //document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        //document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if (StrVal != "") {

                            if (StrVal == "ImgRefreshPerson") {

                                document.getElementById('ImgRefreshPerson').disabled = true;
                                document.getElementById('MaskedDiv').style.display = 'none';
                                document.getElementById('ModalPopupDiv').style.display = 'none';

                            }
                            else  if (StrVal == "Save") {
                                SetMsg(document.getElementById(MasterObj + "txtAlert").value)
                                ClearData()
                                LoadMemberInfo()
                            }
                            else if (StrVal == "GetMember") {
                                ClearData()
                                LoadMemberInfo()
                            }
                            else if (StrVal == "Delete") {
                                SetMsg(document.getElementById(MasterObj + "txtAlert2").value)
                                ClearData()
                                LastSelectedRow = null;
                            }
                            else
                                ClearData()

                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td class="style6">
                           ازتاريخ
                            :</td>
                        <td class="style5">
                           
                            <uc2:KCalendar ID="KSDate" runat="server" />
                           
                        </td>
                        <td class="style3">
                         تا تاريخ
                            :</td>
                        <td>
                        
                            <uc2:KCalendar ID="KEDate" runat="server" />
                        
                        </td>
                        <td class="style4" >
                        <table style="width: 380px" >
                    <tr>
                        <td class="style8">
                            پرسنلی
                            :</td>
                        <td class="style1">
                           <input id="txtPersonCode" name="txtPersonCode" type="text" runat="server" dir="rtl"
                                onblur="OnBlurTxtPersonCode()" 
                                style="width: 90px" />
                        </td>
                        <td class="style7">
                            نام&nbsp;:</td>
                        <td style="width: 300px">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList onchange="OnChangeSelName()"
                                            ID="SelName" runat="server" Width="159px" Height="16px">
                                        </asp:DropDownList>
                                    <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                        src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                       
                    </tr>
                </table>
                        </td>
                        <td class="style9" style="width: 71px">زير سیستم:</td>
                        <td>
                            <asp:DropDownList ID="CmbSystem" runat="server" Height="16px" Width="87px" DataTextField="Title"
                                DataValueField="val">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="CardReader.aspx" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert2" runat="server" />
                        
                            <fieldset dir="rtl" style="width: 834px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                border-left: lightblue thin outset; border-bottom: lightblue thin solid; height: 233px;"
                                align="middle">
                                <legend style="width: 103px; color: lightblue">اطلاعات کارتخوان</legend>
                               <div style="direction: rtl; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                            scrollbar-base-color: #B1D3FF; width: 808px; height: 209px;">
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" /></div>
                            </fieldset>
                        
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <fieldset dir="rtl" 
                    
                    
                    style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid; width: 716px">
                    <legend style="color: lightblue">اعضا</legend>
                    
                    <table id="Table10" align="center" border="0" cellpadding="0" cellspacing="0" 
                        style="width: 100%">
                        <tr>
                            <td  valign="top">
                                <table style="width: 340px">
                                    <tr>
                                        <td style="vertical-align: top">
                                            ازتاريخ
                                            :</td>
                                        <td style="vertical-align: top">
                                            <uc2:KCalendar ID="StartDate" runat="server" />
                                        </td>
                                        <td style="vertical-align: top">
                                            تا تاريخ
                                            :</td>
                                        <td style="vertical-align: top">
                                            <uc2:KCalendar ID="EndDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="vertical-align: top">
                                            <fieldset align="middle" dir="rtl" 
                                                style="width: 177px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                                <legend style="color: lightblue">روز هفته</legend>
                                                <table id="Table15" border="0" cellpadding="0" cellspacing="0" 
                                                    style="width: 160px;" width="160">
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk0" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            شنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk1" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            يکشنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk2" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            دوشنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk3" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            سه شنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk4" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            چهارشنبه
                                                        </td>
                                                        <td align="left">
                                                            <input id="Chk5" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            پنجشنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <input id="Chk6" style="background-color: transparent" type="checkbox" />
                                                        </td>
                                                        <td align="right">
                                                            جمعه
                                                        </td>
                                                        <td align="left">
                                                        </td>
                                                        <td align="right">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" valign="top" class="style10">
                                <table id="Table13" border="0" cellpadding="1" cellspacing="1" 
                                    style="width: 100%;">
                                    <tr>
                                        <td align="center" style="width: 22px; ">
                                            <input id="ChkDepartment" checked="true" name="GroupChk" 
                                                style="background-color: transparent" type="radio" value="" />
                                        </td>
                                        <td >
                                            واحد سازماني&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 22px">
                                            <input id="ChkPersonelGroup" name="GroupChk" 
                                                style="background-color: transparent" type="radio" value="ChkPersonelGroup" />
                                        </td>
                                        <td>
                                            گروه
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 22px">
                                            <input id="ChkPersonel" name="GroupChk" style="background-color: transparent" 
                                                type="radio" value="ChkPersonel" />
                                        </td>
                                        <td>
                                            پرسنل
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center"  valign="top">
                                <table id="XTabTable_Header" cellpadding="0" cellspacing="0" 
                                    style="width: 255px; ">
                                    <thead style="display: inline">
                                        <tr class="ShoperHeaderStyle">
                                            <td align="center" class="CssHeaderStyle" style="width: 3px">
                                                <input id="chkAll" name="chkAll" onclick="OnclickSelectAllChk(this)" 
                                                    style="background-color: transparent" type="checkbox" />
                                            </td>
                                            <td align="center" class="CssHeaderStyle">
                                                نام
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle" 
                                    style="scrollbar-highlight-color: white; overflow: auto; width: 255px;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 170px">
                                    <table id="GrdValidUser">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <input id="txtXmlMember" type="hidden" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitMember" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                 <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmitMember" runat="server" Text="BtnSubmitMember" OnClick="BtnSubmitMember_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server"  onclick="ImgRefreshPersonSubmit_Click" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtCardReaderID" name="txtCardexID" runat="server" />
                    <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
                    <input type="text" id="txtSearch" name="txtSearch" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        //////////////////////////////////This Page//////////////////////////////////////
        var OUserFlag = ""
        var OSelectedMamber = ""
        var OValidUserXml = ""
        var tSelectedMamber = ""
        var newrowindex = 0

        var currentPage_X = 0
        var strXPathConditions = ""
        var PageSize_X = 6

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value)) {
                FillTabTable('Next', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1) {
                FillTabTable('Previous', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                FillTabTable('Const', document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function OnClickBtnLast() {
            FillTabTable('Last', document.getElementById("GrdValidUser"))
        }
        //*******************************************************************************
        function OnClickBtnFirst() {
            FillTabTable('First', document.getElementById("GrdValidUser"))
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //******************************************************************************
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            var strUrl = 'CardReaderNew.aspx?CardReaderID=0'
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 300px;dialogWidth: 800px;center: Yes;help: no;status: no')

            if (rValue == 1) {
                document.getElementById(MasterObj + "txtSubmit").value = "Search";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //*******************************************************************************
        function OnClickBtnEdit() {
            //LastSelected
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            if (LastSelectedRow != null) {

                var strUrl = 'CardReaderNew.aspx?CardReaderID=' + LastSelectedRow.getAttribute("CardReaderID")
                           + '&CardReaderName=' + LastSelectedRow.getAttribute("CardReaderName")
                           + '&CardReaderCode=' + LastSelectedRow.cells(1).innerText
                           + '&SerialNo=' + LastSelectedRow.getAttribute("SerialNo")
                           + '&ReadTypeID=' + LastSelectedRow.getAttribute("ReadTypeID")
                           + '&Location=' + LastSelectedRow.getAttribute("Location")
                           + '&TRT=' + LastSelectedRow.cells(6).innerText
                           + '&SubSysID=' + LastSelectedRow.getAttribute("SubSysID")
                           + '&BrandID=' + LastSelectedRow.getAttribute("BrandID")
                           + '&ModelID=' + LastSelectedRow.getAttribute("ModelID")
                           + '&Active=' + LastSelectedRow.getAttribute("Active")
                           + '&ServiceDate=' + LastSelectedRow.getAttribute("ServiceDate")

                var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 300px;dialogWidth: 800px;center: Yes;help: no;status: no')
                if (rValue == 1) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Search";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert('لطفا سطر مورد نظر را انتخاب کنيد')
            }
        }
        //*******************************************************************************
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            if (LastSelectedRow != null) {
                if (confirm('آيا براي حذف مطمئن هستيد؟')) {
                    document.getElementById(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("CardReaderID")
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert('لطفا سطر مورد نظر را انتخاب کنيد')
            }
        }
        //*******************************************************************************
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("CardReaderID")
        }
        //*******************************************************************************
        function OndbClickGrd() {
            GetMemberData()
        }
        //*******************************************************************************
        function OnClickBtnShowGroupPerson() {
            var strOptions = ""
            var url

            if (document.getElementById("ChkPersonelGroup").checked == true) {
                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=2&Type=Check&WDFlag=1&ParentPage=CardReader.aspx"
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkDepartment").checked == true) {
              
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
                strOptions = "dialogHeight: 650px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkPersonel").checked == true) {
                OUserFlag = "P"
                var RequsterAction = window.event.srcElement.id

                if (RequsterAction.indexOf('OToolBar_') != -1) {
                    RequsterAction = RequsterAction.replace('OToolBar_', '')
                }
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?ShowFlag=0" + " &RequsterPageID=1136" + " &RequsterAction=" + RequsterAction;
                strOptions = "dialogHeight: 720px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else {
                alert('لطفا نوع عضويت را انتخاب کنيد')
                return
            }

            //------------------------------------------------------------
            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                url = ""
            }
            if (OSelectedMamber != undefined && OSelectedMamber != '' && OSelectedMamber != null && OSelectedMamber != "<Root></Root>") {
                if (document.getElementById("ChkDepartment").checked) {
                    OUserFlag = OSelectedMamber.split("#")[0];
                    OSelectedMamber = OSelectedMamber.split("#")[1];
                }
                if (document.getElementById("GrdValidUser").rows.length > 0) {
                    if (confirm('پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟')) {
                        ClearGrd(document.getElementById("GrdValidUser"))
                        tSelectedMamber = ''
                    }
                }

                //===============
                switch (OUserFlag) {
                    case "P":
                        OSelectedMamber = GetDataPerson()
                        break;
                    case "DA":
                        OSelectedMamber = GetDepartment()
                        break
                    case "DS":
                        OSelectedMamber = GetDepartment()
                        break
                    default:
                        OSelectedMamber = GetDataGroup()
                }
                //===============
                if (OSelectedMamber != "") {

                    OValidUserXml = OSelectedMamber
                    XTableInitialize(document.getElementById("GrdValidUser"))
                }

            }
        }
        //*******************************************************************************
        function GetDataPerson() {
            //            try {
            var Username = '';
            var SUsername = '';

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");
            var strSelectedMamber=""
            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;

            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                       xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('PersonID').text
                    + " and UserFlag='" + OUserFlag + "']");
                       //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                       if (xmlNodes2.length == 0) {
                           strSelectedMamber += '<Person>'
                           strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('PersonID').text + '</PersonID>'
                           strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('PersonCode').text + '</PersonCode>'
                           strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('PersonName').text + '</Family>'
                           strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                           strSelectedMamber += '<Selected>1</Selected>'
                           strSelectedMamber += '</Person>'
                       }
                }
            }

            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function GetDataGroup() {
            //            try {
            var Username = '';
            var SUsername = '';

            xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");
            var strSelectedMamber=""
            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;

            if (xmlNodes.length != 0) {
                for (x = 0; x < xmlNodes.length; x++) {
                //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('GroupId').text
                    + " and UserFlag='" + OUserFlag + "']");
                    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('GroupId').text + '</PersonID>'
                        strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('GroupId').text + '</PersonCode>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('GroupName').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }
            }

            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)
            //            }
            //            catch (e) {
            //                alert('اطلاعات نادرست است')
            //            }
        }
        //*******************************************************************************
        function GetDepartment() {

            var Username = '';
            var SUsername = '';
            xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(OSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb[Selected=1]");

            if (tSelectedMamber == "")
                tSelectedMamber = "<UserEntity></UserEntity>"

            xmlDoc2 = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc2.loadXML(tSelectedMamber);
            xmlDoc2.setProperty("SelectionLanguage", "XPath");
            var xmlNodes2;
            
            var strSelectedMamber = ""
            if (xmlNodes.length > 0) {
                for (var x = 0; x < xmlNodes.length; x++) {
                //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    xmlNodes2 = xmlDoc2.documentElement.selectNodes("/UserEntity/Person[PersonID=" + xmlNodes.item(x).selectSingleNode('DepartmentID').text
                    + " and UserFlag='" + OUserFlag + "']");
                    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    if (xmlNodes2.length == 0) {
                        strSelectedMamber += '<Person>'
                        strSelectedMamber += '<PersonID>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonID>'
                        strSelectedMamber += '<PersonCode>' + xmlNodes.item(x).selectSingleNode('DepartmentID').text + '</PersonCode>'
                        strSelectedMamber += '<Family>' + xmlNodes.item(x).selectSingleNode('Name').text + '</Family>'
                        strSelectedMamber += '<UserFlag>' + OUserFlag + '</UserFlag>'
                        strSelectedMamber += '<Selected>1</Selected>'
                        strSelectedMamber += '</Person>'
                    }
                }
            }
            tSelectedMamber = tSelectedMamber.replace("<UserEntity>", "<UserEntity>" + strSelectedMamber)

            strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
            return (strSelectedMamber)

        }
        //*******************************************************************************
        function ClearGrd(obj) {
            //alert(obj.rows.length)
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //*******************************************************************************
        function XTableInitialize(oGrd) {
            document.getElementById('OToolBar_txtCurPage').value = 0
            document.getElementById("chkAll").checked = true
            FillTabTable('First', oGrd)
        }
        //*******************************************************************************
        function FillTabTable(direction, oGrd) {
            ClearGrd(oGrd)

            if (tSelectedMamber == "") {
                tSelectedMamber = "<UserEntity></UserEntity>"
            }

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            var x;

            var xPath = ''
            xPath = ''
            var root = "/UserEntity/Person"
            if (xPath != '' || strXPathConditions != '') {
                if (xPath != '' && strXPathConditions != '')
                    xPath = strXPathConditions + ' and ' + xPath
                if (xPath == '' && strXPathConditions != '')
                    xPath = strXPathConditions
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[" + xPath + "]");
            }
            else
                xmlNodes = xmlDoc.documentElement.selectNodes(root);

            if (xmlNodes.length == 0) {
                return;
            }
            var totalRecords
            totalRecords = xmlNodes.length


            document.getElementById('OToolBar_txtTotalPage').value = Math.ceil(totalRecords / PageSize_X)

            if (totalRecords > 0) {
                currentPage_X = parseInt(document.getElementById('OToolBar_txtCurPage').value)

                switch (direction) {
                    case "Const":
                        currentPage_X = currentPage_X
                        break
                    case "Next":
                        currentPage_X = parseInt(currentPage_X) + 1
                        break
                    case "Previous":
                        currentPage_X = parseInt(currentPage_X) - 1
                        break
                    case "First":
                        currentPage_X = 1
                        break
                    case "Last":
                        currentPage_X = parseInt(document.getElementById('OToolBar_txtTotalPage').value)
                        break
                }

                document.getElementById('OToolBar_txtCurPage').value = currentPage_X

                var endFor
                if (currentPage_X * PageSize_X - 1 < 0)
                    return
                if (totalRecords <= currentPage_X * PageSize_X - 1)
                    endFor = totalRecords - 1
                else
                    endFor = parseInt(document.getElementById('OToolBar_txtCurPage').value) * PageSize_X - 1

                x = (currentPage_X - 1) * PageSize_X
                //----------------------
                document.getElementById('OToolBar_txtFromData').value = x + 1;
                document.getElementById('OToolBar_txtToData').value = endFor + 1;
                document.getElementById('OToolBar_txtTotalData').value = totalRecords;
                //-----------------------
                var Param
                var Username, SUsername
                var FlagCheck = true
                for (; x <= endFor; ++x) {
                    Username = xmlNodes.item(x).selectSingleNode('Family').text
                    if (Username.length > 15) {
                        SUsername = Username.substr(0, 15) + "..."
                    }
                    else {
                        SUsername = Username
                    }
                    AddRow(oGrd
					, xmlNodes.item(x).selectSingleNode('UserFlag').text
					, xmlNodes.item(x).selectSingleNode('PersonID').text
					, Username
					, SUsername
					, xmlNodes.item(x).selectSingleNode('PersonCode').text
					, xmlNodes.item(x).selectSingleNode('Selected').text)
                    if (xmlNodes.item(x).selectSingleNode('Selected').text == 0)
                        FlagCheck = false
                }

                document.getElementById("chkAll").checked = FlagCheck

            }
        }
        //*******************************************************************************
        function AddRow(oGrid, UserFlag, UserID, Username, SUsername, UserCode, Selected) {
            //try
            //{
            //oGrid="GrdValidUser"
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";

            //Set Attribute
            oGrid.rows(newrowindex).setAttribute("UserID", UserID)
            oGrid.rows(newrowindex).setAttribute("UserFlag", UserFlag)
            oGrid.rows(newrowindex).setAttribute("Name", Username)

            //Create Cell
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()

            var tempSrc = "";
            var picTitle = "";
            var NameTitle = "(" + UserCode + ")  " + Username
            switch (UserFlag) {
                case "P":
                    tempSrc = "../../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = 'پرسنل'
                    break
                case "G":
                    tempSrc = "../../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "'گروه'"
                    break
                case "S":
                    tempSrc = "../../../App_Utility/Images/Icons/time.gif"
                    picTitle = "'شيفت'"
                    break
                case "DS":
                    tempSrc = "../../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "'واحدسازماني بدون زيرمجموعه'"
                    break
                case "DA":
                    tempSrc = "../../../App_Utility/Images/Icons/Group.gif"
                    picTitle = "'واحدسازماني با زيرمجموعه'"
                    break
            }
            oGrid.rows(newrowindex).cells(0).innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)' >"

            if (Selected == 1) {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = true
            }
            else {
                oGrid.rows(newrowindex).cells(0).firstChild.checked = false
            }

            oGrid.rows(newrowindex).cells(1).innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
            oGrid.rows(newrowindex).cells(2).innerHTML = "<DIV style='DISPLAY: inline; HEIGHT: 15px';width:100%; ms_positioning='FlowLayout' title='" + NameTitle + "'>" + SUsername + "</DIV>"

            //Style
            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.width = "25px"
            oGrid.rows(newrowindex).cells(1).style.width = "42px"
            oGrid.rows(newrowindex).cells(2).style.width = "200px"

            newrowindex = newrowindex + 1
            //}
            //catch(e)
            //{
            //alert('اطلاعات نادرست است')
            //}

        }
        //*******************************************************************************
        function OnClickChk(obj) {
            var UserID = 0
            var UserFlag = ""

            UserID = obj.parentElement.parentElement.UserID
            UserFlag = obj.parentElement.parentElement.UserFlag


            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

            if (obj.checked)
                xmlNodes.item(0).selectSingleNode('Selected').text = 1
            else {
                xmlNodes.item(0).selectSingleNode('Selected').text = 0
                document.getElementById("chkAll").checked = false
            }

            tSelectedMamber = xmlDoc.xml
        }
        //*******************************************************************************
        function OnclickSelectAllChk(obj) {

            var oGrid = document.getElementById("GrdValidUser")
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");

            if (tSelectedMamber == "")
                return

            xmlDoc.loadXML(tSelectedMamber);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/UserEntity/Person"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)
            var UserID = 0
            var UserFlag = ""
            var Glen = oGrid.rows.length


            for (var j = 0; j < Glen; j++) {
                oGrid.rows(j).cells(0).firstChild.checked = obj.checked
                UserID = oGrid.rows(j).UserID
                UserFlag = oGrid.rows(j).UserFlag
                xmlNodes = xmlDoc.documentElement.selectNodes(root + "[PersonID=" + UserID + " and UserFlag='" + UserFlag + "']");

                if (obj.checked)
                    xmlNodes.item(0).selectSingleNode('Selected').text = 1
                else
                    xmlNodes.item(0).selectSingleNode('Selected').text = 0
            }
            tSelectedMamber = xmlDoc.xml
        }
        //*******************************************************************************
        function compareTime() {
            var EDate = document.getElementById(MasterObj + "EndDate_txtYear").value + document.getElementById(MasterObj + "EndDate_txtMonth").value + document.getElementById(MasterObj + "EndDate_txtDay").value
            var SDate = document.getElementById(MasterObj + "StartDate_txtYear").value + document.getElementById(MasterObj + "StartDate_txtMonth").value + document.getElementById(MasterObj + "StartDate_txtDay").value
            if (EDate < SDate) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else {
                return true
            }
        }
        //*******************************************************************************
        function compareTimeFilter() {
            var EDate = document.getElementById(MasterObj + "KEDate_txtYear").value + document.getElementById(MasterObj + "KEDate_txtMonth").value + document.getElementById(MasterObj + "KEDate_txtDay").value
            var SDate = document.getElementById(MasterObj + "KSDate_txtYear").value + document.getElementById(MasterObj + "KSDate_txtMonth").value + document.getElementById(MasterObj + "KSDate_txtDay").value
            if (EDate < SDate) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else {
                return true
            }
        }
        //*******************************************************************************
        function CreateWeeklyDay() {

            var strResut = ","
            var ChkName = ""
            for (var i = 0; i < 7; i++) {
                ChkName = "Chk" + i.toString()
                if (document.getElementById(ChkName).checked == true) {
                    strResut += i.toString() + ','
                }
            }
            //------------------------
            if (strResut == ",")
                strResut = ""
            //------------------------
            return strResut

        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)

            if (LastSelectedRow == null || document.getElementById(MasterObj + "txtCardReaderID").value == "" || document.getElementById(MasterObj + "txtCardReaderID").value == 0) {
                alert('لطفا يک سطر از گريد انتخاب کنيد')
                return
            }
            var XmlStr = "<Root><Info>"
            var oGrid = document.getElementById("GrdValidUser")
            XmlStr += "<CardReaderID>" + document.getElementById(MasterObj + "txtCardReaderID").value + "</CardReaderID>"
            //-----------------------------------
            var sDate = document.getElementById(MasterObj + "StartDate_txtYear").value + "/" + document.getElementById(MasterObj + "StartDate_txtMonth").value + "/" + document.getElementById(MasterObj + "StartDate_txtDay").value
            if (sDate == "//") {
                sDate = ""
                alert('لطفا تاريخ شروع را وارد کنيد')
                return
            }
            XmlStr += "<StartDate>" + sDate + "</StartDate>"
            //-----------------------------------

            var eDate = document.getElementById(MasterObj + "EndDate_txtYear").value + "/" + document.getElementById(MasterObj + "EndDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EndDate_txtDay").value
            if (eDate == "//") {
                eDate = ""
                alert('لطفا تاريخ پايان را وارد کنيد')
                return
            }
            if (compareTime() == false) {
                return
            }
            XmlStr += "<EndDate>" + eDate + "</EndDate>"


            if (CreateWeeklyDay() != "") {
                XmlStr += "<WeeklyDay>" + CreateWeeklyDay() + "</WeeklyDay>"
            }

            XmlStr += "</Info>"
            //==============================Get Member
            if (tSelectedMamber == "") {
                alert('لطفا اعضا مورد نظر را انتخاب کنيد')
                return
            }  
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(tSelectedMamber)
            var XmlNodes= xmlDoc.documentElement.selectNodes("/UserEntity/Person[Selected=1]")

            if ( XmlNodes.length==0) {
                alert('لطفا اعضا مورد نظر را انتخاب کنيد')
                return
            }           
            var StrXmlPerson = ""
            StrXmlPerson = ReplaceAll(tSelectedMamber, "<UserEntity>", "")
            StrXmlPerson = ReplaceAll(StrXmlPerson, "</UserEntity>", "")
            XmlStr += StrXmlPerson + "</Root>"
            //==============================Get Member
            document.getElementById(MasterObj + "txtXmlSave").value = XmlStr
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            //alert(XmlStr)
            document.getElementById(MasterObj + "BtnSubmitMember").click()
        }
        //*******************************************************************************
        function GetMemberData() {
            document.getElementById(MasterObj + "txtCardReaderID").value = LastSelectedRow.getAttribute("CardReaderID")
            document.getElementById(MasterObj + "txtSubmit").value = "GetMember";
            document.getElementById(MasterObj + "BtnSubmitMember").click();
        }
        //*******************************************************************************
        function LoadMemberInfo() {
            var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDoc.async = "false"
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlMember").value)
            var XmlNodes
            XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReaderMember")
            if (XmlNodes.length > 0) {
                var tempDate = XmlNodes.item(0).selectSingleNode("SDate").text
                if (tempDate != '') {
                    document.getElementById(MasterObj + "StartDate_txtYear").value = tempDate.substr(0, 4)
                    document.getElementById(MasterObj + "StartDate_txtMonth").value = tempDate.substr(5, 2)
                    document.getElementById(MasterObj + "StartDate_txtDay").value = tempDate.substr(8, 2)
                }
                tempDate = XmlNodes.item(0).selectSingleNode("EDate").text
                if (tempDate != '') {
                    document.getElementById(MasterObj + "EndDate_txtYear").value = tempDate.substr(0, 4)
                    document.getElementById(MasterObj + "EndDate_txtMonth").value = tempDate.substr(5, 2)
                    document.getElementById(MasterObj + "EndDate_txtDay").value = tempDate.substr(8, 2)
                }
                //+++++++++++++++++++++++++++++++++++++++++++++++++

                SetWeeklyDay(XmlNodes.item(0).selectSingleNode("WeekDay").text.toString())
                //-------------------------CreateGrid--------------------------------
                var oName = '', len = XmlNodes.length, strSelectedMamber = ""
                ClearGrd(document.getElementById("GrdValidUser"))

                for (var i = 0; i < len; i++) {
                    strSelectedMamber += '<Person>'
                    strSelectedMamber += '<PersonID>' + XmlNodes.item(i).selectSingleNode('MemberID').text + '</PersonID>'
                    strSelectedMamber += '<PersonCode>' + XmlNodes.item(i).selectSingleNode('MemberCode').text + '</PersonCode>'
                    strSelectedMamber += '<Family>' + XmlNodes.item(i).selectSingleNode('MemberName').text + '</Family>'
                    strSelectedMamber += '<UserFlag>' + XmlNodes.item(i).selectSingleNode('MemberType').text + '</UserFlag>'
                    strSelectedMamber += '<Selected>1</Selected>'
                    strSelectedMamber += '</Person>'
                }
                strSelectedMamber = '<UserEntity>' + strSelectedMamber + '</UserEntity>'
                tSelectedMamber = strSelectedMamber
                XTableInitialize(document.getElementById("GrdValidUser"))
            }
        }
        //*******************************************************************************
        function SetWeeklyDay(InputStr) {
            try {
                ClearWeeklyDay()
                var oDay = ""
                oDay = InputStr.split(',')
                for (var n = 0; n < oDay.length; n++) {
                    switch (oDay[n]) {
                        case '0':
                            document.getElementById("Chk0").checked = true
                            break
                        case '1':
                            document.getElementById("Chk1").checked = true
                            break
                        case '2':
                            document.getElementById("Chk2").checked = true
                            break
                        case '3':
                            document.getElementById("Chk3").checked = true
                            break
                        case '4':
                            document.getElementById("Chk4").checked = true
                            break
                        case '5':
                            document.getElementById("Chk5").checked = true
                            break
                        case '6':
                            document.getElementById("Chk6").checked = true
                            break
                    }
                }
            }
            catch (e) {
                alert('اطلاعات نادرست است')
            }
        }
        //*******************************************************************************
        function ClearWeeklyDay() {
            var strResut = ""
            var ChkName = ""
            for (var i = 0; i < 7; i++) {
                ChkName = "Chk" + i.toString()
                document.getElementById(ChkName).checked = false

            }
        }
        //*******************************************************************************
        function ClearData() {
            ClearWeeklyDay()
            ClearGrd(document.getElementById("GrdValidUser"))

            document.getElementById(MasterObj + "StartDate_txtYear").value = ""
            document.getElementById(MasterObj + "StartDate_txtMonth").value = ""
            document.getElementById(MasterObj + "StartDate_txtDay").value = ""

            document.getElementById(MasterObj + "EndDate_txtYear").value = ""
            document.getElementById(MasterObj + "EndDate_txtMonth").value = ""
            document.getElementById(MasterObj + "EndDate_txtDay").value = ""

            document.getElementById("ChkDepartment").checked = true
            document.getElementById("chkAll").checked = false

            OUserFlag = ""
            OSelectedMamber = ""
            OValidUserXml = ""
            tSelectedMamber = ""
            newrowindex = 0

            currentPage_X = 0
            strXPathConditions = ""

            document.getElementById("OToolBar_txtCurPage").value = ""
            document.getElementById("OToolBar_txtTotalPage").value = ""
            document.getElementById('OToolBar_txtFromData').value = ""
            document.getElementById('OToolBar_txtToData').value = ""
            document.getElementById('OToolBar_txtTotalData').value =""
        }
        //*******************************************************************************
        function OnClickBtnFilter() {
            var strSearch = '<Root><Tb>'
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            if (compareTimeFilter() == false)
                return 
            var sDate = document.getElementById(MasterObj + "KSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KSDate_txtDay").value
            if (sDate != "//")
                strSearch += '<SDate>' + sDate + '</SDate>'

         
            sDate = ""
            sDate = document.getElementById(MasterObj + "KEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KEDate_txtDay").value
          
             if (sDate != "//")
                 strSearch += '<EDate>' + sDate + '</EDate>'


          if (document.getElementById(MasterObj + "txtPersonCode").value != "")
              strSearch += '<PersonCode>' + document.getElementById(MasterObj + "txtPersonCode").value + '</PersonCode>'
            
            if(document.getElementById(MasterObj + "CmbSystem").value!="" && document.getElementById(MasterObj + "CmbSystem").value!=0 )
                strSearch += '<SubsysID>' + document.getElementById(MasterObj + "CmbSystem").value + '</SubsysID>'

            strSearch += '</Tb></Root>'
            document.getElementById(MasterObj + "txtSearch").value = strSearch
            document.getElementById(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnBlurTxtPersonCode() {
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" || document.getElementById(MasterObj + "txtPersonCode").value != "0")
                document.getElementById(MasterObj + "SelName").value = document.getElementById(MasterObj + "txtPersonCode").value
            else
                document.getElementById(MasterObj + "SelName").value = "0";
        }
        //*******************************************************************************
        function OnBlurTxtPersonCode() {
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" || document.getElementById(MasterObj + "txtPersonCode").value != "0")
                document.getElementById(MasterObj + "SelName").value = document.getElementById(MasterObj + "txtPersonCode").value
            else
                document.getElementById(MasterObj + "SelName").value = "0";
        }
        //*******************************************************************************
        function OnChangeSelName() {

            if (document.getElementById(MasterObj + "SelName").value != "0")
                document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "SelName").value;
            else
                document.getElementById(MasterObj + "txtPersonCode").value = "";
        }
        //*******************************************************************************
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnShowAll() {
            LastSelectedRow = null;
            ClearData()
            document.getElementById(MasterObj + "KEDate_txtYear").value =""
            document.getElementById(MasterObj + "KEDate_txtMonth").value =""
            document.getElementById(MasterObj + "KEDate_txtDay").value = ""
            
            document.getElementById(MasterObj + "KSDate_txtYear").value = ""
            document.getElementById(MasterObj + "KSDate_txtMonth").value = ""
            document.getElementById(MasterObj + "KSDate_txtDay").value = ""

            document.getElementById(MasterObj + "txtPersonCode").value = ""
            document.getElementById(MasterObj + "SelName").value = 0
            document.getElementById(MasterObj + "CmbSystem").value = 0
            
            OnClickBtnFilter()
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 77px;
        }
        .style3
        {
            width: 52px;
        }
        .style4
        {
            width: 397px;
        }
        .style5
        {
            width: 109px;
        }
        .style6
        {
            width: 50px;
        }
        .style7
        {
            width: 31px;
        }
        .style8
        {
            width: 82px;
        }
        .style9
        {
            width: 60px;
        }
        .style10
        {
            width: 114px;
        }
    </style>

</asp:Content>

