<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="TableAndXmlSchema.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.TableAndXmlSchema" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            نام شِما:</td>
                        <td>
                            <select dir="ltr"  id="CmbSchema" name="D1" style="width:150px" class="TxtControls" runat="server">
                                <option></option>
                            </select></td>
                        <td>
                            نام جدول:</td>
                        <td>
                            <select dir="ltr"  id="CmbTable" onchange="onchangeTableName()"  class="TxtControls" name="D2" style="width:150px" runat="server">
                             <option></option>
                            </select></td>
                        <td>
                            نام فيلد:</td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <select dir="ltr"  id="CmbField" class="TxtControls" name="D3" style="width: 120px" runat="server">
                                        <option></option>
                                    </select>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitNew" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            </td>
                        <td>
                            مقدار:</td>
                        <td>
                            <input id="txtValue" type="text" class="TxtControls" runat="server"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                         <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 480px;">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />                                            
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="txtCategoryID" runat="server" />
                            <asp:HiddenField ID="txtType" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="CurPage" runat="server" />
                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />                                      
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
    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
    <cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text"  id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitNew" runat="server" Text="BtnSubmitNew" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="Text1" enableviewstate="true" name="txtSortExpression" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />  
        <!------------------------------------------------------------------------------------------->
         <input type="text" id="txtSchemaName" name="txtSchemaName" runat="server" />
         <input type="text" id="txtTableName" name="txtTableName" runat="server" />
         <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
         <input type="text" id="txtValueTmp" name="txtValueTmp" runat="server" />
         <input type="text" id="txtID" name="txtID" runat="server" />         
        </div>        
        
 <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        var str = "<Root></Root>";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var PersonCode = "0";
        var LastSelectedRow = null
        var LastSelectedRowClass = "";       
    //=====================================================        
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    //========================================================      
    function BeginRequestHandler(sender, args) {
        if (document.getElementById(MasterObj + "txtSubmit").value == "GetFields")
            document.getElementById("ctl00_ProgressState").value = 1;
    }
    function EndRequestHandler(sender, args) {        
        if (LastSelectedRow != null) {
            LastSelectedRow.className = LastSelectedRowClass;
            LastSelectedRow = null;
        }
        var StrVal = $get(MasterObj + "txtSubmit").value
        if (StrVal != "") {            
               if(StrVal=="Save")
               {
                   SetMsg($get(MasterObj + "txtAlert").value);
                   $get(MasterObj + "txtAlert").value = "";
               }
               if (StrVal == "CreateView") {
                if(document.getElementById(MasterObj+"txtValidate").value=="1")
                    SetMsg($get(MasterObj + "txtAlert").value);
                else
                    alert($get(MasterObj + "txtAlert").value);                    
               }
           }        
        document.getElementById(MasterObj + "txtSubmit").value = "";                   
    }
    //==============================================================================    
    function OnClickGrd(SelectedRow) {
        if (SelectedRow.OPID != "0") {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtID").value = LastSelectedRow.getAttribute("ID");
        }
    }
    //==================================    
    function OnClickBtnFilter() {   
        document.getElementById(MasterObj + "txtValueTmp").value = document.getElementById(MasterObj + "txtValue").value;
        document.getElementById(MasterObj + "txtSchemaName").value =document.getElementById(MasterObj + "CmbSchema").selectedIndex==0?"": document.getElementById(MasterObj + "CmbSchema")[document.getElementById(MasterObj + "CmbSchema").selectedIndex].text;
        document.getElementById(MasterObj + "txtTableName").value = document.getElementById(MasterObj + "CmbTable").selectedIndex == 0 ? "" : document.getElementById(MasterObj + "CmbTable")[document.getElementById(MasterObj + "CmbTable").selectedIndex].text;
        document.getElementById(MasterObj + "txtFieldName").value = document.getElementById(MasterObj + "CmbField").selectedIndex == 0 ? "" : document.getElementById(MasterObj + "CmbField")[document.getElementById(MasterObj + "CmbField").selectedIndex].text;
        
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }      
    //========================   
    function OnClickBtnDelete() {
        if (LastSelectedRow != "" && LastSelectedRow != null) {
            if (confirm("آيا براي حذف مطمئن هستيد؟")) {
                document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        else alert("يک رديف را براي حذف انتخاب کنيد")       
    }
    //============================
    function onchangeTableName() {
        document.getElementById(MasterObj + "txtSubmit").value = "GetFields";
        document.getElementById(MasterObj + "BtnSubmitNew").click();
    }
    //========================================
    function OnClickBtnSchemaManage() {
        var url = "ShowExtendedFields.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
        window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 850px;center: Yes;help: no;status: no");
    }
    //====================================
    function OnClickBtnDefine() {
        var url = "AssignXmlSchema.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
        var Result = window.showModalDialog(url, window, "dialogHeight: 200px;dialogWidth: 550px;center: Yes;help: no;status: no");
        if (Result == 1)
            OnClickBtnFilter();
    }
    //=====================================
    function OndbClickGrd(Obj) {    
        var url = "AssignXmlSchema.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&XmlValueID=" + LastSelectedRow.getAttribute("ID");
        var Result = window.showModalDialog(url, window, "dialogHeight: 200px;dialogWidth: 550px;center: Yes;help: no;status: no");
        if (Result == 1)
            OnClickBtnFilter();
    }
    //======================================
    function OnClickBtnEdit() {
        if (LastSelectedRow != null && LastSelectedRow != "")
            OndbClickGrd(LastSelectedRow);
        else alert("لطفا يک سطر از گريد را انتخاب کنيد");
    }
    //======================================
    function OnClickBtnCreateView() {
        if (LastSelectedRow != null && LastSelectedRow != "") {
            if (confirm("مطمئن هستيد ؟View آيا براي ساختن")) {
                document.getElementById(MasterObj + "txtSubmit").value = "CreateView";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        else alert("لطفا يک سطر را انتخاب کنيد")
    }
    //=======================================
</script>        
</asp:Content>
