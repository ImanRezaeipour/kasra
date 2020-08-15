<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineSetting.aspx.cs"
    Inherits="FrmPresentation.App_Pages.Setting.DefineSetting" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/Setting/tabStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Scripts/Setting/farbtastic.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .SelectPerson
        {
            width: 125px;
            height: 29px;
            background-repeat: no-repeat;
            background-color: transparent;
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            border-left: lightsteelblue 2px solid;
            border-bottom: #346fa4 2px solid;
            cursor: pointer;
            background-image: url('/FrmPresentation/App_Utility/Images/Icons/SelectPerson.gif');
        }
        .fieldsetStyle
        {
            width: 400px;
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid;
            border-left: #78BED6 thin outset;
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6;
        }
        .colorwell
        {
            border: 2px solid #fff;
            width: 6em;
            text-align: center;
            cursor: pointer;
        }
        body .colorwell-selected
        {
            border: 2px solid #000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 910px; text-align: center">
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <div class="DemoArea">
        <div align="center">
            <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="../../App_Utility/Styles/Setting/tabData.xml"
                DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1px" ImagesBaseUrl="images/"
                MultiPageId="MultiPage1" ScrollingEnabled="True" ScrollLeftLookId="ScrollItem"
                ScrollRightLookId="ScrollItem" Width="900px" runat="server" ScrollDownLookId="DefaultTabLook"
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
                <!-- Add content for page 1 here -->
                <div id="FrameworkDiv" style="display: inline" align="center">
                    <table width="95%" align="center" valign="top" dir="rtl" style="border: 2px inset #33CCFF;
                        height: 90%">
                        <tr>
                            <td align="center" valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle"></legend>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div id="DivFrmSetting" style="scrollbar-highlight-color: white; overflow: auto;
                                                            width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 180px;">
                                                            <asp:PlaceHolder ID="FrmGridViewPlaceHolder" runat="Server" />
                                                            <asp:HiddenField ID="txtAlert" runat="server" />
                                                            <asp:HiddenField ID="txtValidate" runat="server" />
                                                            <asp:HiddenField ID="txtXmlOption" runat="server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات کلمه عبور کاربران سيستم</legend>
                                                <table>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <input type="checkbox" runat="server" id="chkDefaultPass" onchange="OnChangeVariable(this)" />
                                                            در نظر گرفتن کد پرسنلی بعنوان کلمه عبور پيش فرض کاربر(در صورت بزرگتر بودن طول شماره
                                                            پرسنلی از 5 رقم)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <input type="checkbox" runat="server" id="chkChangePassNeedWithTime" onchange="OnChangeVariable(this)" />
                                                            ملزم بودن کاربر به تغيير کلمه عبور در بازه های زمانی مشخص : هر
                                                            <input type="text" runat="server" id="txtChangePassNeedWithTime" onkeydown="OnKeyDownInt(this)"
                                                                style="width: 20px" class="TxtControls" onchange="OnChangeVariable(this)" />
                                                            روز
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <input type="checkbox" runat="server" id="chkChangePassNeedWithLogin" />
                                                            ملزم بودن کاربر به تغيير کلمه عبور پس از چند مرتبه login :
                                                            <input type="text" runat="server" id="txtChangePassNeedWithLogin" onkeydown="OnKeyDownInt(this)"
                                                                style="width: 20px" class="TxtControls" onchange="OnChangeVariable(this)" />
                                                            مرتبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="text-align: right">
                                                            <input type="checkbox" runat="server" id="chkChangePassNeedAfterFirstLogin" onchange="OnChangeVariable(this)" />
                                                            ملزم بودن کاربر به تغيير کلمه عبور پس از اولين login
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <input type="checkbox" runat="server" id="chkChangePassNeedWithIncorrectPass" />
                                                            ملزم بودن کاربر به تغيير کلمه عبور پس از اينکه چند مرتبه رمز عبور خود را اشتباه
                                                            وارد کرد : هر
                                                            <input type="text" runat="server" id="txtChangePassNeedWithIncorrectPass" onkeydown="OnKeyDownInt(this)"
                                                                style="width: 20px" class="TxtControls" onchange="OnChangeVariable(this)" />
                                                            مرتبه
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">روزهاي تعطيل شيفت</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td style="width: 70px" ailgn="right">
                                                            <input type="checkbox" runat="server" id="ChkSatur" value="0" />شنبه
                                                        </td>
                                                        <td style="width: 70px">
                                                            <input type="checkbox" runat="server" id="ChkSun" value="1" />يکشنبه
                                                        </td>
                                                        <td style="width: 70px">
                                                            <input type="checkbox" runat="server" id="ChkMon" value="2" />دوشنبه
                                                        </td>
                                                        <td style="width: 70px">
                                                            <input type="checkbox" runat="server" id="ChkTus" value="3" />سه شنبه
                                                        </td>
                                                        <td style="width: 70px">
                                                            <input type="checkbox" runat="server" id="ChkWen" value="4" />چهار شنبه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 70px">
                                                            <input type="checkbox" runat="server" id="ChkThers" value="5" />پنجشنبه
                                                        </td>
                                                        <td style="width: 60px">
                                                            <input type="checkbox" runat="server" id="ChkFri" value="6" />جمعه
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات ActiveDirectory</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            نام سرور :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" id="txtDomainServer" style="width: 122px" disabled="true"
                                                                onchange="OnChangeVariable(this)" class="TxtControls" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات صفحات</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد وضعيت کارتخوان :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 122px"
                                                                class="TxtControls" id="txtTopOfCardReaderStatus" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد صفحه سوابق کاربران :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 122px"
                                                                class="TxtControls" id="txtTopOfEventLog" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد ماهانه :
                                                        </td>
                                                        <td>
                                                            <input type="text" disabled="true" runat="server" onchange="OnChangeVariable(this)"
                                                                style="width: 122px" class="TxtControls" id="txtMonthlyPageSize" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد گزارش کاردکس :
                                                        </td>
                                                        <td>
                                                            <input type="text" disabled="true" runat="server" onchange="OnChangeVariable(this)"
                                                                style="width: 122px" class="TxtControls" id="txtCardexPageSize" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد مانيتورينگ تردد پرسنل :
                                                        </td>
                                                        <td>
                                                            <input type="text" disabled="true" runat="server" onchange="OnChangeVariable(this)"
                                                                style="width: 122px" class="TxtControls" id="txtAttendancePageSize" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد سطرهاي گريد کارتابل :
                                                        </td>
                                                        <td>
                                                            <input type="text" disabled="true" runat="server" onchange="OnChangeVariable(this)"
                                                                style="width: 122px" class="TxtControls" id="txtCartablePageSize" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">نوع کارانه </legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            نوع :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbKaraneType" CssClass="TxtControls" Style="width: 122px"
                                                                runat="server" onchange="OnChangeVariable(this)">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             تعيين دوره پيش فرض  
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="cmbDefaultworkPeriod" CssClass="TxtControls" Style="width: 122px"
                                                                runat="server" onchange="OnChangeVariable(this)">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle"></legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            ايميل مسئول سرويس ارسال گزارش :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 122px"
                                                                class="TxtControls" id="txtBackUpMailAddress" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle"></legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            مسير ذخيره عکس هنگام تخليه :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 220px"
                                                                class="TxtControls" id="txtGetUrl" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات گزارشات</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td>
                                                            زمان گرفتن گزارشات توسط مدير سيستم
                                                        </td>
                                                        <td>
                                                            از ساعت :
                                                            <input type="text" id="Text1" style="width: 40px" class="TxtControls" runat="server"
                                                                onblur="Timechk(this),OnChangeVariable(this)" onkeydown="OnKeyDownTime(this)"
                                                                onfocus="OnFocuseObject(this)" />
                                                        </td>
                                                        <td>
                                                            تا ساعت :
                                                            <input type="text" id="Text2" style="width: 40px" class="TxtControls" runat="server"
                                                                onblur="Timechk(this),OnChangeVariable(this)" onkeydown="OnKeyDownTime(this)"
                                                                onfocus="OnFocuseObject(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>--%>
                                </table>
                            </td>
                            <td valign="top" align="right">
                                <table>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات رنگ کارتابل</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            <fieldset dir="rtl" style="width: 200px; border-top: #78BED6 thin solid; border-left: #78BED6 thin outset;
                                                                border-bottom: #78BED6 thin solid;">
                                                                <legend class="legendStyle">تنظيمات رنگ اسناد</legend>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    ساعتي :</label><input type="text" runat="server" disabled="true" id="txtHourlyDoc"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    روزانه :</label><input type="text" runat="server" disabled="true" id="txtDayDoc"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    تردد :</label><input type="text" runat="server" disabled="true" id="txtAttendanceDoc"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    آيتم ماهانه :</label><input type="text" runat="server" disabled="true" id="txtMonthlyDoc"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    آيتم روزانه :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtDailyDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    آيتم ماهانه تکرار شونده :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtRepeatMonthlyDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    مداومت کاري :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtDayCountinutionDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    عملکرد ماموريت :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtComissionDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    تغيير ساختار :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtReplaceDetailDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    جابجايي و جايگزيني :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtSchedulChangeDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    تايم شيت :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtTimeSheetDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    شيفتهاي نا منظم :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtShiftDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                            <div>
                                                                                <label style="width: 110px; text-align: right">
                                                                                    مجوز ورود بازرسي :
                                                                                </label>
                                                                                <input type="text" runat="server" disabled="true" id="txtRequestionDoc" class="colorwell"
                                                                                    value="#123456" dir="ltr" /></div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                        <td rowspan="2">
                                                            <div id="colorPickerDoc" align="right" style="display: none">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <fieldset dir="rtl" style="width: 200px; border-top: #78BED6 thin solid; border-left: #78BED6 thin outset;
                                                                border-bottom: #78BED6 thin solid;">
                                                                <legend class="legendStyle">تنظيمات رنگ ارجاع</legend>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    ارجاع به درخواست کننده :</label><input type="text" runat="server" disabled="true"
                                                                                        id="txtErjaToRequester" class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    ارجاع به مرحله ي قبل :</label><input type="text" runat="server" disabled="true" id="txtErjaStepBefor"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    ارجاع جهت اطلاع :</label><input type="text" runat="server" disabled="true" id="txtErjaForReport"
                                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                                            <div align="right">
                                                                                <label style="width: 110px; text-align: right">
                                                                                    ارجاع جهت اطلاع و تجديد نظر :</label><input type="text" runat="server" disabled="true"
                                                                                        id="txtErjaForReportAndEdit" class="colorwell" value="#123456" dir="ltr" /></div>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات آلارم</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            شماره پيام کوتاه :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtSmsNo" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            نام کاربري پيام کوتاه :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtSmsUserName" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            پسورد پيام کوتاه :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox runat="server" Width="122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                CssClass="TxtControls" ID="txtSmsPass" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            آدرس ميل سرور :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtSmtpServer" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            آدرس ميل سرور کسرا :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtKasraMail" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            دوره تکرار تايمر سرويس ايميل :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtMailServiceTimer" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle"></legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            طول روز :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 122px"
                                                                class="TxtControls" id="txtDayLength" onkeydown="OnKeyDownInt(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات گزارش ریز کدها</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td>
                                                            زمان گرفتن گزارشات توسط مدير سيستم
                                                        </td>
                                                        <td>
                                                            از ساعت :
                                                            <input type="text" id="txtDailyCodeReportSTime" style="width: 40px" class="TxtControls"
                                                                runat="server" onblur="Timechk(this),OnChangeVariable(this)" onkeydown="OnKeyDownTime(this)"
                                                                onfocus="OnFocuseObject(this)" />
                                                        </td>
                                                        <td>
                                                            تا ساعت :
                                                            <input type="text" id="txtDailyCodeReportETime" style="width: 40px" class="TxtControls"
                                                                runat="server" onblur="Timechk(this),OnChangeVariable(this)" onkeydown="OnKeyDownTime(this)"
                                                                onfocus="OnFocuseObject(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr style="visibility: hidden;">
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظيمات سيستم</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            شناسه سال مالي فعال :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" disabled="true"
                                                                style="width: 122px" class="TxtControls" id="txtActiveFinance" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد پرسنل مجاز سيستم :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" disabled="true"
                                                                style="width: 122px" class="TxtControls" id="txtPersonCount" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعداد كاربران مجاز سيستم :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" disabled="true"
                                                                style="width: 122px" class="TxtControls" id="txtUserCount" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView2" align="center" CssClass="PageContent" runat="server">
                <!-- Add content for page 2 here -->
                <div id="TADiv">
                    <table width="95%" align="center" dir="rtl" style="border: 2px inset #33CCFF; height: 90%">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle"></legend>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div style="display: none">
                                                            <input type="text" id="txtIsCheckScriptGroupDetail" name="txtIsCheckScriptGroupDetail"
                                                                runat="server" /></div>
                                                        <div align="center" id="TASetting" style="scrollbar-highlight-color: white; overflow: auto;
                                                            width: 100%; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 335px;">
                                                            <asp:PlaceHolder ID="TAGridViewPlaceHolder" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات کارت</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            کمترین گپ بین دو کارت :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtMissCardTime" onkeydown="OnKeyDownInt(this)" />دقیقه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تنظيمات مربوط به کارت کد :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtCardCodeSetting" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            شماره کارتخوانهاي ورود :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="false" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtInputCardReader" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            شماره کارتخوانهاي خروج :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="false" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtOutputCardReader" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات شماره ستون هاي روزانه</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            روز :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtDay" maxlength="2" onkeydown="OnKeyDownInt(this)" onchange="OnChaneDayColumns()"
                                                                runat="server" style="width: 30px" class="TxtControls" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            تردد :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtGoing" maxlength="2" onkeydown="OnKeyDownInt(this)" onchange="OnChaneDayColumns()"
                                                                runat="server" style="width: 30px" class="TxtControls" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            مازاد :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtMazad" maxlength="2" onkeydown="OnKeyDownInt(this)" onchange="OnChaneDayColumns()"
                                                                runat="server" style="width: 30px" class="TxtControls" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            کسر :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtKasr" maxlength="2" onkeydown="OnKeyDownInt(this)" onchange="OnChaneDayColumns()"
                                                                runat="server" style="width: 30px" class="TxtControls" />
                                                        </td>
                                                        <td style="text-align: right">
                                                            نوبت کاري :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtNobatKari" maxlength="2" onkeydown="OnKeyDownInt(this)"
                                                                onchange="OnChaneDayColumns()" runat="server" style="width: 30px" class="TxtControls" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">تنظیمات سلولهاي ورود شيفت </legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            طول سلولهاي ورود شيفت(px) :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtShiftCellsWidth" onkeydown="OnKeyDownInt(this)" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            فونت سلولهاي ورود شيفت(px) :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" style="width: 122px" disabled="true" onchange="OnChangeVariable(this)"
                                                                class="TxtControls" id="txtShiftCellsFont" onkeydown="OnKeyDownInt(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle" align="right">
                                                <legend class="legendStyle">
                                                    <input type="checkbox" runat="server" id="ChkArks" onchange="OnChangeArks(this)" />تخليه
                                                    آرکس</legend>
                                                <table align="right" valign="top">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            نام کاربری تخليه آرکس :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 122px"
                                                                class="TxtControls" id="txtArxUser" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            پسورد تخليه آرکس :
                                                        </td>
                                                        <td>
                                                            <asp:TextBox Width="122px" onchange="OnChangeVariable(this)" CssClass="TxtControls"
                                                                ID="txtArxPass" TextMode="Password" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr style="visibility: hidden">
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات کد</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            تعيين کدهاي ملزم به انتخاب جانشين :
                                                        </td>
                                                        <td>
                                                            <input type="button" runat="server" style="width: 25px; cursor: pointer; height: 22px;"
                                                                class="HeaderStyle" id="BtnSelectCode" value="..." onclick="OnClickBtnSelectCode()" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات رنگ صفحه کارکرد روزانه</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    ورود تردد :</label><input type="text" runat="server" disabled="true" id="txtInColor"
                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    خروج تردد :</label><input type="text" runat="server" disabled="true" id="txtOutColor"
                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    تردد کاربري :</label><input type="text" runat="server" disabled="true" id="txtManagerColor"
                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    تردد مدير سيستمي :</label><input type="text" runat="server" disabled="true" id="txtUserColor"
                                                                        class="colorwell" value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    تغيير ساختار :
                                                                </label>
                                                                <input type="text" runat="server" disabled="true" id="txtSchedulChange" class="colorwell"
                                                                    value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    جابجایی یک طرفه :
                                                                </label>
                                                                <input type="text" runat="server" disabled="true" id="txtShiftChange" class="colorwell"
                                                                    value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    جابجایی دو طرفه برای متقاضی :
                                                                </label>
                                                                <input type="text" runat="server" disabled="true" id="txtTwoShiftChangeSPerson" class="colorwell"
                                                                    value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    جابجایی دو طرفه برای جانشین :
                                                                </label>
                                                                <input type="text" runat="server" disabled="true" id="txtTwoShiftChangeFPerson" class="colorwell"
                                                                    value="#123456" dir="ltr" /></div>
                                                            <div align="right">
                                                                <label style="width: 110px">
                                                                    جايگزيني :
                                                                </label>
                                                                <input type="text" runat="server" disabled="true" id="txtShiftReplaceChange" class="colorwell"
                                                                    value="#123456" dir="ltr" /></div>
                                                        </td>
                                                        <td>
                                                            <div id="picker" align="right" style="display: none">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات محاسبه</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td style="text-align: right">
                                                            نوع نمايش ترددها بعد از تخليه بدون محاسبه کارکرد :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbOnlinePair" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 140px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            نوع محاسبه برای ثبت ترددها :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbAttendanceCalculate" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 140px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            کارکرد شبکاري متعلق به روز قبل يا روز بعد :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbNightWorking" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 140px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            گروههاي مشمول زوج کردن ترددها :
                                                        </td>
                                                        <td>
                                                            <input type="button" runat="server" class="SelectPerson" disabled="true" id="BtnSelectGroup"
                                                                onclick="OnClickBtnSelectGroup()" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات فيلتر کسر و مازاد </legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            فعال شدن فيلتر کسر و مازاد از صفحه روزانه :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbFilterDaily" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 122px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            فعال شدن فيلتر کسر و مازاد از صفحه ماهانه :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbFilterMonthly" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 122px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">ثبت مجوز مدير سيستمي و مدیریت ترددها</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            تعداد رکورد در حال نمايش :
                                                        </td>
                                                        <td>
                                                            <input type="text" class="TxtControls" id="txtTopSelect" runat="server" onchange="OnChangeVariable(this)"
                                                                onkeydown="OnKeyDownInt(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">شیفت مربوط به پرسنل متقاضی جابجایی و جایگزینی</legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            شیفت پرسنل :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="CmbStructure" CssClass="TxtControls" Style="width: 122px" runat="server"
                                                                onchange="OnChangeVariable(this)">
                                                            </asp:DropDownList>
                                                            <%--onchange="OnChangeVariable(this)"--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تنظيمات فيلتر صفحه برنامه زمانبندی </legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            انتخاب نوع فيلتر صفحه برنامه زمانبندی :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DDlFilterType" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                                Style="width: 122px" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset dir="rtl" class="fieldsetStyle">
                                                <legend class="legendStyle">تعداد مجوز برای ثبت در صفحه ثبت مجوز مدیرسیستمی </legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            تعداد مجوز :
                                                        </td>
                                                        <td>
                                                            <input type="text" runat="server" onchange="OnChangeVariable(this)" style="width: 90px"
                                                                class="TxtControls" id="txtInsertCreditCount" onkeydown="OnKeyDownInt(this)" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                <!-- Add content for page 3 here -->
                <div id="RestDiv">
                    <table width="95%" valign="top" align="center" dir="rtl" style="border: 2px inset #33CCFF;
                        height: 90%">
                        <tr>
                            <td align="center" valign="top" valign="middle">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="RstSetting" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 250px;">
                                            <asp:PlaceHolder ID="RstGridViewPlaceHolder" runat="Server" />
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
                                <fieldset dir="rtl" class="fieldsetStyle">
                                    <legend class="legendStyle">ساير تنظيمات</legend>
                                    <table align="right">
                                        <tr>
                                            <td>
                                                وعده غذایی :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="CmbFoodTerm" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                    Style="width: 122px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                تعداد نسخه ژتون :
                                            </td>
                                            <td>
                                                <input type="text" id="txtCopiesNumber" style="width: 70px" runat="server" class="TxtControls"
                                                    onkeypress="getNumKeyjeton()" onchange="OnChangeVariable(this)" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                چاپ ژتون/مانیتورینگ :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="CmbShowMonitor" CssClass="TxtControls" onchange="OnChangeVariable(this)"
                                                    Style="width: 122px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
                <!-- Add content for page 5 here -->
                <div id="GimDiv">
                    <table width="95%" valign="top" align="center" dir="rtl" style="border: 2px inset #33CCFF;
                        height: 90%">
                        <tr>
                            <td align="center" valign="top" valign="middle">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="GimSetting" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 250px;">
                                            <asp:PlaceHolder ID="GimGridViewPlaceHolder" runat="Server" />
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
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
                <!-- Add content for page 3 here -->
                <div id="DivSkin">
                    <table width="80%" valign="top" dir="rtl" style="border: 2px inset #33CCFF; height: 90%">
                        <tr>
                            <td valign="top">
                                <table style="width: 90%" dir="rtl">
                                    <tr>
                                        <td colspan="3">
                                            <div align="right">
                                                پوسته ي فعال سيستم :</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#0066FF">
                                            <input id="rdBlue" type="radio" name="G1" onclick="OnChangeVariable(this)" runat="server" />
                                            آبي
                                        </td>
                                        <td bgcolor="#33CC33">
                                            <input id="rdGreen" type="radio" name="G1" onclick="OnChangeVariable(this)" runat="server" />
                                            سبز
                                        </td>
                                        <td bgcolor="#9900FF">
                                            <input id="rdViolet" type="radio" name="G1" onclick="OnChangeVariable(this)" runat="server" />
                                            بنفش
                                        </td>
                                        <td bgcolor="#C7C7C7">
                                            <input id="rdSilver" type="radio" name="G1" onclick="OnChangeVariable(this)" runat="server" />
                                            نقره اي
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%">
                                <fieldset dir="rtl" class="fieldsetStyle" style="width: 100%">
                                    <legend class="legendStyle">فونت </legend>
                                    <fieldset dir="rtl" class="fieldsetStyle" style="width: 100%">
                                        <legend class="legendStyle">login </legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    فونت :<asp:DropDownList ID="CmbFontlogin" CssClass="TxtControls" Style="width: 150px;
                                                        direction: ltr" runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    سایز :<asp:DropDownList ID="CmbSizeLogin" CssClass="TxtControls" Style="width: 122px"
                                                        runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset dir="rtl" class="fieldsetStyle" style="width: 100%">
                                        <legend class="legendStyle">منو و میزکار </legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    فونت :<asp:DropDownList ID="CmbFonts" CssClass="TxtControls" Style="width: 150px;
                                                        direction: ltr" runat="server" onchange="OnChangeVariable(this)">
                                                        <%--onchange="onchangecmbStructure(this.id)"--%>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    سایز :<asp:DropDownList ID="CmbSize" CssClass="TxtControls" Style="width: 122px"
                                                        runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                                <%-- <td>
                                                    رنگ :<asp:DropDownList ID="CmbColor" CssClass="TxtControls" Style="width: 122px"
                                                        runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset dir="rtl" class="fieldsetStyle" style="width: 100%">
                                        <legend class="legendStyle">گرید </legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    فونت :<asp:DropDownList ID="CmbGridFont" CssClass="TxtControls" Style="width: 150px;
                                                        direction: ltr" runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    سایز :<asp:DropDownList ID="CmbGridSize" CssClass="TxtControls" Style="width: 122px"
                                                        runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset dir="rtl" class="fieldsetStyle" style="width: 100%">
                                        <legend class="legendStyle">کمبوها و کنترلهای متنی </legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    فونت :<asp:DropDownList ID="CmbtxtFont" CssClass="TxtControls" Style="width: 150px;
                                                        direction: ltr" runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    سایز :<asp:DropDownList ID="CmbtxtSize" CssClass="TxtControls" Style="width: 122px"
                                                        runat="server" onchange="OnChangeVariable(this)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <table>
                                        <tr>
                                            <td>
                                                <input type="checkbox" runat="server" id="ChkDefaultStyle" onclick='OnClickchkEPK(this)' /><%--onchange="OnChangeVariable(this)"--%>
                                                پیش فرض فرمت
                                            </td>
                                            <td>
                                                <input type="checkbox" runat="server" id="ChkKasraDefaultStyle" onclick='OnClickchkEPK(this)' />
                                                پیش فرض فرمت کسرا
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
        </ComponentArt:MultiPage>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtMemberID" name="txtMemberID" runat="server" />
        <input type="text" id="txtIsAdmin" name="txtIsAdmin" runat="server" />
        <input type="text" id="txtColor1" name="txtColor1" runat="server" />
        <input type="text" id="txtColor2" name="txtColor2" runat="server" />
        <input type="text" id="txtColor3" name="txtColor3" runat="server" />
        <input type="text" id="txtColor4" name="txtColor4" runat="server" />
        <input type="text" id="txtColor5" name="txtColor5" runat="server" />
        <input type="text" id="txtColor6" name="txtColor6" runat="server" />
        <input type="text" id="txtColor7" name="txtColor7" runat="server" />
        <input type="text" id="txtDoc1" name="txtDoc1" runat="server" />
        <input type="text" id="txtDoc2" name="txtDoc2" runat="server" />
        <input type="text" id="txtDoc3" name="txtDoc3" runat="server" />
        <input type="text" id="txtDoc4" name="txtDoc4" runat="server" />
        <input type="text" id="txtDoc5" name="txtDoc5" runat="server" />
        <input type="text" id="txtDoc6" name="txtDoc6" runat="server" />
        <input type="text" id="txtDoc7" name="txtDoc7" runat="server" />
        <input type="text" id="txtDoc8" name="txtDoc8" runat="server" />
        <input type="text" id="txtDoc9" name="txtDoc9" runat="server" />
        <input type="text" id="txtDoc10" name="txtDoc10" runat="server" />
        <input type="text" id="txtDoc11" name="txtDoc11" runat="server" />
        <input type="text" id="txtDoc13" name="txtDoc13" runat="server" />
        <input type="text" id="txtDoc15" name="txtDoc15" runat="server" />
        <input type="text" id="txtDoc16" name="txtDoc16" runat="server" />
        <input type="text" id="txtDoc17" name="txtDoc17" runat="server" />
        <input type="text" id="txtDoc18" name="txtDoc18" runat="server" />
        <input type="text" id="txtDoc19" name="txtDoc19" runat="server" />
        <input type="text" id="txtFonts" name="txtFonts" runat="server" />
        <input type="text" id="txtloginFont" name="txtloginFont" runat="server" />
        <input type="text" id="txtTxtFont" name="txtTxtFont" runat="server" />
        <input type="text" id="txtGridFont" name="txtGridFont" runat="server" />
        <input type="text" id="txtDefaultStyle" name="txtDefaultStyle" runat="server" />
        <input type="text" id="txtkasraDefaultStyle" name="txtkasraDefaultStyle" runat="server" />
        <input type="text" id="txtDailyCodeReportTime" name="txtDailyCodeReportTime" runat="server" />
        <input type="text" id="txtSelectedGroupFromParent" runat="server" />
    </div>
    <%-- image preload (not necessary but it improves page performance) --%>
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
    <script src="../../App_Utility/Scripts/Setting/jquery.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Setting/farbtastic.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/Setting/DefineSetting.js?v=1" type="text/javascript"></script>
</asp:Content>
