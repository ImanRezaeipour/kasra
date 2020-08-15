<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="FrmPresentation.App_Pages.FormGenerator.Template"
    Title="---------------------------------------------------------------------------------------تعریف مشخصات گزارش----------------------------------------------------------------------------"
    ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../App_Utility/Styles/ModifyPersonStyle/tabStyle.css" rel="stylesheet"
        type="text/css" />

    <table width="98%" style="direction: rtl">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr align="right">
            <td align="right">
                <table style="width: 605px" align="right">
                    <tr>
                        <td>
                            نام روال:
                        </td>
                        <td style="width: 138px">
                          <input id="txtTemplate" type="text" style="width:284px" class="TxtControls" 
                                runat="server" />
                        </td>
                         <td style="width: 81px">
                        نام Schema:
                        </td>
                        <td>
                            <input id="txtSPName" type="text" style="width:82px" class="TxtControls" 
                                runat="server" align="right"/>
                        </td>
                       
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="right">
            <td align="right">
                <uc1:ToolBar ID="OToolBar" Paging="1" runat="server" PageName="Template.aspx" PageID="11119" />
            </td>
        </tr>
        <%--  <tr>
            <td align="center">
             
             
             
             
            </td>
        </tr>--%>
        <tr>
            <td>
                <div class="DemoArea">
                    <div align="right">
                        <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="../../App_Utility/Styles/Tab/FormGenerator/Template.xml"
                            DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                            DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1px" ImagesBaseUrl="images/"
                            MultiPageId="MultiPage1" ScrollingEnabled="True" ScrollLeftLookId="ScrollItem"
                            ScrollRightLookId="ScrollItem" Width="570px" runat="server" ScrollDownLookId="DefaultTabLook"
                            ScrollUpLookId="DefaultTabLook" TopGroupTabSpacing="1px">
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
                        <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                            <div id="Report" dir="rtl" lang="fa" style="display: inline; width: 900px; height: 380px">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
        <table style="width: 738px; margin-right: 0px;">
                                                <tr>
                                                    <td>
                                                        نام Object:
                                                    </td>
                                                    <td>
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                                        <asp:DropDownList ID="cmbSp" Width="250px" class='txtControls' onchange="OnChangeCmbSp()" runat="server">
                                                        </asp:DropDownList>
                                                         <input id="txtAlert" type="hidden" runat="server" />
                                                        <input id="txtValidate" type="hidden" runat="server" />
                                                        <input id="txtXmlTemplate" type="hidden" runat="server" />
                                                        <input id="txtTemplateID" type="hidden" runat="server" />
                                                         </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        نام الگو:
                                                    </td>
                                                    <td>
                                                        <input id="txtReportName" class='txtControls' runat="server" type="text" />
                                                    </td>
                                                    <td>
                                                        نام سيستم:
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cmbSubSystem" class='txtControls' Width="100px" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td></td>
                                                <td><asp:CheckBox ID="ChkIsCode" runat="server" />ستون های روال پويا</td>
                                                <td></td>
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">
                                            <table>
                                                <tr>
                                                    <td align="left" class="style26">
                                                        <div align="left">
                                                            Query
                                                        </div>
                                                    </td>
                                                    <td align="right">
                                                        <div align="right">
                                                            <textarea id="txtQuery" runat="server" dir="ltr" style="width: 568px; height: 300px;
                                                                scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                                scrollbar-base-color: #b0c4de;" readonly rows="2" class='txtControls'></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ComponentArt:PageView>
                        <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                            <div id="Parameter" style="width: 900px; height: 380px">
                                <table style="width: 100%; height: 100%">
                                    <tr valign="top">
                                        <td style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de;">
                                            <fieldset dir="rtl" style="width: 250px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                                                <legend style="color: #75A3D0">پارامترهاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="DivGrd" runat="server" align="center" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 350px">
                                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                            <input id="txtGetQuery" type="hidden" runat="server" />
                                                            <input type="hidden" id="txtXmlField" runat="server" />
                                                            <input type="hidden" id="txtXmlParam" runat="server" />
                                                            <input type="hidden" id="txtAlertSp" runat="server" />
                                                            <select id="CmbTmpField" style="visibility: hidden" runat="server">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table3" style="width: 35px; height: 80px" cellspacing="1" cellpadding="1"
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
                                            <fieldset dir="rtl" style="width: 650px; height: 350px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">پارامترهاي نمايشي</legend>
                                                <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                    scrollbar-base-color: #b0c4de; height: 350px; width: 650px;">
                                                    <table id="XTabTable_Header" cellpadding="0" style="width: 620px;" cellspacing="0"
                                                        border="0">
                                                        <thead style="display: inline">
                                                            <tr class="CssHeaderStyle">
                                                                <td class="style42" align="center">
                                                                    قابل ويرايش
                                                                </td>
                                                                <td class="style43" align="center">
                                                                    نام جاري
                                                                </td>
                                                                <td class="style44" align="center">
                                                                    نام جديد
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    نوع نمايشي
                                                                </td>
                                                                <td class="style45" align="center">
                                                                    پيش فرض
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    LookupName
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    LookupValue
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    LookupParam
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <div style="height: 300px; width: 620px;">
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
                        <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                            <div id="Field" style="width: 900px; height: 380px">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="scrollbar-highlight-color: white; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;"
                                            class="style1">
                                            <fieldset dir="rtl" style="width: 250px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي موجود</legend>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="Div2" runat="server" align="center" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            height: 350;">
                                                            <asp:PlaceHolder ID="PlaceHolder1" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                        <td valign="top">
                                            <table id="Table1" style="width: 35px; height: 80px" cellspacing="1" cellpadding="1"
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
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <fieldset dir="rtl" style="width: 509px; height: 370px; border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                                                align="middle">
                                                <legend style="color: #75A3D0">فيلد هاي نمايشي</legend>
                                                <div dir="rtl" style="width: 492px; height: 338px; scrollbar-highlight-color: white;
                                                    overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;">
                                                    <table id="Table2" cellpadding="0" style="width: 448px;" cellspacing="0" border="0">
                                                        <thead style="display: inline">
                                                            <tr class="CssHeaderStyle">
                                                                <td align="center">
                                                                    قابل ويرايش
                                                                </td>
                                                                <td align="center">
                                                                    &nbsp;
                                                                </td>
                                                                <td align="center" style="width: 54px">
                                                                    نام جديد
                                                                </td>
                                                                <td align="center" style="width: 72px">
                                                                    نوع نمايشي
                                                                </td>
                                                                <td align="center" style="width: 58px">
                                                                    پيش فرض
                                                                </td>
                                                                <td align="center" style="width: 60px">
                                                                    عملگر
                                                                </td>
                                                                <td align="center" style="width: 48px">
                                                                    مقدار 1
                                                                </td>
                                                                <td align="center">
                                                                    مقدار2
                                                                </td>
                                                                 <td align="center">
                                                                    اجباری
                                                                </td>
                                                                <%-- <td align="center" style="width: 168px">
                                                                    LinkUrl
                                                                </td>
                                                                <td align="center">
                                                                    UrlParam
                                                                </td>
                                                                <td align="center" style="width: 79px">
                                                                    UrlParamVal
                                                                </td>
                                                                <td align="center" style="width: 80px">
                                                                    UrlFeatur
                                                                </td>--%>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <div style="height: 280px; width: 443px;">
                                                        <table id="GrdNewField" onclick="OnClickGrdNewField(this)">
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
                    </ComponentArt:MultiPage>
                </div>
            </td>
        </tr>
    </table>
    <div align="center" id="LinkDiv" class="CssPage" style="vertical-align: middle; width: 329px;
        height: 279px; font-family: Tahoma; display: none; overflow: auto;
        position: absolute; top: 91px; right: 398px;">
        <table style="vertical-align: middle; height: 238px;">
            <tr>
                <td>
                    <asp:DropDownList ID="cmbPages" Width="200px" onchange="OnChangeCmbPages()" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                        scrollbar-base-color: #b0c4de; height: 179px; width: 250px;">
                        <table id="Table4" cellpadding="0" style="width: 220px;" cellspacing="0" border="0">
                            <thead style="display: inline">
                                <tr class="CssHeaderStyle">
                                    <td align="center">
                                        پارامتر
                                    </td>
                                    <td align="center">
                                        مقدار
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <div style="height: 142px; width: 220px;">
                            <table id="GrdPageParam">
                                <thead style="display: none;">
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div style="display: none">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="Div1" runat="server" align="center" style="scrollbar-highlight-color: white;
                                    overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                    height: 350px">
                                    <select id="SelParamOfPage" runat="server" style="display: none">
                                        <option></option>
                                    </select>
                                </div>
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
        <%--  <input id="Button5" type="button" value="..." class="CssPage" onclick="OnClickBtnConfirmPass()" />--%>
    </div>
    <div style="display: none">
    <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
        <asp:Button ID="BtnSubmit4" runat="server" Text="Button" OnClick="BtnSubmit4_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSelectedSpName" name="txtSelectedSpName" runat="server" />
        <input type="text" id="txtVaridable" name="txtVaridable" runat="server" />
        <input type="text" id="txtMappingType" name="txtMappingType" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="EDate" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="EDate" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtXmlOperand" name="txtXmlOperand" runat="server" />
        <input type="text" id="txtXmlMenuItems" name="txtXmlMenuItems" runat="server" />
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
<script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/FormGenerator/Template.js"></script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style26
        {
            width: 170px;
        }
        #txtTemplate
        {
            width: 288px;
        }
    </style>
</asp:Content>
