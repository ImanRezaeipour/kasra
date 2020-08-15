<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.Category" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                نام دسته بندی :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CmbCategory" runat="server" Height="16px" Width="190px" value="0"
                                            CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                نام مخفف :
                            </td>
                            <td>
                                <input type="text" id="txtAcronym" runat="server" class="TxtControls" />
                            </td>
                            <td>
                                زیر سيستم :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbSubsystem" runat="server" Height="16px" Width="190px" value="0"
                                    CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc3:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="100%" align="center" valign="top" style="border: thin groove #000000; background-color: #C5D5E9;height:600px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson">
                            <cc2:KasraGrid ID="GrdCategory" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdCategory_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtCategoryID" name="txtCategoryID" runat="server" />
        <input type="text" id="txtMaxNumber" name="txtMaxNumber" runat="server" />
    </div>
    <script src="../../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

        function EndRequestHandler(sender, args) {
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1")
                    SetMsg($get(MasterObj + "txtAlert").value);
                else
                    alert($get(MasterObj + "txtAlert").value);
            }

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtValidate").value = "";
        }


        function OnClickBtnNew() {
            url = "CategoryNew.aspx?CategoryID=0&SessionID=" + $("#" + MasterObj + "txtSessionID").val();
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:200px;dialogWidth: 850px;center: Yes;help: no;status: no")
            if (returnValue == 1) {
                OnClickBtnFilter();
            }
        }

        function OnClickBtnFilter() {
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        function OnClickBtnDelete() {
            if (LastSelectedRow != null) {
                if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                    $get(MasterObj + "txtCategoryID").value = LastSelectedRow.getAttribute("CategoryID");
                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
                alert("به منظور حذف يک سطر را انتخاب کنيد")
        }
        function OnClickBtnEdit() {
            if (LastSelectedRow != null)
                OndbClickGrd();
            else
                alert("به منظور ويرايش يک سطر را انتخاب کنيد")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {   
            url = "CategoryNew.aspx?CategoryID=" + LastSelectedRow.getAttribute("CategoryID")
                + "&CategoryName=" + LastSelectedRow.cells(0).innerText
                + "&Acronym=" + LastSelectedRow.cells(1).innerText
                + "&Subsystem=" + LastSelectedRow.SystemID
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value;
            returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:200px;dialogWidth: 850px;center: Yes;help: no;status: no")
            if (returnValue == 1) {
                $get(MasterObj + "txtSubmit").value = "Const";
                $get(MasterObj + "BtnSubmit").click();
            }
        }

//===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                document.getElementById(MasterObj + "txtCurPage").value = obj.value
                document.getElementById(MasterObj + "txtSubmit").value = "Const"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================

        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null)
                $(LastSelectedRow).removeClass("CssSelectedItemStyle");
            LastSelectedRow = SelectedRow
            $(SelectedRow).addClass("CssSelectedItemStyle");
        }

//-------------------------
        function OnClickBtnShowAll() {
            Clear();
            OnClickBtnFilter();
        }
        //----------------------
        function Clear() {
            $("#" + MasterObj + "CmbCategory").val("0");
            $("#" + MasterObj + "CmbSubsystem").val("0");
            $("#" + MasterObj + "txtAcronym").val("");
        }
        //--------------------------
    </script>
</asp:Content>
