<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineGroup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.DefineGroup"
    MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <title>GridViewCommandEventArgs </title>
    <link href="../../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet">

    <script language="javascript" src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>

    <table>
        <tr>
            <td valign="top" align="right" >
                <table style="height: 500px;">
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" GridID="1" 
                                PageName="DefineGroup.aspx" PageID="1101" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"
                                ScriptMode="Release">
                            </asp:ScriptManager>

                            <script type="text/javascript" language="javascript">
                                Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                                function BeginRequestHandler(sender, args) {
                                    document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                                }

                                function EndRequestHandler(sender, args) {
                                    LastSelectedRow=""
                                   document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                                    var StrVal = $get(MasterObj + "txtSubmit").value
                                   // $get(MasterObj + "txtAlert").value = StrVal
                                    //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
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
                                    
                                    if ($get(MasterObj + "txtAlert").value != "") {
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                        $get(MasterObj + "txtAlert").value = "";
                                    }
                                    
                                    if (StrVal == "SaveGroupView") {
                                        PopupGridView.style.display = "none"
                                    }
                                    else if (StrVal == "Search") {
                                        PopupSearch.style.display = "none";
                                        LastSelectedRow = '';
                                    }
                                    $get(MasterObj + "txtSubmit").value = "";
                                    GroupID = 0
                                    
                                    if (document.getElementById("GrdGroup") == null) {
                                        OnClickBtnNew();
                                    }
                                }
                            </script>

                        </td>
                    </tr>
                    <tr style="height: 420px">
                        <td align="center" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtOnLineUser" runat="server" />
                                    <asp:HiddenField ID="txtXmlAllGroupView" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="lblTo" runat="server" />
                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                    <asp:HiddenField ID="txtValueSearch" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                    
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" dir="rtl">
                            <hr style="width: 447px;height: 3px" />
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 55px">
                                        نام گروه:
                                    </td>
                                    <td style="width: 100px">
                                        <input id="txtGroupName" name="txtGroupName" type="text" runat="server" dir="rtl" />
                                    </td>
                                    <td style="width: 76px">
                                        دسته بندی:
                                    </td>
                                    <td style="width: 74px">
                                        <asp:DropDownList ID="CmbGroupCategory" onchange="onchangeCmbGroupCategory()" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 89px">
                                        نام زیرسیستم:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CmbSubSysNew" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        نوع گروه:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CmbGroupType" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td> 
                                        <input type="radio" id="rdbWithoutDate" onclick="onclickrdbWithoutDate()" runat="server" />بدون تاریخ
                                        <input type="radio" id="rdbWithDate" runat="server" checked />تاریخدار
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td dir="ltr">
                            <div id="PopupSearch" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                                border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                                top: 100px; left: 145px; display: none; background-color: #e7eeff; right: 196px;
                                width: 635px;" align="center">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 70px">
                                            زیرسیستم :
                                        </td>
                                        <td style="width: 53px">
                                            <asp:DropDownList ID="CmbFSubSys" runat="server" Width="130px">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 128px">
                                            نام گروه
                                        </td>
                                        <td style="width: 135px">
                                            <input id="txtFGroupName" name="txtFGroupName" type="text" runat="server" dir="rtl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 70px">
                                            دسته بندي
                                        </td>
                                        <td style="width: 53px">
                                            <asp:DropDownList ID="CmbFCategory" runat="server" Width="130px">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 128px">
                                            <input id="Radio2" style="background-color:Transparent" name="g1" type="radio" />همه گروهها
                                        </td>
                                        <td style="width: 135px">
                                            <input id="Radio3" style="background-color:Transparent"  name="g1" type="radio" />گروههای نمایشی
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 70px">
                                            پرسنلي
                                        </td>
                                        <td style="width: 53px">
                                            <input id="txtFPersonCode" name="txtFPersonCode" type="text" runat="server" onblur="OnBlurTxtFPersonCode()"
                                                 dir="rtl" />
                                        </td>
                                        <td style="width: 128px">
                                            نام و نام خانوادگي
                                        </td>
                                        <td>
                                            <input id="txtFPersonName" name="txtFPersonName" onblur="OnBlurTxtFPersonName()"
                                                type="text" runat="server" dir="rtl" style="width: 71px" />
                                            <asp:DropDownList ID="CmbFPersonName" runat="server" Width="127px" Height="16px"
                                                onchange="onChangeCmbFPersonName()">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="checkbox" id="chkWithoutDate"   />بدون تاریخ
                                            <input type="checkbox" id="chkWithDate"  />تاریخدار   
                                        </td>
                                        <td></td> 
                                        <td></td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <input id="BtnClear" name="BtnClear" type="button" value="حذف فیلتر" onclick="OnClickBtnClear()" />
                                        </td>
                                        <td>
                                            <input id="BtnSearch" name="BtnSearch" type="button" value="نمايش محدود" onclick="OnClickBtnShowSearch()" />
                                        </td>
                                        <td>
                                            <input id="BtnCancel" name="BtnCancel" type="button" value="انصراف" onclick="OnClickBtnCancel()" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <table id="TbPopupGridView">
                    <tr>
                        <td align="center">
                            <div id="PopupGridView" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                                border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                                top: 100px; left: 100px; display: none; background-color: #e7eeff; right: 634px;
                                width: 220px;" align="center">
                                <asp:PlaceHolder ID="SubSysGridViewPlaceHolder" runat="Server" />
                                <table align="center">
                                    <tr>
                                        <td id="ttt">
                                            <input id="BtnOk" name="BtnOk" type="button" value="تاييد" onclick="OnClickBtnOk()" />
                                        </td>
                                        <td>
                                            <input id="BtnCancelGridView" name="BtnCancelGridView" type="button" value="انصراف"
                                                onclick="OnClickBtnCancelGridView()" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
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
                    <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
                    <input type="text" id="txtXMLModify" name="txtGroupView" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var GroupID = '0';
        var LastSelectedRow = ""
        var RequsterAction = "";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "ShowCurPage";
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
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowGroupPerson() {

            //var RequsterAction = "";
            var RequsterPageID=0
            if (RequsterAction == "") {
                if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                    RequsterAction = event.srcElement.id.replace('OToolBar_', '')
                }
            }
            if (GroupID != "" & GroupID != "0") {
                if (document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).firstChild.title != "")
                    GName = document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).firstChild.title
                else
                    GName = document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).innerText
                url = "ShowGroupPerson.aspx?CategoryID=" + document.getElementById("GrdGroup").rows(LastSelectedRow).CategoryID + "&Category=" + document.getElementById("GrdGroup").rows(LastSelectedRow).cells(2).innerText + "&WithoutDate=" + document.getElementById("GrdGroup").rows(LastSelectedRow).WithoutDate + "&GroupID=" + GroupID + " &GroupName=" + GName + " &RequsterPageID=1101" + " &RequsterAction=" + RequsterAction;
                //alert(url)
                returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            }
            else
                alert("لطفا ابتدا يک سطر انتخاب نماييد")
            RequsterAction = "";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEditGroupPerson() {
            var RequsterPageID = 0
            if (RequsterAction == "") {
                if (event.srcElement.id.indexOf('OToolBar_') != -1) {
                    RequsterAction = event.srcElement.id.replace('OToolBar_', '')
                }
            }
            if (GroupID != "" & GroupID != "0") {

                if (document.getElementById("GrdGroup").rows(LastSelectedRow).WithoutDate == 1) {
                    alert("تاریخ شروع و پایان اعضای گروههای بدون تاریخ را نمی توانید ویرایش کنید")
                    return
                }
                if (document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).firstChild.title != "")
                    GName = document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).firstChild.title
                else
                    GName = document.getElementById("GrdGroup").rows(LastSelectedRow).cells(1).innerText
                url = "ModifyGroupPerson.aspx?CategoryID=" + document.getElementById("GrdGroup").rows(LastSelectedRow).CategoryID + "&Category=" + document.getElementById("GrdGroup").rows(LastSelectedRow).cells(2).innerText + "&WithoutDate=" + document.getElementById("GrdGroup").rows(LastSelectedRow).WithoutDate + "&GroupID=" + GroupID + " &GroupName=" + GName + " &RequsterPageID=1101" + " &RequsterAction=" + RequsterAction;
                returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            }
            else
                alert("لطفا ابتدا يک سطر انتخاب نماييد")
            RequsterAction = "";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            PopupSearch.style.display = "inline";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            OnClickBtnClear()
            OnClickBtnShowSearch()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (document.getElementById(MasterObj + "txtGroupName").value != "") {
                var StrXml = "";
                var WithoutDate = 0
                if (document.getElementById(MasterObj + "rdbWithoutDate").checked == true)
                    WithoutDate=1
                
                StrXml = "<BaseInfoEntity><Group>";
                StrXml += "<GroupID>" + GroupID + "</GroupID>";
                StrXml += "<SubSysID>" + document.getElementById(MasterObj + "CmbSubSysNew").value + "</SubSysID>";
                StrXml += "<Name>" + document.getElementById(MasterObj + "txtGroupName").value + "</Name>";
                StrXml += "<CategoryID>" + document.getElementById(MasterObj + "CmbGroupCategory").value + "</CategoryID>";
                StrXml += "<PublicType>" + document.getElementById(MasterObj + "CmbGroupType").value + "</PublicType>";
                StrXml += "<OnLineUser>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</OnLineUser>";
                StrXml += "<WithoutDate>" + WithoutDate + "</WithoutDate>";
                StrXml += "</Group></BaseInfoEntity>";
                $get(MasterObj + "txtXMLModify").value = StrXml;
//                alert($get(MasterObj + "txtXMLModify").value)
                $get(MasterObj + "txtSubmit").value = "Modify";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
            else {
                alert("لطفا ابتدا کنترلهاي مورد نظر را پر نماييد");
                document.getElementById(MasterObj + "txtGroupName").focus();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtXMLModify").value = "";
            GroupID = "0";
            document.getElementById(MasterObj + "rdbWithDate").checked = true
            document.getElementById(MasterObj + "txtGroupName").value = "";
            document.getElementById(MasterObj + "CmbSubSysNew").value = 0;
            document.getElementById(MasterObj + "CmbGroupCategory").value = 0;
            document.getElementById(MasterObj + "CmbGroupType").value = 1;
            document.getElementById(MasterObj + "txtGroupName").focus();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            $get(MasterObj + "txtXMLModify").value = "";
            if (GroupID != "" & GroupID != "0") {
//                var StrConf = "در صورت حذف اين گروه، کليه اعضا آن هم حذف خواهند شد" + String.fromCharCode(13)
                //                            + "آيا از حذف مطمئنيد؟"
                if (document.getElementById("GrdGroup").rows(LastSelectedRow).Personelflag == 1)
                    alert("برای حذف این گروه ابتدا اعضا آن را حذف کنید")
                else {
                    var StrConf = "آيا از حذف مطمئنيد؟"
                    if (confirm(StrConf)) {
                        $get(MasterObj + "txtXMLModify").value = GroupID;
                        $get(MasterObj + "txtSubmit").value = "Delete";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
            }
            else
                alert("ابتدا يک سطر انتخاب نماييد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!PopupGridView!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancelGridView() {
            PopupGridView.style.display = "none";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtncal(obj) {
            var TbObj = obj.parentElement.parentElement.parentElement;
            if (TbObj.tagName != "Table")
                TbObj = obj.parentElement.parentElement.parentElement.parentElement;
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var CellIndex = obj.parentElement.cellIndex;
//            alert(RowIndex + "  " + CellIndex)
            GroupID = TbObj.rows(RowIndex).getAttribute('GroupID');
            CategoryID = TbObj.rows(RowIndex).getAttribute('CategoryID')
            if (CategoryID == 1) {
                url = "/TAPresentation/App_Pages/Schedule/WorkTimesCalendar.aspx?GroupID=" + GroupID;
                returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no")
            }
            else {
                $get(MasterObj + "txtAlert").value = "این گروه ، گروه شیفتی نیست";
                SetMsg($get(MasterObj + "txtAlert").value);
            }
        }
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOtherSubSys(obj) {
            $get(MasterObj + "txtXMLModify").value = "";

            PopupGridView.style.top = event.clientY;
            PopupGridView.style.left = event.clientX - 20;
            PopupGridView.style.display = "inline";

            var TbObj = obj.parentElement.parentElement.parentElement;
            if (TbObj.tagName != "Table")
                TbObj = obj.parentElement.parentElement.parentElement.parentElement;
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var CellIndex = obj.parentElement.cellIndex;

            GroupID = TbObj.rows(RowIndex).getAttribute('GroupID');
            var OGrid = document.getElementById("GrdSubSystem");
            SetGrdSubSystemChecked(OGrid, TbObj.rows(RowIndex).getAttribute('SubSysID'));
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {

            var TbObj = obj.parentElement;
            while (TbObj.tagName != "TR")
                TbObj = TbObj.parentElement

            var RowIndex = TbObj.rowIndex;

            while (TbObj.tagName != "TABLE")
                TbObj = TbObj.parentElement


            var StrXml = $get(MasterObj + "txtXMLModify").value;

            if (StrXml == "") {
                StrXml = "<BaseInfoEntity><GroupView>";
                StrXml += "<GroupID>" + GroupID + "</GroupID>"
                StrXml += "<SubSysID>" + TbObj.rows(RowIndex).getAttribute('Val') + "</SubSysID>"
                StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                StrXml += "</GroupView></BaseInfoEntity>"
                $get(MasterObj + "txtXMLModify").value = StrXml;
            }
            else if (StrXml != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(StrXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GroupView [GroupID='" + GroupID + "' and SubSysID='" + TbObj.rows(RowIndex).getAttribute('Val') + "']"); //SubSysId

                if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode('Selected').text = ((obj.checked) ? "1" : "0");
                    $get(MasterObj + "txtXMLModify").value = oXmlDoc.xml;
                }
                else {
                    StrXml += "<GroupView>";
                    StrXml += "<GroupID>" + GroupID + "</GroupID>"
                    StrXml += "<SubSysID>" + TbObj.rows(RowIndex).getAttribute('Val') + "</SubSysID>"
                    StrXml += "<Selected>" + ((obj.checked) ? "1" : "0") + "</Selected>"
                    StrXml += "</GroupView>"
                    $get(MasterObj + "txtXMLModify").value = $get(MasterObj + "txtXMLModify").value.replace("</BaseInfoEntity>", StrXml + "</BaseInfoEntity>");
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetGrdSubSystemChecked(OGrid, CurSubSysID) {
            for (var i = 1; i < OGrid.rows.length; i++) {
                if (OGrid.rows(i).getAttribute('Val') == CurSubSysID || OGrid.rows(i).getAttribute('Val') == 0) 
                    OGrid.rows(i).style.display = 'none'
                else
                    OGrid.rows(i).style.display = 'inline';
                    
                if (OGrid.rows(i).cells(0).firstChild.tagName == 'SPAN')
                    OGrid.rows(i).cells(0).all.item(1).checked = false;
                else
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
            SetStyle()
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtXmlAllGroupView").value);
            var oXmlNodes;
            oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GroupView [GroupID='" + GroupID + "']");
            
            for (var j = 0; j < oXmlNodes.length; j++)
                for (var i = 1; i <= OGrid.rows.length; i++) {
                    if (OGrid.rows(i).getAttribute('Val') == oXmlNodes.item(j).selectSingleNode('SubSysID').text) {
                        if (OGrid.rows(i).cells(0).firstChild.tagName == 'SPAN')
                            OGrid.rows(i).cells(0).all.item(1).checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        i = OGrid.rows.length;
                    }
                }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetStyle() {
            var OGrid = document.getElementById("GrdSubSystem")
            
            if (OGrid == null)
                return
            var len = OGrid.rows.length
            var j=1
            for (var i = 1; i < len; i++) {

                if (OGrid.rows(i).style.display != "none") {
                    if (j % 2 == 0)
                        OGrid.rows(i).className = 'CssAlternatingItemStyle' 
                    else
                        OGrid.rows(i).className = 'CssItemStyle'
                    j++;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOk() {
            if ($get(MasterObj + "txtXMLModify").value != "") {
                $get(MasterObj + "txtSubmit").value = "SaveGroupView";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }    
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPopupGridView!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!PopupSearch!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowSearch() {
            var WithOutDate = 2
            if (($get("chkWithoutDate").checked == true) && ($get("chkWithDate").checked == false))
                WithOutDate=1
            else if (($get("chkWithoutDate").checked == false) && ($get("chkWithDate").checked == true))
                WithOutDate = 0
            $get(MasterObj + "txtValueSearch").value = "";
            var StrSearch = "<Root><Tb>";
            StrSearch += "<SubSysID>" + $get(MasterObj + "CmbFSubSys").value + "</SubSysID>";
            StrSearch += "<GroupName>" + $get(MasterObj + "txtFGroupName").value + "</GroupName>";
            StrSearch += "<CategoryID>" + $get(MasterObj + "CmbFCategory").value + "</CategoryID>";
            StrSearch += "<PersonCode>" + $get(MasterObj + "txtFPersonCode").value + "</PersonCode>";
            StrSearch += "<PersonName>" + $get(MasterObj + "txtFPersonName").value + "</PersonName>";
            StrSearch += "<WithOutDate>" + WithOutDate + "</WithOutDate>";
            StrSearch += "</Tb></Root>";
            $get(MasterObj + "txtValueSearch").value = StrSearch;
            
            $get(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            PopupSearch.style.display = "none"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnClear() {
            $get(MasterObj + "CmbFSubSys").value = "0";
            $get(MasterObj + "txtFGroupName").value = "";
            $get(MasterObj + "CmbFCategory").value = "0";
            $get(MasterObj + "txtFPersonCode").value = "";
            $get(MasterObj + "CmbFPersonName").value = "0";
            $get(MasterObj + "txtFPersonName").value = "";
            $get("chkWithoutDate").checked = false
            $get("chkWithDate").checked = false
             
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtFPersonName() {
            if (document.getElementById(MasterObj + "txtFPersonName").value != "") {
                document.getElementById(MasterObj + "txtFPersonCode").value = ""
                document.getElementById(MasterObj + "CmbFPersonName").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbFPersonName() {
            document.getElementById(MasterObj + "txtFPersonCode").value = document.getElementById(MasterObj + "CmbFPersonName").value
            if (document.getElementById(MasterObj + "CmbFPersonName").value == 0)
                document.getElementById(MasterObj + "txtFPersonCode").value = ""
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtFPersonCode() {
            document.getElementById(MasterObj + "CmbFPersonName").value = document.getElementById(MasterObj + "txtFPersonCode").value
            if (document.getElementById(MasterObj + "txtFPersonCode").value == "" || document.getElementById(MasterObj + "txtFPersonCode").value == "0")
                document.getElementById(MasterObj + "CmbFPersonName").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPopupSearch!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdGroup(SelectedRow) {
        try
        {
            if (LastSelectedRow != "")
                SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.style.backgroundColor = "#FFFFCC";
            GroupID = SelectedRow.getAttribute('GroupID');
            var GName=""
            if (SelectedRow.cells(1).firstChild.title != "")
                GName = SelectedRow.cells(1).firstChild.title
            else
                GName = SelectedRow.cells(1).innerText
                
            document.getElementById(MasterObj + "txtGroupName").value = GName;
            document.getElementById(MasterObj + "CmbSubSysNew").value = SelectedRow.getAttribute('SubSysID');
            document.getElementById(MasterObj + "CmbGroupCategory").value = SelectedRow.getAttribute('CategoryID');
            document.getElementById(MasterObj + "CmbGroupType").value = SelectedRow.getAttribute('PublicType');
            var WithoutDate = SelectedRow.getAttribute('WithoutDate')
            if (WithoutDate==1)
                document.getElementById(MasterObj + "rdbWithoutDate").checked=true
            else
                document.getElementById(MasterObj + "rdbWithDate").checked=true
          }
          catch(e)
          {}
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      function OndbClickGrdGroup() {
          RequsterAction = "BtnShowGroupPerson"
          OnClickBtnShowGroupPerson()
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      function onclickrdbWithoutDate() {
          if (GroupID != "" & GroupID != "0") {
              var strconfirm = "با تغییر نوع گروه از تاریخدار به بدون تاریخ تمامی تاریخ های اعضا این " + String.fromCharCode(13)
                         + " گروه به 1301/01/01 تا 1399/12/29 تغییر خواهد نمود و رکوردهای" + String.fromCharCode(13)
                         + "                                                                 تکراری حذف خواهد شد"

              if (confirm(strconfirm) == false)
                  document.getElementById(MasterObj + "rdbWithDate").checked = true
          }
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      function onchangeCmbGroupCategory() {
          if (GroupID != "" & GroupID != "0") {
              if (document.getElementById("GrdGroup").rows(LastSelectedRow).Personelflag == 1) {
                  alert("تغییر دسته بندی فقط برای گروههایی که هیچ عضوی ندارند میسر است")
                  document.getElementById(MasterObj + "CmbGroupCategory").value = document.getElementById("GrdGroup").rows(LastSelectedRow).CategoryID
              }
              else if (document.getElementById("GrdGroup").rows(LastSelectedRow).Shiftflag == 1) {
                  alert("امکان تغییر دسته بندی گروههای شیفتی که در شیفتهایی در حال حاضر درحال استفاده هستند وجود ندارد")
                  document.getElementById(MasterObj + "CmbGroupCategory").value = document.getElementById("GrdGroup").rows(LastSelectedRow).CategoryID
              }
          }
      }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
