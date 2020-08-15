<%@ Page Title="------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="EnterDataSetting.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.EnterDataSetting" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
       <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:toolbar id="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <input type="text" id="txtXmlGrd" name="txtXmlGrd" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <select id="CmbSchemas" class="TxtControls CssInsertNewItem" style="width: 170px"
                        runat="server">
                    </select>
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <asp:HiddenField ID="txtFilePath" runat="server" />
                    <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
                    <input type="text" id="txtID" name="txtID" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
                </div>
                <div valign="top" align="right" id="GridViewCountainer" style="width: 100%; height: 300px;
                    overflow: auto">
                    <table id="TblEnterDataType">
                        <tr style="height: 20px;" valign="top">
                            <td class="CssHeaderStyle" style="width: 80px" align="center">
                                نام شما
                            </td>
                            <td class="CssHeaderStyle" style="width: 80px" align="center">
                                نام جدول
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                نام مخفف
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                عنوان
                            </td>
                            <td class="CssHeaderStyle" style="width: 180px" align="center">
                              نام SP نمايش
                            </td>
                            <td class="CssHeaderStyle" style="width: 180px" align="center">
                                نام SP ذخیره
                            </td>
                            <td class="CssHeaderStyle" style="width: 20px" align="center">
                            </td>
                            <td class="CssHeaderStyle" style="width: 20px" align="center">
                            </td>
                            <td class="CssHeaderStyle" style="width: 20px" align="center">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <script>
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.name = "EnterDataSetting.aspx"
        aspnetForm.target = "EnterDataSetting.aspx"
        document.body.style.overflowX = "hidden";
        document.body.style.overflowY = "hidden";
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        PageLoad()
        //====================================================================================
        function EndRequestHandler(sender, args) {
            if ($("#" + MasterObj + "txtAlert").val() != "") {
                if ($("#" + MasterObj + "txtValidate").val() == "1") {
                    SetMsg($("#" + MasterObj + "txtAlert").val());
                    PageLoad();
                }
                else
                    alert($("#" + MasterObj + "txtAlert").val())

            }
            $("#" + MasterObj + "txtAlert").val("");
            $("#" + MasterObj + "txtValidate").val("");
            $("#" + MasterObj + "txtSubmit").val("");
        }
        //===========================================================================================================
        function PageLoad() {
            ClearGrid();
            var Data = $("#" + MasterObj + "txtXmlGrd").val();
            if (window.ActiveXObject) {
                xml = new ActiveXObject('Microsoft.XMLDOM');
                xml.async = 'false';
                xml.loadXML(Data);
            } else {
                var parser = new DOMParser();
                xml = parser.parseFromString(Data, 'text/xml');
            }
            XmlNodes = $(xml).find("DataEntryEntity").find("EnterDataType");
            if (XmlNodes.length > 0) {
                $(XmlNodes).each(function () {
                    AddRow($(this).find("ID").text(), $(this).find("TableName").text(),
                $(this).find("Title").text(), $(this).find("Schema").text(),
                $(this).find("Acronym").text(), $(this).find("SPName").text(),
                $(this).find("ExcelFilePath").text(), $(this).find("HelpFilePath").text(),
                $(this).find("SaveSPName").text());
                });
            }
            else {
                $("#TblEnterDataType").append("<tr class='CssNewRow'  valign='middle'  AutoRow=1   ID='0' TableName='' Schema=''>" +
                "<td  style='width: 80px;text-align:center' align='right'> <select> " + $("#" + MasterObj + "CmbSchemas").html() + "</select> </td>" +
                "<td  style='width: 80px;text-align:center' align='right'><input type='text'  onkeydown='KeyDownEng(this,event)'  class='TxtControls'></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input type='text'  class='TxtControls'></td>" +
                "<td  style='width: 100px' align='right'><input type='text' class='TxtControls'></td>" +
                "<td  style='width: 180px;text-align:center' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                "<td  style='width: 180px;text-align:center' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='ايجاد ستون ها' src='../../App_Utility/Images/Icons/Definestructure.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");
                

                 $("#TblEnterDataType").find("tr").last().find("td:eq(6)").children(0).click(function () {
                    OnClickBtnCreateTblColumn(this);
                });
                 $("#TblEnterDataType").find("tr").last().find("td:eq(8)").children(0).click(function () {
                    OnClickBtnNewRow(this);
                });
                $("#TblEnterDataType").find("tr").last().find("td:eq(7)").children().click(function () {
                    var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                    if (conf) {
                        OnClickBtnDelTbl(this);
                    }
                });
            }
        }
        //===========================================================================================================
        function AddRow(ID, TableName, Title, Schema, Acronym, SPName, ExcelFilePath, HelpFilePath, SaveSPName) {
            $("#TblEnterDataType").append("<tr class='CssNewRow'  valign='middle'  AutoRow=1   ID='" + ID + "' TableName='" + TableName + "' Schema='" + Schema + "'>" +
                "<td  style='width:80px;text-align:center' align='right'> <select disabled=true value='" + Schema + "' > " + $("#" + MasterObj + "CmbSchemas").html() + "</select> </td>" +
                "<td  style='width: 80px;text-align:center' align='right'><input disabled=true type='text' onkeydown='KeyDownEng(this,event)'  value='" + TableName + "' class='TxtControls'></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input type='text' value='" + Acronym + "' class='TxtControls'></td>" +
                "<td  style='width: 100px' align='right'><input type='text' value='" + Title + "' class='TxtControls'></td>" +
                "<td  style='width: 180px;text-align:center' align='right'><input type='text' style='width:180px' value='" + SPName + "' class='TxtControls'></td>" +
                 "<td  style='width:180px;text-align:center' align='right'><input type='text' style='width:180px' value='" + SaveSPName + "' class='TxtControls'></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='ايجاد ستون ها' src='../../App_Utility/Images/Icons/Definestructure.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");

            $("#TblEnterDataType").find("tr").last().find("td:eq(0)").children(0).val(Schema);

            $("#TblEnterDataType").find("tr").last().find("td:eq(1)").children(0).keydown(function () {
                KeyDownEng(this, event)
            });
            $("#TblEnterDataType").find("tr").last().find("td:eq(6)").children(0).click(function () {
                OnClickBtnCreateTblColumn(this);
            });
            $("#TblEnterDataType").find("tr").last().find("td:eq(8)").children(0).click(function () {
                OnClickBtnNewRow(this);
            });
            $("#TblEnterDataType tr:last").find("td:eq(7)").children().click(function () {
                var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                if (conf) {
                    OnClickBtnDelTbl(this);
                }
            });
        }
        /******************************************************/
        function OnClickBtnNewRow(obj) {
            var PrevRow = $(obj).parent().parent();
            var RowIndex = $(obj).parent().parent().index();

            $("#TblEnterDataType").find("tr:eq(" + RowIndex + ")").after("<tr class='CssNewRow'  valign='middle'  AutoRow=1   ID='0' TableName='' Schema=''>" +
                "<td  style='width: 80px;text-align:center' align='right'> <select> " + $("#" + MasterObj + "CmbSchemas").html() + "</select> </td>" +
                "<td  style='width: 80px;text-align:center' align='right'><input type='text'  onkeydown='KeyDownEng(this,event)'  class='TxtControls'></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input type='text'  class='TxtControls'></td>" +
                "<td  style='width: 100px' align='right'><input type='text' class='TxtControls'></td>" +
                "<td  style='width: 180px;text-align:center' align='right'><input type='text' style='width:180px'  class='TxtControls'></td>" +
                "<td  style='width: 180px;text-align:center' align='right'><input type='text' style='width:180px'  class='TxtControls'></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='ايجاد ستون ها' src='../../App_Utility/Images/Icons/Definestructure.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");

            var TbInserted = $("#TblEnterDataType").find("tr:eq(" + (RowIndex + 1) + ")")

            TbInserted.find("td:eq(6)").children(0).click(function () {
                OnClickBtnCreateTblColumn(this);
            });
            TbInserted.find("td:eq(8)").children(0).click(function () {
                OnClickBtnNewRow(this);
            });
            TbInserted.find("td:eq(7)").children().click(function () {
                var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                if (conf) {
                    OnClickBtnDelTbl(this);
                }
            });
        }
        //===========================================================================================================
        function OnClickBtnDelTbl(obj) {
            if ($(obj).parent().parent().attr("ID") == "0") {
                $(obj).parent().parent().remove();
            }
            else {
                $("#" + MasterObj + "txtID").val($(obj).parent().parent().attr("ID"));
                $("#" + MasterObj + "txtSubmit").val("Delete");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //===========================================================================================================
        function ClearGrid() {
            $(".CssNewRow").remove();
        }
        //===========================================================================================================
        function OnClickBtnSave() {
            var TbObj = $("#TblEnterDataType");
            var strXml = "";
            if (checkNotEmpty()) {
                for (var i = 1; i < TbObj.find("tr").length; i++) {
                    strXml += "<Tb>";
                    strXml += "<ID>" + TbObj.find("tr:eq(" + i + ")").attr("ID") + "</ID>";
                    strXml += "<Schema>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() + "</Schema>";
                    strXml += "<TableName>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(1)").children(0).val() + "</TableName>";
                    strXml += "<Acronym>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() + "</Acronym>";
                    strXml += "<Title>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(3)").children(0).val() + "</Title>";
                    strXml += "<SPName>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(4)").children(0).val() + "</SPName>";
                    strXml += "<SaveSPName>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(5)").children(0).val() + "</SaveSPName>";
                    strXml += "</Tb>";
                }
                $("#" + MasterObj + "txtXmlSave").val("<Root>" + strXml + "</Root>");
                $("#" + MasterObj + "txtSubmit").val("Modify");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
        //===========================================================================================================
        function checkNotEmpty() {
            var TbObj = $("#TblEnterDataType");
            for (var i = 1; i < TbObj.find("tr").length; i++) {
                if (TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() == "") {
                    alert("نام شما را انتخاب نماييد")
                    TbObj.find("tr:eq(" + (i) + ")").find("td:eq(0)").children(0).focus();
                    return false
                }
                if (TbObj.find("tr:eq(" + i + ")").find("td:eq(1)").children(0).val() == "") {
                    alert("نام جدول را وارد نماييد")
                    TbObj.find("tr:eq(" + (i) + ")").find("td:eq(1)").children(0).focus();
                    return false
                }
                if (TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() == "") {
                    alert("نام مخفف را انتخاب نماييد")
                    TbObj.find("tr:eq(" + (i) + ")").find("td:eq(2)").children(0).focus();
                    return false
                }
                if (TbObj.find("tr:eq(" + i + ")").find("td:eq(3)").children(0).val() == "") {
                    alert("عنوان را وارد نماييد")
                    TbObj.find("tr:eq(" + (i) + ")").find("td:eq(3)").children(0).focus();
                    return false
                }
                //                if (TbObj.find("tr:eq(" + i + ")").find("td:eq(4)").children(0).val() == "") {
                //                    alert("نام SP را وارد نماييد")
                //                    TbObj.find("tr:eq(" + (i) + ")").find("td:eq(4)").children(0).focus();
                //                    return false
                //                }
                for (var j = i + 1; j < TbObj.find("tr").length; j++) {
                    if ((TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() ==
                    TbObj.find("tr:eq(" + j + ")").find("td:eq(0)").children(0).val())
                    &&
                    (TbObj.find("tr:eq(" + i + ")").find("td:eq(1)").children(0).val() ==
                    TbObj.find("tr:eq(" + j + ")").find("td:eq(1)").children(0).val())) {
                        alert("نام جدول در شمای انتخاب شده تکراری است")
                        TbObj.find("tr:eq(" + j + ")").find("td:eq(1)").children(0).focus();
                        return false;
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() ==
                        TbObj.find("tr:eq(" + j + ")").find("td:eq(2)").children(0).val()) {
                        alert("نام مخفف تکراری است")
                        TbObj.find("tr:eq(" + j + ")").find("td:eq(2)").children(0).focus();
                        return false;
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(3)").children(0).val() ==
                        TbObj.find("tr:eq(" + j + ")").find("td:eq(3)").children(0).val()) {
                        alert("عنوان تکراری است")
                        TbObj.find("tr:eq(" + j + ")").find("td:eq(3)").children(0).focus();
                        return false;
                    }
                }

            }
            return true;
        }
        //======================================
        function OnClickBtnCreateTblColumn(obj) {
            if ($(obj).parent().parent().attr("ID") != "0") {
                var strUrl = "EnterDataTypeProperty.aspx?CompanyID=" + $get(MasterObj + "txtCompanyID").value + "&EnterTypeID=" + $(obj).parent().parent().attr("ID");
                strUrl = encodeURI(strUrl)
                var rValue = window.showModalDialog(strUrl, window, 'dialogHeight:400px;dialogWidth:800px;center: Yes;help: no;status: no;scroll:no');
            }
            else
                alert("ابتدا اطلاعات جدول را ذخیره نماييد");
            //--------------------------------------------------------------------------------
        }
        //======================================
        function KeyDownEng(field, e) {
            var Key = e.keyCode;
            if (Key != 46 && Key != 8)
                window.event.returnValue = null;
            if (Key != 16 && Key != 18 && Key != 46 && Key != 8) {
                if ((Key <= 57 && Key >= 48) ||
                    (Key <= 90 && Key >= 65))
                    field.value += (String.fromCharCode(Key).toString());
                else if ((Key <= 40 && Key >= 37) || (Key <= 105 && Key >= 96))
                    window.event.returnValue = Key;
            }
        }
        //===========================================================================================================

    </script>
</asp:Content>

