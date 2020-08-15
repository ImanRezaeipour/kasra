<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ScriptInstanceNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptInstanceNew" validateRequest=false  %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc2" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="tabStyle.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .BtnOk13
        {
            width: 120px;
            height: 29px;
            background-repeat: no-repeat;
            background-color: transparent;
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            border-left: lightsteelblue 2px solid;
            border-bottom: #346fa4 2px solid;
            cursor: hand;
            background-image: url('/FrmPresentation/App_Utility/Images/Icons/G1.png');
            font-family: Kasra Traffic Normal,Kasratahoma;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
        //        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //        function BeginRequestHandler(sender, args) {
        //        }
        function EndRequestHandler(sender, args) {
            var StrVal = document.getElementById(MasterObj + "txtSubmit").value
            if (document.getElementById(MasterObj + "txtAlert").value != "")
                SetMsg(document.getElementById(MasterObj + "txtAlert").value);
            if (StrVal == "changcmbScriptName") {
                BindHeader();
            }
            document.getElementById(MasterObj + "txtSubmit").value = "";
            document.getElementById(MasterObj + "txtAlert").value = "";
        }
    </script>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table with="900">
                    <tr>
                        <td align="left">
                            نام نمونه
                        </td>
                        <td>
                            <input type="text" id="txtScriptInstance" runat="server" width="200px" class="TxtControls" />
                        </td>
                        <td align="left">
                            نام قانون
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbScriptName" onchange="onchangecmbScriptName()" runat="server"
                                Height="16px" Width="200px" value="0" CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 65px">
                            تاريخ شروع
                        </td>
                        <td align="right" style="width: 170px">
                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td style="width: 60px">
                            تاريخ پايان
                        </td>
                        <td style="width: 170px">
                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            مرحله اجرا
                        </td>
                        <td width="250">
                            <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="200px" value="0"
                                CssClass="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td valign="top">
                            اولويت
                        </td>
                        <td valign="top">
                            <input type="text" id="txtPriority" style="width: 40px" onkeydown="OnKeyDownNum('integer',this.value)"
                                runat="server" class="TxtControls" />
                            <input id="BtnShowActive" name="BtnShowActive" class="HeaderStyle" onclick="onClickBtnShowActive()"
                                style="width: 25px; cursor: hand; height: 22px;" type="button" value="..." />
                            <input type="radio" id="rdbActive" runat="server" checked name="Active" />فعال
                            <input type="radio" id="rdbNoActive" runat="server" name="Active" />غير فعال
                        </td>
                    </tr>
                    <tr >
                        <td colspan=4>
                            <table>
                                <tr>
                                    <td valign="top">
                                        شروط
                                    </td>
                                    <td>
                                        <textarea id="txtCondition" onkeydown="onkeydownCondition()" runat="server" class="TxtControls" style="width: 690px; height: 30px"></textarea>
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
                <table>
                    <tr>
                        <td>
                            <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="tabData.xml"
                                DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                                DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1" ImagesBaseUrl="images/"
                                MultiPageId="MultiPage1" runat="server">
                                <ItemLooks>
                                    <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover"
                                        LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="4"
                                        LeftIconWidth="3" LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                    <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10"
                                        LabelPaddingRight="10" LabelPaddingTop="4" LabelPaddingBottom="4" LeftIconWidth="3"
                                        LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                        <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10"
                                        LabelPaddingRight="10" LabelPaddingTop="4" LabelPaddingBottom="4" LeftIconWidth="3"
                                        LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                </ItemLooks>
                            </ComponentArt:TabStrip>
                            <ComponentArt:MultiPage ID="MultiPage1" CssClass="MultiPage" runat="server">
                                <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                                    <div style="height: 230px; overflow: auto; scrollbar-highlight-color: white; overflow: auto;
                                        width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                        <table id="ScriptParameter_Header">
                                            <tr>
                                                <td style="width: 200px" align="center" class="CssHolidayStyle">
                                                    پارامتر
                                                </td>
                                                <%--<td style="width: 160px" align="center" class="CssHolidayStyle">
                                                    پيشفرض
                                                </td>--%>
                                                <td style="width: 120px" align="center" class="CssHolidayStyle">
                                                    مقدار
                                                </td>
                                            </tr>
                                        </table>
                                        <table id="ScriptParameter">
                                        </table>
                                    </div>
                                </ComponentArt:PageView>
                                <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                                    <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                                        <tr>
                                            <td valign="top">
                                                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                                    <tr>
                                                        <td style="width: 22px" align="center">
                                                            <input id="chkAllPK" onclick='OnClickchkAllPK(this)' type="checkbox" runat="server" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                کليه پرسنل
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 22px" align="center">
                                                            <input id="chkEPK" runat="server" onclick='OnClickchkEPK(this)' type="checkbox" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                پرسنل زير مجموعه
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="TDD">
                                                        <td style="width: 22px" align="center">
                                                            <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td style="width: 160px">
                                                            <div align="right">
                                                                واحد سازماني
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="TDG">
                                                        <td style="width: 22px" align="center">
                                                            <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                گروه خاص
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="TDP">
                                                        <td style="width: 22px" align="center">
                                                            <input id="rdbPerson" runat="server" name="GroupChk" type="radio"  />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                پرسنل خاص
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <input id="Button4" type="button" class="BtnOk13" onclick="OnClickBtnSelectScriptGroups()"
                                                                value="انتخاب اعضا " />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="height: 319px" valign="top" align="center">
                                                <table id="ScriptGroups_Header" style="width: 375px;">
                                                    <tr>
                                                        <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                            <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                                type="checkbox" name="chkAll">
                                                        </td>
                                                        <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                            شماره
                                                        </td>
                                                        <td align="center" class="CssHeaderStyle" style="width: 250px">
                                                            نام
                                                        </td>
                                                        <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                            نوع
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div style="width: 390px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                                    <table align="center" id="ScriptGroups" style="width: 375px;">
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ComponentArt:PageView>
                                <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                                    <table id="Table3" cellspacing="0" cellpadding="0" align="center" border="0">
                                        <tr>
                                    <td valign="top" >
                                    
                                        <table id="Table4" cellspacing="1" cellpadding="1" border="0">
                                            <tr >
                                                <td style="width: 22px" align="center">
                                                    <input id="chkAllPK1" onclick='OnClickchkAllPK(this)' type="checkbox" runat="server"  />
                                                </td><td></td>
                                                <td><div align="right">
                                                    کليه پرسنل 
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="chkEPK1" runat="server" onclick='OnClickchkEPK(this)'  type="checkbox" />
                                                </td><td></td>
                                                <td ><div align="right">
                                                    پرسنل زير مجموعه
                                                 </div></td>
                                            </tr>
                                            <tr id="TDD1">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbDepartment1" runat="server" name="GroupChk" type="radio" />
                                                </td><td></td>    
                                                <td style="width: 160px"><div align="right">
                                                   واحد سازماني
                                                 </div></td>
                                            </tr>
                                            <tr id="TDG1">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbGroup1" runat="server" name="GroupChk" type="radio" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    گروه خاص
                                                 </div></td>
                                            </tr>
                                            <tr id="TDP1">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbPerson1" runat="server" name="GroupChk" type="radio"   />
                                                </td><td></td>
                                                <td><div align="right">
                                                    پرسنل خاص
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                        <td colspan="3">
                                                            <input id="Button1" type="button" class="BtnOk13" onclick="OnClickBtnSelectScriptGroups()"
                                                                value="انتخاب اعضا " />
                                                        </td>
                                                    </tr>
                                        </table>
                                    </td>
                                    <td  style="height: 319px" valign="top" align="center">
                                        <table id="ScriptGroups_Header1" style="width: 375px;">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                     <input id="chkAll1" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                    type="checkbox" />
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    شماره
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 250px">
                                                    نام
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    نوع
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="width: 390px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                            <table align="center" id="ScriptGroups1" style="width: 375px;">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                    </table>
                                </ComponentArt:PageView>
                            </ComponentArt:MultiPage>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtXml" runat="server" />
                            <asp:HiddenField ID="txtScriptID" runat="server" />
                            <asp:HiddenField ID="txtXMLHeader" runat="server" />
                            <asp:HiddenField ID="txtAlarm" runat="server" />
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
                <div id="divConditionTemplate">
            <div dir="rtl"  align="center" style=" scrollbar-arrow-color: black; width: 210px; scrollbar-base-color: #b0c4de;
            height:400px; scrollbar-highlight-color: white; overflow: auto; font-family :Kasra Traffic Normal; ">
            <table id="GrdConditionTemplate" style="  border-style:solid;           
                    border-right-color :#6495ed;        
                    border-top-color  :#87cefa;        
                    border-bottom-color :#6495ed;   
                    border-left-color :#87cefa;          
                    background :#e7eeff;
                    font-family :Kasra Traffic Normal;
                    font-weight: bold; 
                    font-size :9pt;  
                    border-width :2px">
                
            </table>
        </div></div>
                    <select id="cmbDefault" class="TxtControls" style="width: 100px">
                        <option value="0">مقدار ثابت</option>
                    </select>
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                         <input type="text" id="txtConditionTemplate" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageID" runat="server" />
                    <input type="text" id="txtUpdateXml" runat="server" />
                    <input type="text" id="txtInstanceID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strChk = ""
        var newrowindex = 0;
        BindPage();
        //        if (document.getElementById(MasterObj + "txtSystem").value == "1")
        //            document.getElementById('OToolBar_BtnSave').style.display = "none";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
            BindHeader();
            if ($get(MasterObj + "txtUpdateXml").value != "") {
                var strXml = $get(MasterObj + "txtUpdateXml").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptInstance");
                if (oXmlNodes.length > 0) {
                    $get(MasterObj + "txtCondition").value = oXmlNodes.item(0).selectSingleNode("Condition").text
                    var Active = oXmlNodes.item(0).selectSingleNode("active").text
                    if (Active == 1)
                        $get(MasterObj + "rdbActive").checked = true
                    else
                        $get(MasterObj + "rdbNoActive").checked = true
                    var SDate = oXmlNodes.item(0).selectSingleNode("StartDate").text
                    if (SDate != "") {
                        $get(MasterObj + "KCalSDate_txtDay").value = SDate.substr(8, 2);
                        $get(MasterObj + "KCalSDate_txtMonth").value = SDate.substr(5, 2);
                        $get(MasterObj + "KCalSDate_txtYear").value = SDate.substr(0, 4);
                        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
                    }
                    else {
                        $get(MasterObj + "KCalSDate_txtDay").value = "01";
                        $get(MasterObj + "KCalSDate_txtMonth").value = "01";
                        $get(MasterObj + "KCalSDate_txtYear").value = "1301";
                        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                        $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                    }
                    var EDate = oXmlNodes.item(0).selectSingleNode("EndDate").text
                    if (EDate != "") {
                        $get(MasterObj + "KCalEDate_txtDay").value = EDate.substr(8, 2);
                        $get(MasterObj + "KCalEDate_txtMonth").value = EDate.substr(5, 2);
                        $get(MasterObj + "KCalEDate_txtYear").value = EDate.substr(0, 4);
                        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                    }
                    else {
                        $get(MasterObj + "KCalEDate_txtDay").value = "29";
                        $get(MasterObj + "KCalEDate_txtMonth").value = "12";
                        $get(MasterObj + "KCalEDate_txtYear").value = "1399";
                        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                        $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                    }
                    $get(MasterObj + "cmbScriptName").value = oXmlNodes.item(0).selectSingleNode("ScriptID").text
                    $get(MasterObj + "cmbStep").value = oXmlNodes.item(0).selectSingleNode("Step").text
                    $get(MasterObj + "txtPriority").value = oXmlNodes.item(0).selectSingleNode("priority").text
                    $get(MasterObj + "txtScriptInstance").value = oXmlNodes.item(0).selectSingleNode("Name").text
                }
                //!!!!!!!!!!
                var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptGroup");
                var MemberID = "", MemberName = "", Type = 0, kind = 0
                for (var i = 0; i < oXmlNodes1.length; i++) {
                    kind = oXmlNodes1.item(i).selectSingleNode("kind").text
                    MemberID = oXmlNodes1.item(i).selectSingleNode("MemberID").text
                    MemberName = oXmlNodes1.item(i).selectSingleNode("MemberName").text
                    Type = oXmlNodes1.item(i).selectSingleNode("Type").text
                    if (oXmlNodes1.item(i).selectSingleNode("Type").text != 0) {
                        addRow(MemberID, MemberName, Type, kind)
                        addXML(MemberID, Type, kind)
                    }
                    else {
                        if (MemberID == "AllPK") {
                            if (kind == 0)
                                $get(MasterObj + "chkAllPK").checked = true
                            else
                                $get(MasterObj + "chkAllPK1").checked = true
                        }
                        else if (MemberID == "EPK") {
                            if (kind == 0)
                                $get(MasterObj + "chkEPK").checked = true
                            else
                                $get(MasterObj + "chkEPK1").checked = true
                        }
                    }
                }
                //!!!!!!!!!!
                var oXmlNodes2 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ParameterValue");
                var oGrid = document.all.item("ScriptParameter")
                for (var i = 0; i < oXmlNodes2.length; i++) {
                    //PValue = oXmlNodes2.item(i).selectSingleNode("Value").text
                    oGrid.rows(i).cells(1).firstChild.value = oXmlNodes2.item(i).selectSingleNode("Value").text
                }
            }
            else {
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
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectScriptGroups() {

            var strOptions = ""
            var url = ""
            var OUserFlag
            var kind = 0
            if (document.getElementById(MasterObj + "rdbPerson").checked) {
                OUserFlag = "U"
                kind = 0
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbGroup").checked) {

                OUserFlag = "G"
                kind = 0
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbDepartment").checked) {

                OUserFlag = "D"
                kind = 0
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbPerson1").checked) {
                OUserFlag = "U"
                kind = 1
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbGroup1").checked) {

                OUserFlag = "G"
                kind = 1
                url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbDepartment1").checked) {

                OUserFlag = "D"
                kind = 1
                url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
            }


            //-------------------------------------------------------
            var OSelectedMamber = "";

            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                url = ""
            }

            if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
                CreateGrid(OSelectedMamber, OUserFlag, kind);
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateGrid(OSelectedMamber, Type, kind) {

            if ((Type == "D"))
                OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length)

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(OSelectedMamber)

            var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")


            if (xmlNodesTemp.length > 0) {
                for (var i = 0; i < xmlNodesTemp.length; i++) {
                    var MemberID, MemberName;
                    switch (Type) {
                        case 'U':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('PID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('PName').text;
                            break

                        case 'G':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                            break

                        case 'D':

                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('DName').text;
                            break

                    }
                    addRow(MemberID, MemberName, Type, kind)

                    addXML(MemberID, Type, kind)
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function addXML(MemberID, Type, kind) {
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + MemberID + " and type='" + Type + "' and kind='" + kind + "']");
            //========================================================
            if (oXmlNodes.length > 0) {
                oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>" + MemberID + "</CodeID>"
                strChk += "<type>" + Type + "</type>"
                strChk += "<kind>" + kind + "</kind>"
                strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function addRow(MemberID, MemberName, type, kind) {
            var oGrid
            if (kind == 0)
                oGrid = ScriptGroups;
            else
                oGrid = ScriptGroups1;
            for (var j = 0; j < oGrid.rows.length; j++) {
                if (oGrid.rows(j).cells(1).innerText == MemberID) {
                    oGrid.rows(j).cells(0).firstChild.checked = true
                    return;
                }
            }
            var oRow = oGrid.insertRow();
            oRow.setAttribute("type", type) //ControlRuleMemberID


            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)'  checked />";
            oCell0.className = "XTabTable";
            oCell0.style.width = "25px"
            oCell0.align = "center"

            var oCell1 = oRow.insertCell();
            oCell1.innerText = MemberID;
            oCell1.style.width = "60px"
            oCell1.align = "center";

            var oCell2 = oRow.insertCell();
            oCell2.innerText = ((MemberName.length > 30) ? MemberName.substring(0, 25) + "..." : MemberName);
            oCell2.title = MemberName;
            oCell2.style.width = "250px"
            oCell2.align = "center";

            var tempSrc = "";
            var picTitle = "";
            switch (type) {
                case "U":
                    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = "پرسنل"
                    break
                case "G":
                    tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "گروه"
                    break
                case "D":
                    tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "واحدسازماني"
                    break
            }
            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
            oCell3.className = "XTabTable";
            oCell3.style.width = "60px"
            oCell3.align = "center"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById('OToolBar_BtnSave').style.display = "inline";
            $get(MasterObj + "txtScriptID").value = "0"
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
            $get(MasterObj + "rdbActive").checked = true
            $get(MasterObj + "txtPriority").value = ""
            $get(MasterObj + "cmbStep").value = 0
            $get(MasterObj + "txtInstanceID").value = "0"
            $get(MasterObj + "txtScriptInstance").value = ""
            $get(MasterObj + "cmbScriptName").value = "0"
            Cleargrd(ScriptGroups)
            Cleargrd(ScriptParameter)
            $get(MasterObj + "chkAllPK").checked = false
            $get(MasterObj + "chkEPK").checked = false
            Cleargrd(ScriptGroups1)
            $get(MasterObj + "chkAllPK1").checked = false
            $get(MasterObj + "chkEPK1").checked = false
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty()) {
                MakeXML()
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
            if ($get(MasterObj + "txtScriptID").value == "")
                $get(MasterObj + "txtScriptID").value = "0"
            var Active = 1
            if (document.getElementById(MasterObj + "rdbNoActive").checked)
                Active = 0
            var XMLStr = "<Tb>"
            XMLStr = XMLStr + "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
            XMLStr = XMLStr + "<ScriptID>" + document.getElementById(MasterObj + "txtScriptID").value + "</ScriptID>"
            XMLStr = XMLStr + "<Condition>" + document.getElementById(MasterObj + "txtCondition").value + "</Condition>"

            XMLStr = XMLStr + "<Step>" + document.getElementById(MasterObj + "cmbStep").value + "</Step>"
            XMLStr = XMLStr + "<SDate>" + SDate + "</SDate>"
            XMLStr = XMLStr + "<EDate>" + EDate + "</EDate>"
            XMLStr = XMLStr + "<Priority>" + $get(MasterObj + "txtPriority").value + "</Priority>"
            XMLStr = XMLStr + "<Active>" + Active + "</Active>"
            XMLStr = XMLStr + "<ScriptInstanceName>" + $get(MasterObj + "txtScriptInstance").value + "</ScriptInstanceName>"
            XMLStr = XMLStr + "</Tb>"
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + strChk + MakeXMLParameters() + "</Root>"
            //alert(document.getElementById(MasterObj + "txtXml").value)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if ($get(MasterObj + "cmbScriptName").value == "0") {
                alert("لطفا نام قانون را انتخاب نمائيد")
                $get(MasterObj + "cmbScriptName").focus()
                return false;
            }
            if ($get(MasterObj + "txtScriptInstance").value.trim() == "") {
                alert("لطفا نام نمونه را انتخاب نمائيد")
                $get(MasterObj + "txtScriptInstance").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalSDate_txtYear").value == "") {
                alert("لطفا تاريخ شروع را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "KCalEDate_txtYear").value == "") {
                alert("لطفا تاريخ خاتمه را انتخاب نمائيد")
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbStep").value == 0) {
                alert("لطفا مرحله اجرا را انتخاب نمائيد")
                document.getElementById(MasterObj + "cmbStep").focus()
                return false;
            }
            else if (document.getElementById(MasterObj + "txtPriority").value == "") {
                alert("لطفا اولويت را وارد نمائيد")
                document.getElementById(MasterObj + "txtPriority").focus()
                return false;
            }
            else if (checkEmptyParametersDesc()) {
                return false
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkEmptyParametersDesc() {
            var oGrid = document.all.item("ScriptParameter")
            var lll = oGrid.rows.length
            for (i = 0; i < lll; i++) {
                if ((oGrid.rows(i).cells(1).childNodes(0).value == "")) {
                    alert("لطفا مقدار '" + oGrid.rows(i).cells(0).firstChild.innerText + "' را وارد کنيد")
                    return true;
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXMLParameters() {
            var oGrid = document.all.item("ScriptParameter")
            var lll = oGrid.rows.length
            var XMLStr = ""
            for (var i = 0; i < lll; i++) {
                XMLStr += "<parameter>"
                XMLStr += "<parameterID>" + parseInt(i + 1) + "</parameterID>"
                XMLStr += "<Value>" + oGrid.rows(i).cells(1).childNodes(0).value + "</Value>"
                /*if (oGrid.rows(i).cells(1).childNodes(0).value == 0) {
                XMLStr += "<Deftype>0</Deftype>"
                XMLStr += "<DefValue>" + oGrid.rows(i).cells(1).childNodes(1).value + "</DefValue>"
                }
                else {
                XMLStr += "<Deftype>1</Deftype>"
                if (oGrid.rows(i).cells(1).childNodes(1).value < 10)
                XMLStr += "<DefValue>p0" + oGrid.rows(i).cells(1).childNodes(0).value + "</DefValue>"
                else XMLStr += "<DefValue>p" + oGrid.rows(i).cells(1).childNodes(0).value + "</DefValue>"
                }*/
                XMLStr += "</parameter>"
            }
            return (XMLStr)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnShowActive() {
            if (document.getElementById(MasterObj + "cmbStep").value == "" || document.getElementById(MasterObj + "cmbStep").value == "0")
                alert("مرحله اجرا را انتخاب کنيد")
            else {
                var strUrl = "ShowActiveScript.aspx?StepID=" + document.getElementById(MasterObj + "cmbStep").value
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                strUrl = encodeURI(strUrl)
                rr = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 400px;center: Yes;help: no;status: no')
                if (rr != undefined)
                    document.getElementById(MasterObj + "txtPriority").value = rr
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickchkEPK(obj) {

            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes
            if (obj.id == MasterObj + "chkEPK")
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='0']");
            else
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0' and kind='1']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (obj.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>EPK</CodeID>"
                strChk += "<type>0</type>"
                if (obj.id == MasterObj + "chkEPK")
                    strChk += "<kind>0</kind>"
                else
                    strChk += "<kind>1</kind>"
                if (obj.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickchkAllPK(obj) {

            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes
            if (obj.id == MasterObj + "chkAllPK")
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='0']");
            else
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0' and kind='1']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (obj.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>AllPK</CodeID>"
                strChk += "<type>0</type>"
                if (obj.id == MasterObj + "chkAllPK")
                    strChk += "<kind>0</kind>"
                else
                    strChk += "<kind>1</kind>"
                if (obj.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("ScriptGroups");
            var oLen = OGrid.rows.length
            for (var i = 0; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes
            if (oGrid.id == "ScriptGroups")
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='0']");
            else
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "' and kind='1']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
                strChk += "<type>" + oGrid.rows(oIndex).type + "</type>"
                if (oGrid.id == "ScriptGroups")
                    strChk += "<kind>0</kind>"
                else
                    strChk += "<kind>1</kind>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbScriptName() {
            document.getElementById(MasterObj + "txtScriptID").value = document.getElementById(MasterObj + "cmbScriptName").value
            document.getElementById(MasterObj + "txtSubmit").value = "changcmbScriptName";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbDefault() {
            var Obj = window.event.srcElement
            if (Obj.value == 0) {
                Obj.nextSibling.disabled = false
                Obj.nextSibling.className = 'TxtControls'
            }
            else {
                Obj.nextSibling.disabled = true
                Obj.nextSibling.className = 'TxtControlsReadOnly'
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function updatecmbDefault() {
            var strXml = document.getElementById(MasterObj + "txtXMLHeader").value
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptParameter");
            var len = oXmlNodes.length
            var optionEl
            document.getElementById("cmbDefault").innerHTML = ""
            optionEl = document.createElement("OPTION")
            document.getElementById("cmbDefault").options.add(optionEl)
            document.getElementById("cmbDefault").all(0).innerText = 'مقدار ثابت'
            document.getElementById("cmbDefault").all(0).value = 0
            var i = 1
            for (var k = 0; k < len; k++) {
                optionEl = document.createElement("OPTION")
                document.getElementById("cmbDefault").options.add(optionEl)
                document.getElementById("cmbDefault").all(i).innerText = oXmlNodes.item(k).selectSingleNode('ParameterName').text
                document.getElementById("cmbDefault").all(i).value = i
                i++;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindHeader() {
            var oGrid = document.getElementById("ScriptParameter")
            Cleargrd(oGrid)
            if ((document.getElementById(MasterObj + "txtXMLHeader").value != "<BaseInfoEntity />") && (document.getElementById(MasterObj + "txtXMLHeader").value != "")) {
                //                updatecmbDefault()
                var strXml = document.getElementById(MasterObj + "txtXMLHeader").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptParameter");
                var len = oXmlNodes.length
                var oRow
                for (var i = 0; i < len; i++) {
                    oRow = oGrid.insertRow();
                    oRow.insertCell()
                    oRow.cells(0).innerHTML = "<label  style='width:200px' title='" + oXmlNodes.item(i).selectSingleNode('ParameterName').text + "' >" + oXmlNodes.item(i).selectSingleNode('SParameterName').text + "</label>"
                    oRow.cells(0).align = "right"
                    oRow.cells(0).className = "CssHeaderStyle"
                    oRow.cells(0).style.width = "200px"
                    //                    oRow.insertCell()
                    //                    oRow.cells(1).innerHTML = "<select onchange='onchangecmbDefault()' class='TxtControls' style='width:100px'>" + document.getElementById("cmbDefault").innerHTML + "</select><INPUT class='TxtControls' type='text' style='WIDTH: 50px;'>"
                    //                    oRow.cells(1).align = "right"
                    //                    oRow.cells(1).className = "CssHeaderStyle"
                    //                    oRow.cells(1).style.width = "160px"
                    oRow.className = "CssItemStyle"
                    var oCell = oRow.insertCell();
                    oCell.innerHTML = "<input type='text' style='width:110px' />"
                    oCell.style.width = "120px"
                    oCell.align = "center";
                }
            }
        }
        //==================================================================================================

        var oPopup = window.createPopup()
        var newrowindexGrd = 0

        //==================================================================================================
        function ShowPopUpcondition() {
            if (newrowindexGrd == 0)
                return
            var oPopupBody = oPopup.document.body
            oPopupBody.className = "CssPage"
            oPopupBody.style.backgroundColor = "#e7eeff"
            oPopupBody.dir = "rtl"
            oPopup.document.body.innerHTML = document.getElementById("divConditionTemplate").innerHTML

            oPopup.show(150, 300, 210, 200)
        }
        //==================================================================================================

        function AddRowCondition(Title) {
            var oGrid = document.getElementById("GrdConditionTemplate")
            oGrid.insertRow()

            if (newrowindexGrd % 2 == 0)
                oGrid.rows(newrowindexGrd).style.backgroundColor = "#d5e1fd"
            else
                oGrid.rows(newrowindexGrd).style.backgroundColor = "OldLace"

            oGrid.rows(newrowindexGrd).insertCell()
            oGrid.rows(newrowindexGrd).cells(0).innerText = Title
            oGrid.rows(newrowindexGrd).cells(0).align = "Right"
            oGrid.rows(newrowindexGrd).cells(0).style.width = "200px"
            newrowindexGrd++;
        }
        //==================================================================================================
        function CreateDivCondition() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            var strc = document.getElementById(MasterObj + "txtConditionTemplate").value
            oXmlDoc.loadXML(strc);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ConditionTemplate");

            for (var i = 0; i < oXmlNodes.length; i++)
                AddRowCondition(oXmlNodes.item(i).selectSingleNode("Title").text);
        }
        //==================================================================================================
        CreateDivCondition();
        function onkeydownCondition() {
            if (event.keyCode == 113) {
                ShowPopUpcondition()
            }
        }

    </script>
</asp:Content>
