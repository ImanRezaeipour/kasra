<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="AssignXmlSchema.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.AssignXmlSchema" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <table  class="BorderWithBackGround" style="width:90%">
        <tr>
            <td>            
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td style="text-align:right">
                            نام جدول:</td>
                        <td style="text-align:right">
                           <select id="CmbTable" dir="ltr"  onchange="onchangeTableName()"  class="TxtControls" name="D2" style="width:120px" runat="server" >
                             <option></option>
                            </select>
                            </td>
                        <td style="text-align:right">
                            نام فيلد:</td>
                        <td style="text-align:right">
                          <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <select id="CmbField" dir="ltr" class="TxtControls" name="D3" style="width: 150px" runat="server">
                                        <option></option>
                                    </select>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            </td>
                            </tr><tr>
                        <td>
                            مقدار:</td>
                        <td style="text-align:right">
                            <input id="txtValue" runat="server" class="TxtControls" type="text" /></td>
                        <td style="text-align:right">
                            شِما:</td>
                        <td style="text-align:right">
                          <select id="CmbSchema" dir="ltr"  name="D1" style="width:120px" class="TxtControls" runat="server">
                                <option></option>
                            </select>
                            </td>
                    </tr>
                    <tr><td colspan="2">تعداد آيتم در هر رديف:<input type="text" id="txtItemRowCount" class="TxtControls" style="width:50px"  runat="server"/>                    
                     </td>
                    </tr>
                </table>
            </td>
        </tr>
       
    </table>
    <div style="display:none" >
     <cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
            <input type="text"  id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>  
       <input type="text" id="txtID" name="txtID" runat="server" />       
    </div>
<script language="javascript" type="text/javascript">
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
            if (StrVal == "Save") {
                if (document.getElementById(MasterObj + "txtValidate").value == "1") {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = "1";
                }
                else
                    alert($get(MasterObj + "txtAlert").value);
                $get(MasterObj + "txtAlert").value = "";
            }
        }
        document.getElementById(MasterObj + "txtSubmit").value = "";
    }
    //==============================================================================   
    function onchangeTableName() {
        document.getElementById(MasterObj + "txtSubmit").value = "GetFields";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //===============================================================================
    function OnClickBtnSave() {
        if (CheckValidData()) {
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
    }
    //===================================================================================
    function CheckValidData() {
        if (document.getElementById(MasterObj + "CmbSchema").value == "" || document.getElementById(MasterObj + "CmbSchema").value == "0") {
            alert("شِماي مورد نظر را انتخاب کنيد")
            return false;
        }
        return true;
    }
    //=======================================================
    function OnClickBtnNew() {
        document.getElementById(MasterObj + "txtValue").value = "";
        document.getElementById(MasterObj + "CmbSchema").selectedIndex = 0;
        document.getElementById(MasterObj + "CmbTable").selectedIndex = 0;
        onchangeTableName();        
    }
</script>
</asp:Content>
