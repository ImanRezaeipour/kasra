<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ArchiveInformation.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.ArchiveInformation" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.CssBtn
{
    background-position:center;
	BACKGROUND-REPEAT: no-repeat;	
	BACKGROUND-COLOR: transparent;
	BORDER-RIGHT: #346fa4 2px solid; 
	BORDER-TOP: lightsteelblue 2px solid; 
	BORDER-LEFT: lightsteelblue 2px solid; 
	BORDER-BOTTOM: #346fa4 2px solid;  
	WIDTH: 65px;
	HEIGHT: 30px	
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="text-align:center;vertical-align:middle">
        <table>
            <tr>
                <td>
                    <fieldset  style=" width:100%; border-right: lightblue thin inset; border-top: lightblue thin solid;
                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;" >
                        <legend style="color: lightblue"></legend>
                        <table id="Table1" width="600px"   >
                            <tr>
                                <td>
                                    از تاريخ :
                                </td>
                                <td>
                                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                                </td>
                                <td>
                                    تا تاريخ :
                                </td>
                                <td>
                                    <uc3:KCalendar ID="KCalEDate" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" >
                                    <fieldset   style=" width:90%; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;" >
                                        <legend style="color: lightblue">اطلاعات آرشيوي</legend>
                                        <table id="Table2" width="80%" >
                                            <tr>
                                                <td style="text-align:right" >
                                                    <input type="checkbox" id="chkClock" />ترددهاي ساعت
                                                </td>
                                                <td style="text-align:right">
                                                    <input type="checkbox" id="chkPairAttendance" />ترددهاي زوج شده
                                                </td>
                                                <td style="text-align:right">
                                                    <input type="checkbox" id="chkRule" />قوانين اختصاصي
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right">
                                                    <input type="checkbox" id="chkMonthlyResult" />نتايج محاسبات روزانه
                                                </td>
                                                <td style="text-align:right">
                                                    <input type="checkbox" id="chkDailyResult" />نتايج محاسبات ماهانه
                                                </td>
                                                <td style="text-align:right">
                                                    <input type="checkbox" id="chMonthlyResult" />آيتم هاي ماهانه
                                                </td>
                                            </tr>
                                          
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="color:Red " >
                                    * هشدار : امکان آرشيو اطلاعات براي دوره هاي قطعي نشده وجود ندارد.
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <table style="width: 94px">
                        <tr>
                            <td>
                                <input id="BtnOK" name="BtnOK" type="button" onclick="onClickBtnOK()" style="background-image: url('../../App_Utility/Images/ModifyPersonImage/btnok.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        function onClickBtnOK() {
            setTimeout(setAlert, 4500);
        }
        function setAlert() {
            alert("آرشيو اطلاعات با موفقيت انجام شد");
            Clear();
        }
        function Clear() {
            document.getElementById(MasterObj + "KCalSDate_txtCalendar").value = "";
            document.getElementById(MasterObj + "KCalEDate_txtCalendar").value = "";
            document.getElementById("chMonthlyResult").checked = false;
            document.getElementById("chkDailyResult").checked = false;
            document.getElementById("chkMonthlyResult").checked = false;
            document.getElementById("chkRule").checked = false;
            document.getElementById("chkPairAttendance").checked = false;
            document.getElementById("chkClock").checked = false;
        }
    </script>
</asp:Content>
