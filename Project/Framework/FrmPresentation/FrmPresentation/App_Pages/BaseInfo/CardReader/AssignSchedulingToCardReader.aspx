<%@ Page Title="---------------------------------------انتساب زمانبندي به کارتخوان--------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="AssignSchedulingToCardReader.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.AssignSchedulingToCardReader" ValidateRequest ="false" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        .cssInsertSelectChk
        {
            background-color: #96CFAD;
        }
        .cssDeleteSelectChk
        {
            background-color: #FFAAAA;
        }
</style>        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        window.document.title = "انتساب زمانبندی به کارتخوان"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {
        
            
            LastSelectedRow = null;
            strCrdReader = "<root></root>";
            $get(MasterObj + "txtXmlStr").value = ""
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "") {
                SaveFlag = 1;
                SetMsg($get(MasterObj + "txtAlert").value);
            }

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            
            
            
        }
    </script>
    <table>
    <tr>
    <td></td>
    </tr>
    <tr>
            <td colspan="6" align="center" >
                
                <uc1:ToolBar ID="OToolBar" runat="server" />
                
            </td>
        </tr>
         <tr>
            <td colspan="6" align ="center" >
                <table>
                    <tr>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                   
                                    <asp:HiddenField ID="txtAlert" runat="server" /> 
                                    <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 550px;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 450px; margin-right: 0px;">                                   
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    </div>
                                    
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div style="display: none">
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <input type="text" id="txtXmlStr" name="txtXmlStr" runat="server" />
                                <input type="text" id="txtSchedulingID" name="txtSchedulingID" runat="server" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                    runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                            </div>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strCrdReader = "<root></root>";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var SaveFlag = 0;
        var OGrid = $get("GrdCrdReaderActiveForSchduling");
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
            window.returnValue = SaveFlag;
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
//        function OnClickBtnNew() {            
//            for (var i = 1; i < OGrid.rows.length; i++) {                
//                if (OGrid.rows(i).cells(0).firstChild.checked == true)
//                    OGrid.rows(i).cells(0).firstChild.checked = false;
//            }
//        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {

            $get(MasterObj + "txtXmlStr").value = strCrdReader
            
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickCrdReaderCHK(Obj) {
            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strCrdReader);

            var oXml = new ActiveXObject("Microsoft.XMLDOM");
            oXml.async = "false";
            oXml.loadXML("<root/>");

            var oXmlNodes = oXmlDoc.documentElement.selectSingleNode("CrdReaderGroup[CardReaderGroupID=" + Obj.parentNode.parentNode.getAttribute("CardReaderGroupID") + "]");

            if (Obj.checked == true) {

                if (oXmlNodes == null) {
                   
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";

                    oXml.loadXML("<root><CrdReaderGroup><CardReaderGroupID>" + Obj.parentNode.parentNode.getAttribute("CardReaderGroupID") + "</CardReaderGroupID><SchedulingID>" + $get(MasterObj + "txtSchedulingID").value + "</SchedulingID><State>1</State></CrdReaderGroup></root>");

                    var XmlNode = oXml.documentElement.selectNodes("CrdReaderGroup[CardReaderGroupID=" + Obj.parentNode.parentNode.getAttribute("CardReaderGroupID") + "]");

                    oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));

                    Obj.className = "cssInsertSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }

            }
            else {

                if (oXmlNodes == null) {
                    var oXml = new ActiveXObject("Microsoft.XMLDOM");
                    oXml.async = "false";
                    oXml.loadXML("<root><CrdReaderGroup><CardReaderGroupID>" + Obj.parentNode.parentNode.getAttribute("CardReaderGroupID") + "</CardReaderGroupID><SchedulingID> " + $get(MasterObj + "txtSchedulingID").value + "</SchedulingID><State>0</State></CrdReaderGroup></root>");
                    var XmlNode = oXml.documentElement.selectSingleNode("CrdReaderGroup[CardReaderGroupID=" + Obj.parentNode.parentNode.getAttribute("CardReaderGroupID") + "]");
                    oXmlDoc.childNodes[0].appendChild(XmlNode);
                    Obj.className = "cssDeleteSelectChk";
                }
                else {
                    oXmlDoc.childNodes[0].removeChild(oXmlNodes);
                    Obj.className = "";
                }
            }
            strCrdReader = oXmlDoc.xml;

          
        }
        //======------------------------
    </script>
    
</asp:Content>
