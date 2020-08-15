<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="SystemUser.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.SystemUser" %>

<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .LblPerson
        {
            border: solid 1px #6699FF;
            width: 70px;
            color: Red;
            background-color: White;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامترهای جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                وضعيت
                            </td>
                            <td>
                                <select id="cmbStatus" runat="server" class="TxtControls" style="height: 300px; width: 150px"
                                    align="right">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                کد پرسنلی
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPesonel" runat="server" />
                            </td>
                            <td>
                                نام کاربری
                            </td>
                            <td>
                                <input type="text" id="txtUser" name="txtUser" style="width: 150px" class="TxtControls"
                                    runat="server" onkeydown="OnKeyDownInt(this)"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                دسترسی از تاريخ :
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                دسترسی تا تاريخ
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <!--toolbar-->
                <table style="width:100%">
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>

                           تعداد کاربران فعال در تاريخ جاری :
                        </td>
                        <td>
                            <asp:Label ID="UserActive" runat="server" class="LblPerson" style="height: 20px; width: 60px"></asp:Label>
                        </td>
                        <td>
                             تعداد کاربران غير فعال در تاريخ  جاری :
                        </td>
                        <td>
                            <asp:Label ID="UserDeactive" runat="server" class="LblPerson" style="height: 20px; width: 60px"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                     <div id="GridViewCountainer" >
                               <cc2:KasraGrid ID="GrdUserSystem" runat="server" OnRowDataBound="GrdUserSystem_RowDataBound" AllowSorting="true"
                                OnSorting="GrdUserSystem_Sorting">
                            </cc2:KasraGrid>
                            </div>

                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                    <asp:HiddenField ID="txtMaxNumber" runat="server" />
                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="txtPageNumber" runat="server" />
                                    <asp:HiddenField ID="txtCarDriver" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                     <asp:HiddenField ID="txtUserActive" runat="server" />
                                      <asp:HiddenField ID="txtUserDeactive" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="txtSortCondition" runat="server" /> 
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
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
                    <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
                    <input type="text" id="txtSearchXML" name="txtSearchXML" runat="server" />
                    <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
                    <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        document.body.scroll = "no";
        var str1 = ""
        $(document).ready(function () {
            $("#" + MasterObj + "GrdUserSystem").click(function () {

            });
        });
        var LastSelectedRow = "";
        var LastSelectedRowClass = "";


        $get(MasterObj + "UserActive").innerText = $get(MasterObj + "txtUserActive").value
        $get(MasterObj + "UserDeactive").innerText = $get(MasterObj + "txtUserDeactive").value


        //=====================================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

        //====================================================================================================
        function EndRequestHandler(sender, args) {
            if ($get(MasterObj + "txtAlert").value != "") {
                //            alert()
                if (document.getElementById(MasterObj + "txtSubmit").value == "Modify") {
                    //            alert(document.getElementById(MasterObj + "txtSubmit").value)
                    if ($get(MasterObj + "txtValidate").value != "1")
                        alert($get(MasterObj + "txtAlert").value);
                    else
                        alert($get(MasterObj + "txtAlert").value);
                }

                else
                    if (document.getElementById(MasterObj + "txtSubmit").value == "Modify&new") {
                        if ($get(MasterObj + "txtValidate").value != "1")
                            alert($get(MasterObj + "txtAlert").value);
                        else {
                            alert($get(MasterObj + "txtAlert").value);
                            OnClickBtnNew()
                        }
                    }
            }

            $get(MasterObj + "UserActive").innerText = $get(MasterObj + "txtUserActive").value
            $get(MasterObj + "UserDeactive").innerText = $get(MasterObj + "txtUserDeactive").value

            document.getElementById(MasterObj + "txtSubmit").value = ""
            document.getElementById(MasterObj + "txtAlert").value = ""
            LastSelectedRow = "";
            LastSelectedRowClass = "";
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
        //===============================================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != "" && LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;

            }

            LastSelectedRow = SelectedRow;
            LastSelectedRowClass = SelectedRow.className;
            SelectedRow.className = "CssSelectedItemStyle";

        }

        //===================================================
        function OnClickBtnFilter() {
            $get(MasterObj + "txtPersonID").value = $get(MasterObj + "CmbPesonel_txtCode").value
            $get(MasterObj + "txtSDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;

            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = ""
            if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = ""
            $get(MasterObj + "txtSubmit").value = "Filter";
            $get(MasterObj + "BtnSubmit").click();
        }
        //===================================================
        function OnClickBtnNew() {
            var strUrl = 'SystemUserNew.aspx?ID=0'
            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
            var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 600px;center: Yes;help: no;status: no")
            if (returnValue == "1")
                OnClickBtnFilter();

        }
        //=======================================================ویرایش ========================================  
        function OnClickBtnEdit() {

            if (LastSelectedRow == "")
                alert("به منظور ويرايش یک سطر را انتخاب کنید")
            else {

                var strUrl = "SystemUserNew.aspx?ID= " + LastSelectedRow.getAttribute("ID") + "&SessionID=" + $get(MasterObj + "txtSessionID").value;
                var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 300px;dialogWidth: 600px;center: Yes;help: no;status: no")

                if (returnValue == "1") {
                    $get(MasterObj + "cmbStatus").value = "0"
                    document.getElementById(MasterObj + "txtSubmit").value = "Const"
                    document.getElementById(MasterObj + "BtnSubmit").click()
                }


            }
        }
        //======================================================دابل کلیک =========================================
        function OndbClickGrd() {
            OnClickBtnEdit()
        }

        //=================================================نمایش همه ==============================================
        function OnClickBtnShowAll() {
            $get(MasterObj + "KCalSDate_txtDay").value = ""
            $get(MasterObj + "KCalSDate_txtMonth").value = ""
            $get(MasterObj + "KCalSDate_txtYear").value = ""
            $get(MasterObj + "KCalEDate_txtDay").value = ""
            $get(MasterObj + "KCalEDate_txtMonth").value = ""
            $get(MasterObj + "KCalEDate_txtYear").value = ""
            $get(MasterObj + "KCalSDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEDate_txtCalendar").value = ""
            document.getElementById(MasterObj + "cmbStatus").value = "0"
            $get(MasterObj + "CmbPesonel_txtPCode").value = ""
            $get(MasterObj + "CmbPesonel_txtCode").value = ""
            $get(MasterObj + "CmbPesonel_txtName").value = ""
            document.getElementById(MasterObj + "txtUser").value = ""
            OnClickBtnFilter()


        }
        //===============================================================================================
       
                       
               
    </script>
</asp:Content>
