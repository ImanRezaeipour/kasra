﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KCalendar.ascx.cs" Inherits="TAPresentation.App_Utility.NewCalendar.KCalendar" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<script language="javascript"  src="/TAPresentation/App_Utility/Calendar/Script/CalScript.js"></script>
<script language="javascript"  src="/TAPresentation/App_Utility/Calendar/Script/KCalendar.js"></script>
<script language="javascript" src="/TAPresentation/App_Utility/Calendar/Script/SPECIAL_DAYS.js"></script>
    
<link rel="stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/aqua/theme.css" title="Aqua" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-blue.css" title="winter" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-blue2.css" title="blue" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-brown.css" title="summer" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-green.css" title="green" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-win2k-1.css" title="win2k-1" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-win2k-2.css" title="win2k-2" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-win2k-cold-2.css" title="win2k-cold-2" />
<link rel="alternate stylesheet" type="text/css" media="all" href="/TAPresentation/App_Utility/Calendar/skins/calendar-system.css" title="system" />

<style type="text/css">
    .special
    {
      background-color: #FFCCFF;
      color: #fff;
      font-family: Kasratahoma,verdana,sans-serif;
      font-size: 11px;
      background-color: #FFFFFF
  
    }
    .TDay
    {
        border-style: outset outset outset none;
        border-width: 1px;
        border-color: #6699FF;
        font-weight: bold;
        font-family: Kasratahoma,verdana,sans-serif;    
        font-weight:bold;
	    font-size: 11pt;
  
    }
    .TxtCalendar
    {
      border-width: 0px;
      width: 15px;
      font-weight: bold;
      font-family: Kasratahoma;
      font-size: 11px;  
    }
    .TMonth
    {
        border-style: outset none outset none;
        border-width: 1px;
        border-color: #6699FF;
        font-weight: bold;
        font-family: Kasratahoma,verdana,sans-serif;
 
  font-weight:bold;
	font-size: 11pt;
    }
    .TSlash
    {
        border-style: outset none outset none;
        border-width: 1px;
        border-color: #6699FF;
        font-weight: bold;
        font-family: Kasratahoma,verdana,sans-serif;
        font-size: 11px;
    }
    .TImag
    {
        border-style: outset outset outset outset;
        border-width: 1px;
        border-color: #6699FF;
        font-weight: bold;
        font-family: Kasratahoma,verdana,sans-serif;
    font-size: 11px;
    background-color:#91b7df
    }
</style>

 <table  border="0" id="TBMain" IsMainTable="true" runat="server"  dir="rtl" align="right" 
    cellpadding="0" cellspacing="0"  >
                <tr id="tr" style="display:none">
                    <td id="td0" class="TDay">
                        <input id="txtDay" runat="server" onblur="F_OnblurAllText(this)" class="TxtCalendar"
                            type="text" inputType="Day" onkeyup="F_OnkeyUpText(this)" onfocus="F_OnFocus(this)" onkeydown="F_OnKeyDownInt(this.value),F_onkeydownText(this)"   />
                    </td>
                    <td id="td1"  class="TSlash" valign="bottom">
                      <span class="TxtCalendar" style="width:5px;height:16px; margin:0;background-color:White"> / </span>
                    </td>
                    <td id="td2"   class="TMonth">
                        <input id="txtMonth" runat="server" onblur="F_OnblurAllText(this)" class="TxtCalendar"
                            type="text" inputType="Month" onkeyup="F_OnkeyUpText(this)" onfocus="F_OnFocus(this)" onkeydown="F_OnKeyDownInt(this.value),F_onkeydownText(this)"/>
                    </td>
                    <td id="td3" class="TSlash" valign="bottom">
                     <span class="TxtCalendar" style="width:5px;height:16px; margin:0;background-color:White"> / </span>
                    </td>
                    <td id="td4"  class="TMonth">
                        <input id="txtYear" runat="server" onblur="F_OnblurAllText(this)" style=" width: 30px;" class="TxtCalendar"
                            type="text" inputType="Year" onkeyup="F_OnkeyUpText(this)" onfocus="F_OnFocus(this)"  onkeydown="F_OnKeyDownInt(this.value),F_onkeydownText(this)"/>
                    </td>
                    <td id="td5"  class="TImag" >
                            <input id="btnImg"  onclick="F_GetCal()" runat="server" type="button"  style="border-style: none; background-position: center;
                            background-image: url('/TAPresentation/App_Utility/Calendar/Icon/cal.gif'); width: 24px; background-repeat: no-repeat;
                            background-color: #91b7df;" />
                    </td>
                    <td style="display: none">
                        <input id="txtHidden" runat="server" style="width: 1px" onchange="F_onChangeHidden(this)" type="text" />
                        <input id="txtFlag" runat="server" style="width: 1px"  type="text" />
                    </td>
                </tr>
                <tr><td>
                <asp:TextBox ID="txtCalendar" runat="server"  onchange="onchangeTxtCalender()" 
                        Width="120px"  onclick="onClickForFocus()"></asp:TextBox>
               
                    <cc1:PersianCalendarExtender ID="txtCalendar_PersianCalendarExtender" 
                        runat="server" Enabled="True" TargetControlID="txtCalendar" PopupButtonID="btnCalender">
                    </cc1:PersianCalendarExtender>
               
                <input id="btnCalender"   runat="server" type="button"  style="border-style: none; background-position: center;
                            background-image: url('/TAPresentation/App_Utility/Calendar/Icon/cal.gif'); width: 24px; background-repeat: no-repeat;
                            background-color: #91b7df;" />
                
                </td></tr>
            </table>
            <script type="text/javascript" language="javascript">
                    //document.getElementById(this.id + "_txtMonth").value
                    function onchangeTxtCalender() {
                        this.id = F_GetUserControlID(event.srcElement);
                        document.getElementById(this.id + "_txtMonth").value = document.getElementById(this.id + "_txtCalendar").value.substr(3, 2)
                        document.getElementById(this.id + "_txtDay").value = document.getElementById(this.id + "_txtCalendar").value.substr(0, 2)
                        document.getElementById(this.id + "_txtYear").value = document.getElementById(this.id + "_txtCalendar").value.substr(6, 4)
                    }
                    function onClickForFocus() {
                        this.id = F_GetUserControlID(event.srcElement);
                        document.getElementById(this.id + "_txtCalendar").focus();
                        document.getElementById(this.id + "_txtCalendar").select();
                    }
                </script>






