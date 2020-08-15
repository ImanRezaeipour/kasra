<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ModifyPersonTab.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.ModifyPersonTab"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>
   <script language="javascript" src="../../../App_Utility/Scripts/farsi.js"></script>
   
    <link rel="stylesheet" type="text/css" href="/FrmPresentation/App_Utility/Scripts/Tab/resources/css/ext-all.css" />
 	<script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/ext-all.js"></script>
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/TabCloseMenu.js"></script>
    <link rel="stylesheet" type="text/css" href="/FrmPresentation/App_Utility/Scripts/Tab/tabs-example.css" />
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/source/widgets/TabPanel.js"></script>


    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>

    <table style="width: 691px;">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ModifyPersonTab.aspx" 
                    PageID="1106" />
            </td>
        </tr>
        <tr>
            <td style="border-left: solid 1px #8db2e3; border-bottom: solid 1px #8db2e3; border-top: solid 1px #8db2e3;
                border-right: solid 1px #8db2e3;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 102px">
                            <font color="#FF66B3">شماره پرسنلي :</font>
                        </td>
                        <td id="TDPersonCode" style="width: 162px" runat="server">
                            &nbsp;
                        </td>
                        <td style="width: 128px">
                            <font color="#FF66B3">نام و نام خانوادگي :</font>
                        </td>
                        <td id="TDFullName" runat="server">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td dir="ltr">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    var elem
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        elem = args.get_postBackElement();
                        //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                       document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        
                        //alert(elem.id)
                        if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmitDept') {
                            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            oXmlDoc.async = "false";
                            oXmlDoc.loadXML($get(MasterObj + "txtDeptValue").value);
                            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/DeptPositionInfo");

                            if (oXmlNodes.length != 0) {
                                var ODeptPersonGrid = document.getElementById("GrdDeptPerson");
                                if (DeptPersonGridRowIndex != '') {
                                    ODeptPersonGrid.rows(DeptPersonGridRowIndex).cells(1).innerText = oXmlNodes.item(0).selectSingleNode('DepartmentCode').text;
                                    ODeptPersonGrid.rows(DeptPersonGridRowIndex).cells(2).innerText = oXmlNodes.item(0).selectSingleNode('DeptParentName').text;
                                }
                            }
                        }
                        else if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmit') {
                            if ($get(MasterObj + "txtSubmit").value == "Save" | $get(MasterObj + "txtSubmit").value == "SaveNew") {
                                if ($get(MasterObj + "txtAlert").value == "Save") {
                                    $get(MasterObj + 'TDPersonCode').innerText = $get(MasterObj + "txtPersonCode").value;
                                    $get(MasterObj + 'TDFullName').innerText = $get(MasterObj + "txtLName").value + ' ' + $get(MasterObj + "txtFName").value;
                                    PrsID = $get(MasterObj + "txtPersonID").value;
                                }

                                if ($get(MasterObj + "txtAlert").value != "")
                                    SetMsg($get(MasterObj + "txtAlert").value);
                            }
                        }
                        else if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmitCheckPersonCode') {
                            if ($get(MasterObj + "txtSubmit").value == "CheckPersonCode" & $get(MasterObj + "txtAlertCheckPCode").value != "") {
                                $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtAlertCheckPCode").value
                                    SetMsg($get(MasterObj + "txtAlert").value);
                            }
                        }
                        else if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmitCheckCard') {
                            if ($get(MasterObj + "txtSubmit").value == "CheckCardNo")
                                if ($get(MasterObj + "txtCardNo").value != "") {
                                    $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtCardNo").value
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                }
                                else {
                                    var OGrdCard = document.getElementById("GrdCard");
                                    var RowIndex = parseInt($get(MasterObj + "txtGrdCardRowIndex").value)
                                    if (CheckRepeatCardNO(OGrdCard.rows(RowIndex).cells(2).firstChild.value)) {
                                        OGrdCard.rows(RowIndex).cells(0).firstChild.disabled = false;
                                        OGrdCard.rows(RowIndex).cells(3).firstChild.disabled = false;
                                        OGrdCard.rows(RowIndex).cells(4).firstChild.disabled = false;
                                        OGrdCard.rows(RowIndex).cells(0).firstChild.checked = true;

                                        if (CanAddToGrdCardStatus(OGrdCard.rows(RowIndex).cells(2).firstChild.value, OGrdCard.rows(RowIndex).SubSysID)) {
                                            var TempGridLen = document.getElementById("GrdCardStatus").rows.length
                                            AddRowToGrdCardStatus()
                                            if (TempGridLen == document.getElementById("GrdCardStatus").rows.length &
                                                    (TempGridLen == 2 & document.getElementById("GrdCardStatus").rows(TempGridLen - 1).cells(0).innerText == "")
                                                    | (TempGridLen!= 2))
                                                AddRowToGrdCardStatus()
                                        }       
                                    }
                                    else {
                                        $get(MasterObj + "txtAlert").value = "RepeatInfo";
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                    }   
                                }
                        }
                    }
                </script>

                    <div id="tabs" style="margin:15px 0;height:15px"></div>
                    
                        <div id="PersonDiv" dir="rtl" lang="fa" style="display: inline" >
                        <table width="100%"><tr><td>
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td id="PersonCodeTD" style="width: 135px">
                                                    شماره برسنلی :
                                                </td>
                                    <td style="width: 173px">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                 <input id="txtPersonCode" onblur="onBlurTxtPersonCode()" name="txtPersonCode" type="text"
                                                        runat="server" onkeydown="OnKeyDownInt(this)" dir="rtl" 
                                                     style="width: 120px" maxlength="20" />
                                                <asp:HiddenField ID="txtAlertCheckPCode" runat="server" />     
                                                
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitCheckPersonCode" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                                   </td>
                                    <td style="width: 127px">
                                                    جنسیت :
                                                </td>
                                    <td>
                                                    <input id="Rmale" type="radio" runat="server" name="RSex" 
                                            checked style="background-color: transparent" value="1" />مرد&nbsp;
                                                    <input id="RFemale" type="radio" runat="server" name="RSex" 
                                            style="background-color: transparent" value="2" />زن
                                                </td>
                                </tr>
                                <tr>
                                    <td id="LNameTD" style="width: 135px">
                                        نام خانوادکی :
                                    </td>
                                    <td style="width: 173px">
                                        <input id="txtLName" name="txtLName"  onkeydown="FKeyDown()" onkeypress="FKeyPress()" lang="0" type="text" runat="server"
                                            dir="rtl" style="width: 120px" />
                                    </td>
                                    <td style="width: 127px">
                                        نام :
                                    </td>
                                    <td>
                                        <input id="txtFName" name="txtFName" onkeydown="FKeyDown()" onkeypress="FKeyPress()" lang="0" type="text" runat="server" dir="rtl"
                                            style="width: 120px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 135px">
                                        تاریخ تولد :
                                    </td>
                                    <td style="width: 173px">
                                        <uc2:KCalendar ID="BirthDate" runat="server" />
                                    </td>
                                    <td style="width: 127px">
                                        محل تولد :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CmbBornPlace" runat="server" Width="120px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 135px">
                                        تاریخ استخدام :
                                    </td>
                                    <td style="width: 173px">
                                        <uc2:KCalendar ID="EmployDate" runat="server" />
                                    </td>
                                    <td style="width: 127px">
                                        تاریخ شروع به کار :
                                    </td>
                                    <td>
                                        <uc2:KCalendar ID="WorkingDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 135px">
                                        تاریخ خاتمه کار :
                                    </td>
                                    <td style="width: 173px">
                                        <uc2:KCalendar ID="ExitDate" runat="server" />
                                    </td>
                                    <td style="width: 127px">
                                        شماره شناسنامه :
                                    </td>
                                    <td>
                                        <input id="txtIdentifierNo" name="txtIdentifierNo" onkeydown="OnKeyDownInt(this)"
                                            type="text" runat="server" dir="rtl" style="width: 120px" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 135px">
                                        شماره ملی :
                                    </td>
                                    <td style="width: 173px">
                                        <input id="txtNationalNo" name="txtNationalNo" onkeydown="OnKeyDownInt(this)" type="text"
                                            runat="server" dir="rtl" style="width: 115px" maxlength="20" />
                                    </td>
                                    <td style="width: 127px">
                                        وضعيت :
                                    </td>
                                    <td>
                                        <input id="RDaem" type="radio" runat="server" name="RIsTemp" checked style="background-color: transparent" />دائم
                                        <input id="RMovaghat" type="radio" runat="server" name="RIsTemp" style="background-color: transparent" />موقت
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 135px">
                                        وضعيت اشتغال:</td>
                                    <td style="width: 173px">
                                        <asp:DropDownList ID="CmbEmployType" runat="server" Width="120px">
                                        </asp:DropDownList>
                                                                </td>
                                    <td style="width: 127px">
                                        شيفت اسمي:</td>
                                    <td>
                                        <asp:DropDownList ID="CmbBaseSchedule" runat="server" Width="120px">
                                        </asp:DropDownList>
                                                                </td>
                                </tr>
                            </table>
                            <table align="right" dir="rtl" style="width: 313px">              
                                <tr>
                                    <td style="width: 116px; vertical-align:bottom">
                                        تصویر :
                                    </td>
                                    <td style="width: 46px; vertical-align:bottom">
                                     
                                     <input id="BtnUpload" name="BtnUpload" type="button" style="width:68px" 
                                            value="انتخاب تصوير" onclick="OnClickBtnUpload()"/>
                                    </td>
                                    <td  style="width: 80px;vertical-align:top;height:80px" align="left">
                                        <img alt="" runat="server" style="height: 80px;width:80px;display:inline" id="TDImg" name="TDImg" />
                                    </td>
                                </tr>
                            </table>
                            </td></tr></table>
                        </div>
                        <div id="TakmiliDiv" style="display: none">
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td align="center" valign="middle">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="CardDiv" style="display: none" >
                            <div style="vertical-align: middle" align="center">
                                <table id="Table16" dir="rtl">
                                    <tr>
                                        <td style="font-weight: 700" align="center">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <br />
                                                    
                                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                                        <asp:HiddenField ID="txtPicPath" runat="server" />
                                                        <asp:HiddenField ID="txtPersonID" runat="server" />
                                                                                                   
                                                    <img alt="" runat="server" style="height: 80px;width:80px;display:none" id="ImgPerson" name="ImgPerson" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:HiddenField ID="txtCardNo" runat="server" />
                                                <asp:HiddenField ID="txtGrdCardRowIndex" runat="server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitCheckCard" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="display: none">
                                <asp:HiddenField ID="txtSaveXml" runat="server" />
                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                <asp:HiddenField ID="txtSearch" runat="server" />
                                <asp:HiddenField ID="lblFrom" runat="server" />
                                <asp:HiddenField ID="lblTo" runat="server" />
                                <asp:HiddenField ID="lblTotal" runat="server" />
                            </div>
                        </div>
                        <div id="DepartmentDiv" style="display: none" >
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="DeptPersonGridViewPlaceHolder" runat="Server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:HiddenField ID="txtDeptValue" runat="server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmitDept" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="GroupMemberShip" style="display: none" >
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td align="center" valign="middle">
                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="GroupMemberShipPlaceholder" runat="Server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="CardStatusDiv" style="display: none" >
                            <table width="100%" dir="rtl">
                                <tr>
                                    <td align="center" valign="middle">
                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="CardStatusDivPlaceholder" runat="Server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="UserInfoDiv" style="display: none" >
                            <table align="center" dir="rtl" style="width: 36%">
                                <tr>
                                    <td style="width: 121px">
                                        نام کاربری :
                                    </td>
                                    <td id="lblUserName" runat="server">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 121px">
                                        کلمه عبور :
                                    </td>
                                    <td>
                                        <input id="txtPass" name="txtPass" type="password" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 121px">
                                        تایید کلمه عبور :
                                    </td>
                                    <td>
                                        <input id="txtConfirmPass" name="txtConfirmPass" type="password" />
                                    </td>
                                </tr>
                            </table>
                        </div>                 
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
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnSubmitCheckPersonCode" runat="server" Text="BtnSubmitCheckPersonCode" OnClick="BtnSubmitCheckPersonCode_Click" /> 
                    <asp:Button ID="BtnSubmitDept" runat="server" Text="BtnSubmitDept" OnClick="BtnSubmitDept_Click" />
                    <asp:Button ID="BtnSubmitCheckCard" runat="server" Text="BtnSubmitCard" OnClick="BtnSubmitCheckCard_Click" />
                </div>
            </td>
        </tr>
    </table>
    
    <script type="text/javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var TabId = '';
        window.name = "ModifyPersonTab.aspx"
        aspnetForm.target = "ModifyPersonTab.aspx"
        var DeptPersonGridRowIndex = ''
        var LastSelectedRow = '';
        var PassStr = '';
        var PrsID = $get(MasterObj + "txtPersonID").value


        //************************************doOnLoad************************************
        //document.getElementById("KeybordType").innerHTML="Fa"
        //OnClickPersonTab()
        //addClassName(document.getElementById('PersonTab'), 'TabbedPanelsTabSelected', '')
        //document.getElementById(TabId).value = 'PersonTab';

        //Set UserName=PersonCode-----------------------------
        $get(MasterObj + "lblUserName").innerText = $get(MasterObj + "txtPersonCode").value;
        if ($get("ImgPerson").src != "")
            $get("TDImg").src = $get("ImgPerson").src
        //----------------------------------------------------
        var tabs
        Ext.onReady(function() {

            tabs = new Ext.TabPanel({
                renderTo: 'tabs',
                resizeTabs: true, // turn on tab resizing
                minTabWidth: 115,
                tabWidth: 155,
                enableTabScroll: true,
                width: 700,
                height: 550,
                defaults: { autoScroll: true, align:'Center' },
                plugins: new Ext.ux.TabCloseMenu(),
                activeTab: 0,
                items: [{
                    title: 'مشخصات پرسنلي',
                    html: document.getElementById('PersonDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }
                , {
                    title: ' مشخصات تکميلي',
                    html: document.getElementById('TakmiliDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"

                }, {
                    title: 'مشخصات کارت',
                    html: document.getElementById('CardDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }, {
                    title: 'عضويت در گروهها',
                    html: document.getElementById('GroupMemberShip').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }, {
                    title: ' مشخصات کاربري',
                    html: document.getElementById('UserInfoDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }
                , {
                    title: 'دسترسي ها',
                    html: '',
                    bodyStyle: "background-color:#D1E1F8"
                }
                , {
                    title: 'وضعيت کارت',
                    html: document.getElementById('CardStatusDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }
                , {
                    title: 'واحد سازماني',
                    html: document.getElementById('DepartmentDiv').innerHTML,
                    bodyStyle: "background-color:#D1E1F8"
                }
                ]
            });
            
        });
       


//        if ($get(MasterObj + "txtPersonCode").value == "0") {
//            $get(MasterObj + "txtPersonCode").value = "";
//            $get(MasterObj + "txtPersonCode").focus();
//        }

//        if ($get("ImgPerson").src != "")
        //            $get("TDImg").src = $get("ImgPerson").src
        //alert(UserInfoDiv.innerHTML)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*************************************Toolbar*************************************/
        function OnClickBtnNew() {
            var acIndex = tabs.getActiveTab()

            PrsID = "0";
            $get(MasterObj + "txtPersonID").value = "0";
            $get(MasterObj + "TDPersonCode").innerText = "";
            $get(MasterObj + "TDFullName").innerHTML = "&nbsp;";
            $get(MasterObj + "txtPersonCode").value = ""
            $get(MasterObj + "txtLName").value = ""
            $get(MasterObj + "txtFName").value = ""
            $get(MasterObj + "txtIdentifierNo").value = ""
            $get(MasterObj + "txtNationalNo").value = ""
            $get(MasterObj + "CmbBornPlace").value = "0"
            $get(MasterObj + "CmbBaseSchedule").value = "0"
            $get(MasterObj + "CmbEmployType").value = "0"
            $get("ImgPerson").src = ""
            document.getElementById("TDImg").src = ""
            
            $get(MasterObj + "Rmale").checked = true
            $get(MasterObj + "RFemale").checked = false
            //تاریخ تولد
            $get(MasterObj + "BirthDate_txtDay").value = "";
            $get(MasterObj + "BirthDate_txtMonth").value = "";
            $get(MasterObj + "BirthDate_txtYear").value = "";
            //تاریخ استخدام
            $get(MasterObj + "EmployDate_txtDay").value = "";
            $get(MasterObj + "EmployDate_txtMonth").value = "";
            $get(MasterObj + "EmployDate_txtYear").value = "";
            //تاریخ شروع به کار
            $get(MasterObj + "WorkingDate_txtDay").value = "";
            $get(MasterObj + "WorkingDate_txtMonth").value = "";
            $get(MasterObj + "WorkingDate_txtYear").value = "";
            //تاریخ خاتمه کار
            $get(MasterObj + "ExitDate_txtDay").value = "";
            $get(MasterObj + "ExitDate_txtMonth").value = "";
            $get(MasterObj + "ExitDate_txtYear").value = "";

            $get(MasterObj + "txtSaveXml").value = "";
            
            //مشخصات کاربري
            tabs.setActiveTab(4)
            $get(MasterObj + "lblUserName").innerText = "";
            $get("txtPass").value = "";
            $get("txtConfirmPass").value = "";
            
            tabs.setActiveTab(2)
            ResetGrdCard();

            tabs.setActiveTab(3)
            ResetGrdSubSysGroup();

            tabs.setActiveTab(1)
            ResetGrdExPerson();

            tabs.setActiveTab(7)
            ResetGrdDeptPerson();

            tabs.setActiveTab(6)
            ResetGrdCardStatus();


            tabs.activate(acIndex)

          

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnUpload() {
            var url = "SelectPic.aspx?PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value
            + "&PersonID=" + PrsID; //document.getElementById(MasterObj + "txtPersonID").value
            var StrFeatur = "dialogHeight: 100px;dialogWidth: 400px;center: Yes;help: no;status: no"
            var rv = window.showModalDialog(url, window, StrFeatur)
            
            var strPath=""
            if (rv != "" || rv != undefined) {
                document.getElementById(MasterObj + "txtPicPath").value = rv

                document.getElementById("TDImg").src = rv
                $get("ImgPerson").src = rv
            }
           
        }
       
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" && document.getElementById(MasterObj + "txtLName").value != "") {
                var SaveFlag = MakeXML()
                if (SaveFlag) {
                    //alert(document.getElementById(MasterObj + "txtSaveXml").value)
                   $get(MasterObj + "txtSubmit").value = "Save";
                   document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                
                if (document.getElementById(MasterObj + "txtLName").value == "") {
                    document.getElementById("LNameTD").innerHTML = "نام خانوادگی :" + "<div style='color: #FF66B3; width: 8px;'>*</div>"
                    // document.getElementById(MasterObj + "txtLName").focus();
                   
                }
                if (document.getElementById(MasterObj + "txtPersonCode").value == "") {
                    document.getElementById("PersonCodeTD").innerHTML = "شماره پرسنلې :" + "<div style='color: #FF66B3; width: 8px;'>*</div>"
                    //document.getElementById(MasterObj + "txtPersonCode").focus();
                    
                }
                if (document.getElementById(MasterObj + "txtLName").value == "") {
                 alert("لطفا نام خانوادګی را وارد نماييد");
                  }
                else if (document.getElementById(MasterObj + "txtPersonCode").value == "") {
                    alert("لطفا شماره پرسنلی را وارد نماييد");
                }
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML(StrXml) {
            var StrXml = "";
            var SaveFlag = true;
            var Sex;
            var BirthDate;
            var EmployDate;
            var ExitDate;
            var WorkingDate;
            var FilePath = "/FrmPresentation/App_Utility/Images/Upload/";

            document.getElementById(MasterObj + "txtSaveXml").value = '';
            document.getElementById("LNameTD").innerHTML = "نام خانوادګی :"
            document.getElementById("PersonCodeTD").innerHTML = "شماره پرسنلې :"

            if (document.getElementById(MasterObj + "Rmale").checked == true)
                Sex = 1;
            else if (document.getElementById(MasterObj + "RFemale").checked == true)
                Sex = 2;


            BirthDate = document.getElementById(MasterObj + "BirthDate_txtYear").value + "/" + document.getElementById(MasterObj + "BirthDate_txtMonth").value + "/" + document.getElementById(MasterObj + "BirthDate_txtDay").value
            EmployDate = document.getElementById(MasterObj + "EmployDate_txtYear").value + "/" + document.getElementById(MasterObj + "EmployDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EmployDate_txtDay").value
            ExitDate = document.getElementById(MasterObj + "ExitDate_txtYear").value + "/" + document.getElementById(MasterObj + "ExitDate_txtMonth").value + "/" + document.getElementById(MasterObj + "ExitDate_txtDay").value
            WorkingDate = document.getElementById(MasterObj + "WorkingDate_txtYear").value + "/" + document.getElementById(MasterObj + "WorkingDate_txtMonth").value + "/" + document.getElementById(MasterObj + "WorkingDate_txtDay").value

            if (BirthDate == "//")
                BirthDate = "";

            if (EmployDate == "//")
                EmployDate = "";

            if (ExitDate == "//")
                ExitDate = "";

            if (WorkingDate == "//")
                WorkingDate = "";

            var IsTemp;
            if ($get(MasterObj + "RDaem").checked == true)
                IsTemp = 0
            else if ($get(MasterObj + "RMovaghat").checked == true)
                IsTemp = 1

           // alert($get(MasterObj + "txtPersonID").value)
           // alert(PrsID)
            StrXml = "<Root><PersonTab>";
            //StrXml += "<PersonID>" + $get(MasterObj + "txtPersonID").value + "</PersonID>";
            StrXml += "<PersonID>" + PrsID + "</PersonID>";
            StrXml += "<PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>";
            StrXml += "<FName>" + document.getElementById(MasterObj + "txtFName").value + "</FName>";
            StrXml += "<LName>" + document.getElementById(MasterObj + "txtLName").value + "</LName>";
            StrXml += "<BirthDate>" + BirthDate + "</BirthDate>";
            StrXml += "<BornPlaceID>" + document.getElementById(MasterObj + "CmbBornPlace").value + "</BornPlaceID>";
            StrXml += "<EmployDate>" + EmployDate + "</EmployDate>";
            StrXml += "<ExitDate>" + ExitDate + "</ExitDate>";
            StrXml += "<IdentifireNo>" + document.getElementById(MasterObj + "txtIdentifierNo").value + "</IdentifireNo>";
            StrXml += "<NationalNo>" + document.getElementById(MasterObj + "txtNationalNo").value + "</NationalNo>";
            StrXml += "<Sex>" + Sex + "</Sex>";
            StrXml += "<EmployTypeID>" + document.getElementById(MasterObj + "CmbEmployType").value + "</EmployTypeID>";
            StrXml += "<BaseScheduleID>" + document.getElementById(MasterObj + "CmbBaseSchedule").value + "</BaseScheduleID>";
            StrXml += "<IsTemp>" + IsTemp + "</IsTemp>";

            StrXml += "<PicPath>" + document.getElementById(MasterObj + "txtPicPath").value + "</PicPath>";


            StrXml += "<WorkingDate>" + WorkingDate + "</WorkingDate>";
            StrXml += "</PersonTab>";

            //***************************Card Tab
            var OGrid = document.getElementById("GrdCard");
            var len = OGrid.rows.length
            for (var i = 0; i < len; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked == true) {
                    StrXml += '<CardTab>'
                    StrXml += "<CardID>" + OGrid.rows(i).getAttribute('CardID') + "</CardID>"
                    StrXml += "<SubSysID>" + OGrid.rows(i).getAttribute('SubSysID') + "</SubSysID>"
                    StrXml += "<CardNo>" + OGrid.rows(i).cells(2).firstChild.value + "</CardNo>"
                    StrXml += "<CardType>" + OGrid.rows(i).cells(3).firstChild.value + "</CardType>"
                    StrXml += '</CardTab>'
                }
            }
            //***************************Takmili Tab
            var OExGrid = document.getElementById("GrdExPerson");
            for (var i = 1; i < OExGrid.rows.length; i++) {
                StrXml += '<ExFieldTab>';
                StrXml += '<TFID1>' + OExGrid.rows(i).getAttribute('TFID1') + '</TFID1>';
                if (OExGrid.rows(i).cells(1).firstChild.type == 'text')
                    StrXml += '<Value1>' + OExGrid.rows(i).cells(1).firstChild.value + '</Value1>';
                else if (OExGrid.rows(i).cells(1).firstChild.type == 'checkbox') {
                    StrXml += '<Value1>' + ((OExGrid.rows(i).cells(1).firstChild.checked) ? '1' : '0') + '</Value1>';
                }
                StrXml += '<TFID2>' + ((OExGrid.rows(i).getAttribute('TFID2') != "") ? OExGrid.rows(i).getAttribute('TFID2') : "0") + '</TFID2>';
                if (OExGrid.rows(i).getAttribute('TFID2') != "") {
                    if (OExGrid.rows(i).cells(3).firstChild.type == 'text')
                        StrXml += '<Value2>' + OExGrid.rows(i).cells(3).firstChild.value + '</Value2>';
                    else if (OExGrid.rows(i).cells(3).firstChild.type == 'checkbox')
                        StrXml += '<Value2>' + ((OExGrid.rows(i).cells(3).firstChild.checked) ? '1' : '0') + '</Value2>';
                }
                else
                    StrXml += '<Value2></Value2>';
                StrXml += '</ExFieldTab>';
            }
            //***************************DeptPerson Tab
            var ODeptPersonGrid = document.getElementById("GrdDeptPerson");
            for (var i = 1; i < ODeptPersonGrid.rows.length; i++) {
                if ((ODeptPersonGrid.rows(i).style.backgroundColor == '' &
                            (ODeptPersonGrid.rows(i).cells(0).firstChild.value == 0 &
                                ODeptPersonGrid.rows(i).cells(3).firstChild.value == 0 &
                                  ODeptPersonGrid.rows(i).cells(4).firstChild.value == '' &
                                    ODeptPersonGrid.rows(i).cells(5).firstChild.value == '') |

                              (ODeptPersonGrid.rows(i).cells(0).firstChild.value != 0 &
                                ODeptPersonGrid.rows(i).cells(3).firstChild.value != 0 &
                                  ODeptPersonGrid.rows(i).cells(4).firstChild.value != '' &
                                    ODeptPersonGrid.rows(i).cells(5).firstChild.value != '')
                                    ) |
                                    (ODeptPersonGrid.rows(i).style.backgroundColor == 'pink')) {
                    StrXml += '<DeptPerson>'
                    StrXml += '<Selected>' + ((ODeptPersonGrid.rows(i).style.backgroundColor == 'pink' | (ODeptPersonGrid.rows(i).style.backgroundColor == '' & ODeptPersonGrid.rows(i).cells(0).firstChild.value=="0")) ? '0' : '1') + '</Selected>';
                    StrXml += '<DepartmentID>' + ODeptPersonGrid.rows(i).cells(0).firstChild.value + '</DepartmentID>';
                    StrXml += '<RoleType>' + ODeptPersonGrid.rows(i).cells(3).firstChild.value + '</RoleType>';
                    StrXml += '<RoleName>' + ODeptPersonGrid.rows(i).cells(4).firstChild.value + '</RoleName>';
                    StrXml += '<CreateDate>' + ODeptPersonGrid.rows(i).cells(5).firstChild.value + '</CreateDate>';
                    StrXml += '<RoleID>' + ODeptPersonGrid.rows(i).getAttribute('RoleID') + '</RoleID>';
                    StrXml += '</DeptPerson>'
                }
                else {
                    alert('لطفا اطلاعات تب واحدسازماني را تکميل نماييد');
                    //OnClickDepartmentTab();
                    SaveFlag = false;
                    i = ODeptPersonGrid.rows.length;
                }
            }
            //***************************GroupMemberShip Tab
            if (document.getElementById("GrdSubSysGroup") != null) {
                var OGrdSubSysGroup = document.getElementById("GrdSubSysGroup");
                for (var i = 1; i < OGrdSubSysGroup.rows.length; i++) {
                    if (OGrdSubSysGroup.rows(i).cells(0).firstChild.checked == true) {
                        var SD = OGrdSubSysGroup.rows(i).cells(3).firstChild.value
                        var ED = OGrdSubSysGroup.rows(i).cells(4).firstChild.value
                        SD = SD.substr(6, 4) + SD.substr(3, 2) + SD.substr(0, 2);
                        ED = ED.substr(6, 4) + ED.substr(3, 2) + ED.substr(0, 2);
                        if (parseInt(SD) <= parseInt(ED)) {
                            StrXml += '<GroupMemberShip>'
                            StrXml += '<GroupID>' + OGrdSubSysGroup.rows(i).GroupID + '</GroupID>'
                            StrXml += '<SDate>' + OGrdSubSysGroup.rows(i).cells(3).firstChild.value + '</SDate>'
                            StrXml += '<EDate>' + OGrdSubSysGroup.rows(i).cells(4).firstChild.value + '</EDate>'
                            StrXml += '<Selected>1</Selected>'
                            StrXml += '</GroupMemberShip>'
                        }
                        else {
                            alert('لطفا در تب عضويت در گروهها،دقت نماييد '+String.fromCharCode('13')+'تاريخ شروع بايد کوچکتر از تاريخ خاتمه باشد.');
                            SaveFlag = false;
                            i = OGrdSubSysGroup.rows.length;
                        }

                    }
                    else if (OGrdSubSysGroup.rows(i).cells(0).firstChild.checked == false) {
                        if (OGrdSubSysGroup.rows(i).cells(3).firstChild.value!="" || OGrdSubSysGroup.rows(i).cells(4).firstChild.value!="") {

                            StrXml += '<GroupMemberShip>'
                            StrXml += '<GroupID>' + OGrdSubSysGroup.rows(i).GroupID + '</GroupID>'
                            StrXml += '<SDate>' + OGrdSubSysGroup.rows(i).cells(3).firstChild.value + '</SDate>'
                            StrXml += '<EDate>' + OGrdSubSysGroup.rows(i).cells(4).firstChild.value + '</EDate>'
                            StrXml += '<Selected>0</Selected>'
                            StrXml += '</GroupMemberShip>'
                            
                        }
                    }
                }
            }
            //***************************UserInfo Tab
            if ($get("txtPass").value != "") {
                if ($get("txtPass").value != $get("txtConfirmPass").value) {
                    //if ($get(MasterObj + "txtPass").value != $get(MasterObj + "txtConfirmPass").value) {
                    alert("کلمه عبور خودرا بررسی نمایید")
                    return;
                }
                if ($get("txtPass").value.length < 6) {
                    alert("طول کلمه عبور نباید کمتر از ۶ حرف باشد!")
                    return;
                }
                StrXml += '<UserInfo>'
                StrXml += '<UserName>' + $get(MasterObj + "lblUserName").innerText + '</UserName>'
                StrXml += '<Pass>' + $get("txtPass").value + '</Pass>'
                StrXml += '</UserInfo>'
            }

            //***************************CardStatus Tab
            var OGrdCardStatus = document.getElementById("GrdCardStatus");
            if (OGrdCardStatus != null) {
                for (var i = 1; i < OGrdCardStatus.rows.length; i++) {
                    StrXml += '<CardStatus>'
                    //alert(OGrdCardStatus.rows(i).getAttribute('ID'))
                    //alert(OGrdCardStatus.rows(i).ID)
                    var ID = ((OGrdCardStatus.rows(i).getAttribute('ID') != undefined & OGrdCardStatus.rows(i).getAttribute('ID') != "") ? OGrdCardStatus.rows(i).getAttribute('ID') : "0")
                    //var ID = ((OGrdCardStatus.rows(i).ID != undefined & OGrdCardStatus.rows(i).ID != "") ? OGrdCardStatus.rows(i).ID : "0")
                    //alert(ID)
                    StrXml += '<ID>' + ID+ '</ID>'
                    //StrXml += '<ID>' + OGrdCardStatus.rows(i).getAttribute('ID') + '</ID>'
                    StrXml += '<CardID>' + OGrdCardStatus.rows(i).getAttribute('CardID') + '</CardID>'
                    StrXml += '<SubSysID>' + OGrdCardStatus.rows(i).getAttribute('SubSysID') + '</SubSysID>'
                    StrXml += '<CardNo>' + OGrdCardStatus.rows(i).cells(1).innerText + '</CardNo>'
                    StrXml += '<Status>' + ((OGrdCardStatus.rows(i).cells(2).all.item(0).checked) ? '1' : '0') + '</Status>'
                    StrXml += '<PerfomingDate>' + OGrdCardStatus.rows(i).cells(3).firstChild.value + '</PerfomingDate>'
                    StrXml += '<ReasonTypeID>' + OGrdCardStatus.rows(i).cells(4).firstChild.value + '</ReasonTypeID>'
                    StrXml += '<Descr>' + OGrdCardStatus.rows(i).cells(5).firstChild.value + '</Descr>'
                    StrXml += '<Selected>' + ((OGrdCardStatus.rows(i).style.backgroundColor == 'pink') ? '0' : '1') + '</Selected>'
                    //StrXml += '<Selected>' + ((OGrdCardStatus.rows(i).cells(0).firstChild.checked) ? '1' : '0') + '</Selected>'
                    StrXml += '</CardStatus>'
                }
            }
            //***************************
            StrXml += "</Root>";
            //alert(StrXml)
            document.getElementById(MasterObj + "txtSaveXml").value = StrXml;
            return SaveFlag;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSaveNew() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" && document.getElementById(MasterObj + "txtLName").value != "") {
                var SaveFlag = MakeXML()
                if (SaveFlag) {
                    $get(MasterObj + "txtSubmit").value = "SaveNew";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("لطفا ابتدا کنترلهاي مورد نظر را پر نماييد");
                if (document.getElementById(MasterObj + "txtLName").value == "") {
                    document.getElementById("LNameTD").innerHTML = "نام خانوادګی :" + "<div style='color: #FF66B3; width: 8px;'>*</div>"
                    document.getElementById(MasterObj + "txtLName").focus();
                }
                if (document.getElementById(MasterObj + "txtPersonCode").value == "") {
                    document.getElementById("PersonCodeTD").innerHTML = "شماره پرسنلې :" + "<div style='color: #FF66B3; width: 8px;'>*</div>"
                    document.getElementById(MasterObj + "txtPersonCode").focus();
                }

            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /**********************************EndToolbar*************************************/

        //**********************************ThisPage*************************************
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        

        function addClassName(obj, className, eventName) {
            //alert(obj.id)
            if (!obj || !className || (obj.className && obj.className.search(new RegExp("\\b" + className + "\\b")) != -1))
                return;
            obj.className += (obj.className ? " " : "") + className;

            if (eventName == "Click" | eventName == "") {
                if (TabId == "")
                    TabId = obj.id
                else {
                    removeClassName(document.getElementById(TabId), 'TabbedPanelsTabSelected');
                    TabId = obj.id;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function removeClassName(obj, className) {
            if (!obj || !className || (obj.className && obj.className.search(new RegExp("\\b" + className + "\\b")) == -1))
                return;
            obj.className = obj.className.replace(new RegExp("\\s*\\b" + className + "\\b", "g"), "");
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetGridStyle(OGrid) {
            for (var i=1;i<OGrid.rows.length;i++)
                if (i%2==1)
                    OGrid.rows(i).className = 'CssItemStyle'
                else
                    OGrid.rows(i).className = 'CssAlternatingItemStyle'    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurCardNo(obj) {
            if (obj.value != "" & obj.value != "0") {
                //if ($get(MasterObj + "txtCardNo").value != obj.value)
                //{
                var SelectedRow = obj.parentElement.parentElement;
                SelectedRow.cells(0).firstChild.disabled = true;
                SelectedRow.cells(3).firstChild.disabled = true;
                SelectedRow.cells(4).firstChild.disabled = true;

                $get(MasterObj + "txtCardNo").value = obj.value + ";" + SelectedRow.getAttribute('SubSysID');
                $get(MasterObj + "txtGrdCardRowIndex").value = SelectedRow.rowIndex;
                $get(MasterObj + "txtSubmit").value = "CheckCardNo";
                document.getElementById(MasterObj + "BtnSubmitCheckCard").click();
                //}   
            }    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnFocusCardNo(obj) {
            var SelectedRow = obj.parentElement.parentElement;
            SelectedRow.cells(0).firstChild.disabled = true;
            SelectedRow.cells(3).firstChild.disabled = true;
            SelectedRow.cells(4).firstChild.disabled = true;
            
            if (SelectedRow.cells(0).firstChild.checked)
                $get(MasterObj + "txtCardNo").value = obj.value
            else
                $get(MasterObj + "txtCardNo").value = "0";    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onBlurTxtPersonCode() {
            if ($get(MasterObj + "txtPersonCode").value != $get(MasterObj + "TDPersonCode").innerText) {
                tabs.setActiveTab(4)
                $get(MasterObj + "lblUserName").innerText = $get(MasterObj + "txtPersonCode").value;
                tabs.setActiveTab(0)
                $get(MasterObj + "txtSubmit").value = "CheckPersonCode";
                
                document.getElementById(MasterObj + "BtnSubmitCheckPersonCode").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ResetGrdCard() {
            var OGrid = document.getElementById("GrdCard");
            
            var len = OGrid.rows.length
            for (var i = 1; i < len; i++) {
                //alert(OGrid.rows(i).cells(0).firstChild.checked)
                OGrid.rows(i).cells(0).firstChild.checked = false;
                OGrid.rows(i).cells(2).firstChild.value = ""
                OGrid.rows(i).cells(3).firstChild.value = 1201;
                OGrid.rows(i).cells(0).firstChild.disabled = false;
                OGrid.rows(i).cells(3).firstChild.disabled = false;
                OGrid.rows(i).cells(4).firstChild.disabled = false;
                OGrid.rows(i).setAttribute('CardID', 0)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ResetGrdExPerson() {
            var OExGrid = document.getElementById("GrdExPerson");
            for (var i = 1; i < OExGrid.rows.length; i++) {
                if (OExGrid.rows(i).cells(1).firstChild.type == 'text')
                    OExGrid.rows(i).cells(1).firstChild.value = "";
                else if (OExGrid.rows(i).cells(1).firstChild.type == 'checkbox')
                    OExGrid.rows(i).cells(1).firstChild.checked = false;

                if (OExGrid.rows(i).getAttribute('TFID2') != "") {
                    if (OExGrid.rows(i).cells(3).firstChild.type == 'text')
                        OExGrid.rows(i).cells(3).firstChild.value = "";
                    else if (OExGrid.rows(i).cells(3).firstChild.type == 'checkbox')
                        OExGrid.rows(i).cells(3).firstChild.checked = false;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ResetGrdSubSysGroup() {
            if (document.getElementById("GrdSubSysGroup") != null) {
                var OGrdSubSysGroup = document.getElementById("GrdSubSysGroup");
                var GridLen = OGrdSubSysGroup.rows.length-1
                for (var i = 1; i < GridLen; i++) {
                        OGrdSubSysGroup.rows(i).cells(0).firstChild.checked = false;
                        OGrdSubSysGroup.rows(i).cells(3).firstChild.value = "";
                        OGrdSubSysGroup.rows(i).cells(4).firstChild.value = "";
                    if (OGrdSubSysGroup.rows(i).getAttribute('GroupID') == OGrdSubSysGroup.rows(i + 1).getAttribute('GroupID')) {
                        var j = i + 1;
                        while (OGrdSubSysGroup.rows(i).getAttribute('GroupID') == OGrdSubSysGroup.rows(j).getAttribute('GroupID')) {
                            OGrdSubSysGroup.deleteRow(i + 1)
                            GridLen--;
                        }    
                    }
                }
                //SetGridStyle(OGrdSubSysGroup)
            }   
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ResetGrdDeptPerson() {
            var ODeptPersonGrid = document.getElementById("GrdDeptPerson");
            for (var i = ODeptPersonGrid.rows.length - 1; i > 1; i--)
                ODeptPersonGrid.deleteRow(i);

            ODeptPersonGrid.rows(1).cells(0).firstChild.value = 0;
            ODeptPersonGrid.rows(1).cells(1).innerText = '';
            ODeptPersonGrid.rows(1).cells(2).innerText = '';
            ODeptPersonGrid.rows(1).cells(3).firstChild.value = 0;
            ODeptPersonGrid.rows(1).cells(4).firstChild.value = '';
            ODeptPersonGrid.rows(1).cells(5).firstChild.value = '';
            ODeptPersonGrid.rows(1).setAttribute('RoleID', 0)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ResetGrdCardStatus() {
            if (document.getElementById("GrdCardStatus") != null) {
                var OGrdCardStatus = document.getElementById("GrdCardStatus");
                if (OGrdCardStatus.rows.length > 0) {
                    for (var i = OGrdCardStatus.rows.length - 1; i > 1; i--)
                        OGrdCardStatus.deleteRow(i);

                    OGrdCardStatus.rows(1).cells(0).innerText = '';
                    OGrdCardStatus.rows(1).cells(1).innerText = '';
                    OGrdCardStatus.rows(1).cells(3).firstChild.value = '';
                    OGrdCardStatus.rows(1).cells(4).firstChild.value = '0';
                    OGrdCardStatus.rows(1).cells(5).firstChild.value = '';

                    OGrdCardStatus.rows(1).cells(2).all.item(0).disabled = false;
                    OGrdCardStatus.rows(1).cells(2).all.item(2).disabled = false;
                    OGrdCardStatus.rows(1).cells(3).firstChild.disabled = false;
                    OGrdCardStatus.rows(1).cells(4).firstChild.disabled = false;
                    OGrdCardStatus.rows(1).cells(5).firstChild.disabled = false;
                    OGrdCardStatus.rows(1).cells(6).firstChild.disabled = false;
                    OGrdCardStatus.rows(1).cells(7).firstChild.disabled = false;

                    OGrdCardStatus.rows(1).setAttribute('CardID', 0)
                    OGrdCardStatus.rows(1).setAttribute('ID', 0)
                    OGrdCardStatus.rows(1).setAttribute('ID', 0)
                    OGrdCardStatus.rows(1).setAttribute('SubSysID', 0)
                }     
            }            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDelRowDeptPerson(obj) {
            var SelRow = obj.parentElement.parentElement;
            var DelFlag;

            if (SelRow.getAttribute('RoleID') != 0) {
                if (SelRow.style.backgroundColor == '') {
                    SelRow.style.backgroundColor = 'pink';
                    DelFlag = true
                }
                else {
                    SelRow.style.backgroundColor = '';
                    DelFlag = false;
                }

                SelRow.cells(0).all.item(0).disabled = DelFlag;
                SelRow.cells(0).all.item(1).disabled = DelFlag;
                SelRow.cells(3).firstChild.disabled = DelFlag;
                SelRow.cells(4).firstChild.disabled = DelFlag;
                SelRow.cells(5).firstChild.disabled = DelFlag;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickSelected(obj) {
            SelectedRow = obj.parentElement.parentElement;
            if (!obj.checked) {
                SelectedRow.cells[1].firstChild.disabled = true;
                SelectedRow.cells[4].firstChild.disabled = true;
                SelectedRow.cells[5].firstChild.disabled = true;
                SelectedRow.cells[6].firstChild.disabled = true;
            }
            else {
                SelectedRow.cells[1].firstChild.disabled = false;
                SelectedRow.cells[4].firstChild.disabled = false;
                SelectedRow.cells[5].firstChild.disabled = false;
                SelectedRow.cells[6].firstChild.disabled = false;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeDepartmentID(obj) {
            SelectedRow = obj.parentElement.parentElement;
            DeptPersonGridRowIndex = SelectedRow.rowIndex;

            if (SelectedRow.getAttribute('RoleID') != 0) {
                SelectedRow.style.backgroundColor = 'pink';
                SelectedRow.cells(0).all.item(0).value = 0;
                SelectedRow.cells(0).all.item(1).disabled = true;
                SelectedRow.cells(1).innerText = '';
                SelectedRow.cells(2).innerText = '';
                SelectedRow.cells(3).firstChild.value = 0
                SelectedRow.cells(4).firstChild.value = '';
                SelectedRow.cells(5).firstChild.value = '';
            }
            else {
                $get(MasterObj + "txtDeptValue").value = SelectedRow.cells(0).all.item(0).value
                document.getElementById(MasterObj + "BtnSubmitDept").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChkCard(obj) {
            var OGrdCard = document.getElementById("GrdCard");
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            OGrdCard.rows(RowIndex).cells(4).firstChild.disabled = !obj.checked;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CheckRepeatCardNO(CardNo) {
            var OGrdCard = document.getElementById("GrdCard");
            var Flag = true;
            for (var i = 1; i < OGrdCard.rows.length; i++) {
                if (OGrdCard.rows(i).getAttribute('CardID') == 0
                    & OGrdCard.rows(i).cells(0).firstChild.checked
                        & i != parseInt($get(MasterObj + "txtGrdCardRowIndex").value)) {
                    if (OGrdCard.rows(i).cells(2).firstChild.value == CardNo) {
                        Flag = false;
                        i = OGrdCard.rows.length;
                    }
                }
            }
            return Flag    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CanAddToGrdCardStatus(CardNo,SubSysID) {
            var Flag = true;
            var OGrdCardStatus = document.getElementById("GrdCardStatus");
            
            for (var i = 1; i < OGrdCardStatus.rows.length; i++)
                if (OGrdCardStatus.rows(i).cells(1).innerText == CardNo &
                        OGrdCardStatus.rows(i).SubSysID == SubSysID) {
                Flag = false;
                i = OGrdCardStatus.rows.length;
            }
            /*var OGrdCard = document.getElementById("GrdCard");
            for (var i = 1; i < OGrdCard.rows.length; i++)
                if (OGrdCard.rows(i).cells(1).innerText == CardNo) {
                    Flag = false;
                    i = OGrdCard.rows.length;
                }*/
                
            return Flag;          
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRowToGrdCardStatus() {
            var OGrdCard = document.getElementById("GrdCard");
            var RowIndex = parseInt(document.getElementById(MasterObj + "txtGrdCardRowIndex").value);
            var OGrdCardStatus = document.getElementById("GrdCardStatus");
            var GridLen = OGrdCardStatus.rows.length - 1;
            var SubSysID = OGrdCard.rows(RowIndex).getAttribute('SubSysID');
            
            tabs.setActiveTab(6)
            
            if (OGrdCardStatus.rows(GridLen).getAttribute('SubSysID') == 0) {
                //alert("aaa")
                OGrdCardStatus.rows(GridLen).setAttribute('SubSysID', SubSysID)
                OGrdCardStatus.rows(GridLen).setAttribute('ID', 0)
                OGrdCardStatus.rows(GridLen).setAttribute('CardID', 0)

                OGrdCardStatus.rows(GridLen).cells(0).innerText = OGrdCard.rows(RowIndex).cells(1).innerText;
                OGrdCardStatus.rows(GridLen).cells(1).innerText = OGrdCard.rows(RowIndex).cells(2).firstChild.value;
                var StrTemp = $get(MasterObj + "SDate").value
                OGrdCardStatus.rows(GridLen).cells(3).firstChild.value = StrTemp.substr(8, 2) + '/' + StrTemp.substr(5, 2) + '/' + StrTemp.substr(0, 4);
            }
            else {
                //alert("bbb")
                var oRow = OGrdCardStatus.insertRow();
                oRow.setAttribute('SubSysID', SubSysID)
                oRow.setAttribute('ID', 0)
                oRow.setAttribute('CardID', 0)

                var oCell0 = oRow.insertCell();
                oCell0.innerText = OGrdCard.rows(RowIndex).cells(1).innerText;

                var oCell1 = oRow.insertCell();
                oCell1.innerText = OGrdCard.rows(RowIndex).cells(2).firstChild.value;

                var oCell2 = oRow.insertCell();
                var StrHTML = "<INPUT id='Rbtn1' onclick='OnClickRbtn()' type='radio' ><LABEL>فعال</LABEL><INPUT id='Rbtn2' onclick='OnClickRbtn()'; type='radio'><LABEL >غير فعال</LABEL>";
                oCell2.innerHTML = StrHTML; //SelRow.cells(3).innerHTML;
                oCell2.all.item(0).disabled = false;
                oCell2.all.item(2).disabled = false;
                oCell2.all.item(0).checked = true;

                var oCell3 = oRow.insertCell();
                oCell3.innerHTML = OGrdCardStatus.rows(GridLen).cells(3).innerHTML;
                oCell3.firstChild.disabled = false;
                var StrTemp = $get(MasterObj + "SDate").value
                oCell3.firstChild.value = StrTemp.substr(8, 2) + '/' + StrTemp.substr(5, 2) + '/' + StrTemp.substr(0, 4);

                var oCell4 = oRow.insertCell();
                oCell4.innerHTML = OGrdCardStatus.rows(GridLen).cells(4).innerHTML
                oCell4.firstChild.value = "0";
                oCell4.firstChild.disabled = false;

                var oCell5 = oRow.insertCell();
                oCell5.innerHTML = OGrdCardStatus.rows(GridLen).cells(5).innerHTML
                oCell5.firstChild.value = "";
                oCell5.firstChild.disabled = false;

                var oCell6 = oRow.insertCell();
                oCell6.innerHTML = OGrdCardStatus.rows(GridLen).cells(6).innerHTML
                oCell6.firstChild.disabled = false;

                var oCell7 = oRow.insertCell();
                oCell7.innerHTML = OGrdCardStatus.rows(GridLen).cells(7).innerHTML
            }
            //alert(OGrdCardStatus.rows(GridLen).cells(0).innerText)
            SetGridStyle(OGrdCardStatus)
            tabs.setActiveTab(6)
            tabs.setActiveTab(6)
            tabs.setActiveTab(2)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNewRowCard(obj) {
            var OGrdCard = document.getElementById("GrdCard");
            var RowIndex = obj.parentElement.parentElement.rowIndex;

            if (OGrdCard.rows(RowIndex).cells(2).firstChild.value == "0") {
                alert("اطلاعات کامل نیست")
                return;
            }

            var oRow = OGrdCard.insertRow();
            var SubSysID = OGrdCard.rows(RowIndex).getAttribute('SubSysID');
            oRow.setAttribute('SubSysID', SubSysID);
            oRow.setAttribute('CardID', 0);

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = OGrdCard.rows(RowIndex).cells(0).innerHTML
            oCell0.firstChild.checked = false;

            var oCell1 = oRow.insertCell();
            oCell1.innerText = OGrdCard.rows(RowIndex).cells(1).innerText;

            var oCell2 = oRow.insertCell();
            oCell2.innerHTML = OGrdCard.rows(RowIndex).cells(2).innerHTML
            oCell2.firstChild.value = "0";

            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = OGrdCard.rows(RowIndex).cells(3).innerHTML
            oCell3.firstChild.value = "1201";

            var oCell4 = oRow.insertCell();
            oCell4.innerHTML = OGrdCard.rows(RowIndex).cells(4).innerHTML
            oCell4.firstChild.disabled = true;
            //========================================================
            if (oRow.rowIndex % 2 == 1)
                oRow.className = "CssItemStyle";
            else
                oRow.className = "CssAlternatingItemStyle";    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNewRow(obj) {
            var ODeptPersonGrid = document.getElementById("GrdDeptPerson");
            var GridLen = ODeptPersonGrid.rows.length - 1;
            var RowIndex = obj.parentElement.parentElement.rowIndex;


            if (ODeptPersonGrid.rows(RowIndex).cells(0).firstChild.value == "0" ||
                ODeptPersonGrid.rows(RowIndex).cells(3).firstChild.value == "0" ||
                ODeptPersonGrid.rows(RowIndex).cells(4).firstChild.value == "" ||
                ODeptPersonGrid.rows(RowIndex).cells(5).firstChild.value == ""
                ) {
                alert("اطلاعات کامل نیست")
                return;
            }

            var oRow = ODeptPersonGrid.insertRow();
            oRow.setAttribute('DepartmentID', 0);
            oRow.setAttribute('RoleID', 0);
            //oRow.attachEvent('onclick', OnClickGrdDeptPerson);

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = ODeptPersonGrid.rows(GridLen).cells(0).innerHTML
            oCell0.firstChild.value = "0";

            var oCell1 = oRow.insertCell();
            oCell1.InnerText = "";

            var oCell2 = oRow.insertCell();
            oCell2.InnerText = "";

            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = ODeptPersonGrid.rows(GridLen).cells(3).innerHTML
            oCell3.firstChild.value = "0";

            var oCell4 = oRow.insertCell();
            oCell4.innerHTML = ODeptPersonGrid.rows(GridLen).cells(4).innerHTML
            oCell4.firstChild.value = "";

            var oCell5 = oRow.insertCell();
            oCell5.innerHTML = ODeptPersonGrid.rows(GridLen).cells(5).innerHTML
            oCell5.firstChild.value = "";

            var oCell6 = oRow.insertCell();
            oCell6.innerHTML = ODeptPersonGrid.rows(GridLen).cells(6).innerHTML

            var oCell7 = oRow.insertCell();
            oCell7.innerHTML = ODeptPersonGrid.rows(GridLen).cells(7).innerHTML

            ODeptPersonGrid.rows(GridLen).cells(7).firstChild.disabled = true;
            //oRow.attachEvent('onclick', OnClickGrdDeptPerson);
            if (oRow.rowIndex % 2 == 1)
                oRow.className = "CssItemStyle";
            else
                oRow.className = "CssAlternatingItemStyle";    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNewRowCardStatus(obj) {
            var OCardStatusGrid = document.getElementById("GrdCardStatus");
            var SelRow = obj.parentElement.parentElement;
            var CardID = SelRow.getAttribute('CardID');

            var oRow = OCardStatusGrid.insertRow();
            oRow.setAttribute('SubSysID', SelRow.getAttribute('SubSysID'));
            oRow.setAttribute('ID', 0);
            oRow.setAttribute('CardID', CardID);

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = SelRow.cells(0).innerHTML

            var oCell1 = oRow.insertCell();
            oCell1.innerHTML = SelRow.cells(1).innerHTML;

            //alert(SelRow.cells(2).innerHTML)
            var oCell2 = oRow.insertCell();
            var StrHTML = "<INPUT id='Rbtn1' onclick='OnClickRbtn()' type='radio' ><LABEL>فعال</LABEL><INPUT id='Rbtn2' onclick='OnClickRbtn()'; type='radio'><LABEL >غير فعال</LABEL>";
            oCell2.innerHTML = StrHTML; //SelRow.cells(3).innerHTML;
            oCell2.all.item(0).disabled = false;
            oCell2.all.item(2).disabled = false;
            if (SelRow.cells(2).all.item(0).checked) {
                oCell2.all.item(0).checked = true
            }
            else {
                oCell2.all.item(0).checked = true
            }

            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = SelRow.cells(3).innerHTML;
            oCell3.firstChild.disabled = false;
            var StrTemp = $get(MasterObj + "SDate").value
            oCell3.firstChild.value = StrTemp.substr(8, 2) + '/' + StrTemp.substr(5, 2) + '/' + StrTemp.substr(0, 4);

            var oCell4 = oRow.insertCell();
            oCell4.innerHTML = SelRow.cells(4).innerHTML
            oCell4.firstChild.value = "0";
            oCell4.firstChild.disabled = false;

            var oCell5 = oRow.insertCell();
            oCell5.innerHTML = SelRow.cells(5).innerHTML
            oCell5.firstChild.value = "";
            oCell5.firstChild.disabled = false;

            var oCell6 = oRow.insertCell();
            oCell6.innerHTML = SelRow.cells(6).innerHTML
            oCell6.firstChild.disabled = false;

            var oCell7 = oRow.insertCell();
            oCell7.innerHTML = SelRow.cells(7).innerHTML

            if (oRow.rowIndex % 2 == 1)
                oRow.className = "CssItemStyle";
            else
                oRow.className = "CssAlternatingItemStyle";    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDelRowCardStatus(obj) {
            var OCardStatusGrid = document.getElementById("GrdCardStatus");
            var SelRow = obj.parentElement.parentElement;
            var DelFlag;
            if (SelRow.style.backgroundColor == '') {
                SelRow.style.backgroundColor = 'pink';
                DelFlag = true
            }
            else {
                SelRow.style.backgroundColor = '';
                DelFlag = false;
            }

            SelRow.cells(2).all.item(0).disabled = DelFlag;
            SelRow.cells(2).all.item(2).disabled = DelFlag;
            SelRow.cells(3).firstChild.disabled = DelFlag;
            SelRow.cells(4).firstChild.disabled = DelFlag;
            SelRow.cells(5).firstChild.disabled = DelFlag;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickRbtn() {
            //alert('gggg')
            var ORBtn = window.event.srcElement;
            var OCell = ORBtn.parentElement;

            if (ORBtn.id == "Rbtn1") {
                OCell.all.item(0).checked = true
                OCell.all.item(2).checked = false
            }
            else if (ORBtn.id == "Rbtn2") {
                OCell.all.item(0).checked = false
                OCell.all.item(2).checked = true
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdDeptPerson(SelectedRow) {
            //if (SelectedRow.tagName == undefined)
            //alert(window.srcElement)//.tagName)
            //alert(window.parentElement.parentElement.tagName)
            if (LastSelectedRow != "")
                SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.style.backgroundColor = "#FF66B3";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickDepartmentShow(obj) {
            var SelectedRow = obj.parentElement.parentElement;

            var url = "../OrganizationChart/SelectDepartment.aspx?ShowFlag=1"
            var StrFeatur = "dialogHeight: 700px;dialogWidth: 700px;center: Yes;help: no;status: no"
            var returnValue = window.showModalDialog(url, window, StrFeatur)

            if (returnValue != undefined) {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

                if (oXmlNodes.length != 0) {
                    SelectedRow.cells(0).all.item(0).value = oXmlNodes.item(0).selectSingleNode('DepartmentID').text;
                    OnChangeDepartmentID(SelectedRow.cells(0).all.item(0))
                }
            }    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function dd(obj) {
            obj.lang = "fa"
        }
        /*
        onkeypress="keyenter(this,event)"
        
        <div 
        id="KeybordType"
        style="border: 1px outset #FF0000; color: #FF0000; cursor:hand; width: 22px;" 
        onclick="onClickKeybordType()"></div>
        */
        function keyenter(field, e) {

            var key;
            if (window.event)
                key = window.event.keyCode;
           // alert(key)
            //alert(String.fromCharCode(67))
            if (key > 31)
                if (key < 128) {
                if (window.event) {
                    if (document.getElementById("KeybordType").innerHTML == "Fa")
                        window.event.keyCode = ' !"#$%،گ)(×+و-./0123456789:ك,=.؟@ِذ}ىُيلا÷ـ،/’د×؛َءٍف‘{ًْإ~جژچ^_پشذزيثبلاهتنمئدخحضقسفعرصطغظ<|>ّ'.charCodeAt(key - 32);

                }

            }

            if (key > 1000)
                if (window.event) {
                if (document.getElementById("KeybordType").innerHTML == "En")
                    window.event.keyCode = 'abcdefghijklmnopqrstuvwxyz\\,[];\''.charCodeAt(key);
            }
            //alert(window.event.keyCode)
            // else 

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickKeybordType() {
            if (document.getElementById("KeybordType").innerHTML == "Fa")
                document.getElementById("KeybordType").innerHTML = "En"
            else if (document.getElementById("KeybordType").innerHTML == "En")
                document.getElementById("KeybordType").innerHTML = "Fa"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetSecret(Obj) {
            //alert(Obj.value)
            //alert(PassStr)
            PassStr += Obj.value.replace("*", "")
            var txtstr = "";

            for (var i = 0; i < Obj.value.length; i++) {
                txtstr += "*";
            }
            //alert(txtstr)
            Obj.value = txtstr;
        }
        //-----------------------------------------------------------------------
        
        //**********************************EndThisPage*************************************

    </script>

<script language="vbscript">
		'#ccaecc
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد"
			strQuestion=MsgBox(strQuestion, 0, "تاريخ شمسي اشتباه ")
			window.event.srcElement.focus()
			window.event.returnvalue=false
			else
			if val<>"" then
				dim arr
				arr=split(val,"/",-1,0)
				if arr(2)<100  then  
					century="13"
				else	  
					century=""
				end if
				val=right("0" & arr(1),2) & "/" & century & arr(2)
				val=right("0" & arr(0),2) & "/" & val  
				window.event.srcElement.value=val
			end if
			end if
		end function
		'********************
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
		      
			ybase_sh=int((sal-125)/ 99)*99+125
		      
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function

		'********************************************
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		  
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(0))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(2))
		        
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
		        
			if isshleap(sal)then 
				le=1 
			end if 
		        
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		end function
		'****************************

		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function InttoSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

				select case roz
					case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
					case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
					case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
			
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if

					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
		          
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if

					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if

					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select

			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if

			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if

			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
		       
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDtoInt(shd)
		dim  sal,mah,roz,Tr,arr
		      
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(0)) 
			mah=cint(arr(1))-1
			roz=cint(arr(2))-1
			Tr=0
		      
			if sal <100 then sal=1300+sal end if
			sal=sal-1314

			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
		      

			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
		      
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if

			SHDtoInt=Tr+roz
		else
			alert("اشكال در تاريخ شمسي")
			SHDtoInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
		</script>
</asp:Content>
