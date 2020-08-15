<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="RequestList.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.TouchPages.RequestList" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssDivName
        {
            font-family: B titr;
            font-size: 18;
            float: inherit;
            color: White;
        }
        .CssBtn
        {
            border: 1px ridge #000000;
            width: 260px;
            height: 95px;
            text-align: center;
            vertical-align: middle;
            background-image: url('../../../App_Utility/Images/Icons/BG39.png');
            cursor: hand;
            float: right;
        }
        .CssSpace
        {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: right; vertical-align: middle; border: 1px outset #000000;
        width: 100%; height: 70px; background-image: url('../../../App_Utility/Images/Icons/New0444.gif');">
        &nbsp;&nbsp;&nbsp; <span id="SpanInfo" style="font-size: 17px; font-family: B Titr;
            color: black;width:38%;" runat="server"></span><span id="SpanDateInfo" style="direction: ltr;text-decoration:underline;
                font-size: 24px; width:30%; font-family: B Titr; color: black;" runat="server">
            </span>
            <span style="width:30%;text-align:center;">
            <span style="color: black; font-weight: bold; background-color: #2D6099;
                border: 2px ridge #FFFF00; text-align: center; vertical-align: middle; width: 150px;
                height: 70px; margin-top: 2px; font-size: 20px; font-family: B titr; background-image: url('../../../App_Utility/Images/Icons/BDFls2.gif');
                background-position: center; cursor: hand;" id="divExit">
                <br style="font-size: 4px;" />
                خروج&nbsp;&nbsp;<img src="../../../App_Utility/Images/Icons/Cross.gif" alt="" style="width: 30px;
                    height: 30px" />
            </span></span>
    </div>
    <div style="text-align: center; vertical-align: middle; border: 1px solid #87CEFA;
        width: 99%; height: 100%; background-color: #91B7DF; position: relative; display: block;"
        id="DivBase">
        <div style="text-align: center; vertical-align: middle; border: 1px solid #87CEFA;
            width: 97%; height: 100%; background-color: #6196D1; position: relative; display: block;">
            <div style="text-align: center; vertical-align: middle; border: 1px solid #0099FF;
                width: 99%; height: 100%; background-color: #C3D8F5; position: relative; display: block;">
                <div id="divBtn" style="padding: 6px; margin: 3px; text-align: right; border: 1px solid #FF0000;
                    vertical-align: middle; width: 99%; height: 100%; background-color: #FFFFEA;
                    position: relative; display: block;" runat="server">
                </div>
            </div>
        </div>
    </div>
    <div style="border: 1px outset #000000; width: 100%; height: 40px; background-image: url('../../../App_Utility/Images/Icons/New0444.gif');">
    <div id="DivExit" style="position:absolute;top:1px;left:1px;z-index:500;background-color:#DAB9F4; text-align:center;vertical-align:middle;font-size: 24px;  font-family: B Titr; color: black;">به سيستم کنترل تردد کسرا خوش آمديد</div>
        <cc1:MySecurity ID="OnLineUser" runat="server" Visible="false">
        </cc1:MySecurity>
        <script language="javascript" type="text/javascript">

            $(document).ready(function () {
                $("#DivExit").hide();
                $("#DivBase").css("width", $(window).width() - 100);
                $("#DivExit").css("width", $(window).width());
                $("#DivExit").css("height", $(window).height());
                $("#DivBase").css("height", $(window).height() - 150);

                $(".CssBtn").click(function () {
                    var url = $(this).attr("UrlPage");
                    window.showModalDialog(url, window, "dialogWidth:" + $(window).width() + ";dialogHeight:" + $(window).height() + ";");
                });
                $("#divExit").click(function () {
                    var self = window.open("", "_self");
                    self.focus();
                    self.opener = self;
                    self.close();
                });
            });    
  
        </script>
</asp:Content>
