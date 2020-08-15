<%@ Page Title="---------------------------------------------------------------------برنامه زمانبندي ---------------------------------------------------------------------------------------------"
    Language="C#" EnableEventValidation="False" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="True" CodeBehind="SchedulingProg.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.SchedulingProg"
    ValidateRequest="False" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
    <%@ Register Src="../../App_Utility/MultiPerson/MultiPerson.ascx" TagName="MultiPerson"
    TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .imageClick
        {
            background-color: Red;
        }
        .StructClick
        {
            background-color: #D3D3E7;
        }
        .StructunClick
        {
            background-color: White;
        }
        .NameOFStruct
        {
            background-color: #83AFE5;
        }
        ul#IntvalUL
        {
            list-style: none;
            padding: 0;
        }
        /*---------------------------------------*/
        .FrozenHeader
        {
            position: relative;
            top: expression(document.getElementById("DivGrid").scrollTop);
            z-index: 10;
        }
        /*===================================*/
        #arrows
        {
            width: 100px;
            height: 16px;
            background-color: #DFEAF7;
            border: 1px ridge #000000;
            cursor: pointer;
            z-index: 10;
        }
        #arrows UL
        {
            padding-bottom: 0px;
            list-style-type: none;
            margin: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
        }
        #arrows UL LI
        {
            padding: 0px;
            margin: 0px;
            width: 73px;
            display: inline;
            height: 16px;
        }
        #arrows UL LI A
        {
            text-indent: -9000px;
            width: 73px;
            display: block;
            height: 16px;
            font-size: 50em;
            overflow: hidden;
            cursor: pointer;
            margin-right: 5px;
        }
        #arrows UL #arleft A
        {
            background: url(../../App_Utility/images/Icons/RightArrow.png) no-repeat;
        }
        #arrows UL #arright A
        {
            background: url(../../App_Utility/images/Icons/LeftArrow.png) no-repeat;
        }
        /*-------------------------------*/
        #DivIntval
        {
            width: 50px;
            height: 20px;
        }
        #TDIntval .SelectedCol
        {
            background-color: #8FC9A0; /*#88C142;*/ /*border-left:1px solid #F03D00;
        	border-right:1px solid #F03D00;*/
        }
        .SelectedCount
        {
            font-weight: bolder;
            border: 3px solid #990099;
            font-style: italic;
            font-family: tahoma;
        }
        .SelectedCol
        {
            background-color: #8FC9A0;
        }
        
        .EmptyTxt
        {
            font-weight: bold;
            font-size: 8pt;
            font-family: tahoma;
            background-color: orange;
            border-color: lightsteelblue;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" EnableViewState="true"
    runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager>
    <div id="PopupStruct" style="display: none; position: absolute; background-color: White;
        width: 200px">
        <table id="TBS_Header" width="100%" border="2" style="border-color: Black;">
            <tr id="TRTBS">
                <td class="CssHeaderStyle" style="width: 150px">
                    ساختار
                </td>
                <td class="CssHeaderStyle" style="width: 50px">
                    نام
                </td>
            </tr>
        </table>
        <div id="DivForStruct" align="center" style="scrollbar-highlight-color: white; overflow: auto;
            scrollbar-arrow-color: black; scrollbar-base-color: #D0B3C6; width: 100%; height: 300px;
            background-color: #D3D3E7">
            <table border="2" style="width: 100%" bgcolor="#e6e6ff" id="TBS" onkeydown="onkeydownTBS()"
                onclick="onclickTBS(this)">
            </table>
        </div>
    </div>
    <div id="DivPopupDays" style="display: none; position: absolute" dir="rtl">
        <div onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; width: 90px; height: 29px;
            cursor: hand; background-color: #ffffff; font-weight: bold; font-size: 9pt; font-family: 'tahoma Bold'"
            onmouseout="this.style.background='#ffffff';" onclick="onclickChangeShift(0)">
            تغيير ساختار</div>
        <div onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; width: 90px; height: 29px;
            cursor: hand; background-color: #ffffff; font-weight: bold; font-size: 9pt; font-family: 'tahoma Bold'"
            onmouseout="this.style.background='#ffffff';" onclick="onclickSowLog()">
            نمايش Log</div>
    </div>
    <div id="DivPopup" style="display: none; position: absolute" dir="rtl">
        <div id="DivDef" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; width: 80px; height: 29px;
            cursor: hand; background-color: #ffffff; font-weight: bold; font-size: 9pt; font-family: 'tahoma Bold'"
            onmouseout="this.style.background='#ffffff';" align="right" onclick="onclickImgDefult(0)">
            <div style="float: left">
                <img alt="" src="../../App_Utility/Images/Icons/Up1.gif" /></div>
            <div style="float: right">
                پيش فرض</div>
        </div>
        <div id="ِDivCopy" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; width: 80px; height: 29px;
            cursor: hand; background-color: #ffffff; font-weight: bold; font-size: 9pt; font-family: 'tahoma Bold'"
            onmouseout="this.style.background='#ffffff';" align="right" onclick="onclickImgCopy(0)">
            <div style="float: left">
                <img alt="" height="17" src="../../App_Utility/Images/Icons/copy01.gif" /></div>
            <div style="float: right">
                کپي
            </div>
        </div>
        <div id="DivPaste" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; border-bottom: dimgray 1px solid;
            width: 80px; height: 29px; cursor: hand; background-color: #ffffff; font-weight: bold;
            font-size: 9pt; font-family: 'tahoma Bold'" onmouseout="this.style.background='#ffffff';"
            align="right" onclick="onclickImgPaste(0)">
            <div style="float: left">
                <img alt="" src="../../App_Utility/Images/Icons/paste.gif" /></div>
            <div style="float: right">
                Paste</div>
        </div>
        <div id="DivDeleteText" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; border-bottom: dimgray 1px solid;
            width: 80px; height: 29px; cursor: hand; background-color: #ffffff; font-weight: bold;
            font-size: 9pt; font-family: 'tahoma Bold'" onmouseout="this.style.background='#ffffff';"
            align="right" onclick="onclickImgDelText(0)">
            <div style="float: left">
                <img alt="" src="../../App_Utility/Images/Icons/DelIcon.gif" /></div>
            <div style="float: right">
                پاک کردن</div>
        </div>
        <div id="ِDivNew" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; border-bottom: dimgray 1px solid;
            width: 80px; height: 29px; cursor: hand; background-color: #ffffff; font-weight: bold;
            font-size: 9pt; font-family: 'tahoma Bold'" onmouseout="this.style.background='#ffffff';"
            align="right" onclick="onclickImgNew(0)">
            <div style="float: left">
                <img alt="" src="../../App_Utility/Images/Icons/NewIcon.gif" /></div>
            <div style="float: right">
                ايجاد</div>
        </div>
        <div id="DivDeleteRow" onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; border-bottom: dimgray 1px solid;
            width: 80px; height: 29px; cursor: hand; background-color: #ffffff; font-weight: bold;
            font-size: 9pt; font-family: 'tahoma Bold'" onmouseout="this.style.background='#ffffff';"
            align="right" onclick="onclickDeleteRow(0)">
            <div style="float: left">
                <img alt="" src="../../App_Utility/Images/Icons/btnNodes.gif" /></div>
            <div style="float: right">
                حذف</div>
        </div>
    </div>
    <div id="DivDefault" style="border: thin solid Maroon; display: none; position: absolute;
        right: 30; top: 300; width: 250; height: 80; background-color: #E9E9F3;">
        <br style="font-size: 5" />
        <table style="width: 100%;">
            <tr>
                <td align="center" valign="middle">
                    دوره پيش فرض:
                </td>
                <td align="center" valign="middle">
                    <select id="CmbDefault" name="CmbDefault" style="width: 100px;" runat="server" class="TxtControls">
                        <option></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 5px">
                </td>
            </tr>
            <tr>
                <td align="center" valign="middle">
                    <input id="BtnOk" type="button" style="width: 60px; cursor: hand;" runat="server"
                        class="CssHeaderStyle" value="تاييد" onclick="onclickBtnOK()" />
                </td>
                <td align="center" valign="middle">
                    <input id="BtnCancel" type="button" style="width: 60px; cursor: hand;" runat="server"
                        class="CssHeaderStyle" value="انصراف" onclick="onclickBtnCancel()" />
                </td>
            </tr>
        </table>
    </div>
    <div id="DivStruct" style="border: thin solid #7575B3; display: none; position: absolute;
        right: 10; top: 130; width: 270; height: 340; background-color: #D3D3E7;">
        <div style="text-align: right;">
            &nbsp;<img alt="" id="BtnClose" style="cursor: hand;" src="../../App_Utility/Images/Icons/close1.png"
                onclick="onclickBtnClose()" />
        </div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <td class="CssHeaderStyle" style="width: 30%" align="center">
                        ساختار
                    </td>
                    <td class="CssHeaderStyle" style="width: 70%" align="center">
                        نام
                    </td>
                </tr>
            </thead>
        </table>
        <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
            scrollbar-base-color: #D0B3C6; height: 310; margin-right: 0px;" align="center">
            <table id="TBStruct" align="center" border="2" style="width: 99%; vertical-align: top;
                background-color: #FFFFFF;" onclick="OnclickGrdStruct()">
                <thead>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </thead>
            </table>
        </div>
    </div>   
    <table cellpadding="0" cellspacing="0" width="95%" style="vertical-align: top;">
        <tr align="right">
            <td id="TDMain" colspan="2" valign="top" style="border: 1px ridge #000000" align="right">
                <!----------------------------------------------------آيتم های جستجو------------------------------------->
                <div id="DivMain" style="border: 1px solid #000000; width: 930px; height: 30px; vertical-align: middle;
                    float: right; background-color: #E8F4E8;" onclick="onclickTB()">
                    <table>
                        <tr>
                            <td>
                                &nbsp;&nbsp; دوره:
                            </td>
                            <td>
                                <select id="CmbWorkPeriod" name="CmbWorkPeriod" style="width: 90px" onkeydown="OnKeyEnter(this)"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                ورژن :
                            </td>
                            <td>
                                <select id="CmbVersion" name="CmbVersion" style="width: 90px" runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                <asp:Label ID="lblMultiName" Text="" runat="server"></asp:Label>
                            </td>
                            <td>
                            <div id="DivDept" runat="server" style="display:none"> <uc3:MultiDepartment ID="UCDepartment" runat="server" /></div>
                             
                              <div id="DivPro" runat="server" style="display:none">  <uc4:MultiPerson ID="MultiPerson" runat="server" /></div>
                            </td>
                            <td>
                                <input id="ChkCheck" onkeydown="OnKeyEnter(this)" type="checkbox" runat="server" />کنترل
                                ساختار مرتبط
                            </td>
                            <td>
                                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" />
                            </td>
                            <td>
                                <img id="ImgProgresss" src="../../App_Utility/Images/ProgressImage/loading1.gif"
                                    style="display: none;" />
                            </td>
                            <td>
                                <div id="DivWFDoc" style="width: 20px">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-------------------------------------------------------قسمت گرید اصلی---------------------------------->
                <div id="DivGrid" style="width: 930px; height: 380px; vertical-align: top; overflow: auto;
                    overflow-x: hidden;" dir="rtl">
                    <table dir="rtl" id="XTableDataBase" cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="TDIntval" valign="top" style="width: 20px;">
                                <table id="TBLIntval" cellpadding="0" cellspacing="0" width="20px">
                                    <tr id="TRHIntval" style="width: 20px; display: none">
                                        <td id="TDHIntval" class="CssHeaderStyle" style="width: 20px; border-top-style: solid;
                                            border-right-style: solid; border-bottom-style: solid; border-top-width: 1px;
                                            border-right-width: 1px; border-bottom-width: 1px; border-top-color: #000000;
                                            border-right-color: #000000; border-bottom-color: #000000" align="center" valign="top">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="float: left; width: 20px;">
                                                <ul style="float: left;" id="IntvalUL">
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table id="XtableHName" cellpadding="0" cellspacing="0" style="border-top-style: solid;
                                    border-right-style: solid; border-bottom-style: solid; border-top-width: 1px;
                                    border-right-width: 1px; border-bottom-width: 1px; border-top-color: #000000;
                                    border-right-color: #000000; border-bottom-color: #000000">
                                </table>
                                <table id="XtableName" cellpadding="0" cellspacing="0">
                                </table>
                            </td>
                            <td id="TDDivData" valign="top">
                                <div id="DivGridData" style="overflow: auto; z-index: 10; width: 100%; overflow-y: hidden;
                                    overflow-x: hidden;">
                                    <table id="XTabTable" cellpadding="0" cellspacing="0" style="border-top-color: #000000;
                                        border-bottom-color: #000000; border-bottom-width: 1px; border-top-width: 1px;
                                        border-top-style: solid; border-bottom-style: solid">
                                    </table>
                                    <table id="XTableData" class="New" cellpadding="0" cellspacing="0">
                                    </table>
                                </div>
                            </td>
                            <td valign="top">
                                <table id="XtableHkarkard" cellpadding="0" cellspacing="0" style="border-top-style: solid;
                                    border-bottom-style: solid; border-left-style: solid; border-top-width: 1px;
                                    border-bottom-width: 1px; border-left-width: 1px; border-top-color: #000000;
                                    border-bottom-color: #000000; border-left-color: #000000">
                                </table>
                                <table id="XtableKarkard" cellpadding="0" cellspacing="0">
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-------------------------------------------------------اسکرول---------------------------------->
                <div id="arrows" style="width: 100%" align="center">
                    <img src='../../App_Utility/Images/Icons/Up1.gif' style="width: 25px; height: 16px;
                        float: right; cursor: hand; background-color: #EAE8C8; border-right-style: ridge;
                        border-right-width: 1px; border-right-color: #000000;" onclick="onclickUpIntval()" />
                    <input type='text' class="TxtControls" style="width: 35px; float: right; height: 16px;
                        text-align: center;" onfocus="onfocusIntval(this)" onblur="onblurIntval(this)"
                        onkeydown="OnKeyDownInt(this)" />
                    <img src='../../App_Utility/Images/Icons/Down1.gif' style="width: 25px; height: 16px;
                        background-color: #EAE8C8; cursor: hand; float: right; border-left-style: ridge;
                        border-left-width: 1px; border-left-color: #000000;" onclick="onclickDownIntval()" />
                    <img id="BtnCalcDetail" src="../../App_Utility/Images/Icons/btnReset.gif" style="width: 16px;
                        height: 16px; background-color: #EAE8C8; cursor: hand; float: right;" title="ريز اطلاعات محاسباتي" />                   
                    <ul>
                        <li id="arleft"><a>چپ</a></li>
                        <li id="arright"><a>راست</a> </li>
                    </ul>
                </div>
                <!----------------------------------------------------------قسمت گرید محاسبات------------------------------->
                <div id="DivCount" style="width: 930px; height: 100px; vertical-align: top; overflow: auto;
                    overflow-x: hidden;" dir="rtl">
                    <table dir="rtl" id="TBLCount">
                        <tr>
                            <td valign="top">
                                <table id="XtableStructName" cellpadding="0" cellspacing="1">
                                </table>
                            </td>
                            <td id="TD1" valign="top">
                                <div id="DivBaseCount" style="overflow: auto; z-index: 10; width: 100%; overflow-y: hidden;
                                    overflow-x: hidden;">
                                    <table id="XTableCount" cellpadding="0" cellspacing="1">
                                    </table>
                                </div>
                            </td>
                            <td valign="top">
                                <table id="Table3" cellpadding="0" cellspacing="1">
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!---------------------------------------------------------------------------------------------->
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSendTOPdf" runat="server" Text="BtnSubmit" OnClick="BtnSendTOPdf_Click" />
        <asp:Button ID="BtnSendTOExl" runat="server" Text="BtnSubmit" OnClick="BtnSendTOExl_Click" />
        <asp:Button ID="BtnGetDefXml" runat="server" Text="BtnGetDefXml" OnClick="BtnSelectPRS_Click" />
        <input type="text" id="TemptxtWP" name="TemptxtWP" runat="server" />
        <input type="text" id="txtIntvals" name="txtIntvals" runat="server" />
        <input type="text" id="txtPCodeTemp" name="txtPCodeTemp" runat="server" />
        <input type="text" id="txtIDTemp" name="txtGroupTemp" runat="server" />
        <input type="text" id="txtDefWp" name="txtDefWp" runat="server" />
        <input type="text" id="WPIDtxt" name="WPIDtxt" runat="server" />
        <input type="text" id="txtForSave" name="txtForSave" runat="server" />
        <input type="text" id="txtTabData" name="txtTabData" runat="server" />
        <input type="text" id="txtDefPID" name="txtDefPID" runat="server" />
        <input type="text" id="txtChk" name="txtChk" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtShowHourlyTime" name="txtShowHourlyTime" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtPersonels" name="txtPersonels" runat="server" />
        <input type="text" id="txtVersions" name="txtVersions" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtXmlInfo" name="txtXmlInfo" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtShowCombinStruct" name="txtShowCombinStruct" runat="server" />
        <input type="text" id="txtTableName" name="txtTableName" runat="server" />
        <input type="text" id="txtMName" name="txtMName" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
            <input type="text" id="txtMultiPerson" name="txtMultiPerson" runat="server" />
              <input type="text" id="txtTypeCombo" name="txtTypeCombo" runat="server" />
        <div id="DivReportSex">
        </div>
        <div id="DivReportJob">
        </div>
        <div id="DivReportContract">
        </div>
        <div id="DivHeader">
        </div>
        <asp:HiddenField ID="txtPersonDelete" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" id="txtDefXml" name="txtDefXml" runat="server" />
                <asp:HiddenField ID="txtAlertDelete" runat="server" />
                <asp:HiddenField ID="txtValidateDelete" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnGetDefXml" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: none">
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <asp:HiddenField ID="txtAlert" runat="server" />
                    <asp:HiddenField ID="txtValidate" runat="server" />
                    <input type="text" id="txtInsertPerson" name="txtInsertPerson" runat="server" />
                    <input type="text" id="txtInstanceID" name="txtInstanceID" runat="server" />
                    <input type="text" id="txtStatus" name="txtStatus" runat="server" />
                    <input type="text" id="txtInvalidSave" name="txtInvalidSave" runat="server" />
                    <input type="text" id="txtStatusBase" name="txtStatusBase" runat="server" />
                    <input type="text" id="txtWFDocID" name="txtWFDocID" runat="server" />
                     <input type="text" id="txtNewWF" name="txtNewWF"  runat="server"/>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                <asp:PostBackTrigger ControlID="BtnSendTOPdf" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtDelXml" name="txtDelXml" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtCheckEmpty" name="txtCheckEmpty" runat="server" />
        <input type="text" id="txtStrTab" name="txtStrTab" />
        <input type="text" id="txtCellsWidth" name="txtCellsWidth"  runat="server"/>
        <input type="text" id="txtCellsFont" name="txtCellsFont"  runat="server"/>
       
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-ui-1.8.custom.min.js"></script>
    <script src="../../App_Utility/Scripts/DataEntry/SchedulingProg.js?v=1.3" type="text/javascript"></script>
</asp:Content>
