<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="PermittedUsedCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.PermittedUsedCode" %> 
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 780px; margin-left: 3px;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GrdPermittedUsedCode" style="vertical-align: top; float: right;" align="right">
                            <cc2:KasraGrid ID="GrdPermittedUsedCode"  runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtScriptID" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtDelScriptID" name="txtDelScriptID" runat="server" />
        <input type="text" id="txtCodePID" name="txtCodePID" runat="server" />
        <input type="text" id="txtGroupCodePID" name="txtGroupCodePID" runat="server" />
    </div>
<script>
    document.getElementsByTagName("body")[0].scroll = "no";
    //-----------------------------------------------Declaration-----------------------------------------------------------
    var LastSelectedRow = null;
    var LastSelectedRowClass = "";
    //-----------------------------------------------AJAX-----------------------------------------------------------
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
    function BeginRequestHandler(sender, args) {
        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
    }
    //==============================================================================================================
    function EndRequestHandler(sender, args) {
        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
        LastSelectedRow = null;
        var StrVal = $get(MasterObj + "txtSubmit").value

        if ($get(MasterObj + "txtAlert").value != "") {
            SetMsg($get(MasterObj + "txtAlert").value);
            returnValue = 1
        }

        $get(MasterObj + "txtSubmit").value = "";
        $get(MasterObj + "txtAlert").value = "";
    }
    //==============================================================================================================
    function OnClickBtnNew() { 
        var strUrl = "CodeUtilize.aspx?ScriptID=0"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&CodePID=" + $get(MasterObj + "txtCodePID").value
                            + "&GroupCodePID=" + $get(MasterObj + "txtGroupCodePID").value
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 700px;dialogWidth: 1100px;center: Yes;help: no;status: no')
        if (rValue == 1) {
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    //==============================================================================================================
    function OnClickBtnDel() {
        if (LastSelectedRow != null) {
            if (confirm("آيا براي حذف مطمئنيد؟")) {
                $get(MasterObj + "txtDelScriptID").value = LastSelectedRow.ScriptID
                document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        else
            alert("به منظور حذف يک سطر را انتخاب کنيد");
    }
    //==============================================================================================================
    function OnClickGrd(SelectedRow) {
        if (LastSelectedRow != null) {
            LastSelectedRow.className = LastSelectedRowClass;
        }
        LastSelectedRowClass = SelectedRow.className;
        LastSelectedRow = SelectedRow;
        SelectedRow.className = "CssSelectedItemStyle";
    }
    //==============================================================================================================
    function OndbClickGrd() {
        var strUrl = "CodeUtilize.aspx?ScriptID=" + LastSelectedRow.getAttribute("ScriptID")
                    + "&ScriptName=" + LastSelectedRow.cells(0).innerText
                    + "&SDate=" + LastSelectedRow.getAttribute("SDate")
                    + "&EDate=" + LastSelectedRow.getAttribute("EDate")
                    + "&P01=" + LastSelectedRow.getAttribute("P01")
                    + "&Descr=" + LastSelectedRow.cells(4).innerText
                    + "&TemplateName=" + LastSelectedRow.getAttribute("TemplateName")
                    + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                    + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                    + "&CodePID=" + $get(MasterObj + "txtCodePID").value
                    + "&GroupCodePID=" + $get(MasterObj + "txtGroupCodePID").value
        var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 700px;dialogWidth: 1100px;center: Yes;help: no;status: no')
        if (rValue == 1) {
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
    }
    //==============================================================================================================
    function OnClickImgGroups(obj) {
        while (obj.tagName != "TR")
            obj = obj.parentElement
        var strUrl = 'ScriptGroups.aspx?ScriptID=' + obj.ScriptID
                + "&Type=view"
                + '&ToPersonId=' + $get(MasterObj + "txtOnLineUser").value
                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
        window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no;scroll: no;')
    }
    //==============================================================================================================
    function OnClickBtnEdit() {
        if (LastSelectedRow != null)
            OndbClickGrd()
        else
            alert("به منظور ويرايش يک سطر را انتخاب کنيد")
    }
    //==============================================================================================================
</script>
</asp:Content>
