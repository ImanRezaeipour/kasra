<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KCalendar.ascx.cs" Inherits="TAPresentation.App_Utility.NewCalendar.KCalendar" %>
<script language="javascript" src="/TAPresentation/App_Utility/NewCalendar/Script/KCalendar.js?v=1.2"></script>
<script language="javascript" src="/TAPresentation/App_Utility/NewCalendar/Script/TextDate.js"></script>
<script language="javascript" src="/TAPresentation/App_Utility/NewCalendar/Script/MyDate.js"></script>
<style type="text/css">
    .TxtCalendar
    {
        border-width: 0px;
        width: 15px;
        font-weight: bold;
        font-family: tahoma;
        font-size: 11px;
    }
    
    
    
    .txtControlFotCld
    {
        font-size: 8pt;
        font-family: tahoma;
        background-color: white;
        border-color: lightsteelblue;
        height: 20px;
    }
</style>
<table border="0" id="TBMain" IsMainTable="true" runat="server" dir="rtl" align="right"
    cellpadding="0" cellspacing="0">
    <tr id="tr" style="display: none" >
        <td id="td0">
            <input id="txtDay" runat="server" class="TxtCalendar" type="text" inputtype="Day" />
        </td>
        <td id="td1" valign="bottom">
            <span class="TxtCalendar" style="width: 5px; height: 16px; margin: 0; background-color: White">
                / </span>
        </td>
        <td id="td2">
            <input style="display: none" id="txtMonth" runat="server" class="TxtCalendar" type="text"
                inputtype="Month" />
        </td>
        <td id="td3" valign="bottom">
            <span class="TxtCalendar" style="width: 5px; height: 16px; margin: 0; background-color: White">
                / </span>
        </td>
        <td id="td4">
            <input id="txtYear" runat="server" style="width: 30px;" class="TxtCalendar" type="text"
                inputtype="Year" />
        </td>
        <td id="td5" f class="TImag">
            <input id="btnImg" runat="server" type="button" style="border-style: none; background-position: center;
                background-image: url('/TAPresentation/App_Utility/Calendar/Icon/cal.gif'); width: 24px;
                background-repeat: no-repeat; background-color: #91b7df;" />
        </td>
        <td style="display: none">
            <input id="txtHidden" runat="server" style="width: 1px" type="text" />
            <input id="txtFlag" runat="server" style="width: 1px" type="text" />
            <input id="txtDateNow" runat="server" style="width: 1px" type="text" />
             <input id="txtXmlHoliday" type="text" runat="server" />
             <input id="txtOnChangeFunc" type="text" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <asp:TextBox class="txtControlFotCld" ID="txtCalendar" runat="server" onblur="onchangeTxtCalender()"
                onkeydown="F_onkeydownText(this)" onchange="onchangeTxtCalender()" Width="120px"
                onclick="onClickForFocus()"></asp:TextBox>
            <%--<cc1:PersianCalendarExtender ID="txtCalendar_PersianCalendarExtender" 
                        runat="server" Enabled="True" TargetControlID="txtCalendar" PopupButtonID="btnCalender">
                    </cc1:PersianCalendarExtender>--%>
            <input id="btnCalender" onclick="btnShowCalenderOnClick()" runat="server" type="button"
                style="border-style: none; background-position: center; background-image: url('/TAPresentation/App_Utility/Calendar/Icon/cal.gif');
                width: 24px; background-repeat: no-repeat; background-color: #91b7df;" />
        </td>
    </tr>
   
</table>

<script type="text/javascript" language="javascript">
    //document.getElementById(this.id + "_txtMonth").value
    //                    function onclickbtnCalender() {
    //                    alert(1)
    //                    }
</script>
