<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="WorkPriod.aspx.cs" Inherits="FrmPresentation.App_Pages.Setting.WorkPriod" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:content id="Content1" contentplaceholderid="head" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
    <tr>
    <td>
    <fieldset dir="rtl" class="fieldsetStyle">
           <legend class="legendStyle">پارامترهای جستجو</legend>
         
    <table style="width: 700Px">
        <tr>
            <td style="width: 50px">
                دوره
            </td> 
            <td style="width: 100px">
             <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
              <ContentTemplate >
            <div>
                <asp:DropDownList ID="cmbpriod" runat="server" Height="16px" Width="150px" 
                    CssClass="TxtControls">
                </asp:DropDownList>
             </div>
             </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td style="width: 50px">
            </td>
            <td style="width: 50px">
                از تاريخ
            </td>
            <td style="width: 200px">
                <uc3:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td style="width: 50px"> 
                تا تاريخ
            </td>
            <td style="width: 200px">
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
            <td style="width: 50px">
            </td>
        </tr>
    </table>
    
    </fieldset>
    </td>
    </tr>
    
   <tr>
   <td>
    <table >
        <!--toolbar-->
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                       <div id="GridViewCountainer" style="height: 300px; width: 600px" align="center">
                            <cc2:KasraGrid ID="GrdWorkPriod" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                    </ContentTemplate>
                   <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
              
              
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
         <input type="text" id="txtID" name="txtID" runat="server" />
         <input type="text" id="txtSDate" name="txtSDate" runat="server" />
         <input type="text" id="txtEDate" name="txtEDate" runat="server" />
           <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
             <input type="text" id="txtMessage" name="txtMessage" runat="server" />
    </div>
      </td>
      </tr>
    </table>
    </td>
    </tr>
    </table>
   
    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.scroll = "no"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
        var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
        $get(MasterObj + "txtSDate").value = SDate
        $get(MasterObj + "txtEDate").value = EDate
        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        //=====================================================================================================
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
        }
        //====================================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            LastSelectedRowClass = ""
            LastSelectedRow = null
            LastSelectedRowClass = ""
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    alert($get(MasterObj + "txtAlert").value);
                }
                else
                    alert($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtAlert").value = ""


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
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //===============================================================================================
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        //======================================رنگی شدن سطر گرید با کلیک کردن روی سطر=====================================
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //============================================  ایجاد    ========================================================
        function OnClickBtnNew() {
            var Url = 'WorkPriodNew.aspx?ID=0' + "&SystemID=" + $get(MasterObj + "txtSystemID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value

            var returnValue = window.showModalDialog(encodeURI(Url), "", "dialogWidth=650px;dialogHeight=200px;status: no");
            if (returnValue == "1") {
                SetMsg(" ذخيره با موفقيت انجام شد")
                OnClickBtnFilter();
            }

        }
        //============================================  ویرایش    ========================================================
        function OnClickBtnEdit() {
            if (LastSelectedRow == null) {
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
                return;
            }
            if (LastSelectedRow.getAttribute("Expire") == 1) {
                alert("امکان ويرايش برای دوره قطعی شده وجود ندارد")
                return;
            }

            var Url = "WorkPriodNew.aspx?ID=" + LastSelectedRow.getAttribute("ID")
            + "&SystemID=" + $get(MasterObj + "txtSystemID").value
            + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            var returnValue = window.showModalDialog(encodeURI(Url), "", "dialogWidth=650px;dialogHeight=200px;status: no");
            if (returnValue == "1") {
                SetMsg(" ذخيره با موفقيت انجام شد")
                document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
                document.getElementById(MasterObj + "BtnSubmit").click()
            }

        }
        //============================================عدم قطعی شدن========================================================
        function OnClickBtnNotConfirm() {
            if (LastSelectedRow != null) {
                if (LastSelectedRow.getAttribute("Expire") != 0) {
                    var Msg = "آيا برای عدم قطعي کردن مطمئن هستيد؟"
                    if (confirm(Msg) == true) {
                        document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID")
                        document.getElementById(MasterObj + "txtSubmit").value = "Const";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }

                else alert("تاريخ قطعی وجود ندارد")
            }
            else
                alert("به منظور عدم قطعیت یک سطر را انتخاب کنید")
        }

        //==================================================فیلتر=============================================
        function OnClickBtnFilter() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            $get(MasterObj + "txtSDate").value = SDate;
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""
            $get(MasterObj + "txtEDate").value = EDate;
            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""
            else if (SDate > EDate) {
                alert("تاريخ شروع بزرگتر از تاریخ پايان است")

                return false;
            }
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
            return true;
        }
        //==================================================نمایش همه =============================================

        function OnClickBtnShowAll() {

            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            document.getElementById(MasterObj + "cmbpriod").value = "0";
            OnClickBtnFilter();
        }
        //==================================================دابل کردن سطر گرید =============================================
        function OndbClickGrd() {
            OnClickBtnEdit();
        }
       
    </script>
</asp:content>
