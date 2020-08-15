<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefineConditions.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.DefineConditions" ValidateRequest="false" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="style1">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="TblConditions">
                    <tr>
                        <td class="CssHeaderStyle" style="width:100px">
                            آيتم 
                        </td>
                        <td class="CssHeaderStyle" style="width:100px">
                            عملگر
                        </td>
                        <td class="CssHeaderStyle" style="width:100px">
                            مقدار
                        </td>
                        <td class="CssHeaderStyle" style="width:30px">
                           <img src="../../../App_Utility/Images/Icons/NewIcon.gif" onclick="onclickBtnNew(this)"/>
                        </td>
                         <td style="width:30px">
                         </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:mysecurity id="OnLineUser" runat="server">
        </cc1:mysecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />              
        <select id="CmbSchemaItems" dir="ltr" style="width: 100px" class="TxtControls" runat="server">
            <option></option>
        </select>
        <!------------------------------------------------------------->
        <select id="CmbOperand" dir="ltr" style="width: 100px" class="TxtControls" runat="server">
            <option></option>
        </select>
        <input type="text" id="txtCondition" name="txtCondition" runat="server" />  
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        CreateGrid();
        //#################################################
        function CreateGrid() {       
            var i = 1
            while (i < TblConditions.rows.length) {
                TblConditions.deleteRow(i);
            }
            if (document.getElementById(MasterObj + "txtCondition").value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(MasterObj + "txtCondition").value)
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Item");               
                for (var i = 0; i < XmlNodes.length; i++) {
                    AddRow(i + 1, XmlNodes.item(i).selectSingleNode("Name").text, XmlNodes.item(i).selectSingleNode("Oprand").text, XmlNodes.item(i).selectSingleNode("Value").text);
                }
            }
            else AddRow(1);
        }
        //######################################################
        function AddRow(idx,val1,val2,val3) {
            var Orow = TblConditions.insertRow(idx);
            if ((Orow.rowIndex) % 2 == 0)
                Orow.className = "CssItemStyle"
            else
                Orow.className = "CssAlternatingItemStyle";
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();           
            Orow.cells(0).innerHTML = "<select  dir='ltr' class='TxtControls' style='width:100px'>" + document.getElementById(MasterObj + "CmbSchemaItems").innerHTML + "</select>";
            Orow.cells(1).innerHTML = "<select  dir='ltr' class='TxtControls' style='width:100px'>" + document.getElementById(MasterObj + "CmbOperand").innerHTML + "</select>";
            Orow.cells(2).innerHTML = "<input type='text' value='' class='TxtControls' />";
            Orow.cells(3).innerHTML = "<img src='../../../App_Utility/Images/Icons/NewIcon.gif' onclick='onclickBtnNew(this)'/>";
            Orow.cells(4).innerHTML = "<img src='../../../App_Utility/Images/Icons/DelIcon.gif' onclick='onclickBtnDelete(this)'/>";
            if (val1 != null)
                Orow.cells(0).firstChild.value = val1;
            if(val2!=null)
                Orow.cells(1).firstChild.value = val2;
            if (val3 != null)
                Orow.cells(2).firstChild.value = val3;       
        }
        //######################################################
        function onclickBtnNew(obj) {
            var index = obj.parentElement.parentElement.rowIndex;
            AddRow(index + 1);
        }
        //#################################################
        function onclickBtnDelete(obj) {
            if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                var index = obj.parentElement.parentElement.rowIndex;
                TblConditions.deleteRow(index);
            }
        }
        //#######################################################
        function OnClickBtnOK() {
            if (checkValue()) {
                var Str = "<Root>";
                for (var i = 1; i < TblConditions.rows.length; i++) {
                    Str += "<Item><Name>" + TblConditions.rows(i).cells(0).firstChild.value + "</Name>";
                    Str += "<Oprand>" + TblConditions.rows(i).cells(1).firstChild.value + "</Oprand>";
                    Str += "<Value>" + TblConditions.rows(i).cells(2).firstChild.value + "</Value></Item>";
                }
                Str += "</Root>";
                if (Str == "<Root></Root>")
                    Str = "";
                window.returnValue = Str;
                window.close();
            }
        }
        //################################################################
        function checkValue() {
            var i = 1;           
            while (i < TblConditions.rows.length ) {
                if (TblConditions.rows(i).cells(1).firstChild.value == "0") {
                    alert("لطفا عملگر را انتخاب کنيد")
                    TblConditions.rows(i).cells(1).firstChild.focus();
                    TblConditions.rows(i).cells(1).firstChild.setActive();
                    return false;
                }
             i++
         }
         return true;
        }
        //#####################################################################3
    </script>
</asp:Content>
