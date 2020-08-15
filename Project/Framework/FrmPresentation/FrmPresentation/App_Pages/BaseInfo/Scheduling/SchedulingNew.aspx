<%@ Page  Title="-----------------------------------------------------------------تعريف زمانبندي-----------------------------------------------------------------"  Language="C#" AutoEventWireup="true" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" CodeBehind="SchedulingNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Scheduling.SchedulingNew" ValidateRequest="false" %>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">
       var MasterObj = "ctl00_ContentPlaceHolder1_";
       /////-------------------------------------------
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <script type="text/javascript" language="javascript">
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     function BeginRequestHandler(sender, args) {
         
     }

     function EndRequestHandler(sender, args) {
     
         

         var StrVal = $get(MasterObj + "txtSubmit").value

         if (StrVal != "") {
             SetMsg(document.getElementById(MasterObj + "txtAlert").value)
             window.returnValue  = $get(MasterObj + "txtSchedulingID").value
             
             //OnLoad();    
         }
         $get(MasterObj + "txtSubmit").value = "";
         $get(MasterObj + "txtAlert").value = "";
         
     }
   </script>   
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
    <ContentTemplate>   
        <table style="width: 81%">
        <tr>
            <td style="width: 763px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 763px">
                                            
                <table style="width: 100%">
                    <tr>
                        <td style="width: 102px; height: 15px;">
                            نام زمانبندي:</td>
                        <td style="width: 184px"  >
                            <input id="txtSchedulingName" runat="server"  type="text"  style="width: 184px"/></td>
                        <td style="width: 94px"  >
                            کد زمانبندي:</td>
                        <td style="width: 133px"  >
                            <input id="txtSchedulingCode" style="width:140px" runat="server"  
                                        type="text" name="txtSchedulingCode" /></td>
                        <td >
                            <input id="ChkActive" type="checkbox" checked runat="server"/>فعال</td>
                    </tr>
                </table>
                                            
            </td>
        </tr>
        <tr>
            <td style="width: 763px">
            <fieldset dir="rtl" style=" height: 100%; border-right: lightblue thin inset;
                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                <legend style="color: lightblue">نوع تکرار</legend>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 133px">
                            نوع محدوده تکرار:</td>
                        <td style="width: 116px">
                            <asp:DropDownList ID="CmbPeriodType" onchange="OnChangeCmbPeriodType();SetDescr()"
                                            runat="server" Width="100px">
                            </asp:DropDownList>
                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 133px" id="TD1">
                            تعداد محدوده تکرار:</td>
                        <td style="width: 116px" id="TD2">
                            <input id="txtPeriodFactor" onkeydown="OnKeyDownInt(this.value)"  style="width:100px" runat="server"  onblur="SetDescr()"
                                value="1" type="text" name="txtPeriodFactor" /></td>
                        <td id="TDPTTitle" >
                            روز</td>
                    </tr>
                </table>
                <table style="width: 100%"><tr><td id="TDWeekly">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 130px">
                                &nbsp;</td>
                            <td>
                                <input id="ChkSaturDay" type="checkbox" name="ChkSaturDay" runat="server" onclick="SetDescr()"/>شنبه</td>
                            <td>
                                <input id="ChkMunDay" type="checkbox" name="ChkMunDay" runat="server" onclick="SetDescr()"/>دوشنبه</td>
                            <td>
                                <input id="ChkWednesDay" type="checkbox" name="ChkWednesDay" runat="server" onclick="SetDescr()"/>چهارشنبه</td>
                            <td>
                                <input id="ChkFriDay" type="checkbox" name="ChkFriDay" runat="server" onclick="SetDescr()"/>جمعه</td>
                        </tr>
                        <tr>
                            <td style="width: 130px">
                                &nbsp;</td>
                            <td>
                                <input id="ChkSunDay" type="checkbox" name="ChkSunDay" runat="server" onclick="SetDescr()"/>يکشنبه</td>
                            <td>
                                <input id="ChkTuesDay" type="checkbox" name="ChkTuesDay" runat="server" onclick="SetDescr()"/>سه شنبه</td>
                            <td>
                                <input id="ChkThursDay" type="checkbox" name="ChkThursDay" runat="server" onclick="SetDescr()"/>پنج شنبه</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    </td></tr><tr><td id="TDMonthly">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 131px">
                                    تکرار در روز :</td>
                                <td style="width: 120px">
                            <input id="txtDayofMonth" onkeydown="OnKeyDownInt(this.value)"  style="width:100px" runat="server" onblur="SetDescr()"  
                                        type="text" name="txtDayofMonth" value="1"/></td>
                                <td style="width: 59px">
                                    از هر</td>
                                <td style="width: 123px">
                            <input id="txtMonthPeriodFactor" onkeydown="OnKeyDownInt(this.value)"  onblur="SetDescr()"
                                        style="width:100px; margin-right: 0px;" runat="server"  
                                        type="text" name="txtMonthPeriodFactor" value="1"/></td>
                                <td>
                                    ماه</td>
                            </tr>
                        </table>
                        </td></tr></table>
             </fieldset>    
            </td>
        </tr>
        <tr>
            <td style="width: 763px">
             <fieldset dir="rtl" style=" border-right: lightblue thin inset;
                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                <legend style="color: lightblue">شرايط تکرار</legend>
                 <table style="width: 100%">
                     <tr>
                         <td style="width: 77px">
                             <input id="OptPrType1" name="OptPrType" runat="server" type="radio" onclick="OnClickOptPrType();SetDescr()"
                                                     checked   value="1"  />در زمان</td>
                         <td style="width: 86px">
                            <input id="txtOccurTime" onkeydown="OnKeyDownTime(this.value)" value="12:00" 
                                        onblur="Timechk(this);SetDescr()" style="width:74px" runat="server"  
                                        type="text" name="txtOccurTime" /></td>
                         <td style="width: 89px">
                             انجام شود.</td>
                         <td style="width: 62px">
                             &nbsp;</td>
                         <td style="width: 85px">
                             &nbsp;</td>
                         <td style="width: 62px">
                             &nbsp;</td>
                         <td style="width: 76px">
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td style="width: 77px">
                             <input id="OptPrType2" name="OptPrType" runat="server" type="radio" onclick="OnClickOptPrType();SetDescr()"
                                                        value="11"  />هر</td>
                         <td style="width: 86px">
                            <input id="txtOccurFrequency" onkeydown="OnKeyDownInt(this.value)" style="width:74px" runat="server"  
                                        type="text" name="txtOccurFrequency" onblur="SetDescr()"/></td>
                         <td style="width: 89px">
                            <asp:DropDownList ID="CmbOccurType" onchange="SetDescr()"
                                            runat="server" Width="80px">
                            </asp:DropDownList>
                            </td>
                         <td style="width: 62px">
                             از ساعت:</td>
                         <td style="width: 85px">
                            <input id="txtSOTime" onkeydown="OnKeyDownTime(this.value)" value="12:00"
                                        onblur="Timechk(this);SetDescr()" style="width:74px" runat="server"  
                                        type="text" name="txtSOTime" /></td>
                         <td style="width: 62px">
                             تا ساعت:</td>
                         <td style="width: 76px">
                            <input id="txtEOTime" onkeydown="OnKeyDownTime(this.value)" value="23:59"
                                        onblur="Timechk(this);SetDescr()" style="width:74px" runat="server"  
                                        type="text" name="txtEOTime" /></td>
                         <td>
                             انجام شود.</td>
                     </tr>
                     </table>
             </fieldset>   
            </td>
        </tr>
        <tr>
            <td style="width: 763px">
            <fieldset dir="rtl" style=" border-right: lightblue thin inset;
                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                <legend style="color: lightblue">زمان اجرا</legend>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 79px">
                            تاريخ شروع:</td>
                        <td style="width: 165px">
                             <uc2:KCalendar ID="KCalSDate" runat="server" />
                         </td>
                        <td style="width: 100px">
                             <input id="OptSDType1" name="OptSDType" runat="server" type="radio" onclick="OnClickOptSDType();SetDescr()"
                                                       />تاريخ خاتمه:</td>
                        <td>
                             <uc2:KCalendar ID="KCalEDate" runat="server" />
                         </td>
                    </tr>
                    <tr>
                        <td style="width: 79px">
                            &nbsp;</td>
                        <td style="width: 165px">
                            &nbsp;</td>
                        <td style="width: 100px">
                             <input id="OptSDType2" name="OptSDType" runat="server" type="radio" onclick="OnClickOptSDType();SetDescr()"
                                                        value="13" checked  />بدون تاريخ</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </fieldset>    
            </td>
        </tr>
        <tr>
            <td style="width: 763px;display:inline" id="TDDescr">
            <fieldset dir="rtl" style="height: 100%; border-right: lightblue thin inset;
                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                <legend style="color: lightblue">خلاصه فرآيند</legend>
                <textarea id="txtDescr" name="S1" rows="2" runat="server"
                    style="background-color: #DDEFF4; width: 100%;"></textarea></fieldset>    
            </td>
        </tr>
    </table>
    
    <div style="display:none">
        <asp:HiddenField ID="txtSchedulingID" runat="server" />
        <input type="text" id="txtAlert" name="txtAlert" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
 <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
    <input type="text" id="txtMode" name="txtMode" runat="server" style="display:none;"/>
    </div>
    
     </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
        </Triggers>
    </asp:UpdatePanel>
    
    <div style="display: none">
        <input type="text" id="txtSaveXML" name="txtSaveXML" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
     </div>
<script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>     
<script language="javascript">
    //*************************************Declaration*************************************
        var MasterObj = "ctl00_ContentPlaceHolder1_";
    //*************************************EndDeclaration*************************************
        //*************************************OnLoad*************************************
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);

        if ($get(MasterObj + "txtSchedulingID").value != "" &
            $get(MasterObj + "txtSchedulingID").value != "0") {
            $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
            $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
            $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);
        }    
        
        OnLoad();
    //***********************************EndOnLoad************************************
    //*************************************Toolbar*************************************
    function OnClickBtnNew() {
        $get(MasterObj + "txtSchedulingID").value = "0";
        $get(MasterObj + "txtSchedulingName").value = "";
        $get(MasterObj + "txtSchedulingCode").value = "";
        $get(MasterObj + "ChkActive").checked = true;
        $get(MasterObj + "EDate").value = "";
        //تکرار
        $get(MasterObj + "CmbPeriodType").value="1";
        $get(MasterObj + "txtPeriodFactor").value="1";
        $get(MasterObj + "txtDayofMonth").value = "1";
        $get(MasterObj + "txtMonthPeriodFactor").value = "1";
        
        $get(MasterObj + "ChkSaturDay").checked=false;
        $get(MasterObj + "ChkSunDay").checked=false;
        $get(MasterObj + "ChkMunDay").checked=false;
        $get(MasterObj + "ChkTuesDay").checked=false;
        $get(MasterObj + "ChkWednesDay").checked=false;
        $get(MasterObj + "ChkThursDay").checked = false;
        $get(MasterObj + "ChkFriDay").checked = false;

        OnChangeCmbPeriodType();
        
        //شرايط تکرار
        $get(MasterObj + "OptPrType1").checked=true;
        $get(MasterObj + "txtOccurTime").value="12:00"
        $get(MasterObj + "txtOccurFrequency").value=""
        $get(MasterObj + "CmbOccurType").value="3";
        $get(MasterObj + "txtSOTime").value="12:00";
        $get(MasterObj + "txtEOTime").value="23:59";
        OnClickOptPrType();
        //زمان اجرا
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);
        $get(MasterObj + "OptSDType2").checked = true;
        //خلاصه فرآيند
        $get(MasterObj + "txtDescr").value = "";
        
        OnClickOptSDType();
        SetDescr();

    }
    //*******************************************************************************
    function OnClickBtnSave() {
        if (document.getElementById(MasterObj + "txtMode").value != "ReportPolicy") {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            if (CheckNotEmpty()) {

                MakeXML();

                $get(MasterObj + "txtSubmit").value = "Save";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        else { 
        
            alert('زمانبندی تعريف شده برای گزارش قابل تغيير نمی باشد')
        }

    }
    //*******************************************************************************
    function OnClickBtnCancel() {
        window.close();
    }
    //*******************************************************************************
    function OnLoad() {
        OnChangeCmbPeriodType()
        OnClickOptPrType();
        if ($get(MasterObj + "EDate").value == "")
            $get(MasterObj + "OptSDType2").checked = true
        else
            $get(MasterObj + "OptSDType1").checked = true;
        OnClickOptSDType();
        SetDescr();
    }
    //*******************************************************************************
    function CheckDate() {
        var SD = $get(MasterObj + "KCalSDate_txtYear").value + '/' + $get(MasterObj + "KCalSDate_txtMonth").value + '/' + $get(MasterObj + "KCalSDate_txtDay").value
        var ED = $get(MasterObj + "KCalEDate_txtYear").value + '/' + $get(MasterObj + "KCalEDate_txtMonth").value + '/' + $get(MasterObj + "KCalEDate_txtDay").value

        if (SD > ED)
            return false
        else
            return true;
    }
    //*******************************************************************************
    //***********************************EndToolbar************************************
    //************************************ThiesPag*************************************
    function MakeXML() {
        var StrWeekDay = "";
        if ($get(MasterObj + "CmbPeriodType").value == "2") //هفتگي
        {
            if ($get(MasterObj + "ChkSaturDay").checked)
                StrWeekDay += '0,';
            if ($get(MasterObj + "ChkSunDay").checked)
                StrWeekDay += '1,';
            if ($get(MasterObj + "ChkMunDay").checked)
                StrWeekDay += '2,';
            if ($get(MasterObj + "ChkTuesDay").checked)
                StrWeekDay += '3,';
            if ($get(MasterObj + "ChkWednesDay").checked)
                StrWeekDay += '4,';
            if ($get(MasterObj + "ChkThursDay").checked)
                StrWeekDay += '5,';
            if ($get(MasterObj + "ChkFriDay").checked)
                StrWeekDay += '6,';
        }
        var SD = $get(MasterObj + "KCalSDate_txtYear").value+'/'+$get(MasterObj + "KCalSDate_txtMonth").value+'/'+$get(MasterObj + "KCalSDate_txtDay").value
        var ED = (($get(MasterObj + "OptSDType2").checked) ? '' : $get(MasterObj + "KCalEDate_txtYear").value + '/' + $get(MasterObj + "KCalEDate_txtMonth").value + '/' + $get(MasterObj + "KCalEDate_txtDay").value)

        if ($get(MasterObj + "txtSchedulingID").value == "")
            $get(MasterObj + "txtSchedulingID").value = "0";
        //=====================================================
        var StrXml = "";
        StrXml += "<Root><Tb>"
        StrXml += "<SchedulingID>" + $get(MasterObj + "txtSchedulingID").value + "</SchedulingID>";
        StrXml += "<SchedulingName>" + $get(MasterObj + "txtSchedulingName").value + "</SchedulingName>";
        StrXml += "<SchedulingCode>" + $get(MasterObj + "txtSchedulingCode").value + "</SchedulingCode>";
        StrXml += "<Active>" + (($get(MasterObj + "ChkActive").checked)? '1':'0') + "</Active>";
        
        StrXml += "<PeriodTypeID>" + $get(MasterObj + "CmbPeriodType").value + "</PeriodTypeID>";
        StrXml += "<PeriodFactor>" + (($get(MasterObj + "CmbPeriodType").value == "3") ? $get(MasterObj + "txtMonthPeriodFactor").value : $get(MasterObj + "txtPeriodFactor").value) + "</PeriodFactor>";
        StrXml += "<WeekDay>" + StrWeekDay + "</WeekDay>";
        StrXml += "<DayOfMonth>" + (($get(MasterObj + "CmbPeriodType").value=="3")? $get(MasterObj + "txtDayOfMonth").value:"0") + "</DayOfMonth>";
        StrXml += "<SDate>" + SD + "</SDate>";
        StrXml += "<EDate>" + ED + "</EDate>";
        StrXml += "<OccurFrequency>" + $get(MasterObj + "txtOccurFrequency").value + "</OccurFrequency>";
        StrXml += "<OccurType>" + $get(MasterObj + "CmbOccurType").value + "</OccurType>";
        StrXml += "<OccurTime>" + $get(MasterObj + "txtOccurTime").value + "</OccurTime>";
        StrXml += "<OccurSTime>" + $get(MasterObj + "txtSOTime").value + "</OccurSTime>";
        StrXml += "<OccurETime>" + $get(MasterObj + "txtEOTime").value + "</OccurETime>";
        StrXml += "</Tb></Root>";

        $get(MasterObj + "txtSaveXML").value = StrXml;
    }
    //*******************************************************************************
        function OnChangeCmbPeriodType() {
            if ($get(MasterObj + "CmbPeriodType").value == 1) {
                $get("TDPTTitle").style.display = "inline"
                $get("TD1").style.display = "inline"
                $get("TD2").style.display = "inline"
                
                $get("TDPTTitle").innerText = "روز";
                $get("TDWeekly").style.display = "none";
                $get("TDMonthly").style.display = "none";
            }
            else if ($get(MasterObj + "CmbPeriodType").value == 2) {
                $get("TDPTTitle").style.display = "inline"
                $get("TD1").style.display = "inline"
                $get("TD2").style.display = "inline"
            
                $get("TDPTTitle").innerText = "هفته";
                $get("TDWeekly").style.display = "inline";
                $get("TDMonthly").style.display = "none";
            }
            else if ($get(MasterObj + "CmbPeriodType").value == 3) {
                $get("TDPTTitle").style.display = "none"
                $get("TD1").style.display = "none"
                $get("TD2").style.display = "none"
            
                $get("TDPTTitle").innerText = "ماه";
                $get("TDWeekly").style.display = "none";
                $get("TDMonthly").style.display = "inline";
            }
        }
        //*******************************************************************************
        function OnClickOptPrType() {
            if ($get(MasterObj + "OptPrType1").checked) {
                $get(MasterObj + "txtOccurTime").disabled = false;

                $get(MasterObj + "txtOccurFrequency").value = "";
                $get(MasterObj + "txtOccurFrequency").disabled = true;
                $get(MasterObj + "CmbOccurType").disabled = true;
                $get(MasterObj + "txtSOTime").disabled = true;
                $get(MasterObj + "txtEOTime").disabled = true;
            }
            else {
                $get(MasterObj + "txtOccurTime").disabled = true;
                $get(MasterObj + "txtOccurTime").value = "";
                
                $get(MasterObj + "txtOccurFrequency").disabled = false;
                $get(MasterObj + "CmbOccurType").disabled = false;
                $get(MasterObj + "txtSOTime").disabled = false;
                $get(MasterObj + "txtEOTime").disabled = false;
            }
        }
        //*******************************************************************************
        function OnClickOptSDType() {
            if ($get(MasterObj + "OptSDType1").checked) {
                $get(MasterObj + "KCalEDate_txtDay").disabled = false;
                $get(MasterObj + "KCalEDate_txtMonth").disabled = false;
                $get(MasterObj + "KCalEDate_txtYear").disabled = false;
            }
            else {
                $get(MasterObj + "KCalEDate_txtDay").disabled = true;
                $get(MasterObj + "KCalEDate_txtMonth").disabled = true;
                $get(MasterObj + "KCalEDate_txtYear").disabled = true;
            }
        }
        //*******************************************************************************
        function CheckNotEmpty() {
            if ($get(MasterObj + "txtSchedulingName").value == "") {
                $get(MasterObj + "txtSchedulingName").focus()
                alert("لطفا نام را وارد نماييد")
                return false;
            }
            else if ($get(MasterObj + "txtSchedulingCode").value == "") {
                $get(MasterObj + "txtSchedulingCode").focus()
                alert("لطفا کد زمانبندي را وارد نماييد")
                return false;
            }
            else if ($get(MasterObj + "CmbPeriodType").value == "0") {
                $get(MasterObj + "CmbPeriodType").focus()
                alert("لطفا محدوده تکرار را مشخص نماييد")
                return false;
            }
            else if ($get(MasterObj + "CmbPeriodType").value != "0" &
               $get(MasterObj + "txtPeriodFactor").value == "") {
                $get(MasterObj + "txtPeriodFactor").focus()
                alert("لطفا تعداد تکرار در محدوده را مشخص نماييد")
                return false;
            }
            else if ($get(MasterObj + "OptSDType1").checked &
                    $get(MasterObj + "KCalEDate_txtDay").value == "") {
                $get(MasterObj + "KCalEDate_txtDay").focus()
                alert("لطفا تاريخ خاتمه را وارد نماييد")
                return false;
            }
            else if ($get(MasterObj + "OptPrType1").checked &
                        $get(MasterObj + "txtOccurTime").value == "") {
                $get(MasterObj + "txtOccurTime").focus()
                alert("لطفا زمان تکرار را وارد نماييد")
                return false;
            }
            else if ($get(MasterObj + 'KCalSDate_txtDay').value == '') {
                alert("تاريخ شروع را وارد نماييد")
                return 
            }
            else if ($get(MasterObj + "OptSDType1").checked &
                    $get(MasterObj + 'KCalSDate_txtDay').value != '' &
                        $get(MasterObj + 'KCalEDate_txtDay').value != '') {
                if (!CheckDate()) {
                    alert("تاريخ شروع بايد کوچکتر از تاريخ خاتمه باشد.")
                    return false;
                }
            }
            if ($get(MasterObj + "OptPrType2").checked) {
                if ($get(MasterObj + "txtOccurFrequency").value == "") {
                    $get(MasterObj + "txtOccurFrequency").focus()
                    alert("لطفا شرايط تکرار را وارد نماييد")
                    return false;
                }
                else if ($get(MasterObj + "txtSOTime").value == "") {
                    $get(MasterObj + "txtSOTime").focus()
                    alert("لطفا شرايط تکرار را وارد نماييد")
                    return false;
                }
                else if ($get(MasterObj + "txtEOTime").value == "") {
                    $get(MasterObj + "txtEOTime").focus()
                    alert("لطفا شرايط تکرار را وارد نماييد")
                    return false;
                }
                else
                    return true;
            }
            else
                return true;
        }
        //*******************************************************************************
        function SetDescr() {
            var StrHTML = "زمانبندي هر"
            if ($get(MasterObj + "CmbPeriodType").value==3) //ماهانه
                StrHTML+=" "+$get(MasterObj + "txtDayofMonth").value+" امين روز از هر"+(($get(MasterObj + "txtMonthPeriodFactor").value=="1")? "":$get(MasterObj + "txtMonthPeriodFactor").value)+" ماه "
            else if ($get(MasterObj + "CmbPeriodType").value==2) //هفته   
            {
                StrHTML+=" "+$get(MasterObj + "txtPeriodFactor").value+" هفته "
                var StrWeekDay = "";
                if ($get(MasterObj + "ChkSaturDay").checked)
                    StrWeekDay += 'شنبه,';
                if ($get(MasterObj + "ChkSunDay").checked)
                    StrWeekDay += 'يکشنبه,';
                if ($get(MasterObj + "ChkMunDay").checked)
                    StrWeekDay += 'دوشنبه,';
                if ($get(MasterObj + "ChkTuesDay").checked)
                    StrWeekDay += 'سه شنبه,';
                if ($get(MasterObj + "ChkWednesDay").checked)
                    StrWeekDay += 'چهارشنبه,';
                if ($get(MasterObj + "ChkThursDay").checked)
                    StrWeekDay += 'پنج شنبه,';
                if ($get(MasterObj + "ChkFriDay").checked)
                    StrWeekDay += 'جمعه,';
                if (StrWeekDay!="")
                StrHTML+="روزهاي "+StrWeekDay    
            } 
            else if ($get(MasterObj + "CmbPeriodType").value==1) 
                StrHTML+=" "+$get(MasterObj + "txtPeriodFactor").value+" روز " ;

            if ($get(MasterObj + "OptPrType1").checked)
                StrHTML += " در ساعت " + $get(MasterObj + "txtOccurTime").value
            else if ($get(MasterObj + "OptPrType2").checked) {
                StrHTML += " هر " + $get(MasterObj + "txtOccurFrequency").value + " " + $get(MasterObj + 'CmbOccurType')($get(MasterObj + 'CmbOccurType').selectedIndex).text;
                StrHTML += " بين ساعات " + $get(MasterObj + "txtSOTime").value + " و " + $get(MasterObj + "txtEOTime").value
            }    
                
          //  var SD = $get(MasterObj + "KCalSDate_txtYear").value+'/'+$get(MasterObj + "KCalSDate_txtMonth").value+'/'+$get(MasterObj + "KCalSDate_txtDay").value
            var ED = (($get(MasterObj + "OptSDType2").checked) ? '' : $get(MasterObj + "KCalEDate_txtDay").value) + '/' + $get(MasterObj + "KCalEDate_txtMonth").value+'/'+$get(MasterObj + "KCalEDate_txtYear").value 

            var SD =   $get(MasterObj + "KCalSDate_txtDay").value+  '/'+$get(MasterObj + "KCalSDate_txtMonth").value + '/' + $get(MasterObj + "KCalSDate_txtYear").value
//            var ED = (($get(MasterObj + "OptSDType2").checked) ? '' : $get(MasterObj + "KCalEDate_txtDay").value+  '/'+$get(MasterObj + "KCalEDate_txtMonth").value + '/' + $get(MasterObj + "KCalEDate_txtYear").value
            
            StrHTML += " از تاريخ: " + SD;
            if ($get(MasterObj + "OptSDType1").checked)
                StrHTML += " تا تاريخ: " + ED
            StrHTML += " انجام مي شود "

            $get(MasterObj + "txtDescr").value = StrHTML
        }
    //**********************************EndThiesPag************************************
</script>     
</asp:Content>

