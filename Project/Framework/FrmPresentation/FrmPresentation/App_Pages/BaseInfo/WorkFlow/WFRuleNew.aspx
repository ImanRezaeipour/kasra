<%@ Page Title="--------------------------------------------------شرايط سند-------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="WFRuleNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.WFRuleNew" ValidateRequest="false" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table height="250px" >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                کد :
            </td>
            <td >
               <asp:DropDownList runat="server" CssClass="TxtControls" 
               onkeydown="FKeyDown()" onkeypress="FKeyPress()" Width="180px"  ID="CmbCode" onchange="OnChangeCmbCode()"></asp:DropDownList>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <input type="checkbox" id="chkDaily" runat="server" />روزانه
                        <input type="checkbox" id="chkTimely" runat="server" />ساعتي
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                حداقل مقدار :
            </td>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <input type="text" runat="server" id="txtMinDuration" style="width: 90px" class="TxtControls"
                            value="0" onkeydown="OnKeyDownInt(this)" onfocus="OnFocusObj(this)" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td style="text-align: right;">
                حداکثر مقدار :
            </td>
            <td align="right">
                <input type="text" runat="server" id="txtMaxDuration" class="TxtControls" value="0"
                 onkeydown="OnKeyDownInt(this)" style="width:90px"  onfocus="OnFocusObj(this)"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                حداقل تعداد :
            </td>
            <td align="right">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <input type="text" runat="server" id="txtMinCount" class="TxtControls" value="0"
                            onkeydown="OnKeyDownInt(this)" style="width: 90px" onfocus="OnFocusObj(this)" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td style="text-align: right;">
                حداکثر تعداد :
            </td>
            <td align="right">
                <input type="text" runat="server" style="width:90px"  id="txtMaxCount" class="TxtControls" value="0" 
                onkeydown="OnKeyDownInt(this)"  onfocus="OnFocusObj(this)"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                شرح :
            </td>
            <td colspan="3" align="right">
                <asp:TextBox TextMode="MultiLine" Width="400px" Height="60px" runat="server" ID="txtDescr"
                    CssClass="TxtControls"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                مقدار صفر برای حداقل و حداکثر مقدار به معني عدم محدوديت مقداري است
            </td>
        </tr>
        <tr>
            <td colspan="4">
                مقدار صفر برای حداقل و حداکثر تعداد به معني عدم محدوديت تعدادي است
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtWFRuleID" name="txtWFRuleID" runat="server" />
        <input type="text" id="txtWFDocID" name="txtWFDocID" runat="server" />
        <input type="text" id="txtCodeID" name="txtCodeID" runat="server" />
    </div>
    <script>
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var SaveFlag = 0;
        //==========================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

        }
        //==============================================================================
        function EndRequestHandler(sender, args) {
            try {
                if ($get(MasterObj + "txtAlert").value != "") {
                    if (($get(MasterObj + "txtValidate").value == "0"))
                        alert($get(MasterObj + "txtAlert").value);
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        SaveFlag = 1;
                        window.returnValue = SaveFlag;
                    }
                }
                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                $get(MasterObj + "txtValidate").value = "";
            }
            catch (Exception) {
                alert("اطلاعات ناقص است");
            }
        }
        //===========================================================
        function OnClickBtnNew() {
            $get(MasterObj + "CmbCode").value = "";
            $get(MasterObj + "CmbCode_txtName").value = "";
            $get(MasterObj + "txtMinDuration").value = "0";
            $get(MasterObj + "txtMaxDuration").value = "0";
            $get(MasterObj + "txtMinCount").value = "0";
            $get(MasterObj + "txtMaxCount").value = "0";
            $get(MasterObj + "txtDescr").value = "";
        }
        //===========================================================
        function OnClickBtnSave() {
            if (ChkIsEmpty()) {
                var Strconfirm = "آيا براي ذخيره مطمئنيد؟ "
                if ($get(MasterObj + "txtMinDuration").value == "0" && $get(MasterObj + "txtMaxDuration").value == "0")
                    Strconfirm = " مقدار صفر برای حداقل و حداکثر مقدار به معني عدم محدوديت مقداري است" + "\r\n" + Strconfirm
                else if ($get(MasterObj + "txtMinCount").value == "0" && $get(MasterObj + "txtMaxCount").value == "0")
                    Strconfirm = " مقدار صفر برای حداقل و حداکثر تعداد به معني عدم محدوديت تعدادي است" + "\r\n" + Strconfirm
                if (confirm(Strconfirm)) {
                    $get(MasterObj + "txtCodeID").value = $get(MasterObj + "CmbCode").value;
                    $get(MasterObj + "txtSubmit").value = "Modify";
                    $get(MasterObj + "BtnSubmit").click();
                }
            }
        }
        //===========================================================
        function ChkIsEmpty() {
            if ($get(MasterObj + "CmbCode").value == "") {
                $get(MasterObj + "CmbCode").focus();
                alert("لطفا کد مورد نظر خود را انتخاب نماييد");
            }
            else if ($get(MasterObj + "txtMinDuration").value == "") {
                $get(MasterObj + "txtMinDuration").focus();
                alert("لطفا حداقل مقدار را وراد نماييد");
            }
            else if ($get(MasterObj + "txtMaxDuration").value == "") {
                $get(MasterObj + "txtMaxDuration").focus();
                alert("لطفا حداکثر مقدار را وراد نماييد");
            }
            else if ($get(MasterObj + "txtMinCount").value == "") {
                $get(MasterObj + "txtMinCount").focus();
                alert("لطفا حداقل تعداد را وراد نماييد");
            }
            else if ($get(MasterObj + "txtMaxCount").value == "") {
                $get(MasterObj + "txtMaxCount").focus();
                alert("لطفا حداکثر تعداد را وراد نماييد");
            }
            else if ($get(MasterObj + "txtDescr").value == "") {
                $get(MasterObj + "txtDescr").focus();
                alert("لطفا شرح را وراد نماييد");
            }
            else if ($get(MasterObj + "txtMaxDuration").value != "0" && parseInt($get(MasterObj + "txtMinDuration").value) > parseInt($get(MasterObj + "txtMaxDuration").value))
                alert("حداقل مقدار از حداکثر مقدار بزرگتر است");
            else if ($get(MasterObj + "txtMaxCount").value != "0" && parseInt($get(MasterObj + "txtMinCount").value) > parseInt($get(MasterObj + "txtMaxCount").value))
                alert("حداقل تعداد از حداکثر تعداد بزرگتر است");
            else
                return true;
        }
        //===========================================================
        function OnFocusObj(obj) {
            obj.select();
            obj.focus();
        }
        //===========================================================
        function OnChangeCmbCode() {
            $get(MasterObj + "txtCodeID").value = $get(MasterObj + "CmbCode").value;
            $get(MasterObj + "txtSubmit").value = "ChangeCode";
            $get(MasterObj + "BtnSubmit").click();
        }
    
    </script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/farsi.js"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/KeySorting.js"></script>
</asp:Content>
