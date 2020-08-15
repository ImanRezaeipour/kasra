<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ReportDefinition.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.ReportDefinition"
    Title="------------------------------------------------------------------------------------------تعریف فرمت نمايش----------------------------------------------------------------------------------------------"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../App_Utility/Styles/ModifyPersonStyle/tabStyle.css" rel="stylesheet"
        type="text/css" />
    <table width="80%">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr align="right">
            <td align="right" dir="rtl">
                <table align="right"> 
                    <tr>
                        <td>
                            <div align="right" style="width: 421px" >
                                نام الگو
                                <select id="cmbReport"  runat="server" style="width: 365px" class='txtControls'
                                    onchange="OnChangeCmbReport(this)">
                                    <option></option>
                                </select>
                            </div>
                        </td>
                        <td>
                            نام گزارش
                            <asp:DropDownList ID="cmbMenu" class='txtControls' Width="300px" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="right">
            <td align="right">
                <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" PageName="ReportDefinition.aspx" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <div align="right">
                    نام گزارش
                    <input type="text" id="txtMenuName" onkeypress="FKeyPress()" onkeydown="FKeyDown()"
                        class="TxtControls" style="width: 200px" name="txtMenuName" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td dir="rtl">
            </td>
        </tr>
        <tr>
            <td>
                <div class="DemoArea">
                    <div align="right">
                        <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="../../App_Utility/Styles/Tab/FormGenerator/ReportDefinition.xml"
                            DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                            DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1px" ImagesBaseUrl="images/"
                            MultiPageId="MultiPage1" ScrollingEnabled="True" ScrollLeftLookId="ScrollItem"
                            ScrollRightLookId="ScrollItem" Width="570px" runat="server" ScrollDownLookId="DefaultTabLook"
                            ScrollUpLookId="DefaultTabLook" TopGroupTabSpacing="1px">
                            <ClientEvents>
                                <TabSelect EventHandler="TabStrip_TabSelect" />
                            </ClientEvents>
                            <ItemLooks>
                                <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover"
                                    LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="2" LabelPaddingBottom="1"
                                    LeftIconUrl="tab_left_icon.gif" RightIconUrl="tab_right_icon.gif" HoverLeftIconUrl="hover_tab_left_icon.gif"
                                    HoverRightIconUrl="hover_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21"
                                    RightIconWidth="3" RightIconHeight="19" />
                                <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10"
                                    LabelPaddingRight="10" LabelPaddingTop="2" LabelPaddingBottom="1" LeftIconUrl="selected_tab_left_icon.gif"
                                    RightIconUrl="selected_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21"
                                    RightIconWidth="3" RightIconHeight="19" />
                                <ComponentArt:ItemLook LookId="ScrollItem" CssClass="ScrollItem" HoverCssClass="ScrollItemHover"
                                    LabelPaddingLeft="5" LabelPaddingRight="5" LabelPaddingTop="0" LabelPaddingBottom="0" />
                            </ItemLooks>
                        </ComponentArt:TabStrip>
                    </div>
                    <ComponentArt:MultiPage ID="MultiPage1" CssClass="MultiPage" runat="server">
                        <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                            <div id="Field" style="width: 900px; height: 280px">
                                <table style="width: 99%; height: 100%">
                                    <tr valign="top" align="left">
                                        <td>
                                            <div align="right">
                                                <img alt="" src="../../App_Utility/Images/Icons/S8.png" style="cursor: pointer" onclick="OnClickImgSearchName()" />
                                                نام انتخابي
                                                <input id="txtSearch" onkeypress="OnKeypressTxtSearch(this.value),FKeyPress()" onkeydown="FKeyDown()"
                                                    class="TxtControls" type="text" />
                                            </div>
                                        </td>
                                        <td colspan="2" align="left">
                                            <div align="left" dir="ltr" style="width: 100%">
                                                <input id="BtnUpItem" title="حرکت به بالا" class="CssMoveUpItem" onclick="OnClickBtnMoveItemField(-1)"
                                                    type="button" name="BtnUpItem" />
                                                <input id="BtnDownItem" title="حرکت به پايين" class="CssMoveDownItem" onclick="OnClickBtnMoveItemField(1)"
                                                    type="button" name="BtnDownItem" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr valign="top" align="right">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 280px; width: 350px;">
                                            <fieldset dir="rtl" style="width: 266px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                                <legend style="color: #75A3D0">فيلد هاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Div2" runat="server" align="right" style="width: 250; scrollbar-highlight-color: white;
                                                            overflow: auto; direction: rtl; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 280;" dir="rtl">
                                                            <asp:PlaceHolder ID="PlaceHolder1" runat="Server" />
                                                            <input id="txtTemplateID" type="hidden" runat="server" />
                                                            <input id="txtXmlField" type="hidden" runat="server" />
                                                            <asp:HiddenField ID="txtPicPath" runat="server" />
                                                            <asp:HiddenField ID="txtPicFormat" runat="server" />
                                                            <input type="text" id="txtPicPatch" runat="server" style="display: none" name="txtPicPatch" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table1" style="width: 36px; height: 87px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button1" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdNewField')"
                                                            type="button" name="btnback">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button2" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdNewField')"
                                                            type="button" name="btnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button3" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewField')"
                                                            type="button" name="btnnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button4" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewField')"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button25" title="جايگزيني" class="CssReplace" onclick="OnClickBtnReplace()"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="Right">
                                            <fieldset dir="rtl" style="width: 550px; height: 280px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                                <legend style="color: #75A3D0;">فيلد هاي نمايشي</legend>
                                                <div style="width: 550px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table cellpadding="0" style="width: 1500px" cellspacing="0" border="0">
                                                        <tr class="CssHeaderStyle">
                                                            <td align="center" style="width: 200px">
                                                                نام
                                                            </td>
                                                            <td align="center" style="width: 110px">
                                                                نام جديد
                                                            </td>
                                                            <td style="width: 50px">
                                                                نوع
                                                            </td>
                                                            <td style="width: 43px">
                                                                سايز
                                                            </td>
                                                            <td style="width: 55px">
                                                                پيش فرض
                                                            </td>
                                                            <td align="center" style="width: 55px">
                                                                عملگر
                                                            </td>
                                                            <td align="center" style="width: 40px">
                                                                مقدار 1
                                                            </td>
                                                            <td align="center" style="width: 40px">
                                                                مقدار2
                                                            </td>
                                                            <td style="width: 75px">
                                                                نوع فيلد شرطي
                                                            </td>
                                                            <td style="width: 50px">
                                                                رنگ متن
                                                            </td>
                                                            <td style="width: 75px">
                                                                رنگ پس زمينه
                                                            </td>
                                                            <%--   <td style="width: 88px;">
                                                                آدرس لينک
                                                            </td>
                                                            <td style="width: 122px;">
                                                                پارامتر لينک
                                                            </td>
                                                            <td style="width: 87px;">
                                                                مقدار پارامتر
                                                            </td>
                                                            <td style="width: 110px;">
                                                                ويژگي پنجره لينک
                                                            </td>--%>
                                                            <td style="width: 40px">
                                                                فونت
                                                            </td>
                                                            <td style="width: 60px">
                                                                Bold
                                                            </td>
                                                            <td style="width: 60px">
                                                                UnderLine
                                                            </td>
                                                            <td style="width: 60px">
                                                                پيشرفته
                                                            </td>
                                                            <td style="width: 51px">
                                                                عمليات
                                                            </td>
                                                            <td style="width: 50px">
                                                                CssStyle
                                                            </td>
                                                            <td style="width: 80px">
                                                                ماهيت کد
                                                            </td>
                                                            <td style="width: 50px">
                                                                نمايشي
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="height: 230px; width: 1510px;" dir="rtl">
                                                        <table align="right" id="GrdNewField" onclick="OnClickGrdNew(this,'GrdNewField')">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                            <div id="Parameter" style="width: 900px; height: 280px">
                                <table style="width: 100%; height: 100%">
                                    <tr valign="top">
                                        <td colspan="3">
                                            <input id="Button6" style="visibility: hidden" type="button" name="btnback" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 280px; width: 235px;">
                                            <fieldset dir="rtl" style="width: 235px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                                                <legend style="color: #75A3D0; width: 101px;">پارامترهاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Divi" runat="server" align="center" style="width: 215px; scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 280">
                                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                            <input id="txtXmlParam" type="hidden" runat="server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table22" style="width: 36px; height: 87px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                &nbsp;
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnAddItem" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdNewParam')"
                                                            type="button" name="btnback">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnDelItem" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdNewParam')"
                                                            type="button" name="btnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnAddAllItem" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewParam')"
                                                            type="button" name="btnnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="btnDelAllItem" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewParam')"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <fieldset dir="rtl" style="width: 580px; height: 280px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                                <legend style="color: #75A3D0">پارامترهاي نمايشي</legend>
                                                <div style="width: 580px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table id="XTabTable_Header" cellpadding="0" style="width: 820px; height: 19px;"
                                                        cellspacing="0" border="0">
                                                        <thead style="display: inline">
                                                            <tr class="CssHeaderStyle">
                                                                <td class="style64" align="center" style="width: 210px">
                                                                    نام
                                                                </td>
                                                                <td class="style63" align="center" style="width: 80px">
                                                                    نوع
                                                                </td>
                                                                <td class="style55" align="center" style="width: 85px">
                                                                    سايز
                                                                </td>
                                                                <td class="style69" align="center" style="width: 97px">
                                                                    پيش فرض
                                                                </td>
                                                                <td class="style68" align="center" style="width: 100px">
                                                                    پيش رفته
                                                                </td>
                                                                <td class="CssHeaderStyle" align="center" style="width: 100px">
                                                                    قابل ويرايش
                                                                </td>
                                                                <td class="CssHeaderStyle" align="center" style="width: 200px">
                                                                    نام گزارش
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <div style="height: 230px; width:820px;" dir="rtl">
                                                        <table id="GrdNewParam" onclick="OnClickGrdParamSub(this)">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                            <div id="Div3" style="width: 900px; height: 280px">
                                <table style="width: 100%; height: 100%">
                                    <tr valign="top">
                                        <td colspan="3">
                                            <input id="Button5" style="visibility: hidden" type="button" name="btnback" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 280px; width: 235px;">
                                            <fieldset dir="rtl" style="width: 235px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي انتخابي</legend>
                                                <%--<asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Div4" runat="server" align="center" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 300">
                                                            <asp:PlaceHolder ID="PlaceHolder2" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>--%>
                                                <div style="width: 215px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table style="width: 286px" class="CssHeaderStyle" cellpadding="0" cellspacing="0"
                                                        border="0">
                                                        <tr>
                                                            <td style="width: 220px">
                                                                نام
                                                            </td>
                                                            <td style="width: 100px">
                                                                نوع
                                                            </td>
                                                            <td style="width: 40px">
                                                                سايز
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="height: 230px; width: 286px;">
                                                        <table id="GrdLink" onclick="OnClickGrdNew(this,'GrdLink')" ondblclick="OndbClickGrd('GrdLink')">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table2" style="width: 36px; height: 87px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                &nbsp;
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button8" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdLink')"
                                                            type="button" name="btnback">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button9" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdLink')"
                                                            type="button" name="btnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button10" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewLink')"
                                                            type="button" name="btnnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button11" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewLink')"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <fieldset dir="rtl" style="width: 600px; height: 280px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي داراي لينک</legend>
                                                <div style="width: 600px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table style="width: 705px" class="CssHeaderStyle" cellpadding="0" cellspacing="0"
                                                        border="0">
                                                        <tr>
                                                            <td style="width: 200px">
                                                                نام
                                                            </td>
                                                            <td style="width: 110px">
                                                                آدرس لينک
                                                            </td>
                                                            <td style="width: 116px">
                                                                پارامتر لينک
                                                            </td>
                                                            <td style="width: 91px">
                                                                مقدار پارامتر
                                                            </td>
                                                            <td>
                                                                ويژگي پنجره لينک
                                                            </td>
                                                            <td style="width: 50px">
                                                                Encryption
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="height: 230px; width: 710px;">
                                                        <table id="GrdNewLink" onclick="OnClickGrdNew(this,'GrdNewLink')">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
                            <div id="Div5" dir="rtl" style="width: 900px; height: 280px">
                                <table style="width: 73%; height: 100%">
                                    <tr valign="top">
                                        <td colspan="4">
                                            <input id="Button7" style="visibility: hidden" type="button" name="btnback" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 280px; width: 276px;">
                                            <fieldset dir="rtl" style="width: 263px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; height: 280px; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Div6" runat="server" align="center" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 280px; width: 229px;">
                                                            <asp:PlaceHolder ID="PlaceHolder3" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table5" style="width: 36px; height: 87px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                &nbsp;
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button14" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdNewGroup')"
                                                            type="button" name="btnback">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button15" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdNewGroup')"
                                                            type="button" name="btnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button16" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewGroup')"
                                                            type="button" name="btnnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button17" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewGroup')"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" align="right" style="width: 319px">
                                            <fieldset dir="rtl" style="width: 350px; height: 280px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي شامل گروه بندي</legend>
                                                <div style="width: 329px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table cellpadding="0" style="width: 307px" cellspacing="0" border="0">
                                                        <tr class="CssHeaderStyle">
                                                            <td align="center" style="width: 200px">
                                                                نام
                                                            </td>
                                                            <td style="width: 101px">
                                                                نوع مرتب سازي
                                                            </td>
                                                            <%--  <td style="width: 80px">
                                                                نوع فيلد
                                                            </td>--%>
                                                        </tr>
                                                    </table>
                                                    <div style="height: 230px; width: 308px;">
                                                        <table id="GrdNewGroup" onclick="OnClickGrdNew(this,'GrdNewGroup')">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                        <td valign="top" align="right">
                                            <div align="left" style="width: 51px">
                                                <input id="Button12" title="حرکت به بالا" class="CssMoveUpItem" onclick="OnClickBtnMoveItemGroup(-1)"
                                                    type="button" name="BtnUpItem">
                                                <input id="Button13" title="حرکت به پايين" class="CssMoveDownItem" onclick="OnClickBtnMoveItemGroup(1)"
                                                    type="button" name="BtnDownItem">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView6" CssClass="PageContent" runat="server">
                            <div id="Div7" style="width: 900px; height: 280px">
                                <table style="width: 71%; height: 100%">
                                    <tr valign="top">
                                        <td colspan="4">
                                            <input id="Button24" style="visibility: hidden" type="button" name="btnback" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 280px; width: 276px;">
                                            <fieldset dir="rtl" style="width: 263px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; height: 280px; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Div8" runat="server" align="center" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 280px; width: 229px;">
                                                            <asp:PlaceHolder ID="PlaceHolder4" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table7" style="width: 36px; height: 87px" cellspacing="1" cellpadding="1"
                                                border="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                &nbsp;
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button20" title="اضافه" class="CssAddItem" onclick="OnClickBtnAddItem('GrdNewSort')"
                                                            type="button" name="btnback">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button21" title="حذف" class="CssDelItem" onclick="OnClickBtnDelItem('GrdNewSort')"
                                                            type="button" name="btnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button22" title="انتخاب همه" class="CssAddAllItem" onclick="OnClickBtnAddAllItem('GrdNewSort')"
                                                            type="button" name="btnnNext">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="Button23" title="حذف همه" class="CssDelAllItem" onclick="OnClickBtnDelAllItem('GrdNewSort')"
                                                            type="button" name="btnnNext" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <fieldset dir="rtl" style="width: 394px; height: 280px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي شامل مرتب سازي</legend>
                                                <div style="width: 380px; height: 280px; scrollbar-highlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table cellpadding="0" style="width: 350px" cellspacing="0" border="0">
                                                        <tr class="CssHeaderStyle">
                                                            <td align="center" style="width: 200px">
                                                                نام
                                                            </td>
                                                            <td style="width: 100px">
                                                                نوع مرتب سازي
                                                            </td>
                                                            <td style="width: 80px">
                                                                نوع فيلد
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="height: 230px; width: 350px;">
                                                        <table id="GrdNewSort" onclick="OnClickGrdNew(this,'GrdNewSort')">
                                                            <thead style="display: none;">
                                                            </thead>
                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <div align="left" style="width: 50px">
                                                <input id="Button18" title="حرکت به بالا" class="CssMoveUpItem" onclick="OnClickBtnMoveItemSort(-1)"
                                                    type="button" name="BtnUpItem" />
                                                <input id="Button19" title="حرکت به پايين" class="CssMoveDownItem" onclick="OnClickBtnMoveItemSort(1)"
                                                    type="button" name="BtnDownItem" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
                            <div id="Div1" style="width: 900px; height: 280px" dir="rtl" align="right">
                                <table style="width: 846px">
                                    <tr>
                                        <td>
                                            <input id="chkPageNumber" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                شماره صفحه
                                            </div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30" align="right">
                                            <input id="chkDate" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                تاريخ
                                            </div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30" align="right">
                                            <input id="ChkHeader" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                ايجاد هدر گزارش بر اساس فيلتر</div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30" align="right">
                                            <input id="ChkControl" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                ايجاد از نوع کنترل</div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30" align="right">
                                            <input id="chkFilter" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                نمايش فيلتر پيشرفته</div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30">
                                            <input id="chkRptSubject" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                عنوان گزارش :</div>
                                        </td>
                                        <td align="right" class="style4">
                                            <input id="txtRptSubject" runat="server" style="width: 300px; height: 40px" class="TxtControls"
                                                type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30">
                                            <input id="chkLogo" runat="server" type="checkbox" />
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                آرم :</div>
                                        </td>
                                        <td align="right" dir="rtl" class="style4">
                                            <div align="right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <img id="TdImg" runat="server" style="border: 1px solid #919B9C; width: 90px; height: 110px;"
                                                                src="../../App_Utility/Images/ModifyPersonImage/userpic.jpg" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label Text="انتخاب تصوير" Width="100px" ForeColor="Maroon" Style="cursor: pointer"
                                                                Font-Underline="true" onclick="OnClickBtnUpload()" runat="server" ID="lblPic"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30" align="right">
                                        </td>
                                        <td align="right" class="style6">
                                            <div align="right" class="style5">
                                                محل قرارگيری در منو :</div>
                                        </td>
                                        <td>
                                            <table align="right">
                                                <tr align="right">
                                                    <td align="left">
                                                        زير سيستم
                                                    </td>
                                                    <td align="right">
                                                        <select id="SelSubSys" class='txtControls' runat="server" onchange="OnChangeSubSys(this)">
                                                            <option value="0">انتخاب نشده</option>
                                                        </select>
                                                    </td>
                                                    <td align="left">
                                                        نام منو
                                                    </td>
                                                    <td align="right">
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <input id="txtSelectedValue" type="hidden" runat="server" />
                                                                <select id="SelMenu" class='txtControls' style="width: 185px" runat="server">
                                                                    <option value="0">انتخاب نشده</option>
                                                                </select>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit4" EventName="click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                    </ComponentArt:MultiPage>
                </div>
            </td>
        </tr>
    </table>
    <div align="center" id="LinkDiv" class="CssPage" style="vertical-align: middle; width: 600px;
        height: 260px; font-family: Tahoma; position: absolute; display: none;
        overflow: auto;">
        <table style="vertical-align: middle; height: 180px;">
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                نام منو:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbPages" Width="200px" onchange="OnChangeCmbPages()" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td align="right" style="width: 54px">
                                نام فيلد:
                            </td>
                            <td id="TdFieldName" align="right" style="color: Red; width: 187px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="height: 160px; width: 500px;">
                        <fieldset dir="rtl" style="width: 500px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                            border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                            <legend style="color: #75A3D0">اطلاعات پارامترها</legend>
                            <table id="Table4" cellpadding="0" style="width: 448px; height: 26px;" cellspacing="0"
                                border="0">
                                <thead style="display: inline">
                                    <tr class="CssHeaderStyle">
                                        <td align="center" rowspan="2" style="width: 114px">
                                            نام پارامتر
                                        </td>
                                        <td align="center" colspan="3">
                                            مقدار
                                        </td>
                                    </tr>
                                    <tr class="CssHeaderStyle" style="border: 1">
                                        <td class="CssAlternatingItemStyle" style="width: 84px">
                                            مقدار ثابت
                                        </td>
                                        <td class="CssAlternatingItemStyle" style="width: 90px">
                                            فيلد گريد
                                        </td>
                                        <td class="CssAlternatingItemStyle">
                                            کد
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                            <div style="height: 100px; width: 460px; scrollbar-highlight-color: white; overflow: auto;
                                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                <table id="GrdPageParam">
                                    <thead style="display: none;">
                                    </thead>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                    <div style="display: none">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <select id="SelParamOfPage" runat="server" style="display: none">
                                    <option></option>
                                </select>
                                <input type="text" id="xPVal" name="xPVal" runat="server" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit3" EventName="click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <input id="BtnLinkOk" type="button" title="تائيد" onclick="OnClickBtnLinkOk()" style="width: 70px;
                                    height: 32px; background-color: transparent; background-image: url('/FrmPresentation/App_Utility/Images/Buttons/Btnok2.gif');" />
                            </td>
                            <td>
                                <input id="BtnLinkCancel" type="button" title="انصراف" onclick="OnClickBtnLinkCancel()"
                                    style="width: 70px; height: 32px; background-color: transparent; background-image: url('/FrmPresentation/App_Utility/Images/Buttons/Cancel.gif');" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
        <asp:Button ID="BtnSubmit4" runat="server" Text="Button" OnClick="BtnSubmit4_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtMappingType" name="txtMappingType" runat="server" />
        <input type="text" id="txtVaridable" name="txtVaridable" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtGrdHeight" name="txtFlagAccess" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtXmlOperand" name="txtXmlOperand" runat="server" />
        <input type="text" id="txtXmlOperation" name="txtXmlOperation" runat="server" />
        <input type="text" id="txtXmlMenuItems" name="txtXmlMenuItems" runat="server" />
        <input type="text" id="txtXmlAllCode" name="txtXmlAllCode" runat="server" />
        <input type="text" id="txtXmlSortFieldType" name="txtXmlSortFieldType" runat="server" />
        <input type="text" id="txtXmlOpFieldType" name="txtXmlOpFieldType" runat="server" />
        <input type="text" id="xNature" name="xNature" runat="server" />
        <input type="text" id="txtReportCount" runat="server" />
        <input type="text" id="txtKeyaRptCount" runat="server" />
        <input type="text" id="txtKeyaError" runat="server" />
    </div>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input id="txtAlert" type="hidden" runat="server" />
                <input id="txtValidate" type="hidden" runat="server" />
                <input id="txtMenu" type="hidden" runat="server" />
                <input id="txtReportcontrol" type="hidden" runat="server" />
                <input id="txtSavedMenuItemID" type="hidden" runat="server" />
                <input id="txtReportID" type="hidden" runat="server" />
                <input id="txtValue" type="hidden" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div style="position: absolute; top: 0px; left: 0px; visibility: hidden">
        <img src="../../App_Utility/Images/ModifyPersonImage/tab_bg.gif" width="0" height="0"
            alt="" />
        <img src="../../App_Utility/Images/ModifyPersonImage/hover_tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../App_Utility/Images/ModifyPersonImage/selected_tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../App_Utility/Images/ModifyPersonImage/hover_scroll_item_bg.gif" width="0"
            height="0" alt="" />
    </div>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/farsi.js"></script>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/ReportDefinition.js?v=1"></script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #txtSearch
        {
            width: 101px;
        }
        .style4
        {
            width: 314px;
        }
        .style5
        {
            width: 202px;
        }
        .style6
        {
            width: 202px;
        }
        #cmbReport
        {
            width: 298px;
        }
        </style>
</asp:Content>
