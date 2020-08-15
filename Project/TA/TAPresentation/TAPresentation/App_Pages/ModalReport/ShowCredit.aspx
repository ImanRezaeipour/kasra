<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCredit.aspx.cs" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    Inherits="TAPresentation.App_Pages.ModalReport.ShowCredit" ValidateRequest="false" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

    

    <div scroll="yes">
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

                
                if (StrVal == "ImgRefreshPerson") {
                    document.getElementById('ImgRefreshPerson').disabled = true;
                    document.getElementById('MaskedDiv').style.display = 'none';
                    document.getElementById('ModalPopupDiv').style.display = 'none';
                }
                else if (StrVal == "BindCmbSecondCode") {
                    $get(MasterObj + 'CmbSecondCode').disabled = false;
                    //$get(MasterObj + 'selPerson').disabled = false;

                    if ($get(MasterObj + 'CmbFirstCode').value != "0") {
                        OnChangeCmbFirstCode();
                    }
                }

                $get(MasterObj + "txtSubmit").value = "";

            }

        </script>

        
                <table style="width: 600px">
                    <tr>
                        <td id="MsgTD" valign="top" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%" align="center">
                                <tr>
                                    <td align="right" width="95px">
                                        شماره پرسنلی :
                                    </td>
                                    <td>
                                        <input id="txtPersonCode" runat="server" name="txtPersonCode" onblur="OnBlurtxtGrdPersonCode()"
                                            style="width: 100px" type="text" class="TxtControls" />
                                    </td>
                                    <td align="right" width="115px">
                                        نام و نام خانوادگی :
                                    </td>
                                    <td>
                                        <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>--%>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                           
                                            <ContentTemplate>
                                                <input id="txtGrdPersonName" runat="server" name="txtGrdPersonName" style="width: 100px"
                                                    type="text" class="TxtControls" />
                                                <input id="btnRefreshGrdPerson" name="btnRefreshGrdPerson" onclick="onClickBtnRefreshGrdPerson(this)"
                                                    style="width: 25px; cursor: pointer; height: 22px;" type="button" value="..." class="HeaderStyle"/>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        
                                        <%--</ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        از تاريخ :
                                    </td>
                                    <td>
                                        <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td align="right">
                                        تا تاريخ :
                                    </td>
                                    <td>
                                        <uc2:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        مجوز :
                                    </td>
                                    <td>
                                        <select style="width: 100px" id="CmbGrdGroupCode" runat="server" name="CmbGrdGroupCode" class="TxtControls"
                                            onchange="OnChangeCmbGrdGroupCode()">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td align="right">
                                        نوع :
                                    </td>
                                    <td>
                                        <select style="width: 100px" id="CmbGrdSecondCode" runat="server"  class="TxtControls" name="CmbGrdSecondCode" onclick="return CmbGrdSecondCode_onclick()">
                                            <option></option>
                                        </select>
                                        <div style="display: none">
                                            <asp:HiddenField ID="txtXMLSC" runat="server" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <uc1:ToolBar ID="OToolBar" PageName="ShowCredit.aspx" runat="server" PageID="1307" />
                        </td>
                    </tr>
                    
                </table>
                <table>
                
                <tr>
                        <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div id="Div1" runat="server" style="width: 100%; scrollbar-hightlight-color: white; overflow: auto;
                                    scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF; height: 400px" align="center">
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        </td>
                    </tr>
                
                </table>
            
    </div>
    
    <div style="display: none">
        <input id="txtMenuItemID" name="txtMenuItemID" runat="server">
        <input id="txtFlagAccess" name="txtFlagAccess" runat="server">
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <asp:HiddenField ID="txtXmlAllPersonelName" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtXmlCodeGroup" name="txtXmlCodeGroup" runat="server" />
        <input type="text" id="txtCodeGroupAcronym" name="txtCodeGroupAcronym" runat="server" />
        <asp:HiddenField ID="txtXMLGrdSC" runat="server" />
        <input type="text" id="SDate" runat="server" />
        <input type="text" id="EDate" runat="server" />
        <input type="text" id="txtCodeid" runat="server" />
        <input type="text" id="txtCode" runat="server" />
        <input type="text" id="txtSortExpression" name="txtSortExpression" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <%--<asp:Button ID="ImgRefreshPersonSubmit" runat="server" Text="ImgRefreshPersonSubmit"
            OnClick="ImgRefreshPersonSubmit_Click" />--%>
        <%--<asp:Button ID="BtnSubmitcmb" runat="server" OnClick="BtnSubmitcmb_Click" />--%>
    </div>

    <script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">

        //***********************************************************
        ////------------------------
        window.name = "ShowCredit"
        aspnetForm.target = "ShowCredit"
        var lastGrdPersonCode = $get(MasterObj + "txtPersonCode").value;        
        $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "SDate").value.substr(8, 2);
        $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "SDate").value.substr(5, 2);
        $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "SDate").value.substr(0, 4);

        $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "EDate").value.substr(8, 2);
        $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "EDate").value.substr(5, 2);
        $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "EDate").value.substr(0, 4);
        //-----------------------PageLoad-----------------------
        
        var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXmlCodeGroup").value);
            
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CGA='"+$get(MasterObj + "txtCodeGroupAcronym").value+"']");                        
            if (xmlNodes.length != 0) {
                $get(MasterObj + "CmbGrdGroupCode").value = xmlNodes.item(0).selectSingleNode('Val').text
            }
            OnChangeCmbGrdGroupCode();
            $get(MasterObj + "CmbGrdSecondCode").value = $get(MasterObj + "txtCode").value;
        ///-------------------------------------
        //***********************************************************
        function onClickBtnRefreshGrdPerson(obj) {

            //alert($get(MasterObj + "txtSessionID").value)
            var URL = "/Ta/TAPeresentation/Pages/Person/PersonTab.aspx?flag=" + "Report" + " &TypeAccess=" + $get(MasterObj + "txtFlagAccess").value + " &MenuItemID=" + $get(MasterObj + "txtMenuItemID").value + " &SessionID=" + $get(MasterObj + "txtSessionID").value;
            var Result = "";
            Result = window.showModalDialog(URL, "", "dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no");

            if (Result != "") {
                var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                xmlDoc.loadXML(Result);
                xmlDoc.setProperty("SelectionLanguage", "XPath");
                var xmlNodes;
                xmlNodes = xmlDoc.documentElement.selectNodes("/UserEntity/Person");
                if (xmlNodes.length != 0) {
                    var PCode;
                    PCode = xmlNodes.item(0).selectSingleNode('PersonID').text
                    $get(MasterObj + "txtPersonCode").value = PCode;
                    $get(MasterObj + "txtGrdPersonName").value = xmlNodes.item(0).selectSingleNode('Family').text
                }
            }
        }
        //*******************************************************************************        
        function OnBlurtxtGrdPersonCode() {

            if ($get(MasterObj + "txtPersonCode").value == "") {
                $get(MasterObj + "txtGrdPersonName").value = "";
                lastGrdPersonCode = "";

            }
            else {
                
                if ($get(MasterObj + "txtPersonCode").value != lastGrdPersonCode) {
                
                    lastGrdPersonCode = $get(MasterObj + "txtPersonCode").value
                    $get(MasterObj + "txtSubmit").value = "GetName";
                    $get(MasterObj + "BtnSubmit").click();
                    //var PersonName = GetPersonelName($get(MasterObj + "txtPersonCode").value)
                    


                }
            }
        }
        //*******************************************************************************
        function GetPersonelName(PersonCode) {
            //alert(PersonCode)
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXMLAllPersonelName').value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/DataEntryEntity/AllPersonelName[PersonCode=' + PersonCode + ']')

            if (xmlNodes.length != 0) {
                return (xmlNodes.item(0).selectSingleNode('PersonName').text)
            }
            else
                return ''
        }
        //**********************************************/
        function OnChangeCmbGrdGroupCode() {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXmlCodeGroup").value);
            
            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[Val=" + $get(MasterObj + "CmbGrdGroupCode").value + "]");           
            
            if (xmlNodes.length != 0) {
                $get(MasterObj + "txtCodeGroupAcronym").value = xmlNodes.item(0).selectSingleNode('CGA').text
            }
            
            lastGrdGroupCodeID = $get(MasterObj + "CmbGrdGroupCode").value

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML($get(MasterObj + "txtXMLGrdSC").value);
            var xmlNodes;
            //alert($get(MasterObj + "txtXMLGrdSC").value)
            $get(MasterObj + "CmbGrdSecondCode").innerHTML = ""

            var j = 0
            if ($get(MasterObj + "CmbGrdGroupCode").value != 0 && $get(MasterObj + "CmbGrdGroupCode").value != "") {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbGrdGroupCode").value + "]");


            }
            else {
                xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
            }

           
            if (xmlNodes.length != 0) {
                if ($get(MasterObj + "CmbGrdGroupCode").value != 0) {
                    if (j == 0) {

                        optionEl = document.createElement("OPTION")
                        $get(MasterObj + "CmbGrdSecondCode").options.add(optionEl)
                        $get(MasterObj + "CmbGrdSecondCode").all(j).innerText = 'انتخاب نشده'
                        $get(MasterObj + "CmbGrdSecondCode").all(j).value = '0'
                        j++
                    }
                }
                for (var i = 0; i < xmlNodes.length; ++i) {

                    optionEl = document.createElement("OPTION")
                    $get(MasterObj + "CmbGrdSecondCode").options.add(optionEl)
                    $get(MasterObj + "CmbGrdSecondCode").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                    $get(MasterObj + "CmbGrdSecondCode").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                    j++
                }
            }
            else {
                optionEl = document.createElement("OPTION")
                $get(MasterObj + "CmbGrdSecondCode").options.add(optionEl)
                $get(MasterObj + "CmbGrdSecondCode").all(j).innerText = 'انتخاب نشده'
                $get(MasterObj + "CmbGrdSecondCode").all(j).value = '0'
            }
            //}

    
        }
        /***********************************************/
        function OnClickBtnCancel() {
            window.close()
        }
        //*******************************************************************************
        function OnClickBtnFilter() {
            $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
            $get(MasterObj + "txtSubmit").value = "Filter";
            if (CompareTime())
                $get(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function CompareTime() {
            try {
                var ED = document.getElementById(MasterObj + "KCalEDate_txtYear").value + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + document.getElementById(MasterObj + "KCalEDate_txtDay").value
                var SD = document.getElementById(MasterObj + "KCalSDate_txtYear").value + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + document.getElementById(MasterObj + "KCalSDate_txtDay").value
                if (ED < SD) {
                    alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                    return false
                }
                else {
                    return true
                }
            }
            catch (e) {
                alert('اطلاعات نادرست است')
            }
        }        
        //*******************************************************************************
        function OnChangeCmbFirstCode() {
            var last = $get(MasterObj + 'CmbSecondCode').value
            if ($get(MasterObj + 'txtXMLSC').value != "" &
                ($get(MasterObj + 'txtPersonCode').value != "" | $get(MasterObj + 'txtPersonCode').value != "0")) {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLSC').value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [BaseCodeID=' + $get(MasterObj + 'CmbFirstCode').value + ']')
                LoadSecondCodeData($get(MasterObj + 'CmbSecondCode'), xmlNodes);
            }
            $get(MasterObj + 'CmbSecondCode').value = last
            if ($get(MasterObj + 'CmbSecondCode').value == "")
                $get(MasterObj + 'CmbSecondCode').value = "0"
        }
        //*******************************************************************************
        function LoadSecondCodeData(CmbObj, oXmlNodes) {
            CmbObj.innerHTML = "";
            var optionEl = document.createElement("OPTION");
            CmbObj.options.add(optionEl);
            CmbObj.all(0).value = "0";
            CmbObj.all(0).innerText = 'انتخاب نشده';

            if (oXmlNodes.length != 0)
                for (var i = 0; i < oXmlNodes.length; i++) {
                var optionEl = document.createElement("OPTION");
                CmbObj.options.add(optionEl);
                CmbObj.all(i + 1).value = oXmlNodes.item(i).selectSingleNode("Val").text;
                CmbObj.all(i + 1).innerText = oXmlNodes.item(i).selectSingleNode("Title").text;
            }
        }
        //*******************************************************************************

        function CmbGrdSecondCode_onclick() {

        }

    </script>

</asp:Content>
