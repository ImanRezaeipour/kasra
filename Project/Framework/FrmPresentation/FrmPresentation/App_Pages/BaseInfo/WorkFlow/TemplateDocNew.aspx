<%@ Page Title="-------------------------------------------------------------------------------------تعريف الگو--------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="TemplateDocNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.TemplateDocNew" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>
  <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
  <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>                           
<script language="javascript" type="text/javascript">
    aspnetForm.target = window.name;
    var SaveFlag = 0;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "GetFields"
                || document.getElementById(MasterObj + "txtSubmit").value == "GetCodePermision")
                document.getElementById("ctl00_ProgressState").value = 1;

        }

        function EndRequestHandler(sender, args) {
            try {
            
                var StrVal = $get(MasterObj + "txtSubmit").value
                if ($get(MasterObj + "txtAlert").value != "") {
                    if (($get(MasterObj + "txtStatus").value == "0"))
                        alert($get(MasterObj + "txtAlert").value);
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        SaveFlag = 1;
                        window.returnValue = SaveFlag;
                    }

                }

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                $get(MasterObj + "txtStatus").value = "";
            }
            catch (Exception) {
                alert("اطلاعات ناقص است");
            }
        }
 </script>

    <table width="90%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="1309" PageName="DifinitionCodeNew.aspx" Paging="1"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <fieldset style="width:800px; height: 100px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                </font></legend>
                                <table  align="right">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                &nbsp; نام سند :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtDocName" style="width: 180px" class="TxtControls" />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                وضعيت :
                                            </div>
                                        </td>
                                        <td>
                                            <input type="radio" runat="server" id="ChkActive" checked="true" />فعال
                                            <input type="radio" runat="server" id="ChkDeActive" />غير فعال
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شرح
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDesc" runat="server" class="TxtControls" Style="width: 460; height: 50px"
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset style="width: 800px; height: 100px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                    <input type="checkbox" onclick="onclickchkSys()" runat="server" id="chkSys" />
                                    ايجاد سند سيستمي</font></legend>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                نام ويو :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtViewName" style="width:170px" class="TxtControls" onchange="CreateScriptView()" />
                                            </div>
                                        </td>
                                        <td>
                                            گروه مجوز
                                        </td>
                                        <td>
                                           <asp:DropDownList runat="server" style="width:180px" CssClass="TxtControls" onchange="onchangeForGetCodePermission()" ID="CmbGroupCode">
                                                </asp:DropDownList>
                                        </td>
                                        <td>
                                            <div align="right">
                                                نوع مجوز :
                                            </div>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                                <ContentTemplate>
                                                    <asp:HiddenField ID="ShouldBeOpen" runat="server" />
                                                    <select id="CmbCreditType" onchange="CreateScriptView()" runat="server" name="CmbCreditType" style="width: 180px"
                                                        class="TxtControls">
                                                        <option></option>
                                                    </select>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                                اسکريپت ويو :
                                        </td>
                                        <td colspan="5">
                                            <textarea id="txtViewScript" class="TxtControls" wrap="OFF" dir="ltr" style="scrollbar-highlight-color: white;
                                                overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                position: relative; width:680px; height:180px" runat="server"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset style="width: 800px; height: 120px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                    <input type="checkbox" onclick="onclickchkHandly()" runat="server" checked="true" id="ChkHandly" />
                                   ايجاد سند دستي</font></legend>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                جدول اصلي :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <asp:DropDownList runat="server" Width="220px" CssClass="TxtControls" onchange="onchangeCmbSourceTable(0)"
                                                    ID="CmbTableName">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                فيلد اصلي :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <%--   <asp:DropDownList runat="server" ID="CmbTableField" Width="120px" CssClass="TxtControls">
                                                </asp:DropDownList>--%>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <select id="CmbTableField" dir="ltr" style="width: 140px" class="TxtControls" runat="server">
                                                            <option></option>
                                                        </select>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                نام زير سيستم :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <asp:DropDownList runat="server" CssClass="TxtControls" Width="170px" ID="CmbSubSys">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                       <td>
                                            <div align="right">
                                                ويو استفاده شده :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <asp:DropDownList runat="server" onchange="OnChaneCmbViewName()" CssClass="TxtControls" Width="220px" ID="CmbViewName">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                نوع :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <asp:DropDownList runat="server" CssClass="TxtControls" ID="CmbDocType" Width="150px">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td valign="top">
                                                اسکريپت ويو :
                                        </td>
                                          <td colspan="5">
                                              <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                  <ContentTemplate>
                                                      <textarea id="txtViewScriptHandly" class="TxtControls" wrap="OFF" dir="ltr" style="scrollbar-highlight-color: white;
                                                          overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                          position: relative; width: 680px; height: 180px" runat="server"></textarea>
                                                  </ContentTemplate>
                                                  <Triggers>
                                                      <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                  </Triggers>
                                              </asp:UpdatePanel>
                                          </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
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
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtStatus" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtCardReaderID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtDocID" name="txtDocID" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtstrParam" name="txtstrParam" runat="server" />
        <input type="text" id="txtGroupCode" name="txtGroupCode" runat="server" />
        <input type="text" id="txtAcronym" name="txtAcronym" runat="server" />
         <input type="text" id="txtSelectedViewName" name="txtSelectedViewName" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strChk = "";
        if ($get(MasterObj + "txtDocID").value == "")
            CreateScriptView();
   
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateScriptView() {

            $get(MasterObj + "txtViewScript").value = "CREATE VIEW     " + $get(MasterObj + "txtViewName").value + "\n";
            $get(MasterObj + "txtViewScript").value += "AS" + "\n";
            $get(MasterObj + "txtViewScript").value += " SELECT CreditID AS DocId, Type, CreditType, SDate, EDate, DesSummery, Des, StartTime, EndTime," + "\n";
            $get(MasterObj + "txtViewScript").value += "sDepartmentName, DepartmentName, TypeName," + "\n";
            $get(MasterObj + "txtViewScript").value += "CreditTypeName, PersonelNo AS PersonId, 1388 AS Year, DepartmentID" + "\n";
            $get(MasterObj + "txtViewScript").value += "FROM  dbo.vCredit" + "\n";
            $get(MasterObj + "txtViewScript").value += "WHERE     (CreditType IN (" + $get(MasterObj + "CmbCreditType").value + ")) AND EXISTS" + "\n";
            $get(MasterObj + "txtViewScript").value += "  (SELECT     CodeGroupID, CodeGroupName, CodeGroupAcronym, Flags" + "\n";
            $get(MasterObj + "txtViewScript").value += "  FROM      Att.GroupCode AS GC" + "\n";
            $get(MasterObj + "txtViewScript").value += "  WHERE     (CodeGroupAcronym = '" + $get(MasterObj + "txtAcronym").value + "') AND (CodeGroupID = dbo.vCredit.Type))" + "\n";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            $get(MasterObj + "txtDocID").value = "";
            $get(MasterObj + "txtDocName").value = "";
            $get(MasterObj + "txtDesc").value = "";
            $get(MasterObj + "txtViewName").value = "";
            $get(MasterObj + "CmbGroupCode").value = "0";
            $get(MasterObj + "txtViewScript").value = "";
            $get(MasterObj + "CmbCreditType").value = "0";
            $get(MasterObj + "txtViewScript").value = "";
            $get(MasterObj + "CmbSubSys").value = "0";
            $get(MasterObj + "CmbViewName").value = "0";
            $get(MasterObj + "CmbDocType").value = "0";
            $get(MasterObj + "txtViewScriptHandly").value = "";
            $get(MasterObj + "chkSys").checked = false;
            $get(MasterObj + "chkHandly").checked = true ;
            CreateScriptView();
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.returnValue = SaveFlag;
            window.close();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            try {
                if ($get(MasterObj + "txtDocName").value == "")
                    alert("لطفا نام سند را وارد کنيد");
                else if ($get(MasterObj + "ChkHandly").checked == true) {
                    if ($get(MasterObj + "CmbSubSys").value == "0")
                        alert("لطفا نام زير سيستم را انتخاب کنيد");
                    else if ($get(MasterObj + "CmbDocType").value == "0")
                        alert("لطفا نوع سند را انتخاب کنيد");
                    else if ($get(MasterObj + "CmbViewName").value == "0")
                        alert("لطفا ويو استفاده شده را انتخاب کنيد");
                    else {
                        var StrXml = "<Root><Tb>"
                        StrXml += "<DocID>" + document.getElementById(MasterObj + "txtDocID").value + "</DocID>";
                        StrXml += "<DocName>" + document.getElementById(MasterObj + "txtDocName").value + "</DocName>";
                        StrXml += "<Descr>" + document.getElementById(MasterObj + "txtDesc").value + "</Descr>";
                        StrXml += "<CreditType>" + document.getElementById(MasterObj + "CmbCreditType").value + "</CreditType>";
                        StrXml += "<ViewName>" + document.getElementById(MasterObj + "txtViewName").value + "</ViewName>";
                        StrXml += "<TableName>" + document.getElementById(MasterObj + "CmbTableName").value + "</TableName>";
                        StrXml += "<UniqueID>" + document.getElementById(MasterObj + "CmbTableField").value + "</UniqueID>";
                        StrXml += "<ViewUsed>" + document.getElementById(MasterObj + "CmbViewName").value + "</ViewUsed>";
                        StrXml += "<SubSysID>" + document.getElementById(MasterObj + "CmbSubSys").value + "</SubSysID>";
                        StrXml += "<DocType>" + document.getElementById(MasterObj + "CmbDocType").value + "</DocType>";
                        if ($get(MasterObj + "ChkActive").checked == true)
                            StrXml += "<Active>" + 1 + "</Active>";
                        else
                            StrXml += "<Active>" + 0 + "</Active>";
                        StrXml += "</Tb></Root>"
                      
                        document.getElementById(MasterObj + "txtXMLSave").value = StrXml;
                        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                else if ($get(MasterObj + "chkSys").checked == true) {
                    if ($get(MasterObj + "CmbCreditType").value == "0")
                        alert("لطفا نوع مجوز را انتخاب کنيد");
                    else if ($get(MasterObj + "txtViewName").value == "")
                        alert("لطفا نام ويو را وارد کنيد");
                    else {
                        var StrXml = "<Root><Tb>"
                        StrXml += "<DocID>" + document.getElementById(MasterObj + "txtDocID").value + "</DocID>";
                        StrXml += "<DocName>" + document.getElementById(MasterObj + "txtDocName").value + "</DocName>";
                        StrXml += "<Descr>" + document.getElementById(MasterObj + "txtDesc").value + "</Descr>";
                        StrXml += "<CodeID>" + document.getElementById(MasterObj + "CmbCreditType").value + "</CodeID>";
                        StrXml += "<ViewName>" + document.getElementById(MasterObj + "txtViewName").value + "</ViewName>";
                        StrXml += "<TableName>" + document.getElementById(MasterObj + "CmbTableName").value + "</TableName>";
                        StrXml += "<UniqueID>" + document.getElementById(MasterObj + "CmbTableField").value + "</UniqueID>";
                        StrXml += "<ViewUsed>" + document.getElementById(MasterObj + "CmbViewName").value + "</ViewUsed>";
                        StrXml += "<SubSysID>" + document.getElementById(MasterObj + "CmbSubSys").value + "</SubSysID>";
                        StrXml += "<DocType>" + document.getElementById(MasterObj + "CmbDocType").value + "</DocType>";
                        if ($get(MasterObj + "ChkActive").checked == true)
                            StrXml += "<Active>" + 1 + "</Active>";
                        else
                            StrXml += "<Active>" + 0 + "</Active>";
                        StrXml += "</Tb></Root>"
                       
                        document.getElementById(MasterObj + "txtXMLSave").value = StrXml;
                        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
            }
            catch (Exception) {
                alert("اطلاعات ذخيره ناقص است");
            }
        }
        //================================================================
        function onchangeCmbSourceTable(Sign) {
            if (Sign == 0)
                document.getElementById(MasterObj + "txtSubmit").value = "GetFields";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //================================================================
        function onclickchkSys() {
            if (document.getElementById(MasterObj + "chkSys").checked == true) {
                document.getElementById(MasterObj + "CmbCreditType").disabled = false
                document.getElementById(MasterObj + "CmbGroupCode").disabled = false
                document.getElementById(MasterObj + "txtViewName").disabled = false
                document.getElementById(MasterObj + "txtViewScript").disabled = false
                //----------
                document.getElementById(MasterObj + "ChkHandly").checked = false;
                document.getElementById(MasterObj + "CmbTableName").disabled = true;
                document.getElementById(MasterObj + "CmbTableField").disabled = true;
                document.getElementById(MasterObj + "CmbSubSys").disabled = true;
                document.getElementById(MasterObj + "CmbDocType").disabled = true;
                document.getElementById(MasterObj + "CmbViewName").disabled = true;
                document.getElementById(MasterObj + "txtViewScriptHandly").disabled = true;
            }
            else {
                document.getElementById(MasterObj + "CmbCreditType").disabled = true
                document.getElementById(MasterObj + "txtViewName").disabled = true
                document.getElementById(MasterObj + "CmbGroupCode").disabled = true
                document.getElementById(MasterObj + "txtViewScript").disabled = true
                //------------------
                document.getElementById(MasterObj + "ChkHandly").checked = false;
            }
        }
        //================================================================
        function onclickchkHandly() {

            if (document.getElementById(MasterObj + "ChkHandly").checked == false) {
                document.getElementById(MasterObj + "CmbTableName").disabled = true;
                document.getElementById(MasterObj + "CmbTableField").disabled = true;
                document.getElementById(MasterObj + "CmbSubSys").disabled = true;
                document.getElementById(MasterObj + "CmbDocType").disabled = true;
                document.getElementById(MasterObj + "CmbViewName").disabled = true;
                document.getElementById(MasterObj + "txtViewScriptHandly").disabled = true;
                //------
                document.getElementById(MasterObj + "chkSys").checked = false

            }
            else {      
                document.getElementById(MasterObj + "CmbTableName").disabled = false;
                document.getElementById(MasterObj + "CmbTableField").disabled = false;
                document.getElementById(MasterObj + "CmbSubSys").disabled = false;
                document.getElementById(MasterObj + "CmbDocType").disabled = false;
                document.getElementById(MasterObj + "CmbViewName").disabled = false;
                document.getElementById(MasterObj + "txtViewScriptHandly").disabled = false;
                //------
                document.getElementById(MasterObj + "chkSys").checked = false
                document.getElementById(MasterObj + "CmbCreditType").disabled = true
                document.getElementById(MasterObj + "txtViewName").disabled = true
                document.getElementById(MasterObj + "txtViewName").disabled = true
                document.getElementById(MasterObj + "CmbGroupCode").disabled = true
                document.getElementById(MasterObj + "txtViewScript").disabled = true
            }
        }
        //================================================================
        function onchangeForGetCodePermission() {
            // alert($get(MasterObj + "txtGroupCode").value);
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtGroupCode").value);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo [ Val=" + $get(MasterObj + "CmbGroupCode").value + "]");
            if (oXmlNodes.length > 0) {
                $get(MasterObj + "txtAcronym").value = oXmlNodes.item(0).selectSingleNode("CodeGroupAcronym").text;
            }
            CreateScriptView();
            document.getElementById(MasterObj + "txtstrParam").value = "<Root><CodePermission><Flag></Flag><GroupCodeID>" + document.getElementById(MasterObj + "CmbGroupCode").value + "</GroupCodeID><PersonCode>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</PersonCode><SDate>" + document.getElementById(MasterObj + "txtDate").value + "</SDate><EDate>" + document.getElementById(MasterObj + "txtDate").value + "</EDate><OnLineUserID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</OnLineUserID></CodePermission></Root>";
            document.getElementById(MasterObj + "txtSubmit").value = "GetCodePermision";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //================================================================
        function OnChaneCmbViewName() {
            var oCmbView = document.getElementById(MasterObj + "CmbViewName")
            if (oCmbView.value == 0)
                return
            //-------------------------------
            document.getElementById(MasterObj + 'txtSelectedViewName').value = oCmbView[oCmbView.selectedIndex].text
            document.getElementById(MasterObj + 'txtSubmit').value = "RunView"
            document.getElementById(MasterObj + 'BtnSubmit').click()
        }
        //================================================================
    </script>
</asp:Content>
