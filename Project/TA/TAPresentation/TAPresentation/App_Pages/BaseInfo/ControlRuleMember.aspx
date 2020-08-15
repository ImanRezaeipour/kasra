<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" CodeBehind="ControlRuleMember.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ControlRuleMember" ValidateRequest="false" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
         Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
         function BeginRequestHandler(sender, args) {
             document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
             $get(MasterObj + "txtAlert").value = "";
         }

         function EndRequestHandler(sender, args) {
             document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
             var StrVal = $get(MasterObj + "txtSubmit").value
             if (StrVal != "") {
                 if (StrVal == "Save") {
                     SetMsg(document.getElementById(MasterObj + "txtAlert").value)
                     CreateGrid("First")
                     $get(MasterObj + "txtSubmit").value = "";
                     $get(MasterObj + "txtAlert").value = "";
                 }
                 else if (StrVal == "CheckControlRuleMember") {
                     CreateGrid("First")
                     if (document.getElementById(MasterObj + "txtAlert").value != '') {
                         alert("واحدهاي سازماني ذيل داراي مشکل مي باشند" + String.fromCharCode(13) + document.getElementById(MasterObj + "txtAlert").value)

                         if (confirm("آيا از ذخيره مطمئنيد؟")) {

                             $get(MasterObj + "txtAlert").value = "";
                             $get(MasterObj + 'txtSubmit').value = 'Save';
                             document.getElementById(MasterObj + "BtnSubmit").click();
                         }
                     }
                     else {
                         $get(MasterObj + "txtAlert").value = "";
                         $get(MasterObj + 'txtSubmit').value = 'Save';
                         document.getElementById(MasterObj + "BtnSubmit").click();
                     }    
                 }
              }   
             
         }
                </script>      
    <table style="width: 77%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr>
                        <td style="width: 25px" >
                                <input id="ChkDepartment" 
                    style="background-color: transparent" checked="true" type="radio" 
                                    name="GroupChk" value="1" ></td>
            <td style="width: 169px" >واحد سازماني </td>
                <td style="width: 29px">
            <input id="ChkPersonelGroup" style="background-color: transparent"  
                type="radio" 
                name="GroupChk" value="2"></td>
            <td style="width: 127px" >
                گروه                         </td>
        <td style="width: 30px" >
                            <input id="ChkPersonel" type="radio" style="background-color: transparent" 
                                value="ChkPersonel" name="GroupChk"></td>
                        <td>
                            پرسنل
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
             <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <fieldset dir="rtl" style="width: 100%; height: 100%; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: lightblue">اعضا</legend>
                                           <table id="XTabTable_Header" style="width: 299px; height: 11px;" cellpadding="0" align="center"
                                    cellspacing="0">
                                    <thead style="display: inline">
                                        <tr class="ShoperHeaderStyle">
                                            <td class="CssHeaderStyle" style="width: 3px" align="center">
                                                <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" name="chkAll">
                                            </td>
                                            <td class="CssHeaderStyle" align="center">
                                                نام
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 304px;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 434px" align="center">
                                    <table id="XTabTable" align="center">
                                        <thead style="display: none">
                                        </thead>
                                    </table>
                                </div>
                        </fieldset>  
                        <div style="display:none">                      
                        <asp:HiddenField ID="txtSaveXml" runat="server" />
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
                         <input type="text" id="txtXmlMember" name="txtXmlMember" runat="server" />
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
             <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                <input type="text" id="SDate" name="SDate" runat="server" />
                <input type="text" id="EDate" name="EDate" runat="server" />
                <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                <input type="text" id="ControlRuleID" name="ControlRuleID" runat="server" />
                <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection" runat="server" />
                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server" />
                <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                <input type="text" id="txtSubsysID" runat="server" />
                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
             </div>
                 
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>             
    <script language="javascript" type="text/javascript">
        window.name = "ControlRuleMember"
        aspnetForm.target = window.name
        //*************************************Declaration*************************************
        var LastSelectedRow = null
        var LastSelectedRowClass = "";
        var PageSize = 15;
        var currentPage_X = 0
        var TempGrdPersonCode = "";
        var TempPersonCode = "";
        var OSelectedMamber = ""
        //*************************************EndDeclaration*************************************
        
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

        CreateGrid();    
            
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) < parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                CreateGrid('Next')
        }
        //*******************************************************************************
        function OnClickBtnPrv() {
            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) > 1)
                CreateGrid('Previous')
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
                CreateGrid('Const')
            }
        }
        //*******************************************************************************
        function OnClickBtnLast() {
            CreateGrid('Last')
        }
        //*******************************************************************************
        function OnClickBtnFirst() {
            CreateGrid('First')
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //*******************************************************************************
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            
            if ($get(MasterObj + 'txtXmlMember').value != '' &
                $get(MasterObj + 'txtXmlMember').value != '<BaseInfoEntity />') {
                var CheckFlag = CheckValidData()
                if (CheckFlag == 3) {
                    alert('هيج گزينه اي جهت ذخيره اطلاعات انتخاب نشده')
                    return
                }
                else if (CheckFlag == 2)
                    $get(MasterObj + 'txtSubmit').value = 'CheckControlRuleMember'
                else
                    $get(MasterObj + 'txtSubmit').value = 'Save';    
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else
                alert('لطفا ابتدا اعضا را انتخاب نماييد')
        }
        //*******************************************************************************
        function OnClickBtnFilter() {
            LastSelectedRow = "";
            var str = ""
            str += "<Root><Tb>"
            str += "<ControlRuleType>" + $get(MasterObj + "cmbControlRuleType").value + "</ControlRuleType>"
            str += "<ControlRuleName>" + $get(MasterObj + "txtControlRuleName").value + "</ControlRuleName>"
            str += "<Operator>" + $get(MasterObj + "cmbOperator").value + "</Operator>"
            str += "<BaseCode>" + (($get(MasterObj + "cmbBaseCode").value == "0") ? '' : $get(MasterObj + "cmbBaseCode").value) + "</BaseCode>"
            str += "<DetailCode>" + (($get(MasterObj + "cmbDetailCode").value == "0") ? '' : $get(MasterObj + "cmbDetailCode").value) + "</DetailCode>"
            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            //=============================================
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnShowAll() {
            $get(MasterObj + "cmbControlRuleType").value = "0";
            $get(MasterObj + "txtControlRuleName").value = "";
            $get(MasterObj + "cmbOperator").value = "0";
            $get(MasterObj + "cmbBaseCode").value = "0";
            $get(MasterObj + "cmbDetailCode").value = "0";
            document.getElementById(MasterObj + "txtSearch").value = "<Root><Tb></Tb></Root>"

            //=============================================
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnCancel() {
            window.returnValue = '';
            window.close();
        }
        //*******************************************************************************
        function ClearRowGrid() {
            var oGrid = XTabTable
            for (var i = oGrid.rows.length - 1; i >= 0; i--) {
                oGrid.deleteRow(i);
            }
        }
        //*******************************************************************************
        function CreateGrid(direction) {
            ClearRowGrid()
            if ($get(MasterObj + 'txtXmlMember').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlMember').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/ControlRuleMember')
                $get(MasterObj + 'lblTotal').value = xmlNodes.length;
                //================================Paging
                var totalRecords
                totalRecords = xmlNodes.length
                $get(MasterObj + 'Totalpage').value = Math.ceil(totalRecords / PageSize)

                if (totalRecords > 0) {
                    currentPage_X = parseInt((($get(MasterObj + 'txtCurPage').value == "") ? "1" : $get(MasterObj + 'txtCurPage').value))
                    //currentPage_X = parseInt((($get(MasterObj + 'txtCurPage').value == "" | $get(MasterObj + 'txtCurPage').value == "0") ? "1" : $get(MasterObj + 'txtCurPage').value))
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
                            currentPage_X = parseInt($get(MasterObj + 'Totalpage').value)
                            break
                    }
                    var endFor
                    if (currentPage_X * PageSize - 1 < 0)
                        return
                    if (totalRecords <= currentPage_X * PageSize - 1)
                        endFor = totalRecords - 1
                    else
                        endFor = parseInt(currentPage_X) * PageSize - 1
                    //====================================================
                    $get(MasterObj + 'txtCurPage').value = currentPage_X
                    $get(MasterObj + "lblFrom").value = ((currentPage_X - 1) * PageSize) + 1;
                    $get(MasterObj + "lblTo").value = endFor + 1;
                    //====================================================

                    var i = (currentPage_X - 1) * PageSize
                    for (; i <= endFor; i++) {
                        var Param = '' + xmlNodes.item(i).selectSingleNode('Selected').text + ',' +xmlNodes.item(i).selectSingleNode('MemberName').text + ',' ;
                        AddToGrid('ControlRuleMemberID', xmlNodes.item(i).selectSingleNode('ControlRuleMemberID').text, 'MemberID', xmlNodes.item(i).selectSingleNode('MemberID').text, 'MemberType', xmlNodes.item(i).selectSingleNode('MemberType').text, Param)
                    }
                }
                else {
                    //====================================================
                    $get(MasterObj + 'txtCurPage').value = "0";
                    $get(MasterObj + "lblFrom").value = "0";
                    $get(MasterObj + "lblTo").value = "0";
                    $get(MasterObj + 'Totalpage').value = "0";
                    $get(MasterObj + 'lblTotal').value = "0";
                    //====================================================
                }
            }
            SetPagingInfo();
        }
        //*******************************************************************************
        function AddToGrid(AttrName1, AttrValue1, AttrName2, AttrValue2, AttrName3, AttrValue3, Param) {
            var oGrid = XTabTable;
            var oRow = oGrid.insertRow();
            oRow.setAttribute(AttrName1, AttrValue1) //ControlRuleMemberID
            oRow.setAttribute(AttrName2, AttrValue2) //MemberID
            oRow.setAttribute(AttrName3, AttrValue3) //MemberType

            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";

            var x = 0;
            var p = new String;
            var val = "";

            while (x < getCntChar(',', Param)) {
                val = getArray(Param, x, ',')
                
                switch (x)
                {
                    case 0:
                        var oCell0 = oRow.insertCell(); //PersonCode
                        oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)' "+((val==1)? " checked >":">");
                        oCell0.className = "XTabTable";
                        oCell0.style.width = "25px"  //"92px"
                        oCell0.align = "center"
                        break

                    case 1:
                        var tempSrc = "";
                        var picTitle = "";
                        switch (AttrValue3) {
                            case "P":
                                tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                                picTitle = 'پرسنل'
                                break
                            case "G":
                                tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                                picTitle = "'گروه'"
                                break
                            case "S":
                                tempSrc = "../../App_Utility/Images/Icons/time.gif"
                                picTitle = "'شيفت'"
                                break
                            case "DS":
                                tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                                picTitle = "'واحدسازماني مستقيم'"
                                break
                            case "DA":
                                tempSrc = "../../App_Utility/Images/Icons/Group.gif"
                                picTitle = "'واحدسازماني با زيرمجموعه'" 
                                break
                        }
                        var oCell1 = oRow.insertCell(); //Name
                        oCell1.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
                        oCell1.className = "XTabTable";
                        oCell1.style.width = "40px"  //"150px"
                        oCell1.align = "right"

                        var oCell2 = oRow.insertCell(); //StartDate
                        oCell2.innerText = ((val.length > 30) ? val.substring(0, 30) + "..." : val);
                        oCell2.title = val;
                        oCell2.style.width = "300px"   //"85px"
                        oCell2.align = "center";

                        break
                }
                
                x = x + 1;
            }

        }
        //*******************************************************************************
        function SetPagingInfo() {
            document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
            document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
            document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
            document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
            document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

            if (document.getElementById("OToolBar_txtCurPage").value=="" | document.getElementById("OToolBar_txtCurPage").value=="0")
                 document.getElementById('OToolBar_BtnPrv').disabled = true
            else
                 document.getElementById('OToolBar_BtnPrv').disabled = false;     

            if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                document.getElementById('OToolBar_BtnNext').disabled = true
            else
                document.getElementById('OToolBar_BtnNext').disabled = false;
        }
        //*******************************************************************************
        function OnClickChk(obj) {
            var SelectedRow = obj.parentElement.parentElement;
            //================================================
            if ($get(MasterObj + 'txtSaveXml').value != '') {
                var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlSaveDoc.async = "false";
                oXmlSaveDoc.loadXML($get(MasterObj + 'txtSaveXml').value)
            }
            else
                var oXmlDoc = null;
            //================================================
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXmlMember').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/ControlRuleMember [MemberID=' + SelectedRow.MemberID + ' and MemberType="' + SelectedRow.MemberType + '"]');

            if (xmlNodes.length != 0) {
                var Selected = ((obj.checked) ? 1 : 0);
                xmlNodes.item(0).selectSingleNode('Selected').text = Selected;
                $get(MasterObj + 'txtXmlMember').value = oXmlDoc.xml;

                MakeSaveXML(oXmlSaveDoc, SelectedRow.MemberID, SelectedRow.MemberType, Selected)
            }
        }
        //*******************************************************************************
        function OnClickBtnShowGroupPerson() {
            var strOptions = ""
            var url
            
            if (document.getElementById("ChkPersonelGroup").checked) {
                OUserFlag = "G"
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?CategoryID=0&Type=Check&WDFlag=1&ParentPage=ControlRuleMember &SubsysID=" + $get(MasterObj + 'txtSubsysID').value
                strOptions = "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no"
            }
            /*else if (document.getElementById("ChkDepartmentA").checked == true) {
                OUserFlag = "DA"
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
                strOptions = "dialogHeight: 650px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkDepartmentS").checked == true) {
                OUserFlag = "DS"
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
                strOptions = "dialogHeight: 650px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }*/
            else if (document.getElementById("ChkDepartment").checked) {
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0"
                strOptions = "dialogHeight: 650px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById("ChkPersonel").checked) {
                OUserFlag = "P"
                var RequsterAction = window.event.srcElement.id

                if (RequsterAction.indexOf('OToolBar_') != -1) {
                    RequsterAction = RequsterAction.replace('OToolBar_', '')
                }
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?ShowFlag=0" + " &RequsterPageID=1316" + " &RequsterAction=" + RequsterAction;
                strOptions = "dialogHeight: 720px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else {
                alert('لطفا نوع عضويت را انتخاب کنيد')
                return
            }

            //------------------------------------------------------------
            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                //alert(OSelectedMamber)
                if (OSelectedMamber != undefined & OSelectedMamber != '' & OSelectedMamber != "<Root></Root>")
                    if (document.getElementById("ChkDepartment").checked) {
                        OUserFlag = OSelectedMamber.split("#")[0];
                        OSelectedMamber = OSelectedMamber.split("#")[1];
                    } 
                url = ""
            }

           if (OSelectedMamber != undefined && OSelectedMamber != '' && OSelectedMamber != "<Root></Root>") {

               if (document.getElementById("XTabTable").rows.length > 0)
                   if (confirm('پرسنل انتخاب شده جايگزين پرسنل قبلي گردند؟')) {
                       $get(MasterObj + "txtXmlMember").value = "";
                       $get(MasterObj + "txtSaveXml").value = "";
                    }
                //===============
                ModifyXML(OUserFlag)
                //===============
                if (OSelectedMamber != "") {
                    //OValidUserXml = OSelectedMamber
                    CreateGrid("First");
                }
            }
        }
        //*******************************************************************************
        function ModifyXML(Type) {
            // واحد سازمانی با زیر مجموعه :DA , واحد سازمانی بدون زیر مجموعه :DS گروه:G  پرسنل:P

            //================================================
            if ($get(MasterObj + 'txtSaveXml').value != '') {
                var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlSaveDoc.async = "false";
                oXmlSaveDoc.loadXML($get(MasterObj + 'txtSaveXml').value)
            }
            else
                var oXmlDoc = null;   
            //================================================
            var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDocTemp.async = "false";
            oXmlDocTemp.loadXML(OSelectedMamber)
            var xmlNodesTemp = oXmlDocTemp.documentElement.selectNodes('/Root/Tb [Selected=1]')
            
            if ($get(MasterObj + 'txtXmlMember').value != "" & $get(MasterObj + 'txtXmlMember').value !="<BaseInfoEntity />") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlMember').value)

                for (var i = 0; i < xmlNodesTemp.length; i++) {
                    var MemberID, MemberName, CID;
                    switch (Type) {
                        case 'P':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('PersonID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('PersonName').text;
                            break

                        case 'G':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                            CID = xmlNodesTemp.item(i).selectSingleNode('CID').text;
                            break

                        case 'DA':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DepartmentID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('Name').text;
                            break

                        case 'DS':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DepartmentID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('Name').text;
                            break
                    }

                    var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/ControlRuleMember[MemberType="' + Type + '" and MemberID=' + MemberID + ']');
                    if (xmlNodes.length == 0) {
                        StrXml += "<ControlRuleMember>";
                        StrXml += "<Selected>1</Selected>";
                        StrXml += "<ControlRuleMemberID>0</ControlRuleMemberID>";
                        StrXml += "<ControlRuleID>" + $get(MasterObj + "ControlRuleID").value + "</ControlRuleID>"
                        StrXml += "<MemberID>" + MemberID + "</MemberID>";
                        StrXml += "<MemberName>" + MemberName + "</MemberName>";
                        StrXml += "<MemberType>" + Type + "</MemberType>";
                        StrXml += "</ControlRuleMember>";
                    }
                    else {
                        if (xmlNodes.item(0).selectSingleNode('Selected').text == '0') {
                            xmlNodes.item(0).selectSingleNode('Selected').text = '1'
                            $get(MasterObj + 'txtXmlMember').value = oXmlDoc.xml;
                        }
                    }

                    MakeSaveXML(oXmlSaveDoc, MemberID, Type, 1)
                }

                $get(MasterObj + 'txtXmlMember').value = $get(MasterObj + 'txtXmlMember').value.replace('</BaseInfoEntity>', StrXml+'</BaseInfoEntity>');
            }
            else {
                var StrXml = "<BaseInfoEntity>";

                for (var i = 0; i < xmlNodesTemp.length; i++) {
                    var MemberID, MemberName ;
                    switch (Type)
                    {
                        case 'P':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('PersonID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('PersonName').text;
                            break

                        case 'G':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                            CID = xmlNodesTemp.item(i).selectSingleNode('CID').text;
                            break

                        case 'DA':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DepartmentID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('Name').text;
                            break

                        case 'DS':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DepartmentID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('Name').text;
                            break     
                    }
                    
                    StrXml += "<ControlRuleMember>";
                    StrXml += "<Selected>1</Selected>";
                    StrXml += "<ControlRuleMemberID>0</ControlRuleMemberID>";
                    StrXml += "<ControlRuleID>" + $get(MasterObj + "ControlRuleID").value + "</ControlRuleID>"
                    StrXml += "<MemberID>" + MemberID + "</MemberID>";
                    StrXml += "<MemberName>" + MemberName + "</MemberName>";
                    StrXml += "<MemberType>" + Type + "</MemberType>";
                    StrXml += "</ControlRuleMember>";

                    MakeSaveXML(oXmlSaveDoc, MemberID, Type, 1)
                }
                StrXml += "</BaseInfoEntity>";
                
                $get(MasterObj + 'txtXmlMember').value = StrXml;
            }    
        }
        //*******************************************************************************
        function MakeSaveXML(oXmlDoc, MemberID, MemberType, Selected) {
            if (oXmlDoc == null) {
                var StrXml = "<Mamber>"
                StrXml += "<MemberID>" + MemberID + "</MemberID>";
                StrXml += "<MemberType>" + MemberType + "</MemberType>";
                StrXml += "<Selected>" + Selected + "</Selected>";
                StrXml += "</Mamber>"

                if ($get(MasterObj + 'txtSaveXml').value == '')
                    $get(MasterObj + 'txtSaveXml').value = '<Root>' + StrXml + '</Root>'
                else
                    $get(MasterObj + 'txtSaveXml').value = $get(MasterObj + 'txtSaveXml').value.replace('</Root>', StrXml + '</Root>')
            }
            else {
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/Root/Mamber[MemberID=' + MemberID + ' and MemberType="' + MemberType + '"]');

                if (xmlNodes.length != 0) {
                    xmlNodes.item(0).selectSingleNode('Selected').text = Selected
                    $get(MasterObj + 'txtSaveXml').value = oXmlDoc.xml;
                }
                else {
                    var StrXml = "<Mamber>"
                    StrXml += "<MemberID>" + MemberID + "</MemberID>";
                    StrXml += "<MemberType>" + MemberType + "</MemberType>";
                    StrXml += "<Selected>" + Selected + "</Selected>";
                    StrXml += "</Mamber>"

                    if ($get(MasterObj + 'txtSaveXml').value == '')
                        $get(MasterObj + 'txtSaveXml').value = '<Root>' + StrXml + '</Root>'
                    else
                        $get(MasterObj + 'txtSaveXml').value = $get(MasterObj + 'txtSaveXml').value.replace('</Root>', StrXml + '</Root>')
                }
            }
            //alert($get(MasterObj + 'txtSaveXml').value)   
        }
        //*******************************************************************************
        function CheckValidData() {
            var ChkFlag = 1;
            if ($get(MasterObj + 'txtXmlMember').value != "" & $get(MasterObj + 'txtXmlMember').value != "<BaseInfoEntity />") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXmlMember').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/ControlRuleMember[Selected=1 and MemberType="DA"]');
                if (xmlNodes.length != 0)
                    ChkFlag = 2
                else {
                    xmlNodes = oXmlDoc.documentElement.selectNodes('/BaseInfoEntity/ControlRuleMember[Selected=1]');
                    if (xmlNodes.length == 0)
                        ChkFlag = 3;
                }    
            }

            return ChkFlag;
        }
        //*******************************************************************************
        function OnclickSelectAllChk(obj) {
            //================================================
            if ($get(MasterObj + 'txtSaveXml').value != '') {
                var oXmlSaveDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlSaveDoc.async = "false";
                oXmlSaveDoc.loadXML($get(MasterObj + 'txtSaveXml').value)
            }
            else
                var oXmlDoc = null;
            //================================================
            var oGrid = XTabTable;
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML($get(MasterObj + 'txtXmlMember').value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var root = "/BaseInfoEntity/ControlRuleMember"
            var xmlNodes = xmlDoc.documentElement.selectNodes(root)

            xmlNodes = xmlDoc.documentElement.selectNodes(root);
            var Glen = oGrid.rows.length
            for (var j = 0; j < Glen; j++) {
                oGrid.rows(j).cells(0).firstChild.checked = obj.checked
                var Selected = ((obj.checked) ? 1 : 0);
                xmlNodes.item(j).selectSingleNode('Selected').text = Selected

                MakeSaveXML(oXmlSaveDoc, oGrid.rows(j).MemberID, oGrid.rows(j).MemberType, Selected)
            }
            $get(MasterObj + 'txtXmlMember').value = xmlDoc.xml
        }
        //*******************************************************************************
       </script>
</asp:Content>