<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="City.aspx.cs" Inherits="TAPresentation.App_Pages.Setting.City" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>    
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
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
            <td>
                <fieldset class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="50%" align="right">
                        <tr>
                            <td>
                                شهر :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbCity" runat="server" />
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
                            <cc2:KasraGrid ID="GrdCity" runat="server" OnRowDataBound="Grid_RowDataBound"
                                AllowSorting="true" OnSorting="GrdCity_Sorting">
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
        <input type="text" id="txtCity" name="txtDestinactionCity" runat="server" />
        <input type="text" id="txtCityID" name="txtDistanceID" runat="server" />
         <input type="text" id="txtSelectMode" name="txtDistanceID" runat="server"/>
 <script>
     var LastSelectedRow = null, LastSelectedRowClass = ""
     document.getElementsByTagName("body")[0].scroll = "no";
     var str = "<Root></Root>";
     //====================================================================================================
     if ($get(MasterObj + "txtSelectMode").value == "1") {
         document.getElementById("OToolBar_BtnNew").style.display = "none";
         document.getElementById("OToolBar_BtnEdit").style.display = "none";
         document.getElementById("OToolBar_BtnDel").style.display = "none";
         document.getElementById("OToolBar_BtnShowAll").style.display = "none";
     } else
         document.getElementById("OToolBar_BtnOk").style.display = "none";
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
         if (($get(MasterObj + "txtSelectMode").value == "1") &&
             (StrVal == "BtnFirst" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "BtnPrev" || StrVal == "Const" || StrVal == "Filter"))
             SetChk();
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
         $get(MasterObj + "txtCity").value = $get(MasterObj + "CmbCity_txtCode").value;
         $get(MasterObj + "txtSubmit").value = "Filter";
         $get(MasterObj + "BtnSubmit").click();
     }
     //===============================================================================================
     function OnClickBtnShowAll() {
         $get(MasterObj + "txtCity").value = "";
         $get(MasterObj + "CmbCity_txtCode").value = "";
         $get(MasterObj + "CmbCity_txtPCode").value = "";
         $get(MasterObj + "CmbCity_txtName").value = "";
         $get(MasterObj + "txtSubmit").value = "Filter";
         $get(MasterObj + "BtnSubmit").click();
     }
     //===============================================================================================
     function OnClickBtnNew() {
         var strUrl = "CityNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                       + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                       + "&CityID=0"
         strUrl = encodeURI(strUrl)
         var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 250px;dialogWidth:500px;center: Yes;help: no;status: no')
         if (retValue == 1)
             OnClickBtnFilter()
     }
     //===============================================================================================
     function OnDblClickGrd() {
         if ($get(MasterObj + "txtSelectMode").value == "0"
             || $get(MasterObj + "txtSelectMode").value == "")
             OnClickBtnEdit()
     }
//===============================================================================================
     function OnClickBtnEdit() {
         if (LastSelectedRow != null) {
             var strUrl = "CityNew.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                                + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                                + "&CityName=" + LastSelectedRow.cells(1).innerText
                                + "&State=" + LastSelectedRow.cells(2).innerText
                                + "&CityID=" + LastSelectedRow.getAttribute("CityID")
                                + "&CityCode=" + LastSelectedRow.cells(0).innerText
             strUrl = encodeURI(strUrl)
             var retValue = window.showModalDialog(strUrl, '', 'dialogHeight: 250px;dialogWidth:500px;center: Yes;help: no;status: no')
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
                 $get(MasterObj + "txtCityID").value = LastSelectedRow.getAttribute("CityID");
                 $get(MasterObj + "txtSubmit").value = "Delete";
                 $get(MasterObj + "BtnSubmit").click();
             }
         }
         else
             alert('لطفا يک سطر از گريد انتخاب کنيد')
     }
     //===============================================================================================
     function OnClickHeaderChk(obj) {
         var OGrid = document.getElementById(MasterObj + "GrdCity");
         var PageSize = OGrid.rows.length;
         if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
             PageSize = PageSize - 1;

         for (var i = 1; i < PageSize; i++) {
             if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                 OnClickChk(OGrid.rows(i).cells(0).firstChild);
             }
         }
     }
     //===============================================================================================
     function OnClickChk(obj) {
         var OGrid = document.getElementById(MasterObj + "GrdCity");
         var RowIndex = obj.parentElement.parentElement.rowIndex;
         var TbObj = obj.parentElement.parentElement.parentElement.parentElement
         var MID = TbObj.rows(RowIndex).getAttribute("CityID")
         var MName = TbObj.rows(RowIndex).cells(2).innerText + "-" + TbObj.rows(RowIndex).cells(3).innerText;
         var MCode = TbObj.rows(RowIndex).cells(1).innerText;
         var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         oXmlDoc.async = "false";
         var oXmlNodes = "";
         oXmlDoc.loadXML(str);
         if ((str != "<Root></Root>") && (str != "<Root/>"))
             oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [MID=" + MID + "]");

         if (oXmlNodes.length == 0 & obj.checked == true) {
             var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDocTemp.async = "false";
             oXmlDocTemp.loadXML("<Root><Tb><MID>" + MID + "</MID><MCode>" + MCode + "</MCode><MName>" + MName + "</MName></Tb></Root>");
             var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
             oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
         }
         else if (oXmlNodes.length > 0 & obj.checked == false) {
             var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[MID=" + MID + "]");
             var f = oXmlDoc.documentElement.removeChild(oXmlNodeTemp);
         }
         str = oXmlDoc.xml
     }
     //===============================================================================================
     function SetChk() {
         var OGrid = document.getElementById(MasterObj + "GrdCity");
         if (OGrid == null)
             return
         var PageSize = OGrid.rows.length;
         if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
             PageSize = PageSize - 1;

         var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
         oXmlDoc.async = "false";
         oXmlDoc.loadXML(str);

         var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
         for (var j = 0; j < oXmlNodes.length; j++) {
             for (var i = 1; i < PageSize; i++) {
                 if (OGrid.rows(i).getAttribute("CityID") == oXmlNodes.item(j).selectSingleNode("MID").text) {
                     OGrid.rows(i).cells(0).firstChild.checked = true;
                 }
             }
         }
     }
     //===============================================================================================
     function OnClickBtnOk() {
         window.returnValue = str;
         window.close();
     }
 //===============================================================================================
 </script>
</asp:Content>


