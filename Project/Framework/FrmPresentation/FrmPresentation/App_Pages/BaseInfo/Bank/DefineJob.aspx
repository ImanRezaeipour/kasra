<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"
    AutoEventWireup="true" CodeBehind="DefineJob.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.DefineJob" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        #TextArea1
        {
            width: 359px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr style="height:5px">
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 95%px; height: 50px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">اطلاعات عمومي</legend>
                    <table class="style1">
                        <tr style="width:100%" >
                            <td style="width:150px">
                                نام Job:
                            </td>
                            <td align="right" style="width:40%">
                                <input id="txtJobName" align="right" type="text" runat="server" 
                                    style="width:80%" class="TxtControls" />
                            </td>
                            <td style="width:100px">
                                توضيحات:
                            </td>
                            <td align="right" style="width:40%">
                                <div align="right" style="width:100%">
                                    <textarea id="txtDesc" class="TxtControls" name="S1" rows="2" style="width:80%" runat="server"></textarea>
                                </div>
                            </td>
                            <td style="width:100px">
                                <input id="ChkEnable" type="checkbox" runat="server"/>فعال
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%;">
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 100px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">Steps</legend>
                    <table style="width: 100%; height: 150px">
                        <tr>
                            <td style="width: 900PX; height: 100%" valign="top">
                                <div align="right">
                                    <table id="XTabTable_Header" style="width: 100%; height: 26px;">
                                        <thead id="Header1" style="display: inline">
                                            <tr id="TrHead" align="center" valign="top" style="width: 100%" valign="top">
                                                <td align="center" class="CssHeaderStyle" style="width: 5%">
                                                    شماره
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 9%;">
                                                    نام Step
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 15%;">
                                                    Command
                                                </td>
                                                 <td align="center" class="CssHeaderStyle" style="width: 14%">
                                                    در صورت بروز خطا
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 8%">
                                                    دفعات تلاش
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 10%;">
                                                                                                       وقفه بين تلاش</td>
                                                <td align="center" class="CssHeaderStyle" style="width: 14%;">
                                                    در صورت اجراي موفق
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 15%;">
                                                    مسير فايل خروجي 
                                                </td>                                                
                                            </tr>
                                        </thead>
                                    </table>
                                    <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                        scrollbar-base-color: #b0c4de; height: 100px">
                                        <table id="XTabTable" style="width: 100%;" onclick="onclickgrdXTabTable()" ondblclick="ondbclickgrdXTabTable()" >
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div style="height: 99%; width: 80px">                                   
                                    <input id="BtnStepNew" type="button" style="width: 60px;" value="Stepجديد"class="HeaderStyle" onclick="OnclickBtnStepNew()" /><br /><br style="font-size:5" />                                    
                                    <input id="BtnStepEdit" type="button" style="width: 60px;" value="ويرايش" class="HeaderStyle" onclick="OnclickBtnStepEdit()"/><br /><br style="font-size:5" />                                    
                                    <input id="BtnDelete" type="button" style="width: 60px;" value="حذف"class="HeaderStyle" onclick="onclickBtnDelete()" /><br /><br style="font-size:5" />                                    
                                    <input id="BtnUp" type="button" style="background-position: center center; width: 25px;
                                        background-image: url('../../../App_Utility/Images/uup.png'); background-repeat: no-repeat;"
                                        value="" class="HeaderStyle" onclick="onclickBtnUp()" />&nbsp;
                                    <input id="BtnDown" type="button" style="width: 25px; background-position: center center;
                                        background-image: url('../../../App_Utility/Images/ddn.png'); background-repeat: no-repeat;"
                                        value="" class="HeaderStyle" onclick="onclickBtnDown()" />                                        
                                        
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
             <asp:UpdatePanel ID="UpdatePanel3" runat="server">
              <ContentTemplate>
                <fieldset dir="rtl" style="width: 95%px; height: 100px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="middle">
                    <legend style="color: #75A3D0">زمانبندي</legend>
                    <table style="width:100%;height:100px">
                        <tr>
                            <td style="width: 900PX; height: 100%">
                                <div style="width:100%;height:100%">
                                    <input id="txtAlert" type="hidden" runat="server"/>
                                    <input id="txtValidate" type="hidden" runat="server"/>
                                    <textarea id="txtAreaDescSCH"  class="TxtControls" cols="20" rows="2" style="width:100%;height:95%;background-color: #DDEFF4; " runat="server"></textarea>
                                </div>
                            </td>
                            <td>
                                <div style="height: 99%; width: 80px">                                 
                                  
                                    <input id="BtnEditSCH" type="button" style="width: 60px; margin-right: 0px;" value="ويرايش" 
                                        class="HeaderStyle" onclick="OnclickBtnEditSCH()"/><br />
                                    <br style="font-size:5" /> 
                                    &nbsp;</div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
               </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />        
        <input type="text" id="txtXmlScheduleIDs" name="txtXmlScheduleIDs" runat="server" />
        <input type="text" id="txtXmlStep" name="txtXmlStep" runat="server" />
        <input type="text" id="txtStepID" name="txtStepID" runat="server" />
        <input type="text" id="txtJobID" name="txtJobID" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtXmlBase" name="txtXmlBase" runat="server" />
    </div>
   <script language="javascript" type="text/javascript">
    
       var MasterObj = "ctl00_ContentPlaceHolder1_";
       var LastSelectedRow = null
       var LastSelectedRowClass = "";
       window.document.title = "تنظيمات Job";
       document.getElementById(MasterObj + "txtXmlStep").value = "<Root></Root>";
       document.getElementById(MasterObj + "txtXmlScheduleIDs").value = "<Root></Root>";
       document.getElementById(MasterObj + "txtJobName").select();
       document.getElementById(MasterObj + "txtJobName").focus();
       //============================================
       window.returnValue = "0";
       Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
       //============================================================
       function BeginRequestHandler(sender, args) {
           
       }
       //============================================================
       function EndRequestHandler(sender, args) {
           
           var StrVal = $get(MasterObj + "txtSubmit").value
           if (StrVal != "") {
               if (StrVal == "Save" && $get(MasterObj + "txtValidate").value == "1") {
                   window.returnValue = "1";
                   OnClickBtnNew();
               }              
               if ($get(MasterObj + "txtAlert").value != "")
                   SetMsg($get(MasterObj + "txtAlert").value);

               $get(MasterObj + "txtSubmit").value = "";
               $get(MasterObj + "txtAlert").value = "";
           }
       }
       //============================================================        
       function OnclickBtnEditSCH() {
           var url;
           url = "../Scheduling/Scheduling.aspx?SchedulingID=0&Mode=BankBackup" + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&XmlSchedule=" + document.getElementById(MasterObj + "txtXmlScheduleIDs").value;          
          var returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:600px;dialogWidth: 900px;center: Yes;help: no;status: no")
           /// alert(returnValue)
           if (returnValue.split("#")[0] == "1") {
               document.getElementById(MasterObj + "txtXmlScheduleIDs").value = returnValue.split("#")[1];
           }
           if (document.getElementById(MasterObj + "txtXmlScheduleIDs").value != "") {
            //alert(0)
               document.getElementById(MasterObj + "txtSubmit").value = "Schedule";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
           else document.getElementById(MasterObj + "txtAreaDescSCH").value = "";
       }
       //========================================
       function OnclickBtnStepNew() {
           var url;
           var oGrid = XTabTable;
           url = "DefineStep.aspx?&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&Count=" + oGrid.rows.length + "&Mode=New";
           //alert(url)
         var  returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:480px;dialogWidth: 600px;center: Yes;help: no;status: no")
           
           if (returnValue.split("#")[0] == "1") {
               var oXml = new ActiveXObject("Microsoft.XMLDOM");
               oXml.async = "false";
               oXml.loadXML(returnValue.split("#")[1]);
               
               var XmlNode = oXml.documentElement.selectNodes("Step");

               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
                    
               for (var i = 0; i < XmlNode.length; i++) {                               
                   oXmlDoc.childNodes[0].appendChild(XmlNode.item(i));                  
               }
               document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;               
           }
           AddToGrid();
       }
       //==========================================================
       function AddToGrid() {    
                   
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
           var XmlNode = oXmlDoc.documentElement.selectNodes("Step");

           var oGrid = XTabTable;
           ClearRowGrid();
           for (var i = 0; i < XmlNode.length; i++) {
               var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + (i + 1).toString() + "]");
               var oRow = oGrid.insertRow();               
               if ((oGrid.rows.length - 1) % 2 == 0)
                   oRow.className = "CssItemStyle"
               else oRow.className = "CssAlternatingItemStyle";               
               //===========0
               oRow.setAttribute("ID", XmlNewNode.item(0).selectSingleNode("ID").text) //ID ;             
               var oCell0 = oRow.insertCell();
               oCell0.innerText = i+1              
               oCell0.style.width = "5%"
               oCell0.align = "center"
               //===========1
               var oCell1 = oRow.insertCell();
               if (XmlNewNode.item(0).selectSingleNode("Name").text.length > 10) {
                   oCell1.innerText = XmlNewNode.item(0).selectSingleNode("Name").text.substr(0, 8) + "...";
                   oCell1.title = XmlNewNode.item(0).selectSingleNode("Name").text;
               }
               else oCell1.innerText = XmlNewNode.item(0).selectSingleNode("Name").text;
               oCell1.style.width = "9%"
               oCell1.align = "center"
               //===========2
               var oCell2 = oRow.insertCell();
               if (XmlNewNode.item(0).selectSingleNode("Comm").text.length > 20) {
                   oCell2.innerText = XmlNewNode.item(0).selectSingleNode("Comm").text.substr(0, 15) + "...";
                   oCell2.title = XmlNewNode.item(0).selectSingleNode("Comm").text;
               }
              else  oCell2.innerText = XmlNewNode.item(0).selectSingleNode("Comm").text;
               oCell2.style.width = "15%"
               oCell2.align = "center"
               //===========3 
               var oCell3 = oRow.insertCell();
               oCell3.innerHTML = GreateCombo(i + 1,3);
               oCell3.firstChild.value = XmlNewNode.item(0).selectSingleNode("onFAction").text;         
               oCell3.style.width = "14%"
               oCell3.align = "center"
               //===========4
               var oCell4 = oRow.insertCell();
               
               oCell4.innerHTML = " <input align='right' onblur='onblurRetAtt(this)'  class='TxtControls' type='text' class='txtControl' style='width:100%' onkeydown='OnKeyDownInt(this)' value='" + XmlNewNode.item(0).selectSingleNode("RetAt").text + "' /> "
               oCell4.style.width = "8%"
               oCell4.align = "center"
               //===========5
               var oCell5 = oRow.insertCell(); 
               if( XmlNewNode.item(0).selectSingleNode("MinAt").text!="0")
                   oCell5.innerHTML = " <input align='right' onblur='onblurRetMin(this)' class='TxtControls' class='txtControl' type='text' style='width:100%' onkeydown='OnKeyDownInt(this)' value='" + XmlNewNode.item(0).selectSingleNode("MinAt").text + "'/> "
               else oCell5.innerHTML = " <input align='right' onblur='onblurRetMin(this)' class='TxtControls' class='txtControl' type='text' style='width:100%;color:#C0C0C0' onkeydown='OnKeyDownInt(this)' onfocus='OnKeyDownExam(this)'  value='دقیقه'/> "
               oCell5.style.width = "10%"
               oCell5.align = "center"
               
               //===========6                  
               var oCell6 = oRow.insertCell();
               oCell6.innerHTML = GreateCombo(i + 1,6);
               oCell6.firstChild.value = XmlNewNode.item(0).selectSingleNode("onSAction").text;         
               oCell6.style.width = "14%"
               oCell6.align = "center"
               //===========7
               var oCell7 = oRow.insertCell();               
               if (XmlNewNode.item(0).selectSingleNode("File").text != "")
                   oCell7.innerHTML = " <input onblur='onblurFile(this)' align='right' class='TxtControls' class='txtControl' type='text' style='width:100%' dir='ltr' value='" + XmlNewNode.item(0).selectSingleNode("File").text + "'/> "
               else oCell7.innerHTML = " <input onblur='onblurFile(this)' class='TxtControls' onfocus='OnKeyDownExam(this)' align='right' class='txtControl' type='text' style='width:100%;color:#C0C0C0' dir='ltr' value = 'ٍمثالD:\\New\\Result.sql'/> "           
               oCell7.style.width = "15%"
               oCell7.align = "center"
               
           }          
       }
       //==============================
       function OnKeyDownExam(Obj) {      
           if (Obj.style.color == "#c0c0c0") {
               Obj.value = "";
               Obj.style.color = "Black";
           }
       }
       //===============================
       function onblurRetMin(Obj) {
           if (Obj.value == "") {
               Obj.style.color = "#C0C0C0";
               Obj.value = "دقيقه";
           }
           else {
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
               var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + Obj.parentElement.parentElement.cells(0).innerText + "]");
               XmlNode.item(0).selectSingleNode("MinAt").text = Obj.value;
               document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;
           }
       }
       
       //================================
       function onblurRetAtt(Obj) {
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
           var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + Obj.parentElement.parentElement.cells(0).innerText + "]");
           XmlNode.item(0).selectSingleNode("RetAt").text = Obj.value;
           document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;           
       }
       //==============================
       function onblurFile(Obj) {
           if (Obj.value == "") {
               Obj.style.color = "#C0C0C0";
               Obj.value = "ٍمثالD:\\New\\Result.sql";
           }
           else {
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
               var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + Obj.parentElement.parentElement.cells(0).innerText + "]");
               XmlNode.item(0).selectSingleNode("File").text = Obj.value;
               document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;
              // alert(document.getElementById(MasterObj + "txtXmlStep").value)
           }
       }
       //==============================
       function GreateCombo(intVal, CellNu) {
           var str
       if(CellNu==3)
           str = "<select  class='txtControl' onchange='onchangeSelect(3,this)' "
       else str = "<select class='txtControl' onchange='onchangeSelect(6,this)' "  
           str+="id='Select1' style='width:100%'><option value='3'>Stepبعدي</option><option value='2'>پايانJob،گزارش خطا</option><option value='1'>پايانJob،گزارش انجام</option> ";
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
           var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval!="+intVal+"]");
           for (var i = 0; i < XmlNode.length; i++)
               str += "<option value='4'>" + XmlNode.item(0).selectSingleNode("Intval").text + "-" + XmlNode.item(0).selectSingleNode("Name").text + "</option>"
           str += "</select>"
           
           return str;
       }
       //=================================
       function onchangeSelect(CellNu, Obj) {            
           var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
           oXmlDoc.async = "false";
           oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);           
           var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + Obj.parentElement.parentElement.cells(0).innerText + "]");
           if (CellNu == "3") {
               XmlNode.item(0).selectSingleNode("onFAction").text = Obj.value;
               if (Obj.value == 4)
                   XmlNode.item(0).selectSingleNode("onFS").text = Obj.item(Obj.selectedIndex).text.split("-")[0];
               else if (Obj.value == 3) {
               var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + (parseInt(Obj.parentElement.parentElement.cells(0).innerText) + 1).toString() + "]");
               XmlNode.item(0).selectSingleNode("onFS").text = XmlNewNode.length > 0 ? XmlNewNode.item(0).selectSingleNode("Intval").text : 0;
                 }
           }
           else {
               XmlNode.item(0).selectSingleNode("onSAction").text = Obj.value;
               if (Obj.value == 4)
                   XmlNode.item(0).selectSingleNode("onSS").text = Obj.item(Obj.selectedIndex).text.split("-")[0];
               else if (Obj.value == 3) {
                   var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" +(parseInt(Obj.parentElement.parentElement.cells(0).innerText) + 1).toString() + "]");
                   XmlNode.item(0).selectSingleNode("onSS").text = XmlNewNode.length > 0 ? XmlNewNode.item(0).selectSingleNode("Intval").text : 0;
               }
           }
             
           document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;   
       }
       //=================================
       function ClearRowGrid() {
           var oGrid = XTabTable
           while (oGrid.rows.length > 0) {
               oGrid.deleteRow(oGrid.rows.length - 1);
           }
       }
       //====================================
       function onclickgrdXTabTable() {
           if (window.event.srcElement.tagName != "TABLE") {
               if (window.event.srcElement.parentElement.tagName == "TD")
                   SelectedRow = window.event.srcElement.parentElement.parentElement
               else
                   SelectedRow = window.event.srcElement.parentElement
               if (LastSelectedRow != null) {
                   LastSelectedRow.className = LastSelectedRowClass;
               }
               LastSelectedRowClass = SelectedRow.className;
               LastSelectedRow = SelectedRow;
               SelectedRow.className = "CssSelectedItemStyle";                
           }
       }
       //======================================
       function ondbclickgrdXTabTable() {
           OnclickBtnStepEdit();
       }
       //======================================
       function onclickNewgrdXTabTable(Intval) {
           var oGrid = XTabTable
           var Flag = true,Counter=0;

           while (Flag && Counter <= oGrid.rows.length) {
               if (oGrid.rows(Counter).cells(0).innerText == Intval) {
                   LastSelectedRow = oGrid.rows(Counter);
                   LastSelectedRowClass = oGrid.rows(Counter).className;
                   oGrid.rows(Counter).className = "CssSelectedItemStyle";
                   Flag = false;
               }
               Counter++;
           }  
       }
       //=======================================
       function OnclickBtnStepEdit() {
           if (LastSelectedRow != null) {
               var url;
                              
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
               var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + LastSelectedRow.cells(0).innerText + "]");
               
               url = "DefineStep.aspx?&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&StepID=" + LastSelectedRow.ID + "&Name=" + XmlNode.item(0).selectSingleNode("Name").text + "&DBName=" + XmlNode.item(0).selectSingleNode("DBName").text + "&Comm=" + XmlNode.item(0).selectSingleNode("Comm").text + "&Count=" + LastSelectedRow.cells(0).innerText + "&Mode=Edit"+
               "&onFS=" + XmlNode.item(0).selectSingleNode("onFS").text + "&onSS=" + XmlNode.item(0).selectSingleNode("onSS").text + "&onFAction=" + XmlNode.item(0).selectSingleNode("onFAction").text + "&onSAction=" + XmlNode.item(0).selectSingleNode("onSAction").text + "&File=" + XmlNode.item(0).selectSingleNode("File").text + "&RetAt=" + XmlNode.item(0).selectSingleNode("RetAt").text + "&MinAt=" + XmlNode.item(0).selectSingleNode("MinAt").text;
              
               var returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:480px;dialogWidth: 600px;center: Yes;help: no;status: no")
               if (returnValue.split("#")[0] == "1") {
                   var oXml = new ActiveXObject("Microsoft.XMLDOM");
                   oXml.async = "false";
                   oXml.loadXML(returnValue.split("#")[1]);
                   var XmlNode = oXml.documentElement.selectNodes("Step");

                   var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                   oXmlDoc.async = "false";
                   oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
                   var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + LastSelectedRow.cells(0).innerText + "]");

                  var f = oXmlDoc.documentElement.removeChild(XmlNewNode.item(0));
                  oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));
                  
                   document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;
               }
               AddToGrid();
               LastSelectedRow.className = LastSelectedRowClass;
               LastSelectedRow = null;
           }
           else {
               alert("مورد نظر را انتخاب کنيدStep");
           }
       }
       //===================================
       function onclickBtnDelete() {
           if (LastSelectedRow != null) {                
               if (confirm("براي حذف مطمئن هستيد؟")) {
                   var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                   oXmlDoc.async = "false";
                   oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
                   var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + LastSelectedRow.cells(0).innerText + "]");
                   var f = oXmlDoc.documentElement.removeChild(XmlNewNode.item(0));
                   var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval>" + LastSelectedRow.cells(0).innerText + "]");
                   for (var i = 0; i < XmlNode.length; i++) {
                       XmlNode.item(i).selectSingleNode("Intval").text = (parseInt(XmlNode.item(i).selectSingleNode("Intval").text) - 1).toString();
                   }
                   document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;                  
                   AddToGrid();
                   LastSelectedRow = null;
               }
           }
           else {
               alert("مورد نظر را انتخاب کنيدStep");
           }
       }
       //===============================================
       function onclickBtnUp() {
           if (LastSelectedRow != null) {
               if (LastSelectedRow.cells(0).innerText != "1") {
                   var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                   oXmlDoc.async = "false";
                   oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);

                   var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + LastSelectedRow.cells(0).innerText + "]");
                   var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + (parseInt(LastSelectedRow.cells(0).innerText) - 1).toString() + "]");

                   if (XmlNewNode.length != 0 && XmlNode.length != 0) {
                       var f1 = oXmlDoc.documentElement.removeChild(XmlNewNode.item(0));
                       var f2 = oXmlDoc.documentElement.removeChild(XmlNode.item(0));
                       f2.selectSingleNode("Intval").text = LastSelectedRow.cells(0).innerText;
                       f1.selectSingleNode("Intval").text = (parseInt(LastSelectedRow.cells(0).innerText) - 1).toString();
                       oXmlDoc.childNodes[0].appendChild(f1);
                       oXmlDoc.childNodes[0].appendChild(f2);
                       document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;
                       //alert(document.getElementById(MasterObj + "txtXmlStep").value)
                       AddToGrid();
                       onclickNewgrdXTabTable(XmlNewNode.item(0).selectSingleNode("Intval").text);
                   }
               }
           }
           else {
               alert("مورد نظر را انتخاب کنيدStep");
           }
       }
       //===================================
       function onclickBtnDown() {
           if (LastSelectedRow != null) {
               var oGrid = XTabTable
               if (LastSelectedRow.cells(0).innerText != oGrid.rows.length.toString()) {
                   var LastYadakRow;
                   var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                   oXmlDoc.async = "false";
                   oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
                   var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + LastSelectedRow.cells(0).innerText + "]");
                   var XmlNode = oXmlDoc.documentElement.selectNodes("Step[Intval=" + (parseInt(LastSelectedRow.cells(0).innerText) + 1).toString() + "]");

                   if (XmlNewNode.length != 0 && XmlNode.length != 0) {
                       var f1 = oXmlDoc.documentElement.removeChild(XmlNewNode.item(0));
                       var f2 = oXmlDoc.documentElement.removeChild(XmlNode.item(0));
                       f2.selectSingleNode("Intval").text = LastSelectedRow.cells(0).innerText;
                       f1.selectSingleNode("Intval").text = (parseInt(LastSelectedRow.cells(0).innerText) + 1).toString();
                       oXmlDoc.childNodes[0].appendChild(f1);
                       oXmlDoc.childNodes[0].appendChild(f2);
                       document.getElementById(MasterObj + "txtXmlStep").value = oXmlDoc.xml;
                       AddToGrid();
                       onclickNewgrdXTabTable(XmlNewNode.item(0).selectSingleNode("Intval").text);
                   }
               }
           }
           else {
               alert("مورد نظر را انتخاب کنيدStep");
           }
       }
       //===============================================================
       function OnClickBtnSave() {
           if (notEmpty()) {
               var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlDoc.async = "false";
               oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlStep").value);
               var XmlNewNode = oXmlDoc.documentElement.selectNodes("Step");

               document.getElementById(MasterObj + "txtXmlBase").value = document.getElementById(MasterObj + "txtXmlScheduleIDs").value;
               var oXmlBaseDoc = new ActiveXObject("Microsoft.XMLDOM");
               oXmlBaseDoc.async = "false";
               oXmlBaseDoc.loadXML(document.getElementById(MasterObj + "txtXmlBase").value);
                
               for (var i = 0; i < XmlNewNode.length; i++) {
                   oXmlBaseDoc.childNodes[0].appendChild(XmlNewNode.item(i));
               }
               document.getElementById(MasterObj + "txtXmlBase").value = oXmlBaseDoc.xml; 
              // alert( document.getElementById(MasterObj + "txtXmlBase").value)              
               document.getElementById(MasterObj + "txtSubmit").value = "Save";
               document.getElementById(MasterObj + "BtnSubmit").click();                         
           }

       }
       //==========================================
       function OnClickBtnCancel() {
           window.close();
       }
       //==========================================
       function OnClickBtnNew() {
           document.getElementById(MasterObj + "txtJobName").value = "";
           document.getElementById(MasterObj + "txtDesc").value = "";
           document.getElementById(MasterObj + "txtXmlStep").value = "<Root></Root>";
           ClearRowGrid();
           document.getElementById(MasterObj + "txtXmlScheduleIDs").value = "<Root></Root>";
           document.getElementById(MasterObj + "txtAreaDescSCH").value = "";
           document.getElementById(MasterObj + "ChkEnable").checked = false;         
       }
       //==========================================
       function notEmpty() {
           if (document.getElementById(MasterObj + "txtJobName").value == "") {
               alert("وارد کنيدJobنام")
               return false;
           }                 
           return true;           
       }
   </script>
</asp:Content>
