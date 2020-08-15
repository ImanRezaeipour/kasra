<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="SelectEvents.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.SelectEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 100px">
        <div id="DivParam">
            <select id="CmbEvent">
                <option value="onclick">onclick</option>
                <option value="onchange">onchange</option>
            </select>
            <select id="CmbEvents" runat="server" onchange="OnChangeCmb(this)">
            </select><input type="button" style="width: 100" value="اضافه کردن" onclick="onclickBtnAdd()" />
        </div>
        <table id="TblParameterName">
            <tr class="CssHeaderStyle">
            </tr>
        </table>
        <table id="TblParameterValue">
            <tr>
            </tr>
        </table>
    </div>
    <div style="height:300px">
        <table id="TblBaseEvent">
            <tr class="CssHeaderStyle">
                <td style="width: 50">
                    انتخاب
                </td>
                <td style="width: 300">
                    روال
                </td>
            </tr>
        </table>
    </div>
    <div><input type="button" value="تایید" onclick="onclickBtnOK()" style="width:100px" class="CssHeaderStyle" /> </div>
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        function OnChangeCmb(Cmb) {
            clearGrid();
            for (var counter = 0; counter < $(Cmb).val().split(",").length; counter++) {
                if ($(Cmb).val().split(",")[counter] != "") {
                    $("#TblParameterName").find("tr:eq(0)").append("<td style='width:100px'>" + $(Cmb).val().split(",")[counter] + "</td>");
                    $("#TblParameterValue").find("tr:eq(0)").append("<td style='width:100px'><input type='text' style='width:90px' class='TxtControls'/> </td>");
                }
            }
        }
        function clearGrid() {
            $("#TblParameterName").find("tr:eq(0)").html("");
            $("#TblParameterValue").find("tr:eq(0)").html("");
        }
        function onclickBtnAdd() {
            var Params = "";
            $("#TblParameterValue").find("tr:eq(0)").find("td").each(function () {
                if (Params != "")
                    Params += ",";
                Params += $(this).children(0).val();
            });
            $("#TblBaseEvent").append("<tr><td><input type='checkbox'/></td><td align='ltr'>" + $("#CmbEvent").val() + ":" + $("#" + MasterObj + "CmbEvents")[0].all($("#" + MasterObj + "CmbEvents")[0].selectedIndex).text + "(" + Params + ")" + "</td></tr>");
        }
        function onclickBtnOK() {
            var StringReturn = "";
            $("#TblBaseEvent").find("tr").each(function () {
                if ($(this).find("td:eq(0)").find("input").attr("checked"))
                    StringReturn = StringReturn + (StringReturn != "" ? "@" : "") + $(this).children(1).text();
            });
            window.returnValue = StringReturn;
            window.close();
        }
    </script>
</asp:Content>
