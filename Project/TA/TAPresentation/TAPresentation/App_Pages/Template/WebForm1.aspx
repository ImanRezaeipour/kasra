<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TAPresentation.App_Pages.Template.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridViewCommandEventArgs </title>
    <script language="javascript">
        function onclicklbl() {
            alert("dddd")
        }
    </script>
    <style type="text/css">

        #ToDate
        {
            width: 75px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">

    <div>
---------------------------
Message from webpage
---------------------------
<TD style="HEIGHT: 20px; COLOR: blue; TEXT-DECORATION: underline" onclick="window.showModelessDialog('MainDailyReport.aspx?PersonCode=101422 &amp;SDate=1388/10/01 &amp;EDate=1388/10/30 &amp;RequsterPageID=1306 &amp;RequsterAction=PersonCode &amp;SessionID=5853 &amp;OnLineUser=105216',window,'dialogWidth:1050px;dialogHeight:750px;center: Yes;minimize: yes')"><SPAN style="WIDTH: 60px; DISPLAY: inline-block; CURSOR: hand" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata>101422</SPAN></TD>
<TD style="HEIGHT: 20px"><SPAN style="WIDTH: 120px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata title="خدارحمي  موسوي  سيدمحسن">خدارحمي موسوي...</SPAN></TD>
<TD style="HEIGHT: 20px"><SPAN style="WIDTH: 70px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata></SPAN></TD>
<TD style="HEIGHT: 20px"><SPAN style="WIDTH: 70px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata></SPAN></TD>
<TD style="HEIGHT: 20px; COLOR: blue; TEXT-DECORATION: underline"><SPAN style="WIDTH: 70px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata></SPAN></TD>
<TD style="HEIGHT: 20px"><SPAN style="WIDTH: 70px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata></SPAN></TD>
<TD style="HEIGHT: 20px; COLOR: blue; TEXT-DECORATION: underline"><SPAN style="WIDTH: 70px; DISPLAY: inline-block" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata></SPAN></TD>
<TD style="HEIGHT: 20px; COLOR: blue; TEXT-DECORATION: underline" onclick="window.showModalDialog('../DataEntry/EnterCredit.aspx?Flag=Kasrkar &amp;OnLineUser=105216 &amp;MainCode=LackCode &amp;SPersonCode=101422 &amp;SDate=1388/10/01 &amp;EDate=1388/10/30 &amp;SessionID=5853',window,'dialogWidth:900px;dialogHeight:540px;center: Yes')"><SPAN style="WIDTH: 70px; DISPLAY: inline-block; CURSOR: hand" id=ctl00_ContentPlaceHolder1_GrdMontly_ctl08_lbldata>88:03</SPAN></TD>
<TD style="HEIGHT: 20px; COLOR: blue; TEXT-DECORATION…
---------------------------
OK   
---------------------------



</div>
    </form>
  </body>

</html>
