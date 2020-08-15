<%@ Page Title="---------------------------------------------------------------تعريف قوانين اعطاء به کاردکس-----------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefineCardexRuleModal.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.DefineCardexRuleModal" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        #txtRuleName
        {
            width: 273px;
        }
        .style2
        {
            width: 116px;
        }
        .style5
        {
            width: 119px;
        }
        .style7
        {
            width: 122px;
        }
        .style9
        {
            width: 168px;
        }
        .style11
        {
            width: 237px;
        }
        .style12
        {
            width: 137px;
        }
        .style14
        {
            width: 96px;
        }
        .style15
        {
            width: 170px;
        }
        .style16
        {
            width: 171px;
        }
        .style17
        {
            width: 169px;
        }
        </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 793px">
        <tr>
            <td valign="top">
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <table style="height: 19px">
                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 80px">
                                        تاريخ شروع :
                                    </td>
                                    <td style="width: 200px">
                                        <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 80px">
                                        تاريخ پايان :
                                    </td>
                                    <td style="width: 200px">
                                        <uc2:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                    <td>
                                       دسته بندي :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbGetCardexType" runat="server" Height="16px" Width="150px"
                                            value="0" CssClass="TxtControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">
                                        نام قانون :
                                    </td>
                                    <td style="width: 200px">
                                        <input type="text" id="txtRuleName" class="TxtControls" name="txtRuleName" runat="server" />
                                    </td>
                                    <td style="width: 80px">
                                        شرح قانون :
                                    </td>
                                    <td colspan="3" style="width: 200px">
                                        <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 446px; height: 30px"
                                            name="S1" rows="1">
                     </textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <tr>
                            <td style="width: 100%">
                                <hr style="width: 100%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td  >
                                            کد اعطاء :
                                        </td>
                                        <td  >
                                            <asp:DropDownList ID="cmbGetIncCardex" runat="server" Height="16px" Width="180px"
                                                value="0" CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7" style="width: 100%">
                                <fieldset style="text-align: center; width: 100%" dir="rtl">
                                    <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                        نوع اعطاء : </font></legend>
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="style14">
                                                <input type="radio" checked="true" name="Type" id="rdbConst" runat="server" onclick="rdbConst_Click()"
                                                    value="1" />ثابت
                                            </td>
                                            <td class="style9">
                                                مقدار اعطاء :
                                            </td>
                                            <td class="style11">
                                                <input type="text" id="txtQtyCode" class="TxtControls"  name="txtQtyCode" onkeydown="OnKeyDownNum('integer',this.value)"
                                                    onblur="Timechk(this)" runat="server" />
                                            </td>
                                            <td class="style12">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style14">
                                                <input type="radio" name="Type" id="rdbVariable" runat="server" onclick="rdbVariable_Click()"
                                                    value="2" />متغير
                                            </td>
                                            <td class="style9">
                                                مقدار اعطاء به ازاء هر روز
                                            </td>
                                            <td class="style11">
                                                <input type="text" id="txtQtyCodeVariable" class="TxtControls"  onkeydown="OnKeyDownNum('integer',this.value)"
                                                    onblur="Timechk(this)" name="txtQtyCodeVariable" runat="server" />
                                                 مي باشد .
                                            </td>
                                            <td class="style12">
                                                کد هاي لغو کننده اعطاء :
                                            </td>
                                            <td>
                                                <input id="btnSelectCode" name="btnSelectCode" class="HeaderStyle" onclick="onClickbtnSelectCode()"
                                                    style="width: 25px; cursor: pointer; height: 22px;" type="button" value="..." />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 710px">
                                    <tr>
                                        <td class="style15">
                                             کد ملزم به استفاده :
                                        </td>
                                        <td>
                                            <input type="text" id="txtNeedCode" class="TxtControls"  name="txtNeedCode" onkeydown="OnKeyDownInt(this)"
                                                runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <table style="width: 710px">
                                    <tr>
                                        <td class="style16">
                                            مقدار ملزم به استفاده با ضريب :
                                        </td>
                                        <td class="style12">
                                            <input type="text" id="txtZarib" class="TxtControls"  name="txtZarib" runat="server" />
                                        </td>
                                        <td>
                                            ميزان اعطاء باشد .
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="style17">
                                            شرط اعطاء :
                                        </td>
                                        <td class="style2" colspan="5">
                                            <textarea id="txtCondition" runat="server" class="TxtControls" style="width: 619px;
                                                height: 30px">
                                            </textarea>
                                        </td>
                                    </tr>
                                </table>
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
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSDate" name="txtSDate" runat="server" />
                    <input type="text" id="txtEDate" name="txtEDate" runat="server" />
                    <input type="text" id="txtID" name="txtID" runat="server" />
                    <input type="text" id="txtType" name="txtType" runat="server" />
                    <input type="text" id="txtcmbGetCardexType" name="txtcmbGetCardexType" runat="server" />
                    <input type="text" id="txtcmbGetIncCardex" name="txtcmbGetIncCardex" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtXMLMember" runat="server" />
                    <input id="tSelectedMamber" name="tSelectedMamber" runat="server" />
                    <input type="text" id="txtCancelCode" name="txtCancelCode" runat="server" />
                    <input type="text" id="txtCancelCodeName" name="txtCancelCodeName" runat="server" />
                </div>
            </td>
        </tr>
    </table>
 <script language="javascript" type="text/javascript">
     var strXmlGroup;
     document.body.scroll = "no";
     BindPage();
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     function BeginRequestHandler(sender, args) {
     }
     function EndRequestHandler(sender, args) {
         var StrVal = $get(MasterObj + "txtSubmit").value
         if (StrVal == "Modify") {
             if ($get(MasterObj + "txtValidate").value != "1")
                 alert($get(MasterObj + "txtAlert").value);
             else {
                 SetMsg($get(MasterObj + "txtAlert").value);
                 window.returnValue = 1
             }
         }
         $get(MasterObj + "txtSubmit").value = "";
         $get(MasterObj + "txtValidate").value = "";
         $get(MasterObj + "txtAlert").value = "";
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function BindPage() {
         if ($get(MasterObj + "txtXMLMember").value == "") 
                 OnClickBtnNew()
         if ($get(MasterObj + "txtXMLSave").value != "") {
             var strXml = $get(MasterObj + "txtXMLSave").value
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(strXml);
             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GetCardexRule");
             if (oXmlNodes.length > 0) {
                 $get(MasterObj + "txtID").value = oXmlNodes.item(0).selectSingleNode("ID").text
                 $get(MasterObj + "cmbGetIncCardex").value = oXmlNodes.item(0).selectSingleNode("CodeID").text
                 $get(MasterObj + "cmbGetCardexType").value = oXmlNodes.item(0).selectSingleNode("CardexType").text
                 $get(MasterObj + "txtCancelCodeName").value = oXmlNodes.item(0).selectSingleNode("CodeName").text
                 $get(MasterObj + "txtRuleName").value = oXmlNodes.item(0).selectSingleNode("RuleName").text
                 $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("RuleDescr").text
                 var SDate = oXmlNodes.item(0).selectSingleNode("StartDate").text
                 var EDate = oXmlNodes.item(0).selectSingleNode("EndDate").text
                 if (SDate == "")
                     SDate = "//"
                 if (EDate == "")
                     EDate = "//" 
                 $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(0, 2);
                 $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(3, 2);
                 $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(6, 4);
                 
                 $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(0, 2);
                 $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(3, 2);
                 $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(6, 4);
                 
                 $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                 $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value

                 $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
                 $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

                 $get(MasterObj + "txtType").value = oXmlNodes.item(0).selectSingleNode("CardexType").text

                 $get(MasterObj + "txtNeedCode").value = oXmlNodes.item(0).selectSingleNode("NeedCode").text
                 $get(MasterObj + "txtZarib").value = oXmlNodes.item(0).selectSingleNode("NeedQuantity").text
                 $get(MasterObj + "txtCondition").value = oXmlNodes.item(0).selectSingleNode("Condition").text

                 if (oXmlNodes.item(0).selectSingleNode("TypeScript").text == "0") {
                     document.getElementById(MasterObj + "rdbConst").checked = true;
                     document.getElementById(MasterObj + "rdbVariable").checked = false;
                     $get(MasterObj + "txtQtyCode").value = oXmlNodes.item(0).selectSingleNode("Quantity").text;
                     $get(MasterObj + "txtCancelCode").value = "";
                     rdbConst_Click();
                 }
                 else if (oXmlNodes.item(0).selectSingleNode("TypeScript").text == "1") {
                 document.getElementById(MasterObj + "rdbVariable").checked = true;
                 document.getElementById(MasterObj + "rdbConst").checked = false;
                 $get(MasterObj + "txtQtyCodeVariable").value = oXmlNodes.item(0).selectSingleNode("Quantity").text;
                 $get(MasterObj + "txtCancelCode").value = oXmlNodes.item(0).selectSingleNode("CancelCode").text;
                     rdbVariable_Click();
                 }
             }
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function onClickbtnSelectCode() {
         var strSelectedCode = "";
         //----برای لود کردن کدهایی که قبلا ذخیره شده اند در ص انتخاب کد-----
         if ($get(MasterObj + "txtID").value != "0") {
             strSelectedCode = $get(MasterObj + "txtCancelCode").value;
             if (strSelectedCode != null && strSelectedCode != "") {
                 var strCode = strSelectedCode.split(',');
                 strSelectedCode = "";
                 for (var i = 0; i < strCode.length; i++) {
                     strSelectedCode += "<TbCode>"
                     strSelectedCode += "<CodeID>" + strCode[i] + "</CodeID>"
                     strSelectedCode += "<Selected>1</Selected>"
                     strSelectedCode += "</TbCode>"
                 }
             }
         }
         var url = "../BaseInfo/SelectMultiCode.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
                + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value + "&SelectedCode=" + strSelectedCode;
         strOptions = "dialogHeight: 450px;dialogWidth:500px;center: Yes;help: no;status: no"
         if (url != "") {
             var OSelectedCode = "";
             OSelectedCode = window.showModalDialog(url, "", strOptions)
             url = ""
         }
         if (OSelectedCode != undefined && OSelectedCode != "" && OSelectedCode != "<Root></Root>") {
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(OSelectedCode);
             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode[ Selected=1]");
             var StrCodeId = "";
             var StrCodeName = "";
             if (oXmlNodes.length > 0) {

                 for (var i = 0; i < oXmlNodes.length; i++) {

                     if (StrCodeId == "") {
                         StrCodeId = oXmlNodes.item(i).selectSingleNode("CodeID").text;
                         StrCodeName = oXmlNodes.item(i).selectSingleNode("CodeName").text;
                     }
                     else {
                         StrCodeId = StrCodeId + "," + oXmlNodes.item(i).selectSingleNode("CodeID").text;
                         StrCodeName = StrCodeName + "," + oXmlNodes.item(i).selectSingleNode("CodeName").text;
                     }

                 }

             }
         }
         if (StrCodeId != undefined) {
             $get(MasterObj + "txtCancelCode").value = StrCodeId;

             $get(MasterObj + "txtCancelCodeName").value = StrCodeName;
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnCancel() {
         window.returnValue = returnValue;
         window.close()
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function cmbOpr2OnChange(obj) {
         if (obj.value == 3503)
             document.getElementById(MasterObj + 'txtQty2').disabled = false
         else {
             document.getElementById(MasterObj + 'txtQty2').value = ""
             document.getElementById(MasterObj + 'txtQty2').disabled = true
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSave() {
         strXmlGroup = document.getElementById(MasterObj + "tSelectedMamber").value;
         if (document.getElementById(MasterObj + "txtCancelCode").value == "")
             document.getElementById(MasterObj + "txtCancelCode").value = "0"

         if (document.getElementById(MasterObj + "cmbGetCardexType").value == "")
             document.getElementById(MasterObj + "cmbGetCardexType").value = "0"
         
         if (document.getElementById(MasterObj + "txtRuleName").value == "") {
             alert('لطفا نام قانون را وارد کنید')
             return
         }
         if (document.getElementById(MasterObj + "txtDesc").value == "") {
             alert('لطفا شرح قانون را وارد کنید')
             return
         }
        if (document.getElementById(MasterObj + "cmbGetIncCardex").value == "0") {
             alert('لطفا کد اعطاء را وارد کنید')
             return
         }
         if (document.getElementById(MasterObj + "rdbConst").checked == true && document.getElementById(MasterObj + "txtQtyCode").value == "") {
             alert('لطفا مقدار اعطاء وارد کنید')
             return
         }
         if (document.getElementById(MasterObj + "rdbConst").checked == false && document.getElementById(MasterObj + "txtQtyCodeVariable").value == "") {
             alert('لطفا مقدار اعطاء را وارد کنید')
             return
         }
         if (document.getElementById(MasterObj + "rdbConst").checked == false && document.getElementById(MasterObj + "txtCancelCode").value == "") {
             alert('لطفا کدهاي لغو کننده را وارد کنید')
             return
         }
         if ( document.getElementById(MasterObj + "txtNeedCode").value == "") {
             alert('لطفا کد ملزم به استفاده را وارد کنید')
             return
         }
         if ( document.getElementById(MasterObj + "txtZarib").value == "") {
             alert('لطفا ضريب را وارد کنید')
             return
         }
         SaveDate();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {
         $get(MasterObj + "txtID").value = "0"

        $get(MasterObj + "rdbConst").checked = true;
        $get(MasterObj + "rdbVariable").checked = false;

        $get(MasterObj + "cmbGetCardexType").value = "0";
        $get(MasterObj + "txtRuleName").value = "";
        $get(MasterObj + "txtDesc").value = "";
        //         
        $get(MasterObj + "cmbGetIncCardex").value = "0";

        $get(MasterObj + "txtQtyCode").value = "";
        $get(MasterObj + "txtQtyCodeVariable").value = "";
        $get(MasterObj + "txtCancelCode").value = "";
        $get(MasterObj + "txtCancelCodeName").value = "";
        $get(MasterObj + "txtNeedCode").value = "";
        $get(MasterObj + "txtZarib").value = "";
        $get(MasterObj + "txtCondition").value = "";

        $get(MasterObj + 'txtQtyCode').disabled = false;
        $get(MasterObj + "txtQtyCodeVariable").disabled = true;
        $get(MasterObj + "txtCancelCode").disabled = true;
        $get(MasterObj + "txtCancelCodeName").disabled = true;
        $get("btnSelectCode").disabled = true;
      
        $get(MasterObj + 'txtQtyCode').style.backgroundColor = "white";
        $get(MasterObj + 'txtQtyCodeVariable').style.backgroundColor = "lightgrey";
        $get(MasterObj + 'txtCancelCode').style.backgroundColor = "lightgrey";
        $get(MasterObj + 'txtCancelCodeName').style.backgroundColor = "lightgrey";
        
         document.getElementById(MasterObj + "tSelectedMamber").value = ""
        
         $get(MasterObj + "KCalSDate_txtDay").value = "01";
         $get(MasterObj + "KCalSDate_txtMonth").value = "01";
         $get(MasterObj + "KCalSDate_txtYear").value = "1301";

         $get(MasterObj + "KCalEDate_txtDay").value = "29";
         $get(MasterObj + "KCalEDate_txtMonth").value = "12";
         $get(MasterObj + "KCalEDate_txtYear").value = "1399";

         $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
         $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
        
         $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
         $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
     }
      //================================================================================================================
     function SaveDate() {
         var strXML = strXmlGroup;

         if (document.getElementById(MasterObj + "rdbConst").checked == true)
             document.getElementById(MasterObj + "txtType").value = 0       //ثابت
         else document.getElementById(MasterObj + "txtType").value = 1      //متغير

         document.getElementById(MasterObj + "txtcmbGetCardexType").value = document.getElementById(MasterObj + "cmbGetCardexType").value
         document.getElementById(MasterObj + "txtcmbGetIncCardex").value = document.getElementById(MasterObj + "cmbGetIncCardex").value

         document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
         document.getElementById(MasterObj + "txtEDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

         if (document.getElementById(MasterObj + "txtID").value == "")
             document.getElementById(MasterObj + "txtID").value = "0"
        
         document.getElementById(MasterObj + "txtXMLSave").value = strXML;
         document.getElementById(MasterObj + "txtSubmit").value = "Modify";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //============================================================================================
     function OnClickBtnSelectGroup() {
         document.getElementById(MasterObj + "tSelectedMamber").value = "";
         var strUrl = "../BaseInfo/ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=131"
         strUrl = encodeURI(strUrl)
         returnValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no')
         if (returnValue != "" && returnValue != undefined)
             document.getElementById(MasterObj + "tSelectedMamber").value = returnValue;
     }
     //================================================================================================
     function rdbConst_Click() {
         $get(MasterObj + 'txtQtyCode').disabled = false;
         $get(MasterObj + 'txtQtyCode').style.backgroundColor = "white";

         $get(MasterObj + "txtQtyCodeVariable").disabled = true;
         $get(MasterObj + "txtCancelCode").disabled = true;
         $get(MasterObj + "txtCancelCodeName").disabled = true;

         $get("btnSelectCode").disabled = true;

         $get(MasterObj + 'txtQtyCodeVariable').style.backgroundColor = "lightgrey";
         $get(MasterObj + 'txtCancelCodeName').style.backgroundColor = "lightgrey";
     }
     //================================================================================================
     function rdbVariable_Click() {

         $get(MasterObj + 'txtQtyCode').disabled = true;
         $get(MasterObj + 'txtQtyCode').style.backgroundColor = "lightgrey";

         $get(MasterObj + "txtQtyCodeVariable").disabled = false;
         $get(MasterObj + "txtCancelCodeName").disabled = false;
         $get("btnSelectCode").disabled = false;

         $get(MasterObj + 'txtQtyCodeVariable').style.backgroundColor = "white";
         $get(MasterObj + 'txtCancelCodeName').style.backgroundColor = "white";

     }
     //================================================================================================
 </script>
</asp:Content>
