<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterCredit.aspx.cs" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    Inherits="TAPresentation.App_Pages.DataEntry.EnterCredit" ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr id="TRMenue" runat="server" style="display: none">
            <td>
                <table style="width: 30%">
                    <tr>
                        <td>
                            نوع مجوز:
                        </td>
                        <td>
                            <select id="CmbCodeType" style="width: 170px" class="TxtControls" runat="server"
                                onchange="onchangeCmbCreditType()">
                                <option></option>
                            </select>
                            
                        </td>
                    </tr>
                    <%-- <tr>
                    <td colspan="2">
                        <hr class="CssHR" style="width: 100%" />
                    </td>
                </tr>--%>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="FilterTable">
                    <tr>
                        <td>
                            از :
                        </td>
                        <td>
                            <uc3:ComboBox ID="CmbFromPersonelInfo" runat="server" />
                        </td>
                        <td>
                            تا :
                        </td>
                        <td>
                            <uc3:ComboBox ID="CmbToPersonelInfo" runat="server" />
                        </td>
                        <td>
                            از :
                        </td>
                        <td>
                            <%--<uc1:KCalendar ID="KCalSDate" runat="server" />--%>
                            <input type="text" id="TxtSDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                        </td>
                        <td>
                            تا :
                        </td>
                        <td>
                            <%--<uc1:KCalendar ID="KCalEDate" runat="server" />--%>
                            <input type="text" id="TxtEDate" class="TxtControls" style="width:120px;height:25px;" onkeydown="ArrowKeyManager(this);" onblur="DatePicker_OnBlur(this)"  />
                        </td>
                        <%-- <td>
                            نام و نام خانوادگي :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <input class="TxtControls" id="PersonNameSearch" runat="server" name="PersonNameSearch"
                                        style="width: 115px" type="text" />
                                    <input id="ImgRefreshPersonSearch" name="ImgRefreshPersonSearch" onclick="onClickImgRefreshPersonSearch(this)"
                                        style="width: 25px; cursor: pointer; height: 22px;" type="button" class="HeaderStyle"
                                        value="..." />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>--%>
                        <td>
                            وضعيت
                            <asp:DropDownList ID="cmbState" runat="server" class='txtControls'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <table>
                                <tr>
                                    <td>
                                        مجوز پيش فرض :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbDfaultCredit" runat="server" Width="150px" Height="16px"
                                            CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        شرح پيش فرض :
                                    </td>
                                    <td>
                                        <input type="text" id="txtDefaultDesc" runat="server" class="TxtControls" style="width: 200px" />
                                    </td>
                                    <td>
                                        <input id="BtnShow" class="" style="background-position: right; background-repeat: no-repeat;
                                            background-color: #97D0EC; border-right: #346fa4 2px solid; border-top: lightsteelblue 2px solid;
                                            border-left: lightsteelblue 2px solid; border-bottom: #346fa4 2px solid; width: 60px;
                                            height: 30px; cursor: pointer; background-image: url('../../App_Utility/Images/Icons/copy01.gif');"
                                            type="button" name="btnCopy" value="  کپی" onclick="OnClickbtnCopy()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="TdToolBar">
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" Paging="1" PageName="EnterCredit.aspx"
                    PageID="1310" />
            </td>
        </tr>
        <tr>
            <td>
                
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtClosePage" runat="server" />
                            <asp:HiddenField ID="txtWPID" runat="server" />
                        </div>
                        <div id="Div1" runat="server" style="width: 100%; scrollbar-hightlight-color: white;
                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF;
                            height: 400px" align="center">
                            <%--<asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />--%>
                            <div id="dPager" style="height:30px;text-align:right;background-color:#D3E2ED;border-width:1px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ADC2E9, EndColorStr=#CDDAF1)">
                                <table>
                                    <tr>
                                        <td id="TdGridSend" align="right">
                                                
                                        </td>
                                        <td id="TdGridPager" align="right">
                                            <table>
                                                <tr>
                                                    <td style="width:30px;">
                                                        <img id="BtnGridLast" title="آخرين" alt="آخرين" src="/TAPresentation/App_Utility/Images/Icons/active_last.gif" style="cursor:pointer;" />
                                                    </td>
                                                    <td style="width:30px;">
                                                        <img id="BtnGridNext" title="بعدي" alt="بعدي" src="/TAPresentation/App_Utility/Images/Icons/active_forward.gif" style="cursor:pointer;" />
                                                    </td>
                                                    <td>
                                                        <input id="TxtGridCurPage" type="text" title="صفحه جاري" style="text-align:center;border-style:solid;border-width:1px;border-color:#003366 #7EAACB #7EAACB #003366;background-color:#D3E2ED;width:40px;height:18px;font-weight:normal;font-size:12px;font-family:Tahoma;" onkeydown="OnKeyDownInt(this)" />
                                                    </td>
                                                    <td style="width:10px;color:#003366;">
                                                        از
                                                    </td>
                                                    <td style="width:40px;">
                                                        <input id="TxtGridTotalPage" type="text" title="تعداد كل صفحات" readonly="readonly" style="text-align:center;width:100%;background-color:transparent;border-width:0px;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                    </td>
                                                    <td style="width:30px;">
                                                        <img id="BtnGridPrev" title="قبلي" alt="قبلي" src="/TAPresentation/App_Utility/Images/Icons/active_back.gif" style="cursor:pointer;" />
                                                    </td>
                                                    <td style="width:30px;">
                                                        <img id="BtnGridFirst" title="اولين" alt="اولين" src="/TAPresentation/App_Utility/Images/Icons/active_first.gif" style="cursor:pointer;" />
                                                    </td>
                                                    <td style="width:50px;">
                                                        <input id="TxtGridFromData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                    </td>
                                                    <td style="width:20px;color:#003366;">
                                                        تا
                                                    </td>
                                                    <td style="width:50px;">
                                                        <input id="TxtGridToData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                    </td>
                                                    <td style="width:20px;color:#003366;">
                                                        از
                                                    </td>
                                                    <td style="width:50px;">
                                                        <input id="TxtGridTotalData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                    </td>
                                                            
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="TdGridMessage" style="width:400px; color: Red;">
                                                            
                                        </td>
                                    </tr>
                                </table>
                                        
                                </div>
                                <table id="GrdCredit" border="0" cellpadding="0" cellspacing="1">
                                        
                                <thead id="ColumnHeader">
            
                                </thead>
                                <tbody id="ColumnData">
                                            
                                </tbody>
                                <tfoot id="ColumnFooter">
            
                                </tfoot>
                            </table>
                                    
                            <div style="display: none">
                                        
                            </div>
                        </div>
                    <%--</ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser1" runat="server">
        </cc1:MySecurity>
        <input id="txtFromPersonCode" runat="server" name="txtFromPersonCode" type="text" />
        <input id="txtToPersonCode" runat="server" name="txtToPersonCode" type="text" />
        <input id="txtName" runat="server" name="txtName" type="text" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input id="txtOnLineUser" type="text" name="txtOnLineUser" runat="server" />
        <input id="txtFlag" type="text" name="txtFlag" runat="server" />
        <input id="txtUserPersonelID" type="text" name="txtUserPersonelID" runat="server" />
        <input id="txtSubmit" type="text" name="txtSubmit" runat="server" />
        <input id="txtSaveXml" type="text" name="txtSaveXml" runat="server" />
        <input id="PostbackControlName" type="text" name="PostbackControlName" runat="server" />
        <input type="text" id="txtSortExpression" name="txtSortExpression" runat="server" />
        <input id="SDate" name="SDate" type="text" style="width: 99px" runat="server" />
        <input id="EDate" name="EDate" type="text" style="width: 99px" runat="server" />
        <input type="text" id="SessionID" name="SessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="hidden" id="txtMenuItemID" runat="server" />
        <input type="hidden" id="txtFlagAccess" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtMainCode" runat="server" />
        <input type="text" id="txtAdminCredit" runat="server" />
        <input type="text" id="txtState" runat="server" />
        <input type="text" id="txtCalcOption" runat="server" />
        <input type="text" id="txtXmlGridProperty" name="txtXmlGridProperty" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtXmlGetEnterCredit" name="txtXmlGetEnterCredit" runat="server" />
        <input type="text" id="TxtXmlCreditType" name="TxtXmlCreditType" runat="server" />

    </div>
    <%--<script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>--%>
    <link type="text/css" href="../../App_Utility/PersianCalendar/styles/DatePicker.css" rel="stylesheet" /> 
    <script language="javascript" type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/PDate.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/calendar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-ar.js"></script>
    <script type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/jquery.ui.datepicker-cc-fa.js"></script>
    <%--<script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/DataEntry/EnterCredit.js?v=201"></script>--%>
    <script language="javascript" type="text/javascript">
        var win = null;
        var lastValue = ''
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var SaveMode = 0;
        win = window.dialogArguments
        window.name = "EnterCredit"
        aspnetForm.target = window.name
        var XmlModifyCredit = "";

        
        /*****************************Grid Information*******************************/
        
        var Grid = GrdCredit;
        var XmlGridProperty = document.getElementById(MasterObj + "txtXmlGridProperty").value;
        var XmlGridSetting = document.getElementById(MasterObj + "txtXmlGridSetting").value;
        var XmlGridData = document.getElementById(MasterObj + "txtXmlGetEnterCredit").value;
        
       
        var arrGridEvent = {
            //0: ["cell", "1", "", "onmouseup", onclickPersonCode]
        };
        /*****************************Grid Information*******************************/
        $(document).ready(function () {
            $('#TxtSDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });

            $('#TxtEDate').datepicker({
                showWeek: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                showOn: 'button',
                buttonImage: '../../App_Utility/PersianCalendar/styles/images/calendar.gif',
                buttonText: '',
                buttonImageOnly: true,
                HolidayFileName: '/FrmPresentation/App_Utility/Holiday/Holiday.xml'
            });


            var startDate = document.getElementById(MasterObj + "SDate").value;
            var endDate = document.getElementById(MasterObj + "EDate").value;

            document.getElementById("TxtSDate").value = ReverceDate(document.getElementById(MasterObj + "SDate").value);
            document.getElementById("TxtEDate").value = ReverceDate(document.getElementById(MasterObj + "EDate").value);

            var revStartDate = document.getElementById("TxtSDate").value;
            var revEndDate = document.getElementById("TxtEDate").value;

            
            /*****************************Create Grid*******************************/
            var x = 0;
            var XmlWPInfo = "", XmlGrid = "";
            x = XmlGridData.search("</Tb></Root>");
            x = x + 12;
            XmlWPInfo = XmlGridData.substring(0, x);
            XmlGrid = XmlGridData.substring(x, XmlGridData.length);
            XmlGrid = XmlGrid.replace(/_x0020_/g, "_");
            BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, "DataEntryEntity", startDate, revStartDate, endDate, revEndDate, document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value, document.getElementById(MasterObj + "txtSessionID").value, document.getElementById(MasterObj + "txtOnLineUser").value, "", "", null, arrGridEvent, 0, false);

            /*****************************Create Grid*******************************/

            document.body.style.overflowX = "hidden";
            document.body.style.overflowY = "hidden";

            PageLoad();
        });

        function RefreshParentRow() {
            try {
                if ($get(MasterObj + "txtCalcOption").value != "0") {
                    win = window.dialogArguments
                    if (win.RefreshThisRow)
                        win.RefreshThisRow()
                    else {
                        Pageunload()
                    }
                }
            }
            catch (e) {
                Pageunload()
            }
        }

        
        function PageLoad() {

            if ($get(MasterObj + "txtAdminCredit").value == "1") {
            
               // var OGrid = document.getElementById("GrdCreditRd");

                document.getElementById("FilterTable").style.display = "none";
                document.getElementById("TdToolBar").style.display = "none";

                var Body = Grid.getElementsByTagName('tbody')['ColumnData'];

                if (Body.rows.length > 0)
                    SelectGridRow(Body.rows(0));

                else {
                    window.returnValue = ""
                    window.close();
                }
            }


        }

        function SetDate(TbObj, RowIndex, CellIndex) {
            var GridSDate = '', GridEDate = '';
            var Year = '';
            var Month = '';
            var Day = '';
            
            var ReverseRealVal = TbObj.rows(RowIndex).cells(2).getAttribute("RealVal");
            var RealVal = ReverseRealVal.split("/")[2] + "/" + ReverseRealVal.split("/")[1] + "/" + ReverseRealVal.split("/")[0];

            if (TbObj.rows(RowIndex).cells(7).firstChild.value < TbObj.rows(RowIndex).cells(6).firstChild.value) {
                TbObj.rows(RowIndex).cells(2).innerText = ReverseRealVal;
                //var NextDate = shdAdd("13" + RealVal, 1);
                var NextDate=ShdAdd("13"+RealVal,1)
                TbObj.rows(RowIndex).cells(3).innerText = NextDate.split("/")[2] + "/" + NextDate.split("/")[1] + "/" + NextDate.split("/")[0].substr(2, 2);
            }
            else {
                TbObj.rows(RowIndex).cells(2).innerText = ReverseRealVal;
                TbObj.rows(RowIndex).cells(3).innerText = ReverseRealVal;
            }
        }

        function ModifyXMLCredit(obj) {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            var Header = Grid.getElementsByTagName('thead')['ColumnHeader'];
//            var TbObj = obj.parentElement.parentElement.parentElement;
//            if (TbObj.tagName != "Table")
            //                TbObj = obj.parentElement.parentElement.parentElement.parentElement;
            
            var TbObj = Body;
            var RowIndex = parseInt(obj.parentElement.parentElement.rowIndex, 10) - parseInt(Header.rows.length, 10);
            var CellIndex = obj.parentElement.cellIndex;
            var SaveXml = $get(MasterObj + "txtSaveXml").value;
            
            SetDate(TbObj, RowIndex, CellIndex);

            if (SaveXml == "") {
                SaveXml = '<ReportsEntity>' + MakeXML(TbObj, RowIndex, CellIndex) + "</ReportsEntity>"
            }
            else if (SaveXml != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(SaveXml);


                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/ReportsEntity/ModifyCreditInput[RowIndex=" + RowIndex + " and MID='" + TbObj.rows(RowIndex).cells(4).innerText + "']");

                if (oXmlNodes.length == 0) {
                    if (TbObj.rows(RowIndex).cells(10).firstChild.value != "0") {
                        SaveXml = SaveXml.replace("</ReportsEntity>", MakeXML(TbObj, RowIndex, CellIndex) + "</ReportsEntity>")
                    }
                }

                else if (oXmlNodes.length != 0) {
                    oXmlNodes.item(0).selectSingleNode("StartTime").text = TbObj.rows(RowIndex).cells(6).firstChild.value;
                    oXmlNodes.item(0).selectSingleNode("EndTime").text = TbObj.rows(RowIndex).cells(7).firstChild.value;
                    oXmlNodes.item(0).selectSingleNode("CreditType").text = TbObj.rows(RowIndex).cells(9).firstChild.value
                    oXmlNodes.item(0).selectSingleNode("Des").text = TbObj.rows(RowIndex).cells(10).firstChild.value;
                    SaveXml = oXmlDoc.xml;
                }
            }
            $get(MasterObj + "txtSaveXml").value = SaveXml;
        }

        function MakeXML(TbObj, RowIndex, CellIndex) {

            var SaveXml = "";
            var GridSDate = '', GridEDate = '';
            var Year = '';
            var Month = '';
            var Day = '';

            Year = TbObj.rows(RowIndex).cells(2).innerText.substring(6, 8);
            Month = TbObj.rows(RowIndex).cells(2).innerText.substring(3, 5);
            Day = TbObj.rows(RowIndex).cells(2).innerText.substring(0, 2);
            GridSDate = Day + "/" + Month + "/" + "13" + Year

            Year = TbObj.rows(RowIndex).cells(3).innerText.substring(6, 8);
            Month = TbObj.rows(RowIndex).cells(3).innerText.substring(3, 5);
            Day = TbObj.rows(RowIndex).cells(3).innerText.substring(0, 2);
            GridEDate = Day + "/" + Month + "/" + "13" + Year

            SaveXml += "<Tb>"
            SaveXml += "<RowIndex>" + RowIndex + "</RowIndex>"
            SaveXml += "<PersonCode>" + TbObj.rows(RowIndex).cells(4).innerText + "</PersonCode>"
            SaveXml += "<Type>" + TbObj.rows(RowIndex).CodeGroupID + "</Type>"
            SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
            SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
            SaveXml += "<CreditType>" + TbObj.rows(RowIndex).cells(9).firstChild.value + "</CreditType>"
            if (TbObj.rows(RowIndex).cells(6).firstChild.value == '00:00' && TbObj.rows(RowIndex).cells(7).firstChild.value == '00:00') {

                SaveXml += "<Daily>1</Daily>"
                SaveXml += "<StartTime>00:00</StartTime>"
                SaveXml += "<EndTime>00:00</EndTime>"
            }
            else {
                SaveXml += "<Daily>2</Daily>"
                SaveXml += "<StartTime>" + TbObj.rows(RowIndex).cells(6).firstChild.value + "</StartTime>"
                SaveXml += "<EndTime>" + TbObj.rows(RowIndex).cells(7).firstChild.value + "</EndTime>"
            }

            SaveXml += "<Des>" + TbObj.rows(RowIndex).cells(10).firstChild.value + "</Des>"
            SaveXml += "<PersonID>" + TbObj.rows(RowIndex).PersonelID + "</PersonID>"
            SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
            if ((GridSDate != GridEDate && TbObj.rows(RowIndex).cells(7).firstChild.value < TbObj.rows(RowIndex).cells(6).firstChild.value))
                SaveXml += "<_Flags>1</_Flags>";
            SaveXml += "</Tb>"
            return SaveXml;
        }

        function Pageunload() {
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.returnValue = "";
            window.close()
        }

        function OnClickBtnFilter() {
            var FromPersonCode = "";
            if ($get(MasterObj + "CmbFromPersonelInfo_txtCode").value != undefined)
                FromPersonCode = $get(MasterObj + "CmbFromPersonelInfo_txtCode").value.trim();
            $get(MasterObj + "txtFromPersonCode").value = FromPersonCode

            var ToPrsCode = "";
            if ($get(MasterObj + "CmbToPersonelInfo_txtCode").value != undefined)
                ToPrsCode = $get(MasterObj + "CmbToPersonelInfo_txtCode").value.trim();
            $get(MasterObj + "txtToPersonCode").value = ToPrsCode
            $get(MasterObj + "SDate").value = ReverceDate($get("TxtSDate").value);
            $get(MasterObj + "EDate").value = ReverceDate($get("TxtEDate").value);

            Search();
        }

        function Search() {
            

            var SDate,EDate,State,MainCode,FromPersonCode,ToPersonCode,CompanyID, SessionID;

            SDate = document.getElementById(MasterObj + 'SDate').value;
            EDate = document.getElementById(MasterObj + 'EDate').value;

            State = document.getElementById(MasterObj + 'cmbState').value;

            MainCode = document.getElementById(MasterObj + 'txtMainCode').value;

            FromPersonCode = document.getElementById(MasterObj + 'txtFromPersonCode').value;

            ToPersonCode = document.getElementById(MasterObj + 'txtToPersonCode').value;

            CompanyID = document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value;

            SessionID = document.getElementById(MasterObj + "txtSessionID").value;


            

            OpenModelPopup();
            $.ajax({
                type: "POST",
                url: "EnterCredit.aspx/GenerateGridXmlData?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{SDate:'" + SDate + "' , EDate:'" + EDate + "', State:'" + State + "' , MainCode:'" + MainCode + "' , FromPersonCode:'" + FromPersonCode + "' ,ToPersonCode:'" + ToPersonCode + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' }",
                success: function (Data) {

                    var xmlSave;

                    xmlSave = Data.d;


                    var x = 0;
                    var XmlWPInfo = "", XmlGrid = "";
                    x = xmlSave.search("</Tb></Root>");
                    x = x + 12;
                    XmlWPInfo = xmlSave.substring(0, x);
                    XmlGrid = xmlSave.substring(x, xmlSave.length);
                    XmlGrid = XmlGrid.replace(/_x0020_/g, "_");
                    var revStartDate = ReverceDate(SDate);
                    var revEndDate = ReverceDate(EDate);
                    
                    BindGrid(Grid, XmlGrid, XmlGridProperty, XmlGridSetting, "DataEntryEntity", SDate, revStartDate, EDate, revEndDate, document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value, document.getElementById(MasterObj + "txtSessionID").value, document.getElementById(MasterObj + "txtOnLineUser").value, "", "", null, arrGridEvent, 0, false);


                    CloseModelPopup();

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("با خطا مواجه شد" + jqXHR.responseText);
                    CloseModelPopup();
                }
            });
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            if (CreateXmlSave() && $get(MasterObj + "txtSaveXml").value != "<ReportsEntity></ReportsEntity>") {
                if (checkNotEmpty()) {
                    if ($get(MasterObj + "txtSaveXml").value != "GrdCredit") {
                        var StrXmlSave,CompanyID, SessionID,Extended;

                        StrXmlSave = $get(MasterObj + "txtSaveXml").value;

                        CompanyID = document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value;

                        SessionID = document.getElementById(MasterObj + "txtSessionID").value;

                        Extended = "";

                        SaveMode = 1;
                        OpenModelPopup();
                        $.ajax({
                            type: "POST",
                            url: "EnterCredit.aspx/SaveCredit?SubmitMode=Ajax",
                            contentType: "application/json; charset=utf-8",
                            data: "{XmlSave:'" + StrXmlSave + "' ,CompanyID:'" + CompanyID + "' ,SessionID:'" + SessionID + "' ,Extended:'" + Extended + "' }",
                            success: function (Data) {

                                var xmlSave;

                                xmlSave = Data.d;

                                var x = 0;
                                var XmlAlert = "";
                                x = xmlSave.search("</Tb></Root>");
                                x = x + 12;
                                XmlAlert = xmlSave.substring(0, x);
                                XmlModifyCredit = xmlSave.substring(x, xmlSave.length);

                                //alert(XmlModifyCredit)
                                var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                                xmlDoc.loadXML(XmlAlert)
                                xmlDoc.setProperty("SelectionLanguage", "XPath")
                                var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");

                                if (xmlNodes.length == 1) {
                                    document.getElementById(MasterObj + "txtAlert").value = xmlNodes.item(0).selectSingleNode("Alert").text;
                                    document.getElementById(MasterObj + "txtClosePage").value = xmlNodes.item(0).selectSingleNode("ClosePage").text;

                                    if ($get(MasterObj + "txtAlert").value != "") {

                                        alert($get(MasterObj + "txtAlert").value);
                                        $get(MasterObj + "txtAlert").value = ""

                                    }


                                    RefreshParentRow()
                                    if (document.getElementById(MasterObj + "txtClosePage").value == "1") {
                                        document.getElementById(MasterObj + "txtClosePage").value = 0
                                        window.close()
                                    }

                                }

                                CloseModelPopup();

                                $get(MasterObj + "txtSaveXml").value = "";
                                OnClickBtnFilter();
                                

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("با خطا مواجه شد" + jqXHR.responseText);
                                CloseModelPopup();
                            }
                        });
                    }

                    
                }
            }
            
        }

        function CreateXmlSave() {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            //var OGrid = document.getElementById("GrdCredit");
            var SaveXml = "<ReportsEntity>";
            var GridSDate = '', GridEDate = '';
            var Year = '';
            var Month = '';
            var Day = '';
            var TbObj;
            var flagDo = 0
            $get(MasterObj + "txtSaveXml").value = ""

            if (Body.rows.length>0)
                var len = Body.rows.length
            else
                return false

            for (var RowIndex = 0; RowIndex < len; RowIndex++) {
                if (Body.rows(RowIndex).cells(9).firstChild.value != 0 && Body.rows(RowIndex).cells(9).firstChild.value != ""
                && Body.rows(RowIndex).cells(9).firstChild.disabled != true
                ) {
                    flagDo = 1
                    
                    Year = Body.rows(RowIndex).cells(2).innerText.substring(6, 10);
                    Month = Body.rows(RowIndex).cells(2).innerText.substring(3, 5);
                    Day = Body.rows(RowIndex).cells(2).innerText.substring(0, 2);
                    GridSDate = Year + "/" + Month + "/" + Day

                    Year = Body.rows(RowIndex).cells(3).innerText.substring(6, 10);
                    Month = Body.rows(RowIndex).cells(3).innerText.substring(3, 5);
                    Day = Body.rows(RowIndex).cells(3).innerText.substring(0, 2);
                    GridEDate = Year + "/" + Month + "/" + Day
//                    + "<Type>" + $(Row).find("td:eq(2)").children().val() + "</Type>"
//                    + "<StartDate>" + SDate.split("/")[0].trim() + "/" + SDate.split("/")[1] + "/" + SDate.split("/")[2] + "</StartDate>"
//                    + "<EndDate>" + EDate.split("/")[0].trim() + "/" + EDate.split("/")[1] + "/" + EDate.split("/")[2] + "</EndDate>"
//                    + "<CreditType>" + $(Row).find("td:eq(8)").children().attr("CodeID") + "</CreditType>"
//                    + "<StartTime>" + $(Row).find("td:eq(5)").children().val() + "</StartTime>"
//                    + "<EndTime>" + $(Row).find("td:eq(6)").children().val() + "</EndTime>"
//                    + "<Daily>" + (($(Row).find("td:eq(5)").children().val() == "00:00" && $(Row).find("td:eq(6)").children().val()=="00:00"):"1";"2") + "</Daily>"
//                    + "<Des>" + $(Row).find("td:eq(9)").children().val() + "</Des>"
//                    + "<UserPersonelID>" + $("#" + MasterObj + "txtOnLineUser").val() + "</UserPersonelID>"
//                    + "<CreditID>" + $(Row).attr("creditid") + "</CreditID>"
//                    + "<RowIndex>" + $(Row).attr("RowIndex") + "</RowIndex>"
//                    + "<JPersonelID></JPersonelID>"
//                    + "<MID>" + $(Row).attr("pcode") + "</MID>"
//                    + "<MType>U</MType>"
//                    +"<Extended></Extended>"
                    SaveXml += "<ModifyCreditInput>"
                    SaveXml += "<Type>" + Body.rows(RowIndex).CodeGroupID + "</Type>"
                    SaveXml += "<StartDate>" + GridSDate + "</StartDate>"
                    SaveXml += "<EndDate>" + GridEDate + "</EndDate>"
                    SaveXml += "<CreditType>" + Body.rows(RowIndex).cells(9).firstChild.value + "</CreditType>"
                    if (Body.rows(RowIndex).cells(6).firstChild.value == '00:00' && Body.rows(RowIndex).cells(7).firstChild.value == '00:00') {

                        
                        SaveXml += "<StartTime>00:00</StartTime>"
                        SaveXml += "<EndTime>00:00</EndTime>"
                        SaveXml += "<Daily>1</Daily>"
                        
                    }
                    else {
                        SaveXml += "<StartTime>" + Body.rows(RowIndex).cells(6).firstChild.value + "</StartTime>"
                        SaveXml += "<EndTime>" + Body.rows(RowIndex).cells(7).firstChild.value + "</EndTime>"
                        SaveXml += "<Daily>2</Daily>"
                        
                    }

                    SaveXml += "<Des>" + Body.rows(RowIndex).cells(10).firstChild.value + "</Des>"
//                    SaveXml += "<UserPersonelID>" + $get(MasterObj + "txtOnLineUser").value + "</UserPersonelID>"
                    SaveXml += "<CreditID>0</CreditID>"
                    SaveXml += "<RowIndex>" + (parseInt(RowIndex, 10)) + "</RowIndex>"
                    SaveXml += "<JPersonelID>0</JPersonelID>"
                    //SaveXml += "<PersonCode>" + Body.rows(RowIndex).cells(4).innerText + "</PersonCode>"

                    SaveXml += "<MID>" + Body.rows(RowIndex).cells(4).innerText + "</MID>"
                    SaveXml += "<MType>U</MType>";
                    SaveXml += "<Extended></Extended>";
                    SaveXml += "<SerialNo></SerialNo>";
//                    if (((GridSDate != GridEDate && Body.rows(RowIndex).cells(7).firstChild.value < Body.rows(RowIndex).cells(6).firstChild.value)))
//                        SaveXml += "<_Flags>1</_Flags>";
                    SaveXml += "</ModifyCreditInput>"
                }

            }
            SaveXml += "</ReportsEntity>"
            $get(MasterObj + "txtSaveXml").value = SaveXml

            if (flagDo == 0)//هیچ سطری عوض نشده است
                return false

            if (len > 0)
                return true
            else
                return false

        }

        function onblurtxtTime(obj) {
            var oRow = obj;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement

            if (oRow.cells(6).firstChild.value == "") {
                oRow.cells(6).firstChild.value = "00:00"
                oRow.cells(6).firstChild.select()
            }
            if (oRow.cells(7).firstChild.value == "") {
                oRow.cells(7).firstChild.value = "00:00"
                oRow.cells(6).firstChild.select()
            }
            if ((oRow.cells(6).firstChild.value == "00:00") && (oRow.cells(7).firstChild.value == "00:00")) {
                oRow.cells(8).innerText = "کامل"
                return;
            }
            var STime = GetMinute(oRow.cells(6).firstChild.value)
            var ETime = GetMinute(oRow.cells(7).firstChild.value)
            if (STime > ETime) {
                ETime = ETime + 1440;
            }
            var VTime = parseInt(ETime) - parseInt(STime)
            oRow.cells(8).innerText = GetTime(VTime)



        }
        //        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function GetTime(minute) {

            var hour = minute / 60
            hour = parseInt(hour, 10)
            var min = minute % 60
            min = parseInt(min, 10)
            var time = ""
            if (hour < 10) {
                time = "0" + hour + ":"
            }
            else {
                time = hour + ":"
            }
            if (min < 10) {
                time += "0" + min
            }
            else {
                time += min
            }
            return time
        }
        //        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function GetMinute(time) {
            if (time == "")
                return 0
            var arr
            arr = time.split(":")
            arr[0] = parseInt(arr[0], 10)
            arr[1] = parseInt(arr[1], 10)
            return (arr[0] * 60 + arr[1])
        }
        //        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onfocusTxtTime(obj) {
            obj.select();
            obj.focus();
            lastValue = obj.value
        }

        function checkNotEmpty() {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            var TbObj = Body;
            var SaveXml = $get(MasterObj + "txtSaveXml").value;

            if (SaveXml != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(SaveXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/ReportsEntity/ModifyCreditInput");

                for (var i = 0; i < oXmlNodes.length; i++) {
                    var RowIndex = parseInt(oXmlNodes.item(0).selectSingleNode("RowIndex").text)
                    if (oXmlNodes.item(0).selectSingleNode("StartTime").text > oXmlNodes.item(0).selectSingleNode("EndTime").text
                && oXmlNodes.item(0).selectSingleNode("StartDate").text == oXmlNodes.item(0).selectSingleNode("EndDate").text) {
                        alert("زمان شروع بايد کوچکتر از زمان خاتمه باشد")
                        TbObj.rows(RowIndex).cells(6).firstChild.focus()
                        return false
                    }
                    else if (oXmlNodes.item(0).selectSingleNode("CreditType").text == "0") {
                        alert(" لطفا نوع مجوز را انتخاب نماييد")
                        TbObj.rows(RowIndex).cells(9).firstChild.focus()
                        return false
                    }
                }
            }
            else {
                alert("هيچ آيتمی جهت ذخيره انتخاب نشده")
                return false
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        function OnClickGrd(SelectedRow) {
//            if (LastSelectedRow != null) {
//                LastSelectedRow.className = LastSelectedRowClass;
//            }
//            LastSelectedRowClass = SelectedRow.className;
//            LastSelectedRow = SelectedRow;
//            SelectedRow.className = "CssSelectedItemStyle";
//        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickRdSelectCredit(obj) {
//            var SelectedRow = obj.parentElement.parentElement;
//            var OGrid = document.getElementById("GrdCreditRd");

//            for (var i = 1; i < OGrid.rows.length; i++) {
//                if (OGrid.rows(i).cells(1).firstChild.checked == true)
//                    OGrid.rows(i).cells(1).firstChild.checked = false;
//            }
//            OGrid.rows(SelectedRow.rowIndex).cells(1).firstChild.checked = true;
        }

        function checkEnter(obj) {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            var Header = Grid.getElementsByTagName('thead')['ColumnHeader'];
            //            var TbObj = obj.parentElement.parentElement.parentElement;
            //            if (TbObj.tagName != "Table")
            //                TbObj = obj.parentElement.parentElement.parentElement.parentElement;


            
            var RowIndex = parseInt(obj.parentElement.parentElement.rowIndex, 10) - parseInt(Header.rows.length, 10);

            var row = obj.parentElement.parentElement;
            
            

            var str = "";
            if (Body.rows.length>0) {
                if (window.event.keyCode == 13) {

                    if ($get(MasterObj + "txtAdminCredit").value == "1") {
                        for (var i = 0; i < Body.rows.length; i++) {
                            if (Body.rows(i).className == "CssSelectedItemStyle") {
                                str = Body.rows(i).cells(3).firstChild.value
                                + "#" + Body.rows(i).cells(4).firstChild.value + "#" + Body.rows(i).cells(2).innerText;
                            }
                        }
                    }
                    window.returnValue = str;
                    window.close();
                }
                if (window.event.keyCode == 40) {
                    var rowIndex = parseInt(RowIndex) + 1;

                    if (row.parentElement.rows(rowIndex) != null) {
                        Body.rows(rowIndex).cells(3).firstChild.focus();
                        SelectGridRow(Body.rows(rowIndex));
                    }
                }
                if (window.event.keyCode == 38) {
                    var rowIndex = parseInt(RowIndex) - 1;
                    if (rowIndex != 0) {
                        Body.rows(rowIndex).cells(3).firstChild.focus();
                        SelectGridRow(Body.rows(rowIndex));
                    }
                }
                if (window.event.keyCode == 27) {
                    window.returnValue = "";
                    window.close();

                }
            }
        }
        //========================================================
        function onchangeCmbCreditType() {
            document.getElementById(MasterObj + "txtMainCode").value = document.getElementById(MasterObj + "CmbCodeType").value;

        }
        function OnClickBtnCardexInfo() {
            var PersonID = $get(MasterObj + "CmbFromPersonelInfo_txtCode").value
            var url2 = "../Cardex/CardexReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                + "&PersonCode=" + PersonID
                + "&WPID=" + document.getElementById(MasterObj + "txtWPID").value
            var winPro = "dialogHeight: 760px;dialogWidth: 950px;center: Yes;help: no;status: no";
            var CardexInfoDialogObj = window.showModalDialog(encodeURI(url2), window, winPro)
        }
        //==========================================================
        function OnClickbtnCopy() {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            //var OGrid = document.getElementById("GrdCredit");
            var OldVal;
            if (Body.rows.length != null)
                for (var i = 0; i < Body.rows.length; i++) {
                    OldVal = Body.rows(i).cells(9).childNodes(0).value;
                    Body.rows(i).cells(9).childNodes(0).value = document.getElementById(MasterObj + "cmbDfaultCredit").value;
                    if (Body.rows(i).cells(9).childNodes(0).value != document.getElementById(MasterObj + "cmbDfaultCredit").value)
                        Body.rows(i).cells(9).childNodes(0).value = OldVal;
                    else
                        Body.rows(i).cells(10).childNodes(0).value = document.getElementById(MasterObj + "txtDefaultDesc").value;
                }
        }

        function OnClickBtnStatus() {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            var Header = Grid.getElementsByTagName('thead')['ColumnHeader'];
            //            var TbObj = obj.parentElement.parentElement.parentElement;
            //            if (TbObj.tagName != "Table")
            //                TbObj = obj.parentElement.parentElement.parentElement.parentElement;
            var obj = event.srcElement;
            

            var RowIndex = parseInt(obj.parentElement.parentElement.rowIndex, 10) - parseInt(Header.rows.length, 10);

            var obj = event.srcElement;
            //var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            //var OGrid = document.getElementById("GrdCredit");
            var Row = obj.parentElement.parentElement;
            //var RowIndex = Row.rowIndex;
            var WfNew = Body.rows(RowIndex).getAttribute("WfNew");
            var WfDocID = Body.rows(RowIndex).getAttribute("WfDocID");
            var DocID = Body.rows(RowIndex).getAttribute("CreditID");
            if (WfNew == 1) {
                window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WfDocID + "&DocID=" + DocID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
            }
            else
                window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId=" + WfDocID + "&DocId=" + DocID, "", "dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")
        }
        //=========================================================
        function window.onbeforeunload() {
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];
            if (GridName == "GrdCreditRd") {
                if ($("#GrdCredit").find("tr").length > 0)
                    if ($("#GrdCredit").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != true }).length > 0)
                        return "آيا مايل به بستن فرم هستيد؟";
            }
            if (GridName == "GrdCredit") {
                if ($("#GrdCredit").find("tr").length > 0) {
                    if ($("#GrdCredit").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != disabled }).length > 0)
                        return "آيا مايل به بستن فرم هستيد؟";
                }
            }
//            if ($("#GrdCreditRd").find("tr").length > 0)
//                if ($("#GrdCreditRd").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != true }).length > 0)
//                    return "آيا مايل به بستن فرم هستيد؟";
//            if ($("#GrdCredit").find("tr").length > 0) {
//                if ($("#GrdCredit").find("tr").find("td:eq(8)").find("SELECT").filter(function () { return $(this).val() != 0 && $(this).attr("disabled") != disabled }).length > 0)
//                    return "آيا مايل به بستن فرم هستيد؟";
//            }
        }

        /***********************End Script**************/
//        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
//        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

//        function BeginRequestHandler(sender, args) {
//            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
//        }

//        function EndRequestHandler(sender, args) {

//            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";

//            var StrVal = $get(MasterObj + "txtSubmit").value
//            if ($get(MasterObj + "txtAlert").value != "") {

//                alert($get(MasterObj + "txtAlert").value);
//                $get(MasterObj + "txtAlert").value = ""

//            }
//            $get(MasterObj + "txtSubmit").value = "";
//            $get(MasterObj + "txtSaveXml").value = "";

//            if (StrVal == "Save") {
//                RefreshParentRow()
//                if (document.getElementById(MasterObj + "txtClosePage").value == "1") {
//                    document.getElementById(MasterObj + "txtClosePage").value = 0
//                    window.close()
//                }
//            }

        //        }


//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//        //**********************************************************************************************

//        //==========================================================
       
//        /******************************************************/
//        function shdAdd(Sdate, days) {
//            if (!Isvaliddate(Sdate))
//                return false
//            days = parseInt(days)
//            if (days != 0)
//                return (InttoSHD1(this.SHDtoInt1(Sdate) + days))
//            else
//                return Sdate
//        }
//        /******************************************************/
//        function Isvaliddate(txt) {
//            var le, t1, t2, sal, mah, roz
//            var arr1, arr2, arr3
//            var x = 0
//            while (x < getCntChar('/', txt + "/")) {
//                arr1 = getArray(txt + "/", x, '/')
//                ++x
//                arr2 = getArray(txt + "/", x, '/')
//                ++x
//                arr3 = getArray(txt + "/", x, '/')
//                ++x
//            }
//            if (getCntChar('/', txt) == 2) {
//                roz = arr3
//                mah = arr2
//                sal = arr1

//                le = 0
//                if (sal < 100)
//                    sal = sal + 1300


//                if (isshleap(sal))
//                    le = 1
//                t1 = ((mah >= 1) && (mah <= 12))
//                t2 = ((roz >= 1) && (roz <= 29 + le))
//                t2 = (t2 || ((roz == 30) && ((mah >= 1) && (mah <= 11))))
//                t2 = (t2 || ((roz == 31) && ((mah >= 1) && (mah <= 6))))

//                return (t1 && t2)
//            }
//            else {
//                return false
//            }
//        }
//        /******************************************************/
//        function InttoSHD1(roz) {
//            var leap, Esal, sal, mahbase, tag

//            sal = 0
//            mah = 0
//            leap = 0
//            tag = 0
//            Esal = 0

//            do {
//                roz = roz + 36159
//                sal = sal - 99
//            } while (roz < 00000)

//            do {
//                roz = roz - 36159
//                sal = sal + 99
//            } while (roz > 36158)
//            if ((roz != 10591) && (roz != 22644) && (roz != 36158)) {
//                if ((roz >= 00000) && (roz <= 10225)) {
//                    tag = 1
//                    Esal = 0
//                    mahbase = 00000
//                }
//                if ((roz >= 10226) && (roz <= 10590)) {
//                    tag = 2
//                    Esal = 1
//                    mahbase = 10226
//                }
//                if ((roz >= 10592) && (roz <= 22278)) {
//                    tag = 3
//                    Esal = 1
//                    mahbase = 10592
//                }
//                if ((roz >= 22279) && (roz <= 22643)) {
//                    tag = 4
//                    Esal = 2
//                    mahbase = 22279
//                }
//                if ((roz >= 22645) && (roz <= 35792)) {
//                    tag = 5
//                    Esal = 2
//                    mahbase = 22645
//                }
//                if ((roz >= 35793) && (roz <= 36157)) {
//                    tag = 6
//                    Esal = 3
//                    mahbase = 35793
//                }
//            }
//            else if (roz == 10591) //1342/12/30
//            {
//                roz = 365
//                sal = sal + 1342
//            }
//            else if (roz == 22644) //1375/12/30
//            {
//                roz = 365
//                sal = sal + 1375
//            }
//            else if (roz == 36158) //1412/12/30
//            {
//                roz = 365
//                sal = sal + 1412
//            }
//            if (((tag % 2) == 1) && (((roz - mahbase + 1) % 1461) == 0)) {
//                roz = roz - 1
//                leap = 1
//            }

//            if (tag > 0) {
//                roz = roz - Esal * 365
//                roz = roz - parseInt(roz / 1461)
//                sal = Esal + sal + parseInt(roz / 365) + 1314
//                roz = roz % 365 + leap
//            }

//            if (roz >= 186) {
//                roz = roz - 186
//                mah = 6 + parseInt(roz / 30)
//                roz = roz % 30
//            }
//            else {
//                mah = parseInt(roz / 31)
//                roz = roz % 31
//            }
//            return datechk(sal + "/" + (mah + 1) + "/" + (roz + 1))
//        }
//        /******************************************************/
//        function datechk(val) {
//            if ((val != "") && !Isvaliddate(val)) {
//                alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
//                return false
//            }
//            else
//                if (val != "") {
//                    var arr1, arr2, arr3
//                    var x = 0
//                    while (x < getCntChar('/', val + "/")) {
//                        arr1 = getArray(val + "/", x, '/')
//                        ++x
//                        arr2 = getArray(val + "/", x, '/')
//                        ++x
//                        arr3 = getArray(val + "/", x, '/')
//                        ++x
//                    }
//                    arr1 = arr1
//                    arr2 = arr2
//                    arr3 = arr3

//                    if (arr1 < 100)
//                        century = "13"
//                    else
//                        century = ""

//                    if (arr2 < 10)
//                        val = century + "" + arr1 + "/0" + arr2
//                    else
//                        val = century + "" + arr1 + "/" + arr2

//                    if (arr3 < 10)
//                        val += "/0" + arr3
//                    else
//                        val += "/" + arr3
//                    return val
//                }
//        }
//        /******************************************************/
//        function SHDtoInt1(shd) {

//            var sal, mah, roz, Tr
//            var arr1, arr2, arr3


//            var x = 0
//            while (x < getCntChar('/', shd + "/")) {

//                arr1 = getArray(shd + "/", x, '/')
//                ++x
//                arr2 = getArray(shd + "/", x, '/')
//                ++x
//                arr3 = getArray(shd + "/", x, '/')
//                ++x
//            }

//            if (getCntChar('/', shd) == 2) {
//                roz = arr3 - 1
//                mah = arr2 - 1
//                sal = arr1
//                Tr = 0

//                if (sal < 100)
//                    sal = 1300 + sal

//                sal = sal - 1314

//                while (sal < 0) {
//                    Tr = Tr - 36159 - 366
//                    sal = sal + 100
//                }

//                while (sal > 98) {
//                    Tr = Tr + 36159
//                    sal = sal - 99
//                }

//                if ((sal >= 0) && (sal <= 27))
//                    Tr = Tr + sal * 365 + parseInt(sal / 4)

//                if ((sal >= 28) && (sal <= 60))
//                    Tr = Tr + sal * 365 + parseInt((sal - 1) / 4)

//                if ((sal >= 61) && (sal <= 97))
//                    Tr = Tr + sal * 365 + parseInt((sal - 2) / 4)

//                if (sal == 98)
//                    Tr = Tr + sal * 365 + parseInt((sal - 3) / 4)


//                if (mah > 6)
//                    Tr = Tr + (mah - 6) * 30 + 186
//                else
//                    Tr = Tr + mah * 31

//                return (Tr + roz)

//            }
//            else {
//                alert("اشكال در تاريخ شمسي")
//                return 0
//            }

//        }
//        /******************************************************/
//        function isshleap(sal) {
//            var ybase_sh, L1

//            if (sal < 100)
//                sal = sal + 1300


//            ybase_sh = parseInt((sal - 125) / 99) * 99 + 125


//            L1 = ((sal - ybase_sh) % 99)
//            if (L1 >= 98)
//                return (((L1 - 89) % 4) == 0)
//            else {
//                if (L1 >= 61)
//                    return (((L1 - 62) % 4) == 0)
//                else
//                    if (L1 >= 28)
//                        return (((L1 - 29) % 4) == 0)
//                    else
//                        return ((L1 % 4) == 0)
//                }
//            }
        //            /******************************************************/

        function Grid_RowDataBound(oGrid) {
            var Header = Grid.getElementsByTagName('thead')['ColumnHeader'];
            var Body = Grid.getElementsByTagName('tbody')['ColumnData'];

            
            var RowNumber = 0;
            var Rd = 0;
            var Daily = false;
            var Timely = false;
            if (GridName == "GrdCredit") {
                for (var i = 0; i < Body.rows.length; ++i) {
                    if (Body.rows[i].Code != "0") {

                        Body.rows[i].cells[6].firstChild.disabled = true;
                        Body.rows[i].cells[7].firstChild.disabled = true;
                        Body.rows[i].cells[9].firstChild.disabled = true;
                        Body.rows[i].cells[10].firstChild.disabled = true;

                    }

                    Body.rows[i].cells[2].setAttribute('RealVal', Body.rows[i].RSDate);
                    
                    
                    //Combo
                    var Filter = "";
                    if ((Body.rows[i].cells[6].firstChild.value == "00:00" && Body.rows[i].cells[7].firstChild.value == "00:00") || (Body.rows[i].cells[6].firstChild.value == "" && Body.rows[i].cells[7].firstChild.value == "")) {
                        Filter = "Daily=1";
                        Body.rows[i].cells[6].firstChild.disabled = true;
                        Body.rows[i].cells[7].firstChild.disabled = true;
                        Daily = true;
                    }
                    else {
                        Filter = "Timely=1";
                        Timely = true;
                    }

                    var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                    xmlDoc.loadXML(document.getElementById(MasterObj + 'TxtXmlCreditType').value)
                    xmlDoc.setProperty("SelectionLanguage", "XPath")
                    var xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission[" + Filter + "]");

                    if (Body.rows[i].Code != "0") {
                        xmlNodes = xmlDoc.documentElement.selectNodes("/DataEntryEntity/CodePermission");
                    }

                    if (xmlNodes.length > 0) {
                        for (var j = 0; j < xmlNodes.length; ++j) {
                            var option = document.createElement("option");
                            option.text = xmlNodes.item(j).selectSingleNode('CodeName').text;
                            option.value = xmlNodes.item(j).selectSingleNode('CodeID').text;
                            Body.rows[i].cells[9].firstChild.add(option);

                            Body.rows[i].cells[9].firstChild.value = Body.rows[i].Code;


                        }

                        if (Body.rows[i].Code != "0") {
                            Body.rows[i].cells[9].firstChild.disabled = true;
                        }
                    }

                    //TestBox Time
                    Body.rows[i].cells[6].firstChild.attachEvent("onblur", TxtTime_OnBlur);
                    Body.rows[i].cells[7].firstChild.attachEvent("onblur", TxtTime_OnBlur);

                    Body.rows[i].cells[6].firstChild.attachEvent("onkeydown", TxtTime_OnKeyDown);
                    Body.rows[i].cells[7].firstChild.attachEvent("onkeydown", TxtTime_OnKeyDown);

                    Body.rows[i].cells[7].firstChild.attachEvent("onfocus", TxtTime_OnFocus);

                    //TextBox Description
                    Body.rows[i].cells[10].firstChild.attachEvent("onblur", TxtDescription_OnBlur);

                    Header.rows[0].cells[1].innerText = "";
                    Header.rows[0].cells[1].title = "وضعيت";

                    Body.rows[i].cells[1].align = "center";
                    Body.rows[i].cells[1].firstChild.style.width = "18px";
                    Body.rows[i].cells[1].firstChild.style.height = "18px";
                    switch (Body.rows[i].StatusID) {
                        case "3":
                            Body.rows[i].cells[1].firstChild.src = "../../App_Utility/Images/Icons/BlueTick.gif";
                            Body.rows[i].cells[1].firstChild.title = "تائید";

                            Body.rows[i].cells[1].firstChild.style.cursor = "pointer";
                            Body.rows[i].cells[1].firstChild.attachEvent("onclick", OnClickBtnStatus);
                            
                            break;
                        case "4":
                        case "5":
                            Body.rows[i].cells[1].firstChild.src = "../../App_Utility/Images/Icons/Cross.gif";
                            Body.rows[i].cells[1].firstChild.title = "عدم تائید";

                            Body.rows[i].cells[1].firstChild.style.cursor = "pointer";
                            Body.rows[i].cells[1].firstChild.attachEvent("onclick", OnClickBtnStatus);
                            break;
                        case "1":
                            Body.rows[i].cells[1].firstChild.src = "../../App_Utility/Images/Icons/default_phase_icon.gif";
                            Body.rows[i].cells[1].firstChild.title = "در گردش";

                            Body.rows[i].cells[1].firstChild.style.cursor = "pointer";
                            Body.rows[i].cells[1].firstChild.attachEvent("onclick", OnClickBtnStatus);
                            break;
                        default:
                            Body.rows[i].cells[1].firstChild.src = "../../App_Utility/Images/Icons/Blank.gif";
                            Body.rows[i].cells[1].firstChild.title = "";

                            if (SaveMode == 1) {
                                if (XmlModifyCredit != "") {

                                    //alert(XmlModifyCredit)
                                    var xmlDocM = new ActiveXObject("MsXml2.DomDocument")
                                    xmlDocM.loadXML(XmlModifyCredit)
                                    xmlDocM.setProperty("SelectionLanguage", "XPath")
                                    var xmlNodesM;
                                    xmlNodesM = xmlDocM.documentElement.selectNodes("/ReportsEntity/ModifyCredit[ResultId=1][RowIndex<=" + RowNumber + "]");

                                    Rd = RowNumber + xmlNodesM.length;

                                    xmlNodesM = xmlDocM.documentElement.selectNodes("/ReportsEntity/ModifyCredit[ResultId!=1][RowIndex=" + Rd + "]");

                                    if (xmlNodesM.length == 1) {

                                        Body.rows[Rd].cells[1].innerHTML = "<img src='/TAPresentation/App_Utility/Images/Icons/Error.ico' title='" + xmlNodesM.item(0).selectSingleNode("StrResult").text + "' style='width:18px;height:18px;'>";
                                        //Body.rows[xmlNodesM.item(0).selectSingleNode("RowIndex").text].cells[1].innerHTML = "<img src='/TAPresentation/App_Utility/Images/Icons/Error.ico' title='" + xmlNodesM.item(0).selectSingleNode("StrResult").text + "' style='width:18px;height:18px;'>";
                                    }

                                }
                            }
                            ++RowNumber;

                            //SaveMode = 0;


                            break;
                    }
                }

                document.getElementById(MasterObj + "cmbDfaultCredit").innerHTML = "";

                

                var xmlDocCT = new ActiveXObject("MsXml2.DomDocument")
                xmlDocCT.loadXML(document.getElementById(MasterObj + 'TxtXmlCreditType').value)
                xmlDocCT.setProperty("SelectionLanguage", "XPath")
                var xmlNodesCT = xmlDocCT.documentElement.selectNodes("/DataEntryEntity/CodePermission[Daily=0][Timely=0]");
                
                if (xmlNodesCT.length > 0) {
                    for (var k = 0; k < xmlNodesCT.length; ++k) {
                        var option = document.createElement("option");
                        option.text = xmlNodesCT.item(k).selectSingleNode('CodeName').text;
                        option.value = xmlNodesCT.item(k).selectSingleNode('CodeID').text;
                        document.getElementById(MasterObj + "cmbDfaultCredit").add(option);

                        
                    }
                }

                if (Daily) {
                    xmlNodesCT = xmlDocCT.documentElement.selectNodes("/DataEntryEntity/CodePermission[Daily=1]");

                    if (xmlNodesCT.length > 0) {
                        for (var k = 0; k < xmlNodesCT.length; ++k) {
                            var option = document.createElement("option");
                            option.text = xmlNodesCT.item(k).selectSingleNode('CodeName').text;
                            option.value = xmlNodesCT.item(k).selectSingleNode('CodeID').text;
                            document.getElementById(MasterObj + "cmbDfaultCredit").add(option);


                        }
                    }
                }

                if (Timely) {
                    xmlNodesCT = xmlDocCT.documentElement.selectNodes("/DataEntryEntity/CodePermission[Timely=1]");

                    if (xmlNodesCT.length > 0) {
                        for (var k = 0; k < xmlNodesCT.length; ++k) {
                            var option = document.createElement("option");
                            option.text = xmlNodesCT.item(k).selectSingleNode('CodeName').text;
                            option.value = xmlNodesCT.item(k).selectSingleNode('CodeID').text;
                            document.getElementById(MasterObj + "cmbDfaultCredit").add(option);


                        }
                    }
                }
                
            }
            else if (GridName == "GrdCreditRd") {

            }

            SaveMode = 0;
        }

        function TxtTime_OnBlur() {
            var Handle = event.srcElement;
            Timechk(Handle);
            onblurtxtTime(Handle);
            ModifyXMLCredit(Handle);
        }

        function TxtTime_OnKeyDown() {
            var Handle = event.srcElement;

            OnKeyDownTime(Handle.value);
        }

        function TxtTime_OnFocus() {
            var Handle = event.srcElement;
            onfocusTxtTime(Handle);
        }

        function TxtDescription_OnBlur() {
            var Handle = event.srcElement;
            
            ModifyXMLCredit(Handle)
        }
        /***************************************KasraJSGrid******************************************/
        var HeaderCssClass, AlternatingCssClass, ItemCssClass, FooterCssClass;
        var TableName = "";
        var TempGrid;
        var GridPageSize = 0;
        var GridName = "GrdCredit";

        function SetPaging(oGrid, PageNumber, GridData) {

            var PageSize = GridPageSize;
            var AllowSend = false;
            var Send = document.getElementById('TdGridSend');

            if (Send.style.display == "inline")
                AllowSend = true;

            var Pager = document.getElementById('TdGridPager');

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(GridData)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/"+DataSetName+"/" + TableName);
            var RecordCount = parseInt(xmlNodes.length, 10) - 1;

            if (PageSize == 0 || PageSize == '' || PageSize == null || PageSize == undefined) {
                PageSize = 0;
                document.getElementById('TxtGridCurPage').value = "";
                document.getElementById('TxtGridTotalPage').value = "";
                document.getElementById('TxtGridFromData').value = "";
                document.getElementById('TxtGridToData').value = "";
                document.getElementById('TxtGridTotalData').value = "";

                Pager.style.display = "none";

                if (xmlNodes.length == 0) {
                    document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


                    Send.style.display = "none";
                }
            }
            else {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                xmlDoc.loadXML(GridData)
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                var xmlNodes = xmlDoc.documentElement.selectNodes("/"+DataSetName+"/" + TableName);

                var RecordCount = parseInt(xmlNodes.length, 10) - 1;

                var TotalPage, MaxNumber;
                if (xmlNodes.length > 0) {
                    TotalPage = xmlNodes.item(0).selectSingleNode('TotalPage').text;
                    MaxNumber = xmlNodes.item(0).selectSingleNode('MaxNumber').text;
                    PageNumber = xmlNodes.item(0).selectSingleNode('PageNumber').text;

                    var FromData, ToData;
                    FromData = (PageSize * (PageNumber - 1)) + 1;
                    ToData = (PageSize * (PageNumber - 1)) + RecordCount;

                    document.getElementById('TxtGridCurPage').value = PageNumber;
                    document.getElementById('TxtGridTotalPage').value = TotalPage;
                    document.getElementById('TxtGridFromData').value = FromData;
                    document.getElementById('TxtGridToData').value = ToData;
                    document.getElementById('TxtGridTotalData').value = MaxNumber;
                    document.getElementById('TdGridMessage').innerText = "";

                    if (TotalPage <= 1) {

                        Pager.style.display = "none";

                        if (AllowSend) {
                            document.getElementById('ImgSendExcelAll').style.display = "none";
                            document.getElementById('ImgSendPDFAll').style.display = "none";
                        }
                    }
                }
                else {
                    document.getElementById('TxtGridCurPage').value = "";
                    document.getElementById('TxtGridTotalPage').value = "";
                    document.getElementById('TxtGridFromData').value = "";
                    document.getElementById('TxtGridToData').value = "";
                    document.getElementById('TxtGridTotalData').value = "";
                    document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


                    Pager.style.display = "none";

                    if (xmlNodes.length == 0) {
                        document.getElementById('TdGridMessage').innerText = "اطلاعاتي جهت نمايش وجود ندارد";


                        Send.style.display = "none";
                    }
                }



            }
        }
        function BindGrid(oGrid, GridData, GridProperty, GridSetting,DataSetName, SDate, RSDate, EDate, REDate, CompanyID, SessionID, OnLineUserId, DataReplace, FooterRow, GridRow_ClientOnClick, ArrEvent, ArrEventCount, AllowSend) {
            var PageNumber;

            

            TempGrid = oGrid;
            var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
            var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
            var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];


            if (Header.rows.length > 0) {
                for (var h = Header.rows.length - 1; h >= 0; --h) {
                    Header.deleteRow(h);
                }
            }

            if (Body.rows.length > 0) {
                for (var b = Body.rows.length - 1; b >= 0; --b) {
                    Body.deleteRow(b);
                }
            }

            if (Footer.rows.length > 0) {
                for (var f = Footer.rows.length - 1; f >= 0; --f) {
                    Footer.deleteRow(f);
                }
            }


            if (GridProperty != "") {
                SetGridProperty(oGrid, GridProperty, AllowSend);
                
            }

            if (GridSetting != "") {
                SetGridSetting(oGrid, GridSetting);
                
            }
            

            if (GridPageSize == "0" || GridPageSize == "") {
                GridPageSize = 0;
            }
            else {
                GridPageSize = parseInt(GridPageSize, 10);
            }


            

            if (GridData != "") {

                var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
                var Body = oGrid.getElementsByTagName('tbody')['ColumnData'];
                var Footer = oGrid.getElementsByTagName('tfoot')['ColumnFooter'];

                var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
                xmlDoc.loadXML(GridData)
                xmlDoc.setProperty("SelectionLanguage", "XPath")
                
                
                var xmlNodes = xmlDoc.documentElement.selectNodes("/"+DataSetName+"/" + TableName);



                var CellValue = "";
                var IsFooter = false;
                var oRow;
                if (xmlNodes.length > 0) {
                    if (xmlNodes.item(i).selectSingleNode('PageNumber') != null) {
                        if (xmlNodes.item(i).selectSingleNode('PageNumber').text != "0" && xmlNodes.item(i).selectSingleNode('PageNumber').text != "0") {
                            PageNumber = parseInt(xmlNodes.item(i).selectSingleNode('PageNumber').text, 10);
                        }
                        else {
                            PageNumber = 1;
                        }
                    }
                    for (var i = 0; i < xmlNodes.length; ++i) {
                        IsFooter = false;
                        if (FooterRow != "") {
                            var FooterRowArr = FooterRow.split('@');


                            if (FooterRowArr.length > 0) {
                                for (var f = 0; f < FooterRowArr.length; ++f) {

                                    if (xmlNodes.item(i).selectSingleNode(FooterRowArr[f].split(';')[0]) != null) {
                                        if (xmlNodes.item(i).selectSingleNode(FooterRowArr[f].split(';')[0]).text == FooterRowArr[f].split(';')[1]) {
                                            IsFooter = true;
                                        }
                                    }
                                }
                            }
                        }

                        if (IsFooter) {
                            oRow = Footer.insertRow();
                            oRow.style.height = "20px";
                            var FRadifCell = oRow.insertCell();
                            FRadifCell.style.width = "30px";
                            FRadifCell.innerText = '';
                            FRadifCell.style.backgroundColor = "#006699";
                            FRadifCell.style.color = "#FFFF00";
                        }
                        else {
                            oRow = Body.insertRow();
                            oRow.style.height = "20px";
                            oRow.attachEvent("onclick", GridRow_OnClick);



                            if (GridRow_ClientOnClick != null) {
                                oRow.attachEvent("onclick", GridRow_ClientOnClick);


                            }

                            if (ArrEventCount > 0) {
                                for (var ae = 0; ae < ArrEventCount; ++ae) {
                                    if (ArrEvent[ae].length == 5) {
                                        if (ArrEvent[ae][0] == "row") {
                                            oRow.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                        }
                                    }
                                }
                            }


                            var RadifCell = oRow.insertCell();
                            RadifCell.style.width = "30px";
                            RadifCell.align = "center";
                            if (GridPageSize == 0)
                                RadifCell.innerText = i + 1;
                            else
                                RadifCell.innerText = (PageNumber - 1) * GridPageSize + i + 1;

                            if (i % 2 == 0)
                                RadifCell.style.backgroundColor = "#E7EEFE";
                            else
                                RadifCell.style.backgroundColor = "#FEF8ED";
                        }



                        var Attrs = Header.rows[0].Attrs;
                        var AttrArr = Attrs.split(',');

                        if (AttrArr.length > 0) {
                            for (var k = 0; k < AttrArr.length; ++k) {

                                if (xmlNodes.item(i).selectSingleNode(AttrArr[k]) != null) {

                                    oRow.setAttribute(AttrArr[k], xmlNodes.item(i).selectSingleNode(AttrArr[k]).text);


                                }
                            }
                        }



                        for (var j = 1; j < Header.rows[0].cells.length; ++j) {
                            try {
                                if (xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName) != null) {

                                    if (xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text != "") {

                                        if (DataReplace != "") {

                                            var DataReplaceArr = DataReplace.split('@');
                                            var RepColName = "";
                                            for (var d = 0; d < DataReplaceArr.length; ++d) {
                                                if (DataReplaceArr[d].split(';')[0] == Header.rows[0].cells[j].ColName) {
                                                    RepColName = DataReplaceArr[d].split(';')[1];
                                                }
                                            }


                                            if (RepColName != "") {
                                                CellValue = xmlNodes.item(i).selectSingleNode(RepColName).text;
                                            }
                                            else {
                                                CellValue = xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text;
                                            }

                                        }
                                        else
                                            CellValue = xmlNodes.item(i).selectSingleNode(Header.rows[0].cells[j].ColName).text;
                                    }
                                    else {
                                        CellValue = "";
                                    }
                                }
                                else {

                                    CellValue = "";
                                }

                            }
                            catch (err) {
                                CellValue = ""
                            }

                            

                            

                            var oCell = oRow.insertCell();

                            if (IsFooter) {
                                oCell.style.backgroundColor = "#006699";
                                oCell.style.color = "#FFFF00";
                            }
                            else {
                                if (i % 2 == 0)
                                    oCell.style.backgroundColor = "#E7EEFE";
                                else
                                    oCell.style.backgroundColor = "#FEF8ED";
                            }

                            switch (Header.rows[0].cells[j].ColType) {
                                case "1":
                                case "4":
                                    if (Header.rows[0].cells[j].IsLink == 1 && !IsFooter) {



                                        var LinkUrl = Header.rows[0].cells[j].LinkUrl;
                                        var UrlParam = Header.rows[0].cells[j].UrlParam;
                                        var UrlParamVal = Header.rows[0].cells[j].UrlParamVal;
                                        var UrlFeatur = Header.rows[0].cells[j].UrlFeatur;
                                        var LinkParam = "";
                                        var AccessName = Header.rows[0].cells[j].AccessName;
                                        if (AccessName == null || AccessName == undefined)
                                            AccessName = 0;

                                        var UrlParamArr;
                                        UrlParamArr = UrlParam.split('@');

                                        var UrlParamValArr;
                                        UrlParamValArr = UrlParamVal.split('@');


                                        if (UrlParamArr.length > 0) {

                                            for (var l = 0; l < UrlParamArr.length; ++l) {
                                                if (LinkParam == "") {
                                                    LinkParam = UrlParamArr[l];
                                                }
                                                else {
                                                    LinkParam += '&' + UrlParamArr[l];
                                                }

                                                switch (UrlParamValArr[l].split(';')[0]) {
                                                    case '1':
                                                        var Val;
                                                        if (xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]) != null) {
                                                            Val = xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]).text;
                                                            if (AccessName == 1)
                                                                Val = encode64(Val);
                                                            LinkParam += "=" + Val;
                                                        }
                                                        else {
                                                            LinkParam += "=";
                                                        }
                                                        break;
                                                    case '2':
                                                        var Val = UrlParamValArr[l].split(';')[1];
                                                        if (AccessName == 1)
                                                            Val = encode64(Val);
                                                        LinkParam += "=" + Val;
                                                        break;
                                                    case '3':

                                                        switch (UrlParamValArr[l].split(';')[1]) {
                                                            case '1':
                                                                LinkParam += "=" + SDate;
                                                                break;
                                                            case '2':
                                                                LinkParam += "=" + EDate;
                                                                break;
                                                            case '3':
                                                                LinkParam += "=" + CompanyID;
                                                                break;
                                                            case '4':
                                                                LinkParam += "=" + SessionID;
                                                                break;
                                                            case '5':
                                                                LinkParam += "=" + OnLineUserId;
                                                                break;
                                                        }
                                                        break;
                                                    case '4':
                                                        var Val;
                                                        if (xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]) != null) {
                                                            Val = xmlNodes.item(i).selectSingleNode(UrlParamValArr[l].split(';')[1]).text;
                                                            if (AccessName == 1)
                                                                Val = encode64(Val);
                                                            LinkParam += "=" + Val;
                                                        }
                                                        else {
                                                            LinkParam += "=";
                                                        }
                                                        break;

                                                }

                                                var UrlFeaturArr = UrlFeatur.split('#');
                                                var ModalFeatur = "";
                                                var ModelessFlag = "";
                                                if (UrlFeaturArr.length == 2) {
                                                    ModalFeatur = UrlFeaturArr[0];
                                                    ModelessFlag = UrlFeaturArr[1];
                                                }
                                                else {
                                                    ModalFeatur = UrlFeaturArr[0];
                                                    ModelessFlag = "0";
                                                }



                                            }

                                        }



                                        if (ModelessFlag == "1") {
                                            Func = 'if(typeof window.showModelessDialog=="object") window.showModelessDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + ';minimize: yes");';
                                            Func += ' else window.showModalDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + ';minimize: yes");';
                                        }
                                        else {
                                            Func = 'window.showModalDialog(encodeURI("' + LinkUrl + '?' + LinkParam + '"),window,"' + ModalFeatur + '")';
                                        }



                                        oCell.innerHTML = "<div style='color:blue;text-decoration:underline;cursor:pointer' onclick='" + Func + "'>" + CellValue + "</div>";


                                    }
                                    else {

                                        oCell.innerHTML = CellValue;
                                    }
                                    break;
                                case "2":
                                    var oCellTextBox = document.createElement('input');
                                    oCellTextBox.setAttribute('id', 'Txt' + Header.rows[0].cells[j].ColName + i);
                                    oCellTextBox.setAttribute('type', 'text');
                                    //SendExcelAll.attachEvent('onclick', BtnSendAllToExcel_OnClick);
                                    oCellTextBox.className = "TxtControls";
                                    
                                    oCellTextBox.style.width = "100%";
                                    oCellTextBox.style.textAlign = "center";
                                    oCellTextBox.value = CellValue;


                                    oCell.appendChild(oCellTextBox);
                                    break;
                                case "5":
                                    var oCellComboBox = document.createElement('select');
                                    oCellComboBox.setAttribute('id', 'Cmb' + Header.rows[0].cells[j].ColName+i);
                                    //SendExcelAll.attachEvent('onclick', BtnSendAllToExcel_OnClick);
                                    oCellComboBox.className = "TxtControls";
                                    
                                    oCellComboBox.style.width = "100%";
                                    //oCellTextBox.style.textAlign = "center";

                                    var option = document.createElement("option");
                                    option.text = "انتخاب نشده";
                                    option.value = "0";
                                    oCellComboBox.add(option);

                                    oCellComboBox.value = CellValue;

                                    oCell.appendChild(oCellComboBox);



                                    break;
                                case "8":
                                    var oCellImage = document.createElement('img');
                                    oCellImage.setAttribute('id', 'Img' + Header.rows[0].cells[j].ColName + i);
                                    oCellImage.setAttribute('src', CellValue);

                                    oCellImage.style.width = "30px";
                                    oCellImage.style.height = "30px";

                                    oCell.appendChild(oCellImage);
                                    break;
                                default:
                                    oCell.innerHTML = CellValue;
                                    break;
                            }

                            

                            if (ArrEventCount > 0) {
                                for (var ae = 0; ae < ArrEventCount; ++ae) {
                                    if (ArrEvent[ae].length == 5) {
                                        if (ArrEvent[ae][0] == "cell") {

                                            if (ArrEvent[ae][1] != "") {
                                                if (oCell.cellIndex == ArrEvent[ae][1]) {
                                                    oCell.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                                }
                                            }
                                            else if (ArrEvent[ae][2] != "") {

                                                if (Header.rows[0].cells[oCell.cellIndex].ColName == ArrEvent[ae][2]) {
                                                    oCell.attachEvent(ArrEvent[ae][3], ArrEvent[ae][4]);
                                                }
                                            }


                                        }
                                    }
                                }
                            }



                        }
                    }
                }





            }



            Grid_RowDataBound(oGrid);

        }




        function SetGridProperty(oGrid, GridProperty, AllowSend) {

            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(GridProperty)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/GridProperty")

            if (xmlNodes.length == 1) {
                oGrid.setAttribute("GridID", xmlNodes.item(0).selectSingleNode('GridID').text)

                HeaderCssClass = xmlNodes.item(0).selectSingleNode('HeaderCssClass').text;
                AlternatingCssClass = xmlNodes.item(0).selectSingleNode('AlternatingCssClass').text;
                ItemCssClass = xmlNodes.item(0).selectSingleNode('ItemCssClass').text;
                FooterCssClass = xmlNodes.item(0).selectSingleNode('FooterCssClass').text;

                TableName = xmlNodes.item(0).selectSingleNode('TableName').text;
                GridName = xmlNodes.item(0).selectSingleNode('GridName').text;
                if (xmlNodes.item(0).selectSingleNode('ShowHeader') != null) {
                    if (xmlNodes.item(0).selectSingleNode('ShowHeader').text == 0) {
                        var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
                        Header.style.display = "none";
                    }
                    else {
                        var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
                        Header.style.display = "inline";
                    }
                }
                else {
                    var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
                    Header.style.display = "inline";
                }


                if (xmlNodes.item(0).selectSingleNode('AllowPaging').text == 0) {

                    GridPageSize = 0;

                    var Pager = document.getElementById('TdGridPager');
                    Pager.style.display = "none";


                    document.getElementById('BtnGridFirst').detachEvent('onclick', BtnGridFirst_OnClick);
                    document.getElementById('BtnGridPrev').detachEvent('onclick', BtnGridPrev_OnClick);
                    document.getElementById('BtnGridNext').detachEvent('onclick', BtnGridNext_OnClick);
                    document.getElementById('BtnGridLast').detachEvent('onclick', BtnGridLast_OnClick);

                    document.getElementById('TxtGridCurPage').detachEvent('onblur', TxtGridCurPage_OnBlur);
                }
                else {

                    GridPageSize = xmlNodes.item(0).selectSingleNode('PageSize').text;
                    var Pager = document.getElementById('TdGridPager');
                    Pager.style.display = "inline";

                    document.getElementById('BtnGridFirst').detachEvent('onclick', BtnGridFirst_OnClick);
                    document.getElementById('BtnGridPrev').detachEvent('onclick', BtnGridPrev_OnClick);
                    document.getElementById('BtnGridNext').detachEvent('onclick', BtnGridNext_OnClick);
                    document.getElementById('BtnGridLast').detachEvent('onclick', BtnGridLast_OnClick);

                    document.getElementById('TxtGridCurPage').detachEvent('onblur', TxtGridCurPage_OnBlur);


                    document.getElementById('BtnGridFirst').attachEvent('onclick', BtnGridFirst_OnClick);
                    document.getElementById('BtnGridPrev').attachEvent('onclick', BtnGridPrev_OnClick);
                    document.getElementById('BtnGridNext').attachEvent('onclick', BtnGridNext_OnClick);
                    document.getElementById('BtnGridLast').attachEvent('onclick', BtnGridLast_OnClick);

                    document.getElementById('TxtGridCurPage').attachEvent('onblur', TxtGridCurPage_OnBlur);

                }

                if (AllowSend) {
                    var Send = document.getElementById('TdGridSend');
                    Send.style.display = "inline";

                    Send.innerHTML = "";

                    if (xmlNodes.item(0).selectSingleNode('AllowPaging').text != 0) {

                        var SendExcelAll = document.createElement('img');
                        SendExcelAll.setAttribute('id', 'ImgSendExcelAll');
                        SendExcelAll.setAttribute('title', 'ارسال همه ي صفحات به اکسل');
                        SendExcelAll.attachEvent('onclick', BtnSendAllToExcel_OnClick);
                        SendExcelAll.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/Excel.png');

                        SendExcelAll.style.cursor = "pointer";

                        Send.appendChild(SendExcelAll);
                    }

                    var SendExcel = document.createElement('img');
                    SendExcel.setAttribute('id', 'ImgSendExcel');
                    SendExcel.setAttribute('title', 'ارسال صفحه جاري به اکسل');
                    SendExcel.attachEvent('onclick', BtnSendToExcel_OnClick);
                    SendExcel.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/ms-excel.png');
                    SendExcel.style.cursor = "pointer";

                    Send.appendChild(SendExcel);


                    if (xmlNodes.item(0).selectSingleNode('AllowPaging').text != 0) {
                        var SendPDFAll = document.createElement('img');
                        SendPDFAll.setAttribute('id', 'ImgSendPDFAll');
                        SendPDFAll.setAttribute('title', 'ارسال همه ي صفحات به پی دی اف');
                        SendPDFAll.attachEvent('onclick', BtnSendAllToPDF_OnClick);

                        SendPDFAll.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/PDF.png');

                        SendPDFAll.style.cursor = "pointer";

                        Send.appendChild(SendPDFAll);
                    }

                    var SendPDF = document.createElement('img');
                    SendPDF.setAttribute('id', 'ImgSendPDF');
                    SendPDF.setAttribute('title', 'ارسال صفحه جاري به پی دی اف');
                    SendPDF.attachEvent('onclick', BtnSendToPDF_OnClick);

                    SendPDF.setAttribute('src', '/TAPresentation/App_Utility/Images/Icons/application-pdf.png');

                    SendPDF.style.cursor = "pointer";

                    Send.appendChild(SendPDF);




                }

            }
        }

        function BtnGridFirst_OnClick(sender, eventargs) {
            if (document.getElementById('TxtGridCurPage').value != 1) {
                document.getElementById('TxtGridCurPage').value = 1;

                GridSearch(document.getElementById('TxtGridCurPage').value);
            }
        }

        function BtnGridPrev_OnClick(sender, eventargs) {
            if (parseInt(document.getElementById('TxtGridCurPage').value, 10) > 1) {
                document.getElementById('TxtGridCurPage').value = parseInt(document.getElementById('TxtGridCurPage').value, 10) - 1;

                GridSearch(document.getElementById('TxtGridCurPage').value);

            }
        }

        function BtnGridNext_OnClick(sender, eventargs) {

            if (parseInt(document.getElementById('TxtGridCurPage').value, 10) < parseInt(document.getElementById('TxtGridTotalPage').value, 10)) {
                document.getElementById('TxtGridCurPage').value = parseInt(document.getElementById('TxtGridCurPage').value, 10) + 1;

                GridSearch(document.getElementById('TxtGridCurPage').value);

            }
        }

        function BtnGridLast_OnClick(sender, eventargs) {
            if (document.getElementById('TxtGridCurPage').value != document.getElementById('TxtGridTotalPage').value) {
                document.getElementById('TxtGridCurPage').value = document.getElementById('TxtGridTotalPage').value;

                GridSearch(document.getElementById('TxtGridCurPage').value);
            }
        }

        function TxtGridCurPage_OnBlur(sender, eventargs) {
            if (parseInt(document.getElementById('TxtGridCurPage').value, 10) > parseInt(document.getElementById('TxtGridTotalPage').value, 10))
                document.getElementById('TxtGridCurPage').value = document.getElementById('TxtGridTotalPage').value;

            GridSearch(document.getElementById('TxtGridCurPage').value);
        }

        function SetGridSetting(oGrid, GridSetting) {
            var GridWidth = 0;
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument")
            xmlDoc.loadXML(GridSetting)
            xmlDoc.setProperty("SelectionLanguage", "XPath")
            var xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/GridSetting[Viewable=1]")

            var xmlDocA = new ActiveXObject("MsXml2.DomDocument")
            xmlDocA.loadXML(GridSetting)
            xmlDocA.setProperty("SelectionLanguage", "XPath")
            //var xmlNodesA = xmlDocA.documentElement.selectNodes("/GeneralEntity/GridSetting[Attributable=1]")
            var xmlNodesA = xmlDocA.documentElement.selectNodes("/GeneralEntity/GridSetting")


            if (xmlNodes.length > 0) {
                var Header = oGrid.getElementsByTagName('thead')['ColumnHeader'];
                var oRow = Header.insertRow();

                oRow.className = HeaderCssClass;

                var RadifCell = oRow.insertCell();
                RadifCell.style.width = "30px";
                RadifCell.align = "center";
                RadifCell.innerText = "*";
                GridWidth += 30;

                for (var i = 0; i < xmlNodes.length; ++i) {

                    var oCell = oRow.insertCell();
                    oCell.setAttribute("ColName", (xmlNodes.item(i).selectSingleNode('ColName').text).replace(/ /g, "_"));
                    oCell.setAttribute("ColType", xmlNodes.item(i).selectSingleNode('ColType').text);



                    if (xmlNodes.item(i).selectSingleNode('LinkUrl') != null) {
                        oCell.setAttribute("IsLink", 1);
                        oCell.setAttribute("LinkUrl", xmlNodes.item(i).selectSingleNode('LinkUrl').text);
                        oCell.setAttribute("UrlParam", xmlNodes.item(i).selectSingleNode('UrlParam').text);
                        oCell.setAttribute("UrlParamVal", xmlNodes.item(i).selectSingleNode('UrlParamVal').text);
                        oCell.setAttribute("UrlFeatur", xmlNodes.item(i).selectSingleNode('UrlFeatur').text);
                        oCell.setAttribute("AccessName", xmlNodes.item(i).selectSingleNode('AccessName').text);

                    }
                    else {
                        oCell.setAttribute("IsLink", 0);
                    }

                    oCell.style.width = xmlNodes.item(i).selectSingleNode('Width').text + 'px';
                    oCell.align = "center";
                    oCell.valign = "middle";
                    oCell.innerText = xmlNodes.item(i).selectSingleNode('ColTitle').text;
                    GridWidth += parseInt(xmlNodes.item(i).selectSingleNode('Width').text, 10);
                }

                var StrAttr = "";
                for (var j = 0; j < xmlNodesA.length; ++j) {
                    if (StrAttr == "" && xmlNodesA.item(j).selectSingleNode('ColName').text != "") {
                        StrAttr = (xmlNodesA.item(j).selectSingleNode('ColName').text).replace(/ /g, "_");
                    }
                    else {
                        StrAttr += "," + (xmlNodesA.item(j).selectSingleNode('ColName').text).replace(/ /g, "_");
                    }

                }


                oRow.setAttribute("Attrs", StrAttr);
            }

            oGrid.style.width = GridWidth + 'px';
            var Pager = document.getElementById('dPager');
            Pager.style.width = GridWidth;
        }

        var LastSelectedGridRow = null;
        var LastSelectedGridRowStyle = "";
        var GridSelectedRowStyle = "#FFD599";
        var GridItemRowStyle = "#E7EEFE";
        var GridAlternatingRowStyle = "#FEF8ED";
        var GridFooterRowStyle = "";
        function GridRow_OnClick() {
            var oRow = event.srcElement;
            while (oRow.tagName != "TR") {
                oRow = oRow.parentElement;
            }

            if (LastSelectedGridRow != null) {


                for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                    LastSelectedGridRow.cells[i].style.backgroundColor = LastSelectedGridRowStyle;
                }

            }


            if (oRow.cells.length > 0) {
                LastSelectedGridRowStyle = oRow.cells[0].style.backgroundColor;
            }
            for (var i = 0; i < oRow.cells.length; ++i) {
                oRow.cells[i].style.backgroundColor = GridSelectedRowStyle;
            }
            LastSelectedGridRow = oRow;


        }

        function SelectGridRow(GridRow) {
            var oRow = GridRow;
            

            if (LastSelectedGridRow != null) {


                for (var i = 0; i < LastSelectedGridRow.cells.length; ++i) {
                    LastSelectedGridRow.cells[i].style.backgroundColor = LastSelectedGridRowStyle;
                }

            }


            if (oRow.cells.length > 0) {
                LastSelectedGridRowStyle = oRow.cells[0].style.backgroundColor;
            }
            for (var i = 0; i < oRow.cells.length; ++i) {
                oRow.cells[i].style.backgroundColor = GridSelectedRowStyle;
            }
            LastSelectedGridRow = oRow;


        }
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
