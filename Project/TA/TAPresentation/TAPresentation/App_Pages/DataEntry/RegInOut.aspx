<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="RegInOut.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.RegInOut"  AsyncTimeout="1800" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table  align="center" >
        <tr>
            <td  width="760px" align="center">
                <asp:ScriptManager ID="ScriptManager1" runat="server"   AsyncPostBackTimeout="1800">
                </asp:ScriptManager>
            </td>
        </tr>
     <tr>
         <td>
             <div id="DivCardReader">
             <fieldset dir="rtl" class="fieldsetStyle" align="middle">
                 <legend class="legendStyle">انتخاب کارتخوان</legend>
                 <div>
                     کارتخوان :
                     <img alt='کارتخوان' src='/FrmPresentation/App_Utility/Images/Icons/select.png' style='cursor: pointer'
                         onclick='OnClickBtnSelectCardReader()' />
                     <asp:Label runat="server" ID="lblCardReader" class="TxtControls"  ></asp:Label>
                 </div>
             </fieldset>
            </div>
         </td>
     </tr>
        <tr>
            <td align="center">
                <div style="width: 600px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtSDate" runat="server" />
                            <asp:HiddenField ID="txtEDate" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtFilter" runat="server" />
                            <div align="center" style="scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                scrollbar-base-color: #B1D3FF; height: 550px;">
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                </div>   
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtID" name="txtID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtCodeID" runat="server" />
                    <input type="text" id="txtMainCategoryID" runat="server" />
                    <input type="text" id="txtCodeSearch" name="txtCodeSearch" runat="server" />
                    <input type="text" id="txtCodeNameSearch" name="txtCodeNameSearch" runat="server" />
                    <input type="text" id="txtCodeStatusSearch" name="txtCodeStatusSearch" runat="server" />
                    <input type="text" id="txtCodeGroupType" name="txtCodeGroupType" runat="server" />
                    <input type="text" id="txtMenuPage" name="txtMenuPage" runat="server" />
                    <input type="text" id="txtRegInOutPic" name="txtRegInOutPic" runat="server" />
                     <input type="text" id="txtXmlCardReader" name="txtXmlCardReader" runat="server" />
                </div>
            </td>
        </tr>
    </table>
  
  
 <script type="text/javascript" language="javascript">
     //*******************************************************************************************
     var oInterval = "";
     var Counter = 0;
     var TimeCount = 0
     var LastSelectedRow = null;
     var LastSelectedRowClass = "";
     fnStartInterval();
     function fnStartInterval() {
         if (oInterval == "")
                      oInterval = window.setInterval("fnRecycle()", 9000)
         else {
             fnStopInterval()
         }
     }
     function fnStopInterval() {
         if (oInterval != "") {
             window.clearInterval(oInterval);
             resetVariable()
         }
     }
     function fnRecycle() {
         $get(MasterObj + "txtSubmit").value = "Filter";
         $get(MasterObj + "BtnSubmit").click();

     }
     function resetVariable() {
         oInterval = "";
         Counter = 0;
         TimeCount = 0
     }
     //*******************************************************************************************
     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     //document.body.scroll = "no";
     function BeginRequestHandler(sender, args) {
     }
     //====================================================================================
     function EndRequestHandler(sender, args) {
         if ($get(MasterObj + "txtSubmit").value == "FilterCard") {
             fnStartInterval();
         }
         var StrVal = $get(MasterObj + "txtSubmit").value
         $get(MasterObj + "txtSubmit").value = "";
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickGrd(SelectedRow) {
         if (LastSelectedRow != null) {
             LastSelectedRow.className = LastSelectedRowClass;
         }
         LastSelectedRowClass = SelectedRow.className;
         LastSelectedRow = SelectedRow;
         SelectedRow.className = "CssSelectedItemStyle";
     }
    
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnIn() {
         var strUrl = "InOutReson.aspx?Flag=In"
         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:350px;center: Yes;help: no;status: no;scroll:no')

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnExit() {
         var strUrl = "InOutReson.aspx?Flag=Out"
         strUrl = encodeURI(strUrl)
         var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth:350px;center: Yes;help: no;status: no;scroll:no')

     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSelectCardReader() {
         var DialogProperty = "dialogHeight:450px;dialogWidth:400px;center: Yes;help: no;status: no;resizable=1";

         var url = "/FrmPresentation/App_Pages/BaseInfo/CardReader/Select CardReader.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
         + "&CardReader=" + $get(MasterObj + "txtXmlCardReader").value
         returnValue = window.showModalDialog(encodeURI(url), "", DialogProperty);
         if (returnValue != undefined) {
             $get(MasterObj + "txtXmlCardReader").value = returnValue

             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(returnValue);

             var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[Chk=1]");
             var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/Root/Tb[Chk=0]");
             if (oXmlNodes.length > 0) {
                 $get(MasterObj + "lblCardReader").innerText = "";

                 for (var i = 0; i < oXmlNodes.length; i++) {
                     if ($get(MasterObj + "lblCardReader").innerText == "")
                         $get(MasterObj + "lblCardReader").innerText = oXmlNodes[i].selectSingleNode("CardReaderNo").text
                     else
                         $get(MasterObj + "lblCardReader").innerText += "," + oXmlNodes[i].selectSingleNode("CardReaderNo").text;
                 }
             }
             if (oXmlNodes.length == 0 && oXmlNodes1.length > 0) {
                 $get(MasterObj + "lblCardReader").innerText = "";
             }
             $get(MasterObj + "txtFilter").value = $get(MasterObj + "lblCardReader").innerText;
             window.clearInterval(oInterval);
             resetVariable()
             $get(MasterObj + "txtSubmit").value = "FilterCard";
             $get(MasterObj + "BtnSubmit").click();
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickImgFlow(obj) {
         var oRow = window.event.srcElement.parentElement
         while (oRow.tagName != "TR")
             oRow = oRow.parentElement

         var CreditID = oRow.getAttribute('CreditID')

         var WFDocId = oRow.getAttribute('WFDocIdType')

         window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID=" + WFDocId + "&DocID=" + CreditID, "", "dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")
     }

      </script>

</asp:Content>

