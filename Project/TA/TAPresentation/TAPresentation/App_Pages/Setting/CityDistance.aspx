<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CityDistance.aspx.cs" Inherits="TAPresentation.App_Pages.Setting.DefineCityDistance" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .fieldsetStyle
        {
            width:1180px; 
            height: 60px; 
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6
        }
        .DropDownListStyle
        {
            font-weight:bold;
	        font-size: 8pt;
	        font-family: tahoma;
	        background-color: white;
	        border-color: lightsteelblue;
	        height :20px ;
	        width: 180px;
            display: none
        }
        .DivStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top;
            height: 390px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table  >
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager2" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td >
                <fieldset  class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="70%" align="right">
                        <tr>
                            <td>
                                شهر مبدا :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbEraCity" runat="server" />
                            </td>
                            <td>
                               شهر مقصد :
                            </td>
                            <td>
                                  <uc4:ComboBox ID="CmbDestinationCity" runat="server" />
                            </td>
                      
                            <td>
                                فاصله :
                            </td>
                            <td>
                               <input type="text" runat="server" id="txtDistance" class="TxtControls" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td width="1180px" >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center"  >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewCountainer" class="DivStyle">
                            <cc2:KasraGrid ID="GrdCityDistance" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdCityDistance_Sorting">
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtEraCity" name="txtDestinactionCity" runat="server" />
         <input type="text" id="txtDestinationCity" name="txtDestinationCity" runat="server" />
        <input type="text" id="txtDistanceID" name="txtDistanceID" runat="server" />
         <input type="text" id="txtDistanceSearch" name="txtDistanceSearch" runat="server" />
    </div>
 <script>
     var LastSelectedRow = null, LastSelectedRowClass = ""
     document.getElementsByTagName("body")[0].scroll = "no";
     //====================================================================================================
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
     //=====================================================================================================
     function BeginRequestHandler(sender, args) {
         document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
     }
     //====================================================================================================
     function EndRequestHandler(sender, args) {
         document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
         var StrVal = $get(MasterObj + "txtSubmit").value
         LastSelectedRow = null
         if (StrVal == "Delete") {
             if ($get(MasterObj + "txtValidate").value == "1")
                 SetMsg($get(MasterObj + "txtAlert").value)
             else
                 alert($get(MasterObj + "txtAlert").value)
         }
         $get(MasterObj + "txtAlert").value = ""
         $get(MasterObj + "txtSubmit").value = ""
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
     //--------------------------------------------------------------------------------------------
     function OnClickBtnFirst() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
         document.getElementById(MasterObj + "BtnSubmit").click()
     }
     //===============================================================================================
     function OnClickGrd(SelectedRow) {
         if (LastSelectedRow != null)
             LastSelectedRow.className = LastSelectedRowClass
         LastSelectedRowClass = SelectedRow.className
         LastSelectedRow = SelectedRow
         SelectedRow.className = "CssSelectedItemStyle"
     }
     //===============================================================================================
     function OnClickBtnFilter() {
         $get(MasterObj + "txtEraCity").value = $get(MasterObj + "CmbEraCity_txtCode").value;
         $get(MasterObj + "txtDestinationCity").value = $get(MasterObj + "CmbDestinationCity_txtCode").value;
         $get(MasterObj + "txtDistanceSearch").value = $get(MasterObj + "txtDistance").value;
         $get(MasterObj + "txtSubmit").value = "Filter";
         $get(MasterObj + "BtnSubmit").click();
     }
     //===============================================================================================
     function OnClickBtnShowAll() {
         $get(MasterObj + "txtEraCity").value = "";
         $get(MasterObj + "CmbEraCity_txtCode").value = "";
         $get(MasterObj + "CmbEraCity_txtName").value = "";
         $get(MasterObj + "txtDestinationCity").value = "";
         $get(MasterObj + "CmbDestinationCity_txtCode").value = "";
         $get(MasterObj + "CmbDestinationCity_txtName").value = "";
         $get(MasterObj + "txtDistanceSearch").value = "";
         $get(MasterObj + "txtDistance").value = "";
         $get(MasterObj + "txtSubmit").value = "Filter";
         $get(MasterObj + "BtnSubmit").click();
     }
     //===============================================================================================
     function OnClickBtnNew() {
         var strUrl = "CityDistanceNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                       + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                       + "&DistanceID=0"
         strUrl = encodeURI(strUrl)
         var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:850px;center: Yes;help: no;status: no')
         if (retValue == 1)
             OnClickBtnFilter()
     }
     //===============================================================================================
     function OnDblClickGrd() {
         OnClickBtnEdit()
     }
     //===============================================================================================
     function OnClickBtnEdit() {
         if (LastSelectedRow != null) {
             var strUrl = "CityDistanceNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&EraCity=" + LastSelectedRow.getAttribute("EraCity")
                                + "&DestinationCity=" + LastSelectedRow.getAttribute("DestinationCity")
                                + "&Distance=" + LastSelectedRow.cells(2).innerText
                                + "&DistanceID=" + LastSelectedRow.getAttribute("DistanceID")
             strUrl = encodeURI(strUrl)
             var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:850px;center: Yes;help: no;status: no')
             if (retValue == 1)
                 OnClickBtnFilter()
         }
         else
             alert('لطفا يک سطر از گريد انتخاب کنيد')
     }
     //===============================================================================================
     function OnClickBtnDel() {
         if (LastSelectedRow != null) {
             if (confirm("آيا براي حذف مطمئنيد؟")) {
                 $get(MasterObj + "txtDistanceID").value = LastSelectedRow.getAttribute("DistanceID");
                 $get(MasterObj + "txtSubmit").value = "Delete";
                 $get(MasterObj + "BtnSubmit").click();
             }
         }
         else
             alert('لطفا يک سطر از گريد انتخاب کنيد')
     }
     //===============================================================================================
 
 </script>
</asp:Content>


