<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DateSetting.aspx.cs" Inherits="FrmPresentation.App_Pages.Setting.DateSetting"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td id="Td2" style="height: 71px" align="center" runat="server" >
                <table >
                    <tr>
                        <td colspan="5">
                            <uc2:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    <td>
                    <table class="DivStyle" align="center" >
                    <tr>
                        <td>
                        </td>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="SDate"  runat="server"  />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc3:KCalendar ID="EDate"  runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                             از دوره :
                        </td>
                        <td>
                            <div align="right">
                               <select id="CmbFromPeriod" runat="server" class="TxtControls" onchange="onchangeCmbFromPeriod()"
                                style="width: 116px" >
                                <option></option>
                            </select>
 
                            </div>

                        </td>
                        <td>
                            تا دوره :
                        </td>
                        <td>
                            <div align="right">
                                <select id="CmbToPeriod" runat="server" class="TxtControls" onchange="onchangeCmbToPeriod()"
                                style="width: 116px" >
                                <option></option>
                            </select> 

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="rdbMonthDefault"  type="checkbox" onclick="onclickrdbMonthDefault()" />
                        </td>
                        <td>
                            دوره و ماه جاري 
                        </td>
                    </tr>
                   </table>
                   </td>
                   </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {

                    }

                    function EndRequestHandler(sender, args) {

                        if ($get(MasterObj + "txtAlert").value != "") {
                            if ($get(MasterObj + "txtValidate").value == "1") {
                                SaveFlag = 1;
                                window.returnValue = SaveFlag;
                                SetMsg($get(MasterObj + "txtAlert").value);

                            }
                            else {

                                alert($get(MasterObj + "txtAlert").value);
                            }
                        }

                        document.getElementById(MasterObj + "txtsubmit").value = ""
                        document.getElementById(MasterObj + "txtAlert").value = ""
                    }
                  
                </script>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtXML" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td valign="middle" align="center" style="display: none">
                <input type="text" id="txtSubmit" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                <input id="txtSDate" type="text" name="txtSDate" runat="server" />
                <input id="txtEDate" type="text" name="txtEDate" runat="server" />
                <input id="txtOnLineUser" type="text" runat="server" />
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                <cc1:MySecurity ID="OnLineUser" runat="server">
                </cc1:MySecurity>
                <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
                 <input type="text" id="txtXMLDateSeting" name="txtXMLDateSeting" runat="server" />
                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
            </td>
        </tr>
    </table>
    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //=========================load ========================================

                       
        if ($get(MasterObj + "txtXMLDateSeting").value != "<GeneralEntity></DateSetingDescription>" || $get(MasterObj + "txtXMLDateSeting").value != "<GeneralEntity/>") {
            var str = $get(MasterObj + "txtXMLDateSeting").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(str)
            var XmlNode = oXmlDoc.documentElement.selectNodes("/GeneralEntity/DateSetingDescription");
            if (XmlNode.length != 0) {
                document.getElementById(MasterObj + "SDate_txtYear").value = XmlNode.item(0).selectSingleNode("StartDate").text.substr(0, 4)
                document.getElementById(MasterObj + "SDate_txtMonth").value = XmlNode.item(0).selectSingleNode("StartDate").text.substr(5, 2)
                document.getElementById(MasterObj + "SDate_txtDay").value = XmlNode.item(0).selectSingleNode("StartDate").text.substr(8, 2)
                $get(MasterObj + "SDate_txtCalendar").value = $get(MasterObj + "SDate_txtDay").value + "/" + $get(MasterObj + "SDate_txtMonth").value + "/" + $get(MasterObj + "SDate_txtYear").value
                $get(MasterObj + "SDate_txtCalendar").value = $get(MasterObj + "SDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "SDate_txtDay").value + "/" + $get(MasterObj + "SDate_txtMonth").value + "/" + $get(MasterObj + "SDate_txtYear").value)
                document.getElementById(MasterObj + "EDate_txtYear").value = XmlNode.item(0).selectSingleNode("EndDate").text.substr(0, 4)
                document.getElementById(MasterObj + "EDate_txtMonth").value = XmlNode.item(0).selectSingleNode("EndDate").text.substr(5, 2)
                document.getElementById(MasterObj + "EDate_txtDay").value = XmlNode.item(0).selectSingleNode("EndDate").text.substr(8, 2)
                $get(MasterObj + "EDate_txtCalendar").value = $get(MasterObj + "EDate_txtDay").value + "/" + $get(MasterObj + "EDate_txtMonth").value + "/" + $get(MasterObj + "EDate_txtYear").value
                $get(MasterObj + "EDate_txtCalendar").value = $get(MasterObj + "EDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "EDate_txtDay").value + "/" + $get(MasterObj + "EDate_txtMonth").value + "/" + $get(MasterObj + "EDate_txtYear").value)
                $get(MasterObj + "CmbFromPeriod").value = XmlNode.item(0).selectSingleNode("FromPriod").text.toString();
                $get(MasterObj + "CmbToPeriod").value = XmlNode.item(0).selectSingleNode("ToPriod").text.toString();

            }
            else if (XmlNode.length == 0) {
                document.getElementById("rdbMonthDefault").checked="True"
            }
            
        }
        

            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            function onclickrdbMonthDefault() {
                if (document.getElementById("rdbMonthDefault").checked) {
                    document.getElementById(MasterObj + "EDate_txtDay").value = ""
                    document.getElementById(MasterObj + "EDate_txtMonth").value = ""
                    document.getElementById(MasterObj + "EDate_txtYear").value = ""
                    document.getElementById(MasterObj + "SDate_txtDay").value = ""
                    document.getElementById(MasterObj + "SDate_txtMonth").value = ""
                    document.getElementById(MasterObj + "SDate_txtYear").value = ""
                    $get(MasterObj + "SDate_txtCalendar").value = ""
                    $get(MasterObj + "EDate_txtCalendar").value = ""
                    document.getElementById(MasterObj + "CmbFromPeriod").value = "0"
                    document.getElementById(MasterObj + "CmbToPeriod").value = "0"
                }
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function CheckNotEmpty() {
                EDate = document.getElementById(MasterObj + "EDate_txtYear").value + "/" + document.getElementById(MasterObj + "EDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EDate_txtDay").value
                SDate = document.getElementById(MasterObj + "SDate_txtYear").value + "/" + document.getElementById(MasterObj + "SDate_txtMonth").value + "/" + document.getElementById(MasterObj + "SDate_txtDay").value
                if (document.getElementById(MasterObj + "SDate_txtYear").value == "") {
                    alert("لطفا  تاریخ شروع را انتخاب کنيد")
                    return false
                }

                else if (document.getElementById(MasterObj + "EDate_txtYear").value == "") {
                    alert("لطفا  تاریخ خاتمه را انتخاب کنيد")

                    return false
                }
                else if (SDate > EDate) {
                    alert("تاريخ شروع بزرگتر از تاریخ پايان است")
                    return false;
                }
                else if (document.getElementById(MasterObj + "CmbFromPeriod").value == 0) {
                    alert("لطفا  دوره آغاز را انتخاب کنيد")
                    return false
                }
                else if (document.getElementById(MasterObj + "CmbToPeriod").value == 0) {
                    alert("لطفا  دوره پایان را انتخاب کنيد")
                    return false
                }

                else if (parseInt(document.getElementById(MasterObj + "CmbFromPeriod").value) > parseInt(document.getElementById(MasterObj + "CmbToPeriod").value)) {
                    alert(" دوره آغاز از دوره پایان بزرگتر است ")
                    return false
                }

                return true
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            function OnClickBtnSave() {
                
                if (document.getElementById("rdbMonthDefault").checked == true && document.getElementById(MasterObj + "SDate_txtYear").value != "") {
                    alert(" لطفا فقط تیک  یا موارد زیر را وارد کنید")
                    return;
                }
                
                if (document.getElementById("rdbMonthDefault").checked) {
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                    return;
                }
                
                if (CheckNotEmpty() == false)
                    return;

                   var oSDate = "", OEDate = "", OFromPriod = "", OToPriod = ""
                    OEDate = document.getElementById(MasterObj + "EDate_txtYear").value + "/" + document.getElementById(MasterObj + "EDate_txtMonth").value + "/" + document.getElementById(MasterObj + "EDate_txtDay").value
                    oSDate = document.getElementById(MasterObj + "SDate_txtYear").value + "/" + document.getElementById(MasterObj + "SDate_txtMonth").value + "/" + document.getElementById(MasterObj + "SDate_txtDay").value
                    OFromPriod = document.getElementById(MasterObj + "CmbFromPeriod").value
                    OToPriod = document.getElementById(MasterObj + "CmbToPeriod").value
                    var StrXml = "";
                    StrXml += "<DateSetting>";
                    StrXml += "<PersonId>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</PersonId>"
                    StrXml += "<StartDate>" + oSDate + "</StartDate>"
                    StrXml += "<EndDate>" + OEDate + "</EndDate>"
                    StrXml += "<FromPriod>" + OFromPriod + "</FromPriod>"
                    StrXml += "<ToPriod>" + OToPriod + "</ToPriod>"
                    StrXml += "<SubsysID>" + document.getElementById(MasterObj + "txtSystemID").value + "</SubsysID>"
                    StrXml += "</DateSetting>"
                    document.getElementById(MasterObj + "txtXML").value = "<GeneralEntity>" + StrXml + "</GeneralEntity>"
                    document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                    document.getElementById(MasterObj + "BtnSubmit").click();
               
            }

            //============================== onchangeCmbFromPeriod================================

            function onchangeCmbFromPeriod() {
                document.getElementById("rdbMonthDefault").checked = false
            }
            //============================== onchangeCmbToPeriod=================================
            function onchangeCmbToPeriod() {
                document.getElementById("rdbMonthDefault").checked = false
            }
            //===============================================================
    </script>
</asp:Content>
