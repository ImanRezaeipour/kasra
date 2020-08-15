<%@ Page Title="--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="EnterDataTypeProperty.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.EnterDataTypeProperty" %>
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
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <asp:HiddenField ID="txtFilePath" runat="server" />
                    <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
                    <input type="text" id="txtEnterTyeID" name="txtEnterTyeID" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
                </div>
                <div valign="top" align="right" id="GridViewCountainer" style="width: 100%; height:280px;
                    overflow: auto">
                    <table>
                        <tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <div align="left" dir="ltr" style="width: 100%">
                                        <input id="BtnUpItem" title="حرکت به بالا" class="CssMoveUpItem" onclick="OnClickBtnMoveItemField(-1)"
                                            type="button" name="BtnUpItem" />
                                        <input id="BtnDownItem" title="حرکت به پايين" class="CssMoveDownItem" onclick="OnClickBtnMoveItemField(1)"
                                            type="button" name="BtnDownItem" />
                                    </div>
                                </td>
                            </tr>
                        </tr>
                    </table>
                    <table id="TblEnterDataTypeProperty" onclick="OnClickGrd(this)">
                        <tr style="height: 20px;" valign="top">
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                نام ستون
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px" align="center">
                                نوع فیلد
                            </td>
                            <td class="CssHeaderStyle" style="width: 200px" align="center">
                                عنوان هدر
                            </td>
                            <td class="CssHeaderStyle" style="width: 200px" align="center">
                                عنوان
                            </td>
                            <td class="CssHeaderStyle" style="width: 50px" align="center">
                                سایز
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
            var GrdSelectedRow = null, GrdLastSelectedRowClass = "", GrdLastSelectedRow
            window.name = "EnterDataTypeProperty.aspx"
            aspnetForm.target = "EnterDataTypeProperty.aspx"
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
                XmlNodes = $(xml).find("DataEntryEntity").find("GetBatchEnterDataProperty").find("BatchEnterDataTypeID").filter(function () {
                    return $(this).text().toString().trim() == $("#" + MasterObj + "txtEnterTyeID").val()
                });
                if (XmlNodes.length > 0) {
                    $(XmlNodes).each(function () {
                        AddRow($(this).siblings("ID").text(), $(this).siblings("TagName").text(), $(this).siblings("HeaderCaption").text(),
                            $(this).siblings("CellWidth").text(),
                            $(this).siblings("HeaderTitle").text(), $(this).siblings("FieldType").text());
                    });
                }
                else {
                    $("#TblEnterDataTypeProperty").append("<tr class='CssNewRow'  valign='middle'  AutoRow=1   EnterTypeID='0' >" +
                    "<td  style='width: 100px;text-align:center' align='right'><input style='width:100px' type='text'     class='TxtControls'></td>" +
                    "<td  style='width: 100px;text-align:center' align='right'><input type='text' style='width:100px'  class='TxtControls'></td>" +
                    "<td  style='width: 200px' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                    "<td  style='width: 200px;text-align:center' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                    "<td  style='width: 50px;text-align:center'  align='right'><input type='text' value=100 style='width:50px'  class='TxtControls'></td>" +
                    "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                    "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");

                    $("#TblEnterDataTypeProperty").find("tr").last().find("td:eq(6)").children(0).click(function () {
                        OnClickBtnNewRow(this);
                    });
                    $("#TblEnterDataTypeProperty tr:last").find("td:eq(5)").children().click(function () {
                        var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                        if (conf) {
                            OnClickBtnDelTblColumn(this);
                        }
                    });
                }
            }
            //===========================================================================================================
            function AddRow(ID, TagName, HeaderCaption, CellWidth, HeaderTitle, FieldType) {
                $("#TblEnterDataTypeProperty").append("<tr class='CssNewRow'  valign='middle'  AutoRow=1   EnterTypeID='" + ID + "' >" +
                "<td  style='width: 100px;text-align:center' align='right'><input  style='width:100px' type='text'    value='" + TagName + "' class='TxtControls'></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input type='text' style='width:100px' value='" + FieldType + "' class='TxtControls'></td>" +
                "<td  style='width: 200px' align='right'><input type='text' style='width:200px' value='" + HeaderCaption + "' class='TxtControls'></td>" +
                "<td  style='width: 200px;text-align:center' align='right'><input type='text' style='width:200px' value='" + HeaderTitle + "' class='TxtControls'></td>" +
                "<td  style='width: 50px;text-align:center'  align='right'><input type='text' style='width:50px' value=100 value='" + CellWidth + "' class='TxtControls'></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");
               
                $("#TblEnterDataTypeProperty").find("tr").last().find("td:eq(6)").children(0).click(function () {
                    OnClickBtnNewRow(this);
                });
                $("#TblEnterDataTypeProperty tr:last").find("td:eq(5)").children().click(function () {
                    var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                    if (conf) {
                        OnClickBtnDelTblColumn(this);
                    }
                });
            }
            /******************************************************/
            function OnClickBtnNewRow(obj) {
                var PrevRow = $(obj).parent().parent();
                var RowIndex = $(obj).parent().parent().index();

                $("#TblEnterDataTypeProperty").find("tr:eq(" + RowIndex + ")").after("<tr class='CssNewRow'  valign='middle'  AutoRow=1   EnterTypeID='0' >" +
                "<td  style='width: 100px;text-align:center' align='right'><input style='width:100px' type='text'    class='TxtControls'></td>" +
                "<td  style='width: 100px;text-align:center' align='right'><input type='text' style='width:100px'  class='TxtControls'></td>" +
                "<td  style='width: 200px' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                "<td  style='width: 200px;text-align:center' align='right'><input type='text' style='width:200px'  class='TxtControls'></td>" +
                "<td  style='width: 50px;text-align:center'  align='right'><input type='text' style='width:50px' value=100  class='TxtControls'></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer' title='حذف' src='../../App_Utility/Images/Icons/DelIcon.gif'/></td>" +
                "<td  style='width: 20px' align='right'> <img style='cursor:pointer'  title='ايجاد' src='../../App_Utility/Images/Icons/NewIcon.gif'/></td></tr>");

                var TbInserted = $("#TblEnterDataTypeProperty").find("tr:eq(" + (RowIndex + 1) + ")")
                TbInserted.find("td:eq(6)").children(0).click(function () {
                    OnClickBtnNewRow(this);
                });
                TbInserted.find("td:eq(5)").children().click(function () {
                    var conf = confirm("آیا برای حذف مطمئن هستید؟", "");
                    if (conf) {
                        OnClickBtnDelTblColumn(this);
                    }
                });
            }
            //===========================================================================================================
            function ClearGrid() {
                var TbObj = $("#TblEnterDataTypeProperty");
                TbObj.find("tr").each(function () {
                    if ($(this).index() != 0)
                        $(this).remove();
                });
               
                GrdLastSelectedRow = null;
                GrdSelectedRow = null;
                GrdLastSelectedRowClass = "";
            }
            //===========================================================================================================
            function OnClickBtnSave() {
                var TbObj = $("#TblEnterDataTypeProperty");
                var strXml = "";
                if (checkNotEmpty()) {
                    for (var i = 1; i < TbObj.find("tr").length; i++) {
                        strXml += "<Tb>";
                        strXml += "<ID>" + TbObj.find("tr:eq(" + i + ")").attr("EnterTypeID") + "</ID>";
                        strXml += "<TagName>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() + "</TagName>";
                        strXml += "<FieldType>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(1)").children(0).val() + "</FieldType>";
                        strXml += "<HeaderCaption>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() + "</HeaderCaption>";
                        strXml += "<Title>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(3)").children(0).val() + "</Title>";
                        strXml += "<CellWidth>" + TbObj.find("tr:eq(" + i + ")").find("td:eq(4)").children(0).val() + "</CellWidth>";
                        strXml += "<Intval>" + i + "</Intval>";
                        strXml += "</Tb>";
                    }
                    $("#" + MasterObj + "txtXmlSave").val("<Root>" + strXml + "</Root>");
                    $("#" + MasterObj + "txtSubmit").val("Modify");
                    $("#" + MasterObj + "BtnSubmit").click();
                }
            }
            //===========================================================================================================
            function checkNotEmpty() {
                var TbObj = $("#TblEnterDataTypeProperty");
                for (var i = 1; i < TbObj.find("tr").length; i++) {
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() == "") {
                        alert("نام ستون را وارد نماييد")
                        TbObj.find("tr:eq(" + (i) + ")").find("td:eq(0)").children(0).focus();
                        return false
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(1)").children(0).val() == "") {
                        alert("نوع فيلد را وارد نماييد")
                        TbObj.find("tr:eq(" + (i) + ")").find("td:eq(1)").children(0).focus();
                        return false
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() == "") {
                        alert("عنوان هدر را وارد نماييد")
                        TbObj.find("tr:eq(" + (i) + ")").find("td:eq(2)").children(0).focus();
                        return false
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(3)").children(0).val() == "") {
                        alert("عنوان را وارد نماييد")
                        TbObj.find("tr:eq(" + (i) + ")").find("td:eq(3)").children(0).focus();
                        return false
                    }
                    if (TbObj.find("tr:eq(" + i + ")").find("td:eq(4)").children(0).val() == "") {
                        alert("سایز ستون را وارد نماييد")
                        TbObj.find("tr:eq(" + (i) + ")").find("td:eq(4)").children(0).focus();
                        return false
                    }
                    for (var j = i + 1; j < TbObj.find("tr").length; j++) {
                        if (TbObj.find("tr:eq(" + i + ")").find("td:eq(0)").children(0).val() ==
                            TbObj.find("tr:eq(" + j + ")").find("td:eq(0)").children(0).val()) {
                            alert("نام ستون تکراری است")
                            TbObj.find("tr:eq(" + j + ")").find("td:eq(0)").children(0).focus();
                            return false;
                        }
                        if (TbObj.find("tr:eq(" + i + ")").find("td:eq(2)").children(0).val() ==
                            TbObj.find("tr:eq(" + j + ")").find("td:eq(2)").children(0).val()) {
                            alert("عنوان هدر تکراری است")
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
            //============================================================================================================
            function OnClickBtnCreateTblColumn(obj) {
                var strUrl = "EnterDataTypeProperty.aspx?CompanyID=" + $get(MasterObj + "txtCompanyID").value + "&EnterTypeID=" + $(obj).parent().parent().attr("EnterTypeID");
                strUrl = encodeURI(strUrl)
                var rValue = window.showModalDialog(strUrl, window, 'dialogHeight:400px;dialogWidth: 400px;center: Yes;help: no;status: no;scroll:no');
                //--------------------------------------------------------------------------------
            }
            //============================================================================================================
            function OnClickBtnDelTblColumn(obj) {
                var TbObj = $("#TblEnterDataTypeProperty");
                if (TbObj.find("tr").length > 2) {
                    $(obj).parent().parent().remove();
                    GrdLastSelectedRow = null;
                    GrdSelectedRow = null;
                }
            }
            //============================================================================================================
            function OnClickBtnMoveItemField(Direction) {//Direction:-1 Up ___Direction:+1 Down
                if (GrdLastSelectedRow != null && GrdLastSelectedRow.rowIndex + Direction != -1) {
                    var oGrd = document.getElementById("TblEnterDataTypeProperty")
                    var tmpobj = new Object();
                    var len = oGrd.rows.length
                    var idx = GrdLastSelectedRow.rowIndex + Direction
                    if (!oGrd.rows(idx))
                        return
                
                    tmpobj.TagName = GrdLastSelectedRow.cells(0).firstChild.value
                    tmpobj.FieldType = GrdLastSelectedRow.cells(1).firstChild.value
                    tmpobj.HeaderCaption = GrdLastSelectedRow.cells(2).firstChild.value
                    tmpobj.HeaderTitle = GrdLastSelectedRow.cells(3).firstChild.value
                    tmpobj.CellWidth = GrdLastSelectedRow.cells(4).firstChild.value
                    tmpobj.EnterTypeID = GrdLastSelectedRow.getAttribute("EnterTypeID")
                  

                    GrdLastSelectedRow.cells(0).firstChild.value = oGrd.rows(idx).cells(0).firstChild.value
                    GrdLastSelectedRow.cells(1).firstChild.value = oGrd.rows(idx).cells(1).firstChild.value
                    GrdLastSelectedRow.cells(2).firstChild.value = oGrd.rows(idx).cells(2).firstChild.value
                    GrdLastSelectedRow.cells(3).firstChild.value = oGrd.rows(idx).cells(3).firstChild.value
                    GrdLastSelectedRow.cells(4).firstChild.value = oGrd.rows(idx).cells(4).firstChild.value
                    GrdLastSelectedRow.setAttribute("EnterTypeID", oGrd.rows(idx).getAttribute("EnterTypeID"))
                    

                    oGrd.rows(idx).cells(0).firstChild.value = tmpobj.TagName
                    oGrd.rows(idx).cells(1).firstChild.value = tmpobj.FieldType
                    oGrd.rows(idx).cells(2).firstChild.value = tmpobj.HeaderCaption
                    oGrd.rows(idx).cells(3).firstChild.value = tmpobj.HeaderTitle
                    oGrd.rows(idx).cells(4).firstChild.value = tmpobj.CellWidth
                    oGrd.rows(idx).setAttribute("EnterTypeID", tmpobj.EnterTypeID)

                    GrdLastSelectedRow.className = GrdLastSelectedRowClass;
                    GrdLastSelectedRowClass = oGrd.rows(idx).className;
                    GrdLastSelectedRow = oGrd.rows(idx);
                    oGrd.rows(idx).className = "CssSelectedItemStyle";

                }
            }
            //============================================================================================================
            function OnClickGrd(GrdSelectedRow) {
                var oRow = window.event.srcElement.parentElement
                var rIndex
                while (oRow.tagName != 'TR')
                    oRow = oRow.parentElement
                if (oRow.parentElement.parentElement.id != "TblEnterDataTypeProperty")
                    return
                if (GrdLastSelectedRow != null) {

                    GrdLastSelectedRow.className = GrdLastSelectedRowClass;
                }
                GrdLastSelectedRowClass = oRow.className;
                GrdLastSelectedRow = oRow;
                oRow.className = "CssSelectedItemStyle";
            }
            //============================================================================================================
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
