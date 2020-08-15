<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CodeStatusYear.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.CodeStatusYear"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssSymbolStyle
        {
            /* border: 1px groove #000000;
            background-color: #FFFFCC;*/
        }
        .CssHeaderInfo
        {
            /* border: 1px groove #000000;
            background-color: #FFD7FF;*/
        }
        .CssCellsStyle
        {
            border: 1px groove #000000;
            background-color: #BBD1E8; 
            font-size: 8;
        }
         .CssInputStyle
        {
            height:15px;
            width:15px;
            background-color:transparent;
            border:none;
            font-size: 10;
        }
        .CssHeader
        {
            background-image: url('../../App_Utility/Images/Icons/BGNew.png');
            background-repeat: repeat-x;
            color: Black;
            font-weight: 550;
        }
        .CssFilter
        {
            background-image: url('../../App_Utility/Images/Icons/S8.png');
            background-repeat: no-repeat;
            cursor: hand;
            color: black;
            width: 50px;
            background-color: White;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            پرسنلی:
                        </td>
                        <td>
                            <uc1:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                        <td>
                            سال:
                        </td>
                        <td>
                            <select class="TxtControls" style="width: 100px" id="CmbYear" runat="server">
                            </select>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <uc2:ToolBar ID="OToolBar" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px groove #000000; height: 300px" valign="top" align="right">
                <table>
                    <tr>
                        <td valign="top" align="right">
                            <table id="TblYear" style="width: 100px" cellpadding="0" cellspacing="0">
                            </table>
                        </td>
                        <td style="" valign="top" align="right">
                            <div id="DivGridData" style="overflow: auto; z-index: 10; width: 100%; overflow-y: hidden;
                                overflow-x: auto;">
                                <table id="TblDays" cellpadding="0" cellspacing="0">
                                </table>
                            </div>
                        </td>
                        <td valign="top" align="right">
                            <table id="TblSums" cellpadding="0" cellspacing="0">
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">سیمبل ها </legend>
                    <table>
                        <tr>
                            <td>
                                <table id="TblSign">
                                </table>
                            </td>
                            <td>
                                <table id="TblHeader">
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">اطلاعات سایر کدها</legend>
                    <table id="TblOtherCodes">
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="hidden" id="txtXml" runat="server" />
        <input type="hidden" id="txtSessionID" runat="server" />
        <input type="hidden" id="txtGetCompanyFinatialPeriodID" runat="server" />
        <input type="text"  id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
    <script src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var Symbols;
        var primeryVal = $("#" + MasterObj + "CmbYear").val()


        $(document).ready(function () {
            $get("OToolBar_TDTopToolBar").style.display = "none"
        });
        function OnClickBtnFilter() {
            Filter();
        }
        function OnClickBtnShowAll() {
            $("#" + MasterObj + "CmbPerson_txtCode").val("")
            $("#" + MasterObj + "CmbPerson_txtPCode").val("")
            $("#" + MasterObj + "CmbPerson_txtName").val("")
            $("#" + MasterObj + "CmbYear").val(primeryVal)
            Filter();
        }
        function Filter() {
            OpenModelPopup();
            $.ajax({
                type: "POST",
                url: "CodeStatusYear.aspx/BindGrid?SubmitMode=Ajax",
                contentType: "application/json; charset=utf-8",
                data: "{PersonCode:'" + $("#" + MasterObj + "CmbPerson_txtCode").val() + "' ,Year:'" + $("#" + MasterObj + "CmbYear").val() + "', CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                success: function (Data) {
                    CreateGrid(Data.d);
                    CloseModelPopup();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("با خطا مواجه شد" + jqXHR.responseText);
                    CloseModelPopup();
                }
            });
        }
        //--------------------------
        function CreateGrid(Data) {
            $("#TblYear").find("tr").remove();
            $("#TblDays").find("tr").remove();
            $("#TblSums").find("tr").remove();
            $("#TblSign").find("tr").remove();
            $("#TblHeader").find("tr").remove();
            $("#TblOtherCodes").find("tr").remove();
            var xml;
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            CreateHeader(xml);
            CreateSign(xml);
            $(xml).find("NewDataSet").find("CardexYear").each(function () {
                AddRow($(this), xml);
            });
            CreateFooter(xml);
        }
        //------------------------
        function AddRow(Obj, xml) {
            $("#TblYear").append("<tr><td  style='height:20px;' class='CssHeader'>&nbsp;&nbsp;" + Obj.find("Name").text() + "</td></tr>");
            $("#TblDays").append("<tr></tr>");
            $("#TblSums").append("<tr></tr>");
            var Row = $("#TblDays").find("tr:eq(" + ($("#TblYear").find("tr").length - 1) + ")");
            var DateName, DateDay, Holiday, Credits;
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             DateDay = $(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[0];
             if ($(Obj).find("S" + $(this).siblings("Code").text()).text().split(";").length > 1) {
                 DateName = $(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[1];
                 Holiday = $(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[2].split(",")[0];
                 if ($(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[2].split(",").length > 1)
                     Flag = $(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[2].split(",")[1];
                 else Flag = 0;
                 Credits = $(Obj).find("S" + $(this).siblings("Code").text()).text().split(";")[3];
             }
             else {
                 DateDay = "";
                 DateName = "";
                 Flag = 0;
                 Credits = "";
             }

             Row.append("<td class='CssCellsStyle'  align='center' style='height:20px;" + (Flag == 1 ? "background-color:#C5B6C9" : "") + "' title='" + DateDay + "\n" + DateName + "\n" + Holiday + "'>" + CreateHtmlCredit(Credits, xml) + "</td>");
         });
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
          function () {
              $("#TblSums").find("tr:eq(" + ($("#TblSums").find("tr").length - 1) + ")").append("<td class='CssHeader'  align='center' style='height:20px;' title='" + $(Obj).find("H" + $(this).siblings("Value").text()).text() + "' >" + $(Obj).find("H" + $(this).siblings("Code").text()).text() + "</td>");
          });
            }
        //-------------------
        function CreateHtmlCredit(Credits, xml) {
            var xmlC;
            if (window.ActiveXObject) {
                xmlC = new ActiveXObject('Microsoft.XMLDOM');
                xmlC.async = 'false';
                xmlC.loadXML(Credits);
            } else {
                var parser = new DOMParser();
                xmlC = parser.parseFromString(Credits, 'text/xml');
            }
            var Code, XmlNode;
            var StrHtml = "";
            var StrOther = "";
            var CodeName, Value;
            var DefImg = $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "D" }).siblings("Value").text();
            $(xmlC).find("Root").find("D").each(function () {
                Code = $(this).find("Code").text();
                XmlNode = $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "S" && $(this).siblings("Code").text() == Code });
                CodeName = $(this).find("CodeName").text();
                Value = $(this).find("Value").text();
                if (XmlNode.length > 0) {
                    StrHtml += "<input type='text' class='CssInputStyle'  value='" + XmlNode.siblings("Value").text() + "' tooltip='" + CodeName + ":" + Value + "'/>";
                }
                else {
                    StrOther += CodeName + ":" + Value + "\n";
                }
            });
            return StrHtml + (StrOther == "" ? "" : "<input type='text'  class='CssInputStyle' value='" + DefImg + "' tooltip='" + StrOther + "'/>");
        }
        //------------------------------------------------
        function CreateHeader(xml) {
            $("#TblYear").append("<tr><td class='CssHeader' style='height:20px;width:80px' align='center'>نام دوره </td></tr>");
            $("#TblDays").append("<tr></tr>");
            $("#TblSums").append("<tr></tr>");

            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             $("#TblDays").find("tr:eq(0)").append("<td class='CssHeader' style='height:20px;width:50px;overflow:visible' align='center'>" + $(this).siblings("Code").text() + "</td>");
         });
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
         function () {
             $("#TblSums").find("tr:eq(0)").append("<td class='CssHeader' style='height:20px;width:80px' align='center'>" + $(this).siblings("Value").text() + "</td>");
         });
        }
        //--------------------------------
        function CreateFooter(xml) {
            $("#TblYear").append("<tr><td class='CssHeader' style='width:80px;height:20px;' align='center'> جمع</td></tr>");
            $("#TblDays").append("<tr></tr>");
            $("#TblSums").append("<tr></tr>");

            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "T" }).each(
         function () {
             $("#TblDays").find("tr:eq(" + ($("#TblDays").find("tr").length - 1) + ")").append("<td class='CssHeader' style='width:50px;height:20px;;overflow:visible' align='center'></td>");
         });
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
         function () {
             $("#TblSums").find("tr:eq(" + ($("#TblSums").find("tr").length - 1) + ")").append("<td class='CssHeader' style='width:50px;height:20px;' align='center'>" + $(this).siblings("SumVal").text() + "</td>");
         });
        }
        //----------------------
        function CreateSign(xml) {
            $("#TblSign").append("<tr></tr><tr></tr>");
            $("#TblHeader").append("<tr></tr>");
            $("#TblOtherCodes").append("<tr></tr>");
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "S" }).each(
         function () {
             $("#TblSign").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='center'><div style='float:right'>" + $(this).siblings("CodeName").text() + ":</div><div>" + $(this).siblings("Value").text() + "</div></td>");
             Symbols += "," + $(this).siblings("Code").text() + ",";
         });
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "D" }).each(
         function () {
             $("#TblSign").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='center'><div style='float:right'>سایر:</div><div>"+ $(this).siblings("Value").text() +"&nbsp;&nbsp;&nbsp;&nbsp;</div></td>");
         });
            //----------------
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "H" }).each(
         function () {
             $("#TblSign").find("tr:eq(1)").append("<td class='CssHeaderInfo' style='overflow:visible' align='center'><div style='float:right;color:black;'>" + $(this).siblings("Value").text() + ":</div><div>" + $(this).siblings("CodeName").text() + "&nbsp;&nbsp;&nbsp;&nbsp;</div></td>");
         });
            $(xml).find("NewDataSet").find("CardexInfo").find("Type").filter(function () { return $(this).text() == "F" }).each(
         function () {
             $("#TblOtherCodes").find("tr:eq(0)").append("<td class='CssSymbolStyle' style='overflow:visible' align='center'><div style='float:right;color:black;'>" + $(this).siblings("CodeName").text() + ":</div><div>" + $(this).siblings("Value").text() + "&nbsp;&nbsp;&nbsp;</div></td>");
         });
        }
        //-------------------------------
        function OnClickBtnPDF() {
            $("#" + MasterObj + "txtSubmit").val("OnePDF");
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //------------------------------
        function OnClickBtnExcel() {
            $("#" + MasterObj + "txtSubmit").val("OneExcel");
            $("#" + MasterObj + "BtnSubmit").click()
        }
    </script>
</asp:Content>
