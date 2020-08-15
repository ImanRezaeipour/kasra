<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="AlarmNew.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.AlarmNew"
    ValidateRequest="false" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="tabStyle.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

        }

        function EndRequestHandler(sender, args) {
            var StrVal = document.getElementById(MasterObj + "txtSubmit").value
            if (document.getElementById(MasterObj + "txtAlert").value != "")
                SetMsg(document.getElementById(MasterObj + "txtAlert").value);


            if (StrVal == "changcmbAlarmScripts") {
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
                <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="tabData.xml"
                    DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                    DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1" ImagesBaseUrl="images/"
                    MultiPageId="MultiPage1" runat="server">
                    <ItemLooks>
                        <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover"
                            LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="4"
                            
                             LeftIconWidth="3" LeftIconHeight="21"
                            RightIconWidth="3" RightIconHeight="21" />
                        <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10"
                            LabelPaddingRight="10" LabelPaddingTop="4" LabelPaddingBottom="4" 
                             LeftIconWidth="3" LeftIconHeight="21"
                            RightIconWidth="3" RightIconHeight="21" />
                    </ItemLooks>
                </ComponentArt:TabStrip>
                
                <ComponentArt:MultiPage ID="MultiPage1" CssClass="MultiPage" runat="server">
                    <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                        <table style="width:400">
                            <tr>
                                <td>
                                    <div align="right">
                                        <table>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td align="right">
                                                                تعريف کننده آلارم:
                                                            </td>
                                                            <td>
                                                                <div id="tdonlineUser" runat="server" style="color: #FF3399; width: 150px" align="right">
                                                                    &nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr >
                                                <td >
                                                <div align="right">
                                                    <table>
                                                        <tr >
                                                            <td >
                                                                <div align="right">
                                                                    نام آلارم:</div>
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtAlarmName" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset style="width: 500px; height: 30px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                        <legend style="color: #75A3D0">نحوه اطلاع رساني</legend>
                                        
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="chkSMS" runat="server" type="checkbox" />SMS
                                                    </div></td>
                                                </tr> 
                                                <tr> 
                                                    <td><div align="right">
                                                        <input id="chkEmail" runat="server" type="checkbox" />Email
                                                   </div> </td>
                                                </tr>
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="ChkAbstract" runat="server" type="checkbox" />ذکر در صفحه چکيده
                                                    </div></td>
                                                </tr>
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="chkAlarm" runat="server" type="checkbox" />هشدار در برنامه به صورت پيام
                                                    </div></td>
                                                </tr>
                                            </table>
                                        
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
            <td>
                <fieldset style="width: 500px; height: 60px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                    <legend style="color: #558DC6">متن اطلاع رساني ساخته شده :</legend>
                    <input readonly="readonly" style="width:300px;" type="text" id="txtMessage" runat="server" class="TxtControls" />
                </fieldset>
            </td>
        </tr>
                        </table>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                          <fieldset  style="width: 500px; height: 300px; border-right: lightblue thin inset;
        border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
        <legend style="color: #558DC6">قوانين</legend>
        <div style="width:100%" align="right" >
        <table style="width: 100%;">
            <tr>
                <td><div style="width:100%" align="right" >
                    <table >
                        <tr>
                            <td>
                                قانون :
                            </td>
                            <td >
                                <asp:DropDownList onchange="onchangcmbAlarmScripts()" ID="cmbAlarmScripts" runat="server"
                                    Height="16px" Width="119px" value="0" CssClass="TxtControls">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table></div>
                </td>
            </tr>
            <tr>
                <td ><div style="width:100%" align="right" >
                    <div style="height: 230px; overflow: auto; scrollbar-highlight-color: white; overflow: auto;
                        width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                        <table id="ScriptParameter_Header">
                        </table>
                        <table id="ScriptParameter">
                        </table>
                    </div></div>
                </td>
            </tr>
        </table></div>
    </fieldset>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                        <fieldset style="width: 500px; height: 300px; border-right: lightblue thin inset;
                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                            <legend style="color: #558DC6">دريافت کنندگان</legend>
                            <table id="Table24" cellspacing="0" cellpadding="0" align="center" border="0">
                                <tr>
                                    <td valign="top" >
                                    
                                        <table id="Table25" cellspacing="1" cellpadding="1" border="0">
                                            <tr >
                                                <td style="width: 22px" align="center">
                                                    <input id="ChkRoleS" type="radio" runat="server"  name="rec" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    خود شخص
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbDepartmentType" runat="server" name="rec" type="radio" />
                                                </td><td></td>
                                                <td ><div align="right">
                                                    شخص تعريف کننده
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="Radio1" runat="server" name="rec" type="radio" />
                                                </td><td></td>
                                                <td style="width: 160px"><div align="right">
                                                    مافوق شخص
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbG" runat="server" name="rec" type="radio" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    گروه خاص
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbPersonel" runat="server" name="rec" type="radio" checked />
                                                </td><td></td>
                                                <td><div align="right">
                                                    پرسنل خاص
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="Radio2" runat="server" name="rec" type="radio" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    مافوق تا سطح<input style="width:20px"  type="text" id="txtNth" runat="server" /> 
                                                    </div>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="height: 219px" valign="top" align="center">
                                    <div style="width: 220px;" align="right">
                                            
                                        <table id="reciever_Header">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                     <input id="chkAll" style="background-color: transparent" onclick="OnclickSelectAllChk(this)"
                                                    type="checkbox" >
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 60px">
                                                    شماره
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 120px">
                                                    نام
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 40px">
                                                    نوع
                                                </td>
                                            </tr>
                                        </table></div>
                                        <div style="width: 220px; height: 200px; scrollbar-highlight-color: white; overflow: auto;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                            <table id="reciever">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
                     <fieldset style="width: 500px; height: 300px; border-right: lightblue thin inset;
                            border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                            <legend style="color: #558DC6">مشمولين</legend>
                             <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                                <tr>
                                    <td valign="top" >
                                    
                                        <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                            <tr >
                                                <td style="width: 22px" align="center">
                                                    <input id="chkAllPK" type="checkbox" runat="server"  />
                                                </td><td></td>
                                                <td><div align="right">
                                                    کليه پرسنل
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="chkEPK" runat="server"  type="checkbox" />
                                                </td><td></td>
                                                <td ><div align="right">
                                                    پرسنل زير مجموعه
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" />
                                                </td><td></td>
                                                <td style="width: 160px"><div align="right">
                                                   واحد سازماني
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    گروه خاص
                                                 </div></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbPerson" runat="server" name="GroupChk" type="radio" checked />
                                                </td><td></td>
                                                <td><div align="right">
                                                    پرسنل خاص
                                                 </div></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td  style="height: 219px" valign="top" align="center">
                                        <table id="ScriptGroups_Header" style="width: 245px;">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                     <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                    type="checkbox" name="chkAll">
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    شماره
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 120px">
                                                    نام
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    نوع
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="width: 270px; height: 200px; scrollbar-highlight-color: white; overflow: auto;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                            <table align="center" id="ScriptGroups" style="width: 245px;">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </ComponentArt:PageView>
                    <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
                    <fieldset style="width: 500px; height: 30px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                        <legend style="color: #75A3D0">زمان اجرا</legend>
                                        
                                            <table style="width: 500px;">
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="rdbOccure" name="runTime" runat="server" type="radio" checked />هنگام وقوع
                                                    </div></td>
                                                </tr>
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="rdbLogin" name="runTime" runat="server" type="radio" />هنگام ورود به سيستم
                                                   </div> </td>
                                                </tr>
                                                <tr>
                                                    <td><div align="right">
                                                        <input id="rdbsettingTime" name="runTime" runat="server" type="radio" />تعريف زمان بندي
                                                    </div></td>
                                                </tr>
                                                
                                            </table>
                                        
                                    </fieldset>
                    </ComponentArt:PageView>
                </ComponentArt:MultiPage>
            </td>
        </tr>
        
        <tr>
            <td>
                <table>
                    <tr id="ttt">
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtXMLSave" runat="server" />
                                        <asp:HiddenField ID="txtScriptID" runat="server" />
                                        <asp:HiddenField ID="txtXMLHeader" runat="server" />
                                        <asp:HiddenField ID="txtUpdateXML" runat="server" />
                                        <asp:HiddenField ID="txtAlarm" runat="server" />
                                        <asp:HiddenField ID="txtScriptGroupXML" runat="server" />
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
            <input type="text" id="lenColumns" runat="server" />
            <input type="text" id="txtCreator" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
    </div>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/DataEntry/AlarmNew.js">

       
    </script>

</asp:Content>
