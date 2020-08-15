<%@ Page Title="------------------------------------------------------------- محدوديت مقداري / تعدادي ------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DefineLimitCodeModal.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.DefineLimitCodeModal" validateRequest=false %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 17px;
        }
        
        .style2
        {
            width: 171px;
        }
        .style3
        {
            height: 17px;
            width: 171px;
        }
        .style4
        {
            width: 85px;
        }
        .style5
        {
            height: 17px;
            width: 85px;
        }
        .style6
        {
            width: 112px;
        }
        .style7
        {
            height: 17px;
            width: 112px;
        }
        .style9
        {
            width: 71px;
        }
        .TxtCalendar
    {
      border-width: 0px;
      width: 15px;
      font-weight: bold;
      font-family: tahoma;
      font-size: 11px;  
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script language="javascript" type="text/javascript">
    var SD;
    var ED;
    var strXmlGroup;
    var ChkChangRang;
    document.body.scroll = "no";
</script>
<table style="width: 500px">
<tr>
<td valign="top">
    <uc1:ToolBar ID="OToolBar" runat="server" Paging=1 />
<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                  <script type="text/javascript" language="javascript">
                      Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                      Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

                      function BeginRequestHandler(sender, args) {
                          document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                      }

                      function EndRequestHandler(sender, args) {
                          document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                          var StrVal = $get(MasterObj + "txtSubmit").value

                        
                          if (StrVal != "") {
                              
                            // alert(StrVal)
                              if (StrVal == "Save") {
                                  //alert($get(MasterObj + "txtAlert").value)
                                  GetEndDate();
                                  SetMsg($get(MasterObj + "txtAlert").value);
                                  returnValue = 1
                             }
                             if (StrVal == "RengeOnChange") {
                                 GetEndDate();
                                 
                             }
                             
                             
                          }
                          
                          $get(MasterObj + "txtSubmit").value = "";
                          $get(MasterObj + "txtAlertStatus").value = "";
                          $get(MasterObj + "txtAlert").value = "";

                      }

                      
                </script>
</td>
</tr>
<tr>
    <td valign="top" align="right">
      <fieldset style="width: 772px; height: 100px; text-align: center;" align="right">
                                    <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                        شرايط احراز : </font></legend>
                                   <table style="width: 766px">
                                   <tr>
                                   <td valign="top" class="style9">وضعيت :</td>
                                   <td>
                                        <input type="radio" checked name="Type" id="rdbActive" runat="server" />فعال
                                        <input type="radio" name="Type" id="rdbDactive" runat="server" />غيرفعال&nbsp;
                                   </td>
                                   
                                   <td>
                                        </td>
                                   
                                   <td>
                                    
                                        </td>
                                   
                                   <td>
                                       </td>
                                   
                                   <td>
                                       </td>
                                   
                                   </tr>
                                   <tr>
                                   <td valign="top" class="style9">عملگر1 :</td>
                                   <td>
                                   
                                   <asp:DropDownList  ID="cmbOpr1" runat="server" onchange="onchangecmbOpr1()"
                                       Height="16px" Width="150px" value="0" CssClass="TxtControls">
                                   </asp:DropDownList>
                   
                                   </td>
                                   
                                   <td>
                                        کد : </td>
                                   
                                   <td>
                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <input type="text" id="txtCode" name="txtCode" runat="server" 
                                            onkeydown="OnKeyDownInt(this)" 
                                            onblur="OnBlurtxtCode()"
                                    style="WIDTH: 80px;" /><input type="text" id="txtCodeName" 
                                                name="txtCodeName" runat="server" 
                                         /><input id="btnSelectCode" class="HeaderStyle" onclick="onClickbtnSelectCode()" 
                                        style="WIDTH: 25px; CURSOR: hand; HEIGHT: 22px ;" type="button" 
                                        value="..."  />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RefreshCodeSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    </td>
                                   
                                   <td>
                                   
                                           &nbsp;</td>
                                   
                                   <td>
                                   
                                       &nbsp;</td>
                                   
                                   </tr>
                                   <tr>
                                   <td valign="top" class="style9">بازه زماني :</td>
                                   <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                        <input type="text" id="txtEDate" name="txtEDate" runat="server" style="display:none" />
                                            <asp:DropDownList  ID="cmbRenge" runat="server" onchange="cmbRengeOnChange(this)" Height="16px" Width="150px" value="0" CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RefreshRengeSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                   </td>
                                   
                                   <td style="display :none">
                                        از:</td>
                                   
                                   <td style="display :none">
                                       <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                   
                                   <td style="display :none">
                                   
                                           تا:</td>
                                   
                                   <td style="display :none">
                                   
                                       <uc2:KCalendar ID="KCalEDate" runat="server" />
                                        </td>
                                   
                                   </tr>
                                    <tr><td class="style9">عملگر2 : </td><td> 
                                   
                                   <asp:DropDownList  ID="cmbOpr2" runat="server"
                                       Height="16px" Width="150px" value="0" CssClass="TxtControls" onchange="cmbOpr2OnChange(this)">
                                   </asp:DropDownList>
                   
                                   </td><td> 
                                   
                                            مقدار1: </td><td style="width:40px"> 
                                   
                                            <input type="text" id="txtQty1" name="txtQty1" runat="server"  /></td>
                                            <td style="display :none">  
                                   
                                           مقدار2 :</td><td style="display :none"> 
                                   
                                   <input type="text" id="txtQty2" name="txtQty2" runat="server" disabled  /></td></tr>
                                    <tr>
                                   
                                   <td style="width:70px">
                                       مجوز ثبتي:</td>
                                   
                                        <td> 
                                   <asp:DropDownList  ID="cmbCreditCode" runat="server"
                                       Height="16px" Width="150px" value="0" CssClass="TxtControls">
                                   </asp:DropDownList>
                                   
                   
                                   </td><td> 
                                   
                                            &nbsp;</td><td style="width:40px"> 
                                   
                                            &nbsp;</td>
                                            <td> 
                                   
                                                &nbsp;</td><td> 
                                   
                                            &nbsp;</td></tr>
                                    <tr><td class="style9">شرح:</td><td colspan="5"> 
                                   
                   <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 590px; height: 30px" 
                                               name="S1" rows="1" cols="20">
   </textarea></td></tr>
                                   </table>
                                   
                                </fieldset>
      </td> 
      </tr>
<tr>                           
    <td valign="top" style="display:none">
       <fieldset style="width: 772px; height: 15px; text-align: center;" dir="rtl">
                                    <legend>
                                        <font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                        زمان اعمال قانون :                                    </font></legend>
                                   <table style="width: 766px" >
                                   <tr>
                                   <td>
                                        <input type="radio" checked="true" name="TypeCalc" id="rdbInCredit" 
                                            runat="server" value="1" />به هنگام ورود مجوز
                                        <input type="radio" name="TypeCalc" id="rdbEndCalc" runat="server" value="2" />به هنگام محاسبه پايان دوره
                                   </td>
                                   </tr>
                                   </table>
                                   
                                   
                                </fieldset>
                   </td>
</tr>
<tr>
<td>
<fieldset style="width: 772px; height: 100px; text-align: center;" dir="rtl">
                                    <legend>
                                        <font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                        نوع عمليات :  </font></legend>
                                   <table style="width: 766px">
                                   <tr>
                                   <td valign="top" class="style2">
                                        <input type="radio" checked="true" name="TypeOp" id="rdbErrorAndReg" 
                                           runat="server" value="1" />اخطار وثبت </td>
                                   
                                   <td valign="top" class="style4">
                                        پيغام اخطار</td>
                                   
                                   <td valign="top" class="style6">
                                        <input type="text" id="txtError" name="txtError" runat="server" size="20" /></td>
                                   
                                   <td valign="top">
                                        </td>
                                   
                                   <td valign="top">
                                        </td>
                                   
                                   </tr>
                                   <tr>
                                   <td class="style3">
                                        <input type="radio" name="TypeOp" id="rdbDontReg" runat="server" value="2" />عدم ثبت
                                       
                                   </td>
                                   
                                   <td class="style5">
                                         پيغام عدم ثبت</td>
                                   
                                   <td class="style7">
                                        <input type="text" id="txtDontReg" name="txtDontReg" runat="server" /></td>
                                   
                                   <td class="style1">
                                         </td>
                                   
                                   <td class="style1">
                                         </td>
                                   
                                   </tr>
                                   <tr style="display :none">
                                   <td class="style3" >
                                        <input type="radio" name="TypeOp" id="rdbRegAndChangeMazad" runat="server" 
                                            value="3" />ثبت و تبديل مازاد 
                                        
                                   </td>
                                   
                                   <td class="style5">
                                        پيغام ثبت</td>
                                   
                                   <td class="style7">
                                        <input type="text" id="txtRegAndChangeMazad" name="txtRegAndChangeMazad" runat="server" size="20" /></td>
                                   
                                   <td class="style1">
                                        کدمازاد :&nbsp; </td>
                                   
                                   <td class="style1">
                                   
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <input type="text" id="txtCodeMazad" name="txtCodeMazad" 
                                                    onkeydown="OnKeyDownInt(this)" 
                                                    onblur="OnBlurtxtCodeMazad()"
                                            runat="server" style="WIDTH: 80px;" />
                                            <input type="text" id="txtCodeNameMazad" name="txtCodeNameMazad" runat="server" /><input 
                                                    id="btnSelectCodeMazad" class="HeaderStyle" onclick="onClickbtnSelectCodeMazad()" 
                                                style="WIDTH: 25px; CURSOR: hand; HEIGHT: 22px ;" type="button" 
                                                value="..." />
                                           
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RefreshCodeMazadSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    </td>
                                   
                                   </tr>
                                   <tr style="display :none">
                                   <td class="style3">
                                        <input type="radio" name="TypeOp" id="rdbExecRule" runat="server" value="4" />اجراي قانون
                                   </td>
                                   
                                   <td class="style5">
                                        انتخاب قانون</td>
                                   
                                   <td class="style7">
                                       <asp:DropDownList  ID="cmbSelRule" runat="server"
                                           Height="16px" Width="150px" value="0" CssClass="TxtControls">
                                       </asp:DropDownList>
                                   </td>
                                   
                                   <td class="style1">
                                        </td>
                                   
                                   <td class="style1">
                                        </td>
                                   
                                   </tr>
                                   </table>
                                   
                                   
                                </fieldset>
</td>
</tr>
<tr>
</tr>
<tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
                            <asp:HiddenField ID="txtXMLMember" runat="server" />
                             <asp:HiddenField ID="txtEdateTemp" runat="server" />
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
                
                <input type="text" id="txtID" name="txtID" runat="server" />
                <input type="text" id="txtActive" name="txtActive" runat="server" />
                <input type="text" id="txtcmbCreditCode" name="txtcmbCreditCode" runat="server" />
                <input type="text" id="txtcmbOpr1" name="txtcmbOpr1" runat="server" />
                <input type="text" id="txtcmbOpr2" name="txtcmbOpr2" runat="server" />
                <input type="text" id="txtcmbRenge" name="txtcmbRenge" runat="server" />
                <input type="text" id="txtcmbRenge1" name="txtcmbRenge1" runat="server" />
                <input type="text" id="txtcmbSelRule" name="txtcmbSelRule" runat="server" />
                <input type="text" id="txtInCredit" name="txtInCredit" runat="server" />
                <input type="text" id="txtTypeOpr" name="txtTypeOpr" runat="server" />
                <input type="text" id="ActionAlarm" name="ActionAlarm" runat="server" />
                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                     <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                     <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                     <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                     <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                     <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                     <input  type="text" id="txtGroupCodeXML" runat="server" />
                     <asp:Button ID="RefreshCodeSubmit" runat="server" OnClick="RefreshCodeSubmit_Click" />
                      <asp:Button ID="RefreshRengeSubmit" runat="server" OnClick="RefreshRengeSubmit_Click" />
                      <asp:Button ID="RefreshCodeMazadSubmit" runat="server" OnClick="RefreshCodeMazadSubmit_Click" />
                      <input id="txtSelectedMamber" name="txtSelectedMamber" runat="server" />
                      <input id="txtUserFlag" name="txtUserFlag" runat="server" />
                      <input id="tSelectedMamber" name="tSelectedMamber" runat="server" />
                      <input id="txtXmlShowMember" name="txtXmlShowMember" runat="server" />
                      <input id="txtValidUserXml" name="txtValidUserXml" runat="server" />
                </div>
            </td>
        </tr>
 
                           
</table>

 <script language="javascript" type="text/javascript">
     window.name = "DefineLimitCodeModal.aspx"
     aspnetForm.target = "DefineLimitCodeModal.aspx"
     
     document.getElementById(MasterObj + "txtCode").value = ""
     BindPage();
     //_____________________________
     var strXPathConditions = ""
     var PageSize = 10
     var PageSize_X = 5
     var currentPage_X = 0
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function BindPage() {

         if ($get(MasterObj + "txtXMLMember").value != "") {

             document.getElementById(MasterObj + "tSelectedMamber").value = $get(MasterObj + "txtXMLMember").value
             var strXml = $get(MasterObj + "txtXMLMember").value
             
             if (strXml == "")
                 OnClickBtnNew()
                 }
           
             if ($get(MasterObj + "txtXMLSave").value != "") {
                 var strXml = $get(MasterObj + "txtXMLSave").value
                 var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                 oXmlDoc.async = "false";
                 oXmlDoc.loadXML(strXml);
                 var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/LimitOnCode");

                 if (oXmlNodes.length > 0) {

                     $get(MasterObj + "txtID").value = oXmlNodes.item(0).selectSingleNode("ID").text
                     $get(MasterObj + "cmbOpr1").value = oXmlNodes.item(0).selectSingleNode("FirstOperatorID").text
                     $get(MasterObj + "txtCode").value = oXmlNodes.item(0).selectSingleNode("CodeID").text
                     $get(MasterObj + "txtCodeName").value = oXmlNodes.item(0).selectSingleNode("CodeName").text

                     //  alert(0);
                     //OnBlurtxtCode();
                     //  alert("7656");
                     $get(MasterObj + "cmbRenge").value = oXmlNodes.item(0).selectSingleNode("PreFormingPeriodID").text



                     $get(MasterObj + "cmbOpr2").value = oXmlNodes.item(0).selectSingleNode("SecOperatorID").text
                     $get(MasterObj + "txtQty1").value = oXmlNodes.item(0).selectSingleNode("Value1").text
                     $get(MasterObj + "txtQty2").value = oXmlNodes.item(0).selectSingleNode("Value2").text
                     $get(MasterObj + "txtDesc").value = oXmlNodes.item(0).selectSingleNode("Descr").text


                     if (oXmlNodes.item(0).selectSingleNode("Status").text == "1") {
                         document.getElementById(MasterObj + "rdbActive").checked = true
                         document.getElementById(MasterObj + "rdbDactive").checked = false
                     }
                     else if (oXmlNodes.item(0).selectSingleNode("Status").text == "0") {
                         document.getElementById(MasterObj + "rdbDactive").checked = true
                         document.getElementById(MasterObj + "rdbActive").checked = false
                     }
                     var typeActionTime = oXmlNodes.item(0).selectSingleNode("ActionTime").text
                     if (typeActionTime == 3601) {
                         document.getElementById(MasterObj + "rdbInCredit").checked = true
                         document.getElementById(MasterObj + "rdbEndCalc").checked = false
                     }
                     else if (typeActionTime == 3602) {
                         document.getElementById(MasterObj + "rdbEndCalc").checked = true
                         document.getElementById(MasterObj + "rdbInCredit").checked = false
                     }
                     var ActionID = oXmlNodes.item(0).selectSingleNode("ActionID").text

                     if (ActionID == 3701) {
                         document.getElementById(MasterObj + "rdbErrorAndReg").checked = true
                         document.getElementById(MasterObj + "rdbDontReg").checked = false
                         document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked = false
                         document.getElementById(MasterObj + "rdbExecRule").checked = false
                         document.getElementById(MasterObj + "txtError").value = oXmlNodes.item(0).selectSingleNode("ActionAlarm").text
                         document.getElementById(MasterObj + "txtDontReg").value = ""
                         document.getElementById(MasterObj + "txtRegAndChangeMazad").value = ""

                         document.getElementById(MasterObj + "txtCodeMazad").value = ""
                         document.getElementById(MasterObj + "txtCodeNameMazad").value = ""


                         document.getElementById(MasterObj + "cmbSelRule").value = "0"
                     }
                     else if (ActionID == 3702) {
                         document.getElementById(MasterObj + "rdbDontReg").checked = true
                         document.getElementById(MasterObj + "rdbErrorAndReg").checked = false
                         document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked = false
                         document.getElementById(MasterObj + "rdbErrorAndReg").checked = false
                         document.getElementById(MasterObj + "txtDontReg").value = oXmlNodes.item(0).selectSingleNode("ActionAlarm").text
                         document.getElementById(MasterObj + "txtError").value = ""
                         document.getElementById(MasterObj + "txtRegAndChangeMazad").value = ""

                         document.getElementById(MasterObj + "txtCodeMazad").value = ""
                         document.getElementById(MasterObj + "txtCodeNameMazad").value = ""

                         document.getElementById(MasterObj + "cmbSelRule").value = "0"
                     }
                     else if (ActionID == 3703) {
                         document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked = true
                         document.getElementById(MasterObj + "rdbDontReg").checked = false
                         document.getElementById(MasterObj + "rdbExecRule").checked = false
                         document.getElementById(MasterObj + "rdbErrorAndReg").checked = false
                         document.getElementById(MasterObj + "txtRegAndChangeMazad").value = oXmlNodes.item(0).selectSingleNode("ActionAlarm").text
                         document.getElementById(MasterObj + "txtError").value = ""
                         document.getElementById(MasterObj + "txtDontReg").value = ""

                         document.getElementById(MasterObj + "txtCodeMazad").value = oXmlNodes.item(0).selectSingleNode("OverFlowCode").text
                         document.getElementById(MasterObj + "txtCodeNameMazad").value = oXmlNodes.item(0).selectSingleNode("OverFlowCodeName").text
                         //                 OnBlurtxtCodeMazad();

                         document.getElementById(MasterObj + "cmbSelRule").value = "0"
                     }
                     else if (ActionID == 3704) {
                         document.getElementById(MasterObj + "rdbExecRule").checked = true
                         document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked = false
                         document.getElementById(MasterObj + "rdbDontReg").checked = false
                         document.getElementById(MasterObj + "rdbErrorAndReg").checked = false
                         document.getElementById(MasterObj + "txtError").value = ""
                         document.getElementById(MasterObj + "txtRegAndChangeMazad").value = ""
                         document.getElementById(MasterObj + "txtDontReg").value = ""

                         document.getElementById(MasterObj + "txtCodeMazad").value = ""
                         document.getElementById(MasterObj + "txtCodeNameMazad").value = ""

                         document.getElementById(MasterObj + "cmbSelRule").value = oXmlNodes.item(0).selectSingleNode("RuleID").text
                     }

             }
             if ($get(MasterObj + "cmbOpr2").value == 3503)
                 document.getElementById(MasterObj + 'txtQty2').disabled = false

             document.getElementById(MasterObj + "cmbCreditCode").value = oXmlNodes.item(0).selectSingleNode("CreditCode").text

             
             var SDate = oXmlNodes.item(0).selectSingleNode("PeriodSDate").text
             var EDate = oXmlNodes.item(0).selectSingleNode("PeriodEDate").text
           
             if (SDate == "")
                 SDate = "//"
             if (EDate == "")
                 EDate = "//"
             if (SDate != "//" ) {
                 $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
                 $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
                 $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
                 $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                 $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

             }
             if (EDate != "//") {
                 $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
                 $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
                 $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);

             }
         }

         }
//         document.getElementById(MasterObj + "txtCode").focus()
//         OnBlurtxtCode();
//         document.getElementById(MasterObj + "txtCodeName").focus() 
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function onClickbtnSelectCode() {
         var strUrl = "../BaseInfo/SelectCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 450px;center: Yes;help: no;status: no')

         document.getElementById(MasterObj + "txtCode").value = rValue
         OnBlurtxtCode();

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnCancel() {
         window.returnValue = returnValue;
         window.close()
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function onClickbtnSelectCodeMazad() {
         var strUrl = "../BaseInfo/SelectCode.aspx?ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value

         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 450px;center: Yes;help: no;status: no')

         document.getElementById(MasterObj + "txtCodeMazad").value = rValue
         OnBlurtxtCodeMazad();

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnBlurtxtCode() {

         document.getElementById(MasterObj + "txtSubmit").value = "LoadCodeName";
         document.getElementById(MasterObj + "RefreshCodeSubmit").click();
     }

     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnBlurtxtCodeMazad() {

         document.getElementById(MasterObj + "txtSubmit").value = "LoadCodeMazadName";
         document.getElementById(MasterObj + "RefreshCodeMazadSubmit").click();
     }
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function cmbRengeOnChange() {
     
           
         document.getElementById(MasterObj + "txtcmbRenge1").value=document.getElementById(MasterObj + "cmbRenge").value;
         document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value;
         document.getElementById(MasterObj + "txtSubmit").value = "RengeOnChange";
         
         document.getElementById(MasterObj + "RefreshRengeSubmit").click();
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
     function OnClickHeaderChk(obj) {
         var OGrid = document.getElementById("GrdGroup");
         var oLen = OGrid.rows.length

         for (var i = 1; i < oLen; i++) {
             if (OGrid.rows(i).cells(0).firstChild.tagName == 'SPAN')
                 OGrid.rows(i).cells(0).firstChild.firstChild.checked = obj.checked
             else if (OGrid.rows(i).cells(0).firstChild.tagName == 'INPUT')
                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked

         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickHeaderChk1(obj) {
         var OGrid = document.getElementById("GrdDepartment");
         var oLen = OGrid.rows.length

         for (var i = 1; i < oLen; i++) {
             if (OGrid.rows(i).cells(0).firstChild.tagName == 'SPAN')
                 OGrid.rows(i).cells(0).firstChild.firstChild.checked = obj.checked
             else if (OGrid.rows(i).cells(0).firstChild.tagName == 'INPUT')
                 OGrid.rows(i).cells(0).firstChild.checked = obj.checked

         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSave() {


         //         strXmlGroup = GenerateXmlGroup()

         strXmlGroup = document.getElementById(MasterObj + "tSelectedMamber").value;
         if (document.getElementById(MasterObj + "txtCode").value == "")
             document.getElementById(MasterObj + "txtCode").value = "0"


         if (document.getElementById(MasterObj + "txtCodeMazad").value == "")
             document.getElementById(MasterObj + "txtCodeMazad").value = "0"

         if (document.getElementById(MasterObj + "cmbOpr1").value == "0") {

             alert('لطفا عملگر1 را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "txtCode").value == "0") {

             alert('لطفا کدمجوز را وارد کنید')
             return

         }

         else if (document.getElementById(MasterObj + "cmbRenge").value == "0") {

             alert('لطفا بازه زماني را وارد کنید')
             return
         }
         
         else if (document.getElementById(MasterObj + "cmbOpr2").value == "0") {

             alert('لطفا عملگر2 را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "txtQty1").value == "") {

             alert('لطفا مقدار1 را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "cmbOpr2").value == "3503" && document.getElementById(MasterObj + "txtQty2").value == "") {

             alert('لطفا مقدار2 را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "cmbCreditCode").value == "0" || document.getElementById(MasterObj + "cmbCreditCode").value == "") {

             alert('لطفا نوع مجوز ثبتي وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "rdbErrorAndReg").checked == true && document.getElementById(MasterObj + "txtError").value == "") {

             alert('لطفا پيغام اخطار را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "rdbDontReg").checked == true && document.getElementById(MasterObj + "txtDontReg").value == "") {

             alert('لطفا پيغام عدم ثبت را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked == true && document.getElementById(MasterObj + "txtRegAndChangeMazad").value == "") {

             alert('لطفا پيغام ثبت را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked == true && document.getElementById(MasterObj + "txtCodeMazad").value == "0") {

             alert('لطفا کد مازاد را وارد کنید')
             return

         }
         else if (document.getElementById(MasterObj + "rdbExecRule").checked == true && document.getElementById(MasterObj + "cmbSelRule").value == "0") {

             alert('لطفا انتخاب قانون را وارد کنید')
             return

         }

         else if (document.getElementById(MasterObj + "tSelectedMamber").value == '' || document.getElementById(MasterObj + "tSelectedMamber").value == "<UserEntity></UserEntity>") {
             alert('لطفا اطلاعات مربوط به گروه و يا چارت سازماني را وارد نماييد ')
             return
         }
         else if (document.getElementById(MasterObj + "cmbOpr2").value == "3503" && (parseInt(document.getElementById(MasterObj + "txtQty2").value) < parseInt(document.getElementById(MasterObj + "txtQty1").value))) {
             alert('مقدار 1 کمتر از مقدار 2 مي باشد')
             return
         }
         ChkChangRang = 0
         ED = document.getElementById(MasterObj + "KCalEDate_txtYear").value + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + document.getElementById(MasterObj + "KCalEDate_txtDay").value
         SD = document.getElementById(MasterObj + "KCalSDate_txtYear").value + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + document.getElementById(MasterObj + "KCalSDate_txtDay").value
         
         /* if ((document.getElementById(MasterObj + "cmbRenge").value != "0"))
              if (SD != "" && ED == "" && (document.getElementById(MasterObj + "cmbRenge").value != 3401)) {

                 document.getElementById(MasterObj + "txtSDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
                 ChkChangRang=1
                 cmbRengeOnChange();
                       
                

            }
            else */
            if (SD != "" && ED == "" && (document.getElementById(MasterObj + "cmbRenge").value == 3401)) {
                        
                $get(MasterObj + "KCalEDate_txtDay").value = document.getElementById(MasterObj + "KCalSDate_txtDay").value;
                $get(MasterObj + "KCalEDate_txtMonth").value = document.getElementById(MasterObj + "KCalSDate_txtMonth").value;
                $get(MasterObj + "KCalEDate_txtYear").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value;
                var ED = document.getElementById(MasterObj + "KCalEDate_txtYear").value + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + document.getElementById(MasterObj + "KCalEDate_txtDay").value
               
                
            }
//            alert(document.getElementById(MasterObj + "tSelectedMamber").value)
                    SaveDate();        
     }
     
    
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {
     
         $get(MasterObj + "txtID").value = "0"

         $get(MasterObj + "rdbActive").checked = true;
         $get(MasterObj + "rdbDactive").checked = false;

         $get(MasterObj + "cmbOpr1").value = "0";
         $get(MasterObj + "txtCode").value = "";
         $get(MasterObj + "txtCodeName").value = "";
         $get(MasterObj + "cmbRenge").value = "0";
         $get(MasterObj + "cmbOpr2").value = "0";

         $get(MasterObj + "txtQty1").value = ""
         $get(MasterObj + "txtQty2").value = ""
         $get(MasterObj + 'txtQty2').disabled = true
         $get(MasterObj + "txtDesc").value =""
         $get(MasterObj + "rdbInCredit").checked = true;
         $get(MasterObj + "rdbEndCalc").checked = false;
         $get(MasterObj + "rdbErrorAndReg").checked = true;
         $get(MasterObj + "rdbDontReg").checked = false;
         $get(MasterObj + "rdbRegAndChangeMazad").checked = false;
         $get(MasterObj + "rdbExecRule").checked = false;
         $get(MasterObj + "txtError").value = ""
         $get(MasterObj + "txtDontReg").value = ""
         $get(MasterObj + "txtRegAndChangeMazad").value = ""
         $get(MasterObj + "txtCodeMazad").value = ""
         $get(MasterObj + "txtCodeNameMazad").value = ""
         $get(MasterObj + "cmbSelRule").value = "0"
         $get(MasterObj + "cmbCreditCode").value = ""

         $get(MasterObj + "txtSDate").value = ""
         $get(MasterObj + "txtEDate").value = ""
         $get(MasterObj + "txtEdateTemp").value = ""
         
         
         document.getElementById(MasterObj + "tSelectedMamber").value = ""

         $get(MasterObj + "KCalSDate_txtDay").value = "";
         $get(MasterObj + "KCalSDate_txtMonth").value ="";
         $get(MasterObj + "KCalSDate_txtYear").value = "";
         $get(MasterObj + "KCalSDate_txtCalendar").value =""

         $get(MasterObj + "KCalEDate_txtDay").value = "";
         $get(MasterObj + "KCalEDate_txtMonth").value = "";
         $get(MasterObj + "KCalEDate_txtYear").value = "";
         $get(MasterObj + "KCalEDate_txtCalendar").value = ""

       
         
//         var OGrid = document.getElementById("GrdGroup")
//         var len = OGrid.rows.length
//         for (var i = 1; i < len; i++) {
//             if (OGrid.rows(i).cells(0).firstChild.tagName == 'SPAN')
//                 OGrid.rows(i).cells(0).firstChild.firstChild.checked = false
//             else if (OGrid.rows(i).cells(0).firstChild.tagName == 'INPUT')
//                 OGrid.rows(i).cells(0).firstChild.checked = false
//         }

//         var OGrid1 = document.getElementById("GrdDepartment")
//         var len1 = OGrid.rows.length
//         for (var k = 1; k < len1; k++) {
//             if (OGrid1.rows(k).cells(0).firstChild.tagName == 'SPAN')
//                 OGrid1.rows(k).cells(0).firstChild.firstChild.checked = false
//             else if (OGrid1.rows(k).cells(0).firstChild.tagName == 'INPUT')
//                 OGrid1.rows(k).cells(0).firstChild.checked = false
//         }
         
         
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     //============================================================================================
    
     //============================================================================================
    
     //====================================================================================
     
     //============================================================================================
    
     //================================================================================================================		
     //================================================================================================================
     function GetEndDate() {
         var EDate
         if (document.getElementById(MasterObj + "txtEDate").value == "//" || document.getElementById(MasterObj + "txtEDate").value == "")
            EDate = document.getElementById(MasterObj + "txtEdateTemp").value
         else 
            EDate = document.getElementById(MasterObj + "txtEDate").value
         ED = EDate
         if (EDate != "//") {
             $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
             $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
             $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
             var ED = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value

         }

     }
     //================================================================================================================
     function SaveDate() {

         /*
         if ((SD =="") && (document.getElementById(MasterObj + "cmbRenge").value != 3401)) {

             alert('لطفا تاريخ شروع کنترل را وارد کنيد')
         return

         }
         else if (ED < SD && ED!="") {
         alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
         return
         }
         */
//         var strXML = "<CodeLimitationEntity>"
//         strXML += strXmlGroup
//         strXML += "</CodeLimitationEntity>"

         var strXML = strXmlGroup;

         if (document.getElementById(MasterObj + "rdbActive").checked == true)
             document.getElementById(MasterObj + "txtActive").value = 1
         else document.getElementById(MasterObj + "txtActive").value = 0


         document.getElementById(MasterObj + "txtcmbOpr1").value = document.getElementById(MasterObj + "cmbOpr1").value
         document.getElementById(MasterObj + "txtcmbOpr2").value = document.getElementById(MasterObj + "cmbOpr2").value
         document.getElementById(MasterObj + "txtcmbRenge").value = document.getElementById(MasterObj + "cmbRenge").value
         document.getElementById(MasterObj + "txtcmbCreditCode").value = document.getElementById(MasterObj + "cmbCreditCode").value

         if (document.getElementById(MasterObj + "rdbInCredit").checked == true)
             document.getElementById(MasterObj + "txtInCredit").value = 3601
         else document.getElementById(MasterObj + "txtInCredit").value = 3602

         if (document.getElementById(MasterObj + "rdbErrorAndReg").checked == true) {
             document.getElementById(MasterObj + "txtTypeOpr").value = 3701
             document.getElementById(MasterObj + "ActionAlarm").value = document.getElementById(MasterObj + "txtError").value
             document.getElementById(MasterObj + "txtcmbSelRule").value = "0"
         }
         else if (document.getElementById(MasterObj + "rdbDontReg").checked == true) {
             document.getElementById(MasterObj + "txtTypeOpr").value = 3702
             document.getElementById(MasterObj + "ActionAlarm").value = document.getElementById(MasterObj + "txtDontReg").value
             document.getElementById(MasterObj + "txtcmbSelRule").value = "0"
         }
         else if (document.getElementById(MasterObj + "rdbRegAndChangeMazad").checked == true) {
             document.getElementById(MasterObj + "txtTypeOpr").value = 3703
             document.getElementById(MasterObj + "ActionAlarm").value = document.getElementById(MasterObj + "txtRegAndChangeMazad").value
             document.getElementById(MasterObj + "txtcmbSelRule").value = "0"
         }
         else if (document.getElementById(MasterObj + "rdbExecRule").checked == true) {
             document.getElementById(MasterObj + "txtTypeOpr").value = 3704
             document.getElementById(MasterObj + "ActionAlarm").value = ""
             document.getElementById(MasterObj + "txtcmbSelRule").value = document.getElementById(MasterObj + "cmbSelRule").value
         }


         if (document.getElementById(MasterObj + "txtID").value == "")
             document.getElementById(MasterObj + "txtID").value = "0"

         if (document.getElementById(MasterObj + "txtQty2").value == "") {
             document.getElementById(MasterObj + 'txtQty2').disabled = false
             document.getElementById(MasterObj + "txtQty2").value = "0"
         }

         document.getElementById(MasterObj + "txtXMLSave").value = strXML;
         document.getElementById(MasterObj + "txtSubmit").value = "Save";

         if (document.getElementById(MasterObj + "txtCodeMazad").value == "0")
             document.getElementById(MasterObj + "txtCodeMazad").value = ""

        

         document.getElementById(MasterObj + "txtSDate").value = ""; //document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
         document.getElementById(MasterObj + "txtEDate").value = ""; //document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
       
         document.getElementById(MasterObj + "txtSubmit").value="Save"
         document.getElementById(MasterObj + "BtnSubmit").click();
         
     }

     //===========================================================================================
     function onchangecmbOpr1() {
        if (document.getElementById(MasterObj + "cmbOpr1").value == 3303)
            ClearPersonGroupgrd(GrdValidUser)
      }
    //============================================================================================
      function ClearPersonGroupgrd(obj) {
          alert("مجاز به انتخاب گروه پرسنلي نمي باشيد")
          //===========
          if (document.getElementById(MasterObj + "tSelectedMamber").value != "") {
              var tempUserFlag = ""
              var type

              var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
              xmlDoc.loadXML(document.getElementById(MasterObj + "tSelectedMamber").value);
              xmlDoc.setProperty("SelectionLanguage", "XPath");
              var root = "/UserEntity/Person"
              var xmlNodes = xmlDoc.documentElement.selectNodes(root)
              xmlNodes = xmlDoc.documentElement.selectNodes(root + "[Selected=1]");
              
              if (xmlNodes.length > 0)
                  for (var x = 0; x < xmlNodes.length; x++) {
                      if (xmlNodes.item(x).selectSingleNode('UserFlag').text=="G")
                      
                  xmlNodes.item(x).selectSingleNode('Selected').text = 0
              }
              document.getElementById(MasterObj + "tSelectedMamber").value = xmlDoc.xml
          }

          //===========
            
          for (var j = 0; j < obj.rows.length; j++) {
              if (obj.rows(j).UserFlag == "G") {
                  obj.rows(j).cells(0).firstChild.checked = false; 
                  obj.deleteRow(j)
              } 
          }
          newrowindex = 0

         
          
     }
     //============================================================================================

     function OnClickBtnSelectGroup() {
   
     document.getElementById(MasterObj + "tSelectedMamber").value = "";
//         var strUrl = "SelectMember.aspx?ID=" + $get(MasterObj + "txtID").value
//                            +"&Type=chk"
//                            + "&InstanceID=131&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
//                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
//                            + "&System=131&cmbOpr1=" + document.getElementById(MasterObj + "cmbOpr1").value
     ////                            + "XmlShowMember" + $get(MasterObj + "txtXmlShowMember").value

     var strUrl = "../BaseInfo/ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtID").value
                            + "&Type=chk"
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=131" 

  
         strUrl = encodeURI(strUrl)
         var rValue = "";
         var RetValue = "";
        
         RetValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 1100px;center: Yes;help: no;status: no')
        
         if (RetValue != "")
             rValue = RetValue;

         document.getElementById(MasterObj + "tSelectedMamber").value = rValue;
         
         //document.getElementById(MasterObj + "txtScriptGroups").value = rValue

         //         Obj.setAttribute("ScriptGroups", rValue)

     }
     //================================================================================================
     //////////////////////////////////
     function OnKeyDownInt_Sign(number) {
         var key = window.event.keyCode
         
         if (number.value.length > 0)// && !number.select())       
         window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40))
		)
		else
		window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) || (key == 189) ||
			((key >= 35) && (key <= 40))
		)
     }
     //////////////////////////////////
 </script>

</asp:Content>
