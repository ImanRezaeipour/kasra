<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" validateRequest="false" AutoEventWireup="true" CodeBehind="DisplayLog.aspx.cs" Inherits="FrmPresentation.App_Pages.ErrorLog.DisplayLog" Title="نمایش Log" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>
<script src="../../App_Utility/Scripts/Maskdiv.js" type="text/javascript"></script>


    <table dir="rtl" align="center" style="width: 970px;">
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                
                <script language="javascript" type="text/javascript">
                    
                    var Master = "ctl00_ContentPlaceHolder1_";
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    
                    function BeginRequestHandler(sender, args) {
                                                                     
                       document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                        
                    }

                    ////==================================================================================

                    function EndRequestHandler(sender, args) {
                        
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = document.getElementById(Master + "BtnSubmit");

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

                        if (document.getElementById(Master + "txtAlert").value != "") {
                            SetMsg(document.getElementById(Master + "txtAlert").value);
                            document.getElementById(Master + "txtAlert").value = "";
                        }
                        document.getElementById(Master + "BtnSubmit").value = "";
                    }

                    //=============================================================================

    </script>
    
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>       
                
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                         <asp:HiddenField ID="Totalpage" runat="server" />                          
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="DateFrom" name="SDate" runat="server" />
                    <input type="text" id="DateTo" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
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
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" onclick="ImgRefreshPersonSubmit_Click" />
                    <input type="text" id="txtXMLSearch" name="txtXMLSearch" runat="server" />
                    
                </div>
            </td>
        </tr>
        
    </table>    
    
    <div id="PopupFilter" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
        border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
        top: 325px; left: 145px;display:none; background-color: #e7eeff; right: 196px;
        width: 645px;" align="center">
        <table style="width:auto;">
            <tr>
                <td style="width:140px;" >
                    از تاریخ:</td>
                <td >
                   <uc2:KCalendar ID="KCalFrom" runat="server"  />&nbsp;
                </td>
                <td style="width:100px;">
                    تا تاریخ:</td>
                <td >
                    <uc2:KCalendar ID="KCalTo" runat="server" />&nbsp;
                </td>
                <td style="width:90px;">
                    از زمان:</td>
                <td style="width:100px;">
                    <input id="txtTimeFrom" type="text" style="width: 60px;" runat="server" maxlength="8" onblur="onblurTime(this,0)" /></td>
                    <td style="width:70px;" >
                    
                        تا زمان:</td>
                        <td style="width:100px;">
                    <input id="txtTimeTo" type="text" style="width: 60px;" runat="server" maxlength="8" onblur="onblurTime(this,1)" /></td>
            </tr>
            <tr>
                <td >
                    کد پرسنلی:
                </td>
                <td >
                    <input id="txtPersonCode" type="text" style="width: 100px;" runat="server" onchange="onchangeCombo(this,$get('ctl00_ContentPlaceHolder1_CmbPersonName'))" />
                </td>
                <td>
                    نام کاربر:
                </td>
                <td colspan="5">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <select id="CmbPersonName" name="D1" style="width: 97px;" runat="server" onchange="onchangeCombo(this,$get('ctl00_ContentPlaceHolder1_txtPersonCode'))">
                                <option></option>
                            </select>
                            &nbsp;<img id="ImgRefreshPerson" alt="به روزرساني نام"  src="../../App_Utility/Images/Icons/Refresh1.png" onclick="return ImgRefreshPerson_onclick()" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td >
                    نام زیر سیستم:
                </td>
                <td >
               <select id="CmbSubSysName" name="D3" style="width: 97px;" runat="server" onchange="onchangeCmbSubSysName()" onclick="return CmbSubSysName_onclick()">
                   <option></option>
                 </select>                                  
                        
                </td>
                <td>
                    نام صفحه:
                </td>
                <td>
                    
                            <select id="CmbPageName" name="D2" style="width: 97px;" runat="server" onchange="onchangeCmbPageName()">
                                <option></option>
                            </select>
                            
                </td>
                <td >
                    نام جدول:</td>
                <td colspan="3">
                    <input id="txtTableName" type="text" style="width: 100px;" runat="server" /></td>
            </tr>
            <tr>
                <td   >
                    توضیحات:</td>
                <td colspan="7">
                    <input id="txtDescription" type="text" runat="server" style="width: 327pt;"/></td>
            </tr>
            <tr>
                <td colspan="8">
                        
                    <table align="center" style="width:auto;" cellpadding="3" >
                        <tr>
                            <td >
                    <input id="BtnDivFilter" name="BtnDivFilter" type="button" value=" فیلتر"  
                                    onclick="return BtnDivFilter_onclick()" style="width: 60px" /></td>
                            <td>
                    <input id="BtnNew" name="BtnNew" type="button" value="حذف فیلتر"  
                                    onclick="return BtnNew_onclick()" style="width: 60px" /></td>
                            <td>
                    <input id="BtnCancel" name="BtnCancel" onclick="return BtnCancel_onclick()" type="button" 
                                    value="انصراف" style="width: 60px" /></td>
                        </tr>
                    </table>
                        
                </td>
            </tr>
         </table> 
        
    </div>

    <script language="javascript" type="text/javascript">
        var signCorrectTime2 = true
        var signCorrectTime1 = true;
        var signBuffer = true;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";

        //*************************************Toolbar*************************************
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

                    document.getElementById(Master + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value;
                    document.getElementById(Master + "txtSubmit").value = "Const";
                }
                else {
                    document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtTotalPage").value;
                    document.getElementById(Master + "txtSubmit").value = "BtnLast";
                } 
                              
                document.getElementById(Master + "BtnSubmit").click();
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
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";

        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Check Time TextBox's!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        function onblurTime(obj,sign) {
        
            var flag = true;
            var houre;
            var point = obj.value.indexOf(":");
    //چک کردن ساعت
            if (obj.value != "") {

                if (point > -1) {

                    houre = obj.value.substr(0, point)
                    var others = obj.value.substr(point + 1, obj.length);
                    if ((parseInt(houre) > 24) || (parseInt(houre) < 0)) {
                        SetMsg("خطا در وارد کردن اطلاعات");
                        houre = obj.value;
                        flag = false;
                    }
                    else if (houre.length == 1)
                        houre = "0" + houre;
                    if (flag)
                        houre = houre + ":";
                    var point = others.indexOf(":");

                    //چک کردن دقیقه 
                    if ((point > -1) && (flag)) {

                        var minute = others.substr(0, point)
                        var others = others.substr(point + 1, others.length);
                        if ((parseInt(minute) > 59) || (parseInt(minute) < 0)) {
                            SetMsg("خطا در وارد کردن اطلاعات");
                            houre = obj.value;
                            flag = false;
                        }
                        else if (minute.length == 1)
                            minute = "0" + minute;
                        houre = houre + minute + ":";
                        var point = others.indexOf(":");

                        //چک کردن ثانیه
                        if (point > -1) {
                            SetMsg("خطا در وارد کردن اطلاعات");
                            houre = obj.value;
                            flag = false;
                        }
                        else {
                            if (others.length == 1)
                                others = "0" + others;
                            houre = houre + others;
                        }
                    }
                    else
                        if ((parseInt(others) > 59) || (parseInt(others) < 0)) {
                            SetMsg("خطا در وارد کردن اطلاعات");
                            houre = obj.value;
                        flag = false;
                    }
                    else {
                        if (others.length == 1)
                            others = "0" + others;
                        houre = houre + others + ":00";
                    }
                }

                else 
                    if ((parseInt(obj.value) > 24) || (parseInt(obj.value) < 0)) {
                        SetMsg("خطا در وارد کردن اطلاعات");
                        houre = obj.value;
                        flag = false;
                    }
                    else {
                        if ((obj.value.length == 1) && (flag))
                            obj.value = "0" + obj.value;
                        houre = obj.value + ":00:00";

                    }
                    if (sign == 0)
                        signCorrectTime1 = flag;
                    else signCorrectTime2 = flag;
                     
                     
                    obj.value = houre;
                       
            }
        }        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Change Combo's!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangeCombo(Cmbobj,TXTobj) {            
           TXTobj.value= Cmbobj.value;
        }
        //---------------------------------------------------------------------

        function onchangeCmbSubSysName() {           
            var subsysID = document.getElementById(MasterObj + "CmbSubSysName").value

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLSearch").value);
            var xmlNodes;
            if (subsysID != '0') {
                xmlNodes = xmlDoc.documentElement.selectNodes("/Main/Subsystem[SubSysID=" + subsysID + "]");
            }
            else xmlNodes = xmlDoc.documentElement.selectNodes("/Main/Subsystem");
                document.getElementById(MasterObj + 'CmbPageName').innerHTML = ""
                optionEl = document.createElement("OPTION")
                document.getElementById(MasterObj + 'CmbPageName').options.add(optionEl)
                document.getElementById(MasterObj + 'CmbPageName').all(0).innerText = ''
                document.getElementById(MasterObj + 'CmbPageName').all(0).value = 0
           
             
            if (xmlNodes.length != 0) {
                for (var i = 0; i < xmlNodes.length; ++i) {
                    optionEl = document.createElement("OPTION")
                    document.getElementById(MasterObj + 'CmbPageName').options.add(optionEl)
                    document.getElementById(MasterObj + 'CmbPageName').all(i + 1).innerText = xmlNodes.item(i).selectSingleNode('PageTitle').text
                    document.getElementById(MasterObj + 'CmbPageName').all(i + 1).value = xmlNodes.item(i).selectSingleNode('PageID').text
                }
            }
            document.getElementById(MasterObj + "CmbPageName").value = 0
        }
        //---------------------------------------------------------------------
        function onchangeCmbPageName() {
            var PageID = document.getElementById(MasterObj + "CmbPageName").value
            
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLSearch").value);
                        
            var xmlNodes;
            if (PageID != '0') {
                xmlNodes = xmlDoc.documentElement.selectNodes("/Main/Subsystem[PageID=" + PageID + "]");
                
                document.getElementById(MasterObj + "CmbSubSysName").value = xmlNodes(0).childNodes(0).text;
               
            }
            else
                document.getElementById(MasterObj + "CmbSubSysName").value = 0;            
            
        }
       //----------------------------------------------------------------------------
        function OnClickBtnSearch() {
            PopupFilter.style.display = "inline";          

      }
      //-----------------------------------------------------------------------------  


        function BtnCancel_onclick() {
            PopupFilter.style.display = "none";
        }

        function BtnDivFilter_onclick() {

            signBuffer = signCorrectTime1 * signCorrectTime2; 
                       
            document.getElementById(MasterObj + "DateFrom").value =
            document.getElementById(MasterObj + "KCalFrom_txtYear").value + "/" +
            document.getElementById(MasterObj + "KCalFrom_txtMonth").value + "/" +
            document.getElementById(MasterObj + "KCalFrom_txtDay").value

            document.getElementById(MasterObj + "DateTo").value =
            document.getElementById(MasterObj + "KCalTo_txtYear").value + "/" +
            document.getElementById(MasterObj + "KCalTo_txtMonth").value + "/" +
            document.getElementById(MasterObj + "KCalTo_txtDay").value

            if (signBuffer) {
                if ((document.getElementById(MasterObj + "txtTimeFrom").value != "") && (document.getElementById(MasterObj + "txtTimeTo").value != "")) 
                    if (document.getElementById(MasterObj + "txtTimeFrom").value > document.getElementById(MasterObj + "txtTimeTo").value) {
                        SetMsg("زمان شروع از زمان خاتمه بزرگتر است!");
                        signBuffer = false;
                    }
                
                if(signBuffer)
                    if ((document.getElementById(MasterObj + "DateFrom").value != "//") && (document.getElementById(MasterObj + "DateTo").value != "//"))
                        if (document.getElementById(MasterObj + "DateFrom").value > document.getElementById(MasterObj + "DateTo").value) {
                        SetMsg("تاریخ شروع از تاریخ خاتمه بزرگتر است!");
                        signBuffer = false;
                     }
                
                 if (signBuffer) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                    PopupFilter.style.display = "none";
                 }                
            }
            else
                SetMsg("خطا در وارد کردن زمان");
        }

        function OnClickBtnFilterAll() {
            BtnNew_onclick();
            BtnDivFilter_onclick();
        }



        function BtnNew_onclick() {
            $get(MasterObj + "txtPersonCode").value = "";
            $get(MasterObj + "CmbPersonName").value = 0;
            $get(MasterObj + "CmbPageName").value = 0;
            $get(MasterObj + "CmbSubSysName").value = 0;
            $get(MasterObj + "txtTimeFrom").value = "";
            $get(MasterObj + "txtTimeTo").value = "";
            $get(MasterObj + "txtTableName").value = "";
            $get(MasterObj + "txtDescription").value = "";
            $get(MasterObj + "KCalFrom_txtDay").value = "";
            $get(MasterObj + "KCalFrom_txtMonth").value = "";
            $get(MasterObj + "KCalFrom_txtYear").value = "";
            $get(MasterObj + "KCalTo_txtDay").value = "";
            $get(MasterObj + "KCalTo_txtMonth").value = "";
            $get(MasterObj + "KCalTo_txtYear").value = "";

        }

        function ImgRefreshPerson_onclick() {

            OpenModelPopup();            
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
            CloseModelPopup();
        }

        function CmbSubSysName_onclick() {

        }

    </script>

</asp:Content>
